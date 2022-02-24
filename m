Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114DDC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 09:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ds2tK5vDhhcNcF7ohyYMpmmhlk3rFqOTUobfpmqTsqw=; b=jeGa0GLxkMIe+2
	weq5ynXWRr2RmDDp5Gc5oKX2S5wYDhz/8eeSC2tl35srESG36X2pg5b+rfPlnfr4R7ThHHw1FsF3p
	ovwEmJDzzHf/cjVdtWfZqepCtWaPd44Qqak3KP/l5UtG+hiTBLpMUmmVOjTk7V7JNsXWOOT3d0+Aw
	Gz4DTNglyqRnjEqH/FM9JwCofbLZjOZeiqMXRuXXBesljrH8a6lU/yE2Svx5gNoaRIfpWx7LNbSjo
	Ptlm8jVWqOBVTLh+Oj8u95M53X+f8/xHk8ohiZnh3lYoRDCEJaCMFixS5qqvgqS7nyc8cSJ9n1YeD
	t75FYKeBZtF0Ku/eV5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNA0b-00HSNd-5z; Thu, 24 Feb 2022 09:01:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN9uz-00HOjX-M6; Thu, 24 Feb 2022 08:56:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E0A9AB82497;
 Thu, 24 Feb 2022 08:56:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A18C340EB;
 Thu, 24 Feb 2022 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645692966;
 bh=a1sC80QEMsJ1SgwAfWEJYAxYwB7cBGeGznoe8NpsNfM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NpS8IbTxPPAt4S03C9fF9JBTCncwR1OU1YbsGIVcwFRfu3CFb0E++WuIYfsqKk+hj
 H7YRu4FxifAv0w1LbWv32kJbqzHdbp5hyDhhd2xtXVEL3+uY74mxNRhJkjPQgkgFWI
 RFTSncouIW5jBpQtW4xEVC4P2CS2LBRscnCcqRAD8D2yVSeZWHy9DK8/IDeWLg1xZD
 zu/do4A3OFE/w29A8S6YgQVMnu1Tru7MBXFIU3cgibKE5VarQBAqWzrMmwl4Cpxw7U
 OZe6xg8KOQp84zv2c3m+8S2qjhkrjs87gobwhadSj0Hn51/dOTU8GEkLyRARCa+HBu
 7lmP+lN4XfJFw==
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
Subject: [PATCH V6 10/20] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
Date: Thu, 24 Feb 2022 16:54:00 +0800
Message-Id: <20220224085410.399351-11-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224085410.399351-1-guoren@kernel.org>
References: <20220224085410.399351-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_005609_971027_CD494945 
X-CRM114-Status: GOOD (  10.62  )
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
