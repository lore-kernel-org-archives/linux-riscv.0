Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B99CE7D24B
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 08:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Loq/h9Qd8RyqwEFD76iJhhwLAMAvo3A+9KxgOk4J50s=; b=P35vUWiihybOAL
	/+BOyqE/6OQUJtIoEPZScPdzwWDzmMJkr1AxhZdO5mBO/03ZljvF3lmu9XmaiV6BNtpBzfWVawCHm
	bHfLJDrSwS7DdW824CCrFrg4yXmdnbelmLBQBJox6ZWwnwZnfa4Oo8HSZbsWp6Acgi0cvTSZn8DWz
	3KWE/XSGLbtsSHbQYKml4H72SoHz8soWUSb/wEyFO1WrDj3AWjoBNN1MPELoz5jn1+gRZcYyTgbbA
	cOaHrQoaxSVxPIClbXTbZEegTR1fHcUJM69RkyTTtVhN6Ths8YmmnzyTZ5nEKRzyS6+qgy3esVLym
	rLGrKEgbeTEiPH0oBUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql34X-00FqLy-0F;
	Tue, 26 Sep 2023 08:05:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql34R-00FqHw-2w;
	Tue, 26 Sep 2023 08:05:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B0B9CE12BF;
	Tue, 26 Sep 2023 08:05:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB07C433C7;
	Tue, 26 Sep 2023 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695715524;
	bh=+Amk36a0CBOiKu5+FtjGQvFX395/lzfG991XVrUkCKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RLx2TLWKtN7VAMAOy6Z+yt+5L2H3WvCxgk6fo3xEAFTVDZv0mPqQm9oryMdet+1qZ
	 obrB5TY2nE/qbUSfaI1uId3y2yRK2qnxEYYQpqf8IMXRqLpaWcyp6r1h8W5YGqDDxg
	 /Ipk9rb4CjRrT7bowSHMduOUAEuaFMTD7nXxu83iUI+O1xmmOj2PJsMoiGARKNDMsM
	 m8lXDTJPRNGVXjXTr34wm+BzlG4p+UzrUM7cd5TVxTprWIBaR+mK3IXevwTFE0yWC2
	 SIHL7mRKLFjL2iR5rLVY4OdrYFjdV9kMecllhx3OCPX+UXN+tAGab3AHw/soEZdxZb
	 tvxNd43ZGN+BA==
Date: Tue, 26 Sep 2023 11:04:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
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
Subject: Re: [PATCH v3 02/13] mm: introduce execmem_text_alloc() and
 execmem_free()
Message-ID: <20230926080422.GP3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-3-rppt@kernel.org>
 <CAPhsuW5-=H1V=VXUYxyGnUdJuNUpRt44QmpwjkDUD=9i0itjuw@mail.gmail.com>
 <20230923153808.GI3303@kernel.org>
 <CAPhsuW6TxG87ZBwQ_027iiE+_UmXweZEPh8wKHkHo7wA+qXZUg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW6TxG87ZBwQ_027iiE+_UmXweZEPh8wKHkHo7wA+qXZUg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_010528_391180_8C75E231 
X-CRM114-Status: GOOD (  26.21  )
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

