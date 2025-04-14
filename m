Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871CCC369B6
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLXMDMcjRbTW3q3but3btljMYb9h0YNal/IbSRiTho4=; b=esHApmYzamoTtp
	Y75hU7Qly7E9sc4Fc7xjIWFBe+2VG5MnmNfqkIXibFDdMICb9RsuxyfFGLk/+c62lIi9GXnvxMPnY
	0VcgUg1xoXw9QCzyFc8JQnUXz/OHG6mPclSud8F179eELZiO2VI6s5W9CuGT1zT4RLPvChqMy//eC
	tw58HepUhAs0wBmSYKmiP87eLXh9Ti2NFvjyhnGm1CPIxIHJl0dYatfHFgL9PqdzpTmqAT/EWzdyB
	+i5lnp4O43QW4otEQ68TysW/xHjgdDR8Baz8Q/rsH2vbwqjcNCLFs+PngV/vLBUyT3Qnri+hOM8/u
	4tg/vUTBjbr6V4KvzMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FMv-000000018hi-0OXl;
	Mon, 14 Apr 2025 08:40:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FMs-000000018gU-3UH8;
	Mon, 14 Apr 2025 08:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AECBA61141;
	Mon, 14 Apr 2025 08:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35A6C4CEE2;
	Mon, 14 Apr 2025 08:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744620037;
	bh=1WLjhU62qts6OOD8ye1YCi8KydIv3r4YnaWoDD7MFoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UvdiZUAmShJiXgi2JdweGIv+56B6MrRRZG6A7OFE2EfFOz2VNDI2oIeIU7RQaj5El
	 4aA9h2FAcy13IpILJO5xVz84RKLEHpRXTTv73t4VsmG8sHAa4MBBfwEUa8w5BZoms4
	 td7t3HWHPJbq00dUVI5Sg7hxtJO4ukSzXov1p0FVKkLTm9xgRi9URTpIBTv1Anf3wn
	 YCfH5erg23joCti8uVBsTPMgSk4oO6IcIJ/93QnZfSWd25vJCY5pA7rrYSJI3BGPc0
	 97+DGFJEHNtwY+ScWCw11OJaqbgfPAIIN7neb+8GtU8Haz30Wt1dij2uZtMB2c9cVf
	 OteBHGjqj4iIw==
Date: Mon, 14 Apr 2025 09:40:33 +0100
From: Simon Horman <horms@kernel.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Li Zhengyu <lizhengyu3@huawei.com>, kexec@lists.infradead.org,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Dave Young <dyoung@redhat.com>, Yixun Lan <yixun.lan@gmail.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/4] kexec-tools RISC-V port
Message-ID: <20250414084033.GA1480036@horms.kernel.org>
References: <20250409201428.648717-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409201428.648717-1-bjorn@kernel.org>
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

