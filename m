Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A181C197A0
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlnLIbWGAVjbX/B1NKocFUTg8/dq1HxY9g76lr718ew=; b=RZ6p+ZupApPyFS
	XPkTQeVWlQwl4lczCZXPVWF2n1o9EkhCAhpkr6+SgLtWGtczgphITzPeWmoY/kfDCdkVncjqMsiMZ
	OKvF6OUQLFXCJV+Spfe8GLnnudPHJxZoEmFVPJIeNKNV8Jo1TUjbUic8gYlaRWkQriWyGgaRX9aOx
	GFlJQGr9CdKN9aUy3+0uCrv+VGAPQngsHK6YRXV79tMZOglq4z9C0/gqnDbcjiT6iL7C7bCSghwGd
	Qg27azIjyRc+mf2ewhxZE70oG/VNXNVDi4Tw8fo8CxEp7Sl7ydRziqQajHMqDAnS0rBFEU0nnYcQb
	9/UJ5QkUzaN816QfaZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ugt-0060Jz-2n;
	Fri, 17 Nov 2023 08:59:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ugq-0060Ia-0E;
	Fri, 17 Nov 2023 08:59:05 +0000
Received: from [100.116.17.117] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBE37660738B;
	Fri, 17 Nov 2023 08:59:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700211542;
	bh=mSTx9zqrnn7lEW3vy1lR7oqBFFa9rnmtFZ28Q6NNZVo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=DbdkWOd67zaj48dorFbegWDEOnLilRSxAU8IMF9PEe0F3jKz8ilpktpVWopTE3fH+
	 5Z87CfSU9O3WNHKZW1ItpEkyMx4Ya7uIPxvq4JzuvwCpqqGR2xICYIKyKf1Qlo3UZs
	 eHpvZ9Hw4p980MVZBsRw355Ten8C4Y948Fco6COVodqFW/wI7R2leK+kCER69RAtCM
	 2GyK6AJNfeOSlYC8tSxMrpviinpmOomwJMxHYYu53j+MA82eIJmlfjhSJ7XaobvyzB
	 K8rub3V9G4grfYMtnn1FYWe0TSHBEwawSS9QEYcFMtfaGhp/D5BsdXknVUeoEMLAgD
	 ExQE65vA9LPbQ==
Message-ID: <84fd076b-6db4-4251-aff8-36befc28e574@collabora.com>
Date: Fri, 17 Nov 2023 10:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] [UNTESTED] riscv: dts: starfive:
 beaglev-starlight: Enable gmac
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
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
In-Reply-To: <b4a3a139-4831-447e-94ed-d590986aed8c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_005904_242530_2427B0CB 
X-CRM114-Status: GOOD (  19.76  )
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

