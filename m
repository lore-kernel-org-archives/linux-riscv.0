Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121CFEB64D8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 18:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUQ3bZrTOA/e1t6ZxF2cJzt9SCCxFuTgndAO08w50jI=; b=WtWjOCX7kUHPcB
	nfVBB0f2B+qA+gpbDHCNLXXsPhHIGWSy1nbpEvbYKJ7jcY+SkhCzG8c/kCUr1R5NldEbzSk2DjyQ1
	Mf4tuulhl9z/1dSsrZoTEtbNkI1PZ/nymFBu18NE6rvMB/9ikzY5wWoK3wQ/QGAPE+zVdamWMOrZT
	t7pQGhLYvXFngEK7mOcqdqb5al3MVET/UJfHjrYK8vkrvEGV/ACTSg5ZiBAU49qhJ1aeqCN5Q/RJ7
	dBDCpqeuKt8WbnUobpGw5KxpOWC7086pLIqkbNwoywnh/X2kF4wzVPKefpwYV/n03WGwgIZXQBkFR
	4nKK39hyVURD/TLC1cRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEcX-001VG3-1Y;
	Fri, 16 Jun 2023 18:56:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAEcT-001VE3-2Q;
	Fri, 16 Jun 2023 18:56:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DEBE62D6D;
	Fri, 16 Jun 2023 18:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1170CC433D9;
	Fri, 16 Jun 2023 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686941784;
	bh=TiK/t/XTSx2fh8UkKw1baZqCETUm1DZqQZdzQBTpc/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DR8ZwzCHVtydoaaxjVYJNAWu/EazGdygIZ9Srkd4r4zGNu0UV5wrYj4MX5arzEodp
	 UNvhvBrh5U4xGmDl5sewm5lcUokl1lD7VTeAPUPHyzYKCOX5F7Je9AJgJ0HqJqpHT2
	 dLMHymuA0MzirGgPHvlvL6U36HV4H2mHBFM4sA3+uLQ6uro16QwzRETHZvWuu01q0L
	 oEQm2Ghzu8fuJWG7gSLOHi6X72YNM+NGXR0jzbSIhti31b9mqhQFKwVaQG4h1o8jl3
	 sPN9LHTye4cTeZayTOrwNQq2w+QcnqfrU6lZ/h2mtxqSWd8YF98VAdngnnwpTSEIq6
	 2Cv/9seiufkYQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b448b24a66so14576581fa.1;
        Fri, 16 Jun 2023 11:56:23 -0700 (PDT)
X-Gm-Message-State: AC+VfDxvpyPhJ0jQ3GYmRGBElCrnK0tZ5+RlPgWYDJTEmJnTKU5sGaXg
	ArieK0SwzRnp0wZTjcDPZNi+dZVsYY3PHa4cxH4=
X-Google-Smtp-Source: ACHHUZ5T8e7wpuuhOjnmCbHsB2+OgDZlJJ7sUOEWS0dN9xCa2iZ6+8btSZBMXNDx9vhO1lFKVvsg0dPvz5VmaKvg8Zw=
X-Received: by 2002:a2e:80c2:0:b0:2b2:f9c8:6ad1 with SMTP id
 r2-20020a2e80c2000000b002b2f9c86ad1mr2553844ljg.42.1686941782011; Fri, 16 Jun
 2023 11:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-6-rppt@kernel.org>
