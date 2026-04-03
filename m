Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7089FD73094
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMntWDUhzEzVIHLDyprgt2ElftAQjP5uyR057PIDJBI=; b=TBryFilbD7N7h3
	EmCJREnJ0LIbWnUsd8ojr+UCY2WvxvY/N5dsyo/zhLj9W20YJKa77EgOGI+x6f7wPijGW1cwNUAoz
	STlDPdhRXZLzG43bSij8OiWmDDHV7XCmw5qYIA1emNOEKLPoiTmCQ1WyAsr2cGhZhGzB2EmFNxlIR
	jnVALNAb2Rkxvlg6BLsHX0MAO5bydYNrc8oVVV2Q7nNa4xs7u0vSmQvADfcrBBI9VtR/pW7RZALBd
	T9E5AaliePFlXSqb2GRjUm2XB4lzaduJDvHC/rV9xEmvxdxHvTKmCv1uPZk7+Dhhvwgv2woDO5msi
	hoKxkl/mJ6dpzdqMozlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8djO-000000020aR-15uX;
	Fri, 03 Apr 2026 12:34:34 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8djK-000000020ZN-3ZxL
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 12:34:32 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7d7f09aa39fso2455469a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 05:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775219670; cv=none;
        d=google.com; s=arc-20240605;
        b=K8hKA6YunN+IBDO5tS2aBJQ8OkEP/T9KBBB1h6ZGExL45to6cGLDmF7Svs+fcBTOPZ
         s0qfQLgZFMjtsB6DNq1i/NyvhN+b4ar+RjhYchl3rCV0yZ31D2qlqqfQ9RSmfK3zPewP
         Efe+Kj8sL7u7T4C+Mat2RuEo09eko/FhS/fsg92wT6evnRVkiS5FAxqPItvZoSm/qfYJ
         ooYIX1vaGJaYhaq4qmJhu5oMBg/FtYwfMOrMoNEbI5b8gA4Id56s1MGYb3SinC/QTfYa
         MspHnE6/cd0RqvfIxQ745Z7wRa4NrmDdaRyUXkylUXwAWBCdj5OMuWMm690/qDKyJdIA
         mDKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=59kVespEKWq9NAsOL9PYjbmf7GwSpQzIo0rrK3/DBI4=;
        fh=2fhwEx1+hsa/gUqeSgYtpEkstEza+7By9rx5nETEZ0U=;
        b=dRYcl8H0fwAlgeV7PaxEoryZI2AUPwKgAMri3vEcQYV25KwqdQy4fy2LeUzd4/SHLZ
         kbOSc0bhUyp/p3AQGlc63RNOnzD8vwT2mxWN4ptuYelT/ZtoiitQ3b/7n4feap2OeGYL
         hx0g5M0bBxbmwcHQ+F7AyVmFX7Nr29omUbPtTZQLViiU6fyw0J+nRsdfzpVjek1e9t4z
         gXtTKX9tdSPBvYJXIqtwBEghwdeyIyni+d7L+2Sxf24uRhY0Zsu7mz3++s6JJ7u2C6mg
         mAu6tZzB4jsY65fFfkOQYD/LbXw9cwyEcfk1uLGVBc1mjVJdfUrrFp6BnGwjAoz2XKCA
         TQeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775219670; x=1775824470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59kVespEKWq9NAsOL9PYjbmf7GwSpQzIo0rrK3/DBI4=;
        b=0qIkRgXAzN0BJH5cGFzKFvVHt+MxdtKOkC4TYKkLoviCupZBFGrrsYD9R+cLDaL298
         uvddwDWWjTJBU4nFWXiqTz/XTdqppTdY29veL1kgAB0IHsC7ygAdoYImNySURw0REVre
         XfKBBPZ2hMploSBrVx0R0enoBFah7skys931tX6KVg57ztE7j9tJNUWb1pI2mHPe62bs
         mfp2LPFZN+I0zkPay2IbwoSV58u2Nls6xB4cuHJ1955WN3BAFMLekZQlOLrMOthBlhUH
         R1OohCE/vsobPGHAP0rE/eCfMT/hFBh2QQzOqb0iCnLmmuKOWdnTT5d85voEvD5cHtxi
         lf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775219670; x=1775824470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59kVespEKWq9NAsOL9PYjbmf7GwSpQzIo0rrK3/DBI4=;
        b=pBRIFE3mphV0luZUB1xNnBMe6Wcb4pFg3UTfwixLb43QrXFO3EJxxXSVOySQCQScHx
         ErZ60lRKkaYKBZZWHx9E6eEUT9pNXkc4YOJDUOXVwdVk0S4stAJPrnOTOwPeYLsrBd9e
         lcVUFBUt3/M1tIK5m63+uU7dLGtPY3lQ3Xh0F1Ht/tWxMXyw2bDbaRnCdL+ZjvyOVE2d
         K/3TQAhaXWsx/OWDXPQqCXd94c6xPo8nDRWYyKTX4OMNwfaTT8VpTGD/ArucOt95AUC6
         gr12oHn90pP8y9J4XXEh7i4nUE1uaIrnMltlyC+wXPR90lk0X1iC/iiZVQgmBhvE65EJ
         8jJA==
