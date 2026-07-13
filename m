Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967A6C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 15:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kbq2wAv68n+4GmlpXrcNiNVYyRUy8mbrYwKIiPGI2fQ=; b=QvNoHJ8FtqUc4c
	UJTfMFPXP6P3IlE97ubq4kRZd1lIo26JgB+EvNTi3UJV+Z4sbclYCs9HvF51QHT9jfAW31HcN72cA
	UE0HsYWputgBfRcNQcfymFCy86SKoVOJ+yPvb9eRQGp203F+/hf+VNmz50pENpovDTCgRQpFu0V6+
	jldL5fdIMiJxEOwcrj1osKt4XKVzSINtB3/X7BrU4q3soO36m5g37MjhQ/Ab3NbEMlFkLqmnOci/9
	O0P8Hoq9WHc63eRnkKAqM2Fw63dQUYeweITj72MnyhLNp2YmKkFZ1ZG/cO9JrdnNCpCVFKU2mA1Za
	hYyS25XF3eC6jl2loahw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjICo-00000009iiT-1Smk;
	Mon, 13 Jul 2026 15:04:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjICn-00000009ii3-1WbB
	for linux-riscv@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=q8n+QaMEuJqrqloV8S/HPmVYYpG0MPjKiFB8NNDgUFc=; b=Ttt8b8OEX0dsdkLjzW8oD+Mhis
	Kk0mqxIhVr8H3lYnRBwcEfTKhtTBBNEcoQaiv4vNfLvFZGqo+FymNYwZBmh+PoLR/TzhXMwVZaDFr
	jbUbexKtlhpJROAZf0Yi/7BliD546Qp58wcibnpbbVHnCpjFZLEAXXi+SWU+Kj5LaWFXV3yzVVEgE
	7T78eqn3ZepEMDvX3qkfP1WmjUAmQjvppf3PYPtbjUR9P4vsua+gybC8bqOWZ7ztx/vKERMQkSKTq
	ZJqej2mABcFjN9Wwlw+pXlb2zIVzGT6ZWioClB6T71oCTfW3zEUkR9HSMBeTCTucE6QaA91FYG6h5
	XhdaO9ZQ==;
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjICk-0000000BkmJ-1U6S
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 15:04:24 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-81e8fa1b8d6so22948987b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2026 08:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783955060; cv=none;
        d=google.com; s=arc-20260327;
        b=kLu02aWexDntwJ0UGP7Y2aXV5SrRYJzI4oItiUkXZa/e3l/3vYnTGRp5SbZXdMyJEG
         CjvpLpNm87x7Osw6/gLKSr2TS+xxcrxvT00NaYeD8i4R3DIGhmeMxfHtINID5s1dwRWm
         W6wyX8T4fMIOfBq+PV96fH33l5CtcE1qcAc3wc3AIyBU7baQXhW2VJL75LZI7/1lti0k
         Hl14thVs94dlmpJZLgpczLTZ+bPDC1BpJt4cq82eKyjRR7+SkDd0LYNK0Kfv1RTXHxTK
         rAJOF5PuI+GLTlWKmedjCMu+Bua2wxjpdZ+DS07hpnNBXw6a1Wo+FyoGwyTyPMgKTvkU
         68NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q8n+QaMEuJqrqloV8S/HPmVYYpG0MPjKiFB8NNDgUFc=;
        fh=W5mBrnvLvO8E4Bb0pGXGSNjakpbLOI/MR8WOg7LsBN8=;
        b=rvnsDdvbYX5JIGafs8L0R/JrWTaqsK6RHlujuSZGuyHvnJxVdGxLtORpgWFwsHjE/m
         KE/mvI0xOjWs/V7noyuA1eHsmUJMPsdodEdYQhH9p8DYZnnD0APVFPYWzUYH6067YpfW
         cmjc8/5QFjVQ9f4L+4YJSkwKf30bW4tEGzIwK2xRd52MOA3DxKk+apsNdFB4buZO0iIi
         E8JRgAe6e9vH1qoadCawPQvgLzCCQljOqieabb8BjWF2hLJQ9k79F4T+q+NKmlbgenMF
         deJrL9ph1Q6DxsoXIiR3SQjBfueKCNs+BaZjGspOFEjoxhTlKSjsHTgUMAQKCf59lz82
         3Tvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1783955060; x=1784559860; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q8n+QaMEuJqrqloV8S/HPmVYYpG0MPjKiFB8NNDgUFc=;
        b=fw9GgsJ0hb18suCfpkUaibdnBk8t0Yh6Hl64iUAQRQ+bBizA62mV7zMIHwFEmK4rYC
         zZ8ujjFJXGnrPjmLLUQ9Ico5ei43G2/+vdDrX9VeXwYcH8MfqDylFRy5Xk4cEs6LTF9P
         OY6Nk1J2YO3+R1FcLovx138CxSWI+RWapP9GAERvEs2ePKxTNgGeboy228zxz+FHIOgd
         JXqL85pq0QRuGqvX949l+QKxAbaJZRKe1OnSmmaS1XKI4vRrj2xSUTHc5NwNM5Tb+IHX
         m/2AsxVQTLz3y5vWQQ89Bm74FVPkGDbyPf8pC3XGOgY7ryn/shUUwi0D+PbY38RYS4xT
         ouNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955060; x=1784559860;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8n+QaMEuJqrqloV8S/HPmVYYpG0MPjKiFB8NNDgUFc=;
        b=ju6/yUsUrE4Lt8hLm70x40KmQvQ/uk7GialykJwtnUfkewUGbzP4zeDC0Gfg3yd2Ma
         XdQZ8ieD/vpLHI+W93g5cvIkhZXQtmnC12RhF7j60sVFsw3HspZjo0kMmUpthvZQRYnT
         IkJdT9D/2GWJVAy0fa5rLzQsJz342aJQTVGRHgbt1VRNsh5VRs0086hcoKbA18Ez3SeR
         Tasd3+56tUNCGMCGIbE5pRhmiaH+VNGdx4wWdUXlKa8eQybHUQucJGZWAR9+nucRdy76
         aHzAKFc8BhUlTJ8w8U5ktPQLAQoczr+IhYtpIihfvaRMKDzTbwIPYKMMwrytgZQ8uTX8
         +xvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpsg+w1GvAGip0loRAwltx/BzZohfcnjYAZmBOjjVig1jWDs2/zrwKPoFqtB7jUvB8/VnKLDFa5jeLgIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyoowjCQiDapQB1tusYg9XWDzhsIIjprA8H1E90APfXp/7Q7cV
	zRNn9ee+M1eD/hdLuIWnc3xFGEAqQAl+vLiBgtCmrYa6kTNej81SCyiAvEaGGJae281ukp6s1ET
	swy9JpxNdvDbghuJ2vENjMdPRaYe57iLQV27M+q5UBQ==
