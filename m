Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D52C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKk4JzClSLCyVg6xX11S0LOUljp14D13w8/mIxaE0a0=; b=eeoPDeFxw6ZDpQ
	uMfORAqkvoKsVkpVPcMBaM47lkb+XEXFJfPoxdt4Leryho8HnpmMiOq1a3uMFkryjcERR055o1z12
	HtzEoiy40j5VAYK6Z5vskfdfBy4estmFEjKEDoEDRjB+iMsqDK6oASBnkQbnfhPv0tBhFdgM68zxT
	dHbEg1lcxiSYpUdrNaA5fhhCbwJgMXKQv/VKru0OmWvIw5goPJnJc0ZoodNZc/WRWMXkU/W26Pbub
	PdAku05GBeNucDtfZ4KYErWOfFxutPz5PtcbQHsR9yH3GqqwnMyl+3dt7Gfjk5l0FbcGOnHRBxLfE
	ZprericJ9Xs+yrtaQtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTfY-00000008Rhv-3mZS;
	Mon, 26 May 2025 08:58:52 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTfW-00000008RgI-0TlE
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 08:58:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442e9c7cf0eso394455e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 01:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748249928; x=1748854728; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7XUa5QDzySuu6U8WB9K8OF+ZIZj9kEnHYCZp+dCaCR0=;
        b=kOcUkirAeqjXT7Fb2zsdmHeIGPaxpNGpgcywJ1oPA13zVh7BcvAOp1b/l+Jkic1j09
         O6OrG/DrRwYbGrPPV91a7qK6EFWauvgPeKL6XGLWdQRYdQbYNXkLScFqQPwnTf2RQMY1
         N1IElwa4BopNDu/068AqZreNu/E25swyzhboHEB9xl9ZO2EJWTSbg0beBjcr+6ypYZw8
         +I3CNueXdU4D//KaUhm2HKxQ9ADtxWyHrg+vKnQcx48JXd+iHEWm1ImCC9H028DLcU+2
         RGG/vfoiAVHesDrj18I+HeE2sz0ga9tj/LE8svxhdL36I+ZV9aPId7j3kn7eTDRO7Fon
         0dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748249928; x=1748854728;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7XUa5QDzySuu6U8WB9K8OF+ZIZj9kEnHYCZp+dCaCR0=;
        b=UXoAi6AayAxlMQFarAF4H+sf0yZMf2+dBNj4P+Ylh+3c3QrMMXBuW9GFfpsFqB80NJ
         FFSB1QmNXng9YbS4VwzfR5sokP34ZUS7Hef/exudZRjHzqPoCd/ya/79FE1D5bI1bJin
         pwbe+ymNR1sjIdsToecZbZWvozd5FbIID0NtaCzXybGeo5v2oHWUk8qBIlsFPARccB87
         +kUBC6gOxpFU+64y9TlvU/+f5lfwX9oF5MEJy67y8OeIbTaMn9xdn1Ee94PBSzy3rzwr
         ztw8aWHS4gjITluIbklNoSjMp8XfnTVFnzGaz+arJkL2Djq3MBxqWny94vUNSOo107k/
         TvnA==
X-Forwarded-Encrypted: i=1; AJvYcCXIC1re3FQ/2vWYR9FAhFumAmKraidoL80O3wwHDcb1bEP2wVvdJzjMuN4W3e8pN+mchlpwSZeCy+K3eA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPfBCozNV/ki8m72CGxb3Q4JKLX+t7BjdW4Lta/BVrFPMhVfu3
	6hedoN4TZQBLsYpF7xt65wqrOB6QeUg39JtpGkblf4NFICsnsE6iEtvQgGc75IVdH2c=
X-Gm-Gg: ASbGncsFbCZKSbGjIvH0r/N0PV9CRNa5MwnTkxLXDt+0U8NWkr6Y0f1m6tBFwb6PfCt
	lpbVN3J2Ys/HbCJcmw/zflb3bpK/0pLSfyGo5bUXj3wmWRfT1z9QGsw8MZsKQz4aX2VG6XO/pAg
	I599QXsbIrkQhN3U7GD8PfSQyN2LmaB6dND1VkiuOfylI6H0y0+2HSTVHKsblMYcCtrapb7R36Q
	dBj+jEmtLmBeDEAyBb3dleYedv/FEFxT/ows1dK7m9fhKSeqz9rKE127mQX9PuXP6/u5LDusv6o
	p30thvSmwR46KM2jvbi4k7ffsZq3bSTcZqkYw2Y7HTRx68zXZCAhXYTVYy8=
X-Google-Smtp-Source: AGHT+IEdx9Lxmxr6Jj4a/VtrbY6n55+AjozaESSFCcKKfyGvvRTO9hEvIbHH5Dnsj/C495VBfSOibw==
X-Received: by 2002:a05:600c:1c24:b0:439:9ec5:dfa with SMTP id 5b1f17b1804b1-44c938cb1e6mr27073595e9.7.1748249927727;
        Mon, 26 May 2025 01:58:47 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b85a:a7d4:fa4e:bb11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d007bbccsm5654781f8f.89.2025.05.26.01.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:58:47 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 26 May 2025 10:58:46 +0200
