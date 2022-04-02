Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26120C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Apr 2022 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jYeI1JDTSb2mUuafIUwkDkySGNvjikWRJvfH4OuW/g=; b=LeYIuLKCinmSl3
	/e5ZtHRNKQqby383B+UqNTnOURTV4Pwmf6brIDYuPifJnEt4lprgQSjodAlgZPPSt77sEDXBz1hfC
	hKHXzTg/4pBU3a2CwDMsH4CQ4P9JfC4CQ4OhWkPfkqsGEcQe1VXWVr85IBdwIMN0YoSM1L3hD0RL2
	QOOQ/ED9cBhkk6uouClSDraf2En9jW9+Xec+8jjFduwhyH7YHOPDiUMpKH+IfiC0d0nGCH6R40Sjj
	OLdASBs6Vs5hcma3oVYL74vFsnwgno7Bo1OvJFAGYxPnex90+tZjfoc+itb52IDVd2mNUS1Qnp2wK
	VBnaUzxaVMV6CPIwKFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naeT6-009AY5-Uf; Sat, 02 Apr 2022 14:11:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naeCi-0092X6-UH; Sat, 02 Apr 2022 13:54:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 568BBCE0969;
 Sat,  2 Apr 2022 13:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4E1C340EE;
 Sat,  2 Apr 2022 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648907643;
 bh=mPzTkgatSK8CCYcJZRjjnRIhaMHdvygHIPXND8TxesM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aqyg1+SuT47jW0l0Z95gDGTCWRx0sbbee6U5vQdylwsfXlX0GVU7N7EANgaKwWAzk
 PhQu7eBbPpwFQxnsa0h1PWbUrGbIZ9fHVcD6zSC40lS0IS6YhYEgAwc+fRShN4wPIE
 5SmkcKUvT1m7959oBzosRRky8DCiitQ7pIIlWMx63//7Lk+vzIBiMB7OAxeXFc/3Ce
 0VkxcGF+lRuIE7BWMnx8LDMzAcc3mDfO/ztazSidmPOWD2v4F6Yn3i5YB5w2kB81bq
 7mJsZvnVUD5LqDuAexqkWJZq1mKvi9Wg+iHDI0G8MOGOSKxm3V7zYART6SG2yhMLlj
 5rbrosHcu4URQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, heiko@sntech.de, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V11 10/20] riscv: compat: Support TASK_SIZE for compat mode
