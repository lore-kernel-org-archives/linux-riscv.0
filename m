Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04DAC7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 17:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYTBSnOl4WWzbAx8M2M2cnwRSJK7YB2eAj6lJU+1qvQ=; b=ZEUoVVq441vKAS
	1iys2mqEPt+AOT7O69xGR846nAAUTXeylmQX/otSWJPfF5flD/sWK+BTYe6sbasbtE3gmpT0jWzQq
	zYJ3Q+rHVIUOK9b3fx53gHJ5a5HtNfJRfI4542IgUJ7OgqD5EPSardjyuYMGTlWwc7tfpTi9byav4
	efBWezb3AABU5reyME9mvh2Qp/y5YMqviLCztWQX4PnZyrfegIUstbcrFY9F7y+/Ns8EWFkqKx5bt
	dO1F6mq/+5JdOS1rOXvb5erQEChY9Tp68ECF4cNEFfjSyYwHIH9E4OpLhHLIIstqxoRt3uetQiWLo
	+ZGFcar9UcKDAgBCeOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7fVV-00DgE1-18;
	Fri, 09 Jun 2023 17:02:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7fVR-00DgBI-2S;
	Fri, 09 Jun 2023 17:02:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6155C60E74;
	Fri,  9 Jun 2023 17:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26DCC4339C;
	Fri,  9 Jun 2023 17:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686330151;
	bh=vxAb82+vAl+BH98Z/zX2UFkfYunrykLKznTO4Bf32/o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mi+1/ju1etiB6d0wiW4caAjQqZLe00FeV1NkWgT7OHTC7YXhbWrImPhkjcdfLthep
	 R4NctZPvMcT6YU1NN0hlAPJu7mKlMOhF8XW1w/JUcKEX6IymvTValQ7iJLgbthe+rr
	 JB0Y/WdslTbhCTkFmElAt6A2q9AjkZ65JlkLpT6RWSVvoxHuctv3jAm4tkLSY6DnGo
	 sjANix/3DDuGcfUiGq4bVWyWyi4Aib0wLcEVEjV2uGWiQih+ufGfWA3fM021KKgeWY
	 Dt91VQ5xBfF0lTdjr2IkoyUEOPUU+/xMsQaC1Ua+lm/Kg5AHwmxvY3mxjDI1kZZXq8
	 eusqU7U1U5lpg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4f644dffd71so2619958e87.1;
        Fri, 09 Jun 2023 10:02:31 -0700 (PDT)
X-Gm-Message-State: AC+VfDyQg8hOmsj4tLzMYhPcRQ8Ef8plDx0pRIMFnBor8OkbIvmDvf4W
	HrbpP+q/DtcykJ0eOM1sDKGySOgGWysRLWRAcb8=
X-Google-Smtp-Source: ACHHUZ4u3y79XyQLMHF4er59h6QhhYai8KonYYOOA8YDDos4NgFbnLZdqPfEIRGQCpyydTzD04kcj6u0lkxU6y+OWW4=
X-Received: by 2002:a2e:9891:0:b0:2b1:e5d8:d008 with SMTP id
 b17-20020a2e9891000000b002b1e5d8d008mr1338098ljj.37.1686330149805; Fri, 09
 Jun 2023 10:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230601101257.530867-1-rppt@kernel.org> <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan> <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org> <ZH20XkD74prrdN4u@FVFF77S0Q05N>
 <CAPhsuW7ntn_HpVWdGK_hYVd3zsPEFToBNfmtt0m6K8SwfxJ66Q@mail.gmail.com> <20230608184116.GJ52412@kernel.org>
In-Reply-To: <20230608184116.GJ52412@kernel.org>
From: Song Liu <song@kernel.org>
Date: Fri, 9 Jun 2023 10:02:16 -0700
X-Gmail-Original-Message-ID: <CAPhsuW5YYa6nQhO2=zor75XkdKpFysZD42DgDRkKZvQT6aMqcA@mail.gmail.com>
Message-ID: <CAPhsuW5YYa6nQhO2=zor75XkdKpFysZD42DgDRkKZvQT6aMqcA@mail.gmail.com>
Subject: Re: [PATCH 00/13] mm: jit/text allocator
To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
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
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_100233_898042_19C07625 
X-CRM114-Status: GOOD (  38.76  )
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