X-Forwarded-Encrypted: i=1; AJvYcCWm1xmM2HfWZIgQOWD+SYf19viHNIFWNcWgSon8qaOccb+y9xJNnbMS2fsD/UNWXkFYRnKUwCYmAen+mw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1S8DT3PK5GW0fZq79APXV+xu6x9vkaXN3aiOgvk7IHlD/Tl7d
	uu/4w+SaHDoSNBdeZqADMLCrv+RbJ3UlmkdA7sfqjACeBJZs5qtSoRDwn98tcwFrKNiAmrpZcEC
	6Sckd3daeJLV2ZTkDajO3xq8hcfKUtYn42Mg/Lkd0YQ==
X-Gm-Gg: ATEYQzy5ROJ4xYKOCxqscTZ8Oake5wfe9Fd29OR7iSzWhFp95vpcbVA1uEaMwXyGei5
	ucEIoDIggokVVRvEUXWYsr/UZPlcFuahxaZpbhXMYPZd0KECxkmsPR4Q6t1m5zdASYJ8Bra/Gzg
	1cOBIAvcVoKy40BeCVoIbAZFcUV3sV44F6DXm+gRrGuBGkNtK6EXbtfRv+ocvPqRO7a/395XPHT
	K+12pjD8z3G2BIeDod+6Mu+T/c+O+CUDKHS/gZ/7ceZiL0Xy82SwyZinZVPUEQdXbz28ZK1jHUO
	pLDKpH2zKrBARBu41XyFn4kZZIC/Uf5vpqSUlwe+smQNxdQz/uC8bCFPhxnamcFRqOIOugdzYkw
	q/7Wj47K+C+kdtrgHN9dOfYX2W8o=
X-Received: by 2002:a05:6820:8118:b0:67e:42ca:bf2 with SMTP id
 006d021491bc7-68220541d3fmr1471004eaf.58.1775219669835; Fri, 03 Apr 2026
 05:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-6-anup.patel@oss.qualcomm.com> <DH1PTVPUM2UR.2J53ICCVVPAFA@oss.qualcomm.com>
In-Reply-To: <DH1PTVPUM2UR.2J53ICCVVPAFA@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 18:04:18 +0530
X-Gm-Features: AQROBzCgiw5HblgNuoDX5QU1aUCJYkWwlXJ-vtI51cG69rWO0VI_zpIeHFgZcTM
Message-ID: <CAAhSdy25k5YWBxLDhNhPkC79LVOZOdA9ZHHZ+65EgF8jewWa1w@mail.gmail.com>
Subject: Re: [PATCH 05/27] RISC-V: KVM: Factor-out ISA checks into separate sources
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_053431_139166_518669F6 
X-CRM114-Status: GOOD (  10.10  )
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

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgNzo0NOKAr1BNIFJhZGltIEtyxI1tw6HFmQo8cmFkaW0u
a3JjbWFyQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gMjAyNi0wMS0yMFQxMzoyOTo1MSsw
NTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNvbW0uY29tPjoKPiA+IFRoZSBL
Vk0gSVNBIGV4dGVuc2lvbiByZWxhdGVkIGNoZWNrcyBhcmUgbm90IFZDUFUgc3BlY2lmaWMgYW5k
Cj4gPiBzaG91bGQgYmUgZmFjdG9yZWQgb3V0IG9mIHZjcHVfb25lcmVnLmMgaW50byBzZXBhcmF0
ZSBzb3VyY2VzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4KPiA+IC0tLQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L2FpYV9kZXZpY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+ID4gQEAgLTEyLDYg
KzEyLDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgva3ZtX2hvc3QuaD4KPiA+ICAjaW5jbHVkZSA8
bGludXgvdWFjY2Vzcy5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9jcHVmZWF0dXJlLmg+Cj4gPiAr
I2luY2x1ZGUgPGFzbS9rdm1faXNhLmg+Cj4KPiBJIGd1ZXNzIDxjcHVmZWF0dXJlLmg+IGlzbid0
IG5lZWRlZCBhbnltb3JlLAoKT2theSwgSSB3aWxsIGRyb3AgdGhpcyBpbmNsdWRlIGF0IHRoZSB0
aW1lIG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KCj4KPiBSZXZpZXdlZC1ieTogUmFkaW0gS3LEjW3D
ocWZIDxyYWRpbS5rcmNtYXJAb3NzLnF1YWxjb21tLmNvbT4KClJlZ2FyZHMsCkFudXAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