Date: Sat,  2 Apr 2022 21:52:46 +0800
Message-Id: <20220402135256.2691868-11-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220402135256.2691868-1-guoren@kernel.org>
References: <20220402135256.2691868-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_065414_371082_1949A261 
X-CRM114-Status: GOOD (  10.64  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgoKTWFrZSBUQVNLX1NJWkUg
ZnJvbSBjb25zdCB0byBkeW5hbWljIGRldGVjdCBUSUZfMzJCSVQgZmxhZwpmdW5jdGlvbi4gUmVm
ZXIgdG8gYXJtNjQgdG8gaW1wbGVtZW50IERFRkFVTFRfTUFQX1dJTkRPV182NCBmb3IKZWZpLXN0
dWIuCgpMaW1pdCAzMi1iaXQgY29tcGF0aWJsZSBwcm9jZXNzIGluIDAtMkdCIHZpcnR1YWwgYWRk
cmVzcyByYW5nZQood2hpY2ggaXMgZW5vdWdoIGZvciByZWFsIHNjZW5hcmlvcyksIGJlY2F1c2Ug
aXQgY291bGQgYXZvaWQKYWRkcmVzcyBzaWduIGV4dGVuZCBwcm9ibGVtIHdoZW4gMzItYml0IGVu
dGVyIDY0LWJpdCBhbmQgZWFzZQpzb2Z0d2FyZSBkZXNpZ24uCgpUaGUgc3RhbmRhcmQgMzItYml0
IFRBU0tfU0laRSBpcyAweDlkYzAwMDAwOkZJWEFERFJfU1RBUlQsIGFuZApjb21wYXJlZCB0byBh
IGNvbXBhdGlibGUgMzItYml0LCBpdCBpbmNyZWFzZXMgNDc2TUIgZm9yIHRoZQphcHBsaWNhdGlv
bidzIHZpcnR1YWwgYWRkcmVzcy4KClNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51
eC5hbGliYWJhLmNvbT4KU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+
ClJldmlld2VkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpUZXN0ZWQtYnk6IEhl
aWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmggICB8IDEzICsrKysrKysrKysrLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cHJvY2Vzc29yLmggfCAgNiArKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCmluZGV4IGUzNTQ5ZTUw
ZGU5NS4uYWZkYzllY2UyYmE0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaApAQCAtNzA1LDgg
KzcwNSwxNyBAQCBzdGF0aWMgaW5saW5lIHBtZF90IHBtZHBfZXN0YWJsaXNoKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLAogICogNjPigJM0OCBhbGwgZXF1YWwgdG8gYml0IDQ3LCBvciBlbHNl
IGEgcGFnZS1mYXVsdCBleGNlcHRpb24gd2lsbCBvY2N1ci4iCiAgKi8KICNpZmRlZiBDT05GSUdf
NjRCSVQKLSNkZWZpbmUgVEFTS19TSVpFICAgICAgKFBHRElSX1NJWkUgKiBQVFJTX1BFUl9QR0Qg
LyAyKQotI2RlZmluZSBUQVNLX1NJWkVfTUlOICAoUEdESVJfU0laRV9MMyAqIFBUUlNfUEVSX1BH
RCAvIDIpCisjZGVmaW5lIFRBU0tfU0laRV82NAkoUEdESVJfU0laRSAqIFBUUlNfUEVSX1BHRCAv
IDIpCisjZGVmaW5lIFRBU0tfU0laRV9NSU4JKFBHRElSX1NJWkVfTDMgKiBQVFJTX1BFUl9QR0Qg
LyAyKQorCisjaWZkZWYgQ09ORklHX0NPTVBBVAorI2RlZmluZSBUQVNLX1NJWkVfMzIJKF9BQygw
eDgwMDAwMDAwLCBVTCkgLSBQQUdFX1NJWkUpCisjZGVmaW5lIFRBU0tfU0laRQkodGVzdF90aHJl
YWRfZmxhZyhUSUZfMzJCSVQpID8gXAorCQkJIFRBU0tfU0laRV8zMiA6IFRBU0tfU0laRV82NCkK
KyNlbHNlCisjZGVmaW5lIFRBU0tfU0laRQlUQVNLX1NJWkVfNjQKKyNlbmRpZgorCiAjZWxzZQog
I2RlZmluZSBUQVNLX1NJWkUJRklYQUREUl9TVEFSVAogI2RlZmluZSBUQVNLX1NJWkVfTUlOCVRB
U0tfU0laRQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKaW5kZXggMDc0OTkyNGQ5ZTU1Li4y
MWM4MDcyZGNlMTcgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29y
LmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaApAQCAtMTksNyArMTks
MTEgQEAKICNkZWZpbmUgVEFTS19VTk1BUFBFRF9CQVNFCVBBR0VfQUxJR04oVEFTS19TSVpFIC8g
MykKIAogI2RlZmluZSBTVEFDS19UT1AJCVRBU0tfU0laRQotI2RlZmluZSBTVEFDS19UT1BfTUFY
CQlTVEFDS19UT1AKKyNpZmRlZiBDT05GSUdfNjRCSVQKKyNkZWZpbmUgU1RBQ0tfVE9QX01BWAkJ
VEFTS19TSVpFXzY0CisjZWxzZQorI2RlZmluZSBTVEFDS19UT1BfTUFYCQlUQVNLX1NJWkUKKyNl
bmRpZgogI2RlZmluZSBTVEFDS19BTElHTgkJMTYKIAogI2lmbmRlZiBfX0FTU0VNQkxZX18KLS0g
CjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
