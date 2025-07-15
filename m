Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EBDC83F1D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAW5bfapMqGgYQcBenEzQcSEVyEIsF6Sc+TqIENzmX0=; b=nnsIjJ2Hsg0JgA
	9yqSh0fKbcxkZH4HZ7NCs/jBIOxf4l0y01YIr/jZ+dftZSOhnY9+g27DFgCc3pInxbA5mBI0CIqSV
	3HMUb/mRRFXmkCgRLZxALAxuh+S4+LSIn7B5T1KT8EtsnYrPexdVbkxJl7DjfzyOowPFkd7CkngJE
	6U1MMlOCxhmJdJmBA0REOaEPBzqM4aMxFv8v+pOiEbgY1orVusx5TqEczJaOZnCKVFsR6qKeC1sdc
	19IiN4ErJCapebgnC+5Ni8c1iXlz/+SafRwBx4NlQpEOZkV+FrPormwJUzsYaPkWf9If/YXwEYOKq
	qK6N79YR44vLIvEBDZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdPA-00000004srS-1fYO;
	Tue, 15 Jul 2025 11:01:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdNt-00000004sfy-2pBr
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 10:59:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45629703011so2560935e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752577180; x=1753181980; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=toCJyDKQNk5HbhRNwLuMhsfzyo6mnXy56DMD8XUxftA=;
        b=HDCQGNjoVlcAvFc6YRyY31xWSTXZ+kYre9/lDrTBZ/fLmEOvy7y3UGNvtkoDbu+e06
         TYQOvpqdd421eTT+1cog0bWabV7vcGbYmb0QxJtgixSArjaXlW3or+iRqX76w4ax7y6e
         dHTajwir5s2WXxYifSNIqzawjCOXEZo1apPVqtyM/aSolYEgByUS3XQ1L+Rn/22OYXJ6
         iugLlSWhSmvLodIbqPmrCh8N2vDYyns1+wKWTxAEVI+z+bOshS5uEbDy9eqYrI/CWFLm
         MDPkya0RgY1H0H/BkMeAlUkzmVmTuHXivwhZqRgwD5DIPfLu7IGUIEmIstpV34gDNtgF
         +Jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577180; x=1753181980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=toCJyDKQNk5HbhRNwLuMhsfzyo6mnXy56DMD8XUxftA=;
        b=uSpuYE3atKwvxM8Uv4oYOqKQoZhE73ZmQqqZFFAo6lmECqt4ITvHVWzV2KzoGkS5FY
         U7u6ThfUQbw3jvaDCpFrCzziS0MCI2WkYQYvvwSx9C1Li1ELk1ZKM+RNp4tV6kjvSi2d
         U6Oz3w8+JC985O9SRstUBRV58YgNENooI+LJvL7TcKO0LB5gC0UgLJKGxJQHCi0iTVWs
         5Tt/KZ9QjaiSu4dyGyaMAEEq6/SE5eFRdX3fzoqeM3x6LPDL8eTEQpLWvbvSdmAfGUea
         ZZ1AaRH34WvqLIqWVVvXY/lshuiGcUtNBT/DB8yYuXKLmnnk23fF5+Mr5r1speTef4+G
         nmjg==
X-Gm-Message-State: AOJu0YyyvkRar3lBZdBIaMs8U0PBHEOIIzwaOiok4B5/e019fHuhrvW7
	mp0x33jYiJXd9TioxZYO1Yd/5LnHDctolNo/LT6QVFfej4wMSaX/C9FjYFsFFkGvLYE=
X-Gm-Gg: ASbGncsQcXJV6vFVt+6IkzaLxblnCyU1zAARmdMh+BwomHVQBSGDi9FBzGK8+BgTLPy
	gLCqAhlVkuZ/ZecunZZr7hg5hZGPg/JsUDE6gR+nkDXbhdIlRI6bbSn11+TkOmRwW5w5l6zBIgh
	JZtjr0l8KjuSGwZfoimVU2HCqlcc45JL0h3/9AXZ96+KDZwRcBdt/QmU5+MiHH824NLE2jpnGcg
	qnvN7bdoNWwMmyxL4LEYou9T59UwwXrkHUqbMKtwxgTncHP9VdyR2xbLmpCKCv21TERPkJGxba3
	DOV9ujZ/pnTIHIi7zDjVdeHr1goZNmpKJ0lAropS6Hic+xkPeeDRTPUa5UZgf2HYvga+rgE9NYY
	DwP1c7K08l+3tSM+Nh8SHyOoyisB6U91AU/SC6kWT6W9A4xBml2t+pohCPgqF
X-Google-Smtp-Source: AGHT+IH9yNop1DNzjKnyhvWDzas7yapCZPG85Uz0SgzV9JDeFte7MdK67izXkmMUDo23mW7w8RaLRA==
X-Received: by 2002:a05:600c:a308:b0:455:fab4:4b80 with SMTP id 5b1f17b1804b1-455fab44c03mr92497205e9.19.1752577179889;
        Tue, 15 Jul 2025 03:59:39 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562797b8d2sm15984945e9.8.2025.07.15.03.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 03:59:39 -0700 (PDT)
