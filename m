Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE353C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxrxXx0rkZxlSzlWvpxS/UHnx4pby5ZsNsDNxZiBaX8=; b=ILe8M4K1sil3fu
	32bMgg5ZPANum6qxjDYvHKhfEyZBANqX4IvrUaO2KWBC1bRakYtY9EbT2IWbajMfscj9bzD0yMTgQ
	0+gkZsu1eyUMuyQmSx7N4s3wqM4lo9W/XymISXTj3wjek+D+lLlNdN/+i44OtxRbXKPdolYt8M+Re
	OBrB001CDCMiiIY7rWcCVbyH8D4N8zqPdeb2uO0Xhcg4ISf7fEPupYFbNAvRFmf/PC7SnUJ75FReW
	fiOYZeuXOiPaj8pAhWslcvTqok3738EnrhiTFELpqYtEEGXqTZMpijZK+ctjFEfo4Tg+KfP1ctL8x
	dWyPjsBgAaHTS0DeUAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIes-0000000Df5F-2Bx3;
	Thu, 19 Jun 2025 17:02:38 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFte-0000000DFc2-1NtD
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 14:05:43 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso745733276.1
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 07:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750341941; x=1750946741; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKg0ba0YiDbucRJJP0q5rGzXl3UtGTSrIi2K7UJJiDI=;
        b=fJ6xHY5BzOTgqht+dnmEM4QsqlzufMnJiweheqIqZJzgNi/WOM+lqZsfcFvOAE9/dN
         X4qUgoyckt3R/ePsYkHmbkqqWhnvZnCNqtTVe54updikNjIxJnzZ0ly7699WhkIO/nEM
         d+l2ytTmJH5kif70uv+i3t0BaOf3GqUzwle5d+1jetpH7k1HNN6YSvWdKJx3PQyBvuWB
         2LcwtEt0f2Kn9L3kybFyU2RVMgBGLemj38DcOp91qRZ947J+OaRhlPLAvDCzHiv/5Kw4
         GspzHRUNigLnoxq9+ed1adg/Ck0FUetxJhDaogY5Zh662oVZLbZIy8tq1HQuxaUbul0x
         VpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341941; x=1750946741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKg0ba0YiDbucRJJP0q5rGzXl3UtGTSrIi2K7UJJiDI=;
        b=UpwU9TRN0BZXZZ6WnfUIJ3NWkGYdYetGM4HWrh3oLpGqSewawOKRfHlFp9iZhcP5k+
         SyaJEayTJ8DSptXJUsh658V8zrTVdxKtGKdWC1IwJTzmmno3BCKUeftQ0B/wMiO0NMNb
         vGe/8+cECZL3a0iNZi1OYFr7HyCdS0qJASJmm5JSmMlkS+VBRLJDvaoxiZOyXRtSY6f4
         LdsmDV5Rwz6fVbbjJ4y6UmHxYuPaxp9SNWc0iSbhvgqSyH/YlPdr1C7YSr2siJqsuvQz
         DI05bt0RgQGBrIb5Eo97KMbkT1X/GFRGimmqrxKjm3wkp7R0ZNyzAG4YbDi4YUUAz2yE
         8q8w==
X-Forwarded-Encrypted: i=1; AJvYcCUaQWDnWLIgM8I9TxIp9JsZXuQEHYJSDZnO7jKnf6WsyORL4nvmsGhEdHBZjG3XDz2QiLRITo1hKcXNZg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6cU5uByOKjBMYcfopSfqIt4+cw7TZhTvvDswxJEVL0cMtokKj
	K9Y3LFHVdCecLnSDb39nI1a8geibrc7u74cnfzzRkZFG9l4yrZpH0Len3vHAbJBs3Qeo8ZvWVIQ
	fNrUdfSeMZDKwVVDoz9GQNMI/F1fV9i2AdSpGxJWTIA==
X-Gm-Gg: ASbGncsNsKh619xWq7HNM/ToGGCgi0BZtsP+E6ZkoN05KRNyj92P22tRQ1EOF382wo0
	GtgisUWqSk61z65ZrdV8HsO9snvIvNdiNm++I3KqE1dIO1Ww3gx3duJkBO/VhFdcadJTouu//jm
	U0G7TdcARijCRQeZ9hCSLy4xfpxA4lVUnWP6Fefrimofp1
X-Google-Smtp-Source: AGHT+IH0AH5eQCmkoaKuxJOOgz4lFGdC1+XDKcfPC3cVk26SzauKoptzIDMdTxuXWb+pjp6Y/soe1VeW59yNxFQhyjU=
X-Received: by 2002:a05:6902:1a49:b0:e7d:a4a7:439b with SMTP id
 3f1490d57ef6-e822ad08e62mr28105508276.48.1750341940771; Thu, 19 Jun 2025
 07:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618102228eucas1p1906803f73cc004e68f281b2bdf871da3@eucas1p1.samsung.com>
 <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <20250618-apr_14_for_sending-v5-3-27ed33ea5c6f@samsung.com>
 <CAPDyKFq_4W7bPr1NiuEGzMDoY6tQuHbw5uOXrkJagbEbtmqMWg@mail.gmail.com> <CAMRc=Mf+o524rewPrtZGJhE11Gwp6v8A2V6zjGr3e1PmQq7aJw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf+o524rewPrtZGJhE11Gwp6v8A2V6zjGr3e1PmQq7aJw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 19 Jun 2025 16:05:03 +0200
