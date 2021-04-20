Return-Path: <SRS0=56ix=JR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D10C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 16:06:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C42B613C0
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Apr 2021 16:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C42B613C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tugVarTH4oC1nTDomaZYyJnRd3YpkYm81QmHOSsxAho=; b=KC1rlUxGobs6L8W9R0OJV3jZS
	BrTB10YzfgX0Nl4cKOJ/xgXhmG6sqITsWH0y+rnbawAlBoewuTUputSURcREqUtgwudukRkbeIgUu
	SKjNRmsyetK43b1R0jbOk+D0sXVgKXr5A65Up43Q6vRfKtQeyKjG91XHRG4J1zFh7Hx+dk7Isu7vY
	GyzsWPYjERUW/fLEvOeZ2r7aer66n0Is437VU6bsaJLIq52C5utqAy4MScRlYEtMtrYch0KMaqa7m
	lL7w+QOV/vsZAXLa+zjKcogxz3ZYFTevhOHI5vAsATgsjHij4wvXnukTwtliCtl3HT10qJpBBgBva
	j4YPDQMwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYstH-00CXXc-Ak; Tue, 20 Apr 2021 16:06:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYst4-00CXVe-3W; Tue, 20 Apr 2021 16:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=UuaDWieSiFr1eDV/8FBDML1WGhqyaiBzxVcGBAuLXYE=; b=UOP/i6/ZZCZOUceNge5Q568SNo
 Xb1bYvTp+ZWtzsb7scdhqyPtHCgX8HTxp4ci6i6YQHKOwSuTs+1qFnefVFSf24NNKDZNmQOZzm2hA
 1flYoKRR15p+iDgTR2b0lLktrK6m8ATRZp+64sbTRWjau+CWzOfZBTccXQNgPaZ4xksfa4ujsUhjO
 bEWW6MiBoqmlvH85D18Ggh44YTK8fh76nW6OqqtUke1CnVs+OWsvK05d8d4acAjJQc7bfIkFFhj/b
 JihxCfvTGsmN7vhWjFjxBBlAs1ls++SKlrlyx7hfipMK/9bNggZ+aPUKqXZXsC6/pgV10HweLh8K+
 M+J3H2Ag==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYssx-00CG04-Lo; Tue, 20 Apr 2021 16:06:04 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FPpST5fYSz9tyMJ;
 Tue, 20 Apr 2021 18:05:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6qTfVqAOsH66; Tue, 20 Apr 2021 18:05:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FPpST4Shgz9tyMF;
 Tue, 20 Apr 2021 18:05:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B5AD8B807;
 Tue, 20 Apr 2021 18:05:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZiEcE-0Tlz-R; Tue, 20 Apr 2021 18:05:47 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0267E8B7ED;
 Tue, 20 Apr 2021 18:05:45 +0200 (CEST)
Subject: Re: [PATCH v4 19/20] mips: Convert to GENERIC_CMDLINE
To: Daniel Walker <danielwa@cisco.com>, Rob Herring <robh@kernel.org>
Cc: will@kernel.org, daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org, 
 akpm@linux-foundation.org, linux-arch@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
 <20210406173836.GW2469518@zorba>
 <20210408190408.GA1724284@robh.at.kernel.org>
 <20210409012349.GG3981976@zorba>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d92f99bf-20b7-a4b6-3d86-5b859e42cad8@csgroup.eu>
