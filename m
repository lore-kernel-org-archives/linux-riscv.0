Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10844C54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 04:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZUvDTAJwS+f3T4b2gWqAHJAlvGX+TGqHPQvPxf1xfc=; b=2vCfrmGG29tAYF
	B0UOfxg9xd441rz1/I5oH20miiNpBeMEJWXO7XYgCVFtCGdg9guDYpCpxUI08CJhWVjS5QRZAt8ed
	OoUprv2bIPwKA3P9CiINo/7cI394luKYkpiI3ZE5N+9jv+rxY4HXN+XB3/+PSQWrPAqbhwQ0lcUHa
	Tj2up1iY7rl+xjf5MuXlT/Q5s853AZlP2BzwbG70I4dVv4ldgjqwV5SrMRso8wAyxspmp/dVPiIx5
	oHr8A1TFX84075qA4LqP2uaHt4HrRBHwIqA2lUvIXgTd3CWhB5w1UvJbVAHP2838qAhlr9i12+FrK
	Y/7nROoPCxRMF3+IM6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkyqN-0000000GapD-3Pmw;
	Fri, 15 Mar 2024 04:06:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkyqK-0000000Game-1rL5
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 04:06:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D033CE1F14
	for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 04:06:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97903C433F1
	for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 04:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710475607;
	bh=aEszL1eYHuUQrRaWbEMqIqLr91Z5i2VPp0C2t0X6KIY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FdZuayU5mkzcBq/o+O+0IZyudM7OKwyweH0it1sejpPBugKMVqqri4q9bwe0MmHK0
	 XPpuDD35pQUqHdlIyT1iUm/b6FMWBtkh6MxbEZmbGqwidjLzrB6hihLLUZv0HR0FuO
	 /TZktOdUbUxm2AeJhrtEzjwPxIqAQsncwJcNN6ZX1PMNnj4fP1sDwYV56kUVn9h9Os
	 kC+v1AmuxkXnep0siUaQP9PkR4xD0Pc4j2RunHMJcyjBnf5svyeJAHqUVN+Oipiqfe
	 MiUzDbz/tFcDeO23546JZBIvJF7gtU+fYK4pojYtKiKNn4pGW/Z3ws0Bw5nJDdtZVU
	 ywXwN1vvsCCAA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d46dd8b0b8so19650521fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 21:06:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3uolwkd64mUv+BWtxAmQ7STVNGL4/pMuqSl4jClKoKCOeixNKEyTU/3y0P3t0CUchKUk+ReXm2bnzvgn4YIr0gE4d6TQpqEnddk3OfVaz
X-Gm-Message-State: AOJu0Yw6a6YNWz87zQj5IJ94O3PJtAtFPMjcedG3nQ4ZhoLtcZ/zD4tB
	bUfzYgMhG8E+pNJrIBh9OZ6GYYkvOO4KAw44ge9nRRazL2/nCak9G2a5RljUNENUH1MbrHX+iVz
	Z/ELnVB3SsvyGEvcfG2bngDCJvCA=
X-Google-Smtp-Source: AGHT+IHvMoXiS87S0gUMxFt23So/Yzo5cCR8QxVV+JTA0NOy2me1SReKl03MODdud8gY1g5pnw9EN7ncy20C6SJJUEI=
X-Received: by 2002:a05:651c:615:b0:2d4:992:3cb0 with SMTP id
 k21-20020a05651c061500b002d409923cb0mr2093037lje.6.1710475606307; Thu, 14 Mar
 2024 21:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231117125807.1058477-1-masahiroy@kernel.org>
 <CAK7LNAStoCja1gnoFmsKikbzGZmKTcTu+Vc7v9zg8B9hwsH+iQ@mail.gmail.com>
 <CAK7LNATVAcj-pa_G-NGBTr9doCACGk1nKCNbxM50-M0mi9q=7w@mail.gmail.com> <ca097f2a-59ec-4945-9860-5e380e1665e4@ghiti.fr>