Message-Id: <DA5YVKW682V3.2DODRY4EDL3IW@ventanamicro.com>
Subject: Re: [PATCH v8 13/14] RISC-V: KVM: add support for FWFT SBI
 extension
Cc: "Samuel Holland" <samuel.holland@sifive.com>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Deepak Gupta" <debug@rivosinc.com>, "Charlie
 Jenkins" <charlie@rivosinc.com>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>,
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Anup
 Patel" <anup@brainfault.org>, "Atish Patra" <atishp@atishpatra.org>, "Shuah
 Khan" <shuah@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-14-cleger@rivosinc.com>
 <DA3K95ZYJ52S.1K6O3LN6WEI0N@ventanamicro.com>
 <9f9e2869-725d-4590-887a-9b0ef091472e@rivosinc.com>
 <DA3OJ7WWUGLT.35AVP0QQDJRZV@ventanamicro.com>
 <5dd587b3-8c04-41d1-b677-5b07266cfec5@linux.dev>
In-Reply-To: <5dd587b3-8c04-41d1-b677-5b07266cfec5@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_015850_144007_38CBCFB9 
X-CRM114-Status: GOOD (  12.10  )
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

MjAyNS0wNS0yM1QxMTowMjoxMS0wNzowMCwgQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4
LmRldj46Cj4gT24gNS8yMy8yNSA5OjI3IEFNLCBSYWRpbSBLcsOEbcODwqHDhSB3cm90ZToKPj4g
MjAyNS0wNS0yM1QxNzoyOTo0OSswMjowMCwgQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPjoKPj4+IElzIHRoaXMgc29tZXRoaW5nIGJsb2NraW5nIHRob3VnaCA/IFdlJ2QgbGlr
ZSB0byBtZXJnZSBGV0ZUIG9uY2UgU0JJIDMuMAo+Pj4gaXMgcmF0aWZpZWQgc28gdGhhdCB3b3Vs
ZCBiZSBuaWNlIG5vdCBkZWxheWluZyBpdCB0b28gbXVjaC4gSSdsbCB0YWtlIGEKPj4+IGxvb2sg
YXQgaXQgdG8gc2VlIGlmIGl0IGlzbid0IHRvbyBsb25nIHRvIGltcGxlbWVudC4KPj4gCj4+IE5v
dCBibG9ja2luZywgYnV0IEkgd291bGQgYXQgbGVhc3QgZGVmYXVsdCBGV0ZUIHRvIGRpc2FibGVk
LCBiZWNhdXNlCj4+IGN1cnJlbnQgdXNlcnNwYWNlIGNhbm5vdCBoYW5kbGUgWzE0LzE0XS4gIChX
ZWxsLi4uIHNhdmUvcmVzdG9yZSB3YXMKPj4gcHJvYmFibHkgYnJva2VuIGV2ZW4gYmVmb3JlLCBi
dXQgbGV0J3MgdHJ5IHRvIG5vdCBtYWtlIGl0IHdvcnNlLiA6XSkKPj4gCj4KPiBVc2VyIHNwYWNl
IGNhbiBub3QgZW5hYmxlIG9yIGRpc2FibGUgbWlzYWxpZ25lZCBhY2Nlc3MgZGVsZWdhdGlvbiBh
cyAKPiB0aGVyZSBpcyBubyBpbnRlcmZhY2UgZm9yIG5vdyByaWdodGx5IHBvaW50ZWQgYnkgeW91
LgoKSSBtZWFuIHNldHRpbmcgZGVmYXVsdF9kaXNhYmxlZD10cnVlIGFuZCBqdXN0IGRpc2FibGlu
ZyBGV0ZUIGZvciB0aGUKZ3Vlc3QgdW5sZXNzIHVzZXJzcGFjZSBleHBsaWNpdGx5IGVuYWJsZXMg
dGhlIGluY29tcGxldGUgZXh0ZW5zaW9uLgpXZSB3b3VsZCBibGFtZSB0aGUgdXNlciBmb3Igd2Fu
dGluZyBtdXR1YWxseSBleGNsdXNpdmUgZmVhdHVyZXMuCgo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEkgZ3Vlc3Mgc3VwcG9ydGluZyAKPiB0
aGF0IHdvdWxkIGJlIHF1aWNrZXIgdGhhbiBmaXhpbmcgdGhlIGJyb2FkZXIgZ3Vlc3Qgc2F2ZS9y
ZXN0b3JlIAo+IGFueXdheXMuIElzbid0IGl0ID8KClllcy4gIFRoZSBzYXZlL3Jlc3RvcmUgZm9y
IEZXRlQgaXMgc2ltcGxlIChpZiB3ZSBkaXNyZWdhcmQgdGhlCmRpc2N1c3Npb25zKSwgYnV0IGRl
ZmluaXRlbHkgbW9yZSB0aGFuIGEgc2luZ2xlIGxpbmUuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
