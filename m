Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8AEE63C85
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 06:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUb9oi86826C7CFlXzFhG0huPQQsUnz/9nDgz25KGY0=; b=UAdXZgl6U/fIKs
	YBhgyUC7C53nXOdJH1ENZ0OQsGDIwraNHq9QIgbR4ulpGwdOJSnv3IsmdQJs7NrgtMhup+7gl8j0Q
	C7FUKBBbvfVOCwKGVKSO8mZj+6pzW53bUc8VKaiUPEKDjKXXVv/doyLYhLiHYufNLlM6Q5Vz2P5Y6
	NNGI2pjG2etroLzSK4Ga/fN7p4oEF8NHyvSt/d9PjFGuctMW4Hw2k7W/eKDdyjDke8xlJ1M0HFWNJ
	pn/qGnJLJQHiGeRCVjnLlikFjTsiARDAJP7pjr4KHfjNerbnBWVoI65dv8vY6L2SBKHPa1o6l6FSY
	Xu9SgZJ0dBEgPeG6avhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjtK6-0000000Au7T-1F24;
	Sun, 25 Jan 2026 06:10:10 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjtK3-0000000Au6V-24du
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 06:10:08 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-662b678a625so1007778eaf.2
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jan 2026 22:10:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769321406; cv=none;
        d=google.com; s=arc-20240605;
        b=JG84nswhpTVegS014G4w26X+4l43hgjMloHXu37me+D3mHFfJGZX5RDdnnrAJXRCLn
         Qx1npxxgia0xEMYdyID+93ITsKJt7yC0E+szrqrLZ2jr6eiFer+T8obk5UWTZ4OiNo42
         5AVuLnG60GT8oepiwVfE57TA0GTHutgXyGgZ+HbT9DmDONV+dfNL0l8E/3jO8rTZqRz7
         TLPJ+JQtrv5A5Qm6Qj+BHjiyE0Rthg7jYKIdTIKCmSFLo+VV9V01WDB+E9i72Ipj+bs+
         KWsIH9Z0I9HAXAUjjCTx5Y9m8OY4ULQZHyBiJgGhAtMXz31sH21QmjrPyVZ0Kcilqy8i
         80BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WkWG8i5H6i4d8+T8dzsuYEcM3slSTCIiuQ3+RlWOG0s=;
        fh=gefCwMJMIG6KumN0assCKxRILbjmxRwjALp4auaBfw0=;
        b=ldgvoaV5eLPv4ZRnQiwgIWbGp0jiNXpFpMRzTtu8jtsNyg8yZhmhaBRwlDZwtUw0tZ
         TZ1MwEkAkEjBbZTZOvkLNFueCO5wYH1aTtlkbNTodZtJiDxx7HXywyPoGU8ef5nIqWkz
         Kynp/K0Ekt/uBLgmlm3SQNsu6vnB3mOMd9t7Pf7CeuJZ+0FGxWF75JBVFBRVfeuLUeju
         8jBqvP8+5S5ASAHxSxgMPF72xD1sj62idS5TiBoVeYs+rCS5aSaooGJsI0LlFzfSq+yv
         dXN9qE0fqJt3amgsqo2ROktRArXTvvUcAqLjwVQVucjHbN2kIqqwOBE7JD0f+zBsfela
         y/mA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769321406; x=1769926206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WkWG8i5H6i4d8+T8dzsuYEcM3slSTCIiuQ3+RlWOG0s=;
        b=ukA/2+zmpIZX/w9q9UkKCIGfj3zTpjxKaDOIrHYeCVMp4Zmrzcq3QQ0EDIAtQI7hqT
         +vKtlPM7vVnSlEbLsHo8oUs3CMp05Cj8eGfZtBmVX8wcaFp7rW5N1vqWWPNkgP9+NxZS
         bpPhYL0i0GZkvMSpCXdzkotmcmrjFnOdiw3IYy2utHozd9PUlhyiMWoADkA1sCl0bnyg
         3J9z/PtUhLFF3MUfs3oOelECwNTU2jAUFfq2jWIrBw00WctmTGsxD9lNtpuSyXcd3/3X
         DnS1rDUcmuzikGKT41ZFvqRUQeUJE+Q7cwVKCzHhOHVnPj/hrGyn7Gphzpc1BXfWXjOb
         Tc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769321406; x=1769926206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WkWG8i5H6i4d8+T8dzsuYEcM3slSTCIiuQ3+RlWOG0s=;
        b=J3kCoO09cwGLlIEvK/H6/SJKwRvoS0O/Pe8moCcTtWViABVRNC1dHlD3ZL+Rt9Z4qD
         mEfhRWHggz/VFlcWEtvRQDMdsJ9laoFieUhJLBMeUpOW1Av3GcMuy5+relPPJW5DF0PQ
         Tsmdgsx1CCSZ+M0+S61jZc3omT1O4tgmbTv1xmco9vmcjWz4dfMG1cY3jCkloXDl/5kk
         AaGKDHz/KdGvMNA/Pp+zagjv26R7z9xFh1MopktPeR1RGH4QCWDWJYGj0A89RlwYYl5a
         H8/CvSx3bPeGKOcAg8CflyE4w4MFO3Piq1SF5vHbxRa79w1VtRc0+NxjCbsTh+bmaxdg
         gd6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdUGBSqLPATFWIfD7v227GiFothx86IVpE5uxzoJboO98aFHdSXMT2sgODOaFgZDoQ86jp1QTm2W/dzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQWwFHKSXGOzANsLBWBYK7ewDZ7JYc7UFaW+0Ue9heJCv4KwQ8
	Btyw5pK+KO6msscz3x7Y76olOqQEb7SwRaeudUQxDysvL0NgFCrS2mS3Uebh/Oh6JcZcVt4emib
	ImIw7Eog2TD1btFNnEeNt/sTEvIp2yYwtCTS0BEAfSA==
