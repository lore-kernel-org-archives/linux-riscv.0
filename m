Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2638DEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 18:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzNND48C726UgUXb6quDhsY9R8mt1kbz0oJGqaNbXXg=; b=O36gRNqXQ53WZf
	c78GRF/9pn3hbQe/zqpFx4IzHT3snTeYk64uDF/krEbvu3YDjoLaSYuw1q808k2Ocbwa5VZpHfQrG
	884YBjeYNGYz3HrGsdshIcAOY8ruG7QGU6bfXiHwQCAsSgRKze/Kxn4aDHteAzYOZG2iFAyv4Cd9K
	Sz8N9agOSpWH07MnstbZq0SO+4FucNLL/VteHcYIqvnneZy2QRaevoRxUrgaITPS2Tb5SvB/TOdL+
	bGJfF+uqWDr3X0uKfVix0VX2/gWaxDpjQK5iTwmGAN362Ru8QnFPwh/NOetIlfzElGusLoAnmp5/K
	kZCLhYXNJHxH8FstG5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAE2G-001PT2-0c;
	Fri, 16 Jun 2023 18:19:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAE2D-001PRZ-1o;
	Fri, 16 Jun 2023 18:18:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 03D0C62EDD;
	Fri, 16 Jun 2023 18:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C86C43397;
	Fri, 16 Jun 2023 18:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686939535;
	bh=JYIeppGROaSwt5RJCAxNQJPfExACzvun2YHFgIEWjL0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IzPKo+jK4luEJPBN0IXaMM9NoBohQwylmyD6SOtRwX+YHgT9pt8MIqbXkSBPR6OVR
	 /VjE3RPenLmbkl9jNPpLgItztd650j/5i4Va33yoTKpPExRZlBgNWOG1So983jlXQF
	 yVTlXF+vQ1OIFfDaYs9xwGLtC0FMaZ8PTvXNpCHGP797MMhtKNhJYcskAyFP4r0ORW
	 jRQGM3yRcA+dWCLV7mIEN2p/2GyNuYsQzdtYWVtVoCRZNrnYvu2dHR+Lw2iUXJxquc
	 FLnychOVPaAoWGd242H5r7TyNYDZiDO+1rDQAW2lvEG/PSv9+R2O/6b7/dZeA4YGtc
	 +8sk6it3T0tMw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f76b6db73fso2716029e87.1;
        Fri, 16 Jun 2023 11:18:55 -0700 (PDT)
X-Gm-Message-State: AC+VfDyOfqpuFilMH0Tj8pmCgWauwtq4tPlQNHVLkg2OF4296QTnjXr1
	p+uXGZ/YAW87gseVFY892hESXUcpVLpexZllG6w=
X-Google-Smtp-Source: ACHHUZ6PUs5qG5gEz0Ui+rYTOBYo1CNjp/5QXhNKC7wMrP1gtK8A+svd4/31TT3PuRRLSD+QiqJSaxjJua7jMaFtZ74=
X-Received: by 2002:ac2:4c4c:0:b0:4f6:3ef3:13e8 with SMTP id
 o12-20020ac24c4c000000b004f63ef313e8mr2671938lfk.0.1686939533810; Fri, 16 Jun
 2023 11:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-3-rppt@kernel.org>
 <ZIySQgafdTHk5Yet@moria.home.lan>
