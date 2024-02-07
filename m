Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F661C4828D
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 13:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pnalp4wRaGi6hv83oLs9dQVXf1HrnFCdXFvcUVpfJA0=; b=frdsePi4dTr52Y
	JUqhGbfFumUlRM0ESttMJsW+RrpSoBwAeQ167LtxgK8dxMLqPj6UG7bUkbxBU1fudfaY3OPkevakG
	BpJTs+sEShwl+1f8vbkRELMUsQfABj4E0z3bSI4oVR0JlDa9GnVVixIKhcq5ycRwRBm2syp3Hp2xy
	GAkl/2EkQIQxPfl+w8wjl63Ui1bjj+CGImx2eRMyNNS2NdUsMglDu0oVECkqP3QELgFONuD2urcjz
	eSwYglbJHDbk5mVgU3zrB/tBSR99iYxxGDdZcF+HN/LtzY4TtRx2hBIZpXkWfaRWmEVSJSoz3rUlB
	Cq2w4xKOIZgkVPaI45gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXhfy-0000000Ai1Z-2Pti;
	Wed, 07 Feb 2024 13:09:18 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXhfv-0000000Ahza-0I9J
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 13:09:16 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2cf4d2175b2so7149851fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Feb 2024 05:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707311352; x=1707916152; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00E6HIe11CgAo2O0miczqRLxo0ZJcS0ae2ZwIYvBsds=;
        b=UyuXiuV7tJqVNwLG1DP9ZpXI/Pb0uL8WC0ufhi/vBydoDdmWJi2soVtb0zn6vjFZ7Q
         LlYYolIOWr4ALz3b5vWVAQmP9ZFE8Gm7q/hJ7T38qixZgY+cINC4AWl7uxvIQlPDQWk+
         Qa0SurzoPGe3beGq0o6LwXM1/STYYvxrO8RFCWkwYCQ4dTSGaOB6aBgm6ga5F3aJlpZk
         sMnDbsUR546s4jbJCjIfqbfsbuXyi3pYoIa7GeSbCSKf0kn/wBVECjTxsYu8+yTq8o8q
         64bPZC76B2oddb4i4613DqgqjzVwD4+KmIR6mb9qHKUJW1CTh6CvfMlSvNO1XC6qgGlG
         OfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707311352; x=1707916152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00E6HIe11CgAo2O0miczqRLxo0ZJcS0ae2ZwIYvBsds=;
        b=mmBegP2a25xgHvpLWQ8vii5iIWZbROubg/rrMpp3B8gnIARBEBsx4zUeWZDEPb2WH5
         7OHKz3oR49LwxUE+fTP+6+hfLarIIkhnks6cRypNEpYRFO6DsGzCVfRREzTmVY+5zIDk
         uDp1KpwtJUIvGyomWrDCuxZkECdu5+CY/a3MHWrJ+5AujK4W2ewV+vZyYI6juxgQUXRZ
         8uHfWGSueQtaFUTwrPcjJ8zFVOd7WBPumj8y5hlQ9KpJHnodudwuAX19lXP6f6ApZZ7L
         AuL3QUhAJw7EWwga2L6rEtLW8HX9JqJRPCEyNHUshLNxcnHYCPFNgUIx6sl0/JPRUILu
         oGSg==
X-Gm-Message-State: AOJu0YyFf71No84SoxMnyUsGcqeRqvts2+wxiEvUlC571C7dl8cxlXIA
	fSpH4AWv6XeQ+2FXNl0HwyE7T99uopWJUR03Afzy+V4R+NetEJo7degdHFM6g+VdJYG6AwTQZU6
	RrkTQPT3upHRRHVOi1ZARIwIH2Yhw7l+n8hpQTA==
X-Google-Smtp-Source: AGHT+IFdqOXB6ghYnKqxixi71HDIVUyBb6K4yLgyQsY8z+jH6b5Dj0DBcg23SVmyQ/HQ0KyJt1aTiAzz+yQw9qYykWI=
X-Received: by 2002:a2e:9ad4:0:b0:2d0:cb23:c719 with SMTP id
 p20-20020a2e9ad4000000b002d0cb23c719mr1085079ljj.13.1707311352050; Wed, 07
 Feb 2024 05:09:12 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <87h6ily53k.fsf@all.your.base.are.belong.to.us> <CAAhSdy2PPjS6++Edh8NkgiBmcovTUjS5oXE2eR5ZwPfAfVA0ng@mail.gmail.com>
 <874jekag3w.fsf@all.your.base.are.belong.to.us> <CAK9=C2XJYTfY4nXWtjK9OP1iXLDXBVF-=mN1SmJDmJ_dO5CohA@mail.gmail.com>
 <87plx8y5s3.fsf@all.your.base.are.belong.to.us> <87sf24mo1g.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87sf24mo1g.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 7 Feb 2024 18:38:59 +0530
Message-ID: <CAK9=C2UiOXS7NE91ykvQHc8h8-DUAUwEuMphwC-df3__zK1dVg@mail.gmail.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_050915_134869_C16A7CBD 
X-CRM114-Status: GOOD (  17.67  )
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

