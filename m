Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB17FC61DD8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 06:38:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A8A520A8B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 06:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uixTTR/Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A8A520A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wTFpkCCBfEOtOpeLki8TNENLFOtYfDs1UTiP4qYbNjI=; b=uixTTR/Q1t3KwNjrySBvOeSpG
	PAbM6oHxHiXJpfRlOyHUBIelUZJJ4xHHAzHRdA1XYc5eITDJ5kMrko9YAm/4EWtljGEedkxV+Qwi1
	B3tOGCPaiRa9czcwwhhXUQoNl1oPTpClN1+0E4LwKo4vyxbvw6U/v3PyjieImkU5sFhAJ6NcsPHxU
	GTtUf9qvDmlsG9bYK6rhH0v28aZ2+xqGXolI81P1QVxg0wanmliz1aMluYF1SeiofPBNtlsxTUrTx
	ofNp68LiOWJiNRs9cCLRoUfXtmJ1Xkc/bOP2p7cEZ7MA3U7rMTGPor7SrPSHn5pnajV1EB2FEsFcv
	Z4hIj9v2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdSiq-0000lh-2g; Fri, 13 Nov 2020 06:38:12 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdSil-0000iv-A6
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 06:38:09 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CXTKv4M8dzLxHf;
 Fri, 13 Nov 2020 14:37:39 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Fri, 13 Nov 2020 14:37:46 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-riscv@lists.infradead.org>