T24gMTEvMTcvMjMgMTA6NDksIENyaXN0aWFuIENpb2NhbHRlYSB3cm90ZToKPiBPbiAxMS8xNy8y
MyAxMDozNywgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+PiBPbiBUaHUsIE5vdiAxNiwgMjAy
MyBhdCA2OjU14oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPj4+
IE9uIFRodSwgTm92IDE2LCAyMDIzIGF0IDAzOjE1OjQ2UE0gKzAyMDAsIENyaXN0aWFuIENpb2Nh
bHRlYSB3cm90ZToKPj4+PiBPbiAxMC8zMC8yMyAwMDo1MywgQ3Jpc3RpYW4gQ2lvY2FsdGVhIHdy
b3RlOgo+Pj4+PiBPbiAxMC8yOS8yMyAyMDo0NiwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4+Pj4+PiBP
biBTdW4sIE9jdCAyOSwgMjAyMyBhdCAwNjoyNzoxMkFNICswMjAwLCBDcmlzdGlhbiBDaW9jYWx0
ZWEgd3JvdGU6Cj4+Pj4+Pj4gVGhlIEJlYWdsZVYgU3RhcmxpZ2h0IFNCQyB1c2VzIGEgTWljcm9j
aGlwIEtTWjkwMzFSTlhDQSBQSFkgc3VwcG9ydGluZwo+Pj4+Pj4+IFJHTUlJLUlELgo+Pj4+Pj4+
Cj4+Pj4+Pj4gVE9ETzogVmVyaWZ5IGlmIG1hbnVhbCBhZGp1c3RtZW50IG9mIHRoZSBSWCBpbnRl
cm5hbCBkZWxheSBpcyBuZWVkZWQuIElmCj4+Pj4+Pj4geWVzLCBhZGQgdGhlIG1kaW8gJiBwaHkg
c3ViLW5vZGVzLgo+Pj4+Pj4KPj4+Pj4+IFBsZWFzZSBjb3VsZCB5b3UgdHJ5IHRvIGdldCB0aGlz
IHRlc3RlZC4gSXQgbWlnaHQgc2hlZCBzb21lIGxpZ2h0IG9uCj4+Pj4+PiB3aGF0IGlzIGdvaW5n
IG9uIGhlcmUsIHNpbmNlIGl0IGlzIGEgZGlmZmVyZW50IFBIWS4KPj4+Pj4KPj4+Pj4gQWN0dWFs
bHksIHRoaXMgaXMgdGhlIG1haW4gcmVhc29uIEkgYWRkZWQgdGhlIHBhdGNoLiBJIGRvbid0IGhh
dmUgYWNjZXNzCj4+Pj4+IHRvIHRoaXMgYm9hcmQsIHNvIGl0IHdvdWxkIGJlIGdyZWF0IGlmIHdl
IGNvdWxkIGdldCBzb21lIGhlbHAgd2l0aCB0ZXN0aW5nLgo+Pj4+Cj4+Pj4gQEVtaWwsIEBDb25v
cjogQW55IGlkZWEgd2hvIG1pZ2h0IGhlbHAgdXMgd2l0aCBhIHF1aWNrIHRlc3Qgb24gdGhlCj4+
Pj4gQmVhZ2xlViBTdGFybGlnaHQgYm9hcmQ/Cj4+Pgo+Pj4gSSBkb24ndCBoYXZlIG9uZSAmIEkg
YW0gbm90IHN1cmUgaWYgRW1pbCBkb2VzLiBHZWVydCAoQ0NlZCkgc2hvdWxkIGhhdmUKPj4KPj4g
SSBiZWxpZXZlIEVzbWlsIGhhcy4KPj4KPj4+IG9uZSB0aG91Z2guIElzIHRoZXJlIGEgc3BlY2lm
aWMgdGVzdCB5b3UgbmVlZCB0byBoYXZlIGRvbmU/Cj4+Cj4+IEkgZ2F2ZSBpdCBhIHRyeSwgb24g
dG9wIG9mIGxhdGVzdCByZW5lc2FzLWRyaXZlcnNbMV0uCgpbLi4uXQoKPj4KPj4gTG9va3MgbGlr
ZSBpdCBuZWVkcyBtb3JlIG5vbi1jb2hlcmVudCBzdXBwb3J0IGJlZm9yZSB3ZSBjYW4gdGVzdAo+
PiBFdGhlcm5ldC4KPiAKPiBIaSBHZWVydCwKPiAKPiBUaGFua3MgZm9yIHRha2luZyB0aGUgdGlt
ZSB0byB0ZXN0IHRoaXMhCj4gCj4gQ291bGQgeW91IHBsZWFzZSBjaGVjayBpZiB0aGUgZm9sbG93
aW5nIGFyZSBlbmFibGVkIGluIHlvdXIga2VybmVsIGNvbmZpZzoKPiAKPiAgIENPTkZJR19ETUFf
R0xPQkFMX1BPT0wKPiAgIENPTkZJR19SSVNDVl9ETUFfTk9OQ09IRVJFTlQKPiAgIENPTkZJR19S
SVNDVl9OT05TVEFOREFSRF9DQUNIRV9PUFMKPiAgIENPTkZJR19TSUZJVkVfQ0NBQ0hFCgpBbHNv
IHBsZWFzZSBub3RlIHRoZSBzZXJpZXMgcmVxdWlyZXMgdGhlIFNpRml2ZSBDb21wb3NhYmxlIENh
Y2hlIApjb250cm9sbGVyIHBhdGNoZXMgcHJvdmlkZWQgYnkgRW1pbCBbMV0uCgpbMV06IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTAzMTE0MTQ0NC41MzQyNi0xLWVtaWwucmVubmVy
LmJlcnRoaW5nQGNhbm9uaWNhbC5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