T24gV2VkLCBGZWIgNywgMjAyNCBhdCA2OjI14oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0
ZXM6Cj4KPiA+Pj4gSG1tLCBzZWVtcyBsaWtlIHdlJ3JlIHRhbGtpbmcgcGFzdCBlYWNoIG90aGVy
LCBvciBhdCBsZWFzdCBJIGdldCB0aGUKPiA+Pj4gZmVlbGluZyBJIGNhbid0IGdldCBteSBvcGlu
aW9ucyBvdXQgcmlnaHQuIEknbGwgdHJ5IHRvIGRvIGEgcXVpY2sgUG9DLAo+ID4+PiB0byBzaG93
IHlvdSB3aGF0IEkgbWVhbi4gVGhhdCdzIHByb2JhYmx5IGVhc2llciB0aGFuIGp1c3QgdGFsa2lu
ZyBhYm91dAo+ID4+PiBpdC4gLi4uYW5kIG1heWJlIEknbGwgY29tZSByZWFsaXppbmcgSSdtIGFs
bCB3cm9uZyEKPiA+Pgo+ID4+IEkgc3VnZ2VzdCB0byB3YWl0IGZvciBteSB2MTMgYW5kIHRyeSBz
b21ldGhpbmcgb24gdG9wIG9mIHRoYXQKPiA+PiBvdGhlcndpc2Ugd2UgbWlnaHQgZHVwbGljYXRl
IGVmZm9ydHMuCj4gPgo+ID4gT0shCj4KPiBJIGRpZCBzb21lIHJlYWxseSByb3VnaCBjb2RlIHNr
ZXRjaGluZywgYW5kIEknbSBjb25maWRlbnQgdGhhdCB5b3UgY2FuCj4gZ2V0IHJpZCBvZiBhbGwg
aWRzX2VuYWJsZWRfYml0bWFwLCBod2lycXNfdXNlZF9iaXRtYXAsIGFuZCB0aGUKPiBjb3JyZXNw
b25kaW5nIGZ1bmN0aW9ucy9sb2Nrcy4gSSdkIHNheSBvbmUgbG9jayBpcyBlbm91Z2gsIGFuZCB0
aGUga2V5Cj4gaXMgaGF2aW5nIHRoZSBwZXItY3B1IGltc2ljX2xvY2FsX3ByaXYudmVjdG9ycyBj
aGFuZ2UgZnJvbSBzdHJ1Y3QKPiBpbXNpY192ZWN0b3IgKiB0byBzdHJ1Y3QgaW1zaWNfdmVjdG9y
ICoqLgoKSSBoYXZlIG1hbmFnZWQgdG8gcmVtb3ZlIGh3aXJxc19iaXRtYXAgKGFuZCByZWxhdGVk
IGZ1bmN0aW9uKS4KCk5vdywgSSBhbSB0cnlpbmcgYW5vdGhlciBhcHByb2FjaCB0byBzaW1wbGlm
eSBsb2NraW5nIHVzaW5nIGF0b21pY3MuCgo+Cj4gVXNpbmcgc21wX2NhbGxfZnVuY3Rpb25fc2lu
Z2xlKCkgdG8gSVBJIGVuYWJsZSAoYW5kIGRpc2FibGUgaWYgeW91IGRvbid0Cj4gd2FudCB0byB1
c2UgdGhlIGxhenkgdGltZXIgZGlzYWJsZSBtZWNoYW5pc20pIHNlZW1zIGZlYXNpYmxlIGFzIHdl
bGwhCgpXZSBoYXZlIGludGVudGlvbmFsbHkga2VwdCBzZXBhcmF0ZSB2aXJxIGZvciBzeW5jaHJv
bml6YXRpb24gYmVjYXVzZQp0aGlzIGFsbG93cyB1cyB0byBnYXRoZXIgc3RhdHMgZm9yIGRlYnVn
Z2luZy4gQ2FsbGluZyBzbXBfY2FsbF9mdW5jdGlvbl9zaW5nbGUoKQp3aWxsIG5vdCBhbGxvdyB1
cyB0byBzZXBhcmF0ZWx5IGdhdGhlciBzdGF0cyBmb3Igc3luYyBJUElzLgoKVGhlIHNtcF9jYWxs
X2Z1bmN0aW9uX3NpbmdsZSgpIGV2ZW50dWFsbHkgbGVhZHMgdG8gX19pcGlfc2VuZF9tYXNrKCkK
dmlhIHNlbmRfaXBpX21hc2soKSBpbiBhcmNoL3Jpc2N2IHNvIGRpcmVjdGx5IGNhbGxpbmcgX19p
cGlfc2VuZF9tYXNrKCkKZm9yIHN5bmMgSVBJIGlzIGZhc3Rlci4KCj4KPiAoTGV0IG1lIGtub3cg
aWYgeW91IGRvbid0IGhhdmUgdGhlIHNwYXJlIGN5Y2xlcywgYW5kIEkgY2FuIGhlbHAgb3V0LikK
Pgo+Cj4gQmrDtnJuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