In-Reply-To: <ZIySQgafdTHk5Yet@moria.home.lan>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:18:41 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5hnH3Tq+rO1XJEAieDtr61xHBDRmp+C5zRYV5ajRcDFQ@mail.gmail.com>
Message-ID: <CAPhsuW5hnH3Tq+rO1XJEAieDtr61xHBDRmp+C5zRYV5ajRcDFQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and jit_text_alloc()
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_111857_683031_AE4F7D55 
X-CRM114-Status: GOOD (  24.30  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgOTo0OOKAr0FNIEtlbnQgT3ZlcnN0cmVldAo8a2VudC5v
dmVyc3RyZWV0QGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAxNiwgMjAyMyBhdCAx
MTo1MDoyOEFNICswMzAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gRnJvbTogIk1pa2UgUmFw
b3BvcnQgKElCTSkiIDxycHB0QGtlcm5lbC5vcmc+Cj4gPgo+ID4gbW9kdWxlX2FsbG9jKCkgaXMg
dXNlZCBldmVyeXdoZXJlIGFzIGEgbWVhbiB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGNvZGUuCj4g
Pgo+ID4gQmVzaWRlIGJlaW5nIHNlbWFudGljYWxseSB3cm9uZywgdGhpcyB1bm5lY2Vzc2FyaWx5
IHRpZXMgYWxsIHN1YnN5c3RlbXMKPiA+IHRoYXQgbmVlZCB0byBhbGxvY2F0ZSBjb2RlLCBzdWNo
IGFzIGZ0cmFjZSwga3Byb2JlcyBhbmQgQlBGIHRvIG1vZHVsZXMKPiA+IGFuZCBwdXRzIHRoZSBi
dXJkZW4gb2YgY29kZSBhbGxvY2F0aW9uIHRvIHRoZSBtb2R1bGVzIGNvZGUuCj4gPgo+ID4gU2V2
ZXJhbCBhcmNoaXRlY3R1cmVzIG92ZXJyaWRlIG1vZHVsZV9hbGxvYygpIGJlY2F1c2Ugb2YgdmFy
aW91cwo+ID4gY29uc3RyYWludHMgd2hlcmUgdGhlIGV4ZWN1dGFibGUgbWVtb3J5IGNhbiBiZSBs
b2NhdGVkIGFuZCB0aGlzIGNhdXNlcwo+ID4gYWRkaXRpb25hbCBvYnN0YWNsZXMgZm9yIGltcHJv
dmVtZW50cyBvZiBjb2RlIGFsbG9jYXRpb24uCj4gPgo+ID4gU3RhcnQgc3BsaXR0aW5nIGNvZGUg
YWxsb2NhdGlvbiBmcm9tIG1vZHVsZXMgYnkgaW50cm9kdWNpbmcKPiA+IGV4ZWNtZW1fdGV4dF9h
bGxvYygpLCBleGVjbWVtX2ZyZWUoKSwgaml0X3RleHRfYWxsb2MoKSwgaml0X2ZyZWUoKSBBUElz
Lgo+ID4KPiA+IEluaXRpYWxseSwgZXhlY21lbV90ZXh0X2FsbG9jKCkgYW5kIGppdF90ZXh0X2Fs
bG9jKCkgYXJlIHdyYXBwZXJzIGZvcgo+ID4gbW9kdWxlX2FsbG9jKCkgYW5kIGV4ZWNtZW1fZnJl
ZSgpIGFuZCBqaXRfZnJlZSgpIGFyZSByZXBsYWNlbWVudHMgb2YKPiA+IG1vZHVsZV9tZW1mcmVl
KCkgdG8gYWxsb3cgdXBkYXRpbmcgYWxsIGNhbGwgc2l0ZXMgdG8gdXNlIHRoZSBuZXcgQVBJcy4K
PiA+Cj4gPiBUaGUgaW50ZW50aW9uIHNlbWFudGljcyBmb3IgbmV3IGFsbG9jYXRpb24gQVBJczoK
PiA+Cj4gPiAqIGV4ZWNtZW1fdGV4dF9hbGxvYygpIHNob3VsZCBiZSB1c2VkIHRvIGFsbG9jYXRl
IG1lbW9yeSB0aGF0IG11c3QgcmVzaWRlCj4gPiAgIGNsb3NlIHRvIHRoZSBrZXJuZWwgaW1hZ2Us
IGxpa2UgbG9hZGFibGUga2VybmVsIG1vZHVsZXMgYW5kIGdlbmVyYXRlZAo+ID4gICBjb2RlIHRo
YXQgaXMgcmVzdHJpY3RlZCBieSByZWxhdGl2ZSBhZGRyZXNzaW5nLgo+ID4KPiA+ICogaml0X3Rl
eHRfYWxsb2MoKSBzaG91bGQgYmUgdXNlZCB0byBhbGxvY2F0ZSBtZW1vcnkgZm9yIGdlbmVyYXRl
ZCBjb2RlCj4gPiAgIHdoZW4gdGhlcmUgYXJlIG5vIHJlc3RyaWN0aW9ucyBmb3IgdGhlIGNvZGUg
cGxhY2VtZW50LiBGb3IKPiA+ICAgYXJjaGl0ZWN0dXJlcyB0aGF0IHJlcXVpcmUgdGhhdCBhbnkg
Y29kZSBpcyB3aXRoaW4gY2VydGFpbiBkaXN0YW5jZQo+ID4gICBmcm9tIHRoZSBrZXJuZWwgaW1h
Z2UsIGppdF90ZXh0X2FsbG9jKCkgd2lsbCBiZSBlc3NlbnRpYWxseSBhbGlhc2VkIHRvCj4gPiAg
IGV4ZWNtZW1fdGV4dF9hbGxvYygpLgo+ID4KPiA+IFRoZSBuYW1lcyBleGVjbWVtX3RleHRfYWxs
b2MoKSBhbmQgaml0X3RleHRfYWxsb2MoKSBlbXBoYXNpemUgdGhhdCB0aGUKPiA+IGFsbG9jYXRl
ZCBtZW1vcnkgaXMgZm9yIGV4ZWN1dGFibGUgY29kZSwgdGhlIGFsbG9jYXRpb25zIG9mIHRoZQo+
ID4gYXNzb2NpYXRlZCBkYXRhLCBsaWtlIGRhdGEgc2VjdGlvbnMgb2YgYSBtb2R1bGUgd2lsbCB1
c2UKPiA+IGV4ZWNtZW1fZGF0YV9hbGxvYygpIGludGVyZmFjZSB0aGF0IHdpbGwgYmUgYWRkZWQg
bGF0ZXIuCj4KPiBJIGxpa2UgdGhlIEFQSSBzcGxpdCAtIGF0IHRoZSByaXNrIG9mIGZ1cnRoZXIg
YmlrZXNoZWRkaW5nLCBwZXJoYXBzCj4gbmVhcl90ZXh0X2FsbG9jKCkgYW5kIGZhcl90ZXh0X2Fs
bG9jKCk/IFdvdWxkIGJlIG1vcmUgZXhwbGljaXQuCj4KPiBSZXZpZXdlZC1ieTogS2VudCBPdmVy
c3RyZWV0IDxrZW50Lm92ZXJzdHJlZXRAbGludXguZGV2PgoKQWNrZWQtYnk6IFNvbmcgTGl1IDxz
b25nQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
