Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C673C5519F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 08:27:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F8B24655
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 08:27:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pIMJ5dxH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/JGC0VA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F8B24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cx31eV8fxK5X4hdBlUnUcbraUkCG8qHtK5oYg+7uW8s=; b=pIMJ5dxHgl7aL/1lNBDVtvXLf
	i144lnyeLDAFZ4dvujINnCieiJ7oXp6EdcI1VVSGEYPs5leSEhg6JMTqyFcwKx45FBj4Q0lSnj6Gc
	0mDUWPy8PIESBii0uUEbLbFnkrRVDKAcp47rKtFQeTVlMCCd9l/BjPJuJGo3rv5+ue5pNUZ/syoI+
	qQkmPa0VrGpI8FJapgRDrMIKfdzMKNs9OQG1T7inIPHHUtc1IZI1JIvg0UgXyWJr9c+f51Y5gGx3f
	NiAkka82KSgF6S8Y5xXZu0LDSd8Df5fSpW6/9qU5HxrvrEiUNRiEpp0hU4OkDpjzKujmahA4jta1e
	A+pMV9iJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewKT-0008Up-IP; Tue, 17 Nov 2020 08:27:09 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewKR-0008Tw-4I
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 08:27:07 +0000
Received: by mail-pj1-x1041.google.com with SMTP id js21so45543pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2020 00:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4RoQLFT/+eItTFwja6y027jS+o5vx3tn2+htvfb2XHI=;
 b=F/JGC0VADO/Zkv17DSC1GpV8jvX6fOTghRA7nki52tR9Bvi9uy666TwzjJsxx0nD4A
 EEuPltsjDVJ8otN1fS/idx+z49ZybWtexgfmTcCL6WLufsl8d1viun33dYPO22wfW7z+
 C94awmkBY0tOqczBNpMBcp9N+g0i1LJ7LxzYH0gJkI7hPUqgUYbN4UBEuQG3nzJnrXn6
 p7puBQ6ZOIWcuXtTTKmsEAEXwwhWQXvTsFtGo32CznUIhoHaeHSd7NB1Ea/3zLv3dUT4
 Vpta0jVsHA2cOtpkUb//dOV2r6keIv2kPdg7j7W4WXVp3wtYYbPlrdO6OKC/EabDOcSA
 iYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RoQLFT/+eItTFwja6y027jS+o5vx3tn2+htvfb2XHI=;
 b=j6jAW27/OWr/1QFF2m1lSShIDCqYQA4h2kvh08dCIAhQzy+Ey6t3uzYjX8n6jQR0JH
 6WrzqZ4EXp7USL1q+UU/iV9HdZaMxYwufNRw+RCrDbbjUZbB+MgJyt3wQQeA63Yv2trx
 t1AjGwXvx+OAjXVQeVTf2plGElsLioAh40rhIscdeTn5tiLdEyZUgTiBFuIVvemsF5B+
 ADep7Zj6Y94PdC74qTsVivg4aLPRnyZmwgHx7Ix+h/E79S9/nW7q3/F4BoLbEuKlABX2
 TtLMNWn5zFkLZUa7Et0mLPZviiGo3rElk+MLrP8jCnJh5fFbIJXb8CtDFskl2Ri55Yp5
 Q6Wg==
X-Gm-Message-State: AOAM530rnd+KF+lIjF3VNHfEAN3a4t2vYoOiOAHLPYByI2MwI6swmlQg
 zX7huq3uqBQAfqvDiHcNOs8=
X-Google-Smtp-Source: ABdhPJzqgTFOxPVF4aRIqK+S7JI590qSI1cXqhmcFDMyexvmvVG50FTocYDPRQKCwW2vNkmhOQ20bg==
X-Received: by 2002:a17:902:9a84:b029:d6:eaef:4806 with SMTP id
 w4-20020a1709029a84b02900d6eaef4806mr16375125plp.82.1605601624721; 
 Tue, 17 Nov 2020 00:27:04 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([192.55.54.40])
 by smtp.gmail.com with ESMTPSA id c12sm2251671pjs.8.2020.11.17.00.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 00:27:03 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [PATCH bpf-next 2/3] selftests/bpf: Avoid running unprivileged tests
 with alignment requirements
