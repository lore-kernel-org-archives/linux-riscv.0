Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C733FCF259D
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 06:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Ryi5ZCwUa29loc/VCc+j3/Sigpl3P9yBAsnZyKRQSE=; b=OIW66kOU0PDrrV
	OcpfkK029MimZHNWMRTxb9MjJcXDKnGQashTCM6EIwMIZvsTWxTcYf3gyLnBHpQDwEOrA+IDbXTM7
	3RUI2eNvmGBiImirheCaysQYOSWixj+XIkbzpSaNc3gZcsfAQ7NWr6WHjkYP7//x+K93Ksc+crolm
	B6+WwTqQuRRLRwzSmm1o0NTAJrb4tkUpATF6r93Dqg1Z+nTyDnPCaEB2FatDYFEXSvZMbKn1yFCve
	Jw2W8ncwXCozqgaVRH3aIUVlLk6d0LrGyPfrqRPHQ13mPBtBiIev+yz0H3Wdm9ZBOD4UJLPlGmX+X
	FfN3P/JLv8mRTVtqmdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0F2x-00000003yDd-1s51;
	Mon, 14 Oct 2024 06:59:15 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0F1a-00000003xvr-0IsZ
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 06:57:51 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7ea12e0dc7aso2429275a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 13 Oct 2024 23:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1728889067; x=1729493867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rbc6XJjTsJcUlouhG07nINxP0CXcC/f2VOnFjv0x5Ns=;
        b=D3d78vhXoVuEcdyKh4FpM7+rqVEOmevGgPCBmGLaJ5LMTB6CWW+uyOa2idaBTlU2Dw
         fxs3IVozpvdI0DkP9vF9b2rQqIplVj6HLyOboZBts3ZWoCtlxxhE2szf3M1gzKPPOA2c
         pOrJVxs3BmOQRt2b/8g8uXuyO95ST35yBO0S+yrUEPa5VQvJNjOD5vphSw1xIZv4TMAL
         He+fbd66Gx//yNd0p/uTpVMFVxAGFg45Eggl0NrJAOpSr8XoGCihGfcdXjAxlcrjqY1u
         dkfUUwWZT/IguwtAfxYfIuuo2vLpGtC0KuJHeL2axpMBgRIakzcubekNmHDBPBcL1LdQ
         TYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728889067; x=1729493867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rbc6XJjTsJcUlouhG07nINxP0CXcC/f2VOnFjv0x5Ns=;
        b=o+PsbcnEZDVtZbjOFN1jygiZdi7Bi2N/TqFwdiQV7aJ6I0h8PWgIa3Xl1pjMJeRkt9
         GFXYMhSwQrjTUsq1STOHNgGjYywDyi+8pxiMWRKlcHF70jKtLkssU4VsnDdGt0zs5k/I
         m6EUW4kDfCF+D8T42U+vO9++JfELn/dgojfvYdrGgtproLSSlbqZacYZHT+3czxDjNI1
         DOlhq4Oa7EUbzKELBsysannJ6Vr0+Juo0frrT7sdcwzMHP1Ia8hro1sBnwC/ANNnxsnW
         /665Gq+Bx6wWmfOiA5FiMAEtz02pSppkd/lAhHCbQK8F+7u54iOunhOfkEVVkHGzBBXf
         01GA==
X-Gm-Message-State: AOJu0Yw3PW+OnBaRTizKvqsesgo8VLfXnif09Qwmve4o+xt4qVdaGc9D
	nKYKqQlFLgmO2AYUeKK+Rkyk6TulhEhKiBDgImANMV+NfU4QgnOn6hwpFDsxstEC3rfo+hzvV8K
	rsxE=
X-Google-Smtp-Source: AGHT+IGyd+pL/ndfFmOv6vLWrI3D0Qpobrjvr+ZrdZ9LrtfowVZj1cOB8MrRM6MMFrz4gjs+FCB7TQ==
X-Received: by 2002:a05:6a21:2d08:b0:1d6:de67:91c0 with SMTP id adf61e73a8af0-1d8c95abca4mr10553848637.27.1728889067325;
        Sun, 13 Oct 2024 23:57:47 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.192.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea448f93a7sm6229120a12.20.2024.10.13.23.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 23:57:46 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/riscv-intc: Fix no-SMP boot with ACPI
Date: Mon, 14 Oct 2024 12:27:39 +0530
Message-ID: <20241014065739.656959-1-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_235750_142123_2900DA63 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