X-Gm-Gg: AZuq6aLRyPkZwSBFUvc68wqZFGvNTQlrA0AQ9xE1o3223Su5Qyf+QpD5wuJValGMih1
	yQxY7VWEvltzJfrF/nGBe4s7cL46QYC9QVcIHGtWxaXT809OLX/xSiIhOp4L6sebDv7SQ7UbGqp
	8RKo6pKWMJIcABS6oRwAUiW998c9Q12KsduMn22unk2h3pTJd7H+9ejER07Zug5inqk+ZFU+DGW
	u/A0IO89BllfMK4f77znYI+5ScBo4RjzTrtoBp3Z2WT8QhfNdP7FtdJsBXPN5KdNbVkUFJprDgp
	PkRAvCSG1b+v2UmJIur9bfFvwslxrdZcVUDSbQjw8wXdwP96YU+/gTitUCWJk2qXns8=
X-Received: by 2002:a05:6820:4c10:b0:65f:6601:b348 with SMTP id
 006d021491bc7-662e04852c3mr466071eaf.62.1769321404333; Sat, 24 Jan 2026
 22:10:04 -0800 (PST)
MIME-Version: 1.0
References: <20260125060441.2437515-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260125060441.2437515-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Jan 2026 11:39:53 +0530
X-Gm-Features: AZwV_QiLy7Qn8vFdFMNh31JEJuULaHJbzToh_4mxXW9q7rEMkbJvRXHHKpISzlk
Message-ID: <CAAhSdy3dWRuJpLMBqrPJ99AqneWvJu1TuU7wW0Fom+awdBupDQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr
To: Jiakai Xu <jiakaipeanut@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Atish Patra <atish.patra@linux.dev>, 
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_221007_701780_5310F9DA 
X-CRM114-Status: GOOD (  20.87  )
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

