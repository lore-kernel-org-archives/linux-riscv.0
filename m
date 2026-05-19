Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D93CD4F3C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 18:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bmtBDfG4FX/79hsZKGkW12/EZf/t3qv9SiN5wlDpbwQ=; b=u/QzzVpdrbv+Gr
	Jz/YqXuVOBqzicMbiZmy5zaPkfuCTaEswQtCHLAH+hyF7ztPPalY0hw+eB/Xss+M+7fBopeFtVx2d
	swYD9jf3wRp31nRXEc5Odd5hpzCDug//q8UV8Hg95d657ho+P/ysHquOpplq2a2VBtYNtZGZeCAJy
	KWYsLh3RUQBb8uzlebbbs15jDSr1SL2NNyKQ9o2MmowZJFJhI/kG51/50M1ynBEgse8Wo6PyFvapw
	YNbTGbhAq820niu8BGfc1g11sZ72JNY4lJZAS6GgKW8soz05hC1CP2djkXlphl/wZME0Wucurd9Oo
	hVuj7z9qPbtM6wSAfhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPNz-00000002Wd4-3hC1;
	Tue, 19 May 2026 18:41:47 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPNx-00000002Wbc-288A
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 18:41:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso4769220a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 11:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779216103; cv=none;
        d=google.com; s=arc-20240605;
        b=eK9SWxNH0qL1WPRA6t+007k7kqy9bSlMBL9uzO2bg2WpvGVehCFghKALsInAEhoZjU
         lPM/dgi+b34CjukA/649tgoQwI9Vbk/v4Dk5sv8/GYKVZFPrYjYJwijKq4c1ewUkVr35
         sSKJcNWDjhLTlDym1HdJRxirrQb2aNCwL4ynxjqy3EaM1LFB8XF06Ln3EmVNXqa0+0WW
         o0asM05xBA572zRyGRw6XjJtezUZNUU8D3DFLS3+Q8VCSlQVTNqOiNWhdPgXBxuRlBpB
         /DMpi49GQxx0Agb/SgfI/+z1cZTWdEJTFX7Xs91BUR518RrczeFtlGbywUicVcS88ohy
         keKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sgMtJYuaR0izLLaK1FUWPlLIzmxQrZ1MxrGID/mYXGU=;
        fh=vtSC/nkkkZKH+J9CU8FnSuv5xQ4fYXlWpqWdw7V2/ro=;
        b=ORmxAddWm2QnVw9OXM35PobF5CS45hggIq0uHONDF+xsPuUDtfEUXSMOu1FothPxM/
         rGBD6TaZr6vVuPP92y3mF8LXx5ur7YW75Rtks9nNf5l6GijR4XvNH7/Ae+1NJG+nXQys
         neLEiOMjhbl1oKSGkcsgM+li7GmKeuliKJb05A5kgZokGJLBbpXCGUdC+sqJSWrV3+i7
         1Eil92bMlyIuZhxBjo0fadAT3eIRsDMSJVzGdKO/ZnUY6tkGYOVnDbAdd7QCQhrD0bub
         0gvrtS5Nz4AiNZHXllOYy609frwPuwaxY1EltPT6nzK3pqTCNL56rtJOtHnjW9U7T5o+
         KIyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779216103; x=1779820903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgMtJYuaR0izLLaK1FUWPlLIzmxQrZ1MxrGID/mYXGU=;
        b=CMwLadoItiNjtGsthSArzS+1itMH1ZyKDR4uEQfHfQ7h49n/Fw3Wg8ng7faw1fyoGt
         Pjf4WHU0slSwGjBqV7rdIZyFCxHoUM3EJct4jtai2q0AAYTnNycPdsZC6tHfFXFgPFvd
         zwYoQVbVx5/1lvSp3eMWiMxNl1jMWY+6fatuLPq9kSoxlHJUWqgDZYlU+tASzrU/Id2T
         bQQPcLbFDbZgbiAjw3oyDuNvyQxA/66NPNfYV7qFSREJpYboQ9N4yTZZb/wmWo2XNJhI
         VaEE25n+b4Q2rfqEfoYa55UVi4eMK2yLZmjQZFdS7G6Gw4aa24gGn3q9lAUE1ygA3GLH
         DnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779216103; x=1779820903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sgMtJYuaR0izLLaK1FUWPlLIzmxQrZ1MxrGID/mYXGU=;
        b=oN7HVCUef1wF4aPtg/WE56JJTme92by4dzsdWsc28RV6qHaNrgdEzM3Td/N/xZtgq9
         9Y8xSOzK2t0DbFvy8tN+yf3WvBbYsqfbDmXeN0E+f6w4u47iFKVBhGGLPFZYYwFANqyj
         5aNtR2ygY4EtBcxB6QRNRuxdiFMiZzkfY86LNO2T40L/nbU27adDCbpmiYSjR0cCw37r
         J8j47+rF8qSd1SYocletZugeJPX6E/R8OVb4Y0M7gaT/2+gKgc+rrQVohY57k8CIDVvA
         NEJF37AJctl3TPS7Wk6briwRBxWfXVis1HqaYnaQO7XMBsB80mOG6lVCA2O29JyU3GJJ
         FfIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+5wwDDJo2S/7J/zxQgYRWCWGIY7OimunXqdvf2UAxx/6YD5qtAHDBhCCeUK/QQ2SfeHEFb+IJmnHO3cA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw2RoYKbBefWF6yZrbaeKcHOBBkojApj9A8KO4mdMVjaOqJtYe
	j5d1aKP+7oZ06+9G995SYO6ITBW19IGRLay+ynC5Kd0gwM6dEpEfZWE7Dp0B2lm18m3QbxIsp6x
	FDDks5DeMXpCmvt2hpCUz9Cm9dmE88Sc=
