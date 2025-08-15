Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD5D7CA0EE8
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 01:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lg4mXM9nctnyUicBvg9sxfgXslABEWUfONbaISkWzyo=; b=RMRNT++1iOSBSA
	VJ2oZhCv5HWQYRFOlIeR23B+/iHUdMAmebzCe3g5p4fQhxgewuOu4g5Q41NRsL33adLU3n678qd4D
	FcvPP6BzlG7CvQOWhvLNMPNGzH0JPukADzdwJN1gZbstW2Mf8cLEbd5sayxkQxSlX8pEeip3YJq7C
	7+wQnraz4LPWo1ExYWHLF2F3qvm4dMP11zze1Q4B/ml+I3ibcWSFqUd/Dc9khtDNXImMys4gxYOPz
	xx2Qgw0lpfuZDrpeiRBSU8q1Z0+0oYY2Zv/uxYlGMwOK1/H1fC/aoIU9l7bdzDPUYT1KIsbaNp39P
	IxpSdNFxdep2eU/UIp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiuo-000000010Gi-2s1Q;
	Fri, 15 Aug 2025 01:07:30 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umiHb-00000000tP9-2xNb
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 00:27:01 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e931cc2ab5fso1327396276.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 17:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755217619; x=1755822419; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chtqaOACUmcKvoVs4ArIxzTVDCSfAD6YVqxbH3Chc5Y=;
        b=yxtTsOn2huqB7KTIyeTiNyMpL5xJ+H6tZgUYE2s4E0YKJe98+E28VuCF0Rbjg5P2g0
         mT42PzdPg03/6aDMtlYQe/EOBP5iDzQBMy9ZkpWLuhPZdWDZ68wo9COd5G2h2LvDPVMv
         G+QI/CtCNFLETvFzobsqLqROpFtmp8oNPDyCPZbji/4CUxV19E1XxrgPpmKvjV3klacT
         12QwbdGP11N235gNM/54pmZXDq5sQSG7O6CkUyMtY4gzEgMIee46wnH+GIq3ufJizrd5
         KkAhsMRgsIaWByKnn/8P+UYvyJb7nDkh2f00HfMMUV9VgGfob5KwYxolOzEN/bm2zgGg
         VB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217619; x=1755822419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chtqaOACUmcKvoVs4ArIxzTVDCSfAD6YVqxbH3Chc5Y=;
        b=klRaK3jsM7o7HOIuA24d4tw60PGW/rjc+VQo8xWMlQ8oQkRpa7/GM2zJFwvTugnJIk
         YqZ6SvYGFIoR21V5P/gPHesia/zlrvn9Aw1NpZEeJOpyY3QBf4ioyDToPiLrC7QF/yqg
         W6mFO7ysP5sYUinMuSJrnPeFkMsmmabulpNuW6QrR1CyQvIHZoQxqD+lsx8h2JDGD8MV
         hn73Zn0ZrqDo5MnugdSeb+22IIkvMAxawguXli/JGRBVqqHVz3JWpTxm8GG7/3yleVS5
         jr5l6xjUgnF3IZ4ZSaC7BVQRiGms2UKge3bepAZpq1M/YmVISQepiuUFd+RZCWEG1GJu
         KxMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqNH5Vde7pFXrJa0ZjZ9XICAVwTiLveb7csbeN8AkeSdd2/XAXVXUsredw0BSwQkZQmZ2/yu0VZjMr/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQMk9n6fHbfsxx7bdHTUFZzdwM6pHwxPn0asLsJT5YIPaF2DRP
	hD9vXS1wXUDZ13M20BZyY288A4cUPJJkai/Pc4uulVv3LXgsycn5JlUDtxHvEQwm47fw/X0j21Z
	xRe3AL67gbLha8uB+qa5VfstW4ydYhh2iTa1AatZ6Iw==
X-Gm-Gg: ASbGncs1zkbCTsjcCG+DRbD2+pZld/UTRnWP6mbh7xa5lxA174Q3zVoNA8/V4FXyj61
	kE8P80LBiATAMxdjcCcnDsUimCvrKE1PQWdOALFYTAfCtl3uGUo/mIAd0b221Fqhp4X81NmhcK+
	tljEWPYMLQQ3xe4QeFRI1TMz+hvXu0aTPDRFeAxTnQaVQUN48DOjtHgn/a698RBJ9F5ujfpk69K
	rB+Iosy
X-Google-Smtp-Source: AGHT+IFyC6XchyD488oOCFrdXunJc7qGIapZSIGWdcX99KZIq/zeH1vE8qmFombtGx4qUvJV13AHJXqkXJEjvfp+pqA=
X-Received: by 2002:a05:6902:2b8b:b0:e90:637a:cb36 with SMTP id
 3f1490d57ef6-e933235e5e4mr362916276.6.1755217618710; Thu, 14 Aug 2025
 17:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
 <20250714-working_dma_0701_v2-v3-6-8b0f5cd71595@riscstar.com> <20250724121916-GYA748228@gentoo>
In-Reply-To: <20250724121916-GYA748228@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 15 Aug 2025 08:26:47 +0800
X-Gm-Features: Ac12FXyMVuK9-KHf4Hpw5gXtsQxmq2I0BGB7NnpjNngaho2sXqjxjvKEDgl5mV0
Message-ID: <CAH1PCMZejR5AxmJC1mRi7KSAXEtOQzfSD99G8+0PFbbASJxW-A@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] riscv: dts: spacemit: Add PDMA0 node for K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_172659_743437_B68D0475 
X-CRM114-Status: GOOD (  20.11  )
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

