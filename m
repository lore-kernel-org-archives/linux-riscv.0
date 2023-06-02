Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4CCC7EE24
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z94LaengWSKF6FCuekox56rv5yW9htHp5zFbJb+Nr/I=; b=UtHURow9tPQVL5
	yilYoewbP1wrlviyQxpHPCkTV8dRW9aivfLdbOeV2w5B4aAGjESb4f1Dhxr5ji5sZ4dnlWtAHhpV3
	ixH/ruSov126hEaBOIDvLgMmgxFOPKLlQaU2gobnzJi5ckATpXDzch9d0BqiRv6aS2mfUwnngyY1y
	QSyPpRDgoOKDBbcJQuoJYaURHefC6D7bYg5p6/llzKIMLRHUxr1V+TT/uM5UW3nQlRHxdc7JevS4O
	ZW91Mgzje/1v6mWqqC3/2RaEpHAa6els0cno00lVqBRbW+gVp0IjJp2/Zt8tHlE63etoImt0NRHvv
	F9Ah7N5KiDJT3tHNJhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q59Op-007dE9-1q;
	Fri, 02 Jun 2023 18:21:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q59Ol-007dCN-1B;
	Fri, 02 Jun 2023 18:21:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9125F6514F;
	Fri,  2 Jun 2023 18:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DFAC433EF;
	Fri,  2 Jun 2023 18:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685730074;
	bh=X+6D25ac/ynfkYhL6CVIatM+QSgTz3ZdfLV95/xOw/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m8QqKBlwUZ1OdVsi3iL4i/wpx/dFY6BbtHjhKMAoPALO9d9S1Of5z7SZF4QL6sTbP
	 1AkumCJkUSaKm4k7dCVk+lOGEFZdfq22cqjqj27S/pPlmB3p+6xXv2CNvliSMKoASM
	 /hdXoCMRwv6EJy8J6GYtUkCvLB9u0rcyusLTXlpDOf8Lr4f24TWYjjjFg1gay1e8Ak
	 p/JJ9xBOtMt5dIZYwKQ9oFJD8MWj9f1lt6ZhCj0XTqBGpkRKgNx/tS3niGcx/Matut
	 0hwyzJfj74d+iBjmUiHb0LPXzSLbkWfgBPmkBtc2NCOoUpEnhn1N5112VQidBofQtB
	 l46PC2/nl/Dww==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b03d3e41fcso46586761fa.0;
        Fri, 02 Jun 2023 11:21:13 -0700 (PDT)
X-Gm-Message-State: AC+VfDwhva8Ga/hwJnDcC63tKTdEQno3tfof147cUE31sCpmuDS5/IUM
	yxb387LrsEsvfR7bogSeEKfHUvUnKeYJ29GLQx8=
X-Google-Smtp-Source: ACHHUZ7u+3QRkPB700ZRWSkZS34WuzRLSBXiPs+mDMX8Rtj0TALCowhBg47HVf6nzRS8a/FS2UP95/Ck0Au4nvQTBcE=
X-Received: by 2002:a2e:b55a:0:b0:2b0:59c3:29c9 with SMTP id
 a26-20020a2eb55a000000b002b059c329c9mr217540ljn.6.1685730071990; Fri, 02 Jun
 2023 11:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
In-Reply-To: <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
From: Song Liu <song@kernel.org>
Date: Fri, 2 Jun 2023 11:20:58 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
Message-ID: <CAPhsuW7Euczff_KB70nuH=Hhf2EYHAf=xiQR7mFqVfByhD34XA@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	Puranjay Mohan <puranjay12@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_112115_508377_D5B9D6F8 
X-CRM114-Status: GOOD (  39.68  )
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

