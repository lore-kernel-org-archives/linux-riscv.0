Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD72C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 12:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ds2tK5vDhhcNcF7ohyYMpmmhlk3rFqOTUobfpmqTsqw=; b=xug5eNAuATvOFD
	R/B4mqfDWBWvHp2hHPA4H3kZcwWK6pucn5EHr9AvPOlv6NC0dOD4IkzVbnzBkZ8dXGQIuTd6p9xEN
	UuxTpi0U46bTBt3yKDf/nJoH4Ak69O6pdqTXAAzg5M3fl2HWDxJx3RvW26Mecr4biRhynL50cgTVk
	W5gge5FTgjawDP45+RswucKxbeQsj4Dp103YhcccERhdUREyWl9nb0l433dxuK0mPpLV8JeOzY5PT
	awTyQMYXU9BL5WaVgSxdvdTVFAFFvHKLfrDXyasu7OC1Xv3ULAYLrG32iiOwjEFiUZZ3hEdVo5seO
	nbc/sUz80agoF6NU91Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDmkP-004eJK-1h; Sat, 29 Jan 2022 12:22:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDmgc-004c7Q-JE; Sat, 29 Jan 2022 12:18:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2EF4CB827B7;
 Sat, 29 Jan 2022 12:18:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F153EC340E8;
 Sat, 29 Jan 2022 12:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643458711;
 bh=a1sC80QEMsJ1SgwAfWEJYAxYwB7cBGeGznoe8NpsNfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NWYm1G0mH+VnzdIeOy4+kveE42zhVODVeZGjghOSNXZHcsN+jtZDpLBb8TgfqMHZF
 7BwEjWhkkEV9tbi3e9N4CLvGuqleSvY9loLAgUO0KcZdxWlTXGBbZCvrLAr+tdgeG4
 ju+kJ49Uy0y7rg+N8wFqEesqZ6io0Lz2iaHOhlsGYk6x7HtvONJyc0g5G0W/PthI/v
 80k/AKQtYXUVnfXFzvHpqzY3/8BvGwOy4ZGRXQTOaK2FO30Sqg+ZHqhkKkHbGUMTeF
 deVLcGC142vbsthS2fAP3NYwoF96raWYV2fyUnls4Uxc+lscOuk1ZdSsGQUQ+Gzn41
 TrYaNs1aJgrSw==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de,
 hch@infradead.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
Date: Sat, 29 Jan 2022 20:17:18 +0800
Message-Id: <20220129121728.1079364-8-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220129121728.1079364-1-guoren@kernel.org>
References: <20220129121728.1079364-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_041834_805693_35522E4A 
X-CRM114-Status: GOOD (  10.60  )
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
ClJldmlld2VkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgotLS0KIGFyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIHwgMTMgKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaAppbmRleCA3ZTk0OWYyNWM5MzMuLmYwZDEyNWVhM2NlYiAxMDA2NDQKLS0tIGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgKQEAgLTcwNCw4ICs3MDQsMTcgQEAgc3RhdGljIGlubGluZSBwbWRfdCBwbWRwX2Vz
dGFibGlzaChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKICAqIDYz4oCTNDggYWxsIGVxdWFs
IHRvIGJpdCA0Nywgb3IgZWxzZSBhIHBhZ2UtZmF1bHQgZXhjZXB0aW9uIHdpbGwgb2NjdXIuIgog
ICovCiAjaWZkZWYgQ09ORklHXzY0QklUCi0jZGVmaW5lIFRBU0tfU0laRSAgICAgIChQR0RJUl9T
SVpFICogUFRSU19QRVJfUEdEIC8gMikKLSNkZWZpbmUgVEFTS19TSVpFX01JTiAgKFBHRElSX1NJ
WkVfTDMgKiBQVFJTX1BFUl9QR0QgLyAyKQorI2RlZmluZSBUQVNLX1NJWkVfNjQJKFBHRElSX1NJ
WkUgKiBQVFJTX1BFUl9QR0QgLyAyKQorI2RlZmluZSBUQVNLX1NJWkVfTUlOCShQR0RJUl9TSVpF
X0wzICogUFRSU19QRVJfUEdEIC8gMikKKworI2lmZGVmIENPTkZJR19DT01QQVQKKyNkZWZpbmUg
VEFTS19TSVpFXzMyCShfQUMoMHg4MDAwMDAwMCwgVUwpIC0gUEFHRV9TSVpFKQorI2RlZmluZSBU
QVNLX1NJWkUJKHRlc3RfdGhyZWFkX2ZsYWcoVElGXzMyQklUKSA/IFwKKwkJCSBUQVNLX1NJWkVf
MzIgOiBUQVNLX1NJWkVfNjQpCisjZWxzZQorI2RlZmluZSBUQVNLX1NJWkUJVEFTS19TSVpFXzY0
CisjZW5kaWYKKwogI2Vsc2UKICNkZWZpbmUgVEFTS19TSVpFCUZJWEFERFJfU1RBUlQKICNkZWZp
bmUgVEFTS19TSVpFX01JTglUQVNLX1NJWkUKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
