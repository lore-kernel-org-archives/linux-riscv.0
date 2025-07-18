Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC60C83F17
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jul 2025 08:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z35hYC5CXwoIO9gHNLncrAVEQYDN4NkQQOON0ZXJ0mA=; b=3D2nTCheCITmhb
	0yQqDLqpn4wAXWHP5lee8+SeVqNpQ9PcZuEERAdJiS/dP7pNHniKqdW/nUkHF6zPazRaRXqmGvEvt
	G971Tw8ktdEn7EmRbviEAkOStDMdY/Ar/PCP1wvGLEsIrXWRCDyflLwW8NBFeKitOdnV3ITsJ0MQd
	hfUo25+ZVZwr4BIl3xzMYSWBfCenq2SPu+VHi+hNK6kMiSNTHDb9+c1/bEPUQCEGnBeXjKcBxwzKl
	M9m/0kTHC7V4wKU/MlZP5qHpyl02e5trp/SLnwzsg2jY+Pru/tT4WbopxClN6YcQGuNIJpUUmmzk3
	xpibOu0FCd94LNKV3OiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgBr-0000000BzDr-1mP2;
	Fri, 18 Jul 2025 08:11:35 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg6J-0000000ByE2-42c5;
	Fri, 18 Jul 2025 08:05:53 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32f1df5703aso14019161fa.3;
        Fri, 18 Jul 2025 01:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752825950; x=1753430750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mE5OlSABnLgWhYl6SAq4PjOG8cGD+M3libfM2kaqTAg=;
        b=BwcolQ7jtJSgBy4JsRFBMH6ncjbERIoHm8OLkxZqJoONSKlrAMPC7L6nK2VJRfR9FQ
         UvRux2FrkAAfbqjZdv5FJBNBSiz5YNeocFu+yiG/RxeUvApGgwIdjEzFPppHIDOkA9nE
         UwHZVwxsP9IWm47Rt5Eiw2nj0I1MDeruk/vohMtdlK75VLDYZOo7nQ2MebwekXSPL/DX
         6xpcHmIyTZGNNUrVJrcW9VSGubBv9KfttJ0Nv8FS6h0zdxxQo64qaAd8pvCaub0j8b2H
         xc3I4tiJMSfBMnsyH20/SECzvpx6g5l0/WjyVMHQt8kraSh/UNJA5nuefB6VUxuPlQn4
         DVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825950; x=1753430750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mE5OlSABnLgWhYl6SAq4PjOG8cGD+M3libfM2kaqTAg=;
        b=CmHgXexbXscSkzZkJxPs7lZ9Ow5eH18Ii0hnMhYuYax/3wwcnllez3LKRzCg19toxe
         yNLC/YIhkuAgHL0KL79mzdLJ8OY8iEmgXuJf4MEbuBgnneffr2dK9mlcUm4BYNjiJV/K
         UewsruNPqRTbSxSIBbUIdF7S2Z9Hjsg5Ca0hwkdAWJf0DXN7O6NOEQb5Dlbzn2+o53Sp
         9KvXmp2rPfwiwl9ZhPEssAGV6KO8M0voDHQ7Yjhic17twdnrQqowC/xIGt6I7V4ICmGv
         iZifTkCQFON1BeIKOCub5usXGsTm0HIWPtGXYbG9hzfuOtQ1qTgCLTqoH7b1AlOjnhYA
         ZiGg==
X-Forwarded-Encrypted: i=1; AJvYcCUz+E5ZwDvXGPFXIiuMPzi9l2UhcwtnSacrkQnV3ATV6B59mfS/NyxPlQ71dglRXkPqT0RfVm0SZpzrvQ==@lists.infradead.org, AJvYcCVXGj6cMOnBpHHCO2CFx8h8GSwIBEk2hI8iOhiJw1WNp55jHIEzM+nygC+c0Q9R81fzea+wiNJmn3I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwURMlScTdxwFD/Di0k89rq7bUExBBM0HRs8bkwWWM3lhlW/xRN
	WC8OPYzARMwkLf06RvB9OEsbEW5giMicHEx7n5GRwdRgItfkNyNmHchqMBqE6vON8AwXCZJL54w
	LHDK06i2yx3vtMnLka4ovPvBfAiGV6cc=
