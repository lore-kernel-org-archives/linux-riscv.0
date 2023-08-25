Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB3FC83F01
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Aug 2023 22:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GTCxrxnUkeE/eXzBPAa3+Re0k7V075FCQe6JOYSUCv0=; b=004BAdgsew100J
	99la+DtVzOsQ3kROaQMSYeQIjstQBnNtrzVS9GjcQ4WCaKHB/Pk3Sr864EKvoXQPB7G+buAnDh8iy
	M+JvoRQ5Nwpfhy1sZLL7DBsYoz+6jSJLPb3nRlKiUxffzDBO/RdPFOnuTVV2qglJPMxdfUTeknZhw
	GPmZr15x/8srKAT00a2Ksi54RdER9oyLtCEO41ZKk8P/wmbgXS8ueTxWkrF1p52rCwZEXTMCyJ8qG
	1+JMbAVK9teF34nFzaSRzg0BkSU7ydTjiIMneWWLn6fT+0Xz8Zu2qRLYu0dxp8F5jeYNISJ/Ad04y
	2BhWua6RZWarkLwLI6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZff3-0068Oa-0s;
	Fri, 25 Aug 2023 22:52:13 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZff0-0068NT-1A
	for linux-riscv@lists.infradead.org;
	Fri, 25 Aug 2023 22:52:12 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe61ae020bso2119668e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Aug 2023 15:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693003925; x=1693608725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+y9J0Vp2KEC0gOHwcifgBi34rB9oiYo6WicEeCrDYUk=;
        b=BqHgwsSFGMBSzPfBjaL1mADgNZ/JMV/t3ctoiSTSqoIS5gT/l4uFn/xXCt6JLYHUy7
         gPuSEJB2mTISHBWmZIMp31j/ybBK4kdYAyhdBlOs7wfaR8ddFAL65C0HQ5z5ntzz3uF2
         vYBhDyW9oc46xobiDjao2H/AWMfF8ipOXkLGtC3ycfJ4b1+g9r+V0M1UbbRMqnP7UrZo
         Og6lQd7ZrW6gCTz/6+vO73sKL64j4iTfOyFUwP12X0LaQZBEFoe8Yzt7H0KYrJH/kTkH
         Ldj7CMmu49LAQ012XQkydspk8hWy7+53LwAoR6wNe3O6zq7t2zoG4e1xYxGAb2GJpwOA
         bdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693003925; x=1693608725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+y9J0Vp2KEC0gOHwcifgBi34rB9oiYo6WicEeCrDYUk=;
        b=baABSBpyNfFd8rOvBlyQnCA+A9lwK4fEE00Mp1jqf5gSUx0V5wxBvEId9DilBtooNP
         9i/hGcMSzYS6uZxHAHUAQuhperUyWVv3F3hpNz/dxIZ06D5ou3wDWqRhVdzIc3MenZb+
         xrsdXvUT8qpvWGoz53DStz3GW/pXQ2j2VrI/B/EHH+dBUCPSCxuuQYz6tT7C1aeg9eLm
         61vSrhH7BAB8rqMDN0tn3zGLyUsHDn+WTFxOzSFs48/WM9ev2Np7yF/MI5qUPhRqe4wo
         s2NqkKe5/wkogoqa6F5vaV/IrI/TqriiuySJGrsyFEFbysOdb/x19xYmGGSRVmsVw7gd
         3i/A==
X-Gm-Message-State: AOJu0YzN1Ac8zMHX+T7sOHso3XMmdfhTZ1y0HU3+cJ5w5Iu9sad8TUgj
	WC+ncGmLQAYslHHrix/SlVaw/ovOpeBZvUiHrQYEvQ==
X-Google-Smtp-Source: AGHT+IF+v+BY77506pMI43cchja2d3T+v50mea58RnGu7jsCphVTLnNPxrVLDaC4mo5oFMYvPobn4jQYIezwB6lXp8o=
X-Received: by 2002:a05:6512:4026:b0:4f9:570c:7b28 with SMTP id
 br38-20020a056512402600b004f9570c7b28mr17775050lfb.32.1693003924895; Fri, 25
 Aug 2023 15:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230711201831.2695097-1-evan@rivosinc.com> <20230824-factual-jawed-2dddd2cf2bdd@wendy>
 <CALs-Hss51fQE1yxe1Y1T86X+OfjPaAd386vosQ8gzRm=Njm1gw@mail.gmail.com>
 <20230824-exploit-spectacle-ecedd91e9075@spud> <CALs-HssqaOjvUOdBVn=oN+uzkkmjguys2UttTYgdcqJwJB0HnQ@mail.gmail.com>
 <20230825-374a82446ed3eea02fcb41e6@orel>
