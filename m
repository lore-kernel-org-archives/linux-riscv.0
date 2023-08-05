Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE13C00528
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 00:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gg7KdLFfatPRHTjmHby1Q/drprWTFhFsfwES7A6hIkQ=; b=gcCCRt266+YhNW
	7um5aaEPNExg3ViJtJbdLF3LKBtn7skpj8m7ju9WcmQfRuOFEagSzWzApBEDuC4tSq0he+za0M5Bg
	/GgKm6GsWlPElZ2In926SGFPD/aD4QrI3cDWGvobMh5uCRKguF2MiRf8x1AbOeNuR13UUWjk4kKkk
	IodtSoe31LjH4i8kxGS+kwMyi0YwY+ltyQr77ALh6AfLKsZ2+/1ZP7ScBCCk20V34zzjgwIIthsQM
	AYyaRP+tmKleDVMzUQwIB6I5zE9+paD5K//NEO8dEPneqitPDvVKxcbDTTLYe+0PqVNoXsSvygBwX
	bTFYw7uYuXdKXVqyayVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS4ig-00DSfg-0q;
	Sat, 05 Aug 2023 00:00:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS4id-00DSfL-1r
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 00:00:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4DB462179
	for <linux-riscv@lists.infradead.org>; Sat,  5 Aug 2023 00:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37162C433CA
	for <linux-riscv@lists.infradead.org>; Sat,  5 Aug 2023 00:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691193630;
	bh=5Btpzxhwy1py8ALbN0tM+A7Ge6dF3mwFVy6nXkQlmKo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eHg8q74soKjL8GBTtjCMrgfDMcNwEBGBZQcjVtWxmuWQzyH/AsT5nCzjSXTywS6mu
	 dFbDR2LBLY+QOfey7Vui25pzACNvo2FECm5AoGpXSGRJURWuZiFDtGxPlgWCcPRj2x
	 pxPxeKjf1qHhkFmuT4hnCsH/THkv7ihf6TGeeFnyatlcmbsYrJWgUqVbo6KsPE9xV8
	 H+N+ZDrOY2AkzCHj9q26v5KXLTB6f+RNHB68ZZhlY7iZLwCaA2WL2MjlHzjQ35ocMd
	 fx6WR5SNuqKFv7kgo9HNzgfnSOW5UZuOj7LKAUFCnzVYYnk/tBQUxZ/Pf8927DoA4W
	 m4wfZvN2V71Jw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fe0c566788so4416134e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 17:00:30 -0700 (PDT)
X-Gm-Message-State: AOJu0YyUTKldIoakc3OfYg+VU1AdgycqTPjU9bZi0Q6E8rPy1IllCBll
	R6diZD51x1FBHESF7yBkWvrGIGuaKv4Ec7r55hg=
X-Google-Smtp-Source: AGHT+IEKI58N3NWiaE/N0pKPD7u3M2jBQakRchM73rux7MoJqLdEL20FtKq2N2P/Wc72GvEC8LJRvGgtDJZzCAph1jo=
X-Received: by 2002:a19:915c:0:b0:4fa:21d4:b3ca with SMTP id
 y28-20020a19915c000000b004fa21d4b3camr2229529lfj.2.1691193628194; Fri, 04 Aug
 2023 17:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230614013018.2168426-1-guoren@kernel.org> <20230614013018.2168426-2-guoren@kernel.org>
 <ZM1tGgcJg0silFaJ@zx2c4.com> <CAHmME9p3VoZco0+io6pZDnzKVdnP4vr4XWNaAPXGew+1RmfVig@mail.gmail.com>
 <20230804-hut-morbidity-126fc9158f38@spud>
