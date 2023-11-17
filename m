Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EF7C54FB9
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 22:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYT5IghwR688ynJ+nGRDPuTgvRe9SZlgOvSHBT30XyI=; b=TxJo/7rMazPlDG
	z9/9dLeFnVY+cB7nELWzZ4nPHO9EO0qxwEIl171Wg2LxvIHf/AGapTcjtFpfNF6lyyyZo6gpwMnQq
	N3Vb+knJnvklmXIgQaXADLlg8PfZcb+sQ1NwVcmf0cPNwiasWbhW7cD/b+tr0gONCwHOLNpJC8tKG
	Fqn2Te0Td4xFFPXrNXtJyzpQmXlGihHHY39darOEBbJ91Y+qk9L4xNm7xpM9/jiGWdAoqGyv5vmfL
	o9EARHM+HU2A9e+Lthi+SwACs7qZa83N8fITMdSyupVpvQenfrEnKva3ZLMX4ZcwxHZpWB1y4SZv+
	AsaHdL36VlSxntMOCAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r47eG-007Uwl-2c;
	Fri, 17 Nov 2023 22:49:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r47eB-007Uv6-2g;
	Fri, 17 Nov 2023 22:49:13 +0000
Received: from [100.116.17.117] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D91826607392;
	Fri, 17 Nov 2023 22:49:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700261343;
	bh=0tjjKjAurRBn5zKIbePAVaEbSE3D2bVElukfuHa4ky0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=FZQKVqdj8c4YnfPf8Ln2LNSP1PEuIphRLQYbKAGWR6YfGVw1MtjOEX/wct3rVvHY1
	 SA4Ihjwc2X8BRBh/O69W4lpnlnnzwloaKupoS7dPFrBaZXvrihuVyXVJHa29VGKyOC
	 OuBVPmsy2ClqfU2zxcRpNQsjtbromviSrfF8aA/PF3gLcODKw3n1B/mbG1D01xADGx
	 h1hsLodXzXwkQYI9QaRonqclZzteXFm8ErvbEhg3rWNd6hCIvBvYfVwPLW4YvsGVKh
	 EaE+iRLu3x1gDXDtlQhJVfQvGew/L5al27uQ8WUyDkB6zBm++op7EKXhK/2KQpXDoh
	 53YJXXX+alJVw==
Message-ID: <daa8c056-0279-4c2d-9a22-2375fd63f0a1@collabora.com>
Date: Sat, 18 Nov 2023 00:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231029042712.520010-1-cristian.ciocaltea@collabora.com>
 <20231029042712.520010-13-cristian.ciocaltea@collabora.com>
 <f253b50a-a0ac-40c6-b13d-013de7bac407@lunn.ch>
 <233a45e1-15ac-40da-badf-dee2d3d60777@collabora.com>
 <cb6597be-2185-45ad-aa47-c6804ff68c85@collabora.com>
 <20231116-stellar-anguished-7cf06eb5634a@squawk>
 <CAMuHMdXdeW9SRN8hq-0722CiLvXDFVwpJxjFTGgdc2mhT=ppYw@mail.gmail.com>
 <b4a3a139-4831-447e-94ed-d590986aed8c@collabora.com>
 <84fd076b-6db4-4251-aff8-36befc28e574@collabora.com>
 <CAMuHMdVXAx+b6=70PdgJrpbegBkDpb3w1UF0_u1Odi=JoYL2-w@mail.gmail.com>
 <e2f4ba34-24db-4669-bac4-ac64ea7761cf@collabora.com>
In-Reply-To: <e2f4ba34-24db-4669-bac4-ac64ea7761cf@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_144912_152771_92C9D5DE 
X-CRM114-Status: GOOD (  31.54  )
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

