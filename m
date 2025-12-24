Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C173E776C1
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Dec 2025 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JWzd1saPYw4nrV77V6PWNYC4M3hM0Cl5u/OtnmSWnXQ=; b=kicKoNmapsVadS1Pj6677zXYeu
	vKY/IKtdg+PE+9NrZbMsY6tqHLB1dY68QZvg+65zpUJXVn+8x/KvOZXqZUJYe/v3N3VfL0/m5YiTx
	8zetekqxCYHT1B1rhce0xwmUTiONcHaA/zFrgT9QehVCgQ27V8v+kt69ypiW+Jcn8/uYhrn90gjPY
	f1tgr1W16YHgcemiDPxqqXMmvs+fHCw3xD4MjQiU+NPVNPn3DGYP6cy7eKH1Ssb4+eEKl49Vqf6Fp
	H/d6NE0TTziFSx0xfzC5Ct8PUhXK4H4al7tNOTt2mSWeljDUNvSAghRoKoIu71wTucOHwfufoHjwr
	MRltyppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRZF-0000000HDyh-0paP;
	Wed, 24 Dec 2025 16:18:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRZB-0000000HDx7-3vF7;
	Wed, 24 Dec 2025 16:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:Content-Type:
	Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=GhK7AdFtNADtztNLLZDF/NeiUiQNdwxsGIWV03jNe1Q=; b=gLO5rfF1Tqq1r88i6fjLWC6aJI
	kZzLRehXs7FTVCRxSwSCEywugGwxzw/HOhaIUDs0DE0JOuXGBkVzC64vqpjBCacAe0Jzo71hbiXB+
	pR526zCS0rcBE73I0S151Dh3Skq2PotQJUgME+bi8mzTnvvDW7MssJScbT4YQ9dlZ9z1YcdF09YC+
	xAUG1hiaVpXyixm9+boPZy739Su+1tYwo8pJZwGXq0NEcE/n/zwdPTi5mWTv3hBDCF1WR7ZT4MsCA
	U2UYGCtwVy3+ksN2lgeQLDeJdonKRpJOBZU4wsDmu+dKdMKiZ1BFxSeZIREqkg0047UjbFjxmuNrn
	H2p/7Jwg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYQge-000000001e6-0A9n;
	Wed, 24 Dec 2025 15:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B121644289;
	Wed, 24 Dec 2025 16:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61406C4CEFB;
	Wed, 24 Dec 2025 16:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766593098;
	bh=iMXkABTtT2jUhTkS7ZjEcPSXT6V0xsOrCKrSf5gKHPw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=D05z/P4QjZ7p4TL5L15ojXlcWgzhV1Gi/+Eo7Ufub27W7j34IDH06EmosV417zLWj
	 1ezFaVtg/V4eCjwHulpzhOV0evhWSpGqsd/myV66ya5pHJgkNpIMtGQKHqRXugnkF7
	 iBnC9GZFZXIEwg/+CkBMTiZPiIYGlGwe+cYiRd7s5Gww+0pX5FxfpvNube1wLW4kmD
	 0lbjjE3Hpgxv6aflGPeOsMlVMrFPy+f9X1EFGsXJJJ9/Dmw5hVXteYEdgoNSapPt7o
	 CEEf7DKnDFuhiye+PcbPoDELep/hpMRqxSbSYHPgB5ib7OLYrTUYtKo+20WC3FoioJ
	 tHIirx3VMMmcg==
Date: Wed, 24 Dec 2025 10:18:17 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: will@kernel.org, linux-kernel@vger.kernel.org, bagasdotme@gmail.com, 
 maddy@linux.ibm.com, krzk+dt@kernel.org, alex@ghiti.fr, conor+dt@kernel.org, 
 haren@linux.ibm.com, dan.j.williams@intel.com, jose@osyx.tech, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, 
 linux-arm-kernel@lists.infradead.org, nathan@kernel.org, pjw@kernel.org, 
 linux-riscv@lists.infradead.org, catalin.marinas@arm.com, heiko@sntech.de, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, dev@kael-k.io, 
 linux@armlinux.org.uk, neil.armstrong@linaro.org, kever.yang@rock-chips.com, 
 corbet@lwn.net, ajd@linux.ibm.com, aou@eecs.berkeley.edu, 
 davidmcerdeira@osyx.tech, palmer@dabbelt.com, mani@kernel.org, 
 linux-doc@vger.kernel.org
To: joaopeixoto@osyx.tech
In-Reply-To: <20251224135217.25350-2-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-2-joaopeixoto@osyx.tech>
Message-Id: <176659309602.2305345.1814998732546100865.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: Add Bao IPC shared memory driver
 binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_152204_554451_9D7B43A8 
X-CRM114-Status: GOOD (  15.28  )
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