X-Gm-Gg: ASbGncvUugFrnPyFu7s8jX1ZUgVODc4p2KIY14EKXr3KMBMiq5CLr/oQvUnzgm/Lrc6
	ppoQ/Pe0GKdPv33qGbECHOMa/2BlWjU7jIE+SP5ucDYaAyPZ2sliGmIp+ptHUp3tW4fYlEwGBPp
	sbDFTkyqP/6+JEjx43YpkVznlGJc+4ZD5vgpR1NY8gfa8/JOeqcijdjbMapK5OhF8W8oyHd+AmV
	HQEnec=
X-Google-Smtp-Source: AGHT+IHyLMKDBrDr7Srvy/Ikd0HaWMaoK7ylFo11Rc1uD9JBuJ8oBsq1gin5zNroA8IEeJqMbuI/vDPTs3/MNmSKtdw=
X-Received: by 2002:a2e:80d4:0:b0:32b:755e:6cd7 with SMTP id
 38308e7fff4ca-3308e56e179mr28488571fa.32.1752825949700; Fri, 18 Jul 2025
 01:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250717142732.292822-1-snovitoll@gmail.com> <20250717142732.292822-2-snovitoll@gmail.com>
 <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
In-Reply-To: <20250717151048.bb6124bea54a31cd2b41faaf@linux-foundation.org>
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Date: Fri, 18 Jul 2025 13:05:32 +0500
X-Gm-Features: Ac12FXz9YqNA1eFVik-g2DCaFm9kQISkxpcsj01QS2Zo6EkvjPY09aiUDIQMxqs
Message-ID: <CACzwLxgyd9yd3ah=LK93Bn7SwAy7H1Hhi=ncFzZYUs+6YGEqvg@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN option
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com, 
	agordeev@linux.ibm.com, ryabinin.a.a@gmail.com, glider@google.com, 
	dvyukov@google.com, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-mm@kvack.org, 
	Peter Zijlstra <peterz@infradead.org>, Johannes Berg <johannes@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_010552_003135_169B93DE 
X-CRM114-Status: GOOD (  18.04  )
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