T24gU3VuLCBKYW4gMjUsIDIwMjYgYXQgMTE6MzTigK9BTSBKaWFrYWkgWHUgPGppYWthaXBlYW51
dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgbnVsbCBwb2ludGVyIGNoZWNrIGZvciBpbXNp
Y19zdGF0ZSBiZWZvcmUgZGVyZWZlcmVuY2luZyBpdCBpbgo+IGt2bV9yaXNjdl9haWFfaW1zaWNf
aGFzX2F0dHIoKS4gV2hpbGUgdGhlIGZ1bmN0aW9uIGNoZWNrcyB0aGF0IHRoZQo+IHZjcHUgZXhp
c3RzLCBpdCBkb2Vzbid0IHZlcmlmeSB0aGF0IHRoZSB2Y3B1J3MgaW1zaWNfc3RhdGUgaGFzIGJl
ZW4KPiBpbml0aWFsaXplZCwgbGVhZGluZyB0byBhIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSB3
aGVuIGFjY2Vzc2VkLgo+Cj4gVGhpcyBpc3N1ZSB3YXMgZGlzY292ZXJlZCBkdXJpbmcgZnV6emlu
ZyBvZiBSSVNDLVYgS1ZNIGNvZGUuIFRoZQo+IGNyYXNoIG9jY3VycyB3aGVuIHVzZXJzcGFjZSBj
YWxscyBLVk1fSEFTX0RFVklDRV9BVFRSIGlvY3RsIG9uIGFuCj4gQUlBIElNU0lDIGRldmljZSBi
ZWZvcmUgdGhlIElNU0lDIHN0YXRlIGhhcyBiZWVuIGZ1bGx5IGluaXRpYWxpemVkCj4gZm9yIGEg
dmNwdS4KPgo+IFRoZSBjcmFzaCBtYW5pZmVzdHMgYXM6Cj4gICBVbmFibGUgdG8gaGFuZGxlIGtl
cm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJlc3MKPiAgIGRmZmZmZmZmMDAwMDAw
MDEKPiAgIC4uLgo+ICAgZXBjIDoga3ZtX3Jpc2N2X2FpYV9pbXNpY19oYXNfYXR0cisweDQ2NC8w
eDUwZQo+ICAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmM6OTk4Cj4gICAuLi4KPiAgIGt2bV9y
aXNjdl9haWFfaW1zaWNfaGFzX2F0dHIrMHg0NjQvMHg1MGUgYXJjaC9yaXNjdi9rdm0vYWlhX2lt
c2ljLmM6OTk4Cj4gICBhaWFfaGFzX2F0dHIrMHgxMjgvMHgyYmMgYXJjaC9yaXNjdi9rdm0vYWlh
X2RldmljZS5jOjQ3MQo+ICAga3ZtX2RldmljZV9pb2N0bF9hdHRyIHZpcnQva3ZtL2t2bV9tYWlu
LmM6NDcyMiBbaW5saW5lXQo+ICAga3ZtX2RldmljZV9pb2N0bCsweDI5Ni8weDM3NCB2aXJ0L2t2
bS9rdm1fbWFpbi5jOjQ3MzkKPiAgIC4uLgo+Cj4gVGhlIGZpeCBhZGRzIGEgY2hlY2sgdG8gcmV0
dXJuIC1FTk9ERVYgaWYgaW1zaWNfc3RhdGUgaXMgTlVMTCwgd2hpY2gKPiBpcyBjb25zaXN0ZW50
IHdpdGggb3RoZXIgZXJyb3IgaGFuZGxpbmcgaW4gdGhlIGZ1bmN0aW9uIGFuZCBwcmV2ZW50cwo+
IHRoZSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2UuCj4KPiBSZXByb2R1Y2VyIGFuZCBkZXRhaWxl
ZCBhbmFseXNpcyBhdmFpbGFibGUgYXQ6Cj4gaHR0cHM6Ly9naXRodWIuY29tL2oxYWthaS90ZW1w
L3RyZWUvbWFpbi8yMDI2MDEyNQoKTm8gbmVlZCBmb3IgYSBsaW5rIHRvIHlvdXIgcGVyc29uYWwg
cmVwbyBvdmVyIGhlcmUuCgpQbGVhc2UgYWRkIEZpeGVzIHRhZyBoZXJlLgoKPgo+IFNpZ25lZC1v
ZmYtYnk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFjLmNuPgoKT3RoZXJ3aXNlLCBM
R1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdh
cmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyB8IDMgKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXgg
ZTU5N2U4NjQ5MWMzYi4uOWM1OGE2NjA2ODQ0NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2
bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTk5
NSw2ICs5OTUsOSBAQCBpbnQga3ZtX3Jpc2N2X2FpYV9pbXNpY19oYXNfYXR0cihzdHJ1Y3Qga3Zt
ICprdm0sIHVuc2lnbmVkIGxvbmcgdHlwZSkKPgo+ICAgICAgICAgaXNlbCA9IEtWTV9ERVZfUklT
Q1ZfQUlBX0lNU0lDX0dFVF9JU0VMKHR5cGUpOwo+ICAgICAgICAgaW1zaWMgPSB2Y3B1LT5hcmNo
LmFpYV9jb250ZXh0Lmltc2ljX3N0YXRlOwo+ICsgICAgICAgaWYgKCFpbXNpYykKPiArICAgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gKwo+ICAgICAgICAgcmV0dXJuIGltc2ljX21yaWZf
aXNlbF9jaGVjayhpbXNpYy0+bnJfZWl4LCBpc2VsKTsKPiAgfQo+Cj4gLS0KPiAyLjM0LjEKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
