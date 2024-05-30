Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7629BC25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 11:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KKVEFEHksLqOVWjeVKm5wnBHUbRP500i1RtVFl/VLlg=; b=wDRwjTXbQbQwqS
	O5dnpXpyd8hcTo22GmFBr96wLQ0MYo/yX7BVGhZAr3OyU3L1OD302ZRaI9Uc+pCrXiXqx46b63oDP
	shrIvFHpsiOnALTaTtp3kx6adipvWlNTJQuveft82CMLdSDe205mfqJ7gMs+6OvXQWDZjTwsyhLzw
	1h3ZtoVeSau7fXJYXxyK1Ra6VpDorQcjTFFAUWrIndg/fV/71LMqYtl/0jsqwZOIx2vshzTER42jM
	0LVwMtd43bbCqG+ktV0fWbVsBpxzAjidCXZHDFEgg2zlehCr0m/MV7GSj2fsGnEdRkzAEW7ZoWY6v
	N4xx1ciI+Ustd5ljW/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdwv-000000077Jp-39pJ;
	Thu, 30 May 2024 11:28:01 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCdwr-000000077Hx-0qTE;
	Thu, 30 May 2024 11:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1717068464;
	bh=QKCYv/9pkeewZS0wdLDjidR9iHNKpRPbnM/6kemvOTo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FpZS537T3yPjs0iXwLB6GlRYL0cdPMhC1/wShIU0j7i47Zz9Tq4aKnr7A8nrfwGme
	 9lzOUhjVJGLOLZqyiXFOMnX8rKmDEv+3qt3eMOkee7hOiQVhkl2PN7zQ51r+NWqHBV
	 R1iDpMCyTvvksWQ0oQYf3mlL90Er9AtaOI0Fdkps=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 998376770C;
	Thu, 30 May 2024 07:27:34 -0400 (EDT)
Message-ID: <19dd3ba543ee3796afd4ee75daea199f56f32bcb.camel@xry111.site>
Subject: Re: [PATCH 2/6] loongarch: defconfig: drop RT_GROUP_SCHED=y
From: Xi Ruoyao <xry111@xry111.site>
To: Celeste Liu <coelacanthushex@gmail.com>, Heinrich Schuchardt
 <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, Guo
 Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?ISO-8859-1?Q?Th=E9o?= Lebrun
 <theo.lebrun@bootlin.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Sven Joachim
 <svenjoac@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Tony
 Lindgren <tony@atomide.com>,  Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, 
 Mykola Lysenko <mykolal@fb.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
  linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Date: Thu, 30 May 2024 19:27:32 +0800
In-Reply-To: <20240530111947.549474-10-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
	 <20240530111947.549474-10-CoelacanthusHex@gmail.com>
