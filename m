Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE877CCA470
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 18:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0duxkgfWvxYcV7GQVTsKvbBoCvApz9AXX65XDI7hBI=; b=qGXWTDbdIKgnOa
	QrL7IuXsxfdJMCSpK0am0FQodTj+QP9v9lU7I3dXAbRblEBZrpFwqmIq5048n2R0Oyrypkq5KUxMk
	ecBmHKcJQZefJhGBy3HPp2FglIvAJQWETgbgYHemE1u4HKqjr2GAZUKNroZGcyrHH0L9CsYowuLcd
	zpMHNwwVPROsmJKfVGFfi2lMvH+V19KdGXkmV+YqyosGQ9W1yywFyY27TOqm2unUjbfZWUjo/tsBc
	oqbYZfSpC+FpizBPGVCdvvD4VZHnpI/68LSzEx85wiAC9IG46c1RpD8oSNixrMhc4rJoCkONBhlNy
	oUF/dCkt4EP+UIyH2P1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5qGX-00000000cNd-186M;
	Mon, 06 Oct 2025 18:48:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5qGV-00000000cNH-1bHP
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 18:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2C9644073;
	Mon,  6 Oct 2025 18:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B34EC4CEF5;
	Mon,  6 Oct 2025 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759776534;
	bh=rcIVOSltuO8gB9UARzera3hSNz+GSt4EaNpkP0kh+qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fk7bj3R/tUTYNz3QS0QZyAQjypJVsDgjgfnhTEDYgI3uMVu8xt4XumnktxefaHOwm
	 lEdaKew/4XH5LzBMx4aj5O9n/xDzvU7wmnbHrc6uqty/sVHj14C6tjtRdxf5O8F+2h
	 EQkobofuSnYb4+DM5ivSgDH8C/hBTYV0b3XoJ6rDaUZ7b3xS9huUV3mPe4rCcfDv9X
	 aeUNRoUggJCX7xfQYUD9iimK5j+w3Gl2oMwdOyXitjfjpZwLMktaT/s9zJtEP/KpeF
	 IDm3XgasEFWsyYky2SvPW29YOo/7f4vvMtjyRwFAFwKvpcOwoEfEZs/d5aHrpxMb1M
	 Iw7SshajQScBA==
Date: Mon, 6 Oct 2025 15:48:51 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Leo Yan <leo.yan@arm.com>, Namhyung Kim <namhyung@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/9] perf build: Disable thread safety analysis for
 perl header
Message-ID: <aOQPE33mYPVYnkl5@x1>
References: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
 <20251006-perf_build_android_ndk-v3-4-4305590795b2@arm.com>
 <CAP-5=fUVs8Dn+kQDgPW08SNC=W5ZQKMFEETjjqkOJ_Mvbv22dw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAP-5=fUVs8Dn+kQDgPW08SNC=W5ZQKMFEETjjqkOJ_Mvbv22dw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_114855_461066_BBE51152 
X-CRM114-Status: GOOD (  22.77  )
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