T24gRnJpLCBKdWwgMTgsIDIwMjUgYXQgMzoxMOKAr0FNIEFuZHJldyBNb3J0b24gPGFrcG1AbGlu
dXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAxNyBKdWwgMjAyNSAxOToyNzoy
MSArMDUwMCBTYWJ5cnpoYW4gVGFzYm9sYXRvdiA8c25vdml0b2xsQGdtYWlsLmNvbT4gd3JvdGU6
Cj4KPiA+IEludHJvZHVjZSBDT05GSUdfQVJDSF9ERUZFUl9LQVNBTiB0byBpZGVudGlmeSBhcmNo
aXRlY3R1cmVzIHRoYXQgbmVlZAo+ID4gdG8gZGVmZXIgS0FTQU4gaW5pdGlhbGl6YXRpb24gdW50
aWwgc2hhZG93IG1lbW9yeSBpcyBwcm9wZXJseSBzZXQgdXAuCj4gPgo+ID4gU29tZSBhcmNoaXRl
Y3R1cmVzIChsaWtlIFBvd2VyUEMgd2l0aCByYWRpeCBNTVUpIG5lZWQgdG8gc2V0IHVwIHRoZWly
Cj4gPiBzaGFkb3cgbWVtb3J5IG1hcHBpbmdzIGJlZm9yZSBLQVNBTiBjYW4gYmUgc2FmZWx5IGVu
YWJsZWQsIHdoaWxlIG90aGVycwo+ID4gKGxpa2UgczM5MCwgeDg2LCBhcm0pIGNhbiBlbmFibGUg
S0FTQU4gbXVjaCBlYXJsaWVyIG9yIGV2ZW4gZnJvbSB0aGUKPiA+IGJlZ2lubmluZy4KPiA+Cj4g
PiBUaGlzIG9wdGlvbiBhbGxvd3MgdXMgdG86Cj4gPiAxLiBVc2Ugc3RhdGljIGtleXMgb25seSB3
aGVyZSBuZWVkZWQgKGF2b2lkaW5nIG92ZXJoZWFkKQo+ID4gMi4gVXNlIGNvbXBpbGUtdGltZSBj
b25zdGFudHMgZm9yIGFyY2ggdGhhdCBkb24ndCBuZWVkIHJ1bnRpbWUgY2hlY2tzCj4gPiAzLiBN
YWludGFpbiBvcHRpbWFsIHBlcmZvcm1hbmNlIGZvciBib3RoIHNjZW5hcmlvcwo+ID4KPiA+IEFy
Y2hpdGVjdHVyZXMgdGhhdCBuZWVkIGRlZmVycmVkIEtBU0FOIHNob3VsZCBzZWxlY3QgdGhpcyBv
cHRpb24uCj4gPiBBcmNoaXRlY3R1cmVzIHRoYXQgY2FuIGVuYWJsZSBLQVNBTiBlYXJseSB3aWxs
IGdldCBjb21waWxlLXRpbWUKPiA+IG9wdGltaXphdGlvbnMgaW5zdGVhZCBvZiBydW50aW1lIGNo
ZWNrcy4KPgo+IExvb2tzIG5pY2UgYW5kIGFwcGVhcnMgcXVpdGUgbWF0dXJlLiAgSSdtIHJlbHVj
dGFudCB0byBhZGQgaXQgdG8gbW0uZ2l0Cj4gZHVyaW5nIC1yYzYsIGVzcGVjaWFsbHkgZ2l2ZW4g
dGhlIGxhY2sgb2YgZm9ybWFsIHJldmlldyBhbmQgYWNrIHRhZ3MuCj4KPiBCdXQgYnV0IGJ1dCwg
dGhhdCdzIHdoYXQgdGhlIG1tLW5ldyBicmFuY2ggaXMgZm9yLiAgSSBndWVzcyBJJ2xsIGFkZCBp
dAo+IHRvIGdldCBzb21lIGFkZGl0aW9uYWwgZXhwb3N1cmUsIGJ1dCB3aGV0aGVyIEknbGwgYWR2
YW5jZSBpdCBpbnRvCj4gbW0tdW5zdGFibGUvbGludXgtbmV4dCBmb3IgdGhpcyBjeWNsZSBpcyB1
bmNsZWFyLgo+Cj4gV2hhdCBkbyB5b3UgKGFuZCBvdGhlcnMpIHRoaW5rPwoKVGhhbmtzIGZvciB0
aGUgcG9zaXRpdmUgZmVlZGJhY2shCkFkZGluZyBpdCB0byBtbS1uZXcgZm9yIGFkZGl0aW9uYWwg
ZXhwb3N1cmUgd291bGQgYmUgZ3JlYXQuCkdpdmVuIHRoZSBjb21wbGV4aXR5IG9mIHRoaXMgY3Jv
c3MtYXJjaGl0ZWN0dXJlIGNoYW5nZSwKSSB0aGluayBvZiB0YWtpbmcgdGhlIGNvbnNlcnZhdGl2
ZSBhcHByb2FjaCBvZjoKMS4gbW0tbmV3IGJyYW5jaCBmb3IgZXhwb3N1cmUgYW5kIHJldmlldyBj
b2xsZWN0aW9uCjIuIEFkdmFuY2luZyB0byBtbS11bnN0YWJsZS9saW51eC1uZXh0IG9ubHkgYWZ0
ZXIgd2UgZ2V0IHByb3BlciBhY2tzIGZyb20KICAgIEtBU0FOIG1haW50YWluZXJzL3Jldmlld2Vy
cywgYXQgbGVhc3QuCgpUaGUgc2VyaWVzIGhhcyBiZWVuIHRob3JvdWdobHkgdGVzdGVkIGJ5IG1l
IC0gY29tcGlsZWQgYWxsIGFmZmVjdGVkIGFyY2ggYW5kCnJhbiBRRU1VIG9uIGFybTY0LCB4ODYg
d2l0aCBLVW5pdHMuCgorIEZvcmdvdCB0byBhZGQgaW4gQ0MgSm9oYW5uZXMgQmVyZywgUGV0ZXIg
WmlqbHN0cmEgd2hvIGNvbW1lbnRlZCBpbiB2MS4KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
LzIwMjUwNjI1MDk1MjI0LjExODY3OS0xLXNub3ZpdG9sbEBnbWFpbC5jb20vCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
