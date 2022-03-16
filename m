Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536D6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 07:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AOmBcrko2RrBXg1bdnVqbpPyxbg2wvhkajt3qrxagQ=; b=JHD2zeEqPUGDEj
	EJH581rm8VYHvQhjdDWIL9W7ZEwGTbK5BxmlzJPp6fOvbkRIdZ19H9xLAkNkytXKJVgphTCotECD5
	6a33E1uecNQE7lXlzObovQ+Uqnsz9xBlO3F0uydBrH7mnoFKBH3MtOjOHpgNNTz78rDMdf6J9uWkd
	vM4aQkmhryvgbc6/OGCTuwBB6rQGwF7tZSLLxutK3a/wzOZVG3mpmvslBeUUGdYnlP0D1PbLeukxM
	xilDK3ey49ICo0b0Toz/A81wcpGtPYzB2KYLkK1GAfDUZSuJG5Avoe7MyomZik/rVRGatUVtybtkX
	TeO2NsMSYvZIF7WuAZTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUNnp-00Bp3g-UJ; Wed, 16 Mar 2022 07:10:38 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUNi0-00Blb7-MZ; Wed, 16 Mar 2022 07:04:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 44D50B81A1F;
 Wed, 16 Mar 2022 07:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B14C340F4;
 Wed, 16 Mar 2022 07:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647414274;
 bh=bFt7di4PvlxVjrJZVDyoXBaKxGZBq5akn6kE87u+9zs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u17zWj7RNqur9jWK+tOZxBvHE3jVgUCMQanxMcq2dyUg7Ky1HEvZEghPoZSo70jLi
 91MgwyD5cbF70/LHbFQ8Ue6XOx9QCzThI3YchpOu7jZSO/eVARvHzcR4ersN2rFfeP
 N41YsNvg8mkMWuPHsAY2XtSOBObX8Ay95whVQOxDW7ZTyKQzlRKpzGmThACKqk2o/0
 1vq3jQxb2xtPMs4fBpyIZJTraemldu1u1MKR6yvasZQFHxGNW/yM3nZAx05uaQ379j
 i12OXvYkjTVAqyqXL5E646J/kKX3GsXWeizq/BE8IM0XRAXagLNeNLAcTBBl3ZvgfV
 AAl1BFvdbciFQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, heiko@sntech.de, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V8 10/20] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
Date: Wed, 16 Mar 2022 15:03:07 +0800
Message-Id: <20220316070317.1864279-11-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316070317.1864279-1-guoren@kernel.org>
References: <20220316070317.1864279-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_000436_943442_EF7A9A4E 
X-CRM114-Status: GOOD (  10.97  )
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
bS9wZ3RhYmxlLmggfCAxMyArKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCmluZGV4IGUz
NTQ5ZTUwZGU5NS4uYWZkYzllY2UyYmE0IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaApAQCAt
NzA1LDggKzcwNSwxNyBAQCBzdGF0aWMgaW5saW5lIHBtZF90IHBtZHBfZXN0YWJsaXNoKHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogICogNjPigJM0OCBhbGwgZXF1YWwgdG8gYml0IDQ3LCBv
ciBlbHNlIGEgcGFnZS1mYXVsdCBleGNlcHRpb24gd2lsbCBvY2N1ci4iCiAgKi8KICNpZmRlZiBD
T05GSUdfNjRCSVQKLSNkZWZpbmUgVEFTS19TSVpFICAgICAgKFBHRElSX1NJWkUgKiBQVFJTX1BF
Ul9QR0QgLyAyKQotI2RlZmluZSBUQVNLX1NJWkVfTUlOICAoUEdESVJfU0laRV9MMyAqIFBUUlNf
UEVSX1BHRCAvIDIpCisjZGVmaW5lIFRBU0tfU0laRV82NAkoUEdESVJfU0laRSAqIFBUUlNfUEVS
X1BHRCAvIDIpCisjZGVmaW5lIFRBU0tfU0laRV9NSU4JKFBHRElSX1NJWkVfTDMgKiBQVFJTX1BF
Ul9QR0QgLyAyKQorCisjaWZkZWYgQ09ORklHX0NPTVBBVAorI2RlZmluZSBUQVNLX1NJWkVfMzIJ
KF9BQygweDgwMDAwMDAwLCBVTCkgLSBQQUdFX1NJWkUpCisjZGVmaW5lIFRBU0tfU0laRQkodGVz
dF90aHJlYWRfZmxhZyhUSUZfMzJCSVQpID8gXAorCQkJIFRBU0tfU0laRV8zMiA6IFRBU0tfU0la
RV82NCkKKyNlbHNlCisjZGVmaW5lIFRBU0tfU0laRQlUQVNLX1NJWkVfNjQKKyNlbmRpZgorCiAj
ZWxzZQogI2RlZmluZSBUQVNLX1NJWkUJRklYQUREUl9TVEFSVAogI2RlZmluZSBUQVNLX1NJWkVf
TUlOCVRBU0tfU0laRQotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