Ck9uIFdlZCwgMjQgRGVjIDIwMjUgMTM6NTI6MTMgKzAwMDAsIGpvYW9wZWl4b3RvQG9zeXgudGVj
aCB3cm90ZToKPiBGcm9tOiBKb8OjbyBQZWl4b3RvIDxqb2FvcGVpeG90b0Bvc3l4LnRlY2g+Cj4g
Cj4gVGhpcyBwYXRjaCBhZGRzIGEgRGV2aWNlIFRyZWUgYmluZGluZyBmb3IgdGhlIEJhbyBJUEMg
c2hhcmVkIG1lbW9yeQo+IGRldmljZSwgd2hpY2ggcHJvdmlkZXMgYSBzdGFuZGFyZGl6ZWQgZGVz
Y3JpcHRpb24gb2YgdGhlIGhhcmR3YXJlCj4gaW50ZXJmYWNlIHVzZWQgZm9yIGludGVyLVZNIGNv
bW11bmljYXRpb24gaW4gQmFvLWJhc2VkIHN5c3RlbXMuCj4gCj4gVGhlIGJpbmRpbmcgZG9jdW1l
bnRzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoKPiAKPiAgIC0gY29tcGF0aWJsZTogImJhbyxp
cGNzaG1lbSIKPiAgIC0gcmVnOiBNZW1vcnkgcmVnaW9uIGZvciB0aGUgc2hhcmVkIG1lbW9yeSBk
ZXZpY2UKPiAgIC0gaWQ6IFVuaXF1ZSBkZXZpY2UgaWRlbnRpZmllcgo+ICAgLSByZWFkLWNoYW5u
ZWw6IFtvZmZzZXQsIHNpemVdIGZvciByZWFkaW5nIGZyb20gdGhlIHNoYXJlZCBtZW1vcnkKPiAg
IC0gd3JpdGUtY2hhbm5lbDogW29mZnNldCwgc2l6ZV0gZm9yIHdyaXRpbmcgdG8gdGhlIHNoYXJl
ZCBtZW1vcnkKPiAgIC0gaW50ZXJydXB0czogSW50ZXJydXB0cyB1c2VkIGJ5IHRoZSBkZXZpY2UK
PiAKPiBUaGlzIGVuYWJsZXMga2VybmVsIGRyaXZlcnMgYW5kIHVzZXJzcGFjZSB0b29scyB0byBj
b3JyZWN0bHkKPiBpbnN0YW50aWF0ZSBhbmQgY29uZmlndXJlIEJhbyBJUEMgc2hhcmVkIG1lbW9y
eSBkZXZpY2VzIGJhc2VkCj4gb24gdGhlIERUIGRlc2NyaXB0aW9uLCBmYWNpbGl0YXRpbmcgZWZm
aWNpZW50IGNvbW11bmljYXRpb24KPiBiZXR3ZWVuIFZNcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
b8OjbyBQZWl4b3RvIDxqb2FvcGVpeG90b0Bvc3l4LnRlY2g+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Jhby9pcGNzaG1lbS55YW1sICAgICB8IDk5ICsrKysrKysrKysrKysrKysr
KysKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgIHwgIDIg
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwMSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2lwY3NobWVtLnlhbWwK
PiAKCk15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBv
biB5b3VyIHBhdGNoOgoKeWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOgoKZHRzY2hlbWEvZHRjIHdh
cm5pbmdzL2Vycm9yczoKCgpkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVja2RvY3Mp
OgoKU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9kZXZpY2V0cmVlL3Bh
dGNoLzIwMjUxMjI0MTM1MjE3LjI1MzUwLTItam9hb3BlaXhvdG9Ab3N5eC50ZWNoCgpUaGUgYmFz
ZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxhdGVzdCByYzEuIEEgZGlmZmVyZW50
IGRlcGVuZGVuY3kKc2hvdWxkIGJlIG5vdGVkIGluICp0aGlzKiBwYXRjaC4KCklmIHlvdSBhbHJl
YWR5IHJhbiAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBhbmQgZGlkbid0IHNlZSB0aGUgYWJvdmUK
ZXJyb3IocyksIHRoZW4gbWFrZSBzdXJlICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1z
Y2hlbWEgaXMgdXAgdG8KZGF0ZToKCnBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUKClBs
ZWFzZSBjaGVjayBhbmQgcmUtc3VibWl0IGFmdGVyIHJ1bm5pbmcgdGhlIGFib3ZlIGNvbW1hbmQg
eW91cnNlbGYuIE5vdGUKdGhhdCBEVF9TQ0hFTUFfRklMRVMgY2FuIGJlIHNldCB0byB5b3VyIHNj
aGVtYSBmaWxlIHRvIHNwZWVkIHVwIGNoZWNraW5nCnlvdXIgc2NoZW1hLiBIb3dldmVyLCBpdCBt
dXN0IGJlIHVuc2V0IHRvIHRlc3QgYWxsIGV4YW1wbGVzIHdpdGggeW91ciBzY2hlbWEuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
