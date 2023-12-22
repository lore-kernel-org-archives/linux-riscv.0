Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942D9C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 09:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxDEqJ+mybnNcDYHzi0I84Z21KTKzEuN6iZzf7EFlNk=; b=NtCBWfkr+Cy4eH
	owvKbIwrQnfVtESDz9R/rFash+5fKziY87WJdFUxgXsCFud2Jt0SvNKDoCCFKxNquxnwNevZmqzJw
	ZLvX36JYth4cd6j/lW9SulV1gjMoXwaAE/iljFEYVA2SPeC/NmOMwb5mNOWW3CrfNpdLdV3OKlL4v
	/vvfSgWgTYHMgQjAn+DqK4cGN8k4Big/JkDkVi/6YK8/mniFRFj/QnkP+G8XDFygrVSFjenWYbijz
	rg68GNHTDzP2aVJjrB4WSw/Td62vkkmGnYBO8WqjI3b82j/9wSIoEkS0hiy5+AVNNGiMLlkTEsxkx
	VnJXtSGTBfHVP+/JtgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbuZ-005RJb-09;
	Fri, 22 Dec 2023 09:33:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbuW-005RHz-1O
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 09:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C1891CE1F38
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 09:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0ECCC433C8
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703237612;
	bh=k2rXKI3XPOwdmCyThdzD0BJEHaTvbin4RkfhYTb2Kz8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oWXbw1xBlC41KDNUDLAbtUPkJhx4YGrQrbkTqrCv9GwBzZSFND2pZ4y8Opq/XBRIh
	 6ZD8U9K8my/mYra8d5Rz+XAtkPjw2XjdOHthsDYSJl6Me7gSiTfcorwdud/2BIZGjf
	 wgiEXOVyQCIjdf4h9m1I3RiyyLm2jGfRz+KJamNzNZNYWWfaCjKCJImsyTeeKnTrHQ
	 mt48dWe78QlGYPVy0Jv0h+8szIhYquPW/Fr8bdil3Vrdaby9dYqfiK58jySB8Orwxi
	 kvvpBrb1jqGiC2tHYgNhm22x9w0p4p8F70V+EYQ53Fh5X+wGHRqXE6g2TCn2A/KZd4
	 L6KnxYOfI3P9g==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-552ff8d681aso4981442a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 01:33:32 -0800 (PST)
X-Gm-Message-State: AOJu0Yycic8lwomscsALn4ZNtiKcKVn40unU99BSh5IbJf6Laotmndfk
	JfxHrGB0OgkRELPSKAuH5wjmt8FASx7wtViEyso=
X-Google-Smtp-Source: AGHT+IFzoz5ao5zFeU83eM84CibLxsmg2zWb6TKQTbQ7Xkkm/CAVivGBsWaWuETebeaVVyCjmMgKNz2LQ3f8eizyt+M=
X-Received: by 2002:a17:906:8404:b0:a23:5ea1:651d with SMTP id
 n4-20020a170906840400b00a235ea1651dmr2151343ejx.24.1703237611416; Fri, 22 Dec
 2023 01:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-3-guoren@kernel.org>
 <367b05acb90d4a6e898dd34e4254b697@AcuMS.aculab.com>
In-Reply-To: <367b05acb90d4a6e898dd34e4254b697@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 17:33:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRF-e=7kC3bTnQRVLygcagjs5b1+x-8tTb4PkB+XQniKA@mail.gmail.com>
Message-ID: <CAJF2gTRF-e=7kC3bTnQRVLygcagjs5b1+x-8tTb4PkB+XQniKA@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
To: David Laight <David.Laight@aculab.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>, "charlie@rivosinc.com" <charlie@rivosinc.com>, 
	"xiao.w.wang@intel.com" <xiao.w.wang@intel.com>, "david@redhat.com" <david@redhat.com>, 
	"panqinglin2020@iscas.ac.cn" <panqinglin2020@iscas.ac.cn>, 
	"rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>, "willy@infradead.org" <willy@infradead.org>, 
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "cleger@rivosinc.com" <cleger@rivosinc.com>, 
	"leobras@redhat.com" <leobras@redhat.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Guo Ren <guoren@linux.alibaba.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_013340_928562_CDD0267A 
X-CRM114-Status: GOOD (  13.00  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgNTowMOKAr1BNIERhdmlkIExhaWdodCA8RGF2aWQuTGFp
Z2h0QGFjdWxhYi5jb20+IHdyb3RlOgo+Cj4gRnJvbTogZ3VvcmVuQGtlcm5lbC5vcmcgPGd1b3Jl
bkBrZXJuZWwub3JnPgo+ID4gU2VudDogMjEgRGVjZW1iZXIgMjAyMyAxNTo0Nwo+ID4KPiA+IEZy
b206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPiBXaGVuIHRoZSB0
YXNrIGlzIGluIENPTVBBVCBtb2RlLCB0aGUgYXJjaF9nZXRfbW1hcF9lbmQgc2hvdWxkIGJlIDJH
QiwKPiA+IG5vdCBUQVNLX1NJWkVfNjQuIFRoZSBUQVNLX1NJWkUgaGFzIGNvbnRhaW5lZCBpc19j
b21wYXRfbW9kZSgpCj4gPiBkZXRlY3Rpb24sIHNvIGNoYW5nZSB0aGUgZGVmaW5pdGlvbiBvZiBT
VEFDS19UT1BfTUFYIHRvIFRBU0tfU0laRQo+ID4gZGlyZWN0bHkuCj4KPiBXaHkgMkcgPwo+Cj4g
SUlSQyBmb3IgMzItYml0IG5hdGl2ZSB4ODYgdGhlIGxpbWl0IGlzIDNHLCBidXQgaW4gY29tcGF0
IG1vZGUKPiBpdCBpcyAoanVzdCB1bmRlcikgNEcuCj4KPiBUaGVyZSBpcyBhIHNwZWNpYWwgbW1h
cCBvcHRpb24gKGZvciBwcm9ncmFtcyBsaWtlIHdpbmUpIHRvCj4gbGltaXQgbW1hcCgpIHRvIDJH
LgpUaGUgMkcgYWRkcmVzcyBzcGFjZSBzZWVtcyBlbm91Z2ggZm9yIGEgc21hbGwgbWVtb3J5IHNj
ZW5hcmlvLCBhbmQgSQphZ3JlZSB0aGUgY29tcGF0IG1vZGUgY291bGQgc3VwcG9ydCA0RywgYnV0
IGl0IHNob3VsZCBiZSBhbm90aGVyCmZlYXR1cmUuCgpXZSBsaW1pdGVkIG91ciBydjMyIGFwcGxp
Y2F0aW9ucyB0byB1bmRlciAyR0IgYmVjYXVzZSB3ZSB3YW50IHRvIGxlYXZlCm1vcmUgYWRkcmVz
cyBzcGFjZSBmb3IgdGhlIGtlcm5lbCBzaWRlIChPdXIgczY0aWxwMzIga2VybmVsIG5lZWRzCnZt
bWFwIHN0YWNrLCBrYXNhbiAuLi4pLgoKCj4KPiAgICAgICAgIERhdmlkCj4KPiAtCj4gUmVnaXN0
ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBL
ZXluZXMsIE1LMSAxUFQsIFVLCj4gUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykKPgoK
Ci0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
