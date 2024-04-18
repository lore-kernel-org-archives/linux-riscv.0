Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D7CC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EqvzuGLAJaqa0l9XaEbEpB5nsFizD/sILP8iDEaWaY=; b=diSGATfTbS31pJ
	f+CvpRCayraeo/VztnhIb1o3BhS17W4IHU2z+IuIOWPqqpvzsNzbZryb2TGWe9R1uvI1NLnzBZiqm
	c7V1vqPH9CEzenejISCm11PUR69IBbQNAkUpSz5Al1ysYMPNKWm/oGyKhW9qKDV6JlBph+1modR7H
	0FYihs4RX3Hpc8GFjHq7lDmr3fbkOddXFJhekcgvjzA7TRLh0K50azBu6OggOvSs1Ku46FMu//dcg
	xYWbvLBpV2V1rgqatplzNmzHsM1Jg68NBUg535eQ7f8iaWjfPnyI7wXgkzY+KZ2VzwfFWSESNQf36
	erHdsGnpA8GWVOdFO1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR8g-00000002DXM-21RS;
	Thu, 18 Apr 2024 12:45:18 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR87-00000002D24-1eJL
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:50 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2a526803fccso580532a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713444279; x=1714049079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5uQ54D2RstiRVHvKawp7XVaoXmllI6/ulgRZL1uiKc=;
        b=N+cO9LxGmHvBQEKiIuJdiXli9Qj1RJ4096NAe7Svsx0m4urBxOZL96uTl+UC9IvvJR
         bC18r8o8DGsSTkU80joRGPtKoEi4A/Qp/TLRy82l0rA7TsWxqqOQYF+3s5LqKDTUV9xn
         Gwbfp6rCsJXiQP1MFVME4tb2rVq2PcLgMHsqWZ8fRwUgYxTgPBujS38a/DrKvUB8DLMG
         EUommW8x6Rx2bs7B2xKSJ+mEF3u9niT5jRc/AEdjvebj4NMZlh13Ajwa+/eQXENYoQfA
         hxjrmYZtOPEOd8Tk3OaSZh51qJUO4F1dTb854J1KIyIu+Pud8ubdJsu3DJ4jie8PPOGZ
         K3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444279; x=1714049079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5uQ54D2RstiRVHvKawp7XVaoXmllI6/ulgRZL1uiKc=;
        b=jVxaa8Nxw07Ft0zEoZt/qxvzy2TpVxSagqCCnM6B1QdXxRWhCA7zhPD/V939Vkbq3E
         gxGe+jrLqb5PtY48CO7VM4mvE5PKuJ/peGsU1iCEz3qcgjmz/hPgDO1p6iMeHrjuoyJR
         cxWX5Iu3jNLnR0qAdWFEISE3PDRlmMVvpfoVNoPn2dPlLlCU7ZF4EZ44gPVxy9HrgVtw
         GZI8iAfUUvrPNEP0kQikHBMcWqhVluCg4S9lhipoC3wiRKSwBhSjKpGxna6+XrGL6Nbv
         gIuYYbgwSxAox57o39DzzuwDsP4uiGNvRKJj89U6y5EsHt81GFDN0Yu/T/1ylfuzbSdu
         O1dg==
X-Forwarded-Encrypted: i=1; AJvYcCWyB6eQ8wjX0TYwmL37gpNXoByRVkte32IK0iHzsfuGfd5QUlw/sO9l5Ga2gTL59oENCaVolTFABbK+0Ck/1/R7A1nQiS13TfcvI4W8XyDV
X-Gm-Message-State: AOJu0YwzpQZNG9HAadyoR/q3J/zGu+Fz4nMqTWUPOj7yimGu5Q/anuFv
	IPC8JHUiJpBxJI3uYVWLHvCl7jgf7LVZ+xQ/DxFQ0C85UYfGUoTiLiXCQV4eqCW2cIUdUjqFnEK
	XX6x1wNI01A5jFgDDeuzAkq5m0APEhH1KbYiW4Q==