T24gVGh1LCBKdW4gOCwgMjAyMyBhdCAxMTo0MeKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAwNiwgMjAyMyBhdCAxMToyMTo1OUFNIC0w
NzAwLCBTb25nIExpdSB3cm90ZToKPiA+IE9uIE1vbiwgSnVuIDUsIDIwMjMgYXQgMzowOeKAr0FN
IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4KPiA+IFsuLi5d
Cj4gPgo+ID4gPiA+ID4gPiBDYW4geW91IGdpdmUgbW9yZSBkZXRhaWwgb24gd2hhdCBwYXJhbWV0
ZXJzIHlvdSBuZWVkPyBJZiB0aGUgb25seSBleHRyYQo+ID4gPiA+ID4gPiBwYXJhbWV0ZXIgaXMg
anVzdCAiZG9lcyB0aGlzIGFsbG9jYXRpb24gbmVlZCB0byBsaXZlIGNsb3NlIHRvIGtlcm5lbAo+
ID4gPiA+ID4gPiB0ZXh0IiwgdGhhdCdzIG5vdCB0aGF0IGJpZyBvZiBhIGRlYWwuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gTXkgdGhpbmtpbmcgd2FzIHRoYXQgd2UgYXQgbGVhc3QgbmVlZCB0aGUgc3Rh
cnQgKyBlbmQgZm9yIGVhY2ggY2FsbGVyLiBUaGF0Cj4gPiA+ID4gPiBtaWdodCBiZSBpdCwgdGJo
Lgo+ID4gPiA+Cj4gPiA+ID4gRG8geW91IG1lYW4gdGhhdCBtb2R1bGVzIHdpbGwgaGF2ZSBzb21l
dGhpbmcgbGlrZQo+ID4gPiA+Cj4gPiA+ID4gICAgICAgaml0X3RleHRfYWxsb2Moc2l6ZSwgTU9E
VUxFU19TVEFSVCwgTU9EVUxFU19FTkQpOwo+ID4gPiA+Cj4gPiA+ID4gYW5kIGtwcm9iZXMgd2ls
bCBoYXZlCj4gPiA+ID4KPiA+ID4gPiAgICAgICBqaXRfdGV4dF9hbGxvYyhzaXplLCBLUFJPQkVT
X1NUQVJULCBLUFJPQkVTX0VORCk7Cj4gPiA+ID4gPwo+ID4gPgo+ID4gPiBZZXMuCj4gPgo+ID4g
SG93IGFib3V0IHdlIHN0YXJ0IHdpdGggdHdvIEFQSXM6Cj4gPiAgICAgIGppdF90ZXh0X2FsbG9j
KHNpemUpOwo+ID4gICAgICBqaXRfdGV4dF9hbGxvY19yYW5nZShzaXplLCBzdGFydCwgZW5kKTsK
PiA+Cj4gPiBBRkFJQ1QsIGFybTY0IGlzIHRoZSBvbmx5IGFyY2ggdGhhdCByZXF1aXJlcyB0aGUg
bGF0dGVyIEFQSS4gQW5kIFRCSCwgSSBhbQo+ID4gbm90IHF1aXRlIGNvbnZpbmNlZCBpdCBpcyBu
ZWVkZWQuCj4KPiBSaWdodCBub3cgYXJtNjQgYW5kIHJpc2N2IG92ZXJyaWRlIGJwZiBhbmQga3By
b2JlcyBhbGxvY2F0aW9ucyB0byB1c2UgdGhlCj4gZW50aXJlIHZtYWxsb2MgYWRkcmVzcyBzcGFj
ZSwgYnV0IGhhdmluZyB0aGUgYWJpbGl0eSB0byBhbGxvY2F0ZSBnZW5lcmF0ZWQKPiBjb2RlIG91
dHNpZGUgb2YgbW9kdWxlcyBhcmVhIG1heSBiZSB1c2VmdWwgZm9yIG90aGVyIGFyY2hpdGVjdHVy
ZXMuCj4KPiBTdGlsbCB0aGUgc3RhcnQgKyBlbmQgZm9yIHRoZSBjYWxsZXJzIGZlZWxzIGJhY2t3
YXJkcyB0byBtZSBiZWNhdXNlIHRoZQo+IGNhbGxlcnMgZG8gbm90IGRlZmluZSB0aGUgcmFuZ2Vz
LCBidXQgcmF0aGVyIHRoZSBhcmNoaXRlY3R1cmVzLCBzbyB3ZSBzdGlsbAo+IG5lZWQgYSB3YXkg
Zm9yIGFyY2hpdGVjdHVyZXMgdG8gZGVmaW5lIGhvdyB0aGV5IHdhbnQgYWxsb2NhdGUgbWVtb3J5
IGZvcgo+IHRoZSBnZW5lcmF0ZWQgY29kZS4KClllYWgsIHRoaXMgbWFrZXMgc2Vuc2UuCgo+Cj4g
PiA+ID4gSXQgc2lsbCBjYW4gYmUgYWNoaWV2ZWQgd2l0aCBhIHNpbmdsZSBqaXRfYWxsb2NfYXJj
aF9wYXJhbXMoKSwganVzdCBieQo+ID4gPiA+IGFkZGluZyBlbnVtIGppdF90eXBlIHBhcmFtZXRl
ciB0byBqaXRfdGV4dF9hbGxvYygpLgo+ID4gPgo+ID4gPiBUaGF0IGZlZWxzIGJhY2t3YXJkcyB0
byBtZTsgaXQgY2VudHJhbGl6ZXMgYSBidW5jaCBvZiBpbmZvcm1hdGlvbiBhYm91dAo+ID4gPiBk
aXN0aW5jdCB1c2VycyB0byBiZSBhYmxlIHRvIHNob3ZlIHRoYXQgaW50byBhIHN0YXRpYyBhcnJh
eSwgd2hlbiB0aGUgY2FsbHNpdGVzCj4gPiA+IGNhbiBwYXNzIHRoYXQgaW5mb3JtYXRpb24uCj4g
Pgo+ID4gSSB0aGluayB3ZSBvbmx5IHR3byB0eXBlIG9mIHVzZXJzOiBtb2R1bGUgYW5kIGV2ZXJ5
dGhpbmcgZWxzZSAoZnRyYWNlLCBrcHJvYmUsCj4gPiBicGYgc3R1ZmYpLiBUaGUga2V5IGRpZmZl
cmVuY2VzIGFyZToKPiA+Cj4gPiAgIDEuIG1vZHVsZSB1c2VzIHRleHQgYW5kIGRhdGE7IHdoaWxl
IGV2ZXJ5dGhpbmcgZWxzZSBvbmx5IHVzZXMgdGV4dC4KPiA+ICAgMi4gbW9kdWxlIGNvZGUgaXMg
Z2VuZXJhdGVkIGJ5IHRoZSBjb21waWxlciwgYW5kIHRodXMgaGFzIHN0cm9uZ2VyCj4gPiAgIHJl
cXVpcmVtZW50cyBpbiBhZGRyZXNzIHJhbmdlczsgZXZlcnl0aGluZyBlbHNlIGFyZSBnZW5lcmF0
ZWQgdmlhIHNvbWUKPiA+ICAgSklUIG9yIG1hbnVhbCB3cml0dGVuIGFzc2VtYmx5LCBzbyB0aGV5
IGFyZSBtb3JlIGZsZXhpYmxlIHdpdGggYWRkcmVzcwo+ID4gICByYW5nZXMgKGluIEpJVCwgd2Ug
Y2FuIGF2b2lkIHVzaW5nIGluc3RydWN0aW9ucyB0aGF0IHJlcXVpcmVzIGEgc3BlY2lmaWMKPiA+
ICAgYWRkcmVzcyByYW5nZSkuCj4gPgo+ID4gVGhlIG5leHQgcXVlc3Rpb24gaXMsIGNhbiB3ZSBo
YXZlIHRoZSB0d28gdHlwZXMgb2YgdXNlcnMgc2hhcmUgdGhlIHNhbWUKPiA+IGFkZHJlc3MgcmFu
Z2VzPyBJZiBub3QsIHdlIGNhbiByZXNlcnZlIHRoZSBwcmVmZXJyZWQgcmFuZ2UgZm9yIG1vZHVs
ZXMsCj4gPiBhbmQgbGV0IGV2ZXJ5dGhpbmcgZWxzZSB1c2UgdGhlIG90aGVyIHJhbmdlLiBJIGRv
bid0IHNlZSByZWFzb25zIHRvIGZ1cnRoZXIKPiA+IHNlcGFyYXRlIHVzZXJzIGluIHRoZSAiZXZl
cnl0aGluZyBlbHNlIiBncm91cC4KPgo+IEkgYWdyZWUgdGhhdCB3ZSBjYW4gZGVmaW5lIG9ubHkg
dHdvIHR5cGVzOiBtb2R1bGVzIGFuZCBldmVyeXRoaW5nIGVsc2UgYW5kCj4gbGV0IHRoZSBhcmNo
aXRlY3R1cmVzIGRlZmluZSBpZiB0aGV5IG5lZWQgZGlmZmVyZW50IHJhbmdlcyBmb3IgdGhlc2Ug
dHdvCj4gdHlwZXMsIG9yIHdhbnQgdGhlIHNhbWUgcmFuZ2UgZm9yIGV2ZXJ5dGhpbmcuCj4KPiBX
aXRoIG9ubHkgdHdvIHR5cGVzIHdlIGNhbiBoYXZlIHR3byBBUEkgY2FsbHMgZm9yIGFsbG9jLCBh
bmQgYSBzaW5nbGUKPiBzdHJ1Y3R1cmUgdGhhdCBkZWZpbmVzIHRoZSByYW5nZXMgZXRjIGZyb20g
dGhlIGFyY2hpdGVjdHVyZSBzaWRlIHJhdGhlcgo+IHRoYW4gc3ByZWFkIGFsbCBvdmVyLgo+Cj4g
TGlrZSBzb21ldGhpbmcgYWxvbmcgdGhlc2UgbGluZXM6Cj4KPiAgICAgICAgIHN0cnVjdCBleGVj
bWVtX3JhbmdlIHsKPiAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAgIHN0YXJ0Owo+ICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICAgZW5kOwo+ICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nICAgZmFsbGJhY2tfc3RhcnQ7Cj4gICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgICBmYWxsYmFja19lbmQ7Cj4gICAgICAgICAgICAgICAgIHBncHJvdF90ICAgICAgICBwZ3By
b3Q7Cj4gICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAgICBhbGlnbm1lbnQ7Cj4gICAgICAg
ICB9Owo+Cj4gICAgICAgICBzdHJ1Y3QgZXhlY21lbV9tb2R1bGVzX3JhbmdlIHsKPiAgICAgICAg
ICAgICAgICAgZW51bSBleGVjbWVtX21vZHVsZV9mbGFncyBmbGFnczsKPiAgICAgICAgICAgICAg
ICAgc3RydWN0IGV4ZWNtZW1fcmFuZ2UgdGV4dDsKPiAgICAgICAgICAgICAgICAgc3RydWN0IGV4
ZWNtZW1fcmFuZ2UgZGF0YTsKPiAgICAgICAgIH07Cj4KPiAgICAgICAgIHN0cnVjdCBleGVjbWVt
X2ppdF9yYW5nZSB7Cj4gICAgICAgICAgICAgICAgIHN0cnVjdCBleGVjbWVtX3JhbmdlIHRleHQ7
Cj4gICAgICAgICB9Owo+Cj4gICAgICAgICBzdHJ1Y3QgZXhlY21lbV9wYXJhbXMgewo+ICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgZXhlY21lbV9tb2R1bGVzX3JhbmdlICAgIG1vZHVsZXM7Cj4gICAg
ICAgICAgICAgICAgIHN0cnVjdCBleGVjbWVtX2ppdF9yYW5nZSAgICAgICAgaml0Owo+ICAgICAg
ICAgfTsKPgo+ICAgICAgICAgc3RydWN0IGV4ZWNtZW1fcGFyYW1zICpleGVjbWVtX2FyY2hfcGFy
YW1zKHZvaWQpOwo+Cj4gICAgICAgICB2b2lkICpleGVjbWVtX3RleHRfYWxsb2Moc2l6ZV90IHNp
emUpOwo+ICAgICAgICAgdm9pZCAqZXhlY21lbV9kYXRhX2FsbG9jKHNpemVfdCBzaXplKTsKPiAg
ICAgICAgIHZvaWQgZXhlY21lbV9mcmVlKHZvaWQgKnB0cik7CgpXaXRoIHRoZSBqaXQgdmFyaWF0
aW9uLCBtYXliZSB3ZSBjYW4ganVzdCBjYWxsIHRoZXNlCm1vZHVsZV9bdGV4dHxkYXRhXV9hbGxv
YygpPwoKYnR3OiBEZXBlbmRpbmcgb24gdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBhbGxvY2F0
b3IsIHdlIG1heSBhbHNvCm5lZWQgc2VwYXJhdGUgZnJlZSgpcyBmb3IgdGV4dCBhbmQgZGF0YS4K
Cj4KPiAgICAgICAgIHZvaWQgKmppdF90ZXh0X2FsbG9jKHNpemVfdCBzaXplKTsKPiAgICAgICAg
IHZvaWQgaml0X2ZyZWUodm9pZCAqcHRyKTsKPgoKWy4uLl0KCkhvdyBzaG91bGQgd2UgbW92ZSBh
aGVhZCBmcm9tIGhlcmU/CgpBRkFJQ1QsIGFsbCB0aGVzZSBjaGFuZ2VzIGNhbiBiZSBlYXNpbHkg
ZXh0ZW5kZWQgYW5kIHJlZmFjdG9yZWQKaW4gdGhlIGZ1dHVyZSwgc28gd2UgZG9uJ3QgaGF2ZSB0
byBtYWtlIGl0IHBlcmZlY3QgdGhlIGZpcnN0IHRpbWUuCk9UT0gsIGhhdmluZyB0aGUgaW50ZXJm
YWNlIGNvbW1pdHRlZCAoZWl0aGVyIHRoaXMgc2V0IG9yIG15Cm1vZHVsZV9hbGxvY190eXBlIHZl
cnNpb24pIGNhbiB1bmJsb2NrIHdvcmtzIGluIHRoZSBiaW5wYWNrCmFsbG9jYXRvciBhbmQgdGhl
IHVzZXJzIHNpZGUuIFRoZXJlZm9yZSwgSSB0aGluayB3ZSBjYW4gbW92ZQpyZWxhdGl2ZWx5IGZh
c3QgaGVyZT8KClRoYW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
