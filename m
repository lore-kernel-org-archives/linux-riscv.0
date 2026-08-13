Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AECBC5B572
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Aug 2026 10:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fqk6Obbc3V7EHzfv3BMTDfbJBur4X7uyhJcGHMC5slA=; b=Ed/2dw8hsqpyYy
	2XZzd7I/TUohKC6k/Bmy+4kuiFuKdVlJQ8kM/ZCZlyVjg5kvR20LUvlo8vFwJVOHatxjbjNNM93RJ
	+PFIgwRH0t3ZCs9nRe+ioyEt0Y99Du6wixGon5iw0UQQADI4U/5rmexxEDEl+0lO8KS9vCbba+DrP
	81ap+y7EPb0vjMJIsTjjdWC7s3npsAZrZFPU7tDT6wIc+vV1HLiGwb7px6keO6/WIBZliDxtHuvqm
	5vwXaSOi1I8CHzxzg3mmO0SnlE1VThTl5DdvTOcWWSTM0qYHDt8i0YAzAHdP+f3XddOvnJgDr6Nef
	7JRfsJNvLEj/iMqdPo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSdm-00000000TXb-2VRb;
	Thu, 13 Aug 2026 10:26:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuSdj-00000000TV5-3DWx;
	Thu, 13 Aug 2026 10:26:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67C49153B;
	Thu, 13 Aug 2026 03:26:15 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 857E03F632;
	Thu, 13 Aug 2026 03:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786616779; bh=9rSsdIC/129SZ1WHfCEReTwxxw/QdoL6Qp0KAKAWByI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=t3Bl2ZPsyAgEEtp/RWgJ8wXhch92sf7Fi5Jn2n/O3IysUP737x3khQusWpkRkl6eQ
	 zgRInDgxOP9mgG2K33Z9LX0OBE6OkE3R/c7KtrhRZ8Lbyh+7Ha8Wxc+nyIspdacYNd
	 uBFE5ImQ3gH51ksby5neG6vjeN5JuVHGSJHpHE0k=
Message-ID: <f88baccf-6acb-4ded-a6cd-0d9b69965644@arm.com>
Date: Thu, 13 Aug 2026 11:26:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] vDSO: Remove CONFIG_GENERIC_GETTIMEOFDAY ifdeffery
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev
References: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260724-vdso-arch-clockmodes-v4-0-ddbe447be860@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_032623_894757_C9EE05E8 
X-CRM114-Status: GOOD (  12.68  )
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