Date: Tue, 20 Apr 2021 18:05:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210409012349.GG3981976@zorba>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_090600_041704_83B96186 
X-CRM114-Status: GOOD (  21.01  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAwOS8wNC8yMDIxIMOgIDAzOjIzLCBEYW5pZWwgV2Fsa2VyIGEgw6ljcml0wqA6Cj4gT24g
VGh1LCBBcHIgMDgsIDIwMjEgYXQgMDI6MDQ6MDhQTSAtMDUwMCwgUm9iIEhlcnJpbmcgd3JvdGU6
Cj4+IE9uIFR1ZSwgQXByIDA2LCAyMDIxIGF0IDEwOjM4OjM2QU0gLTA3MDAsIERhbmllbCBXYWxr
ZXIgd3JvdGU6Cj4+PiBPbiBGcmksIEFwciAwMiwgMjAyMSBhdCAwMzoxODoyMVBNICswMDAwLCBD
aHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pj4+IC1jb25maWcgQ01ETElORV9CT09MCj4+Pj4gLQli
b29sICJCdWlsdC1pbiBrZXJuZWwgY29tbWFuZCBsaW5lIgo+Pj4+IC0JaGVscAo+Pj4+IC0JICBG
b3IgbW9zdCBzeXN0ZW1zLCBpdCBpcyBmaXJtd2FyZSBvciBzZWNvbmQgc3RhZ2UgYm9vdGxvYWRl
ciB0aGF0Cj4+Pj4gLQkgIGJ5IGRlZmF1bHQgc3BlY2lmaWVzIHRoZSBrZXJuZWwgY29tbWFuZCBs
aW5lIG9wdGlvbnMuICBIb3dldmVyLAo+Pj4+IC0JICBpdCBtaWdodCBiZSBuZWNlc3Nhcnkgb3Ig
YWR2YW50YWdlb3VzIHRvIGVpdGhlciBvdmVycmlkZSB0aGUKPj4+PiAtCSAgZGVmYXVsdCBrZXJu
ZWwgY29tbWFuZCBsaW5lIG9yIGFkZCBhIGZldyBleHRyYSBvcHRpb25zIHRvIGl0Lgo+Pj4+IC0J
ICBGb3Igc3VjaCBjYXNlcywgdGhpcyBvcHRpb24gYWxsb3dzIHlvdSB0byBoYXJkY29kZSB5b3Vy
IG93bgo+Pj4+IC0JICBjb21tYW5kIGxpbmUgb3B0aW9ucyBkaXJlY3RseSBpbnRvIHRoZSBrZXJu
ZWwuICBGb3IgdGhhdCwgeW91Cj4+Pj4gLQkgIHNob3VsZCBjaG9vc2UgJ1knIGhlcmUsIGFuZCBm
aWxsIGluIHRoZSBleHRyYSBib290IGFyZ3VtZW50cwo+Pj4+IC0JICBpbiBDT05GSUdfQ01ETElO
RS4KPj4+PiAtCj4+Pj4gLQkgIFRoZSBidWlsdC1pbiBvcHRpb25zIHdpbGwgYmUgY29uY2F0ZW5h
dGVkIHRvIHRoZSBkZWZhdWx0IGNvbW1hbmQKPj4+PiAtCSAgbGluZSBpZiBDTURMSU5FX09WRVJS
SURFIGlzIHNldCB0byAnTicuIE90aGVyd2lzZSwgdGhlIGRlZmF1bHQKPj4+PiAtCSAgY29tbWFu
ZCBsaW5lIHdpbGwgYmUgaWdub3JlZCBhbmQgcmVwbGFjZWQgYnkgdGhlIGJ1aWx0LWluIHN0cmlu
Zy4KPj4+PiAtCj4+Pj4gLQkgIE1vc3QgTUlQUyBzeXN0ZW1zIHdpbGwgbm9ybWFsbHkgZXhwZWN0
ICdOJyBoZXJlIGFuZCByZWx5IHVwb24KPj4+PiAtCSAgdGhlIGNvbW1hbmQgbGluZSBmcm9tIHRo
ZSBmaXJtd2FyZSBvciB0aGUgc2Vjb25kLXN0YWdlIGJvb3Rsb2FkZXIuCj4+Pj4gLQo+Pj4KPj4+
Cj4+PiBTZWUgaG93IHlvdSBjb21wbGFpbmVkIHRoYXQgSSBoYXZlIENNRExJTkVfQk9PTCBpbiBt
eSBjaGFuZ2VkLCBhbmQgeW91IHRoaW5rIGl0Cj4+PiBzaG91bGRuJ3QgZXhpc3QuCj4+Pgo+Pj4g
WWV0IGhlcmUgbWlwcyBoYXMgaXQsIGFuZCB5b3UganVzdCBkZWxldGVkIGl0IHdpdGggbm8gZmVh
dHVyZSBwYXJpdHkgaW4geW91cgo+Pj4gY2hhbmdlcyBmb3IgdGhpcy4KPj4KPj4gQUZBSUNULCBD
TURMSU5FX0JPT0wgZXF1YXRlcyB0byBhIG5vbi1lbXB0eSBvciBlbXB0eSBDT05GSUdfQ01ETElO
RS4gWW91Cj4+IHNlZW0gdG8gbmVlZCBpdCBqdXN0IGJlY2F1c2UgeW91IGhhdmUgQ01ETElORV9Q
UkVQRU5EIGFuZAo+PiBDTURMSU5FX0FQUEVORC4gSWYgdGhhdCdzIG5vdCBpdCwgd2hhdCBmZWF0
dXJlIGlzIG1pc3Npbmc/IENNRExJTkVfQk9PTAo+PiBpcyBub3QgYSBmZWF0dXJlLCBidXQgYW4g
aW1wbGVtZW50YXRpb24gZGV0YWlsLgo+IAo+IE5vdCB0cnVlLgo+IAo+IEl0IG1ha2VzIGl0IGVh
c2llciB0byB0dXJuIGl0IGFsbCBvZmYgaW5zaWRlIHRoZSBLY29uZmlnICwgc28gaXQncyBmb3Ig
dXNhYmlsaXR5Cj4gYW5kIG11bHRpcGxlIGFyY2hpdGVjdHVyZSBoYXZlIGl0IGV2ZW4gd2l0aCBq
dXN0IENNRExJTkUgYXMgSSB3YXMgY29tbWVudGluZwo+IGhlcmUuCj4gCgpBbW9uZyB0aGUgMTMg
YXJjaGl0ZWN0dXJlcyBoYXZpbmcgQ09ORklHX0NNRExJTkUsIHRvZGF5YiBvbmx5IDYgaGF2ZSBh
IENPTkZJR19DTURMSU5FX0JPT0wgaW4gYWRkaXRpb246CgphcmNoL2FybS9LY29uZmlnOmNvbmZp
ZyBDTURMSU5FCmFyY2gvYXJtNjQvS2NvbmZpZzpjb25maWcgQ01ETElORQphcmNoL2hleGFnb24v
S2NvbmZpZzpjb25maWcgQ01ETElORQphcmNoL21pY3JvYmxhemUvS2NvbmZpZzpjb25maWcgQ01E
TElORQphcmNoL21pcHMvS2NvbmZpZy5kZWJ1Zzpjb25maWcgQ01ETElORQphcmNoL25pb3MyL0tj
b25maWc6Y29uZmlnIENNRExJTkUKYXJjaC9vcGVucmlzYy9LY29uZmlnOmNvbmZpZyBDTURMSU5F
CmFyY2gvcG93ZXJwYy9LY29uZmlnOmNvbmZpZyBDTURMSU5FCmFyY2gvcmlzY3YvS2NvbmZpZzpj
b25maWcgQ01ETElORQphcmNoL3NoL0tjb25maWc6Y29uZmlnIENNRExJTkUKYXJjaC9zcGFyYy9L
Y29uZmlnOmNvbmZpZyBDTURMSU5FCmFyY2gveDg2L0tjb25maWc6Y29uZmlnIENNRExJTkUKYXJj
aC94dGVuc2EvS2NvbmZpZzpjb25maWcgQ01ETElORQoKYXJjaC9taWNyb2JsYXplL0tjb25maWc6
Y29uZmlnIENNRExJTkVfQk9PTAphcmNoL21pcHMvS2NvbmZpZy5kZWJ1Zzpjb25maWcgQ01ETElO
RV9CT09MCmFyY2gvbmlvczIvS2NvbmZpZzpjb25maWcgQ01ETElORV9CT09MCmFyY2gvc3BhcmMv
S2NvbmZpZzpjb25maWcgQ01ETElORV9CT09MCmFyY2gveDg2L0tjb25maWc6Y29uZmlnIENNRExJ
TkVfQk9PTAphcmNoL3h0ZW5zYS9LY29uZmlnOmNvbmZpZyBDTURMSU5FX0JPT0wKCgpJbiB0aGUg
YmVnaW5pbmcgSSBoZXNpdGF0ZWQgYWJvdXQgdGhlIENNRExJTkVfQk9PTCwgYXQgdGhlIGVuZCBJ
IGRlY2lkZWQgdG8gZ28gdGhlIHNhbWUgd2F5IGFzIHdoYXQgCmlzIGRvbmUgdG9kYXkgaW4gdGhl
IGtlcm5lbCBmb3IgaW5pdHJhbWZzIHdpdGggQ09ORklHX0lOSVRSQU1GU19TT1VSQ0UuCgpUaGUg
cHJvYmxlbSBJIHNlZSB3aXRoaW4gYWRkaW5nIENPTkZJR19DTURMSU5FX0JPT0wgZm9yIGV2ZXJ5
IGFyY2hpdGVjdHVyZSB3aGljaCBkb24ndCBoYXZlIGl0IHRvZGF5IAppcyB0aGF0IHdoZW4gZG9p
bmcgYSAibWFrZSBvbGRjb25maWciIG9uIHRoZWlyIGN1c3RvbSBjb25maWdzLCB0aG91c2FuZHMg
b2YgdXNlcnMgd2lsbCBsb29zZSB0aGVpciAKQ01ETElORSB3aXRob3V0IG5vdGljZS4KCldoZW4g
d2UgZG8gdGhlIG90aGVyIHdheSByb3VuZCwgcmVtb3ZpbmcgQ09ORklHX0NNRExJTkVfQk9PTCBv
biB0aGUgNiBhcmNoaXRlY3R1cmVzIHRoYXQgaGF2ZSBpdCAKdG9kYXkgd2lsbCBoYXZlIG5vIGlt
cGFjdCBvbiBleGlzdGluZyBjb25maWcuCgpBbHNvLCBpbiBvcmRlciB0byBhdm9pZCB0b25zIG9m
ICNpZmRlZnMgaW4gdGhlIGNvZGUgYXMgbWFuZGF0ZWQgYnkgS2VybmVsIENvZHlpbmcgU3R5bGUg
wqcyMSwgd2UgaGF2ZSAKdG8gaGF2ZSBDT05GSUdfQ01ETElORSBkZWZpbmVkIGF0IGFsbCB0aW1l
LCBzbyBhdCB0aGUgZW5kIENPTkZJR19DTURMSU5FX0JPT0wgaXMgcmVhbGx5IHJlZHVuZGFudCAK
d2l0aCBhbiBlbXB0eSBDT05GSUdfQ01ETElORS4KClVubGlrZSB5b3UsIHRoZSBhcHByb2FjaCBJ
IHRvb2sgZm9yIG15IHNlcmllcyBpcyB0byBtaW5pbWlzZSB0aGUgaW1wYWN0IG9uIGV4aXN0aW5n
IGltcGxlbWVudGF0aW9uIAphbmQgZXhpc3RpbmcgY29uZmlndXJhdGlvbnMgYXMgbXVjaCBhcyBw
b3NzaWJsZS4KCkkga25vdyB5b3UgaGF2ZSBhIGRpZmZlcmVudCBhcHByb2FjaCB3aGVyZSB5b3Ug
YnJlYWsgZXZlcnkgZXhpc3RpbmcgY29uZmlnIGFueXdheS4KCmh0dHBzOi8vd3d3Lmtlcm5lbC5v
cmcvZG9jL2h0bWwvbGF0ZXN0L3Byb2Nlc3MvY29kaW5nLXN0eWxlLmh0bWwjY29uZGl0aW9uYWwt
Y29tcGlsYXRpb24KCkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
