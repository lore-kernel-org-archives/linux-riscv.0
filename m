Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3052C55179
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 13:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMkeBb/i4qV3ami02i3utkZuBRYbalYcFuZZHDPMzg8=; b=Pl8xSy7uMlXa8t
	raY8QMC7mT3/SVgS+l0/pE+lbebYnQSYVG+oOtukcEJVf3O0yvLzJf42ZUXVyZKilQfCYWR2gfXDo
	77taQjZMNfsU4bSuNTo2K1e0YCBK0HtsosVMSTad/dmtP8+ooUMiLzKOaoMISiRr1W3X34slPHtni
	cjFZseFS2g8EPjhDElqDsJQRLRds4rKxvJ/Ar9FCnns2K5j/5cYqeDfe53zTJ8gAosUmpSzsOcHyo
	C5YVT0WMtEZ521pgodZNFNJHbgqpa+Z3YzQ3JfwZ1fDGLUMYtXTE5C3avv6ZFF2ctMar7kBm5qMaw
	h1YLawIoLYYZURYdVNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsNQ-0000000H7lH-0lov;
	Mon, 03 Aug 2026 13:06:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsNM-0000000H7kW-3eeO
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 13:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785762399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TpAYiTbcaQ0jvMB05FtqLWtuoGIYX5W9PtOm3b1H6mI=;
	b=crR3K2hOK57YUbZNXOT8kIXaN97ruEq3wltYuO6JSBJlIoWIO/Ji14KtGB0TOkqiaf2ocm
	+0vmmKTH6BHKje+nbPb3ZbaNeBf0DCGysl3XB8NAUORRwIrBOuqa8bcDVCln4nTk6ad63I
	/Lc2Rf93m8KBUWQN1B3bfg05XfykxZQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-KWT1DhidOFW54rfMaj8siQ-1; Mon, 03 Aug 2026 09:06:33 -0400
X-MC-Unique: KWT1DhidOFW54rfMaj8siQ-1
X-Mimecast-MFC-AGG-ID: KWT1DhidOFW54rfMaj8siQ_1785762393
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e6bb29581so122258217b3.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 06:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762392; x=1786367192;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TpAYiTbcaQ0jvMB05FtqLWtuoGIYX5W9PtOm3b1H6mI=;
        b=rGG40/L1VZNFYM3tnR+advNYmYLMS0IDcuZN3kvP+KlAyb/ENjUF5mLZbI5D+Vj40e
         vc5yxqjI9OfIbmLu1Ujh+mxQTg4Ohgwh02XkjoRGc0b+tRRZsgvT950AHTPQKBHDg87l
         6LX+miNmuZMcn8p2Ae1MRKwPzHRSGZeAKLq9RRmXiseSuHxtjbAkuICzON3wUEFGRBfz
         hoku5bnRh/FSCtv7WCA+NenW5AMDn3htHnItd2IPUgvpNLyuZkg21qMb4JGhFE7bn8y8
         UTml1mHClwFil1NCbuFx5C5VoKtlQ2pzgPN2C1c29qAHdSrnHlPudIJSiPilET7hqf8a
         31ww==
X-Forwarded-Encrypted: i=1; AHgh+RpXrNUf4M7kjZc7XIyc7nT/KOcwXZBDdjSUuDdYzkqf2hTY3A2v3qX/7QjQ9RxdDGjGjSsIqwXy+P/kWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5sZQLdcEQVyYYpmIPfXXtpoJFjkUu9ltmbxVhCjwYHike4MVp
	wX5OttUMXGPCh6vN4s+LSDokivAD4BhaBFIzr1MphAMDkPYt9JrENptCt0P3VGMNB4gGqFBOCkP
	vd2hq5M77mx2trGsvOBEyP6lJdTkDJnDKwLcEONITbjJH/ENROkpMDGQ8Gnobrb6X0e1yeQ==
X-Gm-Gg: AR+sD10W/vhiH0+yRNbPh+uqTOWvgEKhLUifD6PlE0O50YzINdTZN/hAorBkqJV8hrQ
	dZxm2Q6MuSNt3U8wizwPOBV9QStLxXMgRDxTMW9HK8E49GvuMbkztBGZOlPuRvwT0igy90NYb6f
	fDbItKcwGF7nAqPwdgcfuSFXdPY/9tibms48uR8vowZ1pzVgIrLihJaeVfkFEURo83+670tzWzN
	BRLmcoM85PljwFhNsmhatf2wY5vSesrOrFsPxbBZ9JRcdCbSYUbCtPN+HZ/SZXLLoNnQ2sLvIfJ
	Xf3W7W2g2jf6Y/XrMOqk/Jwd55i66SV2ZtCX0bk/19cPOVp1DiGaPjixdHijXNwdpeV7zartk6e
	eDIsQ0utaROXnoq/UV3D1jFElzIdA+riXHRk=
X-Received: by 2002:a05:690c:4b11:b0:81c:872a:5152 with SMTP id 00721157ae682-81fd4bda24fmr120206947b3.30.1785762387688;
        Mon, 03 Aug 2026 06:06:27 -0700 (PDT)
X-Received: by 2002:a05:690c:4b11:b0:81c:872a:5152 with SMTP id 00721157ae682-81fd4bda24fmr120206447b3.30.1785762387273;
        Mon, 03 Aug 2026 06:06:27 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf60a76sm54295687b3.13.2026.08.03.06.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:06:26 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:06:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maurice Hieronymus <mhi@mailbox.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Boqun Feng <boqun@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Clk improvements
