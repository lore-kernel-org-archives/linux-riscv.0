Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23916D3CC88
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 01:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDhtapS2S0TfiK5SpJA/wIVJYvaXeY5PtoWw5KOd5JQ=; b=BZzxxWvrNqFr+V
	8MCs27jWsrYSTrBpALemP+Gry8iRGcofbUnLa43kLdo+hbd8NkRNyrfomJLpAhNVPeQa+l56TbP85
	oBjYnvZAMEgwND9wx8JxXNFj78/vDTnIh6Twml/Px54JuUJxDm/AUjzQIa9TZWEpAUVq3AOETB1n2
	DkYgzbEf2I7S21+b475CxYe5v2K2Eb/HpAHgNleIQwpYcoLvr4yFQyrGmyUV0R8XrjA2S2Qm9jDCl
	s5hjdNOzxJA+I1YHbSdBI4kGj82NgEpM+Lky547eJ58lrujmbqkdHcQyFNp1G5nOxQYFl4yJaIl+r
	zCl0iXmGLSnvDKOkv/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBtV-0000000BLN8-0qez;
	Thu, 15 Jan 2026 01:11:25 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBtS-0000000BLLp-04k3
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 01:11:23 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-56373f07265so338949e0c.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 17:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768439480; x=1769044280; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWEmSPSV/4aq+tGwuGvE1EWZPGM77eZ+/59U3WROy80=;
        b=Wf/A7vaWJM8HAYuoQjVdVfhmeoKcT/UcbojvZo4X68FF14Qpqk9jM3fApBIHe9S/x6
         zdoEGMP4eg/IHp/Y2vV4O2gqQYtT44EARE7rb+TXmMTW+JcJ1wNLAFmOBghISbpTkGPb
         Zp+MeBYjeyx7G5rabxi1Y9aoZHjUGyqgWlGFuAcVPB+dNiXiuCv1jXwf9HMmvCXZc5x5
         vFDMU6BlHLruN2fOqQ03M6jF3MzWjddWAAqw+cV5W9hsBld+qTdt2MFf3fLUffZcYKRd
         mmVKgZ/BWi4durXb4gV/JyXcWlZWvYvOjPwJ99fY+VyOSND5jXlCCqotFHCBiXpdIkw4
         Y8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768439480; x=1769044280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWEmSPSV/4aq+tGwuGvE1EWZPGM77eZ+/59U3WROy80=;
        b=H5PtQLqS+8jbDQyL/8iOms3a7YcxlXoLXkTnVj8Q1byQL0PCVOElrH/XB/rriENH8h
         WHDSAfOPb4/Bm/nXK8s9jSSKuXELusxDjJBvo2XjNtMZksVTI+hdfPAg/tryaY/0nKiq
         MNl0M+qnKtcLyvJnAkgqlROjPX+D7K14cnDZ0hZBNh4hsqwbtRqBK69VIDH+mwbENVn4
         14IM+1yHdjYja15tkH68qcR9pCqMyDUMqeIodiKODnR1uehLdPEzGhQ3+qljl2nbQjSB
         FQ2hEpdMcwg725D5wW9L0kcIQiQYNHNr9dXQBsK3i3cBpUXcv5B2OgrW4657BALyQA5I
         M0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCV29LFuc6RHt4+z95jOtSlVM8qkKZCbppg5vOdxGpwSLi8cHTxV17Bd+b+yM0dHh1K2OCWsxNqqKO+Bvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYC6CI8zgJD3YFterPSEwpPd5k0lKsaykUrQ5ys6SlbslvCBYW
	W8BKHnP78RKYHKY0eyLuedS9fO+ATW7GVIBKhJajcjr3U9JiFhLiOtJkJ9chx//6apyll3ylgNx
	l00YSS2gdwgBZ3tsvHMPisRcBaUxDse0=
X-Gm-Gg: AY/fxX7OLsYdq1Mef7Ilrj597s6+L11tHNUVirVFp8q/9NAMgqpT8zzIc2Ewu1sSOuX
	uAY0sYicF7iPu6SXStkc9XzMXWH/vJyHbxmFHHdl7R2Jmo+mNRNqJxRuIHvpvf59SZwHoW4NaGt
	bZ6E5RJFrwxLSpwdtZkT1cPQNvjRDCszY/iOaeewt/gpp5LBCrwQpFwfWtN5HLB+HFpw3rlBOCt
	GSJMJplo/EvENHnPUZoGEiuN3A6On3Sq5FwQ8yTVVEHbZjy9JDroTf9h/qUeRTcTg6BRK6Vvw==