T24gMTEvMTcvMjMgMTM6MTksIENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPiBPbiAxMS8xNy8y
MyAxMToxMiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+PiBIaSBDcmlzdGlhbiwKPj4KPj4g
T24gRnJpLCBOb3YgMTcsIDIwMjMgYXQgOTo1OeKAr0FNIENyaXN0aWFuIENpb2NhbHRlYQo+PiA8
Y3Jpc3RpYW4uY2lvY2FsdGVhQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Pj4gT24gMTEvMTcvMjMg
MTA6NDksIENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPj4+PiBPbiAxMS8xNy8yMyAxMDozNywg
R2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+Pj4+PiBPbiBUaHUsIE5vdiAxNiwgMjAyMyBhdCA2
OjU14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4+Pj4+IE9u
IFRodSwgTm92IDE2LCAyMDIzIGF0IDAzOjE1OjQ2UE0gKzAyMDAsIENyaXN0aWFuIENpb2NhbHRl
YSB3cm90ZToKPj4+Pj4+PiBPbiAxMC8zMC8yMyAwMDo1MywgQ3Jpc3RpYW4gQ2lvY2FsdGVhIHdy
b3RlOgo+Pj4+Pj4+PiBPbiAxMC8yOS8yMyAyMDo0NiwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+Pj4+
Pj4+PiBPbiBTdW4sIE9jdCAyOSwgMjAyMyBhdCAwNjoyNzoxMkFNICswMjAwLCBDcmlzdGlhbiBD
aW9jYWx0ZWEgd3JvdGU6Cj4+Pj4+Pj4+Pj4gVGhlIEJlYWdsZVYgU3RhcmxpZ2h0IFNCQyB1c2Vz
IGEgTWljcm9jaGlwIEtTWjkwMzFSTlhDQSBQSFkgc3VwcG9ydGluZwo+Pj4+Pj4+Pj4+IFJHTUlJ
LUlELgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gVE9ETzogVmVyaWZ5IGlmIG1hbnVhbCBhZGp1c3Rt
ZW50IG9mIHRoZSBSWCBpbnRlcm5hbCBkZWxheSBpcyBuZWVkZWQuIElmCj4+Pj4+Pj4+Pj4geWVz
LCBhZGQgdGhlIG1kaW8gJiBwaHkgc3ViLW5vZGVzLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFBsZWFz
ZSBjb3VsZCB5b3UgdHJ5IHRvIGdldCB0aGlzIHRlc3RlZC4gSXQgbWlnaHQgc2hlZCBzb21lIGxp
Z2h0IG9uCj4+Pj4+Pj4+PiB3aGF0IGlzIGdvaW5nIG9uIGhlcmUsIHNpbmNlIGl0IGlzIGEgZGlm
ZmVyZW50IFBIWS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQWN0dWFsbHksIHRoaXMgaXMgdGhlIG1haW4g
cmVhc29uIEkgYWRkZWQgdGhlIHBhdGNoLiBJIGRvbid0IGhhdmUgYWNjZXNzCj4+Pj4+Pj4+IHRv
IHRoaXMgYm9hcmQsIHNvIGl0IHdvdWxkIGJlIGdyZWF0IGlmIHdlIGNvdWxkIGdldCBzb21lIGhl
bHAgd2l0aCB0ZXN0aW5nLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQEVtaWwsIEBDb25vcjogQW55IGlkZWEg
d2hvIG1pZ2h0IGhlbHAgdXMgd2l0aCBhIHF1aWNrIHRlc3Qgb24gdGhlCj4+Pj4+Pj4gQmVhZ2xl
ViBTdGFybGlnaHQgYm9hcmQ/Cj4+Pj4+Pgo+Pj4+Pj4gSSBkb24ndCBoYXZlIG9uZSAmIEkgYW0g
bm90IHN1cmUgaWYgRW1pbCBkb2VzLiBHZWVydCAoQ0NlZCkgc2hvdWxkIGhhdmUKPj4+Pj4KPj4+
Pj4gSSBiZWxpZXZlIEVzbWlsIGhhcy4KPj4+Pj4KPj4+Pj4+IG9uZSB0aG91Z2guIElzIHRoZXJl
IGEgc3BlY2lmaWMgdGVzdCB5b3UgbmVlZCB0byBoYXZlIGRvbmU/Cj4+Pj4+Cj4+Pj4+IEkgZ2F2
ZSBpdCBhIHRyeSwgb24gdG9wIG9mIGxhdGVzdCByZW5lc2FzLWRyaXZlcnNbMV0uCj4+Pgo+Pj4g
Wy4uLl0KPj4+Cj4+Pj4+Cj4+Pj4+IExvb2tzIGxpa2UgaXQgbmVlZHMgbW9yZSBub24tY29oZXJl
bnQgc3VwcG9ydCBiZWZvcmUgd2UgY2FuIHRlc3QKPj4+Pj4gRXRoZXJuZXQuCj4+Pj4KPj4+PiBI
aSBHZWVydCwKPj4+Pgo+Pj4+IFRoYW5rcyBmb3IgdGFraW5nIHRoZSB0aW1lIHRvIHRlc3QgdGhp
cyEKPj4+Pgo+Pj4+IENvdWxkIHlvdSBwbGVhc2UgY2hlY2sgaWYgdGhlIGZvbGxvd2luZyBhcmUg
ZW5hYmxlZCBpbiB5b3VyIGtlcm5lbCBjb25maWc6Cj4+Pj4KPj4+PiAgIENPTkZJR19ETUFfR0xP
QkFMX1BPT0wKPj4+PiAgIENPTkZJR19SSVNDVl9ETUFfTk9OQ09IRVJFTlQKPj4+PiAgIENPTkZJ
R19SSVNDVl9OT05TVEFOREFSRF9DQUNIRV9PUFMKPj4+PiAgIENPTkZJR19TSUZJVkVfQ0NBQ0hF
Cj4+Cj4+IENPTkZJR19ETUFfR0xPQkFMX1BPT0wgYW5kIENPTkZJR19SSVNDVl9OT05TVEFOREFS
RF9DQUNIRV9PUFMgd2VyZQo+PiBpbmRlZWQgbm8gbG9uZ2VyIGVuYWJsZWQsIGFzIHRoZXkgY2Fu
bm90IGJlIGVuYWJsZWQgbWFudWFsbHkuCj4+Cj4+IEFmdGVyIGNoZXJyeS1waWNraW5nIGNvbW1p
dCBlMTRhZDlmZjY3ZmQ1MWRjICgicmlzY3Y6IGVycmF0YTogQWRkCj4+IFN0YXJGaXZlIEpINzEw
MCBlcnJhdGEiKSBpbiBlc21pbC92aXNpb25maXZlIHRoZXNlIG9wdGlvbnMgYmVjb21lCj4+IGVu
YWJsZWQuIE5vdyBpdCBnZXRzIGEgYml0IGZ1cnRoZXIsIGJ1dCBzdGlsbCBsb3RzIG9mIENDQUNI
RSBEYXRhRmFpbAo+PiBlcnJvcnMuCj4gCj4gUmlnaHQsIHRoZXJlIGlzIGFuIG9wZW4gcXVlc3Rp
b24gWzJdIGluIFBBVENIIHYyIDA4LzEyIGlmIHRoaXMgcGF0Y2gKPiBzaG91bGQgaGF2ZSBiZWVu
IHBhcnQgb2YgRW1pbCdzIGNjYWNoZSBzZXJpZXMgb3IgSSB3aWxsIHNlbmQgaXQgaW4gdjMKPiBv
ZiBteSBzZXJpZXMuCj4gCj4gWzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzRmNjYx
ODE4LTE1ODUtNDFkOC1hMzA1LTk2ZmQzNTliYzhiOEBjb2xsYWJvcmEuY29tLwo+IAo+Pj4gQWxz
byBwbGVhc2Ugbm90ZSB0aGUgc2VyaWVzIHJlcXVpcmVzIHRoZSBTaUZpdmUgQ29tcG9zYWJsZSBD
YWNoZQo+Pj4gY29udHJvbGxlciBwYXRjaGVzIHByb3ZpZGVkIGJ5IEVtaWwgWzFdLgo+Pj4KPj4+
IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMDMxMTQxNDQ0LjUzNDI2LTEt
ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbS8KPj4KPj4gVGhhdCBzZXJpZXMgZG9l
cyBub3QgY29udGFpbiBhbnkgS2NvbmZpZyBjaGFuZ2VzLCBzbyB0aGVyZSBtdXN0IGJlCj4+IG90
aGVyIG1pc3NpbmcgZGVwZW5kZW5jaWVzPwo+IAo+IFRoZXJlIHNob3VsZG4ndCBiZSBhbnkgYWRk
aXRpb25hbCBLY29uZmlnIGNoYW5nZXMgb3IgZGVwZW5kZW5jaWVzIGFzIAo+IHRob3NlIHBhdGNo
ZXMganVzdCBleHRlbmQgYW4gYWxyZWFkeSBleGlzdGluZyBkcml2ZXIuIFRoZXJlIHdlcmUgc29t
ZSAKPiBjaGFuZ2VzIGluIHYyLCBidXQgdGhleSBhcmUgc3RpbGwgY29tcGF0aWJsZSB3aXRoIHRo
aXMgc2VyaWVzIChJJ3ZlIAo+IHJldGVzdGVkIHRoYXQgdG8gbWFrZSBzdXJlKS4KPiAKPiBNeSB0
cmVlIGlzIGJhc2VkIG9uIG5leHQtMjAyMzEwMjQsIHNvIEknbSBnb2luZyB0byByZWJhc2UgaXQg
b250bwo+IG5leHQtMjAyMzExMTcsIHRvIGV4Y2x1ZGUgdGhlIHBvc3NpYmlsaXR5IG9mIGEgcmVn
cmVzc2lvbiBzb21ld2hlcmUuCj4gCj4gSSB3aWxsIGFsc28gdGVzdCB3aXRoIHJlbmVzYXMtZHJp
dmVycy4KCkkgdmVyaWZpZWQgd2l0aCBib3RoIHRyZWVzIGFuZCBkaWRuJ3Qgbm90aWNlIGFueSBp
c3N1ZXMgd2l0aCBteSAKVmlzaW9uRml2ZSBib2FyZCwgc28gSSBkb24ndCByZWFsbHkgdW5kZXJz
dGFuZCB3aHkgQmVhZ2xlViBTdGFybGlnaHQgCnNob3dzIGEgZGlmZmVyZW50IGJlaGF2aW9yLgoK
Rm9yIHJlZmVyZW5jZSwgcGxlYXNlIHNlZSBbM10gd2hpY2ggY29udGFpbnMgYWxsIHJlcXVpcmVk
IHBhdGNoZXMgCmFwcGxpZWQgb24gdG9wIG9mIG5leHQtMjAyMzExMTcuIFRoZSB0b3AtbW9zdCBv
bmUgOWQzNmRlYzdlNmRhICgicmlzY3Y6IApkdHM6IHN0YXJmaXZlOiBBZGQgSkg3MTAwIE1NQyBu
b2RlcyIpIGlzIG9wdGlvbmFsLCBJIGFkZGVkIGl0IHRvIGV4dGVuZCAKYSBiaXQgdGhlIHRlc3Qg
c3VpdGUgKFNELWNhcmQgY2FyZCBhY2Nlc3MgYWxzbyB3b3JrcyBmaW5lKS4KClszXTogaHR0cHM6
Ly9naXRsYWIuY29sbGFib3JhLmNvbS9jcmlzdGljYy9saW51eC1uZXh0Ly0vdHJlZS92aXNpb25m
aXZlLWV0aAoKRm9yIGNvbmZpZ3VyaW5nIHRoZSBrZXJuZWwsIEkgdXNlZDoKCiAgJCBtYWtlIFsu
Li5dIGRlZmNvbmZpZwogICQgc2NyaXB0cy9jb25maWcgLS1lbmFibGUgQ09ORklHX05PTlBPUlRB
QkxFIC0tZW5hYmxlIEVSUkFUQV9TVEFSRklWRV9KSDcxMDAKCkkgYWxzbyBub3RpY2VkIGEgd2Fy
bmluZyBtZXNzYWdlIHJpZ2h0IGJlZm9yZSBidWlsZGluZyBzdGFydHMsIGJ1dCBpdCAKZG9lc24n
dCBzZWVtIHRvIGJlIGhhcm1mdWw6CgpXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVz
IGRldGVjdGVkIGZvciBETUFfR0xPQkFMX1BPT0wKICBEZXBlbmRzIG9uIFtuXTogIUFSQ0hfSEFT
X0RNQV9TRVRfVU5DQUNIRUQgWz1uXSAmJiAhRE1BX0RJUkVDVF9SRU1BUCBbPXldCiAgU2VsZWN0
ZWQgYnkgW3ldOgogIC0gRVJSQVRBX1NUQVJGSVZFX0pINzEwMCBbPXldICYmIEFSQ0hfU1RBUkZJ
VkUgWz15XSAmJiBOT05QT1JUQUJMRSBbPXldCgpUaGFua3MsCkNyaXN0aWFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
