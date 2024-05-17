Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC30C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7n7Oq7PW4rG3o9D7C21nZwqMjgNR6cQXHsQJ0628Yg=; b=myFVoFgavmSlDF
	KnrZSD+bIJRauNEoq2vLJDe3wuMoslshEIq/FdginzITTVF1x9YdPVd0isG0Rt86lmmexU81pWXil
	jZbn3mVbN2WkRmWy38icmIJrGVrVR2VPWCw0z2N/V7W1sgwb8Sn9bOYLEqXzxuvqZcBqiVvaNh0bI
	amEBnDguOLW7pEsg8g3q61E0JATsF3QG5/mobCVYgd8+eCjIt7KMB821ALzWlkhPD0HVgOANEwwBi
	ZqvCVSDZ/PkjYIC8/Bfvt3aEjuzWeCX0r1oxR/AbBzyWCtk0sa7zc19zUsjMRJZ2Z4xKKovDMtHdG
	HOEWoORpciuHjqiKfOJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxq-000000088Oh-3hO8;
	Fri, 17 May 2024 14:53:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxY-0000000884W-0dEH
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42011507a51so342205e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957602; x=1716562402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrSVtGZRwZdqSUCPKBtbbPV0rvcWw4KEF79SGVRT1V0=;
        b=v94hy+og79RmBdUT2EAhIIs65HWxcDeKhIyEjKT3r5UaT/vUsatINmMwwqDSoNOf1v
         fazvzHrge6JjuVqahYcdF7r0Qs0IfBbhg6WbSrrfFbabFS8q8NyakrHgkw1OMFGxre7h
         p0fWAoSMrmfXCtlcPwlL8XRJhK5gwBayB/BxKtKNMdtS7dtjP/tgVEQK87pZGao7zpd4
         5z/dpipMd4KhZleAwhjgct0VNjG1eWvH/RvlQyV6WerxNG9T72nxpV83+Bp0nYnxJj8W
         r0DSWeYt+uniWC/D+Ke0NjKh7eq5U8/pCA1N8NYg8mN5l8DKzkcborpuaRhGc034i/HS
         sZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957602; x=1716562402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrSVtGZRwZdqSUCPKBtbbPV0rvcWw4KEF79SGVRT1V0=;
        b=myC6CJnxiuNwzcj5oHaA03+NWYCmj56etLPK/K1V9BJ+YG7M5VAf0h5BFTcrQg/Pbz
         9IrJTZUVFbJ3X+IO1Ne1Ps6R2IN9BcSC9JNFzCqsytImCBVDVuLGIbxlf+IQoRlrfK7+
         8W5tHIqhXE0XNT0SAVN6r3ws1JSiOrNdwi3NxZb2yTGvVId7ZTAZMFt8/RjpjHRYJ7G7
         R5v5sAfWQAJi/FfXJmM8vZmcXV8RgKt5ERcZQTmzpWf033W+Epe8PBPS/0BKti1VIv6G
         Ys2o4akPTpffEbBFE6OYj+z62Dll0erDiufvQCw53vihQJg7ucwPgYdzmMQkvMD5uPJD
         6WrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtkx2P0/hClim0RyQMjbdXY35aeBr+QEAbU1S9O1HOONBaerIsfmisCkHX5GWlBUCSfRZTzCsBT5Wu+ogG7VWLX8r6/Vnb5Ahz3qz0CaJH
X-Gm-Message-State: AOJu0Yx1v9QWmRS9wsvHBEIluZs8Y9G3EXhq+B8l+mpCSh0FHxTeXcto
	xizDGqjzf3phxykwheYHbalBP16x1dGf+tmDJuXO5b4Sat3fx+HPPfhYdFSYhTQ=
X-Google-Smtp-Source: AGHT+IGsuE5xt92dGgSdWc5RJ3a8C2oD54vDPB0hNfYCMvTglFHEtoobZF7XlkesElGq2tbCGZs/Lg==
X-Received: by 2002:a05:600c:1d0a:b0:418:1303:c3d1 with SMTP id 5b1f17b1804b1-41fead6ae1bmr185460015e9.3.1715957602088;
        Fri, 17 May 2024 07:53:22 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:21 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 05/16] KVM: riscv: selftests: Add Zimop extension to get-reg-list test
Date: Fri, 17 May 2024 16:52:45 +0200
Message-ID: <20240517145302.971019-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075324_349388_88A14772 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFppbW9wIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0gc28gYWRk
IHRoaXMKZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNj
di9nZXQtcmVnLWxpc3QuYwppbmRleCBiODgyYjdiOWI3ODUuLjQwMTA3YmI2MTk3NSAxMDA2NDQK
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwpAQCAt
NjcsNiArNjcsNyBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQogCWNhc2UgS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9F
WFRfWklISU5UTlRMOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVND
Vl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UUEFVU0U6CiAJY2FzZSBLVk1f
UkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1Zf
SVNBX0VYVF9aSUhQTToKKwljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklT
Q1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJTU9QOgogCWNhc2UgS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9F
WFRfWktORDoKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNB
X1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pLTkU6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lT
QV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aS05I
OgpAQCAtNDMyLDYgKzQzMyw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICppc2FfZXh0X3NpbmdsZV9p
ZF90b19zdHIoX191NjQgcmVnX29mZikKIAkJS1ZNX0lTQV9FWFRfQVJSKFpJSElOVE5UTCksCiAJ
CUtWTV9JU0FfRVhUX0FSUihaSUhJTlRQQVVTRSksCiAJCUtWTV9JU0FfRVhUX0FSUihaSUhQTSks
CisJCUtWTV9JU0FfRVhUX0FSUihaSU1PUCksCiAJCUtWTV9JU0FfRVhUX0FSUihaS05EKSwKIAkJ
S1ZNX0lTQV9FWFRfQVJSKFpLTkUpLAogCQlLVk1fSVNBX0VYVF9BUlIoWktOSCksCkBAIC05NTUs
NiArOTU3LDcgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6aWZlbmNlaSwgWklGRU5DRUkp
OwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6aWhpbnRudGwsIFpJSElOVE5UTCk7CiBLVk1f
SVNBX0VYVF9TSU1QTEVfQ09ORklHKHppaGludHBhdXNlLCBaSUhJTlRQQVVTRSk7CiBLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHppaHBtLCBaSUhQTSk7CitLVk1fSVNBX0VYVF9TSU1QTEVfQ09O
RklHKHppbW9wLCBaSU1PUCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHprbmQsIFpLTkQp
OwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6a25lLCBaS05FKTsKIEtWTV9JU0FfRVhUX1NJ
TVBMRV9DT05GSUcoemtuaCwgWktOSCk7CkBAIC0xMDEwLDYgKzEwMTMsNyBAQCBzdHJ1Y3QgdmNw
dV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7CiAJJmNvbmZpZ196aWhpbnRudGwsCiAJJmNv
bmZpZ196aWhpbnRwYXVzZSwKIAkmY29uZmlnX3ppaHBtLAorCSZjb25maWdfemltb3AsCiAJJmNv
bmZpZ196a25kLAogCSZjb25maWdfemtuZSwKIAkmY29uZmlnX3prbmgsCi0tIAoyLjQzLjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
