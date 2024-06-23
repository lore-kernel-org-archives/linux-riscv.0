Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E81C27C4F
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jun 2024 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sFULidvsASBDrIRnD3RoxfcIgtDTqdIAqfNdHVhIL4=; b=v0xwWLOlM3RecM
	n3X0pE36dNXvfIzdGLlHOGLoGi7mdfZzM8BMdu21AOAOZ4kAUxJfBl6XREHrezjOz5j96Pu8CQnBr
	aSUXIYzrL3zCVeILcRySN3PVZNkgVurk6n8kCIFOix8SVP3k31hnvfatHBsUgQqEqNQAbHX/qIxj0
	tTxH3qplalJM/qrBCvWqJ36s0V/iwJZJwmvts7RwzBXQeb8jzeIRzrp0bbK/BZ5LonKqCjPOv2YPL
	bj6wqWk9wYDr0UvId3L6iCB85oNRvERn9HKog0NHrzBsaCe28sQlTekV5Syu9mS97Em+eap4hsiZn
	b7+9Q2J2p4++Cu+J4fCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLQhL-0000000ERKi-1V2c;
	Sun, 23 Jun 2024 17:08:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLQhH-0000000ERKA-1i1f
	for linux-riscv@lists.infradead.org;
	Sun, 23 Jun 2024 17:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D0306248B
	for <linux-riscv@lists.infradead.org>; Sun, 23 Jun 2024 17:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F541C4AF09
	for <linux-riscv@lists.infradead.org>; Sun, 23 Jun 2024 17:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719162489;
	bh=O64q/2QrlOK51NlMxYf1EIbVDMzus2wZpPQLOTEYW9g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ko/Xgd1+l2fiV5rq4r09a4Dkk9F6qo8JCMRAq0MUjdKJRPNa0OQzGbMb1mHz4h9F8
	 9ffKTf/Au6njmky/2JceHhV0vSPKQjO0+dMt36RgIYJqtNT9UZ8jyCqoFUQjaxe1Ut
	 +qDozt2EtOKXlwoESicyoJWJFrZ7Nt2DmKlnbyytXV7YRXA6tJCANsnRahMyPfUlFq
	 7SDZI1AVuiLGdcP4TpX4yB6EPP7G6CNMAfRmEDoHXXEvzWdfweqdJcLO645/CsRpx6
	 SwapBd4DoKEm9wphuAOBjb8Ga18XuvrjcK0o/1NdZbjKe0qazH/u4BCLzTBsPsr02H
	 IEIKOUwLb/A8Q==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a724b3a32d2so49810866b.2
        for <linux-riscv@lists.infradead.org>; Sun, 23 Jun 2024 10:08:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YwC+DUgSuAVBC44lzuySILhYIb1T2E0cgDlm6kwMjHaDWpvFxAI
	Asp04z/mYxgfSRLxGkFnNGcY/tcbUBGjhjDDe8p+SfrvHYi8HYlRV8PJH2RnVNqSd75PT7FgfXL
	qT2pCSV63HhEXYHrY5Q3tloVdKnI=
X-Google-Smtp-Source: AGHT+IHqh5ECCo6rxNTnv13OnXMEvfR0HrFz5MxeNxK4Xo02Q+cUP1gdI3z8FF4DzmwkiDXEFxF1vKM9WwQcQqIkPjU=
X-Received: by 2002:a17:906:c014:b0:a6f:11c9:f349 with SMTP id
 a640c23a62f3a-a7245b6484cmr159368566b.23.1719162487792; Sun, 23 Jun 2024
 10:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
 <20240410-unwoven-march-299a9499f5f4@spud> <20240619-hammock-drum-04bfc16a8ef6@spud>
In-Reply-To: <20240619-hammock-drum-04bfc16a8ef6@spud>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 24 Jun 2024 01:07:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRYpDLij1aQoftz6ZqEgXDrfhNA39KiFVrwm7qc4WH6Fg@mail.gmail.com>
Message-ID: <CAJF2gTRYpDLij1aQoftz6ZqEgXDrfhNA39KiFVrwm7qc4WH6Fg@mail.gmail.com>
Subject: Re: (subset) [PATCH RESEND v8 0/6] riscv: add initial support for
 Canaan Kendryte K230
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Yangyu Chen <cyy@cyyself.name>, 
	Conor Dooley <conor.dooley@microchip.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_100811_677424_13D494FA 