X-Google-Smtp-Source: AGHT+IEVhN1TepgowxkZx3zMUiDk/JogONvQq/CRTPtE1ye8HxlbipGC6rPc0ieZh6EzWl0IuXwLE4FG98AxDucqM8A=
X-Received: by 2002:a17:90a:4a09:b0:2a6:e857:4b2e with SMTP id
 e9-20020a17090a4a0900b002a6e8574b2emr2303349pjh.3.1713444279597; Thu, 18 Apr
 2024 05:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240418114942.52770-1-luxu.kernel@bytedance.com> <CAEg0e7gDk6SFRh4oF0KsA7xZoMr7RuZXFWL8qD7rmM2cBDLwcg@mail.gmail.com>
In-Reply-To: <CAEg0e7gDk6SFRh4oF0KsA7xZoMr7RuZXFWL8qD7rmM2cBDLwcg@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Thu, 18 Apr 2024 20:44:28 +0800
Message-ID: <CAPYmKFsQQPCd-34GArHfC-Sv8PCYHgmZxprK3WHKnJquQDoXiQ@mail.gmail.com>
Subject: Re: [External] Re: [RFC 0/2] riscv: Idle thread using Zawrs extension
To: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	andy.chiu@sifive.com, guoren@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, lihangjing@bytedance.com, 
	dengliang.1214@bytedance.com, xieyongji@bytedance.com, 
	chaiwen.cc@bytedance.com, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054443_741735_44C9A94F 
