Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96308C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Feb 2022 16:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ds2tK5vDhhcNcF7ohyYMpmmhlk3rFqOTUobfpmqTsqw=; b=iCk6ZCcT56LFdp
	LhmVTdGC9kci/e/vs5oR4JwBtnzWiG9nWShGfd4pNbaUJ8Ya9hMv1jLwxzumU3+tylu0dDZXtu60m
	MlsCa5W5T35ZXlHVlr5QkpdXo2jxPGtunuvpa19spR9yPtFurMGHhsFZbQZNG9XYITKF/cjIy7qpF
	YoIwmXKIQ73/t0nZ2qzi4MkWGCLCoqR8+KSG7xuQNNZGDNByibmR4YA3RuC3PECV1FWVJbsukhFgA
	RaMGWa+1usAmRCU1szmgan0+337XzGwrcjYzz53stITmiRmx1Sz+5Kyp+DsRcCB0JIm9ebj86jYvB
	U3VKFG+5dYkoHUM6vQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOMVU-009idv-8A; Sun, 27 Feb 2022 16:34:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOMQk-009fyo-9h; Sun, 27 Feb 2022 16:29:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CCAC460F7A;
 Sun, 27 Feb 2022 16:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF76C340F4;
 Sun, 27 Feb 2022 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645979393;
 bh=a1sC80QEMsJ1SgwAfWEJYAxYwB7cBGeGznoe8NpsNfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=krAfy4GeSsPrHE0uGcwhUOCwTtgl45EIv3Cblk5hDNBiIgpEr917oCZ02DZux+kBO
 9DvG5UKX/NZYQaBI9+wHWZrjKnPj6L9Oz3qFTloavUC5Lebxljn+i6gHa2BeNfPsf1
 VKgacZktyICzpyZRjqr1sufK1CdUhfpxDQPpTR9c6lpN1CPjvUi7h/gJ+35Hc3H6HA
 yWkxXQqo9CvJ8tIhEvVrsk2w92qLni+wJfdxEPye8qbguIHDSsyxxpR7mTc285iRtn
 5LHVn6KW5D7SkRoA53UcqcKzeDB0OluqYaBEd88NyakS5S0+cpWlmAlm/6L6KFQz8D
 AuQaV1jkb3bQw==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, hch@lst.de
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V7 10/20] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
Date: Mon, 28 Feb 2022 00:28:21 +0800
Message-Id: <20220227162831.674483-11-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227162831.674483-1-guoren@kernel.org>
References: <20220227162831.674483-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_082954_512182_02CE73A6 
X-CRM114-Status: GOOD (  10.41  )
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