Subject: [PATCH 1/3] riscv: Cleanup stacktrace
Date: Fri, 13 Nov 2020 14:42:21 +0800
Message-ID: <20201113064223.103530-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113064223.103530-1-wangkefeng.wang@huawei.com>
References: <20201113064223.103530-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_013808_833602_D54A6B4A 
X-CRM114-Status: GOOD (  13.94  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

MS4gYWRkIGFzbS9zdGFja3RyYWNlLmggZm9yIHdhbGtfc3RhY2tmcmFtZSBhbmQgc3RydWN0IHN0
YWNrZnJhbWUKMi4gcmVtb3ZlIHVubmVjZXNzYXJ5IGJsYW5rIGxpbmVzIGluIHN0YWNrdHJhY2Uu
YwozLiBmaXggd2FybmluZyAibm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhmaWxsX2NhbGxj
aGFpbuKAmSIKClNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVh
d2VpLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N0YWNrdHJhY2UuaCB8IDE3ICsr
KysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9wZXJmX2NhbGxjaGFpbi5jICB8IDEw
ICsrLS0tLS0tLS0KIGFyY2gvcmlzY3Yva2VybmVsL3N0YWNrdHJhY2UuYyAgICAgIHwgIDkgKyst
LS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RhY2t0cmFjZS5o
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zdGFja3RyYWNlLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3N0YWNrdHJhY2UuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwMDAuLmYwOWMxZTMxYmRlOQotLS0gL2Rldi9udWxsCisrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc3RhY2t0cmFjZS5oCkBAIC0wLDAgKzEsMTcgQEAKKy8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCisKKyNpZm5kZWYgX0FTTV9SSVNDVl9TVEFDS1RS
QUNFX0gKKyNkZWZpbmUgX0FTTV9SSVNDVl9TVEFDS1RSQUNFX0gKKworI2luY2x1ZGUgPGxpbnV4
L3NjaGVkLmg+CisjaW5jbHVkZSA8YXNtL3B0cmFjZS5oPgorCitzdHJ1Y3Qgc3RhY2tmcmFtZSB7
CisJdW5zaWduZWQgbG9uZyBmcDsKKwl1bnNpZ25lZCBsb25nIHJhOworfTsKKworZXh0ZXJuIHZv
aWQgbm90cmFjZSB3YWxrX3N0YWNrZnJhbWUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBzdHJ1
Y3QgcHRfcmVncyAqcmVncywKKwkJCQkgICAgYm9vbCAoKmZuKSh1bnNpZ25lZCBsb25nLCB2b2lk
ICopLCB2b2lkICphcmcpOworCisjZW5kaWYgLyogX0FTTV9SSVNDVl9TVEFDS1RSQUNFX0ggKi8K
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3BlcmZfY2FsbGNoYWluLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9wZXJmX2NhbGxjaGFpbi5jCmluZGV4IGNmMTkwMTk3YTIyZi4uNjIzZWNkMzZh
NzIwIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wZXJmX2NhbGxjaGFpbi5jCisrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3BlcmZfY2FsbGNoYWluLmMKQEAgLTQsMTEgKzQsNyBAQAogI2lu
Y2x1ZGUgPGxpbnV4L3BlcmZfZXZlbnQuaD4KICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+CiAK
LS8qIEtlcm5lbCBjYWxsY2hhaW4gKi8KLXN0cnVjdCBzdGFja2ZyYW1lIHsKLQl1bnNpZ25lZCBs
b25nIGZwOwotCXVuc2lnbmVkIGxvbmcgcmE7Ci19OworI2luY2x1ZGUgPGFzbS9zdGFja3RyYWNl
Lmg+CiAKIC8qCiAgKiBHZXQgdGhlIHJldHVybiBhZGRyZXNzIGZvciBhIHNpbmdsZSBzdGFja2Zy
YW1lIGFuZCByZXR1cm4gYSBwb2ludGVyIHRvIHRoZQpAQCAtNzQsMTMgKzcwLDExIEBAIHZvaWQg
cGVyZl9jYWxsY2hhaW5fdXNlcihzdHJ1Y3QgcGVyZl9jYWxsY2hhaW5fZW50cnlfY3R4ICplbnRy
eSwKIAkJZnAgPSB1c2VyX2JhY2t0cmFjZShlbnRyeSwgZnAsIDApOwogfQogCi1ib29sIGZpbGxf
Y2FsbGNoYWluKHVuc2lnbmVkIGxvbmcgcGMsIHZvaWQgKmVudHJ5KQorc3RhdGljIGJvb2wgZmls
bF9jYWxsY2hhaW4odW5zaWduZWQgbG9uZyBwYywgdm9pZCAqZW50cnkpCiB7CiAJcmV0dXJuIHBl
cmZfY2FsbGNoYWluX3N0b3JlKGVudHJ5LCBwYyk7CiB9CiAKLXZvaWQgbm90cmFjZSB3YWxrX3N0
YWNrZnJhbWUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAotCXN0cnVjdCBwdF9yZWdzICpyZWdz
LCBib29sICgqZm4pKHVuc2lnbmVkIGxvbmcsIHZvaWQgKiksIHZvaWQgKmFyZyk7CiB2b2lkIHBl
cmZfY2FsbGNoYWluX2tlcm5lbChzdHJ1Y3QgcGVyZl9jYWxsY2hhaW5fZW50cnlfY3R4ICplbnRy
eSwKIAkJCSAgIHN0cnVjdCBwdF9yZWdzICpyZWdzKQogewpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvc3RhY2t0cmFjZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jCmlu
ZGV4IDU5NTM0MjkxMGMzZi4uMzQ1YTIwMmM5MmJiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC9zdGFja3RyYWNlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jCkBA
IC0xMiwxNSArMTIsMTIgQEAKICNpbmNsdWRlIDxsaW51eC9zdGFja3RyYWNlLmg+CiAjaW5jbHVk
ZSA8bGludXgvZnRyYWNlLmg+CiAKKyNpbmNsdWRlIDxhc20vc3RhY2t0cmFjZS5oPgorCiByZWdp
c3RlciB1bnNpZ25lZCBsb25nIHNwX2luX2dsb2JhbCBfX2FzbV9fKCJzcCIpOwogCiAjaWZkZWYg
Q09ORklHX0ZSQU1FX1BPSU5URVIKIAotc3RydWN0IHN0YWNrZnJhbWUgewotCXVuc2lnbmVkIGxv
bmcgZnA7Ci0JdW5zaWduZWQgbG9uZyByYTsKLX07Ci0KIHZvaWQgbm90cmFjZSB3YWxrX3N0YWNr
ZnJhbWUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLCBzdHJ1Y3QgcHRfcmVncyAqcmVncywKIAkJ
CSAgICAgYm9vbCAoKmZuKSh1bnNpZ25lZCBsb25nLCB2b2lkICopLCB2b2lkICphcmcpCiB7CkBA
IC05Niw3ICs5Myw2IEBAIHZvaWQgbm90cmFjZSB3YWxrX3N0YWNrZnJhbWUoc3RydWN0IHRhc2tf
c3RydWN0ICp0YXNrLAogCiAjZW5kaWYgLyogQ09ORklHX0ZSQU1FX1BPSU5URVIgKi8KIAotCiBz
dGF0aWMgYm9vbCBwcmludF90cmFjZV9hZGRyZXNzKHVuc2lnbmVkIGxvbmcgcGMsIHZvaWQgKmFy
ZykKIHsKIAljb25zdCBjaGFyICpsb2dsdmwgPSBhcmc7CkBAIC0xMzAsNyArMTI2LDYgQEAgdW5z
aWduZWQgbG9uZyBnZXRfd2NoYW4oc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrKQogCXJldHVybiBw
YzsKIH0KIAotCiAjaWZkZWYgQ09ORklHX1NUQUNLVFJBQ0UKIAogc3RhdGljIGJvb2wgX19zYXZl
X3RyYWNlKHVuc2lnbmVkIGxvbmcgcGMsIHZvaWQgKmFyZywgYm9vbCBub3NjaGVkKQotLSAKMi4y
Ni4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