T24gVGh1LCBKdWwgMjQsIDIwMjUgYXQgODoxOeKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IEhpIEd1b2RvbmcsCj4KPiBPbiAxNzozOSBNb24gMTQgSnVsICAgICAs
IEd1b2RvbmcgWHUgd3JvdGU6Cj4gPiBBZGQgUERNQTAgZG1hLWNvbnRyb2xsZXIgbm9kZSB1bmRl
ciBkbWFfYnVzIGZvciBTcGFjZW1pVCBLMSBTb0MuCj4gPgo+ID4gVGhlIFBETUEwIG5vZGUgaXMg
bWFya2VkIGFzIGRpc2FibGVkIGJ5IGRlZmF1bHQsIGFsbG93aW5nIGJvYXJkLXNwZWNpZmljCj4g
PiBkZXZpY2UgdHJlZXMgdG8gZW5hYmxlIGl0IGFzIG5lZWRlZC4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4KPiA+IC0tLQo+ID4gdjM6Cj4g
PiAtIGFkanVzdCBwZG1hMCBwb3NpdGlvbiwgb3JkZXJpbmcgYnkgZGV2aWNlIGFkZHJlc3MKPiA+
IC0gdXBkYXRlIHByb3BlcnRpZXMgYWNjb3JkaW5nIHRvIHRoZSBuZXdseSBjcmVhdGVkIHNjaGVt
YSBiaW5kaW5nCj4gPiB2MjoKPiA+IC0gVXBkYXRlZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcuCj4g
PiAtIFJlYmFzZWQuIFBhcnQgb2YgdGhlIGNoYW5nZXMgaW4gdjEgaXMgbm93IGluIHRoaXMgcGF0
Y2hzZXQ6Cj4gPiAgICAtICJyaXNjdjogZHRzOiBzcGFjZW1pdDogQWRkIERNQSB0cmFuc2xhdGlv
biBidXNlcyBmb3IgSzEiCj4gPiAgICAtIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI1MDYyMy1rMS1kbWEtYnVzZXMtcmZjLXdpcC12MS0wLWMwMTQ0MDgyMDYxZkBpc2Nhcy5h
Yy5jbi8KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEuZHRzaSB8
IDExICsrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS5kdHNpCj4gPiBpbmRleCBhYmRlOGJiMDdj
OTVjNWE3NDU3MzZhMmRkNmYwYzBlMGQ3YzY5NmU0Li40NmRjMDAyYWY5NDc4OTNjYzJjMjM0ZWU2
MWU2M2MzNzFjZDk2NmNhIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFj
ZW1pdC9rMS5kdHNpCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLmR0
c2kKPiA+IEBAIC02NjAsNiArNjYwLDE3IEBAIGRtYS1idXMgewo+ID4gICAgICAgICAgICAgICAg
ICAgICAgIGRtYS1yYW5nZXMgPSA8MHgwIDB4MDAwMDAwMDAgMHgwIDB4MDAwMDAwMDAgMHgwIDB4
ODAwMDAwMDA+LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8MHgxIDB4
MDAwMDAwMDAgMHgxIDB4ODAwMDAwMDAgMHgzIDB4MDAwMDAwMDA+Owo+ID4KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBwZG1hMDogZG1hLWNvbnRyb2xsZXJAZDQwMDAwMDAgewo+IGRvZXMgSzEg
aGFzIG1vcmUgdGhhbiBvbmUgcGRtYSBjb250cm9sbGVyPyBObz8gYXMgSSBjaGVja2VkLi4KPiBz
bywgSSdkIHN1Z2dlc3Qgc2ltcGx5IG5hbWluZyBpdCBhcyAncGRtYScgLSB3aGljaCBjbGVhciB0
aGUgY29uZnVzaW9uCj4gdGhhdCB0aGVyZSB3aWxsIGJlIG1vcmUgdGhhbiBvbmUgcGRtYSBub2Rl
cy4uCj4KClRoYW5rcyBZaXh1bi4gSSB3aWxsIG5hbWUgaXQgJ3BkbWEnLgoKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic3BhY2VtaXQsazEtcGRtYSI7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ZDQwMDAwMDAgMHgw
IDB4NDAwMD47Cj4gLi4KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVw
dHMgPSA8NzI+Owo+IGZvciBjb25zaXN0ZW5jeSBpbiB0aGlzIGR0c2kgZmlsZSwgSSdkIHN1Z2dl
c3QgbW92aW5nICJpbnRlcnJ1cHRzIiBhZnRlciAiY2xvY2tzIiwKPiBvciBldmVuIGFmdGVyICJy
ZXNldHMiPyBsZWF2ZSAiY2xvY2tzICYgcmVzZXRzIiB0b2dldGhlci4uCj4KClRoYXQgbWFrZXMg
c2Vuc2UuIFdpbGwgZG8uCgpUaGFua3MuCkd1b2RvbmcKCgo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY2xvY2tzID0gPCZzeXNjb25fYXBtdSBDTEtfRE1BPjsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlc2V0cyA9IDwmc3lzY29uX2FwbXUgUkVTRVRfRE1BPjsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRtYS1jaGFubmVscyA9IDwxNj47Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjZG1hLWNlbGxzPSA8MT47Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIH07Cj4gPiArCj4gPiAgICAgICAgICAgICAgICAgICAgICAgdWFydDA6
IHNlcmlhbEBkNDAxNzAwMCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gInNwYWNlbWl0LGsxLXVhcnQiLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJpbnRlbCx4c2NhbGUtdWFydCI7Cj4gPgo+ID4gLS0KPiA+IDIu
NDMuMAo+ID4KPgo+IC0tCj4gWWl4dW4gTGFuIChkbGFuKQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