In-Reply-To: <20230825-374a82446ed3eea02fcb41e6@orel>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 25 Aug 2023 15:51:28 -0700
Message-ID: <CALs-HstfA29DDrmVemP6bZe+kON9JDKYR3p132gG_WefA6d7eQ@mail.gmail.com>
Subject: Re: [PATCH v4] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_155210_618129_B7D5F66C 
X-CRM114-Status: GOOD (  41.21  )
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

T24gRnJpLCBBdWcgMjUsIDIwMjMgYXQgMToxNuKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMjQsIDIwMjMgYXQgMDM6MDY6
NTNQTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDI0LCAyMDIzIGF0
IDEwOjI54oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPiAuLi4K
PiA+ID4gRG8geW91IHdhbnQgdG8gaGF2ZSB0aGlzIG5ldyB0aGluZyBpbiBjcHVpbmZvIHRlbGwg
dGhlIHVzZXIgInRoaXMgaGFydAo+ID4gPiBoYXMgeHl6IGV4dGVuc2lvbnMgdGhhdCBhcmUgc3Vw
cG9ydGVkIGJ5IGEga2VybmVsLCBidXQgbWF5YmUgbm90IHRoaXMKPiA+ID4ga2VybmVsIiBvciB0
byB0ZWxsIHRoZSB1c2VyICJ0aGlzIGhhcnQgaGFzIHh5eiBleHRlbnNpb25zIHRoYXQgYXJlCj4g
PiA+IHN1cHBvcnRlZCBieSB0aGlzIGtlcm5lbCI/IFlvdXIgdGV4dCBhYm92ZSBzYXlzICJ1bmRl
cnN0b29kIGJ5IHRoZQo+ID4gPiBrZXJuZWwiLCBidXQgSSB0aGluayB0aGF0J3MgYSBwb29yIGRl
ZmluaXRpb24gdGhhdCBuZWVkcyB0byBiZSBpbXByb3ZlZAo+ID4gPiB0byBzcGVsbCBvdXQgZXhh
Y3RseSB3aGF0IHlvdSBtZWFuLiBJT1cgZG9lcyAidW5kZXJzdG9vZCIgbWVhbiB0aGUKPiA+ID4g
a2VybmVsIHdpbGwgcGFyc2UgdGhlbSBpbnRvIGEgc3RydWN0dXJlLCBvciBkb2VzIGl0IG1lYW4g
InllcyB5b3UgY2FuCj4gPiA+IHVzZSB0aGlzIGV4dGVuc2lvbiBvbiB0aGlzIHBhcnRpY3VsYXIg
aGFydCIuCj4gPgo+ID4gSSdtIGltYWdpbmluZyAvcHJvYy9jcHVpbmZvIGJlaW5nIGNsb3NlciB0
byAidGhlIENQVSBoYXMgaXQgYW5kIHRoZQo+ID4ga2VybmVsIGF0IGxlYXN0IHZhZ3VlbHkgdW5k
ZXJzdGFuZHMgaXQsIGJ1dCBtYXkgbm90IGhhdmUgZnVsbCBzdXBwb3J0Cj4gPiBmb3IgaXQgZW5h
YmxlZCIuIEknbSBhc3N1bWluZyAvcHJvYy9jcHVpbmZvIGlzIG1vc3RseSB1c2VkIGJ5IDEpCj4g
PiBodW1hbnMgd2FudGluZyB0byBrbm93IGlmIHRoZXkgaGF2ZSBoYXJkd2FyZSBzdXBwb3J0IGZv
ciBhIGZlYXR1cmUsCj4gPiBhbmQgMikgYWRtaW5pc3RyYXRvcnMgY29sbGVjdGluZyB0ZWxlbWV0
cnkgdG8gbWFuYWdlIGZsZWV0cyAoaWUgZG8gSQo+ID4gaGF2ZSBhbnkgaGFyZHdhcmUgZGVwbG95
ZWQgdGhhdCBzdXBwb3J0cyBYKS4KPgo+IElzICgyKSBhIHNwZWNpYWwgY2FzZSBvZiAoMSk/IChJ
IHdhbnQgdG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCBhbGwgdGhlCj4gY2FzZXMuKQoKTW9yZSBv
ciBsZXNzLCB5ZXMuIEluIGJ1Y2tldCB0d28gYXJlIGFsc28gZm9sa3Mgd29uZGVyaW5nIHRoaW5n
cyBsaWtlCiJhcmUgYWxsIHRoZXNlIGNyYXNoIHJlcG9ydHMgSSdtIGdldHRpbmcgc3BlY2lmaWMg
dG8gbWFjaGluZXMgd2l0aCBYIi4KCj4KPiA+IFByb2dyYW1tZXJzIGxvb2tpbmcgdG8KPiA+IHNl
ZSAiaXMgdGhlIGtlcm5lbCBzdXBwb3J0IGZvciB0aGlzIGZlYXR1cmUgcmVhZHkgcmlnaHQgbm93
IiB3b3VsZAo+ID4gaWRlYWxseSBub3QgYmUgcGFyc2luZyAvcHJvYy9jcHVpbmZvIHRleHQsIGFz
IG1vcmUgZGlyZWN0IG1lY2hhbmlzbXMKPiA+IGxpa2Ugc3BlY2lmaWMgaHdwcm9iZSBiaXRzIGZv
ciAiYW0gSSBmdWxseSByZWFkeSB0byBnbyIgd291bGQgYmUKPiA+IGVhc2llciB0byB3b3JrIHdp
dGguIEZlZWwgZnJlZSB0byB5ZWxsIGF0IG1lIGlmIHRoaXMgb3ZlcmFsbCB2aXNpb24KPiA+IHNl
ZW1zIGZsYXdlZC4KPiA+Cj4gPiBJIHRyaWVkIHRvIGxvb2sgdG8gc2VlIGlmIHRoZXJlIHdhcyBj
b25zZW5zdXMgYW1vbmcgdGhlIG90aGVyCj4gPiBhcmNoaXRlY3R1cmVzLiBBYXJjaDY0IHNlZW1z
IHRvIGdvIHdpdGggInN1cHBvcnRlZCBhbmQgZnVsbHkgZW5hYmxlZCIsCj4gPiBhcyB0aGVpciBj
cHVfaGFzX2ZlYXR1cmUoKSBkaXJlY3RseSB0ZXN0cyBlbGZfaHdjYXAsIGFuZCBlbGVtZW50cyBp
bgo+ID4gYXJtNjRfZWxmX2h3Y2Fwc1tdIGFyZSBLY29uZmlnIGdhdGVkLiBYODYgaXMgY29tcGxp
Y2F0ZWQsIGJ1dCBJSVJDIGlzCj4gPiBtb3JlIGFsb25nIHRoZSBsaW5lcyBvZiAiaGFyZHdhcmUg
aGFzIGl0Ii4gVGhleSBoYXZlIHR3byBtYWNyb3MsCj4gPiBjcHVfaGFzKCkgZm9yICJyYXcgY2Fw
YWJpbGl0eSIgYW5kIGNwdV9mZWF0dXJlX2VuYWJsZWQoKSBmb3IgImtlcm5lbAo+ID4gY2FuIGRv
IGl0IHRvbyIsIGFuZCB0aGV5IHVzZSBjcHVfaGFzKCkgZm9yIC9wcm9jL2NwdWluZm8gZmxhZ3Mu
Cj4gPgo+Cj4gSSdkIGxlYW4gbW9yZSB0b3dhcmRzIHRoZSB3YXkgQUFyY2g2NCBnb2VzLCBiZWNh
dXNlLCB1bmxlc3MgL3Byb2MvY3B1aW5mbwo+IGlzIGp1c3QgYSBibGluZCByZWd1cmdpdGF0aW9u
IG9mIGFuIGlzYSBzdHJpbmcgZnJvbSBEVCAvIEFDUEksIHRoZW4gdGhlCj4ga2VybmVsIG11c3Qg
YXQgbGVhc3Qga25vdyBzb21ldGhpbmcgYWJvdXQgaXQuIEFkdmVydGlzaW5nIGEgZmVhdHVyZSB3
aGljaAo+IGlzIGtub3duLCBidXQgYWxzbyBrbm93biBub3QgdG8gd29yaywgc2VlbXMgb2RkIHRv
IG1lLiBTbyBteSB2b3RlIGlzIHRoYXQKPiBvbmx5IGZlYXR1cmVzIHdoaWNoIGFyZSBwcmVzZW50
IGFuZCBlbmFibGVkIGluIHRoZSBrZXJuZWwgb3IgcHJlc2VudCBhbmQKPiBub3QgbmVjZXNzYXJ5
IHRvIGJlIGVuYWJsZWQgaW4gdGhlIGtlcm5lbCBpbiBvcmRlciBmb3IgdXNlcnNwYWNlIG9yCj4g
dmlydHVhbCBtYWNoaW5lcyB0byB1c2UgYmUgYWR2ZXJ0aXNlZCBpbiAvcHJvYy9jcHVpbmZvLgo+
Cj4gV2Ugc3RpbGwgaGF2ZSBTTUJJT1MgKGRtaWRlY29kZSkgdG8gYmxpbmRseSBkdW1wIHdoYXQg
dGhlIGhhcmR3YXJlCj4gc3VwcG9ydHMgZm9yIGNhc2VzICgxKSBhbmQgKDIpIGFib3ZlLgoKWWVh
aCwgdGhlcmUncyBhbiBhcmd1bWVudCB0byBiZSBtYWRlIGZvciB0aGF0LiBNeSB3b3JyeSBpcyBp
dCdzIGEKZGlmZmljdWx0IGxpbmUgdG8gaG9sZC4gVGhlIGJhciB5b3UncmUgcmVhbGx5IHRyeWlu
ZyB0byBkZXNjcmliZSAob3IKYXQgbGVhc3Qgd2hhdCBwZW9wbGUgbWlnaHQgdGFrZSBhd2F5IGZy
b20gaXQpIGlzICJpZiBpdCdzIGxpc3RlZCBoZXJlCnRoZW4gaXQncyBmdWxseSByZWFkeSB0byBi
ZSB1c2VkIGluIHVzZXJzcGFjZSIuIEJ1dCB0aGVuIHRoaW5ncyBnZXQKc3F1aXNoeSB3aGVuIHRo
ZXJlIGFyZSBhZGRpdGlvbmFsIHdheXMgdG8gY29udHJvbCB0aGUgdXNlIG9mIHRoZQpmZWF0dXJl
IChwcmN0bHMoKSBpbiBpbml0IHRvIHR1cm4gaXQgb24sIHVzZXJtb2RlIHBvbGljeSB0byB0dXJu
IGl0Cm9mZiwgc2VjdXJpdHkgZG9vZGFkcyB0aGF0IGRpc2FibGUgaXQsIGV0YykuIEknbSBhc3N1
bWluZyBub2JvZHkgd2FudHMKYSB2ZXJzaW9uIG9mIC9wcm9jL2NwdWluZm8gdGhhdCBjaGFuZ2Vz
IGRlcGVuZGluZyBvbiB3aGljaCBwcm9jZXNzIGlzCmFza2luZy4gU28gdGhlbiB0aGUgbGluZSB3
b3VsZCBoYXZlIHRvIGJlIG1vcmUgY2FyZWZ1bGx5IGRlc2NyaWJlZCBhcwoid2VsbCwgdGhlIGhh
cmR3YXJlIGNhbiBkbyBpdCwgYW5kIHRoZSBrZXJuZWwgQ09VTEQgZG8gaXQgdW5kZXIgc29tZQpj
aXJjdW1zdGFuY2VzLCBidXQgWU1NViIsIHdoaWNoIGVuZHMgdXAgZmFsbGluZyBzb21ld2hhdCBz
aG9ydCBvZiB0aGUKb3JpZ2luYWwgZ29hbC4gSW4gbXkgbWluZCBrZWVwaW5nIC9wcm9jL2NwdWlu
Zm8gYXMgY2xvc2UgdG8gImhlcmUncwp3aGF0IHRoZSBoYXJkd2FyZSBjYW4gZG8iIHNlZW1zIGxp
a2UgYSBtb3JlIGRlZmVuc2libGUgcG9zaXRpb24uCi1FdmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
