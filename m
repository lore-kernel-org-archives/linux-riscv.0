Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57296C25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 21:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DapurKndXoE7hGhDCGa+oCPFeI89KZKwHkZxbURIESw=; b=In/LDyhlCBXhrT
	B7vjeb4Ps5rasFZWfeGRhyz1Wx1A82S8GI6nps4fUJCDjz8QLoyIBtqWzkpKtyXOPdWDSzy640/WI
	bE7Ducpy9o36UKuGLlvlMLJjEQmc08V1fbRAUy10oJ8Gb6N7+QIe7FOZpei8Od1Z1LpSxg7lGH0ez
	pPw4qegoUj5eNFMw0UsE+LxnMXbnKz2lr/S2Te8pfWp5h2Hnmo1ksH6jP1Sknhzc+qzGW/wo4xZ4M
	Qw0FkrEjepOGuyvJ95C5cTFZw0gjqqvXVU9xzYgIw9cyIlBlBontkNJnk0gH6JXgCy6LQgzUgEe73
	beiSLN8GMiw63z+CEZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO3lH-00700N-LP; Tue, 16 Aug 2022 21:06:07 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO3lC-006zuy-5v
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 21:06:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id j7so14040710wrh.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 14:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=2f/85arcP0Ku1kgJpVBVLo1xiYoiCycNRFXo4qwF5Xo=;
        b=j7RxzFnx4NHVX9l/AUFSE1Ml0ekwRXfROWEusMchscf8rtR5xzICK5XqQg9YnaBef6
         vas7FGeF58leFjCuB8JbsTZQErXoYTFytYrpPtfMRS5SjO3jzosSw4LFkOK4+S0kEnn4
         A3qPH3JygQkCXgx0/19Rn4qpL3FwvyX1sEmBKk0leIkDA07Aas1KIRnzYICGSfwJmV6f
         N9YNnjYP7L+NG6sZNIHEzd9C/zb/VB1MnHqW1A5ZizhZ5w6YH0+C9g2xDalyRK5CkWeb
         aZ0XcFuaKpQYrTdJrxvIFqpQ5BEch3wm2afPlk4467jq2snOOaXSB0LuFTSZYQCP2oNo
         Jdgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=2f/85arcP0Ku1kgJpVBVLo1xiYoiCycNRFXo4qwF5Xo=;
        b=TgMvCGO0zZm3RrmAuHDqmDh3tRCf/pJOrE/7AkBhSpF5ltJ6vlzKH1hXRe78dVOGdJ
         UJ+kSKvTSBCXDu0UtDPvdD2X9iJk694XdEkF9K+ndfAjgGuQi/epLGgIFeVUsS7vrVVa
         ASAPmoK+gWtueoeQy2gVTSgF8UC/uB/LvoTaeTsNMYShbKR0Nj8CZbzYxLX8hB0z95y4
         eP6CSz709OG6QYeCXz8srduaLUqz/jNMVO4RVQSid+HpLyqgfZwnDmBsc5qnWyytRcGr
         JamH6228brQ8W+xeSTZFMfiUtreKqa5y2jh+MLi/gKrzVLerLmzOo4tZ/zwBmLSeUD0S
         T0XQ==
X-Gm-Message-State: ACgBeo3DCurnqdTBAWFmQXF8WTXb1674ehNi8kPhqly+ZJu4T5THbvT5
	lbUHvZ5Fci4A47WOrRhSQRPMXA==
X-Google-Smtp-Source: AA6agR58u8cM3dGXK/53eWyziPV3maDwklbC3ReiAvrslrsNxTN31+j/21RFXv2OwnjVFyzyeoSp5Q==
X-Received: by 2002:adf:fb4c:0:b0:225:2033:b745 with SMTP id c12-20020adffb4c000000b002252033b745mr1296556wrs.447.1660683957068;
        Tue, 16 Aug 2022 14:05:57 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d490f000000b002205a5de337sm10889363wrq.102.2022.08.16.14.05.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Aug 2022 14:05:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v2 1/6] dt-bindings: PCI: fu740-pci: fix missing
 clock-names
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220816182547.3454843-2-mail@conchuod.ie>
Date: Tue, 16 Aug 2022 22:05:55 +0100
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Message-Id: <F62BE8A7-2023-497B-9BBC-AE54E7C5B08A@jrtc27.com>
References: <20220816182547.3454843-1-mail@conchuod.ie>
 <20220816182547.3454843-2-mail@conchuod.ie>
To: Conor Dooley <mail@conchuod.ie>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_140602_267318_A62E9285 
X-CRM114-Status: GOOD (  23.66  )
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

