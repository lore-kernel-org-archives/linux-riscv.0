Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F41CC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SymGQEFEREzYK4o7ZwhEn7svc6EhIA6O9Y4wKGX/8Cw=; b=mqZTjp0w18uNov
	Fjb4PdTpyfnBye/DhNEuNFSLQioYh0Q9L6Fc/vMQHAyiz8mjw+r8HZFMoW5BHRb52mjKnj9L2iErC
	F6oBGbXza9O9P0/Bk/pvnrBrsPWkXgp9NZJ1yWAmCbQKzfULl/Pfi/x3/7XSOrJEFoJddeqUBykb9
	hZ691bka0ygByDFenlvMlUJVjV4vqFdqNmjnUxxERcGVoF5dVzP0QKRuAkbgqOVOhfPKqfxlAk5iJ
	PVNNu50NecW0jcwgl3gMfj4Ps1LTid1y4o7QMWZ+v0Ho2BSq60ueVG9EuptKRcwNS1dK4bQOa0a0d
	EOHOBcSN0CmME8gxnXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODSZ-00000002T8a-2BCg;
	Mon, 01 Jul 2024 09:36:31 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sODSW-00000002T70-3ByE
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 09:36:30 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5858e973ef5so8834a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 02:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719826587; x=1720431387; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8NEAicxK5SOO/DpN859XnH2s6bGeotY7ty6AZrfDFk=;
        b=WoGUSJ2YN9fLFP7lsdcgVQuncSM4bqWxiJl66CNZEp4IpJgjTVaVdpTikVkDpoYOFu
         Khs/HgawSPWZo/BIg4+7loGVH3CiJbfk1z+F3jPYFfd5PKNTDtvLTnIfQ6ntyxHCpxQk
         5EjmNOwUupRnefHCdVePwBkb5d9byctDBbzPeObvJ6iw7gMQ9waztcGFJOp9FZWvAkk9
         p1+6IOHeyvBXFL2KsEovHCPtwjHfoscrRFrRqeo3n65Qd2ju81jjm8XEaiQgOWwVCKtZ
         aIX5T67hgDTt5mf1SNov9QpAZqmQRbwHC7WSBiYzOd0devuuZIpSEDmDtveImciJDdJN
         T7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719826587; x=1720431387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8NEAicxK5SOO/DpN859XnH2s6bGeotY7ty6AZrfDFk=;
        b=VmZh5Y0c3lF6LRbs0vQYBvO4uFkaJDOmrHdC+shxmUNRg4t+GjCznDe6dxfxZiXTz/
         U5txfBeoHWs0g6aAj4wIBGBpq4WpJaTSLeP2SIW9s0uGq7I1i21fuYfi3ZUPN/ocY94M
         DVCGJaJvNpNqClUvkAnx74P5QOuMPu068UE/Ur/zfzKRemscdzp8FIMgSypV7a9Txe+i
         ULY83LYq1QlkDzdOfHcStFkPWI3FcxOLPMiivPl4tqsv8Mwpf7M716QtywoKaGS0D2Sf
         yREcK2C0xpQyk52cC9OcvdygzvuAemw33e2PjaJJIdBucAoK8R9R2XUtX1pvcKWT/YUc
         z5cQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9QhUG4Sq1jf8+9Fh+GGTG+MdDTs9fNHtNNjcVagUA6NW3yeTbXQRijjW+6V9c5PrgkEiAY4zLBJ5UQYIRYKsv7YdBISbn9k5BcJCtOo7Q
X-Gm-Message-State: AOJu0YzzCBvSwCMnF/0N6xez2CjvEOVGAWTAvzAQulPCuED2x8URMFvW
	u+ENPisoGRoWAkTeAylxb6ir/Ufs5euAeCb1TLCmDPnQ3IuX58jRi+6Kc+sgC9Xi61orq1+Hk9M
	OxVbltrlTRA0aLp84dWdPdBWHF3s=
X-Google-Smtp-Source: AGHT+IGoFY6xMELK5Ls4bguzayKxots99jk3JnLXJDzSCuJ1vASo+Aoxy+p728spfGMERimeYlOeJBHUIbWS876Fqh0=
X-Received: by 2002:a05:6402:42c8:b0:57c:57b3:8d0e with SMTP id
 4fb4d7f45d1cf-5879f3ac2fcmr4766371a12.11.1719826586918; Mon, 01 Jul 2024
 02:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240630063845.116307-1-kanakshilledar@gmail.com>
 <20240630-generous-carnation-c534f5d84a8a@spud> <CAGLn_=vG09C49goRkbygZdYch8H1c_kw3p7ar9NGOrgpd0_MiA@mail.gmail.com>
 <20240701-unsnap-unhitched-a84476a719cd@spud>
