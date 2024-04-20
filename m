Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A99C04FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Apr 2024 04:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YiZttxwnMKS5V5YQ8Ob7Igp+dSbtRtAPvSeUzKpyTkU=; b=ptcuWBOWsESABZ
	2xWe6DNjyVoum33Z+6tNGZi44orjXSVI4EnR5Rh8wVJHB4JPI2vhKsYQH99PHZd36/uNAhIpMH5CE
	yVQsijva9FkbsHLQ2KhZSerulekPx3Pjk92yzO2fjWfg9Seot6HOOSGEsry3+xQvFBLAxM15Au5v8
	CI3ZD5B6IcMin92vtMAw8x6kaF++aWqu7yIiACNTE//9NwIhwnU1tS+YUgWTVTfNZsVyPjLrUS2aX
	hzxZ2FEGxSjPDDnkYs7bD7/hFYwqqQb3ZTyMPoqn28LcyL7cu41WYYDjQThbVLHAiZpOzCMJ/kwIN
	b9Z4p4VvUnI+poa0B+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry2Gx-00000007lvt-0GhH;
	Sat, 20 Apr 2024 04:24:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry2Gs-00000007lu6-40XH;
	Sat, 20 Apr 2024 04:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D0AA60C70;
	Sat, 20 Apr 2024 04:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83904C072AA;
	Sat, 20 Apr 2024 04:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713587052;
	bh=XIe/vC5nJoDDEu9/Q7ZoXeJlkdIzu3x0dG0pVHSQyaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhvasTWvPZXPkThPYjnuTXJtKsDsFI6ZK4Bt9IvngW4VcopIHwZq0rN2TN47VCWUq
	 FBJkDpR2DtP+unWDJY8C7sJEQiAOVs8L9KzXsojOjPLi6kQ9YDHioYtZ6nUFM1e0iU
	 J5CLWhI8Oh/UQKju6kDG7HnVFfwfwBxuIE1OR267WnG9gRFiBTNZwpWVx17pWQtTrY
	 fdbuHV6o8S3vVJ6wqWsJuIqtAsaxpsI2nzHYz53bqy1qeEbZ3ljz7qw9wo3USiXNjB
	 OSy86A07SSbIPPzvVI3U5+/bWUkfoO6zoETP+0NHBuzBlMRXY9HoUBu5v7wjVTOH+s
	 DowdwAPfYuE4g==
Date: Sat, 20 Apr 2024 07:22:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Topel <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <ZiNDGjkcqEPqruza@kernel.org>
References: <ZiE91CJcNw7gBj9g@kernel.org>
 <CAPhsuW4au6v8k8Ab7Ff6Yj64rGvZ7wkz=Xrgh8ZZtLyscpChqQ@mail.gmail.com>
 <ZiFd567L4Zzm2okO@kernel.org>
 <CAPhsuW5SL4_=ZXdHZV8o0KS+5Vf25UMvEKhRgFQLioFtf2pgoQ@mail.gmail.com>
 <ZiIVVBgaDN4RsroT@kernel.org>
 <CAPhsuW7WoU+a46FhqqH8f-3=ehxeD4wSgKDWegMin1pT49OSWw@mail.gmail.com>
 <ZiKjmaDgz_56ovbv@kernel.org>
 <CAPhsuW7Nj1Sa_9xQtTgHz9AmX39zdh2x2COqA-qmkfpfX9hNWw@mail.gmail.com>
 <ZiLNGgVSQ7_cg58y@kernel.org>
 <CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPhsuW4KRM4O4RFbYQrt=Coqyh9w29WiF2YF=8soDfauLFsKBA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_212415_114454_E2C54898 
X-CRM114-Status: GOOD (  26.44  )
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