X-CRM114-Status: GOOD (  25.49  )
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

T24gV2VkLCBKdW4gMTksIDIwMjQgYXQgNjo0NeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAxMTozMDoyNUFNICsw
MTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPgo+ID4KPiA+IE9uIE1vbiwgMDggQXByIDIwMjQgMDA6MjY6NTgg
KzA4MDAsIFlhbmd5dSBDaGVuIHdyb3RlOgo+ID4gPiBLMjMwIGlzIGFuIGlkZWFsIGNoaXAgZm9y
IFJJU0MtViBWZWN0b3IgMS4wIGV2YWx1YXRpb24gbm93LiBBZGQgaW5pdGlhbAo+ID4gPiBzdXBw
b3J0IGZvciBpdCB0byBhbGxvdyBtb3JlIHBlb3BsZSB0byBwYXJ0aWNpcGF0ZSBpbiBidWlsZGlu
ZyBkcml2ZXJzCj4gPiA+IHRvIG1haW5saW5lIGZvciBpdC4KPiA+ID4KPiA+ID4gVGhpcyBrZXJu
ZWwgaGFzIGJlZW4gdGVzdGVkIHVwb24gZmFjdG9yeSBTREsgWzFdIHdpdGgKPiA+ID4gazIzMF9l
dmJfb25seV9saW51eF9kZWZjb25maWcgYW5kIHBhdGNoZWQgbWFpbmxpbmUgb3BlbnNiaSBbMl0g
dG8gc2tpcAo+ID4gPiBsb2NrZWQgcG1wIGFuZCBzdWNjZXNzZnVsbHkgYm9vdGVkIHRvIGJ1c3li
b3ggb24gaW5pdHJkIHdpdGggdGhpcyBsb2cgWzNdLgo+ID4gPgo+ID4gPiBbLi4uXQo+ID4KPiA+
IEFwcGxpZWQgdG8gcmlzY3YtZHQtZm9yLW5leHQsIHRoYW5rcyEKPiA+Cj4gPiBbMS82XSBkdC1i
aW5kaW5nczogcmlzY3Y6IEFkZCBULUhFQUQgQzkwOCBjb21wYXRpYmxlCj4gPiAgICAgICBodHRw
czovL2dpdC5rZXJuZWwub3JnL2Nvbm9yL2MvNjRjYmM0NmJiODU0Cj4gPiBbMi82XSBkdC1iaW5k
aW5nczogYWRkIENhbmFhbiBLMjMwIGJvYXJkcyBjb21wYXRpYmxlIHN0cmluZ3MKPiA+ICAgICAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3IvYy9iMDY1ZGExM2VhOWMKPiA+IFszLzZdIGR0
LWJpbmRpbmdzOiB0aW1lcjogQWRkIENhbmFhbiBLMjMwIENMSU5UCj4gPiAgICAgICBodHRwczov
L2dpdC5rZXJuZWwub3JnL2Nvbm9yL2MvYjNhZTc5NmQwYTRmCj4gPiBbNC82XSBkdC1iaW5kaW5n
czogaW50ZXJydXB0LWNvbnRyb2xsZXI6IEFkZCBDYW5hYW4gSzIzMCBQTElDCj4gPiAgICAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL2Nvbm9yL2MvZGI1NGZkYTExYjEzCj4gPiBbNS82XSByaXNj
djogZHRzOiBhZGQgaW5pdGlhbCBjYW5tdi1rMjMwIGFuZCBrMjMwLWV2YiBkdHMKPiA+ICAgICAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3IvYy81ZGIyYzRkYzQxM2UKPgo+IEFmdGVyIHNv
bWUgZGlzY3Vzc2lvbiBvbiB0aGUgazEgdGhyZWFkCj4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC9abkVPVTdEMDBKOEp6eS0xQHhoYWNrZXIvLCBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvWm5BNnBaTGtJMlN0UDhIaEB4aGFja2VyLykKPiBJIGFtIGdvaW5nIHRvIGRyb3AgdGhpcyBz
ZXJpZXMuIEl0J3Mgbm90IHZlcnkgdXNlZnVsIGluIHRoZSBjdXJyZW50Cj4gc3RhdGUgYW5kIHRo
ZXJlJ3Mgbm90IHJlYWxseSBiZWVuIGFueSBpbnRlcmVzdCBmcm9tIHBlb3BsZSBpbiBnZXR0aW5n
Cj4gdGhlIHBsYXRmb3JtIHRvIGEgbW9yZSBjb21wbGV0ZSBzdGF0ZS4gSmlzaGVuZyBtYWRlIHNv
bWUgZ29vZCBwb2ludHMgaW4KPiB0aGUgazEgdGhyZWFkIGFib3V0IHRoZSBtaXNzaW5nIGNsb2Nr
IGNvbnRyb2xsZXIgc3R1ZmYsIGFuZCBJIHRoaW5rIEknbQo+IGdvaW5nIHRvIG1ha2UgaGF2aW5n
IGJhc2ljIHRoaW5ncyBsaWtlIGNsb2NrcyBhbmQgd2hlcmUgYXBwbGljYWJsZQo+IHJlc2V0cyBh
bmQgcGluY3RybCB0aGUgbWluaW11bSByZXF1aXJlbWVudCBmb3IgdGhlIHBsYXRmb3JtcyBJJ20g
bG9va2luZwo+IGFmdGVyLgpIZXJlIGlzIHRoZSBrMjMwIGNsb2NrIGRyaXZlciBiYXNlZCBvbiBM
aW51eC02LjY6Cmh0dHBzOi8vZ2l0aHViLmNvbS9ydXlpc2RrL2xpbnV4LXh1YW50aWUta2VybmVs
L2NvbW1pdC8xOTYyNDJmZDliOWI0YTE5MWRhYjBjN2MzYzViZjg1MWVkODU3ZDhkCgpwaW5jdHJs
OgpodHRwczovL2dpdGh1Yi5jb20vcnV5aXNkay9saW51eC14dWFudGllLWtlcm5lbC9jb21taXQv
YmFmMjZiNjYyMmM5ZGUyZmY2NGE2ZWQ1OGVlZWI5OGM4YjJjODI4YgoKTm8gcmVzZXQgZHJpdmVy
LgoKTW9zdCBvZiB0aGUgazIzMCBkcml2ZXJzIGFyZSB1bmRlciBMaW51eC01LjEwLCBhbmQgd2Ug
YXJlIHBvcnRpbmcgdGhlbQppbnRvIHRoZSBuZXdlc3QgdmVyc2lvbiBvZiBMaW51eCwgd2hpY2gg
dGFrZXMgdGltZS4KClNvLCBpZiB0aGUgY2xvY2sgJiBwdW5jdHVhbCBkcml2ZXJzIG1lbnRpb25l
ZCBhYm92ZSBjb3VsZCBzYXRpc2Z5IHRoZQptaW5pbXVtIHJlcXVpcmVtZW50cyBmb3IgdGhlIHBs
YXRmb3Jtcywgd2Ugd2lsbCB1cGRhdGUgdGhlIHZlcnNpb24gb2YKdGhpcyBzZXJpZXMgYXMgYSBz
dXBwbGVtZW50LgoKSXMgdGhhdCBva2F5PwoKPgo+IEkndmUgdGhyb3duIHRoZXNlIHBhdGNoZXMg
aW50byBteSB0cmVlOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L2Nvbm9yL2xpbnV4LmdpdC9sb2cvP2g9azIzMC1iYXNpYwo+Cj4gSSBkbyBoYXZlIG9u
ZSBvZiB0aGVzZSBib2FyZHMsIGJ1dCBJJ20gZmFpcmx5IGxpbWl0ZWQgYXQgdGhlIG1vbWVudCBi
ZXR3ZWVuCj4gdGhlIHZhcmlvdXMgbGludXgtcmVsYXRlZCBhbmQgd29yayBkZW1hbmRzIG9uIG15
IHRpbWUsIHNvIGl0J3MgcHJldHR5Cj4gdW5saWtlbHkgdGhhdCBJJ2xsIGRvIGFueXRoaW5nIHdp
dGggaXQgbXlzZWxmLgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKCgotLSAKQmVzdCBSZWdhcmRzCiBH
dW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