T24gU2F0LCBTZXAgMjMsIDIwMjMgYXQgMDM6MzY6MDFQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gU2F0LCBTZXAgMjMsIDIwMjMgYXQgODozOeKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMDM6MzQ6
MThQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgU2VwIDE4LCAyMDIzIGF0
IDEyOjMw4oCvQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4g
Pgo+ID4gPgo+ID4gPiBbLi4uXQo+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAv
a2VybmVsL21vZHVsZS5jIGIvYXJjaC9zMzkwL2tlcm5lbC9tb2R1bGUuYwo+ID4gPiA+IGluZGV4
IDQyMjE1Zjk0MDRhZi4uZGI1NTYxZDBjMjMzIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvczM5
MC9rZXJuZWwvbW9kdWxlLmMKPiA+ID4gPiArKysgYi9hcmNoL3MzOTAva2VybmVsL21vZHVsZS5j
Cj4gPiA+ID4gQEAgLTIxLDYgKzIxLDcgQEAKPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZWxvYWRlci5oPgo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvYnVnLmg+Cj4gPiA+ID4gICNpbmNs
dWRlIDxsaW51eC9tZW1vcnkuaD4KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2V4ZWNtZW0uaD4K
PiA+ID4gPiAgI2luY2x1ZGUgPGFzbS9hbHRlcm5hdGl2ZS5oPgo+ID4gPiA+ICAjaW5jbHVkZSA8
YXNtL25vc3BlYy1icmFuY2guaD4KPiA+ID4gPiAgI2luY2x1ZGUgPGFzbS9mYWNpbGl0eS5oPgo+
ID4gPiA+IEBAIC03Niw3ICs3Nyw3IEBAIHZvaWQgKm1vZHVsZV9hbGxvYyh1bnNpZ25lZCBsb25n
IHNpemUpCj4gPiA+ID4gICNpZmRlZiBDT05GSUdfRlVOQ1RJT05fVFJBQ0VSCj4gPiA+ID4gIHZv
aWQgbW9kdWxlX2FyY2hfY2xlYW51cChzdHJ1Y3QgbW9kdWxlICptb2QpCj4gPiA+ID4gIHsKPiA+
ID4gPiAtICAgICAgIG1vZHVsZV9tZW1mcmVlKG1vZC0+YXJjaC50cmFtcG9saW5lc19zdGFydCk7
Cj4gPiA+ID4gKyAgICAgICBleGVjbWVtX2ZyZWUobW9kLT5hcmNoLnRyYW1wb2xpbmVzX3N0YXJ0
KTsKPiA+ID4gPiAgfQo+ID4gPiA+ICAjZW5kaWYKPiA+ID4gPgo+ID4gPiA+IEBAIC01MTAsNyAr
NTExLDcgQEAgc3RhdGljIGludCBtb2R1bGVfYWxsb2NfZnRyYWNlX2hvdHBhdGNoX3RyYW1wb2xp
bmVzKHN0cnVjdCBtb2R1bGUgKm1lLAo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICBzaXplID0gRlRS
QUNFX0hPVFBBVENIX1RSQU1QT0xJTkVTX1NJWkUocy0+c2hfc2l6ZSk7Cj4gPiA+ID4gICAgICAg
ICBudW1wYWdlcyA9IERJVl9ST1VORF9VUChzaXplLCBQQUdFX1NJWkUpOwo+ID4gPiA+IC0gICAg
ICAgc3RhcnQgPSBtb2R1bGVfYWxsb2MobnVtcGFnZXMgKiBQQUdFX1NJWkUpOwo+ID4gPiA+ICsg
ICAgICAgc3RhcnQgPSBleGVjbWVtX3RleHRfYWxsb2MoRVhFQ01FTV9GVFJBQ0UsIG51bXBhZ2Vz
ICogUEFHRV9TSVpFKTsKPiA+ID4KPiA+ID4gVGhpcyBzaG91bGQgYmUgRVhFQ01FTV9NT0RVTEVf
VEVYVD8KPiA+Cj4gPiBUaGlzIGlzIGFuIGZ0cmFjZSB0cmFtcG9saW5lLCBzbyBJIHRoaW5rIGl0
IHNob3VsZCBiZSBGVFJBQ0UgdHlwZSBvZgo+ID4gYWxsb2NhdGlvbi4KPiAKPiBZZWFoLCBJIHdh
cyBhd2FyZSBvZiB0aGUgZnRyYWNlIHRyYW1wb2xpbmUuIE15IHBvaW50IHdhcywgZnRyYWNlIHRy
YW1wb2xpbmUKPiBkb2Vzbid0IHNlZW0gdG8gaGF2ZSBhbnkgc3BlY2lhbCByZXF1aXJlbWVudHMu
IFRoZXJlZm9yZSwgaXQgaXMgcHJvYmFibHkgbm90Cj4gbmVjZXNzYXJ5IHRvIGhhdmUgYSBzZXBh
cmF0ZSB0eXBlIGp1c3QgZm9yIGl0LgoKU2luY2UgZnRyYWNlIHRyYW1wb2xpbmVzIGFyZSBjdXJy
ZW50bHkgdXNlZCBvbmx5IG9uIHMzOTAgYW5kIHg4NiB3aGljaAplbmZvcmNlIHRoZSBzYW1lIHJh
bmdlIGZvciBhbGwgZXhlY3V0YWJsZSBhbGxvY2F0aW9ucyB0aGVyZSBhcmUgbm8gc3BlY2lhbApy
ZXF1aXJlbWVudHMgaW5kZWVkLiBCdXQgSSB0aGluayB0aGF0IGV4cGxpY2l0bHkgbWFya2luZyB0
aGVzZSBhbGxvY2F0aW9ucwphcyBGVFJBQ0UgbWFrZXMgaXQgY2xlYXJlciB3aGF0IGFyZSB0aGV5
IHVzZWQgZm9yIGFuZCBJIGRvbid0IHNlZSBkb3duc2lkZXMKdG8gaGF2aW5nIGEgdHlwZSBmb3Ig
RlRSQUNFLgogCj4gQUZBSUNULCBrcHJvYmUsIGZ0cmFjZSwgYW5kIEJQRiAoSklUIGFuZCB0cmFt
cG9saW5lKSBjYW4gc2hhcmUgdGhlIHNhbWUKPiBleGVjbWVtX3R5cGUuIFdlIG1heSBuZWVkIHNv
bWUgd29yayBmb3Igc29tZSBhcmNocywgYnV0IG5vdGhpbmcgaXMKPiBmdW5kYW1lbnRhbGx5IGRp
ZmZlcmVudCBhbW9uZyB0aGVzZS4KClVzaW5nIHRoZSBzYW1lIHR5cGUgZm9yIGFsbCBnZW5lcmF0
ZWQgY29kZSBpbXBsaWVzIHRoYXQgYWxsIHR5cGVzIG9mIHRoZQpnZW5lcmF0ZWQgY29kZSBtdXN0
IGxpdmUgaW4gdGhlIHNhbWUgcmFuZ2UgYW5kIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0bwppbXBv
c2UgdGhpcyBsaW1pdGF0aW9uIG9uIGFyY2hpdGVjdHVyZXMuCgpGb3IgZXhhbXBsZSwgUklTQy1W
IGRlbGliZXJhdGVseSBhZGRlZCBhIHJhbmdlIGZvciBCUEYgY29kZSB0byBhbGxvdwpyZWxhdGl2
ZSBhZGRyZXNzaW5nLCBzZWUgY29tbWl0IDdmMzYzMWU4OGVlNiAoInJpc2N2LCBicGY6IFByb3Zp
ZGUgUklTQy1WCnNwZWNpZmljIEpJVCBpbWFnZSBhbGxvYy9mcmVlIikuCiAKPiBUaGFua3MsCj4g
U29uZwoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
