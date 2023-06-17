Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03C4EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 06:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deY5HMn6M2GDfCQ5PONHzHFpsUxdrtjH6CJS9fDS/FY=; b=h/5nWCMTXfJcMr
	G+eqMfHD5eD86nPpU28SH/P3BAfAHR85fLc1zx5yBAs3kszX0tXUnh22+YOrjnONJGRu/f8UtqsSW
	eyeoMttGvm2IpoU8l0wKRIvWb/oZcNwMpA3DJvT8k4KUPJomQsqApNxvuNKBqWtfWygrLyilHMNON
	yEYntt7aS+EUpoYJHiOw1GYEraayMbD34eSegqDMn5jfUtX2oNS++QUprkkVylVL6aefIClXFhrjy
	LlyUmtNv5h1JDlk61JTWobLf0dwBMbq0bpu6+AMUer299JyPmK64ceSxUSMxy6buBcCibBiD5koyJ
	aU27D1EoXC6L1KVTzWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPtd-002wp4-0h;
	Sat, 17 Jun 2023 06:58:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAPtZ-002wml-1y;
	Sat, 17 Jun 2023 06:58:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E11B6068F;
	Sat, 17 Jun 2023 06:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9588BC433C0;
	Sat, 17 Jun 2023 06:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686985126;
	bh=9S4P8JW7Aw6+2ZoVDniU5EdIBLc9OdiTvqw3YA9ECf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nHkTyW+hctadrgmIg2I6LaptKR6YKkmtmdcOS/HSni9feQ5p1DZtCSX6Dnam1slU3
	 FLDQnf/OEx1d4jSPxMmAwLEhSg3dDkigyXgxGzkX1VJc1UJnkk6n01fCEZ0qwx4ELP
	 r6wbjQNoXnPg5HveUgv1zS7owOZuF5kej34YgRIGZdC2tH3sGX0H+MpQa784HSW6mk
	 qjN9Au7ZhvMEPLupJ+gAv5/GudEwZVVlLyNGJFO9CDGv8qdQ0I+Zmw8CDlXcjxb8w/
	 RZuOMQ5h8Q4Z/8VeTux+zm8PEK9dnLGg98fBUnC+4CbpTq0gKeC8d5BMUXJufl+4IU
	 tPAEuFrGSOYnA==
Date: Sat, 17 Jun 2023 09:57:59 +0300
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
Subject: Re: [PATCH v2 07/12] arm64, execmem: extend execmem_params for
 generated code definitions
Message-ID: <20230617065759.GT52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-8-rppt@kernel.org>
 <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_235849_758235_68EB9D2E 