T24gRnJpLCBBcHIgMTksIDIwMjQgYXQgMDI6NDI6MTZQTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6
Cj4gT24gRnJpLCBBcHIgMTksIDIwMjQgYXQgMTowMOKAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBBcHIgMTksIDIwMjQgYXQgMTA6MzI6
MzlBTSAtMDcwMCwgU29uZyBMaXUgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgQXByIDE5LCAyMDI0IGF0
IDEwOjAz4oCvQU0gTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4g
Wy4uLl0KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI0MDQxMTE2MDUyNi4yMDkzNDA4LTEtcnBwdEBrZXJuZWwub3JnCj4gPiA+ID4gPgo+
ID4gPiA+ID4gRm9yIHRoZSBST1ggdG8gd29yaywgd2UgbmVlZCBkaWZmZXJlbnQgdXNlcnMgKG1v
ZHVsZSB0ZXh0LCBrcHJvYmUsIGV0Yy4pIHRvIGhhdmUKPiA+ID4gPiA+IHRoZSBzYW1lIGV4ZWNt
ZW1fcmFuZ2UuIEZyb20gWzFdOgo+ID4gPiA+ID4KPiA+ID4gPiA+IHN0YXRpYyB2b2lkICpleGVj
bWVtX2NhY2hlX2FsbG9jKHN0cnVjdCBleGVjbWVtX3JhbmdlICpyYW5nZSwgc2l6ZV90IHNpemUp
Cj4gPiA+ID4gPiB7Cj4gPiA+ID4gPiAuLi4KPiA+ID4gPiA+ICAgICAgICBwID0gX19leGVjbWVt
X2NhY2hlX2FsbG9jKHNpemUpOwo+ID4gPiA+ID4gICAgICAgIGlmIChwKQo+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgcmV0dXJuIHA7Cj4gPiA+ID4gPiAgICAgICBlcnIgPSBleGVjbWVtX2NhY2hl
X3BvcHVsYXRlKHJhbmdlLCBzaXplKTsKPiA+ID4gPiA+IC4uLgo+ID4gPiA+ID4gfQo+ID4gPiA+
ID4KPiA+ID4gPiA+IFdlIGFyZSBjYWxsaW5nIF9fZXhlY21lbV9jYWNoZV9hbGxvYygpIHdpdGhv
dXQgcmFuZ2UuIEZvciB0aGlzIHRvIHdvcmssCj4gPiA+ID4gPiB3ZSBjYW4gb25seSBjYWxsIGV4
ZWNtZW1fY2FjaGVfYWxsb2MoKSB3aXRoIG9uZSBleGVjbWVtX3JhbmdlLgo+ID4gPiA+Cj4gPiA+
ID4gQWN0dWFsbHksIG9uIHg4NiB0aGlzIHdpbGwgImp1c3Qgd29yayIgYmVjYXVzZSBldmVyeXRo
aW5nIHNoYXJlcyB0aGUgc2FtZQo+ID4gPiA+IGFkZHJlc3Mgc3BhY2UgOikKPiA+ID4gPgo+ID4g
PiA+IFRoZSAyTSBwYWdlcyBpbiB0aGUgY2FjaGUgd2lsbCBiZSBpbiB0aGUgbW9kdWxlcyBzcGFj
ZSwgc28KPiA+ID4gPiBfX2V4ZWNtZW1fY2FjaGVfYWxsb2MoKSB3aWxsIGFsd2F5cyByZXR1cm4g
bWVtb3J5IGZyb20gdGhhdCBhZGRyZXNzIHNwYWNlLgo+ID4gPiA+Cj4gPiA+ID4gRm9yIG90aGVy
IGFyY2hpdGVjdHVyZXMgdGhpcyBpbmRlZWQgbmVlZHMgdG8gYmUgZml4ZWQgd2l0aCBwYXNzaW5n
IHRoZQo+ID4gPiA+IHJhbmdlIHRvIF9fZXhlY21lbV9jYWNoZV9hbGxvYygpIGFuZCBsaW1pdGlu
ZyBzZWFyY2ggaW4gdGhlIGNhY2hlIGZvciB0aGF0Cj4gPiA+ID4gcmFuZ2UuCj4gPiA+Cj4gPiA+
IEkgdGhpbmsgd2UgYXQgbGVhc3QgbmVlZCB0aGUgIm1hcCB0byIgY29uY2VwdCAoaW5pdGlhbGx5
IHByb3Bvc2VkIGJ5IFRob21hcykKPiA+ID4gdG8gZ2V0IHRoaXMgd29yay4gRm9yIGV4YW1wbGUs
IEVYRUNNRU1fQlBGIGFuZCBFWEVDTUVNX0tQUk9CRQo+ID4gPiBtYXBzIHRvIEVYRUNNRU1fTU9E
VUxFX1RFWFQsIHNvIHRoYXQgYWxsIHRoZXNlIGFjdHVhbGx5IHNoYXJlCj4gPiA+IHRoZSBzYW1l
IHJhbmdlLgo+ID4KPiA+IFdoeT8KPiAKPiBJSVVDLCB3ZSBuZWVkIHRvIHVwZGF0ZSBfX2V4ZWNt
ZW1fY2FjaGVfYWxsb2MoKSB0byB0YWtlIGEgcmFuZ2UgcG9pbnRlciBhcwo+IGlucHV0LiBtb2R1
bGUgdGV4dCB3aWxsIHVzZSAicmFuZ2UiIGZvciBFWEVDTUVNX01PRFVMRV9URVhULCB3aGlsZSBr
cHJvYmUKPiB3aWxsIHVzZSAicmFuZ2UiIGZvciBFWEVDTUVNX0tQUk9CRS4gV2l0aG91dCAibWFw
IHRvIiBjb25jZXB0IG9yIHNoYXJpbmcKPiB0aGUgInJhbmdlIiBvYmplY3QsIHdlIHdpbGwgaGF2
ZSB0byBjb21wYXJlIGRpZmZlcmVudCByYW5nZSBwYXJhbWV0ZXJzIHRvIGNoZWNrCj4gd2UgY2Fu
IHNoYXJlIGNhY2hlZCBwYWdlcyBiZXR3ZWVuIG1vZHVsZSB0ZXh0IGFuZCBrcHJvYmUsIHdoaWNo
IGlzIG5vdAo+IGVmZmljaWVudC4gRGlkIEkgbWlzcyBzb21ldGhpbmc/CgpXZSBjYW4gYWx3YXlz
IHNoYXJlIGxhcmdlIFJPWCBwYWdlcyBhcyBsb25nIGFzIHRoZXkgYXJlIHdpdGhpbiB0aGUgY29y
cmVjdAphZGRyZXNzIHNwYWNlLiBUaGUgcGVybWlzc2lvbnMgZm9yIHRoZW0gYXJlIFJPWCBhbmQg
dGhlIGFsaWdubWVudApkaWZmZXJlbmNlcyBhcmUgZHVlIHRvIEtBU0FOIGFuZCB0aGlzIGlzIGhh
bmRsZWQgZHVyaW5nIGFsbG9jYXRpb24gb2YgdGhlCmxhcmdlIHBhZ2UgdG8gcmVmaWxsIHRoZSBj
YWNoZS4gX19leGVjbWVtX2NhY2hlX2FsbG9jKCkgb25seSBuZWVkcyB0byBsaW1pdAp0aGUgc2Vh
cmNoIGZvciB0aGUgYWRkcmVzcyBzcGFjZSBvZiB0aGUgcmFuZ2UuCgpBbmQgcmVnYXJkbGVzcywg
dGhleSB3YXkgd2UgZGVhbCB3aXRoIHNoYXJpbmcgb2YgdGhlIGNhY2hlIGNhbiBiZSBzb3J0ZWQK
b3V0IGxhdGVyLgoKPiBUaGFua3MsCj4gU29uZwoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