V2hlbiBDT05GSUdfU01QIGlzIGRpc2FibGVkLCB0aGUgc3RhdGljIGFycmF5IHJpbnRjX2FjcGlf
ZGF0YSB3aXRoIHNpemUKTlJfQ1BVUyB3aWxsIG5vdCBiZSBzdWZmaWNpZW50IHRvIGhvbGQgYWxs
IFJJTlRDIHN0cnVjdHVyZXMgcGFzc2VkIGZyb20KdGhlIGZpcm13YXJlLiBBbGwgUklOVEMgc3Ry
dWN0dXJlcyBhcmUgcmVxdWlyZWQgdG8gY29uZmlndXJlCklNU0lDL0FQTElDL1BMSUMgcHJvcGVy
bHkgaXJyZXNwZWN0aXZlIG9mIFNNUCBpbiB0aGUgT1MuIFNvLCBhbGxvY2F0ZQpkeW5hbWljIG1l
bW9yeSBiYXNlZCBvbiB0aGUgbnVtYmVyIG9mIFJJTlRDIHN0cnVjdHVyZXMgaW4gTUFEVCB0byBm
aXgKdGhpcyBpc3N1ZS4KCkZpeGVzOiBmODYxOWI2NmJkYjEgKCJpcnFjaGlwL3Jpc2N2LWludGM6
IEFkZCBBQ1BJIHN1cHBvcnQgZm9yIEFJQSIpClJlcG9ydGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxi
am9ybkBrZXJuZWwub3JnPgpDbG9zZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yaXNjdi9s
aW51eC1yaXNjdi9hY3Rpb25zL3J1bnMvMTEyODA5OTc1MTEvam9iLzMxMzc1MjI5MDEyClNpZ25l
ZC1vZmYtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgotLS0KIGRyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIHwgMTkgKysrKysrKysrKysrKysrKysrLQogMSBm
aWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW50Yy5jCmluZGV4IDhjNTQxMTM4NjIyMC4uZjY1M2MxM2RlNjJiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYworKysgYi9kcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWludGMuYwpAQCAtMjY1LDcgKzI2NSw3IEBAIHN0cnVjdCByaW50Y19kYXRhIHsK
IH07CiAKIHN0YXRpYyB1MzIgbnJfcmludGM7Ci1zdGF0aWMgc3RydWN0IHJpbnRjX2RhdGEgKnJp
bnRjX2FjcGlfZGF0YVtOUl9DUFVTXTsKK3N0YXRpYyBzdHJ1Y3QgcmludGNfZGF0YSAqKnJpbnRj
X2FjcGlfZGF0YTsKIAogI2RlZmluZSBmb3JfZWFjaF9tYXRjaGluZ19wbGljKF9wbGljX2lkKQkJ
CQlcCiAJdW5zaWduZWQgaW50IF9wbGljOwkJCQkJCVwKQEAgLTMyOSwxMyArMzI5LDMwIEBAIGlu
dCBhY3BpX3JpbnRjX2dldF9pbXNpY19tbWlvX2luZm8odTMyIGluZGV4LCBzdHJ1Y3QgcmVzb3Vy
Y2UgKnJlcykKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19h
Y3BpX21hdGNoKHVuaW9uIGFjcGlfc3VidGFibGVfaGVhZGVycyAqaGVhZGVyLAorCQkJCQljb25z
dCB1bnNpZ25lZCBsb25nIGVuZCkKK3sKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGludCBfX2lu
aXQgcmlzY3ZfaW50Y19hY3BpX2luaXQodW5pb24gYWNwaV9zdWJ0YWJsZV9oZWFkZXJzICpoZWFk
ZXIsCiAJCQkJICAgICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcgZW5kKQogewogCXN0cnVjdCBhY3Bp
X21hZHRfcmludGMgKnJpbnRjOwogCXN0cnVjdCBmd25vZGVfaGFuZGxlICpmbjsKKwlpbnQgY291
bnQ7CiAJaW50IHJjOwogCisJaWYgKCFyaW50Y19hY3BpX2RhdGEpIHsKKwkJY291bnQgPSBhY3Bp
X3RhYmxlX3BhcnNlX21hZHQoQUNQSV9NQURUX1RZUEVfUklOVEMsIHJpc2N2X2ludGNfYWNwaV9t
YXRjaCwgMCk7CisJCWlmIChjb3VudCA8PSAwKQorCQkJcmV0dXJuIC1FSU5WQUw7CisKKwkJcmlu
dGNfYWNwaV9kYXRhID0ga2NhbGxvYyhjb3VudCwgc2l6ZW9mKCpyaW50Y19hY3BpX2RhdGEpLCBH
RlBfS0VSTkVMKTsKKwkJaWYgKCFyaW50Y19hY3BpX2RhdGEpCisJCQlyZXR1cm4gLUVOT01FTTsK
Kwl9CisKIAlyaW50YyA9IChzdHJ1Y3QgYWNwaV9tYWR0X3JpbnRjICopaGVhZGVyOwogCXJpbnRj
X2FjcGlfZGF0YVtucl9yaW50Y10gPSBremFsbG9jKHNpemVvZigqcmludGNfYWNwaV9kYXRhWzBd
KSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFyaW50Y19hY3BpX2RhdGFbbnJfcmludGNdKQotLSAKMi40
My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