In-Reply-To: <ca097f2a-59ec-4945-9860-5e380e1665e4@ghiti.fr>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 15 Mar 2024 13:06:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNARShVA953-U+p6=wzq3GFsKx4GwpRiqmqftjQz3VkE2VA@mail.gmail.com>
Message-ID: <CAK7LNARShVA953-U+p6=wzq3GFsKx4GwpRiqmqftjQz3VkE2VA@mail.gmail.com>
Subject: Re: [PATCH] riscv: compat_vdso: install compat_vdso.so.dbg to /lib/modules/*/vdso/
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_210652_863343_B6FC6F4E 
X-CRM114-Status: GOOD (  19.20  )
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

T24gVGh1LCBNYXIgNywgMjAyNCBhdCA1OjEy4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdo
aXRpLmZyPiB3cm90ZToKPgo+IEhpIE1hc2FoaXJvLAo+Cj4gT24gMjQvMDIvMjAyNCAwNDozNywg
TWFzYWhpcm8gWWFtYWRhIHdyb3RlOgo+ID4gUGluZyB4IDIgPwo+ID4KPiA+Cj4gPgo+ID4KPiA+
Cj4gPiBPbiBTdW4sIEphbiAyMSwgMjAyNCBhdCA2OjQ44oCvQU0gTWFzYWhpcm8gWWFtYWRhIDxt
YXNhaGlyb3lAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4gT24gRnJpLCBOb3YgMTcsIDIwMjMgYXQg
OTo1OOKAr1BNIE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4+PiAnbWFrZSB2ZHNvX2luc3RhbGwnIGluc3RhbGxzIGRlYnVnIHZkc28gZmlsZXMgdG8gL2xp
Yi9tb2R1bGVzLyovdmRzby8uCj4gPj4+Cj4gPj4+IE9ubHkgZm9yIHRoZSBjb21wYXQgdmRzbyBv
biByaXNjdiwgdGhlIGluc3RhbGxhdGlvbiBkZXN0aW5hdGlvbiBkaWZmZXJzOwo+ID4+PiBjb21w
YXRfdmRzby5zby5kYmcgaXMgaW5zdGFsbGVkIHRvIC9saWIvbW9kdWxlLyovY29tcGF0X3Zkc28v
Lgo+ID4+Pgo+ID4+PiBUbyBmb2xsb3cgdGhlIHN0YW5kYXJkIGluc3RhbGwgZGVzdGluYXRpb24g
YW5kIHNpbXBsaWZ5IHRoZSB2ZHNvX2luc3RhbGwKPiA+Pj4gbG9naWMsIGNoYW5nZSB0aGUgaW5z
dGFsbCBkZXN0aW5hdGlvbiB0byBzdGFuZGFyZCAvbGliL21vZHVsZXMvKi92ZHNvLy4KPiA+Pj4K
PiA+Pj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9y
Zz4KPiA+Pj4gLS0tCj4gPj4KPiA+PiBQaW5nPwo+ID4+IChpbiBjYXNlICJ5ZXQgbW9yZSBSSVND
LVYgdXBkYXRlcyIgaGFwcGVucykKPiA+Pgo+ID4+Cj4gPj4KPiA+Pgo+ID4+PiAgIGFyY2gvcmlz
Y3YvTWFrZWZpbGUgfCAyICstCj4gPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L01ha2Vm
aWxlIGIvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ID4+PiBpbmRleCBhNzRiZTc4Njc4ZWIuLjVjYmU1
OTYzNDVjMSAxMDA2NDQKPiA+Pj4gLS0tIGEvYXJjaC9yaXNjdi9NYWtlZmlsZQo+ID4+PiArKysg
Yi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gPj4+IEBAIC0xNDYsNyArMTQ2LDcgQEAgZW5kaWYKPiA+
Pj4gICBlbmRpZgo+ID4+Pgo+ID4+PiAgIHZkc28taW5zdGFsbC15ICAgICAgICAgICAgICAgICAr
PSBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28uc28uZGJnCj4gPj4+IC12ZHNvLWluc3RhbGwt
JChDT05GSUdfQ09NUEFUKSAgKz0gYXJjaC9yaXNjdi9rZXJuZWwvY29tcGF0X3Zkc28vY29tcGF0
X3Zkc28uc28uZGJnOi4uL2NvbXBhdF92ZHNvL2NvbXBhdF92ZHNvLnNvCj4gPj4+ICt2ZHNvLWlu
c3RhbGwtJChDT05GSUdfQ09NUEFUKSAgKz0gYXJjaC9yaXNjdi9rZXJuZWwvY29tcGF0X3Zkc28v
Y29tcGF0X3Zkc28uc28uZGJnCj4gPj4+Cj4gPj4+ICAgaWZuZXEgKCQoQ09ORklHX1hJUF9LRVJO
RUwpLHkpCj4gPj4+ICAgaWZlcSAoJChDT05GSUdfUklTQ1ZfTV9NT0RFKSQoQ09ORklHX0FSQ0hf
Q0FOQUFOKSx5eSkKPiA+Pj4gLS0KPiA+Pj4gMi40MC4xCj4gPj4+Cj4gPj4KPiA+PiAtLQo+ID4+
IEJlc3QgUmVnYXJkcwo+ID4+IE1hc2FoaXJvIFlhbWFkYQo+ID4KPiA+Cj4gPiAtLQo+ID4gQmVz
dCBSZWdhcmRzCj4gPiBNYXNhaGlybyBZYW1hZGEKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KPgo+IENvdWxkbid0IGNo
YW5naW5nIHRoaXMgbGlicmFyeSBpbnN0YWxsIHBhdGggYnJlYWsgc29tZSBleGlzdGluZwo+IGFw
cGxpY2F0aW9uPyBJIG1lYW4gaXQga2luZCBvZiBicmVha3Mgd2hlcmUgdGhlIGxpYnJhcnkgaXMg
ZXhwZWN0ZWQgdG8KPiBiZSByaWdodD8KCgpEbyB5b3UgaGF2ZSBhIHBhcnRpY3VsYXIgbGlicmFy
eSBpbiBtaW5kPwoKClJJU1YtViBpcyB0aGUgb25seSBhcmNoaXRlY3R1cmUgdGhhdCBpbnN0YWxs
cyBhIGRlYnVnIHZkc28KdG8gYSBkaWZmZXJlbnQgbG9jYXRpb24gdGhhbiB0aGUKc3RhbmRhcmQg
bGliL21vZHVsZXMvKi92ZHNvLy4KCgpJIHJlZ2FyZCB0aGlzIGFzIGEgZml4LgoKCgoKCi0tIApC
ZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
