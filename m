Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355CAEB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 06:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=imkn0h0A4UOjKsf+5XqZOVfbNB89cPKYGzSyYlYN1js=; b=12fo65BkvrMdXr
	aau6J6Dy7bi8X+rA3u0v4CwU8J0Cbd+YoGZVJi7FLNEyhrpt7ev6mEZGpE7KiWULC/KRrs24aF/9r
	iWDVlouBfpLo2fQR4/4sBirF/g1TymHJTVEffDJrcF7g+OXVUSUbYkBGmOz+H2b0c7lL9sCtC6XZ2
	qGnIbQ7F/bzU/KyYVlW3wWwD6N+DCf2Lm1A/5qZ1XyEPyGmfM1qw1UeCjEklyXSZocZz95q7K1LTo
	qMPXC6vpAwArGkJbsrHhjBPwhIVh3ndnGBNCfFgQ0RV7QrGoaQUHXtiMh4i9PNKpUwCt0oIyiaVsy
	qx4R1dCPhgTuGvu5k7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPDk-002r2I-0c;
	Sat, 17 Jun 2023 06:15:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPDg-002r0n-1n;
	Sat, 17 Jun 2023 06:15:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F39F460A54;
	Sat, 17 Jun 2023 06:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CEDC433C8;
	Sat, 17 Jun 2023 06:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686982531;
	bh=FmBCPGQr9kc4FZ3SJahzQDpcowAg0zz2/CXRHAPmuKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZPxNNOZ7Pj7Xyf/2II866o9WGyGm1IrJ+s0YaBcPXU6Zpw9n8L8eiTjVcgJY+2Vs
	 kld2AEWURToZP5cMWq1Ovy1Zcdh+nXcQ07YLmVsYdmCnhWaIZH4rzkh5ACAnqBAq9Q
	 wzQ0gANPefS1BRw6XI2qxQxNWzMTUvfRDmLMmiCAO67igHmVxwDCWFEarRwd0xHul6
	 0oDC+Um1uswFwi7/PIIIM9hS3jTKdm7q0/KfQYWawgyRH6/0DjKNXWaG0NeXVYm4Y8
	 x6nV8BirqJ1tjKuPw4r0wnIidEjuy3LK+walcl5GcB9OnmJlHxiCHLuLAiHeiVPkg6
	 78arIfpTAXAlw==
Date: Sat, 17 Jun 2023 09:14:44 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 04/12] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20230617061444.GP52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-5-rppt@kernel.org>
 <CAPhsuW7xE8sz8Nh2AdNb62k=8kgEPxaBCw3w50EfXraxmKca-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW7xE8sz8Nh2AdNb62k=8kgEPxaBCw3w50EfXraxmKca-A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_231532_694657_34D3CA3B 
