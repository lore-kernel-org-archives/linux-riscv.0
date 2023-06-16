Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15827EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 18:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wn+lHhCVQy9aPVmWFJGy6ndCo1px9Y7qVcJUviUFzfc=; b=ijeyMIam0Vfyx6
	jJGrnmdIIgDMUVm5aGCt3XFs6dTVNHgFf0zGcpiSpENJBf2aswsTWqMvTYLjmt7evJcR/btcW8hkE
	dez44vpt2jIIyLomHq3Cp+mjvvCwVI64+lWC7gt2GR5d4siYalah1+v9iT87YAQVEHeqo4jW8aWWr
	2UodTe0IM32nEs2FC6NpIsc6mcRAyMMlUDgitfAIDz89m5AOLVZJ5wiGl+Fi0uf+v8Q9dzJ4TumGg
	VmwBRB52Ixk4tfEVoqx8hcBAHCZvCRBe3JmsvN/HRb+hqd6t7b9ifbbdafiewbvf3Vga9KQwOfvip
	ng4wi19gJNtSE4goB28A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEaL-001Ud7-2X;
	Fri, 16 Jun 2023 18:54:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEaI-001Uak-1o;
	Fri, 16 Jun 2023 18:54:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1C15E63617;
	Fri, 16 Jun 2023 18:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F383AC433D9;
	Fri, 16 Jun 2023 18:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686941649;
	bh=Yn4AaKJNeoRa5k6Rpqw8rOaWUpFfj0b/8Nallv5Pzds=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VAiGa0I3VACBcfckeYjIsmg+o/Lg4sS9yo0qhzfoNoM8HW3/yOwai3153O/GUAXbj
	 YJtd0QtbYHxESgW/1famknmpEyl1VcqqZbhSsOi11zU9/ZMOErIBdZBoGkIJK30tWt
	 unGcQ+mitBz6SxYbCiSHZpCoP8hgQukNeXy1UbCOP0F5ZH682Nli8SfcUiRSggpyfA
	 eBElWbeNqWyPxCKgFRONE3eKcW6XHG/HLKpP7a6yELMQu7jW7a8McQDjl83mpuO51f
	 IpRYwyGRjNbRqpToW+gHjtGgDrWOf+YGXI32hL/bT3NIgnBpJWshrLsqdj1cuzU+Nn
	 8iQhg6Wj6381A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so1493461e87.0;
        Fri, 16 Jun 2023 11:54:08 -0700 (PDT)
X-Gm-Message-State: AC+VfDy3vMh2zhnPxSag6jFQg22FrsLL5t7M6u9/HhJ/FJJKhGu5jgc3
	ZmFGHpGLWIMAG7JQgOVjgZkK9Qygwwg6+CRhHXg=
X-Google-Smtp-Source: ACHHUZ6uZ3NRfESc1LLdM7pG5QakOfq/c/daJr3jT6A/NUchGYkSu86UqZO3PB3EltPOLvcz17COALW9nYWOKlX1r+w=
X-Received: by 2002:a19:7b05:0:b0:4f6:d9e:7c3b with SMTP id
 w5-20020a197b05000000b004f60d9e7c3bmr2147967lfc.44.1686941646932; Fri, 16 Jun
 2023 11:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-5-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-5-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:53:54 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7xE8sz8Nh2AdNb62k=8kgEPxaBCw3w50EfXraxmKca-A@mail.gmail.com>