In-Reply-To: <20230804-hut-morbidity-126fc9158f38@spud>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 4 Aug 2023 20:00:16 -0400
X-Gmail-Original-Message-ID: <CAJF2gTQncTuXZ=QO_F4MGFLWEe8yrTHPVzr7_-axa-Mx7LDyFA@mail.gmail.com>
Message-ID: <CAJF2gTQncTuXZ=QO_F4MGFLWEe8yrTHPVzr7_-axa-Mx7LDyFA@mail.gmail.com>
Subject: Re: [PATCH -next V13 1/3] riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
To: Conor Dooley <conor@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, arnd@arndb.de, palmer@rivosinc.com, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	bjorn@kernel.org, cleger@rivosinc.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_170031_706506_C7A68F7D 
X-CRM114-Status: GOOD (  23.70  )
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

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA1OjQx4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgQXVnIDA0LCAyMDIzIGF0IDExOjI4OjE3UE0gKzAy
MDAsIEphc29uIEEuIERvbmVuZmVsZCB3cm90ZToKPiA+IE9uIEZyaSwgQXVnIDQsIDIwMjMgYXQg
MTE6MjjigK9QTSBKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IEhpIEd1bywKPiA+ID4KPiA+ID4gT24gVHVlLCBKdW4gMTMsIDIwMjMgYXQgMDk6
MzA6MTZQTSAtMDQwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+ID4gRnJvbTogR3Vv
IFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPiA+Cj4gPiA+ID4gQWRkIGluZGVw
ZW5kZW50IGlycSBzdGFja3MgZm9yIHBlcmNwdSB0byBwcmV2ZW50IGtlcm5lbCBzdGFjayBvdmVy
Zmxvd3MuCj4gPiA+ID4gSXQgaXMgYWxzbyBjb21wYXRpYmxlIHdpdGggVk1BUF9TVEFDSyBieSBh
cmNoX2FsbG9jX3ZtYXBfc3RhY2suCj4gPiA+ID4KPiA+ID4gPiBUZXN0ZWQtYnk6IEppc2hlbmcg
WmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVu
IDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJl
biA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+ID4gQ2M6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBicm9rZSB0aGUgV2lyZUd1YXJk
IHRlc3Qgc3VpdGUuIEkndmUgYXR0YWNoZWQgdGhlIC5jb25maWcKPiA+ID4gZmlsZSB0aGF0IGl0
IHVzZXMuIEknbSBhYmxlIHRvIGZpeCBpdCBieSBzZXR0aW5nIENPTkZJR19FWFBFUlQ9eSBhbmQK
PiA+ID4gQ09ORklHX0lSUV9TVEFDS1M9biB0byBlc3NlbnRpYWxseSByZXZlcnNlIHRoZSBlZmZl
Y3Qgb2YgdGhpcyBwYXRjaC4gQnV0Cj4gPiA+IEknZCByYXRoZXIgbm90IGRvIHRoYXQuCj4gPiA+
Cj4gPiA+IEFueSBpZGVhIHdoYXQncyB1cD8KPgo+IEdpdmVuIHlvdXIgY29uZmlnLCBJIHN1c3Bl
Y3QgeW91J3JlIGhpdHRpbmcgdGhlIGlzc3VlIHRoYXQgaXMgcmVzb2x2ZWQKPiBieSBHdW8gUmVu
J3Mgc2VyaWVzOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjMwNzE2
MDAxNTA2LjM1MDYwNDEtMS1ndW9yZW5Aa2VybmVsLm9yZy8KVGh4IENvbm9yJ3MgcmVwbHkuCgo+
Cj4gSG9wZWZ1bGx5IHRoYXQncyBpdCwKPiBDb25vci4KPgo+ID4gPgo+ID4gPiBUaGFua3MsCj4g
PiA+IEphc29uCj4gPgo+ID4gQW5kLCBlcnIsIEkgZ3Vlc3MgSSBmYWlsZWQgdG8gZGVzY3JpYmUg
d2hhdCdzIGJyb2tlbiBleGFjdGx5LiBIZXJlJ3MKPiA+IHdoYXQgaGFwcGVuczoKPiA+Cj4gPiB0
aW1lb3V0IC0tZm9yZWdyb3VuZCAyMG0gcWVtdS1zeXN0ZW0tcmlzY3Y2NCBcCj4gPiAgICAgICAg
LW5vZGVmYXVsdHMgXAo+ID4gICAgICAgIC1ub2dyYXBoaWMgXAo+ID4gICAgICAgIC1zbXAgNCBc
Cj4gPiAgICAgICAgLWNwdSBydjY0IC1tYWNoaW5lIHZpcnQgXAo+ID4gICAgICAgIC1tIDI1Nk0g
XAo+ID4gICAgICAgIC1zZXJpYWwgc3RkaW8gXAo+ID4gICAgICAgIC1jaGFyZGV2Cj4gPiBmaWxl
LHBhdGg9L2hvbWUvengyYzQvUHJvamVjdHMvd2lyZWd1YXJkLWxpbnV4L3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3dpcmVndWFyZC9xZW11L2J1aWxkL3Jpc2N2NjQvcmVzdWx0LGlkPXJlc3VsdAo+
ID4gXAo+ID4gICAgICAgIC1kZXZpY2UgdmlydGlvLXNlcmlhbC1kZXZpY2UgLWRldmljZSB2aXJ0
c2VyaWFscG9ydCxjaGFyZGV2PXJlc3VsdCBcCj4gPiAgICAgICAgLW5vLXJlYm9vdCBcCj4gPiAg
ICAgICAgLW1vbml0b3Igbm9uZSBcCj4gPiAgICAgICAgLWtlcm5lbCAvaG9tZS96eDJjNC9Qcm9q
ZWN0cy93aXJlZ3VhcmQtbGludXgvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvd2lyZWd1YXJkL3Fl
bXUvYnVpbGQvcmlzY3Y2NC9rZXJuZWwvYXJjaC9yaXNjdi9ib290L0ltYWdlCj4gPgo+ID4gT3Bl
blNCSSB2MS4yCj4gPiAgIF9fX18gICAgICAgICAgICAgICAgICAgIF9fX19fIF9fX18gX19fX18K
PiA+ICAvIF9fIFwgICAgICAgICAgICAgICAgICAvIF9fX198ICBfIFxfICAgX3wKPiA+IHwgfCAg
fCB8XyBfXyAgIF9fXyBfIF9fIHwgKF9fXyB8IHxfKSB8fCB8Cj4gPiB8IHwgIHwgfCAnXyBcIC8g
XyBcICdfIFwgXF9fXyBcfCAgXyA8IHwgfAo+ID4gfCB8X198IHwgfF8pIHwgIF9fLyB8IHwgfF9f
X18pIHwgfF8pIHx8IHxfCj4gPiAgXF9fX18vfCAuX18vIFxfX198X3wgfF98X19fX18vfF9fX18v
X19fX198Cj4gPiAgICAgICAgfCB8Cj4gPiAgICAgICAgfF98Cj4gPgo+ID4gUGxhdGZvcm0gTmFt
ZSAgICAgICAgICAgICA6IHJpc2N2LXZpcnRpbyxxZW11Cj4gPiBQbGF0Zm9ybSBGZWF0dXJlcyAg
ICAgICAgIDogbWVkZWxlZwo+ID4gUGxhdGZvcm0gSEFSVCBDb3VudCAgICAgICA6IDQKPiA+IFBs
YXRmb3JtIElQSSBEZXZpY2UgICAgICAgOiBhY2xpbnQtbXN3aQo+ID4gUGxhdGZvcm0gVGltZXIg
RGV2aWNlICAgICA6IGFjbGludC1tdGltZXIgQCAxMDAwMDAwMEh6Cj4gPiBQbGF0Zm9ybSBDb25z
b2xlIERldmljZSAgIDogdWFydDgyNTAKPiA+IFBsYXRmb3JtIEhTTSBEZXZpY2UgICAgICAgOiAt
LS0KPiA+IFBsYXRmb3JtIFBNVSBEZXZpY2UgICAgICAgOiAtLS0KPiA+IFBsYXRmb3JtIFJlYm9v
dCBEZXZpY2UgICAgOiBzaWZpdmVfdGVzdAo+ID4gUGxhdGZvcm0gU2h1dGRvd24gRGV2aWNlICA6
IHNpZml2ZV90ZXN0Cj4gPiBGaXJtd2FyZSBCYXNlICAgICAgICAgICAgIDogMHg4MDAwMDAwMAo+
ID4gRmlybXdhcmUgU2l6ZSAgICAgICAgICAgICA6IDIzNiBLQgo+ID4gUnVudGltZSBTQkkgVmVy
c2lvbiAgICAgICA6IDEuMAo+ID4KPiA+IERvbWFpbjAgTmFtZSAgICAgICAgICAgICAgOiByb290
Cj4gPiBEb21haW4wIEJvb3QgSEFSVCAgICAgICAgIDogMAo+ID4gRG9tYWluMCBIQVJUcyAgICAg
ICAgICAgICA6IDAqLDEqLDIqLDMqCj4gPiBEb21haW4wIFJlZ2lvbjAwICAgICAgICAgIDogMHgw
MDAwMDAwMDAyMDAwMDAwLTB4MDAwMDAwMDAwMjAwZmZmZiAoSSkKPiA+IERvbWFpbjAgUmVnaW9u
MDEgICAgICAgICAgOiAweDAwMDAwMDAwODAwMDAwMDAtMHgwMDAwMDAwMDgwMDNmZmZmICgpCj4g
PiBEb21haW4wIFJlZ2lvbjAyICAgICAgICAgIDogMHgwMDAwMDAwMDAwMDAwMDAwLTB4ZmZmZmZm
ZmZmZmZmZmZmZiAoUixXLFgpCj4gPiBEb21haW4wIE5leHQgQWRkcmVzcyAgICAgIDogMHgwMDAw
MDAwMDgwMjAwMDAwCj4gPiBEb21haW4wIE5leHQgQXJnMSAgICAgICAgIDogMHgwMDAwMDAwMDhm
ZTAwMDAwCj4gPiBEb21haW4wIE5leHQgTW9kZSAgICAgICAgIDogUy1tb2RlCj4gPiBEb21haW4w
IFN5c1Jlc2V0ICAgICAgICAgIDogeWVzCj4gPgo+ID4gQm9vdCBIQVJUIElEICAgICAgICAgICAg
ICA6IDAKPiA+IEJvb3QgSEFSVCBEb21haW4gICAgICAgICAgOiByb290Cj4gPiBCb290IEhBUlQg
UHJpdiBWZXJzaW9uICAgIDogdjEuMTIKPiA+IEJvb3QgSEFSVCBCYXNlIElTQSAgICAgICAgOiBy
djY0aW1hZmRjaAo+ID4gQm9vdCBIQVJUIElTQSBFeHRlbnNpb25zICA6IHRpbWUsc3N0Ywo+ID4g
Qm9vdCBIQVJUIFBNUCBDb3VudCAgICAgICA6IDE2Cj4gPiBCb290IEhBUlQgUE1QIEdyYW51bGFy
aXR5IDogNAo+ID4gQm9vdCBIQVJUIFBNUCBBZGRyZXNzIEJpdHM6IDU0Cj4gPiBCb290IEhBUlQg
TUhQTSBDb3VudCAgICAgIDogMTYKPiA+IEJvb3QgSEFSVCBNSURFTEVHICAgICAgICAgOiAweDAw
MDAwMDAwMDAwMDE2NjYKPiA+IEJvb3QgSEFSVCBNRURFTEVHICAgICAgICAgOiAweDAwMDAwMDAw
MDBmMGI1MDkKPiA+IFt0ZXJtaW5hdGVzL2hhbmdzIGhlcmVdCj4gPgo+ID4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCgotLSAKQmVz
dCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