X-CRM114-Status: GOOD (  19.66  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgODoyNuKAr1BNIENocmlzdG9waCBNw7xsbG5lcgo8Y2hy
aXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1PiB3cm90ZToKPgo+IE9uIFRodSwgQXByIDE4LCAyMDI0
IGF0IDE6NTDigK9QTSBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBhIG5ldyBpbXBsZW1lbnRhdGlvbiBv
ZiBpZGxlIHRocmVhZCB1c2luZwo+ID4gWmF3cnMgZXh0ZW5zaW9uLgo+Cj4gVGhpcyBvdmVybGFw
cyB3aXRoIHRoZSBmb2xsb3dpbmcgc2VyaWVzOgo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjQwMzE1MTM0MDA5LjU4MDE2Ny03LWFqb25lc0B2ZW50YW5hbWljcm8uY29tLwoKSGkg
Q2hyaXN0b3BoLgpUaGFua3MgZm9yIHlvdXIgcmVwbHkhCkFjdHVhbGx5IG91ciBwYXRjaCBzZXJp
ZXMgaXMgZGlmZmVyZW50IGZyb20gdGhpcy4gVGhlIHdvcmsgZnJvbSB5b3VyCmxpbmsgZm9jdXNl
cyBvbiBwcm92aWRpbmcgc3VwcG9ydCBmb3IgWmF3cnMgYW5kIGltcGxlbWVudGluZyBzcGlubG9j
awp1c2luZyBpdCwgd2hpbGUgb3VyIHdvcmsgZm9jdXNlcyBvbiBpbXBsZW1lbnRpbmcgaWRsZSB0
aHJlYWQgdXNpbmcKWmF3cnMgYW5kIGFjY2VsZXJhdGluZyBJUEkgdG8gaWRsZSBjcHUuIE9mIGNv
dXJzZSwgdGhlIElTQSBaQVdSUwpjb25maWcgcGFydCBjYW4gYmUgbWVyZ2VkLiBXZSB3aWxsIHJl
ZmluZSBvdXIgY29kZSBpbiB0aGUgbmV4dCB2ZXJzaW9uCnRvIHJlZHVjZSBjb2RlIGNvbmZsaWN0
cy4KCj4KPiBCUgo+IENocmlzdG9waAo+Cj4gPgo+ID4gVGhlIFphd3JzWzBdIGV4dGVuc2lvbiBp
bnRyb2R1Y2VzIHR3byBuZXcgaW5zdHJ1Y3Rpb25zIG5hbWVkIFdSUy5TVE8gYW5kCj4gPiBXUlMu
TlRPIGluIFJJU0MtVi4gV2hlbiBzb2Z0d2FyZSByZWdpc3RlcnMgYSByZXNlcnZhdGlvbiBzZXQg
dXNpbmcgTFIKPiA+IGluc3RydWN0aW9uLCBhIHN1YnNlcXVlbnQgV1JTLlNUTyBvciBXUlMuTlRP
IGluc3RydWN0aW9uIHdpbGwgY2F1c2UgdGhlCj4gPiBoYXJ0IHRvIHN0YWxsIGluIGEgbG93LXBv
d2VyIHN0YXRlIHVudGlsIGEgc3RvcmUgaGFwcGVucyB0byB0aGUKPiA+IHJlc2VydmF0aW9uIHNl
dCBvciBhbiBpbnRlcnJ1cHQgYmVjb21lcyBwZW5kaW5nLiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVu
Cj4gPiB0aGVzZSB0d28gaW5zdHJ1Y3Rpb25zIGlzIHRoYXQgV1JTLlNUTyB3aWxsIHRlcm1pbmF0
ZSBzdGFsbCBhZnRlciBhbgo+ID4gaW1wbGVtZW50YXRpb24tZGVmaW5lZCB0aW1lb3V0IHdoaWxl
IFdSUy5OVE8gd29uJ3QuCj4gPgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW1wbGVtZW50cyBpZGxl
IHRocmVhZCB1c2luZyBXUlMuTlRPIGluc3RydWN0aW9uLgo+ID4gQmVzaWRlcywgd2UgZm91bmQg
dGhlcmUgaXMgbm8gbmVlZCB0byBzZW5kIGEgcmVhbCBJUEkgdG8gd2FrZSB1cCBhbiBpZGxlCj4g
PiBDUFUuIEluc3RlYWQsIHdlIHdyaXRlIElQSSBpbmZvcm1hdGlvbiB0byB0aGUgcmVzZXJ2YXRp
b24gc2V0IG9mIGFuIGlkbGUKPiA+IENQVSB0byB3YWtlIGl0IHVwIGFuZCBsZXQgaXQgaGFuZGxl
IElQSSBxdWlja2x5LCB3aXRob3V0IGdvaW5nIHRocm91Z2gKPiA+IHRyYW5kaXRpb25hbCBpbnRl
cnJ1cHQgaGFuZGxpbmcgcm91dGluZS4KPiA+Cj4gPiBbMF0gaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2L3Jpc2N2LXphd3JzL2Jsb2IvbWFpbi96YXdycy5hZG9jCj4gPgo+ID4gWHUgTHUgKDIpOgo+
ID4gICByaXNjdjogcHJvY2VzczogSW50cm9kdWNlIGlkbGUgdGhyZWFkIHVzaW5nIFphd3JzIGV4
dGVuc2lvbgo+ID4gICByaXNjdjogVXNlIFphd3JzIHRvIGFjY2VsZXJhdGUgSVBJIHRvIGlkbGUg
Y3B1Cj4gPgo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgMjQgKysr
KysrKwo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1aWRsZS5oICAgfCAgMTEgKy0tLQo+
ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCAgICAgfCAgIDEgKwo+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggfCAgMzEgKysrKysrKysrCj4gPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9zbXAuaCAgICAgICB8ICAxNCArKysrCj4gPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1LmMgICAgICAgICAgICB8ICAgNSArKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYyAgICAgfCAgIDEgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAg
ICAgICAgfCAxMDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9zbXAuYyAgICAgICAgICAgIHwgIDM5ICsrKysrKystLS0tCj4gPiAgOSBmaWxlcyBj
aGFuZ2VkLCAyMDUgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCj4gPgo+ID4gLS0KPiA+
IDIuMjAuMQo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
