Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B33E7AD41
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3OAE+R7rZCAJYKyASarnFpEXNi66DyCjNnAOIJeqUQ=; b=WyHGIzJtoxMFAt
	W+ElMMzLfhbYgwbqHA6rnInCkLLYeEaqC2Q4K4zVv7VMiJO0WOs3XNhrE3WEtUwAUxoxgjyHkiyZK
	6ftzz7YtwjhJc+v1jzXB1ylVrLtSaZ0DNHZQwz1MioEfFtOgC15GQOpAaSWk+FMLgiD9bgfC0V2mo
	+sZqXekQDU92xFKmAbYWHXiTsS/zhyGDTrMutoyVzqpzgmSMmIKjCU8HXZflqOLf9koX4dI0Ff55H
	dQO8uzQ5eHy8hXPotLRGvHJNLl/195wiv/9PSIZgwgBnCHqVPFzo73EF2ofRqtAx3chIFwzhbi313
	SDzdqmx8TLYxOAUB2zOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhBQ-00000000FWY-2DSH;
	Thu, 25 Dec 2025 08:58:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhBN-00000000FVg-2NGM;
	Thu, 25 Dec 2025 08:58:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D5CE4368D;
	Thu, 25 Dec 2025 08:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C857C4CEF1;
	Thu, 25 Dec 2025 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766653132;
	bh=/A+yXLh20ez+7i2+8SVOqk3ST9vTqSm2NSu9yEp1zd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P+V87cK7bn9U79Nf0tAGfZtyUU2140czUzXeGJE360fE7oeh6bd5wMGmqdgrabXyJ
	 R6Z6Ulpatmeh6LKAtKpLURsgpfUUzK5oRG6cU2xPYbnsKA/Tx6JHFg0OTp7NDVYHox
	 Frb3L8IJ7KT7ehj9sbtAWuIGh3+7RQ5vwlQ0e9GRDy7HmBdkm3r/buf5VZSdZZPJJe
	 sXI7Ti7aKe/HoAZBfRT3/PzIVfGacfFjggYBVQhydk7iyOzLqHKJZYBZojYstMH6DX
	 Z4pBE1F2watS2QaCZ7ZeDq7yEMPqFs+0v7cXoL9DgUjnAoL99STy3VqXtwiT2a5X1M
	 V/JGXSpM34cFA==
Date: Thu, 25 Dec 2025 09:58:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com, 
	conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com, 
	davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io, 
	gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de, jose@osyx.tech, 
	kever.yang@rock-chips.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux@armlinux.org.uk, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	maddy@linux.ibm.com, mani@kernel.org, nathan@kernel.org, neil.armstrong@linaro.org, 
	palmer@dabbelt.com, pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: Add Bao I/O dispatcher driver binding
Message-ID: <20251225-modest-faithful-mouflon-1c7d63@quoll>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20251224135217.25350-4-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251224135217.25350-4-joaopeixoto@osyx.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_005853_663131_4F767D75 
X-CRM114-Status: GOOD (  17.82  )
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