T24gRnJpLCBKdW4gMiwgMjAyMyBhdCAyOjM14oCvQU0gTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxh
bmRAYXJtLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1biAwMSwgMjAyMyBhdCAwMjoxNDo1NlBN
IC0wNDAwLCBLZW50IE92ZXJzdHJlZXQgd3JvdGU6Cj4gPiBPbiBUaHUsIEp1biAwMSwgMjAyMyBh
dCAwNToxMjowM1BNICswMTAwLCBNYXJrIFJ1dGxhbmQgd3JvdGU6Cj4gPiA+IEZvciBhIHdoaWxl
IEkgaGF2ZSB3YW50ZWQgdG8gZ2l2ZSBrcHJvYmVzIGl0cyBvd24gYWxsb2NhdG9yIHNvIHRoYXQg
aXQgY2FuIHdvcmsKPiA+ID4gZXZlbiB3aXRoIENPTkZJR19NT0RVTEVTPW4sIGFuZCBzbyB0aGF0
IGl0IGRvZXNuJ3QgaGF2ZSB0byB3YXN0ZSBWQSBzcGFjZSBpbgo+ID4gPiB0aGUgbW9kdWxlcyBh
cmVhLgo+ID4gPgo+ID4gPiBHaXZlbiB0aGF0LCBJIHRoaW5rIHRoZXNlIHNob3VsZCBoYXZlIHRo
ZWlyIG93biBhbGxvY2F0b3IgZnVuY3Rpb25zIHRoYXQgY2FuIGJlCj4gPiA+IHByb3ZpZGVkIGlu
ZGVwZW5kZW50bHksIGV2ZW4gaWYgdGhvc2UgaGFwcGVuIHRvIHVzZSBjb21tb24gaW5mcmFzdHJ1
Y3R1cmUuCj4gPgo+ID4gSG93IG11Y2ggbWVtb3J5IGNhbiBrcHJvYmVzIGNvbmNlaXZhYmx5IHVz
ZT8gSSB0aGluayB3ZSBhbHNvIHdhbnQgdG8gdHJ5Cj4gPiB0byBwdXNoIGJhY2sgb24gY29tYmlu
YXRvcmlhbCBuZXcgYWxsb2NhdG9ycywgaWYgd2UgY2FuLgo+Cj4gVGhhdCBkZXBlbmRzIG9uIHdo
bydzIHVzaW5nIGl0LCBhbmQgaG93IChlLmcuIHZpYSBCUEYpLgo+Cj4gVG8gYmUgY2xlYXIsIEkn
bSBub3QgbmVjZXNzYXJpbHkgYXNraW5nIGZvciBlbnRpcmVseSBkaWZmZXJlbnQgYWxsb2NhdG9y
cywgYnV0Cj4gSSBkbyB0aGlua2cgdGhhdCB3ZSB3YW50IHdyYXBwZXJzIHRoYXQgY2FuIGF0IGxl
YXN0IHBhc3MgZGlzdGluY3Qgc3RhcnQrZW5kCj4gcGFyYW1ldGVycyB0byBhIGNvbW1vbiBhbGxv
Y2F0b3IsIGFuZCBmb3IgYXJtNjQncyBtb2R1bGVzIGNvZGUgSSdkIGV4cGVjdCB0aGF0Cj4gd2Un
ZCBrZWVwIHRoZSByYW5nZSBmYWxibGFjayBsb2dpYyBvdXQgb2YgdGhlIGNvbW1vbiBhbGxjb2F0
b3IsIGFuZCBqdXN0IGNhbGwKPiBpdCB0d2ljZS4KPgo+ID4gPiA+IFNldmVyYWwgYXJjaGl0ZWN0
dXJlcyBvdmVycmlkZSBtb2R1bGVfYWxsb2MoKSBiZWNhdXNlIG9mIHZhcmlvdXMKPiA+ID4gPiBj
b25zdHJhaW50cyB3aGVyZSB0aGUgZXhlY3V0YWJsZSBtZW1vcnkgY2FuIGJlIGxvY2F0ZWQgYW5k
IHRoaXMgY2F1c2VzCj4gPiA+ID4gYWRkaXRpb25hbCBvYnN0YWNsZXMgZm9yIGltcHJvdmVtZW50
cyBvZiBjb2RlIGFsbG9jYXRpb24uCj4gPiA+ID4KPiA+ID4gPiBUaGlzIHNldCBzcGxpdHMgY29k
ZSBhbGxvY2F0aW9uIGZyb20gbW9kdWxlcyBieSBpbnRyb2R1Y2luZwo+ID4gPiA+IGppdF90ZXh0
X2FsbG9jKCksIGppdF9kYXRhX2FsbG9jKCkgYW5kIGppdF9mcmVlKCkgQVBJcywgcmVwbGFjZXMg
Y2FsbAo+ID4gPiA+IHNpdGVzIG9mIG1vZHVsZV9hbGxvYygpIGFuZCBtb2R1bGVfbWVtZnJlZSgp
IHdpdGggdGhlIG5ldyBBUElzIGFuZAo+ID4gPiA+IGltcGxlbWVudHMgY29yZSB0ZXh0IGFuZCBy
ZWxhdGVkIGFsbG9jYXRpb24gaW4gYSBjZW50cmFsIHBsYWNlLgo+ID4gPiA+Cj4gPiA+ID4gSW5z
dGVhZCBvZiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgb3ZlcnJpZGVzIGZvciBtb2R1bGVfYWxsb2Mo
KSwgdGhlCj4gPiA+ID4gYXJjaGl0ZWN0dXJlcyB0aGF0IHJlcXVpcmUgbm9uLWRlZmF1bHQgYmVo
YXZpb3VyIGZvciB0ZXh0IGFsbG9jYXRpb24gbXVzdAo+ID4gPiA+IGZpbGwgaml0X2FsbG9jX3Bh
cmFtcyBzdHJ1Y3R1cmUgYW5kIGltcGxlbWVudCBqaXRfYWxsb2NfYXJjaF9wYXJhbXMoKSB0aGF0
Cj4gPiA+ID4gcmV0dXJucyBhIHBvaW50ZXIgdG8gdGhhdCBzdHJ1Y3R1cmUuIElmIGFuIGFyY2hp
dGVjdHVyZSBkb2VzIG5vdCBpbXBsZW1lbnQKPiA+ID4gPiBqaXRfYWxsb2NfYXJjaF9wYXJhbXMo
KSwgdGhlIGRlZmF1bHRzIGNvbXBhdGlibGUgd2l0aCB0aGUgY3VycmVudAo+ID4gPiA+IG1vZHVs
ZXM6Om1vZHVsZV9hbGxvYygpIGFyZSB1c2VkLgo+ID4gPgo+ID4gPiBBcyBhYm92ZSwgSSBzdXNw
ZWN0IHRoYXQgZWFjaCBvZiB0aGUgY2FsbHNpdGVzIHNob3VsZCBwcm9iYWJseSBiZSB1c2luZyBj
b21tb24KPiA+ID4gaW5mcmFzdHJ1Y3R1cmUsIGJ1dCBJIGRvbid0IHRoaW5rIHRoYXQgYSBzaW5n
bGUgaml0X2FsbG9jX2FyY2hfcGFyYW1zKCkgbWFrZXMKPiA+ID4gc2Vuc2UsIHNpbmNlIHRoZSBw
YXJhbWV0ZXJzIGZvciBlYWNoIGNhc2UgbWF5IG5lZWQgdG8gYmUgZGlzdGluY3QuCj4gPgo+ID4g
SSBkb24ndCBzZWUgaG93IHRoYXQgZm9sbG93cy4gVGhlIHdob2xlIHBvaW50IG9mIGZ1bmN0aW9u
IHBhcmFtZXRlcnMgaXMKPiA+IHRoYXQgdGhleSBtYXkgYmUgZGlmZmVyZW50IDopCj4KPiBXaGF0
IEkgbWVhbiBpcyB0aGF0IGppdF9hbGxvY19hcmNoX3BhcmFtcygpIHRyaWVzIHRvIGFnZ3JlZ2F0
ZSBjb21tb24KPiBwYXJhbWV0ZXJzLCBidXQgdGhleSBhcmVuJ3QgYWN0dWFsbHkgY29tbW9uIChl
LmcuIHRoZSBhY3R1YWwgc3RhcnQrZW5kIHJhbmdlCj4gZm9yIGFsbG9jYXRpb24pLgo+Cj4gPiBD
YW4geW91IGdpdmUgbW9yZSBkZXRhaWwgb24gd2hhdCBwYXJhbWV0ZXJzIHlvdSBuZWVkPyBJZiB0
aGUgb25seSBleHRyYQo+ID4gcGFyYW1ldGVyIGlzIGp1c3QgImRvZXMgdGhpcyBhbGxvY2F0aW9u
IG5lZWQgdG8gbGl2ZSBjbG9zZSB0byBrZXJuZWwKPiA+IHRleHQiLCB0aGF0J3Mgbm90IHRoYXQg
YmlnIG9mIGEgZGVhbC4KPgo+IE15IHRoaW5raW5nIHdhcyB0aGF0IHdlIGF0IGxlYXN0IG5lZWQg
dGhlIHN0YXJ0ICsgZW5kIGZvciBlYWNoIGNhbGxlci4gVGhhdAo+IG1pZ2h0IGJlIGl0LCB0Ymgu
CgpJSVVDLCBhcm02NCB1c2VzIFZNQUxMT0MgYWRkcmVzcyBzcGFjZSBmb3IgQlBGIHByb2dyYW1z
LiBUaGUgcmVhc29uCmlzIGVhY2ggQlBGIHByb2dyYW0gdXNlcyBhdCBsZWFzdCA2NGtCIChvbmUg
cGFnZSkgb3V0IG9mIHRoZSAxMjhNQgphZGRyZXNzIHNwYWNlLiBQdXJhbmpheSBNb2hhbiAoQ0Mn
ZWQpIGlzIHdvcmtpbmcgb24gZW5hYmxpbmcKYnBmX3Byb2dfcGFjayBmb3IgYXJtNjQuIE9uY2Ug
dGhpcyB3b3JrIGlzIGRvbmUsIG11bHRpcGxlIEJQRiBwcm9ncmFtcwp3aWxsIGJlIGFibGUgdG8g
c2hhcmUgYSBwYWdlLiBXaWxsIHRoaXMgaW1wcm92ZW1lbnQgcmVtb3ZlIHRoZSBuZWVkIHRvCnNw
ZWNpZnkgYSBkaWZmZXJlbnQgYWRkcmVzcyByYW5nZSBmb3IgQlBGIHByb2dyYW1zPwoKVGhhbmtz
LApTb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