X-CRM114-Status: GOOD (  25.27  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMDE6MDU6MjlQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTo1MuKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogIk1pa2UgUmFwb3BvcnQgKElCTSkiIDxy
cHB0QGtlcm5lbC5vcmc+Cj4gPgo+ID4gVGhlIG1lbW9yeSBhbGxvY2F0aW9ucyBmb3Iga3Byb2Jl
cyBvbiBhcm02NCBjYW4gYmUgcGxhY2VkIGFueXdoZXJlIGluCj4gPiB2bWFsbG9jIGFkZHJlc3Mg
c3BhY2UgYW5kIGN1cnJlbnRseSB0aGlzIGlzIGltcGxlbWVudGVkIHdpdGggYW4gb3ZlcnJpZGUK
PiA+IG9mIGFsbG9jX2luc25fcGFnZSgpIGluIGFybTY0Lgo+ID4KPiA+IEV4dGVuZCBleGVjbWVt
X3BhcmFtcyB3aXRoIGEgcmFuZ2UgZm9yIGdlbmVyYXRlZCBjb2RlIGFsbG9jYXRpb25zIGFuZAo+
ID4gbWFrZSBrcHJvYmVzIG9uIGFybTY0IHVzZSB0aGlzIGV4dGVuc2lvbiByYXRoZXIgdGhhbiBv
dmVycmlkZQo+ID4gYWxsb2NfaW5zbl9wYWdlKCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWlr
ZSBSYXBvcG9ydCAoSUJNKSA8cnBwdEBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9hcm02
NC9rZXJuZWwvbW9kdWxlLmMgICAgICAgICB8ICA5ICsrKysrKysrKwo+ID4gIGFyY2gvYXJtNjQv
a2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgfCAgNyAtLS0tLS0tCj4gPiAgaW5jbHVkZS9saW51eC9l
eGVjbWVtLmggICAgICAgICAgICB8IDExICsrKysrKysrKysrCj4gPiAgbW0vZXhlY21lbS5jICAg
ICAgICAgICAgICAgICAgICAgICB8IDE0ICsrKysrKysrKysrKystCj4gPiAgNCBmaWxlcyBjaGFu
Z2VkLCAzMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2tlcm5lbC9tb2R1bGUuYyBiL2FyY2gvYXJtNjQva2VybmVsL21vZHVsZS5j
Cj4gPiBpbmRleCBjM2Q5OTlmM2EzZGQuLjUyYjA5NjI2YmMwZiAxMDA2NDQKPiA+IC0tLSBhL2Fy
Y2gvYXJtNjQva2VybmVsL21vZHVsZS5jCj4gPiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC9tb2R1
bGUuYwo+ID4gQEAgLTMwLDYgKzMwLDEzIEBAIHN0YXRpYyBzdHJ1Y3QgZXhlY21lbV9wYXJhbXMg
ZXhlY21lbV9wYXJhbXMgPSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAuYWxpZ25tZW50
ID0gTU9EVUxFX0FMSUdOLAo+ID4gICAgICAgICAgICAgICAgIH0sCj4gPiAgICAgICAgIH0sCj4g
PiArICAgICAgIC5qaXQgPSB7Cj4gPiArICAgICAgICAgICAgICAgLnRleHQgPSB7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAuc3RhcnQgPSBWTUFMTE9DX1NUQVJULAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgLmVuZCA9IFZNQUxMT0NfRU5ELAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgLmFsaWdubWVudCA9IDEsCj4gPiArICAgICAgICAgICAgICAgfSwKPiA+ICsgICAgICAg
fSwKPiA+ICB9Owo+IAo+IFRoaXMgaXMgZ3Jvd2luZyBmYXN0LiA6KSBXZSBoYXZlIDMgbm93OiB0
ZXh0LCBkYXRhLCBqaXQuIEFuZCBpdCB3aWxsIGJlCj4gNSB3aGVuIHdlIHNwbGl0IGRhdGEgaW50
byBydyBkYXRhLCBybyBkYXRhLCBybyBhZnRlciBpbml0IGRhdGEuIEkgd29uZGVyCj4gd2hldGhl
ciB3ZSBzaG91bGQgc3RpbGwgZG8gc29tZSB0eXBlIGVudW0gaGVyZS4gQnV0IHdlIGNhbiByZXZp
c2l0Cj4gdGhpcyB0b3BpYyBsYXRlci4KCkkgZG9uJ3QgdGhpbmsgd2UnZCBuZWVkIDUuIEZvdXIg
YXQgbW9zdCA6KQoKSSBkb24ndCBrbm93IHlldCB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IHdheSB0
byBkaWZmZXJlbnRpYXRlIFJXIGFuZCBSTwpkYXRhLCBidXQgcm9fYWZ0ZXJfaW5pdCBzdXJlbHkg
d29uJ3QgbmVlZCBhIG5ldyB0eXBlLiBJdCBlaXRoZXIgd2lsbCBiZQphbGxvY2F0ZWQgYXMgUlcg
YW5kIHRoZW4gdGhlIGNhbGxlciB3aWxsIGhhdmUgdG8gc2V0IGl0IFJPIGFmdGVyCmluaXRpYWxp
emF0aW9uIGlzIGRvbmUsIG9yIGl0IHdpbGwgYmUgYWxsb2NhdGVkIGFzIFJPIGFuZCB0aGUgY2Fs
bGVyIHdpbGwKaGF2ZSB0byBkbyBzb21ldGhpbmcgbGlrZSB0ZXh0X3Bva2UgdG8gdXBkYXRlIGl0
LgogCj4gT3RoZXIgdGhhbiB0aGF0Cj4gCj4gQWNrZWQtYnk6IFNvbmcgTGl1IDxzb25nQGtlcm5l
bC5vcmc+CgotLSAKU2luY2VyZWx5IHlvdXJzLApNaWtlLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