X-Gm-Gg: Acq92OEEQ3O+jCsOBMxQbx05HxQXF6ATb6wG6cxDw7+WPag85+iDa38lDAG8I6S6k6x
	byZt56Oa3I3ZgN88Bdbri/6VmTSNKCcpPTg5w+r/rHWJqoZkyAavC39SMEq9HmyNh/GIBjL3jNd
	iNDvEpo8RA5cvc3Hj7VL8xMeK72em6CxT2FwF1cfagfYcTMvvO9/QSQcupT2a8Sg4PhkveMWAl/
	b47gZgGxU/9n6iZ/+o6gPrCzf/3V7Xv1uEDjY099E3bQnOt4zCAWnAqzXqVB7X3yhI0QIsMrb4G
	VyZOichaHQ==
X-Received: by 2002:a05:6402:524c:b0:67c:96e7:3427 with SMTP id
 4fb4d7f45d1cf-683bad350f8mr10588073a12.0.1779216103209; Tue, 19 May 2026
 11:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260430040427.4672-1-baohua@kernel.org> <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org> <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org> <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <CAHbLzkrOSoh-jmR=uaNvx73n_wn+vExoKY0UzH5zGcfdAiDbNg@mail.gmail.com>
 <agxfLNuLCAT3F4cW@lucifer> <agxnJ8R-G3CRjeTR@lucifer>
In-Reply-To: <agxnJ8R-G3CRjeTR@lucifer>
From: Yang Shi <shy828301@gmail.com>
Date: Tue, 19 May 2026 11:41:30 -0700
X-Gm-Features: AVHnY4KjLtyViRy-FP1MJx-LYZJZfACCXodkXf2RGwVY3_NriDPxFvXtK5Jn_zQ
Message-ID: <CAHbLzkpjOLrdRSUF3-G4d9uz6tn6QYwgB66UU9bud5WHr5FWEw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, surenb@google.com, 
	akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_114145_697873_30BA794C 