CgpPbiAyNC8wNy8yMDI2IDE0OjM2LCBUaG9tYXMgV2Vpw59zY2h1aCB3cm90ZToKPiBBbHdheXMg
cHJvdmlkZSB0aGUgZGVmaW5pdGlvbnMgb2YgdGhlIFZEU09fQ0xPQ0tNT0RFXyogY29uc3RhbnRz
IGFuZAo+IHJlbW92ZSBzb21lIGlmZGVmZmVyeSBmcm9tIHRoZSBjbG9ja3NvdXJjZSBkcml2ZXJz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vpc3NzY2h1
aEBsaW51dHJvbml4LmRlPgo+IC0tLQo+IENoYW5nZXMgaW4gdjQ6Cj4gLSBQaWNrIHVwIEFjayBm
cm9tIE1hcmsgWnluZ2llci4KPiAtIEZpeCAnLXR5cGUgZCcgYXJndW1lbnQgdG8gZmluZC4KPiAt
IExpbmsgdG8gdjM6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDcyMi12ZHNvLWFyY2gt
Y2xvY2ttb2Rlcy12My0wLTRjNTc1MzE5MWNjNEBsaW51dHJvbml4LmRlCj4gCj4gQ2hhbmdlcyBp
biB2MzoKPiAtIFVwZGF0ZSAqYWxsKiBjb21taXQgbWVzc2FnZXMgdG8gdGhlIGxhdGVzdCBsb2dp
Yy4KPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8yMDI2MDcxNy12ZHNv
LWFyY2gtY2xvY2ttb2Rlcy12Mi0wLTc1NmY1YTVkMTQ2N0BsaW51dHJvbml4LmRlCj4gCj4gQ2hh
bmdlcyBpbiB2MjoKPiAtIEFsc28gZHJvcCB0aGUgSVNfRU5BQkxFRCgpIGxvZ2ljLgo+IC0gTGlu
ayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYwNzA5LXZkc28tYXJjaC1jbG9j
a21vZGVzLXYxLTAtM2ZkNzgwYmJmODUxQGxpbnV0cm9uaXguZGUKPiAKPiAtLS0KPiBUaG9tYXMg
V2Vpw59zY2h1aCAoNyk6Cj4gICAgICAga2J1aWxkOiBzdXBwb3J0IGdlbmVyYXRlZCBhc20taGVh
ZGVycyBpbiBzdWJkaXJlY3Rvcmllcwo+ICAgICAgIHZEU086IE1ha2UgY2xvY2ttb2RlIGNvbnN0
YW50cyBhdmFpbGFibGUgd2l0aG91dCBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkKPiAgICAg
ICBNSVBTOiBjc3JjLXI0azogUmVtb3ZlIENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWSBpZmRl
ZmZlcnkKPiAgICAgICBjbG9ja3NvdXJjZS9kcml2ZXJzL21pcHMtZ2ljLXRpbWVyOiBSZW1vdmUg
Q09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZIGlmZGVmZmVyeQo+ICAgICAgIGNsb2Nrc291cmNl
L2RyaXZlcnMvYXJtX2FyY2hfdGltZXI6IFJlbW92ZSBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZE
QVkgaWZkZWZmZXJ5Cj4gICAgICAgY2xvY2tzb3VyY2UvZHJpdmVycy90aW1lci1yaXNjdjogUmVt
b3ZlIENPTkZJR19HRU5FUklDX0dFVFRJTUVPRkRBWSBpZmRlZmZlcnkKPiAgICAgICBMb29uZ0Fy
Y2g6IFJlbW92ZSBDT05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVkgaWZkZWZmZXJ5Cj4gCj4gIGFy
Y2gvbG9vbmdhcmNoL2tlcm5lbC90aW1lLmMgICAgICAgICAgIHwgIDIgLS0KPiAgYXJjaC9taXBz
L2tlcm5lbC9jc3JjLXI0ay5jICAgICAgICAgICAgfCAgMiAtLQo+ICBkcml2ZXJzL2Nsb2Nrc291
cmNlL2FybV9hcmNoX3RpbWVyLmMgICB8ICA0IC0tLS0KPiAgZHJpdmVycy9jbG9ja3NvdXJjZS9t
aXBzLWdpYy10aW1lci5jICAgfCAgMiAtLQo+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJp
c2N2LmMgICAgICB8ICA0IC0tLS0KPiAgaW5jbHVkZS9hc20tZ2VuZXJpYy9LYnVpbGQgICAgICAg
ICAgICAgfCAgMSArCj4gIGluY2x1ZGUvYXNtLWdlbmVyaWMvdmRzby9jbG9ja3NvdXJjZS5oIHwg
IDAKPiAgaW5jbHVkZS92ZHNvL2Nsb2Nrc291cmNlLmggICAgICAgICAgICAgfCAgNCArLS0tCj4g
IHNjcmlwdHMvTWFrZWZpbGUuYXNtLWhlYWRlcnMgICAgICAgICAgIHwgMTEgKysrKystLS0tLS0K
PiAgOSBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQo+IC0t
LQo+IGJhc2UtY29tbWl0OiBlY2FjYzljOGQzZWQwZjYzMDY1ZjRhMWU5NGJmZDhiZjY1YTNmZmFm
Cj4gY2hhbmdlLWlkOiAyMDI2MDYwNS12ZHNvLWFyY2gtY2xvY2ttb2Rlcy1iZmNhZjlhMmM4NDgK
PiAKPiBCZXN0IHJlZ2FyZHMsCj4gLS0gIAo+IFRob21hcyBXZWnDn3NjaHVoIDx0aG9tYXMud2Vp
c3NzY2h1aEBsaW51dHJvbml4LmRlPgo+IAoKVGhhbmtzIGZvciB0aGlzLgoKUmV2aWV3ZWQtYnk6
IFZpbmNlbnpvIEZyYXNjaW5vIDx2aW5jZW56by5mcmFzY2lub0Bhcm0uY29tPiAjIGZvciB0aGUg
c2VyaWVzLgoKLS0gClJlZ2FyZHMsClZpbmNlbnpvCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