T24gV2VkLCBBcHIgMDksIDIwMjUgYXQgMTA6MTQ6MjJQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gCj4gSGkh
Cj4gCj4gVGhpcyBpcyBhbiBhdHRlbXB0IHRvIGZpbmFsbHkgZ2V0IHRoZSBSSVNDLVYgcGF0Y2hl
cyBmb3Iga2V4ZWMtdG9vbHMKPiB1cHN0cmVhbS4KPiAKPiBTaW1vbiBzdWdnZXN0ZWQgaW4gWzFd
IHRoYXQ6Cj4gCj4gPiBJbiBteSBtaW5kIHRoZSBiaWcgcXVlc3Rpb24gaXMgaG93IHRvIG1vdmUg
UklTQy1WIHN1cHBvcnQgZnJvbSB0aGF0Cj4gPiBicmFuY2gsIHRvIGJlaW5nIG1lcmdlZCBpbnRv
IG1haW4uCj4gPgo+ID4gSUlSQyB0aGVyZSB3ZXJlIHNvbWUgaXNzdWVzIHRoYXQgbmVlZGVkIHRv
IGJlIGFkZHJlc3NlZC4gUGVyaGFwcyB0aGV5Cj4gPiBhcmUgYWxsIGFkZHJlc3NlZCBieSB0aGlz
IHNlcmllcywgYW5kIHdpdGggc29tZSBhcHByb3ByaWF0ZSBzcXVhc2hpbmcKPiA+IHdlIGNhbiBt
b3ZlIGZvcndhcmRzIHdpdGggYSBzZXJpZXMgYmFzZWQgb24gbWFpbj8KPiAKPiBJIHRhbGtlZCB0
byBOaWNrIGxhc3Qgd2VlaywgYW5kIGhlIHN1Z2dlc3RlZCB0aGF0IHdlJ2Qgd29yayB0aGUgUklT
Qy1WCj4gY29sbGFiIEdpdGh1YiBbMl0sIGJ1dCBJIHRoaW5rIGl0J3MganVzdCBlYXNpZXIgdG8g
ZG8gaXQgb24gdGhlIGxpc3QuCj4gCj4gSSd2ZSBiZWVuIGNvbGxlY3RpbmcgYSBudW1iZXIgb2Yg
ZGlmZmVyZW50IHRyZWVzIG91dCB0aGVyZSwgYW5kIHRyaWVkCj4gdG8gZ3JvdXAgdGhlbSBpbiBh
IHNlcmllcy4KPiAKPiBHaXZlbiB0aGF0IHRoZXJlIGlzIG5vdCBzdXBwb3J0IGZvciBSSVNDLVYg
dXBzdHJlYW0geWV0LCBJIGRpZG4ndCBzZWUKPiB0aGUgbmVlZCB0byBjYXJyeSBhbGwgdGhlIGZp
eGVzL3VwZGF0ZXMgKCJkZXZlbG9wbWVudCBoaXN0b3J5IikgYXMKPiBzZXBhcmF0ZSBjb21taXRz
IC0tIGl0IGRvZXNuJ3QgaGVscCBidWd0cmFja2luZy9iaXNlY3RhYmlsaXR5LgoKVGhhbmtzIEJq
w7ZybiwKCkkgaGF2ZW4ndCBsb29rZWQgb3ZlciB0aGUgcGF0Y2hlcyB5ZXQuCkJ1dCBpbiBwcmlu
Y2lwbGUgSSBhZ3JlZSB3aXRoIHRoaXMgYXBwcm9hY2guCgo+IAo+IEluc3RlYWQgdGhlIGZpcnN0
IGNvbW1pdCBtZXNzYWdlIGlzIGEgYmlnIG9uZSwgYW5kIHRyaWVzIHRvIGdpdmUKPiBhdHRyaWJ1
dGlvbiB0byBhbGwgaW52b2x2ZWQgcGFydGllcy4gSW5wdXQvdGhvdWdodHMgYXJlIHZlcnkgbXVj
aAo+IHdlbGNvbWUhCj4gCj4gVG8gcHJvcGVybHkgdGVzdCB0aGlzIG9uIFJJU0MtViwgdGhlIHVw
c3RyZWFtIExpbnV4IGtlcm5lbCBoYXMgbW9zdAo+IHRoaW5ncyBpbiA2LjE1LXJjMSwgZS5nLjoK
PiBjb21taXQgMjgwOTNjZmVmNWRkICgicmlzY3Yva2V4ZWNfZmlsZTogSGFuZGxlIFJfUklTQ1Zf
NjQgaW4gcHVyZ2F0b3J5IHJlbG9jYXRvciIpCj4gY29tbWl0IDNmNzAyMzE3MWRmNCAoInJpc2N2
L3B1cmdhdG9yeTogNEIgYWxpZ24gcHVyZ2F0b3J5X3N0YXJ0IikKPiAKPiBUbyBjcm9zcy1idWls
ZCBrZXhlYy10b29sczoKPiAgIHwgLi9ib290c3RyYXAgCj4gICB8IC4vY29uZmlndXJlIC0taG9z
dD1yaXNjdjY0LWxpbnV4LWdudQo+ICAgfCBtYWtlCj4gCj4gRm9yIHNvbWUgdGVzdHMsIGFkZGl0
aW9uYWwga2VybmVsIHBhdGNoZXMgYXJlIG5lZWRlZCwgdGhhdCBhcyBvZiB0b2RheQo+IGlzIG5v
dCBpbiA2LjE1LXJjMToKPiAgKiBUbyB0ZXN0ICJrZXhlYyAtcyAtbCBJbWFnZSIsIGtleGVjX2Zp
bGVfbG9hZCB3aXRoIEltYWdlIHN1cHBvcnQgaXMKPiAgICBuZWVkZWQgWzNdCj4gICogVG8gdGVz
dCAia2V4ZWMgLWMgLWwgdm1saW51eCIgd2l0aCBDT05GSUdfUkVMT0NBVEFCTEUsIGEga2J1aWxk
IGZpeAo+ICAgIGlzIG5lZWRlZCBbNF0KPiAgKiBUeXBpY2FsbHkgaWYgeW91IGxvYWQgaW5pdHJk
LCBvciBhIGxhcmdlIGtlcm5lbCBbNV0gKHNpbmNlIGEgYnVuY2gKPiAgICBvZiBSZXNlcnZlZCBy
ZWdpb25zIGFyZSBub3QgcHJvcGVybHkgZXhwb3NlZCkuCj4gCj4gSSd2ZSB0ZXN0ZWQgY29tYmlu
YXRpb25zIHdpdGggY3Jhc2hrZXJuZWwgKC1wKSwgYW5kIHJlZ3VsYXIgKC1jLy1zICsgLWUpIGZv
cjoKPiAgKiBBQ1BJL1VFRkkKPiAgKiBEVC9VRUZJCj4gICogRFQKPiAgKiB3LyBpbml0cmQKPiAg
KiB3L28gaW5pdHJkCj4gICogRUxGICh1c2VybGFuZCBsb2FkZXIgKyBrZXhlY19sb2FkLCBhbmQg
a2V4ZWNfZmlsZV9sb2FkKQo+ICAqIEltYWdlICh1c2VybGFuZCBsb2FkZXIgKyBrZXhlY19sb2Fk
LCBhbmQga2V4ZWNfZmlsZV9sb2FkKQo+IAo+IEknbSBzdXJlIHRoZXJlIGFyZSBjb21iaW5hdGlv
bnMgSSd2ZSBtaXNzZWQsIGJ1dCBhdCBsZWFzdCBmcm9tIG15IFBPVgo+IHdlJ3JlIGluIGEgcHJl
dHR5IGdvb2Qgc2hhcGUuCj4gCj4gQWxsIGF1dGhvcnM6IFBsZWFzZSBsZXQgbWUga25vdyBpZiB5
b3UgcHJlZmVyIGFub3RoZXIgc3BsaXQgb2YgdGhlCj4gcGF0Y2hlcy4gT3Igc29tZXRoaW5nIGVs
c2UgZm9yIHRoYXQgbWF0dGVyISA7LSkKPiAKPiAKPiBMZXQncyBnZXQgdGhlIGJhbGwgcm9sbGlu
ZyEKPiBCasO2cm4KCi4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
