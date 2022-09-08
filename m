Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A291C38145
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 09:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSYnZTbnJfVsskwS+nkuBM3+O2EBrwT42ATx+Myyj28=; b=WZ6o3bMRkgSV7d
	hKp7y1YJpK/hw9MJW8NiNtaUx46EqKTVAxQ4tLRE97thnlaDu+UiYB820Mku9DCIv8vLky847Rbuw
	BSGl7g8ElE5gqqTtorSw5SJ/qncnLW8lJZf0r0m8qCNez+Sr7Ro51oI7hPnp+4A42NeCziMcvvmot
	Ht/UhOoLrVWYwTq2aJ5WZDHY59XMmxak6KVFN4soiEOVRqEl51+1LSKPXC8t71ihCQHClnEwYvNv1
	ESrbvz6oX8FxTZEX2ahE8g7OyevTCh767Y31DapSrBjNWSn7I9IFmYjXpu/TRUhEzPG1M9nsW49Cw
	CuKf6/VmhJPb+4jL9EoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWDTP-001KT5-VB; Thu, 08 Sep 2022 09:05:23 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWDTM-001K2x-KF
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 09:05:22 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 28B182B05F4F;
	Thu,  8 Sep 2022 05:05:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Thu, 08 Sep 2022 05:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1662627907; x=
	1662631507; bh=+4JBKyAgNVyjuO006dBopVHz/GfCNknoVdO7ePY3/Hk=; b=C
	mcN0b/Od190n5MB0AdCLVFloes8ieySxEWAWqoGU4VGEhq+HpQXAdss5LDBNdtak
	Iac9/dkzpcDMALjjhFgcy7ubvhpd32g/Hk1jHdd346BD9cpqEbt+4zAQAXxL48eV
	AZiGdAckOmTQxCbLIjl4KZA/fLfbx/USfMPPDRiaTo3nIGbMsK4iyHebSH7QSw/p
	qCUrYrwkw+esyl4OvrU4GGya31novdNFCHY0qbngYdeY+6BVvvMjHSjRa/ywyUKX
	oG9hIrS50AaGE67DDHQbHhyWk7EQtUP/wZW1mtI7dCkegj0Kaqn1LANOPibqWmzR
	x37tO/2DerEmm3Aax1K9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662627907; x=
	1662631507; bh=+4JBKyAgNVyjuO006dBopVHz/GfCNknoVdO7ePY3/Hk=; b=j
	m3vqUBDfEvIx2QMQAkNXrw6a+bx7x3E7c6/fKzMcib9tkSOgwo/myH6xOcN+vRaC
	U70gsxP7gwLeZy3+ExVtgxi+IeEFXJNHqgv7x7eSIT4l4NiNTq2F99k+R/MvTH5f
	idht99RCqxXdYQ58xFLJeiGCPnf9L2cd+ONMzbhHMvywpuSKZ0CQdaQmxjvilgau
	yKGzabIFzOZiUMOacyxc+83ys09wNBlZkTKoeICvqsj+IErAl1VxM+4BDe9E5e/W
	PFuErol62Qbw9UYprmAjqvKgOQELCDrpiLMU8WddpkXMIoY/B6XftdEfUMzRf6if
	uLyHC/pHlAiyxh072SqoQ==
X-ME-Sender: <xms:QrAZY_dbG31HtUcpaNeQxBDzBR_nFQScOqMh5mJDCYQFFMU13sBSXg>
    <xme:QrAZY1Mu8Bqhlev1Fc1n2s7c_En5tWvLv4PeyOlRBsBjTM_cnTWZH55u1EjiHB_zD
    aKGh_yrkKyjY8o6hY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtvddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:QrAZY4ijxueD9zKsbowy653ahcuHJrSNOypzTMi1yP67FiiMGAgo9w>
    <xmx:QrAZYw89wxygUMlhNz8tcjXS4BiBGfr07yglIEKEHp-6UnD9fCvYBA>
    <xmx:QrAZY7s9FDDlNkrEqB0lLip6DdRRDmDSW_J6FuYWUuXXlVLrHB7rag>
    <xmx:Q7AZY0G7qXDQM-beMAjWGZHqemwXc-2oPtVmS3gfrTC3F0EvZFYatNaHp3w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0D5A8B60083; Thu,  8 Sep 2022 05:05:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-927-gf4c98c8499-fm-20220826.002-gf4c98c84