Date: Tue, 17 Nov 2020 09:26:37 +0100
Message-Id: <20201117082638.43675-3-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201117082638.43675-1-bjorn.topel@gmail.com>
References: <20201117082638.43675-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_032707_245283_B89595F4 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, xi.wang@gmail.com, luke.r.nels@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U29tZSBhcmNoaXRlY3R1cmVzIGhhdmUgc3RyaWN0IGFsaWdubWVudCByZXF1aXJlbWVudHMuIElu
IHRoYXQgY2FzZSwKdGhlIEJQRiB2ZXJpZmllciBkZXRlY3RzIGlmIGEgcHJvZ3JhbSBoYXMgdW5h
bGlnbmVkIGFjY2Vzc2VzIGFuZApyZWplY3RzIHRoZW0uIEEgdXNlciBjYW4gcGFzcyBCUEZfRl9B
TllfQUxJR05NRU5UIHRvIGEgcHJvZ3JhbSB0bwpvdmVycmlkZSB0aGlzIGNoZWNrLiBUaGF0LCBo
b3dldmVyLCB3aWxsIG9ubHkgd29yayB3aGVuIGEgcHJpdmlsZWdlZAp1c2VyIGxvYWRzIGEgcHJv
Z3JhbS4gQSB1bnByaXZpbGVnZWQgdXNlciBsb2FkaW5nIGEgcHJvZ3JhbSB3aXRoIHRoaXMKZmxh
ZyB3aWxsIGJlIHJlamVjdGVkIHByaW9yIGVudGVyaW5nIHRoZSB2ZXJpZmllci4KCkhlbmNlLCBp
dCBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvIGxvYWQgdW5wcml2aWxlZ2VkIHByb2dyYW1zIHdpdGhv
dXQKc3RyaWN0IGFsaWdubWVudCB3aGVuIHRlc3RpbmcgdGhlIHZlcmlmaWVyLiBUaGlzIHBhdGNo
IGF2b2lkcyBleGFjdGx5CnRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bi50b3BlbEBnbWFpbC5jb20+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3Rf
dmVyaWZpZXIuYyB8IDEyICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9icGYvdGVzdF92ZXJpZmllci5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3Rf
dmVyaWZpZXIuYwppbmRleCA5YmUzOTVkOWRjNjQuLjIwNzVmNmE5ODgxMyAxMDA2NDQKLS0tIGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL3Rlc3RfdmVyaWZpZXIuYworKysgYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvdGVzdF92ZXJpZmllci5jCkBAIC0xMTUyLDkgKzExNTIsMTUg
QEAgc3RhdGljIHZvaWQgZ2V0X3VucHJpdl9kaXNhYmxlZCgpCiAKIHN0YXRpYyBib29sIHRlc3Rf
YXNfdW5wcml2KHN0cnVjdCBicGZfdGVzdCAqdGVzdCkKIHsKLQlyZXR1cm4gIXRlc3QtPnByb2df
dHlwZSB8fAotCSAgICAgICB0ZXN0LT5wcm9nX3R5cGUgPT0gQlBGX1BST0dfVFlQRV9TT0NLRVRf
RklMVEVSIHx8Ci0JICAgICAgIHRlc3QtPnByb2dfdHlwZSA9PSBCUEZfUFJPR19UWVBFX0NHUk9V
UF9TS0I7CisJYm9vbCByZXFfYWxpZ25lZCA9IGZhbHNlOworCisjaWZuZGVmIENPTkZJR19IQVZF
X0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTCisJcmVxX2FsaWduZWQgPSB0ZXN0LT5mbGFncyAm
IEZfTkVFRFNfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1M7CisjZW5kaWYKKwlyZXR1cm4gKCF0
ZXN0LT5wcm9nX3R5cGUgfHwKKwkJdGVzdC0+cHJvZ190eXBlID09IEJQRl9QUk9HX1RZUEVfU09D
S0VUX0ZJTFRFUiB8fAorCQl0ZXN0LT5wcm9nX3R5cGUgPT0gQlBGX1BST0dfVFlQRV9DR1JPVVBf
U0tCKSAmJgorCQkhcmVxX2FsaWduZWQ7CiB9CiAKIHN0YXRpYyBpbnQgZG9fdGVzdChib29sIHVu
cHJpdiwgdW5zaWduZWQgaW50IGZyb20sIHVuc2lnbmVkIGludCB0bykKLS0gCjIuMjcuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
