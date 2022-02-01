Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA916C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ds2tK5vDhhcNcF7ohyYMpmmhlk3rFqOTUobfpmqTsqw=; b=0hUDJJO9mCts/O
	dlY053Ese3rAymXl1QoVRgrGcdqmTjjTH0EpYirQ9TWE86P2l+qcDsfbShCvOmZYFFpO29MgHqd1R
	nf8QkjqeMlJv5dTpP59etQXBoWu/J+SeYGESmbaso8u6EScqQ0b1pEomqj3eX4oVEH2/mJ2hP0Xzr
	fR3p5qrm7euvh9r+FfrDVNOf5tlxpADu//K9XizAUasJVp24wA2Mlg3JYX6bs0lfZPkek8ZpTezmA
	QJKjQrw8BlsiXWQZ0DYb7gMLCFX4iErhakvZUXvF/4Gc0it8ms36l4GOR8rNoy4zBeh/A818asPPP
	o8k8vCqP4vL3BRgoAcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEuqT-00CZZj-7D; Tue, 01 Feb 2022 15:13:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEukJ-00CW4V-RG; Tue, 01 Feb 2022 15:07:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6663761681;
 Tue,  1 Feb 2022 15:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370ECC340EF;
 Tue,  1 Feb 2022 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643728023;
 bh=a1sC80QEMsJ1SgwAfWEJYAxYwB7cBGeGznoe8NpsNfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R/OC8wFvI3f02Iycn2k2srEKbrGNKSg2nuFurmauT/lCNJf7lYC8hE/FTUE0PPSyI
 IT89j4G7Lo2vKWpygW0h8HE3osNKssXR5I/ALlmGKFXNreY9GTWDDVD34neYRRHw3/
 e2EcBXiNbcT/bNtn70v+YxIdTplb5AB17tca1ct869D2iF4J53MYVp4AAeWLA8Yzqu
 Iv/GOSGWYxB1EEL0iOdxre9NKG62AtNDD64hEXQxe8gijJCmxxpijsqffSJyFBzg3P
 BdLygsTeaTIWE59+Ank+TlmjedYUCX0rbr6pMIOFN9OaIt0yBqECO75YAaKnIaf4Jl
 jvK5Z8q2gbKbA==
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
Subject: [PATCH V5 10/21] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
Date: Tue,  1 Feb 2022 23:05:34 +0800
Message-Id: <20220201150545.1512822-11-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201150545.1512822-1-guoren@kernel.org>
References: <20220201150545.1512822-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_070703_950592_A2BBD4C8 
X-CRM114-Status: GOOD (  11.14  )
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