T24gTW9uLCBPY3QgMDYsIDIwMjUgYXQgMTA6NTY6NDNBTSAtMDcwMCwgSWFuIFJvZ2VycyB3cm90
ZToKPiBPbiBNb24sIE9jdCA2LCAyMDI1IGF0IDk6MjHigK9BTSBMZW8gWWFuIDxsZW8ueWFuQGFy
bS5jb20+IHdyb3RlOgo+ID4KPiA+IFdoZW4gYnVpbGQgd2l0aCBwZXJsNSwgaXQgcmVwb3J0cyBl
cnJvcjoKPiA+Cj4gPiAgICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC91c3IvbGliL3Blcmw1LzUu
NDIuMC94ODZfNjQtbGludXgtdGhyZWFkLW11bHRpL0NPUkUvcGVybC5oOjc5MzM6Cj4gPiAgICAg
L3Vzci9saWIvcGVybDUvNS40Mi4wL3g4Nl82NC1saW51eC10aHJlYWQtbXVsdGkvQ09SRS9pbmxp
bmUuaDoyOTg6NTogZXJyb3I6Cj4gPiAgICAgICAgICAgbXV0ZXggJ1BMX2Vudl9tdXRleC5sb2Nr
JyBpcyBub3QgaGVsZCBvbiBldmVyeSBwYXRoIHRocm91Z2gKPiA+ICAgICAgICAgICBoZXJlIFst
V2Vycm9yLC1XdGhyZWFkLXNhZmV0eS1hbmFseXNpc10KPiA+ICAgICAgIDI5OCB8ICAgICBFTlZf
VU5MT0NLOwo+ID4gICAgICAgICAgIHwgICAgIF4KPiA+ICAgICAvdXNyL2xpYi9wZXJsNS81LjQy
LjAveDg2XzY0LWxpbnV4LXRocmVhZC1tdWx0aS9DT1JFL3BlcmwuaDo3MDkxOjMxOiBub3RlOgo+
ID4gICAgICAgICAgIGV4cGFuZGVkIGZyb20gbWFjcm8gJ0VOVl9VTkxPQ0snCj4gPiAgICAgIDcw
OTEgfCAjICBkZWZpbmUgRU5WX1VOTE9DSyAgICAgICAgICBQRVJMX1JFRU5UUkFOVF9VTkxPQ0so
ImVudiIuLi4KPiA+ICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4K
PiA+ICAgICAvdXNyL2xpYi9wZXJsNS81LjQyLjAveDg2XzY0LWxpbnV4LXRocmVhZC1tdWx0aS9D
T1JFL3BlcmwuaDo2NDY1Ojc6IG5vdGU6Cj4gPiAgICAgICAgICAgZXhwYW5kZWQgZnJvbSBtYWNy
byAnUEVSTF9SRUVOVFJBTlRfVU5MT0NLJwo+ID4gICAgICA2NDY1IHwgICAgIH0gU1RNVF9FTkQK
PiA+ICAgICAgICAgICB8ICAgICAgIF4KPiA+ICAgICAvdXNyL2xpYi9wZXJsNS81LjQyLjAveDg2
XzY0LWxpbnV4LXRocmVhZC1tdWx0aS9DT1JFL3BlcmwuaDo4NjU6Mjg6IG5vdGU6Cj4gPiAgICAg
ICAgICAgZXhwYW5kZWQgZnJvbSBtYWNybyAnU1RNVF9FTkQnCj4gPiAgICAgICA4NjUgfCAjICAg
ZGVmaW5lIFNUTVRfRU5EICAgICB3aGlsZSAoMCkKPiA+ICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCj4gPgo+ID4gVGhlIGVycm9yIGlzIGNhdXNlZCBieSBwZXJs
IGhlYWRlciBidXQgbm90IHBlcmYgY29kZSwgZGlzYWJsZSB0aHJlYWQKPiA+IHNhZmV0eSBhbmFs
eXNpcyBpZiBpbmNsdWRpbmcgdGhlIGhlYWRlci4KPiA+Cj4gPiBUaG91Z2ggR0NDIGRvZXMgbm90
IHN1cHBvcnQgdGhlIHRocmVhZCBzYWZldHkgYW5hbHlzaXMgb3B0aW9uLCB0aGlzCj4gPiBuZWdh
dGl2ZSB3YXJuaW5nIGZsYWcgaXMgc2lsZW50bHkgaWdub3JlZCBieSBpdC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBMZW8gWWFuIDxsZW8ueWFuQGFybS5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy9w
ZXJmL3NjcmlwdHMvcGVybC9QZXJmLVRyYWNlLVV0aWwvQnVpbGQgfCAyICstCj4gPiAgdG9vbHMv
cGVyZi91dGlsL3NjcmlwdGluZy1lbmdpbmVzL0J1aWxkICAgICAgIHwgMiArLQo+ID4gIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS90b29scy9wZXJmL3NjcmlwdHMvcGVybC9QZXJmLVRyYWNlLVV0aWwvQnVpbGQgYi90
b29scy9wZXJmL3NjcmlwdHMvcGVybC9QZXJmLVRyYWNlLVV0aWwvQnVpbGQKPiA+IGluZGV4IDli
MGU1YThiNTA3MGYxYTE2NDA1MThmYWU3NTU1N2Y4MjRlZjIxZWUuLjAxYTFhMGVkNTFhZWZkNzIx
YjRiYzdlYmE3MjhjMjlhOGZmY2Q1NTEgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9wZXJmL3Njcmlw
dHMvcGVybC9QZXJmLVRyYWNlLVV0aWwvQnVpbGQKPiA+ICsrKyBiL3Rvb2xzL3BlcmYvc2NyaXB0
cy9wZXJsL1BlcmYtVHJhY2UtVXRpbC9CdWlsZAo+ID4gQEAgLTIsNyArMiw3IEBAIHBlcmYtdXRp
bC15ICs9IENvbnRleHQubwo+ID4KPiA+ICBDRkxBR1NfQ29udGV4dC5vICs9ICQoUEVSTF9FTUJF
RF9DQ09QVFMpIC1Xbm8tcmVkdW5kYW50LWRlY2xzIC1Xbm8tc3RyaWN0LXByb3RvdHlwZXMgLVdu
by1iYWQtZnVuY3Rpb24tY2FzdCAtV25vLWRlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtV25v
LXN3aXRjaC1lbnVtCj4gPiAgQ0ZMQUdTX0NvbnRleHQubyArPSAtV25vLXVudXNlZC1wYXJhbWV0
ZXIgLVduby1uZXN0ZWQtZXh0ZXJucyAtV25vLXVuZGVmCj4gPiAtQ0ZMQUdTX0NvbnRleHQubyAr
PSAtV25vLXN3aXRjaC1kZWZhdWx0IC1Xbm8tc2hhZG93Cj4gPiArQ0ZMQUdTX0NvbnRleHQubyAr
PSAtV25vLXN3aXRjaC1kZWZhdWx0IC1Xbm8tc2hhZG93IC1Xbm8tdGhyZWFkLXNhZmV0eS1hbmFs
eXNpcwo+IAo+IEkgd2Fzbid0IGFibGUgdG8gcmVwcm9kdWNlIHRoaXMgb24gRGViaWFuIHdpdGgg
cGVyZi10b29scy1uZXh0IGFuZDoKPiBtYWtlIC1DIHRvb2xzL3BlcmYgTz0vdG1wL3BlcmYgREVC
VUc9MSBDQz1jbGFuZyBDWFg9Y2xhbmcrKwo+IEhPU1RDQz1jbGFuZyBMSUJQRVJMPTEgY2xlYW4g
YWxsCj4gYnV0IG15IGxpYnBlcmwgaXMgNS40MC4gSSdtIGEgbGl0dGxlIGNvbmNlcm5lZCB0aGF0
IHRoZSB3YXJuaW5nIG1heQo+IGNhdXNlIGFuIHVucmVjb2duaXplZCBjb21waWxlciBvcHRpb24g
d2FybmluZy9lcnJvciB3aXRoIEdDQyBnaXZlbgo+IHByb2dyZXNzIG9uIHRocmVhZC1zYWZldHkt
YW5hbHlzaXMgaGFzIGVuZGVkIHRoZXJlLiBBbnl3YXksIHRoZXNlCj4gYXJlbid0IGJsb2NrZXJz
Lgo+IAo+IFJldmlld2VkLWJ5OiBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5jb20+CgpJIHdh
cyBhIGJpdCB3YXJ5IGFuZCBzYXcgdGhpcyBvbiBvbmx5LCBJSVJDIE1hbmphcm8gTGludXgsIGFu
ZCBzaW5jZQpsaWJwZXJsIHN1cHBvcnQgaXMgb3B0LWluLCBJIGxlZnQgaXQgaW4gdGhlIGJhY2ti
dXJuZXIsIGJ1dCBoYXZpbmcgaXQKYnVpbGRpbmcgdGhlcmUgYXMgd2VsbCBtYXkgaGVscCBkZXRl
Y3Rpbmcgc29tZSBvdGhlciBzdHVmZiB3aXRoIHRoaW5ncwpvbmx5IGVuYWJsZWQvcHJlc2VudCB0
aGVyZSwgc28gdGhhbmtzIExlbyBhbmQgSWFuLCBmb3IgdGhlIHBhdGNoIGFuZCB0aGUKUmV2aWV3
ZWQtYnksIGFwcGx5aW5nLgoKLSBBcm5hbGRvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