T24gMTYgQXVnIDIwMjIsIGF0IDE5OjI1LCBDb25vciBEb29sZXkgPG1haWxAY29uY2h1b2QuaWU+
IHdyb3RlOgo+IAo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5j
b20+Cj4gCj4gVGhlIGNvbW1pdCBiOTIyMjViMDM0YzAgKCJkdC1iaW5kaW5nczogUENJOiBkZXNp
Z253YXJlOiBGaXgKPiAndW5ldmFsdWF0ZWRQcm9wZXJ0aWVzJyB3YXJuaW5ncyIpIHJlbW92ZWQg
dGhlIGNsb2NrLW5hbWVzIHByb3BlcnR5IGFzCj4gYSByZXF1aXJlbWVudCBhbmQgZnJvbSB0aGUg
ZXhhbXBsZSBhcyBpdCB0cmlnZ2VyZWQgdW5ldmFsdWF0ZWRQcm9wZXJ0eQo+IHdhcm5pbmdzLiBk
dGJzX2NoZWNrIHdhcyBub3QgYWJsZSB0byBwaWNrIHVwIG9uIHRoaXMgYXQgdGhlIHRpbWUsIGJ1
dAo+IG5vdyBjYW46Cj4gCj4gYXJjaC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0
Y2hlZC1hMDAuZHRiOiBwY2llQGUwMDAwMDAwMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUg
bm90IGFsbG93ZWQgKCdjbG9jay1uYW1lcycgd2FzIHVuZXhwZWN0ZWQpCj4gICAgICAgIEZyb20g
c2NoZW1hOiBsaW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3NpZml2
ZSxmdTc0MC1wY2llLnlhbWwKPiAKPiBUaGUgcHJvcGVydHkgd2FzIGFscmVhZHkgaW4gdXNlIGJ5
IHRoZSBGVTc0MCBEVFMgYW5kIHRoZSBjbG9jayBtdXN0IGJlCj4gZW5hYmxlZC4gVGhlIExpbnV4
IGRyaXZlciBkb2VzIG5vdCB1c2UgdGhpcyBwcm9wZXJ0eSwgYnV0IG91dHNpZGUgb2YKPiB0aGUg
a2VybmVsIHRoaXMgcHJvcGVydHkgbWF5IGhhdmUgdXNlcnMuIFJlLWFkZCB0aGUgcHJvcGVydHkg
YW5kIGl0cwo+ICJjbG9ja3MiIGRlcGVuZGVuY3kuCgpBcmUgeW91IHN1cmUgYWJvdXQgdGhpcz8g
SSBzZWUgYSBkZXZtX2Nsa19nZXQoInBjaWVfYXV4IikgdGhhdCBzdXJlbHkKd29uJ3Qgd2l0aG91
dCB0aGUgcHJvcGVydHkuIEZyZWVCU0TigJlzIHNpbWlsYXJseSByZWxpZXMgb24gdGhlIG5hbWUs
CnRob3VnaCBpdCBhbHNvIGhhcyBhIGZhbGxiYWNrIHRvIHRoZSBVLUJvb3QgcGNpZWF1eCBuYW1l
IChiZWNhdXNlIHRoZQp3b3JsZCBpcyB0ZXJyaWJsZSBhbmQgcGVvcGxlIGNhbuKAmXQgZXZlbiBh
Z3JlZSBvbiB0aGF0KSBzbyBpdCB3b3Jrcwp3aXRoIHRoZSBVLUJvb3QtcHJvdmlkZWQgRkRUIChp
dCB3b3VsZCBiZSBuaWNlIGlmIExpbnV4IGhhZCB0aGlzIGFzIGEKZ29hbCwgYW5kIHBlb3BsZSB3
b3JrZWQgd2l0aCBVLUJvb3QgZGV2cyB0byBnZXQgZXZlcnl0aGluZyBuZWVkZWQgZm9yCm5ld2x5
LWV4cG9zZWQgZGV2aWNlcyBtZXJnZWQgYmFjayB0aGVyZSBzbyBJIGRvbuKAmXQgaGF2ZSB0byBi
ZSB0aGUgb25lCnRvIG5vdGljZSBhbmQgZG8gaXQuLi4pLgoKSmVzcwoKPiBGaXhlczogYjkyMjI1
YjAzNGMwICgiZHQtYmluZGluZ3M6IFBDSTogZGVzaWdud2FyZTogRml4ICd1bmV2YWx1YXRlZFBy
b3BlcnRpZXMnIHdhcm5pbmdzIikKPiBGaXhlczogNDNjZWExMTZiZTBiICgiZHQtYmluZGluZ3M6
IFBDSTogQWRkIFNpRml2ZSBGVTc0MCBQQ0llIGhvc3QgY29udHJvbGxlciIpCj4gU2lnbmVkLW9m
Zi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiAtLS0KPiB2
MjAyMi4wOCBvZiBkdC1zY2hlbWEgaXMgcmVxdWlyZWQuCj4gLS0tCj4gLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvcGNpL3NpZml2ZSxmdTc0MC1wY2llLnlhbWwgICAgICAgICAgfCA2ICsrKysrKwo+
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zaWZpdmUsZnU3NDAtcGNpZS55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zaWZpdmUsZnU3NDAtcGNpZS55
YW1sCj4gaW5kZXggMTk1ZTZhZmViMTY5Li5jN2E5YTJkYzBmYTYgMTAwNjQ0Cj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zaWZpdmUsZnU3NDAtcGNpZS55YW1s
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9zaWZpdmUsZnU3
NDAtcGNpZS55YW1sCj4gQEAgLTUxLDYgKzUxLDEyIEBAIHByb3BlcnRpZXM6Cj4gICAgIGRlc2Ny
aXB0aW9uOiBBIHBoYW5kbGUgdG8gdGhlIFBDSWUgcG93ZXIgdXAgcmVzZXQgbGluZS4KPiAgICAg
bWF4SXRlbXM6IDEKPiAKPiArICBjbG9ja3M6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBj
bG9jay1uYW1lczoKPiArICAgIGNvbnN0OiBwY2llX2F1eAo+ICsKPiAgIHB3cmVuLWdwaW9zOgo+
ICAgICBkZXNjcmlwdGlvbjogU2hvdWxkIHNwZWNpZnkgdGhlIEdQSU8gZm9yIGNvbnRyb2xsaW5n
IHRoZSBQQ0kgYnVzIGRldmljZSBwb3dlciBvbi4KPiAgICAgbWF4SXRlbXM6IDEKPiAtLSAKPiAy
LjM3LjEKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