X-Gm-Gg: AfdE7ckCRnShDxobWV+Hj6VqpJFhNi1wFoe8cSoLryfvK6u2UsUw7ZLWT/f4BSjlulx
	pe0ITARdmBIwxgwRNz9vOpghecXbVaq8sBJNh+Dm26iW79QTQFzMpIH9/NGBvwIDVq0VGI8OSi0
	82TfrF2LoJObXESSKzn/p+O0GwKfqKsYw2L+kLnJeBTMJWjJi+wqdSMtJ9nSwI9Ide3/yiToBH1
	spbmq9tLLiCI0RX/kvXr/yKWNX0ih2UFH5glToWr/rIta3qG4zCmTbcpSNDcvY7CdDJnKQMWFKv
	3tNrq2HxnVlZdGmCQY7/HgqbuhI=
X-Received: by 2002:a05:690c:6c90:b0:80c:85b6:75ba with SMTP id
 00721157ae682-81e902d8144mr73453177b3.67.1783955060060; Mon, 13 Jul 2026
 08:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260709040415.977784-1-inochiama@gmail.com> <20260709040415.977784-3-inochiama@gmail.com>
 <2ml6mcgwkf4eidwjetmd75henrkig4zzugzfww7buirucddho7@qrs4gasurnv3> <alRmA-X4xbQ9zPFn@inochi.infowork>
In-Reply-To: <alRmA-X4xbQ9zPFn@inochi.infowork>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 13 Jul 2026 10:04:09 -0500
X-Gm-Features: AUfX_mygn974aliQ_zk7qpCoilxAZo7T3vjRorPpP-S-Z4fzXu4A4fxxFoW4GGA
Message-ID: <CAEev2e8ZyM+b9qLxS6NZjkBZy5GFz37vjgtEfH0ax24nfPozow@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: k3: Add PCIe device node
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_160422_525646_35F9FD5D 
X-CRM114-Status: GOOD (  28.49  )
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