T24gV2VkLCBEZWMgMjQsIDIwMjUgYXQgMDE6NTI6MTVQTSArMDAwMCwgam9hb3BlaXhvdG9Ab3N5
eC50ZWNoIHdyb3RlOgo+IEZyb206IEpvw6NvIFBlaXhvdG8gPGpvYW9wZWl4b3RvQG9zeXgudGVj
aD4KPiAKPiBUaGlzIHBhdGNoIGFkZHMgYSBEZXZpY2UgVHJlZSBiaW5kaW5nIGZvciB0aGUgQmFv
IEkvTyBEaXNwYXRjaGVyIGtlcm5lbAo+IG1vZHVsZSwgd2hpY2ggY2FuIGJlIGxvYWRlZCBpbnRv
IGJhY2tlbmQgVk1zLiBUaGUgSS9PIERpc3BhdGNoZXIKPiBwcm92aWRlcyB0aGUgYnJpZGdlIGJl
dHdlZW4gdGhlIEJhbyBoeXBlcnZpc29yIFJlbW90ZSBJL08gc3lzdGVtIGFuZCB0aGUKPiBmcm9u
dGVuZCBkZXZpY2UgbW9kZWwgaW4gdXNlcnNwYWNlLCBvZmZlcmluZyBhIHVuaWZpZWQgQVBJIHRv
IHN1cHBvcnQKPiB2YXJpb3VzIFZpcnRJTyBiYWNrZW5kcy4KPiAKPiBUaGUgZGlzcGF0Y2hlciBo
YW5kbGVzIGh5cGVyY2FsbHMgdG8gdGhlIEJhbyBoeXBlcnZpc29yLCBJUlEvZXZlbnRmZAo+IGZv
cndhcmRpbmcsIGFuZCBwcm92aWRlcyBhIGNoYXJhY3RlciBkZXZpY2UgaW50ZXJmYWNlIGZvciBm
cm9udGVuZAo+IGRldmljZXMsIGVuYWJsaW5nIGVmZmljaWVudCBjb21tdW5pY2F0aW9uIGJldHdl
ZW4gdGhlIGh5cGVydmlzb3IgYW5kCj4gdXNlcnNwYWNlIGRldmljZSBtb2RlbHMuCj4gCj4gVGhl
IGJpbmRpbmcgZG9jdW1lbnRzIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoKPiAgIC0gY29tcGF0
aWJsZTogImJhbyxpby1kaXNwYXRjaGVyIgo+ICAgLSByZWc6IE1lbW9yeSByZWdpb25zIGZvciB0
aGUgZGlzcGF0Y2hlciAobXVsdGlwbGUgVmlydElPIGRldmljZXMpCj4gICAtIGludGVycnVwdHM6
IEludGVycnVwdHMgdXNlZCBieSB0aGUgZGV2aWNlcwo+ICAgLSBpbnRlcnJ1cHQtcGFyZW50OiBQ
YXJlbnQgaW50ZXJydXB0IGNvbnRyb2xsZXIKPiAKPiBUaGlzIGVuYWJsZXMga2VybmVsIGRyaXZl
cnMgdG8gY29ycmVjdGx5IGluc3RhbnRpYXRlIGFuZCBjb25maWd1cmUgQmFvCj4gSS9PIERpc3Bh
dGNoZXIgbW9kdWxlcyBiYXNlZCBvbiB0aGUgRFQgZGVzY3JpcHRpb24uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSm/Do28gUGVpeG90byA8am9hb3BlaXhvdG9Ab3N5eC50ZWNoPgo+IC0tLQo+ICAuLi4v
YmluZGluZ3MvYmFvL2lvLWRpc3BhdGNoZXIueWFtbCAgICAgICAgICAgfCA2NyArKysrKysrKysr
KysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2lvLWRpc3Bh
dGNoZXIueWFtbAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYmFvL2lvLWRpc3BhdGNoZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9iYW8vaW8tZGlzcGF0Y2hlci55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjc3OTVmNTVkM2ZmOQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYmFvL2lvLWRpc3BhdGNoZXIueWFtbAo+
IEBAIC0wLDAgKzEsNjcgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5IE9SIEJTRC0yLUNsYXVzZQo+ICslWUFNTCAxLjIKPiArLS0tCj4gKyRpZDogImh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Jhby9pby1kaXNwYXRjaGVyLnlhbWwjIgoKWW91IGRpZCBu
b3QgZXZlbiBib3RoZXIgdG8gdGVzdCBpdC4KCj4gKyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJl
ZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMiCj4gKwo+ICt0aXRsZTogQmFvIEkvTyBEaXNw
YXRjaGVyIERldmljZQo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAgLSBKb8OjbyBQZWl4b3RvIDxq
b2FvcGVpeG90b0Bvc3l4LnRlY2g+Cj4gKyAgLSBKb3PDqSBNYXJ0aW5zIDxqb3NlQG9zeXgudGVj
aD4KPiArICAtIERhdmlkIENlcmRlaXJhIDxkYXZpZG1jZXJkZWlyYUBvc3l4LnRlY2g+Cj4gKwo+
ICtkZXNjcmlwdGlvbjogfAo+ICsgIEkvTyBEaXNwYXRjaGVyIGRldmljZSBmb3IgQmFvIGh5cGVy
dmlzb3IgZ3Vlc3RzLiBIYW5kbGVzIG11bHRpcGxlIFZpcnRJTwo+ICsgIGJhY2tlbmQgZGV2aWNl
cyBhbmQgdGhlaXIgaW50ZXJydXB0cy4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJs
ZToKPiArICAgIGNvbnN0OiAiYmFvLGlvLWRpc3BhdGNoZXIiCj4gKyAgICBkZXNjcmlwdGlvbjog
RGV2aWNlIGNvbXBhdGlibGUgc3RyaW5nLgo+ICsKPiArICByZWc6Cj4gKyAgICBkZXNjcmlwdGlv
bjogfAo+ICsgICAgICBNZW1vcnkgcmVnaW9ucyBmb3IgZWFjaCBWaXJ0SU8gYmFja2VuZCBkZXZp
Y2UuCj4gKyAgICBtYXhJdGVtczogMjAKPiArICAgIHR5cGU6IGFycmF5Cj4gKyAgICBpdGVtczoK
PiArICAgICAgdHlwZTogaW50ZWdlcgoKRG9uJ3Qgc2VuZCB1cyBMTE0ganVuay4gWW91IGNhbm5v
dCBjb21lIHdpdGggc3VjaCBzeW50YXgsIGl0IGRvZXMKbm90IGV4aXN0LiBTZW5kaW5nIHN1Y2gg
TExNIG91dHB1dCBpcyBkaXNyZWdhcmQgdG8gb3VyIHRpbWUuCgpOQUsKCgpCZXN0IHJlZ2FyZHMs
CktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