Message-ID: <CAPhsuW7xE8sz8Nh2AdNb62k=8kgEPxaBCw3w50EfXraxmKca-A@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] mm/execmem, arch: convert remaining overrides of
 module_alloc to execmem
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
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
X-CRM114-CacheID: sfid-20230616_115410_677775_1059BF01 
X-CRM114-Status: GOOD (  24.73  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTo1MeKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6ClsuLi5dCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQva2VybmVsL21v
ZHVsZS5jIGIvYXJjaC9hcm02NC9rZXJuZWwvbW9kdWxlLmMKPiBpbmRleCA1YWY0OTc1Y2FlYjUu
LmMzZDk5OWYzYTNkZCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYwo+
ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL21vZHVsZS5jCj4gQEAgLTE3LDU2ICsxNyw1MCBAQAo+
ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlbG9hZGVyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9zY3Mu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2V4ZWNt
ZW0uaD4KPiAgI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgo+ICAjaW5jbHVkZSA8YXNtL2lu
c24uaD4KPiAgI2luY2x1ZGUgPGFzbS9zY3MuaD4KPiAgI2luY2x1ZGUgPGFzbS9zZWN0aW9ucy5o
Pgo+Cj4gLXZvaWQgKm1vZHVsZV9hbGxvYyh1bnNpZ25lZCBsb25nIHNpemUpCj4gK3N0YXRpYyBz
dHJ1Y3QgZXhlY21lbV9wYXJhbXMgZXhlY21lbV9wYXJhbXMgPSB7Cj4gKyAgICAgICAubW9kdWxl
cyA9IHsKPiArICAgICAgICAgICAgICAgLmZsYWdzID0gRVhFQ01FTV9LQVNBTl9TSEFET1csCj4g
KyAgICAgICAgICAgICAgIC50ZXh0ID0gewo+ICsgICAgICAgICAgICAgICAgICAgICAgIC5hbGln
bm1lbnQgPSBNT0RVTEVfQUxJR04sCj4gKyAgICAgICAgICAgICAgIH0sCj4gKyAgICAgICB9LAo+
ICt9Owo+ICsKPiArc3RydWN0IGV4ZWNtZW1fcGFyYW1zIF9faW5pdCAqZXhlY21lbV9hcmNoX3Bh
cmFtcyh2b2lkKQo+ICB7Cj4gICAgICAgICB1NjQgbW9kdWxlX2FsbG9jX2VuZCA9IG1vZHVsZV9h
bGxvY19iYXNlICsgTU9EVUxFU19WU0laRTsKPiAtICAgICAgIGdmcF90IGdmcF9tYXNrID0gR0ZQ
X0tFUk5FTDsKPiAtICAgICAgIHZvaWQgKnA7Cj4gLQo+IC0gICAgICAgLyogU2lsZW5jZSB0aGUg
aW5pdGlhbCBhbGxvY2F0aW9uICovCj4gLSAgICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfQVJN
NjRfTU9EVUxFX1BMVFMpKQo+IC0gICAgICAgICAgICAgICBnZnBfbWFzayB8PSBfX0dGUF9OT1dB
Uk47Cj4KPiAtICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19LQVNBTl9HRU5FUklDKSB8fAo+
IC0gICAgICAgICAgIElTX0VOQUJMRUQoQ09ORklHX0tBU0FOX1NXX1RBR1MpKQo+IC0gICAgICAg
ICAgICAgICAvKiBkb24ndCBleGNlZWQgdGhlIHN0YXRpYyBtb2R1bGUgcmVnaW9uIC0gc2VlIGJl
bG93ICovCj4gLSAgICAgICAgICAgICAgIG1vZHVsZV9hbGxvY19lbmQgPSBNT0RVTEVTX0VORDsK
PiArICAgICAgIGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMudGV4dC5wZ3Byb3QgPSBQQUdFX0tFUk5F
TDsKPiArICAgICAgIGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMudGV4dC5zdGFydCA9IG1vZHVsZV9h
bGxvY19iYXNlOwoKSSB0aGluayBJIG1lbnRpb25lZCB0aGlzIGVhcmxpZXIuIEZvciBhcm02NCB3
aXRoIENPTkZJR19SQU5ET01JWkVfQkFTRSwKbW9kdWxlX2FsbG9jX2Jhc2UgaXMgbm90IHlldCBz
ZXQgd2hlbiBleGVjbWVtX2FyY2hfcGFyYW1zKCkgaXMKY2FsbGVkLiBTbyB3ZSB3aWxsIG5lZWQg
c29tZSBleHRyYSBsb2dpYyBmb3IgdGhpcy4KClRoYW5rcywKU29uZwoKCj4gKyAgICAgICBleGVj
bWVtX3BhcmFtcy5tb2R1bGVzLnRleHQuZW5kID0gbW9kdWxlX2FsbG9jX2VuZDsKPgo+IC0gICAg
ICAgcCA9IF9fdm1hbGxvY19ub2RlX3JhbmdlKHNpemUsIE1PRFVMRV9BTElHTiwgbW9kdWxlX2Fs
bG9jX2Jhc2UsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb2R1bGVfYWxsb2Nf
ZW5kLCBnZnBfbWFzaywgUEFHRV9LRVJORUwsIFZNX0RFRkVSX0tNRU1MRUFLLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgTlVNQV9OT19OT0RFLCBfX2J1aWx0aW5fcmV0dXJuX2Fk
ZHJlc3MoMCkpOwo+IC0KPiAtICAgICAgIGlmICghcCAmJiBJU19FTkFCTEVEKENPTkZJR19BUk02
NF9NT0RVTEVfUExUUykgJiYKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBLQVNBTiB3aXRob3V0
IEtBU0FOX1ZNQUxMT0MgY2FuIG9ubHkgZGVhbCB3aXRoIG1vZHVsZQo+ICsgICAgICAgICogYWxs
b2NhdGlvbnMgYmVpbmcgc2VydmVkIGZyb20gdGhlIHJlc2VydmVkIG1vZHVsZSByZWdpb24sCj4g
KyAgICAgICAgKiBzaW5jZSB0aGUgcmVtYWluZGVyIG9mIHRoZSB2bWFsbG9jIHJlZ2lvbiBpcyBh
bHJlYWR5Cj4gKyAgICAgICAgKiBiYWNrZWQgYnkgemVybyBzaGFkb3cgcGFnZXMsIGFuZCBwdW5j
aGluZyBob2xlcyBpbnRvIGl0Cj4gKyAgICAgICAgKiBpcyBub24tdHJpdmlhbC4gU2luY2UgdGhl
IG1vZHVsZSByZWdpb24gaXMgbm90IHJhbmRvbWl6ZWQKPiArICAgICAgICAqIHdoZW4gS0FTQU4g
aXMgZW5hYmxlZCB3aXRob3V0IEtBU0FOX1ZNQUxMT0MsIGl0IGlzIGV2ZW4KPiArICAgICAgICAq
IGxlc3MgbGlrZWx5IHRoYXQgdGhlIG1vZHVsZSByZWdpb24gZ2V0cyBleGhhdXN0ZWQsIHNvIHdl
Cj4gKyAgICAgICAgKiBjYW4gc2ltcGx5IG9taXQgdGhpcyBmYWxsYmFjayBpbiB0aGF0IGNhc2Uu
Cj4gKyAgICAgICAgKi8KPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19BUk02NF9NT0RV
TEVfUExUUykgJiYKPiAgICAgICAgICAgICAoSVNfRU5BQkxFRChDT05GSUdfS0FTQU5fVk1BTExP
QykgfHwKPiAgICAgICAgICAgICAgKCFJU19FTkFCTEVEKENPTkZJR19LQVNBTl9HRU5FUklDKSAm
Jgo+IC0gICAgICAgICAgICAgIUlTX0VOQUJMRUQoQ09ORklHX0tBU0FOX1NXX1RBR1MpKSkpCj4g
LSAgICAgICAgICAgICAgIC8qCj4gLSAgICAgICAgICAgICAgICAqIEtBU0FOIHdpdGhvdXQgS0FT
QU5fVk1BTExPQyBjYW4gb25seSBkZWFsIHdpdGggbW9kdWxlCj4gLSAgICAgICAgICAgICAgICAq
IGFsbG9jYXRpb25zIGJlaW5nIHNlcnZlZCBmcm9tIHRoZSByZXNlcnZlZCBtb2R1bGUgcmVnaW9u
LAo+IC0gICAgICAgICAgICAgICAgKiBzaW5jZSB0aGUgcmVtYWluZGVyIG9mIHRoZSB2bWFsbG9j
IHJlZ2lvbiBpcyBhbHJlYWR5Cj4gLSAgICAgICAgICAgICAgICAqIGJhY2tlZCBieSB6ZXJvIHNo
YWRvdyBwYWdlcywgYW5kIHB1bmNoaW5nIGhvbGVzIGludG8gaXQKPiAtICAgICAgICAgICAgICAg
ICogaXMgbm9uLXRyaXZpYWwuIFNpbmNlIHRoZSBtb2R1bGUgcmVnaW9uIGlzIG5vdCByYW5kb21p
emVkCj4gLSAgICAgICAgICAgICAgICAqIHdoZW4gS0FTQU4gaXMgZW5hYmxlZCB3aXRob3V0IEtB
U0FOX1ZNQUxMT0MsIGl0IGlzIGV2ZW4KPiAtICAgICAgICAgICAgICAgICogbGVzcyBsaWtlbHkg
dGhhdCB0aGUgbW9kdWxlIHJlZ2lvbiBnZXRzIGV4aGF1c3RlZCwgc28gd2UKPiAtICAgICAgICAg
ICAgICAgICogY2FuIHNpbXBseSBvbWl0IHRoaXMgZmFsbGJhY2sgaW4gdGhhdCBjYXNlLgo+IC0g
ICAgICAgICAgICAgICAgKi8KPiAtICAgICAgICAgICAgICAgcCA9IF9fdm1hbGxvY19ub2RlX3Jh
bmdlKHNpemUsIE1PRFVMRV9BTElHTiwgbW9kdWxlX2FsbG9jX2Jhc2UsCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtb2R1bGVfYWxsb2NfYmFzZSArIFNaXzJHLCBHRlBfS0VSTkVM
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9LRVJORUwsIDAsIE5VTUFf
Tk9fTk9ERSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fYnVpbHRpbl9yZXR1
cm5fYWRkcmVzcygwKSk7Cj4gLQo+IC0gICAgICAgaWYgKHAgJiYgKGthc2FuX2FsbG9jX21vZHVs
ZV9zaGFkb3cocCwgc2l6ZSwgZ2ZwX21hc2spIDwgMCkpIHsKPiAtICAgICAgICAgICAgICAgdmZy
ZWUocCk7Cj4gLSAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsgICAgICAgICAgICAgIUlT
X0VOQUJMRUQoQ09ORklHX0tBU0FOX1NXX1RBR1MpKSkpIHsKPiArICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBlbmQgPSBtb2R1bGVfYWxsb2NfYmFzZSArIFNaXzJHOwo+ICsKPiArICAgICAg
ICAgICAgICAgZXhlY21lbV9wYXJhbXMubW9kdWxlcy50ZXh0LmZhbGxiYWNrX3N0YXJ0ID0gbW9k
dWxlX2FsbG9jX2Jhc2U7Cj4gKyAgICAgICAgICAgICAgIGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMu
dGV4dC5mYWxsYmFja19lbmQgPSBlbmQ7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIC8qIE1lbW9y
eSBpcyBpbnRlbmRlZCB0byBiZSBleGVjdXRhYmxlLCByZXNldCB0aGUgcG9pbnRlciB0YWcuICov
Cj4gLSAgICAgICByZXR1cm4ga2FzYW5fcmVzZXRfdGFnKHApOwo+ICsgICAgICAgcmV0dXJuICZl
eGVjbWVtX3BhcmFtczsKPiAgfQo+Cj4gIGVudW0gYWFyY2g2NF9yZWxvY19vcCB7CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