X-Gm-Features: AX0GCFv2RIICzft_XZewOUAZZhSSWv8Je60KaQi8kC_SyLtOZnxRamWoHqyfp3U
Message-ID: <CAPDyKFpsq6qaRaP4YDMkB=JrW+o3obKoirfHrdmost-kV4ct0Q@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] pmdomain: thead: Instantiate GPU power sequencer
 via auxiliary bus
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_070542_370585_F7E74E3D 
X-CRM114-Status: GOOD (  20.27  )
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

T24gVGh1LCAxOSBKdW4gMjAyNSBhdCAxNDozMSwgQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBi
Z2Rldi5wbD4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAxOSwgMjAyNSBhdCAxMjoyNeKAr1BNIFVs
ZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBXZWQs
IDE4IEp1biAyMDI1IGF0IDEyOjIyLCBNaWNoYWwgV2lsY3p5bnNraQo+ID4gPG0ud2lsY3p5bnNr
aUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEluIG9yZGVyIHRvIHN1cHBvcnQgdGhl
IGNvbXBsZXggcG93ZXIgc2VxdWVuY2luZyByZXF1aXJlZCBieSB0aGUgVEgxNTIwCj4gPiA+IEdQ
VSwgdGhlIEFPTiBwb3dlciBkb21haW4gZHJpdmVyIG11c3QgYmUgcmVzcG9uc2libGUgZm9yIGlu
aXRpYXRpbmcgdGhlCj4gPiA+IGNvcnJlc3BvbmRpbmcgc2VxdWVuY2VyIGRyaXZlci4gVGhpcyBm
dW5jdGlvbmFsaXR5IGlzIHNwZWNpZmljIHRvCj4gPiA+IHBsYXRmb3JtcyB3aGVyZSB0aGUgR1BV
IHBvd2VyIHNlcXVlbmNpbmcgaGFyZHdhcmUgaXMgY29udHJvbGxlZCBieSB0aGUKPiA+ID4gQU9O
IGJsb2NrLgo+ID4gPgo+ID4gPiBFeHRlbmQgdGhlIEFPTiBwb3dlciBkb21haW4gZHJpdmVyIHRv
IGNoZWNrIGZvciB0aGUgcHJlc2VuY2Ugb2YgdGhlCj4gPiA+ICJncHUtY2xrZ2VuIiByZXNldCBp
biBpdHMgb3duIGRldmljZSB0cmVlIG5vZGUuCj4gPiA+Cj4gPiA+IElmIHRoZSBwcm9wZXJ0eSBp
cyBmb3VuZCwgY3JlYXRlIGFuZCByZWdpc3RlciBhIG5ldyBhdXhpbGlhcnkgZGV2aWNlLgo+ID4g
PiBUaGlzIGRldmljZSBhY3RzIGFzIGEgcHJveHkgdGhhdCBhbGxvd3MgdGhlIGRlZGljYXRlZCBg
cHdyc2VxLXRoZWFkLWdwdWAKPiA+ID4gYXV4aWxpYXJ5IGRyaXZlciB0byBiaW5kIGFuZCB0YWtl
IGNvbnRyb2wgb2YgdGhlIHNlcXVlbmNpbmcgbG9naWMuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IE1pY2hhbCBXaWxjenluc2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4gPgo+ID4g
UmV2aWV3ZWQtYnk6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPgo+ID4KPiA+
IEl0IGxvb2tzIGxpa2UgdGhlcmUgaXMgYW5vdGhlciByZS1zcGluIG5lZWRlZCwgYnV0IHRoaW5r
aW5nIG9mIHRoZQo+ID4gbWVyZ2Utc3RyYXRlZ3kgSSBjb3VsZCBwb3RlbnRpYWxseSB0YWtlIHBh
dGNoMS0+cGF0Y2gzIHZpYSBteSBwbWRvbWFpbgo+ID4gdHJlZSwgYXMgaXQgc2VlbXMgcmVhc29u
YWJsZSB0byBrZWVwIHRob3NlIGNoYW5nZXMgdG9nZXRoZXIuIFVubGVzcwo+ID4gQmFydG9zeiBz
ZWVzIGFueSBwcm9ibGVtIHdpdGggdGhhdCwgb2YgY291cnNlLgo+ID4KPgo+IEkgaGF2ZSBhbm90
aGVyIGNoYW5nZSBwbGFubmVkIGZvciB0aGUgcHdyc2VxIEFQSSBmb3IgdGhpcyBjeWNsZS4KPiBO
b3RoaW5nIG1ham9yIGJ1dCBpdCBzdGlsbCB3aWxsIHJlcXVpcmUgcGF0Y2ggMS84IHRvIGJlIGlu
IG15IHRyZWUgc28KPiBpZiB5b3UgZG9uJ3QgbWluZCwgSSdsbCB0YWtlIGl0IGhyb3VnaCB0aGUg
cHdyc2VxIHRyZWUgYW5kIHByb3ZpZGUgeW91Cj4gYW4gaW1tdXRhYmxlIHRhZyB0byBwdWxsIGJl
Zm9yZSB5b3UgYXBwbHkgdGhlIHJlc3Q/CgpSaWdodCwgdGhhdCB3b3JrcyBwZXJmZWN0bHkgZmlu
ZSB0b28uIEkgd2lsbCB3YWl0IGZvciB5b3UgdG8gZ2l2ZSBtZQp0aGUgYnJhbmNoIHRoZW4sIGJl
Zm9yZSBhcHBseWluZyBhbnl0aGluZy4KCktpbmQgcmVnYXJkcwpVZmZlCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