In-Reply-To: <20230616085038.4121892-6-rppt@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 16 Jun 2023 11:56:09 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7qEEbyEBUPETHxMj+Kusow5zTk3Q4cRNo0qV+quUsZNA@mail.gmail.com>
Message-ID: <CAPhsuW7qEEbyEBUPETHxMj+Kusow5zTk3Q4cRNo0qV+quUsZNA@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] modules, execmem: drop module_alloc
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
X-CRM114-CacheID: sfid-20230616_115625_864279_F348B715 
X-CRM114-Status: GOOD (  27.14  )
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
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoSUJNKSIgPHJwcHRAa2Vy
bmVsLm9yZz4KPgo+IERlZmluZSBkZWZhdWx0IHBhcmFtZXRlcnMgZm9yIGFkZHJlc3MgcmFuZ2Ug
Zm9yIGNvZGUgYWxsb2NhdGlvbnMgdXNpbmcKPiB0aGUgY3VycmVudCB2YWx1ZXMgaW4gbW9kdWxl
X2FsbG9jKCkgYW5kIG1ha2UgZXhlY21lbV90ZXh0X2FsbG9jKCkgdXNlCj4gdGhlc2UgZGVmYXVs
dHMgd2hlbiBhbiBhcmNoaXRlY3VyZSBkb2VzIG5vdCBzdXBwbHkgaXRzIHNwZWNpZmljCj4gcGFy
YW1ldGVycy4KPgo+IFdpdGggdGhpcywgZXhlY21lbV90ZXh0X2FsbG9jKCkgaW1wbGVtZW50cyBt
ZW1vcnkgYWxsb2NhdGlvbiBpbiBhIHdheQo+IGNvbXBhdGlibGUgd2l0aCBtb2R1bGVfYWxsb2Mo
KSBhbmQgY2FuIGJlIHVzZWQgYXMgYSByZXBsYWNlbWVudCBmb3IKPiBtb2R1bGVfYWxsb2MoKS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgKElCTSkgPHJwcHRAa2VybmVsLm9yZz4K
CkFja2VkLWJ5OiBTb25nIExpdSA8c29uZ0BrZXJuZWwub3JnPgoKPiAtLS0KPiAgaW5jbHVkZS9s
aW51eC9leGVjbWVtLmggICAgICB8ICA4ICsrKysrKysrCj4gIGluY2x1ZGUvbGludXgvbW9kdWxl
bG9hZGVyLmggfCAxMiAtLS0tLS0tLS0tLS0KPiAga2VybmVsL21vZHVsZS9tYWluLmMgICAgICAg
ICB8ICA3IC0tLS0tLS0KPiAgbW0vZXhlY21lbS5jICAgICAgICAgICAgICAgICB8IDEyICsrKysr
KysrLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZXhlY21lbS5oIGIvaW5jbHVkZS9s
aW51eC9leGVjbWVtLmgKPiBpbmRleCA2OGIyYmZjNzk5OTMuLmI5YTk3ZmNkZjNjNSAxMDA2NDQK
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2V4ZWNtZW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZXhl
Y21lbS5oCj4gQEAgLTQsNiArNCwxNCBAQAo+Cj4gICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+
Cj4gKyNpZiAoZGVmaW5lZChDT05GSUdfS0FTQU5fR0VORVJJQykgfHwgZGVmaW5lZChDT05GSUdf
S0FTQU5fU1dfVEFHUykpICYmIFwKPiArICAgICAgICAgICAgICAgIWRlZmluZWQoQ09ORklHX0tB
U0FOX1ZNQUxMT0MpCj4gKyNpbmNsdWRlIDxsaW51eC9rYXNhbi5oPgo+ICsjZGVmaW5lIE1PRFVM
RV9BTElHTiAoUEFHRV9TSVpFIDw8IEtBU0FOX1NIQURPV19TQ0FMRV9TSElGVCkKPiArI2Vsc2UK
PiArI2RlZmluZSBNT0RVTEVfQUxJR04gUEFHRV9TSVpFCj4gKyNlbmRpZgo+ICsKPiAgLyoqCj4g
ICAqIHN0cnVjdCBleGVjbWVtX3JhbmdlIC0gZGVmaW5pdGlvbiBvZiBhIG1lbW9yeSByYW5nZSBz
dWl0YWJsZSBmb3IgY29kZSBhbmQKPiAgICogICAgICAgICAgICAgICAgICAgICAgIHJlbGF0ZWQg
ZGF0YSBhbGxvY2F0aW9ucwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21vZHVsZWxvYWRl
ci5oIGIvaW5jbHVkZS9saW51eC9tb2R1bGVsb2FkZXIuaAo+IGluZGV4IGIzMzc0MzQyZjdhZi4u
NDMyMTY4MmZlODQ5IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbW9kdWxlbG9hZGVyLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L21vZHVsZWxvYWRlci5oCj4gQEAgLTI1LDEwICsyNSw2IEBA
IGludCBtb2R1bGVfZnJvYl9hcmNoX3NlY3Rpb25zKEVsZl9FaGRyICpoZHIsCj4gIC8qIEFkZGl0
aW9uYWwgYnl0ZXMgbmVlZGVkIGJ5IGFyY2ggaW4gZnJvbnQgb2YgaW5kaXZpZHVhbCBzZWN0aW9u
cyAqLwo+ICB1bnNpZ25lZCBpbnQgYXJjaF9tb2Rfc2VjdGlvbl9wcmVwZW5kKHN0cnVjdCBtb2R1
bGUgKm1vZCwgdW5zaWduZWQgaW50IHNlY3Rpb24pOwo+Cj4gLS8qIEFsbG9jYXRvciB1c2VkIGZv
ciBhbGxvY2F0aW5nIHN0cnVjdCBtb2R1bGUsIGNvcmUgc2VjdGlvbnMgYW5kIGluaXQKPiAtICAg
c2VjdGlvbnMuICBSZXR1cm5zIE5VTEwgb24gZmFpbHVyZS4gKi8KPiAtdm9pZCAqbW9kdWxlX2Fs
bG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSk7Cj4gLQo+ICAvKiBEZXRlcm1pbmVzIGlmIHRoZSBzZWN0
aW9uIG5hbWUgaXMgYW4gaW5pdCBzZWN0aW9uICh0aGF0IGlzIG9ubHkgdXNlZCBkdXJpbmcKPiAg
ICogbW9kdWxlIGxvYWRpbmcpLgo+ICAgKi8KPiBAQCAtMTEzLDEyICsxMDksNCBAQCB2b2lkIG1v
ZHVsZV9hcmNoX2NsZWFudXAoc3RydWN0IG1vZHVsZSAqbW9kKTsKPiAgLyogQW55IGNsZWFudXAg
YmVmb3JlIGZyZWVpbmcgbW9kLT5tb2R1bGVfaW5pdCAqLwo+ICB2b2lkIG1vZHVsZV9hcmNoX2Zy
ZWVpbmdfaW5pdChzdHJ1Y3QgbW9kdWxlICptb2QpOwo+Cj4gLSNpZiAoZGVmaW5lZChDT05GSUdf
S0FTQU5fR0VORVJJQykgfHwgZGVmaW5lZChDT05GSUdfS0FTQU5fU1dfVEFHUykpICYmIFwKPiAt
ICAgICAgICAgICAgICAgIWRlZmluZWQoQ09ORklHX0tBU0FOX1ZNQUxMT0MpCj4gLSNpbmNsdWRl
IDxsaW51eC9rYXNhbi5oPgo+IC0jZGVmaW5lIE1PRFVMRV9BTElHTiAoUEFHRV9TSVpFIDw8IEtB
U0FOX1NIQURPV19TQ0FMRV9TSElGVCkKPiAtI2Vsc2UKPiAtI2RlZmluZSBNT0RVTEVfQUxJR04g
UEFHRV9TSVpFCj4gLSNlbmRpZgo+IC0KPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9t
b2R1bGUvbWFpbi5jIGIva2VybmVsL21vZHVsZS9tYWluLmMKPiBpbmRleCA0MzgxMGEzYmRiODEu
LmI0NDVjNWFkODYzYSAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvbW9kdWxlL21haW4uYwo+ICsrKyBi
L2tlcm5lbC9tb2R1bGUvbWFpbi5jCj4gQEAgLTE2MDAsMTMgKzE2MDAsNiBAQCBzdGF0aWMgdm9p
ZCBmcmVlX21vZGluZm8oc3RydWN0IG1vZHVsZSAqbW9kKQo+ICAgICAgICAgfQo+ICB9Cj4KPiAt
dm9pZCAqIF9fd2VhayBtb2R1bGVfYWxsb2ModW5zaWduZWQgbG9uZyBzaXplKQo+IC17Cj4gLSAg
ICAgICByZXR1cm4gX192bWFsbG9jX25vZGVfcmFuZ2Uoc2l6ZSwgMSwgVk1BTExPQ19TVEFSVCwg
Vk1BTExPQ19FTkQsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCwgUEFHRV9L
RVJORUxfRVhFQywgVk1fRkxVU0hfUkVTRVRfUEVSTVMsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgTlVNQV9OT19OT0RFLCBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCkpOwo+IC19Cj4gLQo+
ICBib29sIF9fd2VhayBtb2R1bGVfaW5pdF9zZWN0aW9uKGNvbnN0IGNoYXIgKm5hbWUpCj4gIHsK
PiAgICAgICAgIHJldHVybiBzdHJzdGFydHMobmFtZSwgIi5pbml0Iik7Cj4gZGlmZiAtLWdpdCBh
L21tL2V4ZWNtZW0uYyBiL21tL2V4ZWNtZW0uYwo+IGluZGV4IDJmZTM2ZGNjN2JkZi4uYTY3YWNk
NzVmZmVmIDEwMDY0NAo+IC0tLSBhL21tL2V4ZWNtZW0uYwo+ICsrKyBiL21tL2V4ZWNtZW0uYwo+
IEBAIC01OSw5ICs1OSw2IEBAIHZvaWQgKmV4ZWNtZW1fdGV4dF9hbGxvYyhzaXplX3Qgc2l6ZSkK
PiAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmFsbGJhY2tfZW5kID0gZXhlY21lbV9wYXJhbXMubW9k
dWxlcy50ZXh0LmZhbGxiYWNrX2VuZDsKPiAgICAgICAgIGJvb2wga2FzYW4gPSBleGVjbWVtX3Bh
cmFtcy5tb2R1bGVzLmZsYWdzICYgRVhFQ01FTV9LQVNBTl9TSEFET1c7Cj4KPiAtICAgICAgIGlm
ICghZXhlY21lbV9wYXJhbXMubW9kdWxlcy50ZXh0LnN0YXJ0KQo+IC0gICAgICAgICAgICAgICBy
ZXR1cm4gbW9kdWxlX2FsbG9jKHNpemUpOwo+IC0KPiAgICAgICAgIHJldHVybiBleGVjbWVtX2Fs
bG9jKHNpemUsIHN0YXJ0LCBlbmQsIGFsaWduLCBwZ3Byb3QsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmYWxsYmFja19zdGFydCwgZmFsbGJhY2tfZW5kLCBrYXNhbik7Cj4gIH0KPiBA
QCAtMTA4LDggKzEwNSwxNSBAQCB2b2lkIF9faW5pdCBleGVjbWVtX2luaXQodm9pZCkKPiAgewo+
ICAgICAgICAgc3RydWN0IGV4ZWNtZW1fcGFyYW1zICpwID0gZXhlY21lbV9hcmNoX3BhcmFtcygp
Owo+Cj4gLSAgICAgICBpZiAoIXApCj4gKyAgICAgICBpZiAoIXApIHsKPiArICAgICAgICAgICAg
ICAgcCA9ICZleGVjbWVtX3BhcmFtczsKPiArICAgICAgICAgICAgICAgcC0+bW9kdWxlcy50ZXh0
LnN0YXJ0ID0gVk1BTExPQ19TVEFSVDsKPiArICAgICAgICAgICAgICAgcC0+bW9kdWxlcy50ZXh0
LmVuZCA9IFZNQUxMT0NfRU5EOwo+ICsgICAgICAgICAgICAgICBwLT5tb2R1bGVzLnRleHQucGdw
cm90ID0gUEFHRV9LRVJORUxfRVhFQzsKPiArICAgICAgICAgICAgICAgcC0+bW9kdWxlcy50ZXh0
LmFsaWdubWVudCA9IDE7Cj4gKwo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gKyAgICAgICB9
Cj4KPiAgICAgICAgIGlmICghZXhlY21lbV92YWxpZGF0ZV9wYXJhbXMocCkpCj4gICAgICAgICAg
ICAgICAgIHJldHVybjsKPiAtLQo+IDIuMzUuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