X-Received: by 2002:a05:6102:26d3:b0:5db:f615:1821 with SMTP id
 ada2fe7eead31-5f1838c16bamr1746719137.10.1768439478555; Wed, 14 Jan 2026
 17:11:18 -0800 (PST)
MIME-Version: 1.0
References: <20260104135938.524-1-naohiko.shimizu@gmail.com> <10a102b9-1dd1-c5ca-66e4-f02794a84a93@kernel.org>
In-Reply-To: <10a102b9-1dd1-c5ca-66e4-f02794a84a93@kernel.org>
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
Date: Thu, 15 Jan 2026 10:11:09 +0900
X-Gm-Features: AZwV_QgNY9cbiPSf-Pg_buhTiH9o3_E8wCotzHaSqbEA_BVUDA10Wv_icM50ON8
Message-ID: <CAA7_YY-3iVLzBJgntPkzMBZFe=uwQnkYUfJzW7rZ-i=Rw5sUKQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] riscv: fix timer update hazards on RV32
To: Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	anup@brainfault.org, atish.patra@linux.dev, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, nick.hu@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_171122_062495_86A22299 
X-CRM114-Status: GOOD (  14.23  )
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

VGhhbmsgeW91IHZlcnkgbXVjaCwgUGF1bC4KSSByZWFsbHkgYXBwcmVjaWF0ZSB5b3VyIHF1aWNr
IGhhbmRsaW5nLgoKTmFvaGlrbwoKT24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgOTozOeKAr0FNIFBh
dWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgNCBKYW4gMjAy
NiwgTmFvaGlrbyBTaGltaXp1IHdyb3RlOgo+Cj4gPiBUaGlzIHBhdGNoIHNlcmllcyBmaXhlcyB0
aW1lciByZWdpc3RlciB1cGRhdGUgaGF6YXJkcyBvbiBSVjMyIGZvcgo+ID4gY2xvY2tzb3VyY2Us
IEtWTSwgYW5kIHN1c3BlbmQvcmVzdW1lIHBhdGhzIGJ5IGFkb3B0aW5nIHRoZSAzLXN0ZXAKPiA+
IHVwZGF0ZSBzZXF1ZW5jZSByZWNvbW1lbmRlZCBieSB0aGUgUklTQy1WIFByaXZpbGVnZWQgU3Bl
Y2lmaWNhdGlvbi4KPiA+Cj4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gLSBEcm9wcGVkIHJlZHVuZGFu
dCBzdWJqZWN0IGxpbmUgZnJvbSBjb21taXQgZGVzY3JpcHRpb25zLgo+ID4gLSBBZGRlZCBGaXhl
cyB0YWdzIGZvciBhbGwgcGF0Y2hlcy4KPiA+IC0gTW92ZWQgU2lnbmVkLW9mZi1ieSB0YWdzIHRv
IHRoZSBlbmQgb2YgY29tbWl0IG1lc3NhZ2VzLgo+ID4KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAt
IEFkZGVkIGRldGFpbGVkIGFyY2hpdGVjdHVyYWwgYmFja2dyb3VuZCB0byBjb21taXQgbWVzc2Fn
ZXMuCj4gPiAtIEFkZGVkIEtWTSBhbmQgc3VzcGVuZC9yZXN1bWUgY2FzZXMuCj4gPgo+ID4gTmFv
aGlrbyBTaGltaXp1ICgzKToKPiA+ICAgcmlzY3Y6IGNsb2Nrc291cmNlOiBGaXggc3RpbWVjbXAg
dXBkYXRlIGhhemFyZCBvbiBSVjMyCj4gPiAgIHJpc2N2OiBrdm06IEZpeCB2c3RpbWVjbXAgdXBk
YXRlIGhhemFyZCBvbiBSVjMyCj4gPiAgIHJpc2N2OiBzdXNwZW5kOiBGaXggc3RpbWVjbXAgdXBk
YXRlIGhhemFyZCBvbiBSVjMyCj4gPgo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYyAg
ICAgICB8IDMgKystCj4gPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV90aW1lci5jICAgICAgIHwgNiAr
KysrLS0KPiA+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCAzICsrLQo+ID4g
IDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gVGhh
bmtzLCBxdWV1ZWQgZm9yIHY2LjE5LXJjLgo+Cj4KPiAtIFBhdWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