SGkgSW5vY2hpLAoKT24gU3VuLCBKdWwgMTIsIDIwMjYgYXQgMTE6MTnigK9QTSBJbm9jaGkgQW1h
b3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgSnVsIDEyLCAyMDI2
IGF0IDExOjEzOjA3UE0gLTA1MDAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90ZToKPiA+IEhpIElu
b2NoaSwKPiA+Cj4gPiBPbiBUaHUsIEp1bCAwOSwgMjAyNiBhdCAxMjowNDoxNFBNICswODAwLCBJ
bm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gPiBBZGQgYWxsIFBDSWUgZGV2aWNlIG5vZGUgZm9yIFNw
YWNlbWl0IEszLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJbm9jaGkgQW1hb3RvIDxpbm9j
aGlhbWFAZ21haWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3Bh
Y2VtaXQvazMtcGljby1pdHguZHRzIHwgIDM4ICsrKysKPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9k
dHMvc3BhY2VtaXQvazMtcGluY3RybC5kdHNpIHwgIDMzICsrKysKPiA+ID4gIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaSAgICAgICAgIHwgMTk1ICsrKysrKysrKysrKysrKysr
KysKPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjY2IGluc2VydGlvbnMoKykKPiA+ID4KPiA+Cj4g
PiBJIHNlZSBzb21lIHdhcm5pbmdzIHByaW50ZWQgZHVyaW5nIHByb2JlCj4gPgo+ID4gWyAgIDEw
Ljg0Mjk1NV0gcjgxNjkgMDAwMjowMTowMC4wOiBvZl9pcnFfcGFyc2VfcGNpOiBmYWlsZWQgd2l0
aCByYz0tMjIKPiA+Cj4gPiBbICAgMTAuOTM3NzU0XSBydHc4OV84ODUyYmUgMDAwNDowMTowMC4w
OiBvZl9pcnFfcGFyc2VfcGNpOiBmYWlsZWQgd2l0aCByYz0tMjIKPiA+Cj4KPiBUaGlzIGlzIGFu
IGV4cGVjdGVkIGVycm9yIGJlY2F1c2UgdGhlIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IElOVHgK
PiBidXQgdGhlIGhhcmR3YXJlIGNsYWltcyBpdCBzdXBwb3J0cy4gU2luY2UgdGhlIHZlbmRvciBk
b2VzIG5vdCB3YW50Cj4gdG8gc3VwcG9ydCBpdCwgc28gdGhlcmUgaXMgbm8gd2F5IGZvciB0aGUg
dXBzdHJlYW1lciB0byBhZGQgdGhpcy4KCkFyZSB5b3Ugc2F5aW5nIHRoYXQgdGhlIGhhcmR3YXJl
IGFkdmVydGlzZXMgc3VwcG9ydCBmb3IgSU5UeCwgYnV0CnNwYWNlbWl0IGhhc24ndCBwcm92aWRl
ZCBhIGRyaXZlciB0aGF0IHVzZXMgaXQ/CgpJcyB0aGVyZSBhIHdheSB0byBsZXQgdGhlIGRyaXZl
ciBrbm93IHRvIG5vdCB0cnkgc2V0dGluZyB1cCBsZWdhY3kKaW50ZXJydXB0cyB0aGVuPyBJdCBz
ZWVtcyBsaWtlIGl0J3MgdHJ5aW5nIHRvIGRvIHRoYXQgbm93LCBhbmQgZmFpbGluZwp0byBmaW5k
IGludGVycnVwdHMgbm9kZSBpbiB0aGUgRFQuCgo+Cj4gPiBJIHNlZSB0aGF0IGFsbCB0aGUgMyBy
YyBub2RlcyBhcmUgbWlzc2luZyBhbiBpbnRlcnJ1cHRzIG5vZGUgYW5kIGFuCj4gPiBpbnRlcnJ1
cHQgcGFyZW50IChzYXBsaWMpLiBUaGUgdmVuZG9yIERUIHNlZW1zIHRvIGhhdmUgdGhpcy4gTm90
IHN1cmUgaWYKPiA+IHRoaXMgaXMgcmVsYXRlZC4KPiA+Cj4gPiBUaGUgMTBHIGV0aGVybmV0IHBy
b2JlcyBmaW5lLCBidXQgdGhlIHdpZmkgY2FyZCBmYWlscyB0byBwcm9iZS4gU2VlbXMKPiA+IGxp
a2UgdGhlIGNhcmQgaXMgdHJ5aW5nIHRvIHJlcXVlc3QgMzIgYml0IERNQSBhZGRyZXNzZXMgYW5k
IHdlJ3JlCj4gPiBmYWlsaW5nIGNhdXNlIHdlIGhhdmUgNjQgYml0IG1lbW9yeSBvbmx5Lgo+ID4g
VGhlIHZlbmRvciBrZXJuZWwgc2VlbXMgdG8gaGF2ZSBhIHBhdGNoIHRvIGVuYWJsZSAzNiBiaXQg
RE1BIGluCj4gPiB0aGUgcnR3ODkgZHJpdmVyLiBUaGF0J2xsIHByb2JhYmx5IGZpeCB0aGlzLgo+
ID4KPgo+IFRoaXMgd2FybmluZyBpcyBhbHNvIGZvdW5kIG9uIG15IHRlc3QsIGl0IGlzIG5vdCBy
ZWxhdGVkIHRvCj4gdGhlIFBDSWUgZHJpdmVyLCBidXQgYSBsYWNrIG9mIHRoZSBSVEwgcGh5IGRy
aXZlci4gOigKPgo+IFlvdSBtYXkgYWxzbyBub3RpY2VkIGEgYmFkIHBlcmZvcm1hbmNlIG9uIHRo
aXMgMTBHIGV0aGVybmV0LAo+IGl0IGlzIGNhdXNlZCBieSB0aGUgc2luZ2xlIHF1ZXVlIHVzZWQg
YnkgdGhlIFJUTCBkcml2ZXIuCj4gSUlSQywgZXZlbiA5ODAwIFgzRCBjYW4gbm90IGFjaGlldmUg
dGhlIG1heCBzcGVlZC4KCkkgZG9uJ3QgaGF2ZSB0aGUgYWJpbGl0eSB0byB0ZXN0IHRoZSAxMEcg
TklDIHVuZm9ydHVuYXRlbHkgOigKClJlZ2FyZHMKQW5pcnVkaCBTcmluaXZhc2FuCgo+Cj4gUmVn
YXJkcywKPiBJbm9jaGkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