In-Reply-To: <20240701-unsnap-unhitched-a84476a719cd@spud>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Mon, 1 Jul 2024 15:06:15 +0530
Message-ID: <CAGLn_=tE91_EEW6tV1aTYJQ7dPSTazjd_tc-t0Q7PJQA2ePYQg@mail.gmail.com>
Subject: Re: [PATCH] arch: riscv: thead: implement basic spi
To: Conor Dooley <conor@kernel.org>
Cc: kanakshilledar111@protonmail.com, Serge Semin <fancer.lancer@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_023628_822600_5F84CA40 
X-CRM114-Status: GOOD (  33.53  )
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

T24gTW9uLCBKdWwgMSwgMjAyNCBhdCAzOjAz4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDAxLCAyMDI0IGF0IDAyOjQzOjQ2UE0gKzA1
MzAsIEthbmFrIFNoaWxsZWRhciB3cm90ZToKPiA+IE9uIFN1biwgSnVuIDMwLCAyMDI0IGF0IDc6
MjLigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4g
PiBPbiBTdW4sIEp1biAzMCwgMjAyNCBhdCAxMjowODoyMFBNICswNTMwLCBLYW5hayBTaGlsbGVk
YXIgd3JvdGU6Cj4gPiA+ID4gaW1wbGVtZW50ZWQgYmFzaWMgc3BpIHN1cHBvcnQgZm9yIFRIMTUy
MCBTb0MuCj4gPiA+ID4gY3JlYXRlZCBhIGZpeGVkIGNsb2NrIGFuZCBhIHNpbXBsZSBzcGkwIG5v
ZGUuCj4gPiA+ID4gdXBkYXRlZCB0aGUgbWF0Y2hpbmcgYmluZGluZyB0byBpbmNsdWRlIHRoZWFk
LHRoMTUyMC1zcGkgYXMgY29tcGF0aWJsZS4KPiA+ID4gPiBhZGRlZCBhIHNwaWRldiBkZXZpY2Ug
aW4gZGV2aWNldHJlZSB3aGljaCB3aWxsIHV0aWxpc2UgdGhlIHNwaTAgbm9kZS4KPiA+ID4gPiB0
aGlzIGlzIHVzdWFsbHkgcmVzZXJ2ZWQgZm9yIGEgU1BJIE5PUiBmbGFzaCB3aGljaCBpcyBsZWZ0
IHVucG9wdWxhdGVkCj4gPiA+ID4gdW5kZXJuZWF0aCB0aGUgY2FycmllciBib2FyZC4gSSBwZXJm
b3JtZWQgYSBTUEkgc2VsZiBsb29wIHRlc3QgdXNpbmcKPiA+ID4gPiB0b29scy9zcGkvc3BpZGV2
X3Rlc3QuYyBhbmQgdHJpZWQgc2VuZGluZyBgXHhERVx4QURceEJFXHhFRmAgYW5kIHZlcmlmaWVk
Cj4gPiA+ID4gaXQgaXMgYmVpbmcgcmVjZWl2ZWQgY29ycmVjdGx5LiBpIHVwZGF0ZWQgdGhlIG9m
X2RldmljZV9pZCBzdHJ1Y3QgaW4KPiA+ID4gPiBkcml2ZXJzL3NwaS9zcGktZHctbW1pby5jIHRv
IGluY2x1ZGUgInRoZWFkLHRoMTUyMC1zcGkiIGFzIHRoZSBjb21wYXRpYmxlLgo+ID4gPiA+IHRo
aXMgcGF0Y2ggYWxzbyBhZGRzIGJhc2ljIHNwaSBzdXBwb3J0IG9uIGJlYWdsZXYgYWhlYWQgd2hp
Y2ggc2hhcmVzIHRoZQo+ID4gPiA+IHNhbWUgVEgxNTIwIFNvQy4gaSBoYXZlIG9ubHkgdGVzdGVk
IG9uIExpY2hlZVBpIDRBLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogS2FuYWsgU2hp
bGxlZGFyIDxrYW5ha3NoaWxsZWRhckBnbWFpbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zbnBzLGR3LWFwYi1zc2kueWFtbCB8ICA0ICsrKysK
PiA+ID4gPiAgLi4uL2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1iZWFnbGV2LWFoZWFkLmR0cyAgICAg
IHwgIDkgKysrKysrKysrCj4gPiA+ID4gIC4uLi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVl
LW1vZHVsZS00YS5kdHNpICB8ICA0ICsrKysKPiA+ID4gPiAgLi4uL3Jpc2N2L2Jvb3QvZHRzL3Ro
ZWFkL3RoMTUyMC1saWNoZWUtcGktNGEuZHRzIHwgMTAgKysrKysrKysrKwo+ID4gPiA+ICBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpICAgICAgICAgICAgfCAxNiArKysrKysr
KysrKysrKysrCj4gPiA+ID4gIGRyaXZlcnMvc3BpL3NwaS1kdy1tbWlvLmMgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAxICsKPiA+ID4KPiA+ID4gVGhpcyBuZWVkcyB0byBiZSAzIGRpZmZlcmVu
dCBwYXRjaGVzIC0gb25lIGZvciB0aGUgYmluZGluZywgb25lIGZvciB0aGUKPiA+ID4gZHJpdmVy
IGFuZCBhIGZpbmFsIG9uZSBmb3IgdGhlIGR0cyBmaWxlcy4KPiA+Cj4gPiBJIHdpbGwgY29udmVy
dCB0aGlzIGludG8gYSBwYXRjaCBzZXQgb2YgMyBwYXRjaCBhcyB5b3Ugc3VnZ2VzdGVkLgo+ID4K
PiA+ID4gPiArCj4gPiA+ID4gKyZzcGkwIHsKPiA+ID4gPiArICAgICBzdGF0dXMgPSAib2theSI7
Cj4gPiA+ID4gKyAgICAgc3BpZGV2QDAgewo+ID4gPgo+ID4gPiAic3BpZGV2IiBpcyBub3QgYSB0
eXBlIG9mIGRldmljZSwgdGhlIG5vZGVuYW1lIHNob3VsZCBtYXRjaCB0aGUgdHlwZS4KPiA+ID4K
PiA+ID4gPiArICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicm9obSxkaDIyMjhmdiI7Cj4gPiA+
ID4gKyAgICAgICAgICAgICByZWcgPSA8MD47Cj4gPiA+ID4gKyAgICAgICAgICAgICBzcGktbWF4
LWZyZXF1ZW5jeSA9IDw1MDAwMDA+Owo+ID4gPiA+ICsgICAgIH07Cj4gPiA+ID4gK307Cj4gPiA+
Cj4gPiA+IEknbGwgcHV0IG1vbmV5IG9uIHlvdSBub3QgaGF2aW5nIGEgZGgyMjI4ZnYgb24gdGhp
cyBib2FyZC4gRG9jdW1lbnQgd2hhdAo+ID4gPiB5b3UgYWN0dWFsbHkgaGF2ZSBvbiBpdCBwbGVh
c2UsIG5vdCB3aGF0IGFsbG93cyB5b3UgdG8gcHJvYmUgdGhlIHNwaWRldgo+ID4gPiBkcml2ZXIg
aW4gbGludXguCj4gPgo+ID4gWWVzLCB5b3UgYXJlIHJpZ2h0ISBBY3R1YWxseSBhcyBwZXIgdGhl
IHZlbmRvcidzIGtlcm5lbCBpdCBzaG91bGQgYmUgYQo+ID4gInNwaS1ub3IiIGRldmljZSBmcm9t
IHdpbmJvbmQuCj4gPiBJIGNoYW5nZWQgaXQgdG8gc3BpZGV2IGZvciB0ZXN0aW5nIHB1cnBvc2Vz
LiBTaGFsbCBJIGp1c3QgbGVhdmUgaXQKPiA+IHdpdGggc3RhdHVzID0gIm9rYXkiIG9yIGFkZCB0
aGUgbm9kZSBmb3IKPiA+IHRoYXQgc3BpLW5vciBmbGFzaD8KPgo+IElmIGl0IGlzbid0IG9uIHRo
ZSBib2FyZCwgaXQgc2hvdWxkbid0IGJlIGluIHRoZSBkZXZpY2V0cmVlLiBQbGVhc2UgYWRkCj4g
dGhlIGFjdHVhbCBkZXZpY2UgdGhhdCBpcyBoZXJlIGluc3RlYWQuIElmIHRoZXJlJ3MgYSBib2Fy
ZCB3aXRoIG5vdGhpbmcKPiBjb25uZWN0ZWQsIHRoZW4gcGxlYXNlIGRvbid0IGFkZCBhbnl0aGlu
Zy4KCkFscmlnaHQgZ290IGl0LiBUaGUgU1BJIGZsYXNoIHBhZCBpcyBsZWZ0IHVucG9wdWxhdGVk
IG9uIHRoZSBMaWNoZWVQaSA0QSBib2FyZC4KVGh1cywgSSB3aWxsIG5vdCBtZW50aW9uIGl0IGlu
IHRoZSBkZXZpY2V0cmVlLgoKPiBUaGFua3MsCj4gQ29ub3IuCgpUaGFua3MgYW5kIFJlZ2FyZHMs
CkthbmFrIFNoaWxsZWRhcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