X-CRM114-Status: GOOD (  27.84  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTE6NTM6NTRBTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTo1MeKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gWy4uLl0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tl
cm5lbC9tb2R1bGUuYyBiL2FyY2gvYXJtNjQva2VybmVsL21vZHVsZS5jCj4gPiBpbmRleCA1YWY0
OTc1Y2FlYjUuLmMzZDk5OWYzYTNkZCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQva2VybmVs
L21vZHVsZS5jCj4gPiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYwo+ID4gQEAgLTE3
LDU2ICsxNyw1MCBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGVsb2FkZXIuaD4KPiA+ICAj
aW5jbHVkZSA8bGludXgvc2NzLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KPiA+
ICsjaW5jbHVkZSA8bGludXgvZXhlY21lbS5oPgo+ID4gICNpbmNsdWRlIDxhc20vYWx0ZXJuYXRp
dmUuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL2luc24uaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3Njcy5o
Pgo+ID4gICNpbmNsdWRlIDxhc20vc2VjdGlvbnMuaD4KPiA+Cj4gPiAtdm9pZCAqbW9kdWxlX2Fs
bG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+ICtzdGF0aWMgc3RydWN0IGV4ZWNtZW1fcGFyYW1z
IGV4ZWNtZW1fcGFyYW1zID0gewo+ID4gKyAgICAgICAubW9kdWxlcyA9IHsKPiA+ICsgICAgICAg
ICAgICAgICAuZmxhZ3MgPSBFWEVDTUVNX0tBU0FOX1NIQURPVywKPiA+ICsgICAgICAgICAgICAg
ICAudGV4dCA9IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIC5hbGlnbm1lbnQgPSBNT0RV
TEVfQUxJR04sCj4gPiArICAgICAgICAgICAgICAgfSwKPiA+ICsgICAgICAgfSwKPiA+ICt9Owo+
ID4gKwo+ID4gK3N0cnVjdCBleGVjbWVtX3BhcmFtcyBfX2luaXQgKmV4ZWNtZW1fYXJjaF9wYXJh
bXModm9pZCkKPiA+ICB7Cj4gPiAgICAgICAgIHU2NCBtb2R1bGVfYWxsb2NfZW5kID0gbW9kdWxl
X2FsbG9jX2Jhc2UgKyBNT0RVTEVTX1ZTSVpFOwo+ID4gLSAgICAgICBnZnBfdCBnZnBfbWFzayA9
IEdGUF9LRVJORUw7Cj4gPiAtICAgICAgIHZvaWQgKnA7Cj4gPiAtCj4gPiAtICAgICAgIC8qIFNp
bGVuY2UgdGhlIGluaXRpYWwgYWxsb2NhdGlvbiAqLwo+ID4gLSAgICAgICBpZiAoSVNfRU5BQkxF
RChDT05GSUdfQVJNNjRfTU9EVUxFX1BMVFMpKQo+ID4gLSAgICAgICAgICAgICAgIGdmcF9tYXNr
IHw9IF9fR0ZQX05PV0FSTjsKPiA+Cj4gPiAtICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19L
QVNBTl9HRU5FUklDKSB8fAo+ID4gLSAgICAgICAgICAgSVNfRU5BQkxFRChDT05GSUdfS0FTQU5f
U1dfVEFHUykpCj4gPiAtICAgICAgICAgICAgICAgLyogZG9uJ3QgZXhjZWVkIHRoZSBzdGF0aWMg
bW9kdWxlIHJlZ2lvbiAtIHNlZSBiZWxvdyAqLwo+ID4gLSAgICAgICAgICAgICAgIG1vZHVsZV9h
bGxvY19lbmQgPSBNT0RVTEVTX0VORDsKPiA+ICsgICAgICAgZXhlY21lbV9wYXJhbXMubW9kdWxl
cy50ZXh0LnBncHJvdCA9IFBBR0VfS0VSTkVMOwo+ID4gKyAgICAgICBleGVjbWVtX3BhcmFtcy5t
b2R1bGVzLnRleHQuc3RhcnQgPSBtb2R1bGVfYWxsb2NfYmFzZTsKPiAKPiBJIHRoaW5rIEkgbWVu
dGlvbmVkIHRoaXMgZWFybGllci4gRm9yIGFybTY0IHdpdGggQ09ORklHX1JBTkRPTUlaRV9CQVNF
LAo+IG1vZHVsZV9hbGxvY19iYXNlIGlzIG5vdCB5ZXQgc2V0IHdoZW4gZXhlY21lbV9hcmNoX3Bh
cmFtcygpIGlzCj4gY2FsbGVkLiBTbyB3ZSB3aWxsIG5lZWQgc29tZSBleHRyYSBsb2dpYyBmb3Ig
dGhpcy4KClJpZ2h0LCB0aGlzIGlzIHRha2VuIGNhcmUgb2YgaW4gYSBsYXRlciBwYXRjaCwgYnV0
IGl0IGFjdHVhbGx5IGJlbG9uZ3MgaGVyZS4KR29vZCBjYXRjaCEKIAo+IFRoYW5rcywKPiBTb25n
Cj4gCj4gCj4gPiArICAgICAgIGV4ZWNtZW1fcGFyYW1zLm1vZHVsZXMudGV4dC5lbmQgPSBtb2R1
bGVfYWxsb2NfZW5kOwo+ID4KPiA+IC0gICAgICAgcCA9IF9fdm1hbGxvY19ub2RlX3JhbmdlKHNp
emUsIE1PRFVMRV9BTElHTiwgbW9kdWxlX2FsbG9jX2Jhc2UsCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG1vZHVsZV9hbGxvY19lbmQsIGdmcF9tYXNrLCBQQUdFX0tFUk5FTCwg
Vk1fREVGRVJfS01FTUxFQUssCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5V
TUFfTk9fTk9ERSwgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApKTsKPiA+IC0KPiA+IC0gICAg
ICAgaWYgKCFwICYmIElTX0VOQUJMRUQoQ09ORklHX0FSTTY0X01PRFVMRV9QTFRTKSAmJgo+ID4g
KyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBLQVNBTiB3aXRob3V0IEtBU0FOX1ZNQUxMT0MgY2Fu
IG9ubHkgZGVhbCB3aXRoIG1vZHVsZQo+ID4gKyAgICAgICAgKiBhbGxvY2F0aW9ucyBiZWluZyBz
ZXJ2ZWQgZnJvbSB0aGUgcmVzZXJ2ZWQgbW9kdWxlIHJlZ2lvbiwKPiA+ICsgICAgICAgICogc2lu
Y2UgdGhlIHJlbWFpbmRlciBvZiB0aGUgdm1hbGxvYyByZWdpb24gaXMgYWxyZWFkeQo+ID4gKyAg
ICAgICAgKiBiYWNrZWQgYnkgemVybyBzaGFkb3cgcGFnZXMsIGFuZCBwdW5jaGluZyBob2xlcyBp
bnRvIGl0Cj4gPiArICAgICAgICAqIGlzIG5vbi10cml2aWFsLiBTaW5jZSB0aGUgbW9kdWxlIHJl
Z2lvbiBpcyBub3QgcmFuZG9taXplZAo+ID4gKyAgICAgICAgKiB3aGVuIEtBU0FOIGlzIGVuYWJs
ZWQgd2l0aG91dCBLQVNBTl9WTUFMTE9DLCBpdCBpcyBldmVuCj4gPiArICAgICAgICAqIGxlc3Mg
bGlrZWx5IHRoYXQgdGhlIG1vZHVsZSByZWdpb24gZ2V0cyBleGhhdXN0ZWQsIHNvIHdlCj4gPiAr
ICAgICAgICAqIGNhbiBzaW1wbHkgb21pdCB0aGlzIGZhbGxiYWNrIGluIHRoYXQgY2FzZS4KPiA+
ICsgICAgICAgICovCj4gPiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR19BUk02NF9NT0RV
TEVfUExUUykgJiYKPiA+ICAgICAgICAgICAgIChJU19FTkFCTEVEKENPTkZJR19LQVNBTl9WTUFM
TE9DKSB8fAo+ID4gICAgICAgICAgICAgICghSVNfRU5BQkxFRChDT05GSUdfS0FTQU5fR0VORVJJ
QykgJiYKPiA+IC0gICAgICAgICAgICAgIUlTX0VOQUJMRUQoQ09ORklHX0tBU0FOX1NXX1RBR1Mp
KSkpCj4gPiAtICAgICAgICAgICAgICAgLyoKPiA+IC0gICAgICAgICAgICAgICAgKiBLQVNBTiB3
aXRob3V0IEtBU0FOX1ZNQUxMT0MgY2FuIG9ubHkgZGVhbCB3aXRoIG1vZHVsZQo+ID4gLSAgICAg
ICAgICAgICAgICAqIGFsbG9jYXRpb25zIGJlaW5nIHNlcnZlZCBmcm9tIHRoZSByZXNlcnZlZCBt
b2R1bGUgcmVnaW9uLAo+ID4gLSAgICAgICAgICAgICAgICAqIHNpbmNlIHRoZSByZW1haW5kZXIg
b2YgdGhlIHZtYWxsb2MgcmVnaW9uIGlzIGFscmVhZHkKPiA+IC0gICAgICAgICAgICAgICAgKiBi
YWNrZWQgYnkgemVybyBzaGFkb3cgcGFnZXMsIGFuZCBwdW5jaGluZyBob2xlcyBpbnRvIGl0Cj4g
PiAtICAgICAgICAgICAgICAgICogaXMgbm9uLXRyaXZpYWwuIFNpbmNlIHRoZSBtb2R1bGUgcmVn
aW9uIGlzIG5vdCByYW5kb21pemVkCj4gPiAtICAgICAgICAgICAgICAgICogd2hlbiBLQVNBTiBp
cyBlbmFibGVkIHdpdGhvdXQgS0FTQU5fVk1BTExPQywgaXQgaXMgZXZlbgo+ID4gLSAgICAgICAg
ICAgICAgICAqIGxlc3MgbGlrZWx5IHRoYXQgdGhlIG1vZHVsZSByZWdpb24gZ2V0cyBleGhhdXN0
ZWQsIHNvIHdlCj4gPiAtICAgICAgICAgICAgICAgICogY2FuIHNpbXBseSBvbWl0IHRoaXMgZmFs
bGJhY2sgaW4gdGhhdCBjYXNlLgo+ID4gLSAgICAgICAgICAgICAgICAqLwo+ID4gLSAgICAgICAg
ICAgICAgIHAgPSBfX3ZtYWxsb2Nfbm9kZV9yYW5nZShzaXplLCBNT0RVTEVfQUxJR04sIG1vZHVs
ZV9hbGxvY19iYXNlLAo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtb2R1bGVf
YWxsb2NfYmFzZSArIFNaXzJHLCBHRlBfS0VSTkVMLAo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBQQUdFX0tFUk5FTCwgMCwgTlVNQV9OT19OT0RFLAo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBfX2J1aWx0aW5fcmV0dXJuX2FkZHJlc3MoMCkpOwo+ID4gLQo+
ID4gLSAgICAgICBpZiAocCAmJiAoa2FzYW5fYWxsb2NfbW9kdWxlX3NoYWRvdyhwLCBzaXplLCBn
ZnBfbWFzaykgPCAwKSkgewo+ID4gLSAgICAgICAgICAgICAgIHZmcmVlKHApOwo+ID4gLSAgICAg
ICAgICAgICAgIHJldHVybiBOVUxMOwo+ID4gKyAgICAgICAgICAgICAhSVNfRU5BQkxFRChDT05G
SUdfS0FTQU5fU1dfVEFHUykpKSkgewo+ID4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ZW5kID0gbW9kdWxlX2FsbG9jX2Jhc2UgKyBTWl8yRzsKPiA+ICsKPiA+ICsgICAgICAgICAgICAg
ICBleGVjbWVtX3BhcmFtcy5tb2R1bGVzLnRleHQuZmFsbGJhY2tfc3RhcnQgPSBtb2R1bGVfYWxs
b2NfYmFzZTsKPiA+ICsgICAgICAgICAgICAgICBleGVjbWVtX3BhcmFtcy5tb2R1bGVzLnRleHQu
ZmFsbGJhY2tfZW5kID0gZW5kOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gLSAgICAgICAvKiBNZW1v
cnkgaXMgaW50ZW5kZWQgdG8gYmUgZXhlY3V0YWJsZSwgcmVzZXQgdGhlIHBvaW50ZXIgdGFnLiAq
Lwo+ID4gLSAgICAgICByZXR1cm4ga2FzYW5fcmVzZXRfdGFnKHApOwo+ID4gKyAgICAgICByZXR1
cm4gJmV4ZWNtZW1fcGFyYW1zOwo+ID4gIH0KPiA+Cj4gPiAgZW51bSBhYXJjaDY0X3JlbG9jX29w
IHsKCi0tIApTaW5jZXJlbHkgeW91cnMsCk1pa2UuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