Date: Tue, 15 Jul 2025 12:59:37 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Jesse Taube <mr.bossman075@gmail.com>
Subject: Re: [PATCH v6] clocksource/drivers/timer-clint: Add T-Head C9xx clint
Message-ID: <aHY0mWEx8_z_nJoU@mai.linaro.org>
References: <20250623231536.1120282-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623231536.1120282-1-Mr.Bossman075@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_035941_718323_763AD1E2 
X-CRM114-Status: GOOD (  21.12  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMDc6MTU6MzZQTSAtMDQwMCwgSmVzc2UgVGF1YmUgd3Jv
dGU6Cj4gRnJvbTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IAo+IFRvIHVz
ZSB0aGUgVC1IRUFEIEM5eHggY2xpbnQgaW4gUklTQ1YtTSBOT01NVSBlbnYsIHdlIG5lZWQgdG8g
dGFrZQo+IGNhcmUgdHdvIHBvaW50czoKPiAKPiAxLlRoZSBtdGltZWNtcCBpbiBULUhlYWQgQzl4
eCBjbGludCBvbmx5IHN1cHBvcnRzIDMyYml0IHJlYWQvd3JpdGUsCj4gaW1wbGVtZW50IHN1Y2gg
c3VwcG9ydC4KPiAKPiAyLiBBcyBwb2ludGVkIG91dCBieSBjb21taXQgY2E3ODEwYWVjZGJhICgi
bGliOiB1dGlscy90aW1lcjogbXRpbWVyOgo+IGFkZCBhIHF1aXJrIGZvciBsYWNraW5nIG10aW1l
IHJlZ2lzdGVyIikgb2Ygb3BlbnNiaToKPiAKPiAiVC1IZWFkIGRldmVsb3BlcnMgc3VyZWx5IGhh
dmUgYSBkaWZmZXJlbnQgdW5kZXJzdGFuZGluZyBvZiB0aW1lIENTUiBhbmQKPiBDTElOVCdzIG10
aW1lIHJlZ2lzdGVyIHdpdGggU2lGaXZlIG9uZXMsIHRoYXQgdGhleSBkaWQgbm90IGltcGxlbWVu
dAo+IHRoZSBtdGltZSByZWdpc3RlciBhdCBhbGwgLS0gYXMgc2hvd24gaW4gb3BlbkM5MDYgc291
cmNlIGNvZGUsIHRoZWlyCj4gdGltZSBDU1IgdmFsdWUgaXMganVzdCBleHBvc2VkIGF0IHRoZSB0
b3Agb2YgdGhlaXIgcHJvY2Vzc29yIElQIGJsb2NrCj4gYW5kIGV4cGVjdHMgYW4gZXh0ZXJuYWwg
Y29udGlub3VzIGNvdW50ZXIsIHdoaWNoIG1ha2VzIGl0IG5vdAo+IG92ZXJyaWRlYWJsZSwgYW5k
IHRodXMgbXRpbWUgcmVnaXN0ZXIgaXMgbm90IGltcGxlbWVudGVkLCBldmVuIG5vdCBmb3IKPiBy
ZWFkaW5nLiBIb3dldmVyLCBpZiBDTElOVEVFIGlzIG5vdCBlbmFibGVkIGluIFQtSGVhZCdzIE1Y
U1RBVFVTCj4gZXh0ZW5kZWQgQ1NSLCB0aGVzZSBzeXN0ZW1zIHN0aWxsIHJlbHkgb24gdGhlIG10
aW1lY21wIHJlZ2lzdGVycyB0bwo+IGdlbmVyYXRlIHRpbWVyIGludGVycnVwdHMuIFRoaXMgbWFr
ZXMgaXQgbmVjZXNzYXJ5IHRvIGltcGxlbWVudCBULUhlYWQKPiBDOXh4IENMSU5UIHN1cHBvcnQg
aW4gT3BlblNCSSBNVElNRVIgZHJpdmVyLCB3aGljaCBza2lwcyBpbXBsZW1lbnRpbmcKPiByZWFk
aW5nIG10aW1lIHJlZ2lzdGVyIGFuZCBmYWxscyBiYWNrIHRvIGRlZmF1bHQgY29kZSB0aGF0IHJl
YWRzIHRpbWUKPiBDU1IuIgo+IAo+IFNvLCB3ZSBuZWVkIHRvIGZhbGwgYmFjayB0byByZWFkIHRp
bWUgQ1NSIGluc3RlYWQgb2YgbXRpbWUgcmVnaXN0ZXIuCj4gQWRkIHJpc2N2X2Nzcl90aW1lX2F2
YWlsYWJsZSBzdGF0aWMga2V5IGZvciB0aGlzIHB1cnBvc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEplc3Nl
IFRhdWJlIDxNci5Cb3NzbWFuMDc1QGdtYWlsLmNvbT4KPiAtLS0KPiBUcmVhdCB0aGlzIGFzIGEg
Y29tcGxldGVseSBuZXcgcGF0Y2gsIGFzIGl0IGlzIG1vc3RseSByZXdyaXR0ZW4uCgpbIC4uLiBd
Cgo+IFY1IC0+IFY2Ogo+ICAtIEFkZCBjc3JfY2xvY2tfbmV4dF9ldmVudAo+ICAtIEFkZCBjc3Jf
Z2V0X2N5Y2xlczY0IHRvIHNjaGVkX2Nsb2NrX3JlZ2lzdGVyCj4gIC0gQnJlYWsgZ2V0X2N5Y2xl
czY0IGludG8gY3NyX2dldF9jeWNsZXM2NCBhbmQgY2xpbnRfZ2V0X2N5Y2xlczY0Cj4gIC0gQ2hh
bmdlIGRlZmF1bHQgYmVoYXZpb3IgdG8gdXNlIENTUiB0aW1lIHJlZ2lzdGVyCgpbIC4uLiBdCgpB
bnkgY29tbWVudHMgZm9yIHRoZXNlIGNoYW5nZXMgZnJvbSB0aGUgYXJjaCBtYWludGFpbmVyID8K
ClRoYW5rcwoKLS0gCgogPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8v
d3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVy
LmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFy
by1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
