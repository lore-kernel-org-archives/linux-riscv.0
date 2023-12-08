Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08991C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 01:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmi9WiSACdHJeAaOAEE5hEm3tpaKXSsllhlWaVWCEVo=; b=idvje5G44AsDqC
	bjoZcKi5Yhb6iPaCbXwWmCcm4qJQ3dllcVDYy2CSASkgFlmifQZl64stAqcg6JyduA3p2WQryAZuV
	r8aH3Wb8g2pQKKphVUJhU+mLaBlVedoN5zoTY5o0qkh/wX5sdxS6Dynwu/Bwad+JDqdJZPafYf2co
	9RP6H+/Z7TnSoUhRjqrU9oNT972fYUADE/uQyDKKQN//+gmBZbfpZgBdAfRawHCvEJUsaEHecVsRL
	EA/ZivqGm2utgKZNNlQ42gWfT2xp9IenoikUT5ZZIyYfIjUwOnQpFoWtOGCSCZBOzUBnDIvX+m43J
	gk+bIchRHuBKRsFgYiUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBQ0R-00EUkG-3A;
	Fri, 08 Dec 2023 01:50:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBQ0P-00EUjN-0H
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 01:50:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A911CE236E;
	Fri,  8 Dec 2023 01:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87CFC433C7;
	Fri,  8 Dec 2023 01:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702000211;
	bh=8AivNxnB656tRHSe2fXOSDD3zu3/bxUYioH4swsST14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f9qCwfZ0UskUmg58lyYLFKsRZ9IZ4oanS1CsN6cMTPCzg+zCKc/1FB28mjRRHKJlF
	 112+HURh2Nek5ZybJ/TVFD4ISNyuLVOOu78sZoC60/iUenWdHFoqVihoSD+IxCbBo6
	 HFRieHRA8Y8CQVEkZgVXwEdv1geDJalhGAQ2DifSWNhIYACcb2gFGzWPw1mOgEH1wm
	 d86xd5XyLjh02lEYL+XQD/l1y7QfRLhNqTHIx4EKrcayFRpid563bS0QT4bBKY7U7w
	 L5f6D65LGAQMG5O5f1cVANxhYNHkqSOftS5dtwT7DbD6NF7UYtM1mheqbTBIIz3IkE
	 HqQuqOc5GjoGg==
Date: Thu, 7 Dec 2023 20:50:05 -0500
From: Guo Ren <guoren@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Masahiro Yamada <masahiroy@kernel.org>, Nam Cao <namcaov@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix SMP when shadow call stacks are enabled
Message-ID: <ZXJ2TaXU7dhjphl5@gmail.com>
References: <20231121211958.3158576-1-samuel.holland@sifive.com>
 <CABCJKufwox6C5BprNF=rDUxfV532OcawqZBsv5hFejJgrfZ+FA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABCJKufwox6C5BprNF=rDUxfV532OcawqZBsv5hFejJgrfZ+FA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_175017_320828_DE54D665 
X-CRM114-Status: GOOD (  16.55  )
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

T24gRnJpLCBEZWMgMDEsIDIwMjMgYXQgMDk6NDA6NTVBTSAtMDgwMCwgU2FtaSBUb2x2YW5lbiB3
cm90ZToKPiBIaSBTYW11ZWwsCj4gCj4gT24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgMToyMOKAr1BN
IFNhbXVlbCBIb2xsYW5kCj4gPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4K
PiA+IFRoaXMgZml4ZXMgdHdvIGJ1Z3MgaW4gU0NTIGluaXRpYWxpemF0aW9uIGZvciBzZWNvbmRh
cnkgQ1BVcy4gRmlyc3QsCj4gPiB0aGUgU0NTIHdhcyBub3QgaW5pdGlhbGl6ZWQgYXQgYWxsIGlu
IHRoZSBzcGlud2FpdCBib290IHBhdGguIFNlY29uZCwKPiA+IHRoZSBjb2RlIGZvciB0aGUgU0JJ
IEhTTSBwYXRoIGF0dGVtcHRlZCB0byBpbml0aWFsaXplIHRoZSBTQ1MgYmVmb3JlCj4gPiBlbmFi
bGluZyB0aGUgTU1VLiBIb3dldmVyLCB0aGF0IGludm9sdmVzIGRlcmVmZXJlbmNpbmcgdGhlIHRo
cmVhZAo+ID4gcG9pbnRlciwgd2hpY2ggcmVxdWlyZXMgdGhlIE1NVSB0byBiZSBlbmFibGVkLgo+
ID4KPiA+IEZpeCBib3RoIGlzc3VlcyBieSBzZXR0aW5nIHVwIHRoZSBTQ1MgaW4gdGhlIGNvbW1v
biBzZWNvbmRhcnkgZW50cnkKPiA+IHBhdGgsIGFmdGVyIGVuYWJsaW5nIHRoZSBNTVUuCj4gCj4g
VGhhbmtzIGZvciB0aGUgcGF0Y2ghIExvb2tzIGxpa2UgbXkgcWVtdSBzZXR1cCBkb2Vzbid0IGhp
dCB0aGlzIGlzc3VlLAo+IGJ1dCBuZXZlcnRoZWxlc3MsIHRoZSBmaXggbG9va3MgZ29vZCB0byBt
ZS4KQmVjYXVzZSB0aGVyZSBpcyBubyBmdW5jdGlvbiBjYWxsIGluIHJlbG9jYXRlX2VuYWJsZV9t
bXUgOikKCj4gCj4gUmV2aWV3ZWQtYnk6IFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2YW5lbkBnb29n
bGUuY29tPgo+IAo+IFNhbWkKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
