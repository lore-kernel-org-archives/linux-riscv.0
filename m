Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBA5E7D0AF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 22:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hD95cWhiAJEhp3n5BSWHkwgH46Hn9Eq7ZOsvTzkjd84=; b=hDgGSPFMZNhORN
	GH4/MshKNvULKlxnLnjlUCSvcbkDxdQDOyNKrs0AdfAx+AvSqQKOCUMCg8t7rs5I3V/ROv5aePRtv
	BcCitEIih0cBo+Va66NvcO1EN3rEN05GIcp5IM/BH37R0yYAWtBTespQ0j0az5iF2C4REMo7gIHJH
	lpqK/DLQdWzUzsgsEKDpTc3rtoQnnhBauOEokns3idYbrRigwAGBM1lkesZuTJc7wclPA8wWof/o7
	IanPns5NBAqREIhyqJHwnYDcS9qaXdXM7/8X1rgM+HaLXxB48HUNILCwlWCEQA05t4Fe0VaZSGvH3
	TjwvpRt/OM24JP3DUrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjSFo-007JAU-30;
	Thu, 21 Sep 2023 22:34:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjSFl-007J8o-2P;
	Thu, 21 Sep 2023 22:34:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 350BD620D7;
	Thu, 21 Sep 2023 22:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91994C433C8;
	Thu, 21 Sep 2023 22:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695335672;
	bh=fncpICFIZJhs+CFipAysf+2ViMsb5Ntfqci2xnszhTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mfa0wr7Z0lJ3IA4HjAqOtrk9SSrWWB+YGbaJc16KYeVVOnawrEHs3dy+iDauvghvS
	 XAHLDo1Oga4nzW8Yi1caKnTTFJMqd7AtLKV54l/hFjnIDnOa7YaUJG8OwSNQt6PDO1
	 7A+xKgOCxHubIbnNN8HZ22TUVPtwpthTbmR6DHRJsZoaCg1nFEuNlqOAO63MKUXx9I
	 SVjAKnxkUVKeWQXgqE8UM2tHBIJCB/eo8eJdbedgXyDGRo4W6Xudl4FTLuPEDPrLWB
	 k28dHj46DhheR/Wrwnz4X+g5x8ZjJWpuI68P2lkJi7EwbKR/MM3KSc5SviEdI3D0pl
	 RSPtrB9bT5Klg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5043a01ee20so138945e87.0;
        Thu, 21 Sep 2023 15:34:32 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy2+e4toHmNWyI58WRp7RPDaDGL3EswbaHe0n0uxnA+/QewLGA9
	4nd+6UGF/wd6U08C/R+57YcrQbWaIYo//zRd9ls=
X-Google-Smtp-Source: AGHT+IFZJtrM0/Sc4i9G46WkcXtuEGlwSrtGZZ9iCEr70spXydIPXGtt7clCqr3CvwCB3MyRIs3nmXQD2zetfl7/+As=
X-Received: by 2002:a19:6445:0:b0:503:3446:8ef5 with SMTP id
 b5-20020a196445000000b0050334468ef5mr4362567lfj.10.1695335670837; Thu, 21 Sep
 2023 15:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230918072955.2507221-1-rppt@kernel.org> <20230918072955.2507221-3-rppt@kernel.org>
In-Reply-To: <20230918072955.2507221-3-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Thu, 21 Sep 2023 15:34:18 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5-=H1V=VXUYxyGnUdJuNUpRt44QmpwjkDUD=9i0itjuw@mail.gmail.com>
Message-ID: <CAPhsuW5-=H1V=VXUYxyGnUdJuNUpRt44QmpwjkDUD=9i0itjuw@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and execmem_free()
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Luis Chamberlain <mcgrof@kernel.org>, 
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
X-CRM114-CacheID: sfid-20230921_153433_884360_24FAF8F4 
X-CRM114-Status: GOOD (  14.80  )
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

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTI6MzDigK9BTSBNaWtlIFJhcG9wb3J0IDxycHB0QGtl
cm5lbC5vcmc+IHdyb3RlOgo+CgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9zMzkwL2tlcm5l
bC9tb2R1bGUuYyBiL2FyY2gvczM5MC9rZXJuZWwvbW9kdWxlLmMKPiBpbmRleCA0MjIxNWY5NDA0
YWYuLmRiNTU2MWQwYzIzMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3MzOTAva2VybmVsL21vZHVsZS5j
Cj4gKysrIGIvYXJjaC9zMzkwL2tlcm5lbC9tb2R1bGUuYwo+IEBAIC0yMSw2ICsyMSw3IEBACj4g
ICNpbmNsdWRlIDxsaW51eC9tb2R1bGVsb2FkZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2J1Zy5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvbWVtb3J5Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9leGVjbWVt
Lmg+Cj4gICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUuaD4KPiAgI2luY2x1ZGUgPGFzbS9ub3Nw
ZWMtYnJhbmNoLmg+Cj4gICNpbmNsdWRlIDxhc20vZmFjaWxpdHkuaD4KPiBAQCAtNzYsNyArNzcs
NyBAQCB2b2lkICptb2R1bGVfYWxsb2ModW5zaWduZWQgbG9uZyBzaXplKQo+ICAjaWZkZWYgQ09O
RklHX0ZVTkNUSU9OX1RSQUNFUgo+ICB2b2lkIG1vZHVsZV9hcmNoX2NsZWFudXAoc3RydWN0IG1v
ZHVsZSAqbW9kKQo+ICB7Cj4gLSAgICAgICBtb2R1bGVfbWVtZnJlZShtb2QtPmFyY2gudHJhbXBv
bGluZXNfc3RhcnQpOwo+ICsgICAgICAgZXhlY21lbV9mcmVlKG1vZC0+YXJjaC50cmFtcG9saW5l
c19zdGFydCk7Cj4gIH0KPiAgI2VuZGlmCj4KPiBAQCAtNTEwLDcgKzUxMSw3IEBAIHN0YXRpYyBp
bnQgbW9kdWxlX2FsbG9jX2Z0cmFjZV9ob3RwYXRjaF90cmFtcG9saW5lcyhzdHJ1Y3QgbW9kdWxl
ICptZSwKPgo+ICAgICAgICAgc2l6ZSA9IEZUUkFDRV9IT1RQQVRDSF9UUkFNUE9MSU5FU19TSVpF
KHMtPnNoX3NpemUpOwo+ICAgICAgICAgbnVtcGFnZXMgPSBESVZfUk9VTkRfVVAoc2l6ZSwgUEFH
RV9TSVpFKTsKPiAtICAgICAgIHN0YXJ0ID0gbW9kdWxlX2FsbG9jKG51bXBhZ2VzICogUEFHRV9T
SVpFKTsKPiArICAgICAgIHN0YXJ0ID0gZXhlY21lbV90ZXh0X2FsbG9jKEVYRUNNRU1fRlRSQUNF
LCBudW1wYWdlcyAqIFBBR0VfU0laRSk7CgpUaGlzIHNob3VsZCBiZSBFWEVDTUVNX01PRFVMRV9U
RVhUPwoKVGhhbmtzLApTb25nCgo+ICAgICAgICAgaWYgKCFzdGFydCkKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9NRU07Cj4gICAgICAgICBzZXRfbWVtb3J5X3JveCgodW5zaWduZWQgbG9u
ZylzdGFydCwgbnVtcGFnZXMpOwpbLi4uXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