User-Agent: Evolution 3.52.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_042757_306233_5411BBCE 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: bpf@vger.kernel.org, Lennart Poettering <lennart@poettering.net>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDI0LTA1LTMwIGF0IDE5OjE5ICswODAwLCBDZWxlc3RlIExpdSB3cm90ZToKPiBG
b3IgY2dyb3VwIHYxLCBpZiB0dXJuZWQgb24sIGFuZCB0aGVyZSdzIGFueSBjZ3JvdXAgaW4gdGhl
ICJjcHUiIGhpZXJhcmNoeSBpdAo+IG5lZWRzIGFuIFJUIGJ1ZGdldCBhc3NpZ25lZCwgb3RoZXJ3
aXNlIHRoZSBwcm9jZXNzZXMgaW4gaXQgd2lsbCBub3QgYmUgYWJsZSB0bwo+IGdldCBSVCBhdCBh
bGwuIFRoZSBwcm9ibGVtIHdpdGggUlQgZ3JvdXAgc2NoZWR1bGluZyBpcyB0aGF0IGl0IHJlcXVp
cmVzIHRoZQo+IGJ1ZGdldCBhc3NpZ25lZCBidXQgdGhlcmUncyBubyB3YXkgd2UgY291bGQgYXNz
aWduIGEgZGVmYXVsdCBidWRnZXQsIHNpbmNlIHRoZQo+IHZhbHVlcyB0byBhc3NpZ24gYXJlIGJv
dGggdXBwZXIgYW5kIGxvd2VyIHRpbWUgbGltaXRzLCBhcmUgYWJzb2x1dGUsIGFuZCBuZWVkIHRv
Cj4gYmUgc3VtIHVwIHRvIDwgMSBmb3IgZWFjaCBpbmRpdmlkYWwgY2dyb3VwLiBUaGF0IG1lYW5z
IHdlIGNhbm5vdCByZWFsbHkgY29tZSB1cAo+IHdpdGggdmFsdWVzIHRoYXQgd291bGQgd29yayBi
eSBkZWZhdWx0IGluIHRoZSBnZW5lcmFsIGNhc2UuWzFdCj4gCj4gRm9yIGNncm91cCB2MiwgaXQn
cyBhbG1vc3QgdW51c2FibGUgYXMgd2VsbC4gSWYgaXQgdHVybmVkIG9uLCB0aGUgY3B1IGNvbnRy
b2xsZXIKPiBjYW4gb25seSBiZSBlbmFibGVkIHdoZW4gYWxsIFJUIHByb2Nlc3NlcyBhcmUgaW4g
dGhlIHJvb3QgY2dyb3VwLiBCdXQgaXQgd2lsbAo+IGxvc2UgdGhlIGJlbmVmaXRzIG9mIGNncm91
cCB2MiBpZiBhbGwgUlQgcHJvY2VzcyB3ZXJlIHBsYWNlZCBpbiB0aGUgc2FtZSBjZ3JvdXAuCj4g
Cj4gUmVkIEhhdCwgR2VudG9vLCBBcmNoIExpbnV4IGFuZCBEZWJpYW4gYWxsIGRpc2FibGUgaXQu
IHN5c3RlbWQgYWxzbyBkb2Vzbid0Cj4gc3VwcG9ydCBpdC5bMl0KPiAKPiBbMV06IGh0dHBzOi8v
YnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTIyOTcwMAo+IFsyXTogaHR0cHM6
Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9pc3N1ZXMvMTM3ODEjaXNzdWVjb21tZW50LTU0
OTE2NDM4Mwo+IAo+IFNpZ25lZC1vZmYtYnk6IENlbGVzdGUgTGl1IDxDb2VsYWNhbnRodXNIZXhA
Z21haWwuY29tPgoKQXMgYSBkaXN0cm8gbWFpbnRhaW5lciB3aG8gaGFkIG9uY2UgYmVlbiBiaXR0
ZW4gYnkgdGhpcyBvcHRpb246CgpSZXZpZXdlZC1ieTogWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTEx
LnNpdGU+Cgo+IC0tLQo+IMKgYXJjaC9sb29uZ2FyY2gvY29uZmlncy9sb29uZ3NvbjNfZGVmY29u
ZmlnIHwgMSAtCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9hcmNoL2xvb25nYXJjaC9jb25maWdzL2xvb25nc29uM19kZWZjb25maWcgYi9hcmNoL2xv
b25nYXJjaC9jb25maWdzL2xvb25nc29uM19kZWZjb25maWcKPiBpbmRleCBiNDI1MmMzNTdjOGUu
LjRkOTNhZGIzZjFhMiAxMDA2NDQKPiAtLS0gYS9hcmNoL2xvb25nYXJjaC9jb25maWdzL2xvb25n
c29uM19kZWZjb25maWcKPiArKysgYi9hcmNoL2xvb25nYXJjaC9jb25maWdzL2xvb25nc29uM19k
ZWZjb25maWcKPiBAQCAtMjMsNyArMjMsNiBAQCBDT05GSUdfTlVNQV9CQUxBTkNJTkc9eQo+IMKg
Q09ORklHX01FTUNHPXkKPiDCoENPTkZJR19CTEtfQ0dST1VQPXkKPiDCoENPTkZJR19DRlNfQkFO
RFdJRFRIPXkKPiAtQ09ORklHX1JUX0dST1VQX1NDSEVEPXkKPiDCoENPTkZJR19DR1JPVVBfUElE
Uz15Cj4gwqBDT05GSUdfQ0dST1VQX1JETUE9eQo+IMKgQ09ORklHX0NHUk9VUF9GUkVFWkVSPXkK
Ci0tIApYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KU2Nob29sIG9mIEFlcm9zcGFjZSBT
Y2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5pdmVyc2l0eQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