X-CRM114-Status: GOOD (  48.63  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgNjozOeKAr0FNIExvcmVuem8gU3RvYWtlcyA8bGpzQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMDI6MTI6MTBQTSAr
MDEwMCwgTG9yZW56byBTdG9ha2VzIHdyb3RlOgo+ID4gT24gTW9uLCBNYXkgMTgsIDIwMjYgYXQg
MDI6MjE6MTRQTSAtMDcwMCwgWWFuZyBTaGkgd3JvdGU6Cj4gPiA+IE1heWJlIGEgbGl0dGxlIGJp
dCBvZmYgdG9waWMuIFRoaXMgaXMgYW4gaW50ZXJlc3RpbmcgaWRlYS4gSXQgc2VlbXMKPiA+ID4g
cG9zc2libGUgd2UgZG9uJ3QgaGF2ZSB0byB0YWtlIHZtYSB3cml0ZSBsb2NrIHVuY29uZGl0aW9u
YWxseS4gSUlVQwo+ID4gPiB0aGUgd3JpdGUgbG9jayBpcyBtYWlubHkgdXNlZCB0byBzZXJpYWxp
emUgYWdhaW5zdCBwYWdlIGZhdWx0IGFuZAo+ID4gPiBtYWR2aXNlLCByaWdodD8gSSBnb3QgYSBj
cmF6eSBpZGVhIG9mZiB0aGUgdG9wIG9mIG15IGhlYWQuIFdlIG1heSBiZQo+ID4KPiA+IEVyciBu
bywgaXQgc2VyaWFsaXNlcyBhZ2FpbnN0IGxpdGVyYWxseSBhbnkgbW9kaWZpY2F0aW9uIG9yIHJl
YWQgb2YgYW55Cj4gPiBjaGFyYWN0ZXJpc3RpYyBvZiBWTUFzLgoKSWYgSSByZW1lbWJlciBjb3Jy
ZWN0bHksIHlvdSBhcmUgbm90IHN1cHBvc2VkIHRvIGNoYW5nZSBWTUEKZmxhZ3Mvc2l6ZS9tbSBw
b2ludGVyL3ZtX2ZpbGUvcGdvZmYvcHJvdCwgZXRjLCB1bmRlciByZWFkIHZtYSBsb2NrIG9yCnJl
YWQgbW1hcF9sb2NrLgoKPiA+Cj4gPiA+IGFibGUgdG8ganVzdCB0YWtlIHZtYSB3cml0ZSBsb2Nr
IGlmZiB2bWEtPmFub25fdm1hIGlzIG5vdCBOVUxMLgo+ID4KPiA+IEV4Y2VwdCBpZiB3ZSBkb24n
dCB0YWtlIGl0IGFuZCB2bWEtPmFub25fdm1hIGlzIE5VTEwsIHRoZW4gc29tZWJvZHkgY2FuCj4g
PiBhbm9uX3ZtYV9wcmVwYXJlKCkgYW5kIGNoYW5nZSB2bWEtPmFub25fdm1hIG1pZHdheSB0aHJv
dWdoIGEgZm9yayBhbmQgY29tcGxldGVseQo+ID4gc2NyZXcgdXAgdGhlIGFub25fdm1hIGZvcmsg
aGllcmFyY2h5Lgo+Cj4gY29ycmVjdGlvbjogdGhpcyB3b24ndCBoYXBwZW4gYXMgcGVyIEJhcnJ5
IChzZWUgLSBJIG1hbmFnZWQgdG8gY29uZnVzZSBteXNlbGYKPiBoZXJlIDopLCBzaW5jZSBmb3Ig
dm1hLT5hbm9uX3ZtYSBpbnN0YWxsIHdlIHRha2UgdGhlIG1tYXAgcmVhZCBsb2NrLgo+Cj4gQlVU
IHdlIGFsc28gaGF2ZSB0byBjb25zaWRlciBvdGhlciBjYXNlcy4KPgo+ID4KPiA+IFNvIG5vLgo+
ID4KPiA+ID4KPiA+ID4gRmlyc3Qgb2YgYWxsLCB3cml0ZSBtbWFwX2xvY2sgaXMgaGVsZCwgc28g
dGhlIHZtYSBjYW4ndCBnbyBvciBiZQo+ID4gPiBjaGFuZ2VkIHVuZGVyIHVzLgo+ID4KPiA+IHZt
YS0+YW5vbl92bWEgY2FuIGJlIGNoYW5nZWQuCj4KPiBDb3JyZWN0aW9uOiBubyBpdCBjYW4ndCA6
KQoKWWVzLCB2bWEtPmFub25fdm1hIGNoYW5nZSBzaG91bGQgcmVxdWlyZSB0YWtpbmcgcmVhZCBt
bWFwX2xvY2suCgo+Cj4gPgo+ID4gPgo+ID4gPiBTZWNvbmRseSwgaWYgdm1hLT5hbm9uX3ZtYSBp
cyBOVUxMLCBpdCBiYXNpY2FsbHkgbWVhbnMgZWl0aGVyIG5vIHBhZ2UKPiA+ID4gZmF1bHQgaGFw
cGVuZWQgb3Igbm8gY293IGhhcHBlbmVkLCBzbyB0aGVyZSBpcyBubyBwYWdlIHRhYmxlIHRvIGNv
cHksCj4gPiA+IHRoaXMgaXMgYWxzbyB3aGF0IGNvcHlfcGFnZV9yYW5nZSgpIGRvZXMgY3VycmVu
dGx5LiBTbyB3ZSBjYW4gc2hyaW5rCj4gPiA+IHRoZSBjcml0aWNhbCBzZWN0aW9uIHRvOgo+ID4K
PiA+IEZpcnN0bHksIHdpdGggbm8gVk1BIHdyaXRlIGxvY2ssICF2bWEtPmFub25fdm1hIG1lYW5z
IGEgZmF1bHQgY2FuIHJhY2UgYW5kCj4gPiBzZWNvbmRseSBjb3B5X3BhZ2VfcmFuZ2UoKSBjaGVj
a3Mgdm1hX25lZWRzX2NvcHkoKSwgdGhlcmUgYXJlIG90aGVyIGNhc2VzIC0gUEZOCj4gPiBtYXBz
LCBtaXhlZCBtYXBzLCBVRkZEIFcvUCAodWdoKSwgZ3VhcmQgcmVnaW9ucy4KPiA+Cj4gPiBTbyB5
ZWFoIHRoaXMgaXNuJ3Qgc3VmZmljaWVudC4KPgo+IEhvd2V2ZXIgdGhpcyBpcyB0cnVlLi4uCgpZ
ZXMsIGZhdWx0IGNhbiByYWNlIHdpdGggZm9yay4gQmFzaWNhbGx5IHRoaXMgaXMgYWN0dWFsbHkg
dGhlIHB1cnBvc2UKb2YgdGhpcyBpZGVhLiBXZSBjYW4gaGF2ZSBpbXByb3ZlZCBwYWdlIGZhdWx0
IHNjYWxhYmlsaXR5LiBJbiBteQpwcm9wb3NhbCAodGFrZSB3cml0ZSB2bWEgbG9jayBpZiB2bWEt
PmFub25fdm1hIGlzIG5vdCBOVUxMKSwgdGhlIHJhY2UKanVzdCBoYXBwZW5zIG9uIHRoZSBWTUFz
IHdoaWNoIHBhZ2UgZmF1bHQgaGFzIG5vdCBoYXBwZW5lZCBvbiBiZWZvcmUuCnZtYV9uZWVkc19j
b3B5KCkgYWxzbyBza2lwcyB0aGUgVk1BcyB3aGljaCBkb24ndCBoYXZlIHZtYS0+YW5vbl92bWEu
ClNvIHRoZXJlIGlzIGJhc2ljYWxseSBubyBkaWZmZXJlbmNlIGluIHNlbWFudGljcyBvdGhlciB0
aGFuIG1vcmUgcGFnZQpmYXVsdCByYWNlcyBJSVVDLiBJdCBzaG91bGQgYmUgc2FmZSBhcyBsb25n
IGFzIHdlIGNhbiBndWFyYW50ZWUgdGhlcmUKaXMgbm8gd3JpdGFibGUgUFRFIHBvaW50IHRvIGEg
c2hhcmVkIHBhZ2UgYWZ0ZXIgZm9yay4KCkZvciBndWFyZCByZWdpb25zLCBpdCBjYW4gYmUgc2Vy
aWFsaXplZCBieSB2bWEgd3JpdGUgbG9jayBpZgp2bWEtPmFub25fdm1hIGV4aXN0cy4gSWYgdm1h
LT5hbm9uX3ZtYSBpcyBOVUxMLCBpdCB3aWxsIHByZXBhcmUKYW5vbl92bWEsIHdoaWNoIHdpbGwg
dGFrZSByZWFkIG1tYXBfbG9jayBpZiBJIHJlYWQgdGhlIGNvZGUgY29ycmVjdGx5LgoKSSBoYXZl
IG5vdCBpbnZlc3RpZ2F0ZWQgVUZGRCB5ZXQuCgo+Cj4gPgo+ID4gPgo+ID4gPiBpZiAodm1hLT5h
bm9uX3ZtYSkgewo+ID4gPiAgICAgdm1hX3N0YXJ0X3dyaXRlX2tpbGxhYmxlKHNyY192bWEpOwo+
ID4gPiAgICAgYW5vbl92bWFfZm9yayhkc3Rfdm1hLCBzcmNfdm1hKTsKPiA+ID4gICAgIGNvcHlf
cGFnZV9yYW5nZShkc3Rfdm1hLCBzcmNfdm1hKTsKPiA+ID4gfQo+ID4KPiA+IFllYWggdGhhdCdz
IHRvdGFsbHkgYnJva2VuIGZvIHJlYXNvbnMgYWJvdmUgYXMgSSBzYWlkIDopCj4gPgo+ID4gPgo+
ID4gPiBCdXQgcGFnZSBmYXVsdCBjYW4gaGFwcGVuIGJlZm9yZSB3cml0ZSBtbWFwX2xvY2sgaXMg
dGFrZW4sIHdoZW4gd2UKPiA+ID4gY2hlY2sgdm1hLT5hbm9uX3ZtYSwgaXQgaXMgcG9zc2libGUg
aXQgaGFzIG5vdCBiZWVuIHNldCB1cCB5ZXQuIEJ1dCBpdAo+ID4gPiBzZWVtcyB0byBiZSBlcXVp
dmFsZW50IHRvIHBhZ2UgZmF1bHQgYWZ0ZXIgZm9yayBhbmQgd29uJ3QgYnJlYWsgdGhlCj4gPiA+
IHNlbWFudGljLgo+ID4KPiA+IEl0IHdpbGwgdG90YWxseSBicmVhayBob3cgdGhlIGFub25fdm1h
IGhpZXJhcmNoeSB3b3JrcyA6KSBTZWUgdGhlIGxpbmtzIGF0IHRoZQo+ID4gdG9wIG9mIGh0dHBz
Oi8vbGpzLmlvL3RhbGtzIGZvciBhIGxpbmsgdG8gdmFyaW91cyBzbGlkZXMgb24gYW5vbl92bWEg
YmVoYXZpb3VyCj4gPiAoaXQncyByZWFsbHkgYSBwYWluIHRvIHRoaW5rIGFib3V0IGJlY2F1c2Ug
aXQncyBhIHN1cGVyIGJyb2tlbiBhYnN0cmFjdGlvbikuCj4gPgo+ID4gWW91IGNvdWxkIGVuZCB1
cCB3aXRoIGEgQ29XIG1hcHBpbmcgdGhhdCdzIHVucmVhY2hhYmxlIGZyb20gcm1hcCBhbmQgeW91
IGNvdWxkCj4gPiBnZXQgc29tZSBuYXN0eSBpc3N1ZXMgd2l0aCBwYWdlIHRhYmxlIGVudHJpZXMg
cG9pbnRpbmcgYXQgZnJlZWQgZm9saW9zIDopCj4KPiBDb3JyZWN0aW9uOiBhY3R1YWxseSB3ZSBz
aG91bGQgYmUgc2FmZSBnaXZlbiBtbWFwIHJlYWQgbG9jayBvbiBhbm9uX3ZtYSBpbnN0YWxsLgo+
Cj4gPgo+ID4gPgo+ID4gPiBBbnl3YXksIGp1c3QgYSBjcmF6eSBpZGVhLCBJIG1heSBtaXNzIHNv
bWUgY29ybmVyIGNhc2VzLgo+ID4KPiA+IFllYWggc29ycnkgdG8gcHVzaCBiYWNrIGhlcmUgYnV0
IHRoaXMgaXMganVzdCBub3QgYSB2aWFibGUgYXBwcm9hY2guCgpObyB3b3JyaWVzLiBUaGFua3Mg
Zm9yIGFsbCB0aGUgZmVlZGJhY2suIEp1c3QgdHJpZWQgdG8gZXhwbG9yZSB3aGV0aGVyCnN1Y2gg
YW4gaWRlYSBpcyBmZWFzaWJsZSBvciBub3QuCgo+ID4KPiA+IEFuZCB0aGlzIGlzIGZvcmdldHRp
bmcgdGhhdCB3ZSBoYXZlIHJlbGllZCBvbiBwYWdlIGZhdWx0cyBiZWluZyBibG9ja2VkIGJ5IGZv
cmsKPiA+IF9mb3JldmVyXywgd2hvIGtub3dzIHdoYXQgZWxzZSBoYXMgYmFrZWQgaW4gYXNzdW1w
dGlvbnMgYWJvdXQgdGhhdAo+ID4gc2VyaWFsaXNhdGlvbi4KPiA+Cj4gPiBGb3JraW5nIGlzIG9u
ZSBvZiB0aGUgbmFzdGllc3QgcGFydHMgb2YgbW0gYW5kIGhhcyBoYWQgbXVsdGlwbGUsIHN1YnRs
ZSwgY29ybmVyCj4gPiBjYXNlIGJyZWFrYWdlcyB0aGF0IGhhdmUgYmVlbiBhIG5pZ2h0bWFyZSB0
byBkZWFsIHdpdGguCgpZZXMsIHRoaXMgbWlnaHQgYmUgdGhlIGJpZ2dlc3QgY29uY2Vybi4gVGhl
IHBhZ2UgZmF1bHQgY2FuIHJhY2Ugd2l0aApmb3JrLiBJZiBzb21lIGFwcGxpY2F0aW9ucyByZWx5
IG9uIHN1Y2ggc3VidGxlIGJlaGF2aW9yLCBpdCBtYXkgYnJlYWssCmJ1dCBzdWNoIGFwcGxpY2F0
aW9ucyBhcmUgZnJhZ2lsZSB0b28uCgo+ID4KPiA+IFNvIEknbSB2ZXJ5IG11Y2ggYWdhaW5zdCBj
aGFuZ2luZyB0aGlzIGJlaGF2aW91ciB0byB0cnkgdG8gZml4IHNvbWV0aGluZyBpbiB0aGUKPiA+
IGZhdWx0IHBhdGguCj4gPgo+ID4gV2Ugc2hvdWxkIGFkZHJlc3MgdGhlIGZhdWx0IHBhdGggaXNz
dWVzIGluIHRoZSBmYXVsdCBwYXRoIDopCgpZZWFoLCB0aGlzIGlkZWEgd2FzIGluc3BpcmVkIGJ5
IEJhcnJ5J3MgIm5vdCB0YWtlIHZtYSByZWFkIGxvY2sKdW5jb25kaXRpb25hbGx5IiBpZGVhLiBN
YXliZSBpcnJlbGV2YW50IHRvIEJhcnJ5J3MgcHJpb3JpdHkgaW52ZXJzaW9uCnByb2JsZW0sIGp1
c3QgYW4gaWRlYSBmb3IgZnVydGhlciBvcHRpbWl6YXRpb24gb24gcGFnZSBmYXVsdApzY2FsYWJp
bGl0eS4gVGhpcyBwcm9iYWJseSBzaG91bGQgYmUgYSBzZXBhcmF0ZSB0b3BpYy4KClRoYW5rcywK
WWFuZwoKPgo+IEFib3ZlIHN0aWxsIGFsbCB0cnVlIHRob3VnaC4KPgo+ID4KPiA+ID4KPiA+ID4g
VGhhbmtzLAo+ID4gPiBZYW5nCj4gPiA+Cj4gPiA+IH0KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEJh
c2VkIG9uIHRoZSBhYm92ZSwgd2UgbWF5IHdhbnQgdG8gcmUtY2hlY2sgd2hldGhlciBmb3JrKCkK
PiA+ID4gPiBjYW4gYmUgYmxvY2tlZCBieSBwYWdlIGZhdWx0cy4gQXQgdGhlIHNhbWUgdGltZSwg
aWYgU3VyZW4sCj4gPiA+ID4geW91LCBvciBhbnlvbmUgZWxzZSBoYXMgYW55IGNvbW1lbnRzLCBw
bGVhc2UgZmVlbCBmcmVlIHRvCj4gPiA+ID4gc2hhcmUgdGhlbS4KPiA+ID4gPgo+ID4gPiA+IEJl
c3QgUmVnYXJkcwo+ID4gPiA+IEJhcnJ5Cj4gPiA+ID4KPiA+Cj4gPiBDaGVlcnMsIExvcmVuem8K
Pgo+IFNvIHN0aWxsIGEgbm9wZSA6KQo+Cj4gQ2hlZXJzLCBMb3JlbnpvCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