Mime-Version: 1.0
Message-Id: <d03941e4-5ea6-4ff3-887a-423f5caedf4c@www.fastmail.com>
In-Reply-To:  <CAMuHMdWVcoHqPa5AqoPqvw=ZuHdqG7p5HWOHUx9ecNZvzUG4Xw@mail.gmail.com>
References: <mhng-d98d3324-5f4b-4cb0-a116-522b124dcdea@palmer-ri-x1c9>
 <7423117.EvYhyI6sBW@kista>
 <84f28dc3-3b65-ea70-4fa4-765d0c773c28@microchip.com>
 <CAMuHMdWVcoHqPa5AqoPqvw=ZuHdqG7p5HWOHUx9ecNZvzUG4Xw@mail.gmail.com>
Date: Thu, 08 Sep 2022 11:04:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Conor.Dooley" <Conor.Dooley@microchip.com>
Cc: "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Chen-Yu Tsai" <wens@csie.org>,
 linux-sunxi@lists.linux.dev, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Olof Johansson" <olof@lixom.net>
Subject: Re: [PATCH 00/12] riscv: Allwinner D1 platform support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_020521_299422_C534CA76 
X-CRM114-Status: GOOD (  13.28  )
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

T24gVGh1LCBTZXAgOCwgMjAyMiwgYXQgOTowMCBBTSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Ogo+IE9uIFdlZCwgU2VwIDcsIDIwMjIgYXQgMTA6NDMgUE0gPENvbm9yLkRvb2xleUBtaWNyb2No
aXAuY29tPiB3cm90ZToKPj4gT24gMDYvMDkvMjAyMiAyMToyOSwgSmVybmVqIMWga3JhYmVjIHdy
b3RlOgo+PiA+IERuZSDEjWV0cnRlaywgMDEuIHNlcHRlbWJlciAyMDIyIG9iIDIwOjEwOjEzIENF
U1QgamUgUGFsbWVyIERhYmJlbHQgbmFwaXNhbChhKToKPj4gPj4gT24gU3VuLCAxNCBBdWcgMjAy
MiAyMjowODowMyBQRFQgKC0wNzAwKSwgc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZToKPj4gPj4+
ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDEtY2xvY2t3b3JrcGktdjMu
MTQuZHRzIGNyZWF0ZQo+PiA+Pj4gIG1vZGUgMTAwNjQ0Cj4+ID4+PiAgYXJjaC9yaXNjdi9ib290
L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxLWNvbW1vbi1yZWd1bGF0b3JzLmR0c2kgY3JlYXRlCj4+
ID4+PiAgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQx
LWRldnRlcm0tdjMuMTQuZHRzCj4+ID4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4+ID4+PiAgYXJj
aC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxLWRvbmdzaGFuLW5lemhhLXN0dS5k
dHMgY3JlYXRlCj4+ID4+PiAgbW9kZSAxMDA2NDQKPj4gPj4+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L2FsbHdpbm5lci9zdW4yMGktZDEtbGljaGVlLXJ2LTg2LXBhbmVsLTQ4MHAuZHRzCj4+ID4+PiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0Cj4+ID4+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIv
c3VuMjBpLWQxLWxpY2hlZS1ydi04Ni1wYW5lbC03MjBwLmR0cwo+PiA+Pj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NAo+PiA+Pj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMS1s
aWNoZWUtcnYtODYtcGFuZWwuZHRzaSBjcmVhdGUKPj4gPj4+ICBtb2RlIDEwMDY0NCBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDEtbGljaGVlLXJ2LWRvY2suZHRzCj4+ID4+
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIw
aS1kMS1saWNoZWUtcnYuZHRzCj4+ID4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4+ID4+PiAgYXJj
aC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxLW1hbmdvcGktbXEtcHJvLmR0cyBj
cmVhdGUgbW9kZQo+PiA+Pj4gIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9z
dW4yMGktZDEtbmV6aGEuZHRzIGNyZWF0ZSBtb2RlCj4+ID4+PiAgMTAwNjQ0IGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMS5kdHNpCj4+ID4+Cj4+ID4+IEknbSBhc3N1bWlu
ZyB0aGVzZSBhcmUgYWltZWQgYXQgdGhlIFJJU0MtViB0cmVlPyAgSSdtIGdlbmVyYWxseSBPSyB3
aXRoCj4+ID4+IHRoYXQsIHRob3VnaCB0aGUgRFQgZm9sa3MgaGF2ZSBwb2ludGVkIG91dCBhIGhh
bmRmdWwgb2YgaXNzdWVzIHRoYXQgbG9vawo+PiA+PiBwcmV0dHkgcmVhc29uYWJsZSB0byBtZS4K
Pj4gPgo+PiA+IERUIGNoYW5nZXMgZm9yIEFsbHdpbm5lciBBUk0gU29DcyBnbyB0cm91Z2ggc3Vu
eGkgdHJlZS4gU2hvdWxkIHRoaXMgYmUgaGFuZGxlZAo+PiA+IGRpZmZlcmVudGx5IGZvciBSSVND
LVY/Cj4+Cj4+IE1pY3JvY2hpcCBSSVNDLVYgRFQgZ28gdmlhIGEgTWljcm9jaGlwIHRyZWUgdG8g
UGFsbWVyLiBUaGUgb3RoZXIgc3R1ZmYgZ2V0cwo+PiBwaWNrZWQgZGlyZWN0bHkgYnkgaGltIGFz
IGl0IGhhcyBubyBjbGVhciAib3duZXIiLiBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UKPj4gdG8g
YmUgY29uc2lzdGVudCBmb3IgdGhlIG5ldyB7cmVuZXNhcyxzdW54aX0gc3R1ZmYgYW5kIHNlbmQg
dGhvc2UgdmlhIHZlbmRvcgo+PiB0cmVlcyB0byBQYWxtZXIgdG9vLiBKdXN0IG15IDIgY2VudHMu
Li4KPgo+IFdhc24ndCB0aGUgaW50ZW50aW9uIGJlaGluZCB0aGUgcmVuYW1lIHMvYXJtLXNvYy9z
b2MvIHRvIHN0YXJ0Cj4gYWNjZXB0aW5nIFBScyBmb3Igbm9uLWFybSBEVCwgdG9vPwo+IEVzcGVj
aWFsbHkgaWYgd2Ugc3RhcnQgaGF2aW5nIGRlcGVuZGVuY2llcyBkdWUgdG8gcmlzY3YgRFRTIGZp
bGVzCj4gaW5jbHVkaW5nIGFybTY0IERUUyBzbmlwcGV0cyB0aHJvdWdoIHNjcmlwdHMvZHRjL2lu
Y2x1ZGUtcHJlZml4ZXMvYXJtNjQvLgoKWWVzLCBhYnNvbHV0ZWx5LiBNeSBpbXByZXNzaW9uIHdh
cyB0aGF0IG1vc3QgYXJjaGl0ZWN0dXJlCm1haW50YWluZXJzIHByZWZlciB0byBoYW5kbGUgdGhl
IFNvQyBzdXBwb3J0IHRoZW1zZWx2ZXMsIGFuZApJIHdvdWxkIG5vdCB3YW50IHRvIHN0ZXAgb24g
YW55b25lJ3MgdG9lcyB3aXRoIHRoaXMsIGJ1dCBJJ20KZGVmaW5pdGVseSBoYXBweSB0byB0YWtl
IHB1bGwgcmVxdWVzdHMgZm9yIGR0cyBmaWxlcyBldGMgb24KYW55IGFyY2hpdGVjdHVyZSBpZiB0
aGF0IGhlbHBzLgoKICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
