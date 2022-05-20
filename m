Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD1EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 15:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q29fxrFZ9/SKKlRkH00ngOe61f/g8hA835OgnbLkiNQ=; b=4JnRXuZy94wKZ/
	AaIW/Q7PJDcXmiAYVjIyCtminIkFPP7ksyUdTENt3Dxgz0hQb+nqkhxC04XnKf8d6Px2agT2dyuSC
	6ZmdwrW3CRE6aRSuJYOl68Zo0cKJZTHXAYzx9Cefa96L8f8nkLDUe+FnsCOfofCJxnT9SEYuGNLX+
	m/l2EihgFBIge3Ztt6hPBEUx6FfwvZmlnYbbsl8cmhao5bPi6aLOxvaFK8Dhc2RGTY1MkbAo6GeFL
	b+laS+Qe+TIGWLvorDgSUshPwCDc8uJoAddmXrVZ9qBGz0+XbTGlxqnilCuBAOrpuFJJYa1WY7/+v
	9L1j+StB9L6/6b5No9Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4XJ-00DBrH-Ix; Fri, 20 May 2022 15:27:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4X4-00DBk8-3H; Fri, 20 May 2022 15:27:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5549B1477;
 Fri, 20 May 2022 08:27:11 -0700 (PDT)
Received: from bogus (unknown [10.57.66.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E43C3F73D;
 Fri, 20 May 2022 08:27:09 -0700 (PDT)
Date: Fri, 20 May 2022 16:27:02 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ionela Voinescu <ionela.voinescu@arm.com>
Cc: Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Qing Wang <wangqing@vivo.com>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 3/8] arch_topology: Set cluster identifier in each
 core/thread from /cpu-map
Message-ID: <20220520152702.ge3uxmizwljsg6mr@bogus>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
 <20220518093325.2070336-4-sudeep.holla@arm.com>
 <YoZ2gjjS3rbRaJZm@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YoZ2gjjS3rbRaJZm@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_082714_262509_1C1252FC 
X-CRM114-Status: GOOD (  30.06  )
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

T24gVGh1LCBNYXkgMTksIDIwMjIgYXQgMDU6NTU6MzBQTSArMDEwMCwgSW9uZWxhIFZvaW5lc2N1
IHdyb3RlOgo+IEhpLAo+IAo+IEFzIHNhaWQgYmVmb3JlLCB0aGlzIGNyZWF0ZXMgdHJvdWJsZSBm
b3IgQ09ORklHX1NDSEVEX0NMVVNURVI9eS4KPiBUaGUgb3V0cHV0IGJlbG93IGlzIG9idGFpbmVk
IGZyb20gSnVuby4KPiAKPiBXaGVuIGNsdXN0ZXJfaWQgaXMgcG9wdWxhdGVkLCBhIG5ldyBDTFMg
bGV2ZWwgaXMgY3JlYXRlZCBieSB0aGUgc2NoZWR1bGVyCj4gdG9wb2xvZ3kgY29kZS4gSW4gdGhp
cyBjYXNlIHRoZSBjbHVzdGVycyBpbiBEVCBkZXRlcm1pbmUgdGhhdCB0aGUgY2x1c3Rlcgo+IHNp
YmxpbmdzIGFuZCBsbGMgc2libGluZ3MgYXJlIHRoZSBzYW1lIHNvIHRoZSBNQyBzY2hlZHVsZXIg
ZG9tYWluIHdpbGwKPiBiZSByZW1vdmVkIGFuZCwgZm9yIEp1bm8sIG9ubHkgQ0xTIGFuZCBESUUg
d2lsbCBiZSBrZXB0Lgo+CgpZZXMgSSBoYXZlIHNlZW4gdGhhdC4gCgoxLiBXaWxsIHRoYXQgZGlm
ZmVyIHdpdGggQUNQSSBvbiBqdW5vID8KCjIuIElzIHRoYXQgYSBwcm9ibGVtID8gSSBtZWFuIHdl
IGFyZSBmaXhpbmcgdGhvc2UgbWFza3MgdGhhdCBhcmUgdXNlcgp2aXNpYmxlIHdpdGggdGhpcyBz
ZXJpZXMgYW5kIGlmIHVzaW5nIHRoZW0gYXMgaXMgaW4gc2NoZWQgZG9tYWluIGlzCmluY29ycmVj
dCBvciBub3Qgc3VmZmljaWVudCwgd2UgbmVlZCB0byBmaXggdGhhdC4gV2UgY2FuJ3QgY2hhbmdl
IHRoZXNlCm1hc2tzLgoKPiByb290QGRlYmlhbi1hcm02NC1idXN0ZXI6L3N5cy9rZXJuZWwvZGVi
dWcvc2NoZWQvZG9tYWlucy9jcHUxIyBncmVwIC4gKi8qCj4gZG9tYWluMC9idXN5X2ZhY3Rvcjox
Ngo+IGRvbWFpbjAvY2FjaGVfbmljZV90cmllczoxCj4gZG9tYWluMC9mbGFnczpTRF9CQUxBTkNF
X05FV0lETEUgU0RfQkFMQU5DRV9FWEVDIFNEX0JBTEFOQ0VfRk9SSyBTRF9XQUtFX0FGRklORSBT
RF9TSEFSRV9QS0dfUkVTT1VSQ0VTIFNEX1BSRUZFUl9TSUJMSU5HCj4gZG9tYWluMC9pbWJhbGFu
Y2VfcGN0OjExNwo+IGRvbWFpbjAvbWF4X2ludGVydmFsOjQKPiBkb21haW4wL21heF9uZXdpZGxl
X2xiX2Nvc3Q6MTQ5MDcKPiBkb21haW4wL21pbl9pbnRlcnZhbDoyCj4gZG9tYWluMC9uYW1lOkNM
Uwo+IGRvbWFpbjEvYnVzeV9mYWN0b3I6MTYKPiBkb21haW4xL2NhY2hlX25pY2VfdHJpZXM6MQo+
IGRvbWFpbjEvZmxhZ3M6U0RfQkFMQU5DRV9ORVdJRExFIFNEX0JBTEFOQ0VfRVhFQyBTRF9CQUxB
TkNFX0ZPUksgU0RfV0FLRV9BRkZJTkUgU0RfQVNZTV9DUFVDQVBBQ0lUWSBTRF9BU1lNX0NQVUNB
UEFDSVRZX0ZVTEwgU0RfUFJFRkVSX1NJQkxJTkcKPiBkb21haW4xL2ltYmFsYW5jZV9wY3Q6MTE3
Cj4gZG9tYWluMS9tYXhfaW50ZXJ2YWw6MTIKPiBkb21haW4xL21heF9uZXdpZGxlX2xiX2Nvc3Q6
MTE4NTgKPiBkb21haW4xL21pbl9pbnRlcnZhbDo2Cj4gZG9tYWluMS9uYW1lOkRJRQo+IAo+IFRv
IGJlIG5vdGVkIHRoYXQgd2UgYWxzbyBnZXQgYSBuZXcgZmxhZyBTRF9QUkVGRVJfU0lCTElORyBm
b3IgdGhlIENMUwo+IGxldmVsIHRoYXQgaXMgbm90IGFwcHJvcHJpYXRlLiBXZSB1c3VhbGx5IHJl
bW92ZSBpdCBmb3IgdGhlIGNoaWxkIG9mIGEKPiBTRF9BU1lNX0NQVUNBUEFDSVRZIGRvbWFpbiwg
YnV0IHdlIGRvbid0IGN1cnJlbnRseSByZWRvIHRoaXMgYWZ0ZXIgc29tZQo+IGxldmVscyBhcmUg
ZGVnZW5lcmF0ZWQuIFRoaXMgaXMgYSBmaXhhYmxlIGlzc3VlLgo+CgpPSyBnb29kLgoKPiBCdXQg
bG9va2luZyBhdCB0aGUgYmlnZ2VyIHBpY3R1cmUsIGEgZ29vZCBxdWVzdGlvbiBpcyB3aGF0IGlz
IHRoZSBiZXN0Cj4gdGhpbmcgdG8gZG8gd2hlbiBjbHVzdGVyIGRvbWFpbnMgYW5kIGxsYyBkb21h
aW5zIHNwYW4gdGhlIHNhbWUgQ1BVcz8KPgoKSW5kZWVkLCBJIHdpbGwgbGVhdmUgdGhhdCB0byBz
Y2hlZHVsZXIgZXhwZXJ0cyDwn5iJLiBNeSBtYWluIGdvYWwgaXMgdG8gZ2V0CnRoZSB0b3BvbG9n
eSBtYXNrcyB0aGF0IGFyZSB1c2VyIHZpc2libGUgcmlnaHQgYW5kIGtlZXBpbmcgY3VycmVudCBi
ZWhhdmlvcgppbnRhY3QuCgo+IFBvc3NpYmx5IGl0IHdvdWxkIGJlIGJlc3QgdG8gcmVzdHJpY3Qg
Y2x1c3RlcnMgKHdoaWNoIGFyZSBhbG1vc3QgYW4KPiBhcmJpdHJhcnkgY29uY2VwdCkgdG8gYWx3
YXlzIHNwYW4gYSBzdWJzZXQgb2YgQ1BVcyBvZiB0aGUgbGxjIGRvbWFpbiwKPiBpZiBsbGMgc2li
bGluZ3MgY2FuIGJlIG9idGFpbmVkPyBJZiB0aG9zZSBjbHVzdGVycyBhcmUgbm90IHByb3Blcmx5
IHNldAo+IHVwIGluIERUIHRvIHJlc3BlY3QgdGhpcyBjb25kaXRpb24sIGNsdXN0ZXJfc2libGlu
Z3Mgd291bGQgbmVlZCB0byBiZQo+IGNsZWFyZWQgKG9yIHNldCB0byB0aGUgY3VycmVudCBDUFUp
IHNvIHRoZSBDTFMgZG9tYWluIGlzIG5vdCBjcmVhdGVkIGF0Cj4gYWxsLgo+CgpZZXMsIHdlIGFs
cmVhZHkgaGF2ZSBhbGwgdGhlc2UgY29tcGxleCBjb25kaXRpb25zIGluIGNwdV9jb3JlZ3JvdXBf
bWFzay4KV2h5IG5vdCBkbyBzb21ldGhpbmcgc2ltaWxhciBpbiBjcHVfY2x1c3Rlcmdyb3VwX21h
c2sgPwoKPiBBZGRpdGlvbmFsbHksIHNob3VsZCB3ZSB1c2UgY2x1c3RlciBpbmZvcm1hdGlvbiBm
cm9tIERUIChjbHVzdGVyX2lkKSB0bwo+IGNyZWF0ZSBhbiBNQyBsZXZlbCBpZiB3ZSBkb24ndCBo
YXZlIGxsYyBpbmZvcm1hdGlvbiwgZXZlbiBpZgo+IENPTkZJR19TQ0hFRF9DTFVTVEVSPW4/Cj4K
CkkgZG9uJ3Qga25vdy4gV2UgaGF2ZSBhbGwgdGhlIHRvcG9sb2d5IGFuZCBsbGMgaW5mbyBub3cs
IHdlIG5lZWQgdG8gZGVjaWRlCmhvdyB0byBwcmVzZW50IHRoZW0gdG8gc2NoZWR1bGVyLgoKPiBJ
IGN1cnJlbnRseSBkb24ndCBoYXZlIGEgdmVyeSBjbGVhciBwaWN0dXJlIG9mIGhvdyBjbHVzdGVy
IGRvbWFpbnMgYW5kCj4gbGxjIGRvbWFpbnMgd291bGQgImxpdmUiIHRvZ2V0aGVyIGluIGEgdmFy
aWV0eSBvZiB0b3BvbG9naWVzLiBJJ2xsIHRyeQo+IG90aGVyIERUIHRvcG9sb2dpZXMgdG8gc2Vl
IGlmIHRoZXJlIGFyZSBvdGhlcnMgdGhhdCBjYW4gbGVhZCB0byB0cm91YmxlLgo+CgpNZSBuZWl0
aGVyLiBJIGF2b2lkZWQgdGhlc2UgY2hhbmdlcyBmb3IgeWVhcnMgYmVjYXVzZSBvZiBzdWNoIGNv
bXBsZXgKcXVlc3Rpb25zIGJ1dCB0aGF0IGlzIHdyb25nIHJlYXNvbiB0bywgYXMgdGhlIHVzZXIg
dmlzaWJsZSB0b3BvbG9neSBoYXMKbm93IGRpdmVyZ2VkIGZyb20gQUNQSSBvbmNlKHBlb3BsZSB3
aG8gY29tcGxhaW5lZCBhYm91dCB1c2VyIHNwYWNlIGJyZWFrYWdlCmNhcmVkIG9ubHkgYWJvdXQg
QUNQSSkgYW5kIHdlIG5lZWQgdG8gYnJpbmcgdGhlbSBpbiBwYXJpdHkgc29vbiBJTU8uCgotLSAK
UmVnYXJkcywKU3VkZWVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