Message-ID: <anCSTCxDpFtKmOgj@redhat.com>
References: <20260706-clk-type-state-v5-0-67c5f326a16c@collabora.com>
 <20260731183735.15036-1-mhi@mailbox.org>
 <E20E4FD3-F4DA-4029-99F7-DB4F93AA2994@collabora.com>
MIME-Version: 1.0
In-Reply-To: <E20E4FD3-F4DA-4029-99F7-DB4F93AA2994@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OSbT4T2y172moGPS-B9hTdTKqbvvsTJJoihbE5ydCQw_1785762393
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_060640_983437_B1956AD6 
X-CRM114-Status: GOOD (  22.29  )
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

SGkgRGFuaWVsLAoKT24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMDY6MzI6NDhQTSAtMDMwMCwgRGFu
aWVsIEFsbWVpZGEgd3JvdGU6Cj4gPiBPbiAzMSBKdWwgMjAyNiwgYXQgMTU6MzcsIE1hdXJpY2Ug
SGllcm9ueW11cyA8bWhpQG1haWxib3gub3JnPiB3cm90ZToKPiA+IGF0IHlvdXIgc3VnZ2VzdGlv
biBbMF0gSSByZWJhc2VkIG15IGBjbGtfcmF0ZV9leGNsdXNpdmVfZ2V0KClgIGJpbmRpbmcgZm9y
Cj4gPiBwd20tdGgxNTIwIG9uIHRvcCBvZiB0aGlzIHNlcmllcywgc28gaXQgaXMgbm93IHdhaXRp
bmcgb24gaXQgdG8gbGFuZC4gQXMgdjUKPiA+IGhhcyBub3Qgc2VlbiBhbnkgY29tbWVudHMgaW4g
dGhlIGxhc3QgZmV3IHdlZWtzLCBJIHdhbnRlZCB0byBhc2sgd2hhdCB0aGUKPiA+IGN1cnJlbnQg
c3RhdHVzIGlzLgo+IAo+IE5vYm9keSBoYXMgcmVwbGllZCBzbyBmYXIuIEkgZG9u4oCZdCB0aGlu
ayB0aGVyZSBhcmUgYW55IGZ1cnRoZXIgY29tbWVudHMuCj4gCj4gPiAKPiA+IElmIHRoZXJlIGFy
ZSBubyBibG9ja2VycyBsZWZ0IGFuZCB5b3UgZXhwZWN0IGl0IHRvIGJlIG1lcmdlZCBzb29uLCBJ
IGFtCj4gPiBoYXBweSB0byBrZWVwIHdhaXRpbmcuIE90aGVyd2lzZSBJIHdvdWxkIG9mZmVyIHRv
IHNlbmQgbXkgc2VyaWVzIHN0YW5kYWxvbmUKPiA+IGFnYWluc3QgdGhlIGN1cnJlbnQgYENsa2Ag
QVBJIGFuZCBsZXQgeW91IHJlYmFzZSBvbiB0b3Agb2YgbWluZSAtIGl0IGlzIHRoZQo+ID4gbXVj
aCBzbWFsbGVyIG9mIHRoZSB0d28sIHRvdWNoaW5nIG9ubHkgYENsazo6cmF0ZV9leGNsdXNpdmVf
Z2V0KClgIGFuZAo+ID4gcHdtX3RoMTUyMC5ycy4KPiA+IAo+ID4gWzBdOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9ydXN0LWZvci1saW51eC8xNDBGRTFCMy03M0NBLTQ1RUEtQjk3OC02NDhBMUE0
OEI1NzdAY29sbGFib3JhLmNvbS8KPiA+IAo+ID4gVGhhbmtzIGEgbG90LAo+ID4gCj4gPiBNYXVy
aWNlCj4gCj4gWW91ciBzZXJpZXMgbWlnaHQgaGl0IHRoZSBzYW1lIGJsb2NrZXIgYXMgdGhpcyBv
bmUuIFBlcmhhcHMgd2UgY2FuIHRyeSB0byBnZXQKPiBib3RoIG1lcmdlZCBhdCB0aGUgc2FtZSB0
aW1lPwo+IAo+IEBTdGVwaGVuIGdlbnRsZSBwaW5nIGhlcmUgOikKCkkgY2FuIGFsc28gcHJvdmlk
ZSBhbiBBY2tlZC1ieSBoZXJlIGZvciBjbGsuIEknbGwgYWRtaXQgdGhhdCBJJ20gbm90IGEKcnVz
dCBwcm9ncmFtbWVyIHlldCAocGxhbm5pbmcgdG8gbGVhcm4gdGhpcyBjb21pbmcgV2ludGVyKSwg
aG93ZXZlciBpZiB0aGUKcnVzdCBtYWludGFpbmVycyBhcmUgaGFwcHkgd2l0aCB0aGlzLCB0aGVu
IEknbSBnb29kLgoKSXQgbG9va3MgbGlrZSB0aGVyZSBtYXkgYmUgc29tZSBvdXRzdGFuZGluZyBj
b21tZW50cyBvbiB0aGlzIHNlcmllcyBqdXN0CnNraW1taW5nIHRoZSBjb21tZW50cy4gSSdsbCB3
YWl0IGZvciB0aGUgbmV4dCB2ZXJzaW9uIHRvIGxlYXZlIGFuCkFja2VkLWJ5LgoKQnJpYW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
