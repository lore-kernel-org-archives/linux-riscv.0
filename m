Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EB0C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 20:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqvFbNPpnGVyR7NRZxX4Y7+1V4hSBpDUhqfmIeVWUc8=; b=SyfOQ0Pkwhhz73
	Cm+TWvvNZsqlDT4pCpolYb5b7B1IOefY20v4fFpHaUSgXJcYJNWYykRWCZdHmloUgoBtg0KiqtgCD
	g3LT2ibn+qC39m06whPqHm8VCdUDM3AHmdKZkzCOlER1OOcS9DjwAiNE2AQ4UjKaFXLt/6Qlpmc+F
	HZTV3KUKmq5i/rEuv0tJgRztajg9yKIDzacioexAcaDiyAlf5lej2IVWNhn3aSOu9xT0ViJzQEp6H
	pfAyScYorZqTzMLcYS3z5L0wkP1EY2tFhExHTxbflln38j0ZgOTAeTYOpXvvmgVkRpvGBd2L6/Od0
	HfqNyUvTm4YqJ4wnN5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEF6X-004XGI-2j;
	Fri, 15 Dec 2023 20:48:17 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEF6U-004XEx-3C
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 20:48:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40c6a71e88cso13181775e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 12:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1702673290; x=1703278090; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkbA3FPlNo1r+U6O6Ao4SqV6N3qGQHbqxTmiKmAK7ww=;
        b=Ud4EUE7Ec/XboO6xQ/fcgEvKFwK9U9zbnKMy30gnDsholqPqW/7AaUFYrmUyX4p1+1
         NOzAlM0lKcsqWKg9CqavFKzn4RcOUI1L3AZowKTJUenYoxvJ1Izuc6l/EFt/POwFbykD
         sQJN0l8vva7SQdGtkLp4eWgkI5lSAGozMCZVMbvbmqfwyouBvsL6wmSCwOdc6lTZ2Nu9
         v1FEyKQCVLuLfAR290Enb4XUNwMfguS93JGVNx3hpM3ARYxPwrytc2l6sXwpALi6iS9D
         7QV3T7RW17Gfz93myx8KbPDwBWqWtVmhEYuHjglPjMgkVv5SakjRkZSAEPd5C/1akEeJ
         s74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702673290; x=1703278090;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkbA3FPlNo1r+U6O6Ao4SqV6N3qGQHbqxTmiKmAK7ww=;
        b=KTQFwFotcaB8GCPwYaSuqMWcoFOduL4MKS/iYKp0W8RIx0rnif7wW4LPpE9v2n+KEj
         gbe0fqdPuly5s3zWjxrM1GWaagPDGV5hfS+mY62Fen3iBezybLHlIPwElx/mMU0kLYcf
         1cmbjYe1Bob+3YUtCfcXpIpHZP/QBGhysFZN36ANwHvBV3i8wTRhspdmA6wHJVpKbq0Z
         mjK90VYsEpNXkp/aaDxNDwLVUZqNMZUE7/M0VGi4t/AFPc6BBUaIflkt5Wjd6IM9vM9Q
         wv5oZ8+MIaTO0K4oBB2yS5tdSPkpLzIqXzonFXDjNqaSEL8n194Z8bJr5bZkaJIBQy0P
         yrbg==
X-Gm-Message-State: AOJu0YyKJMnY+ZsNODZVWWA6NJAYOqyl8y0OtP8gJDjRTZc3rif3ffXD
	OU1h/fXLdXuBDDSK8EdvT/Makg==
X-Google-Smtp-Source: AGHT+IHmyxYXA7TlsEHSBZ2x2Q3ZtE6ks/hZmTMZ9YZV6t1R+oDgMn/QNCqxM1cqDO/CM4Y9PqXh7w==
X-Received: by 2002:a05:600c:808b:b0:40b:5e21:dd24 with SMTP id ew11-20020a05600c808b00b0040b5e21dd24mr6411929wmb.82.1702673290406;
        Fri, 15 Dec 2023 12:48:10 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c358800b0040b40468c98sm31891322wmq.10.2023.12.15.12.48.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Dec 2023 12:48:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH v3 2/9] dt-bindings: net: starfive,jh7110-dwmac: Add
 JH7100 SoC compatible
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
Date: Fri, 15 Dec 2023 20:47:58 +0000
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 netdev@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Message-Id: <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_124815_066269_EF78E1D0 
X-CRM114-Status: GOOD (  17.01  )
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

T24gMTUgRGVjIDIwMjMsIGF0IDIwOjQwLCBDcmlzdGlhbiBDaW9jYWx0ZWEgPGNyaXN0aWFuLmNp
b2NhbHRlYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPiAKPiBUaGUgU3lub3BzeXMgRGVzaWduV2Fy
ZSBNQUMgZm91bmQgb24gU3RhckZpdmUgSkg3MTAwIFNvQyBpcyBtb3N0bHkKPiBzaW1pbGFyIHRv
IHRoZSBuZXdlciBKSDcxMTAsIGJ1dCBpdCByZXF1aXJlcyBvbmx5IHR3byBpbnRlcnJ1cHRzIGFu
ZCBhCj4gc2luZ2xlIHJlc2V0IGxpbmUsIHdoaWNoIGlzICdhaGInIGluc3RlYWQgb2YgdGhlIGNv
bW1vbmx5IHVzZWQKPiAnc3RtbWFjZXRoJy4KPiAKPiBTaW5jZSB0aGUgY29tbW9uIGJpbmRpbmcg
J3NucHMsZHdtYWMnIGFsbG93cyBzZWxlY3RpbmcgJ2FoYicgb25seSBpbgo+IGNvbmp1bmN0aW9u
IHdpdGggJ3N0bW1hY2V0aCcsIGV4dGVuZCB0aGUgbG9naWMgdG8gYWxzbyBwZXJtaXQgZXhjbHVz
aXZlCj4gdXNhZ2Ugb2YgdGhlICdhaGInIHJlc2V0IG5hbWUuICBUaGlzIGVuc3VyZXMgdGhlIGZv
bGxvd2luZyB1c2UgY2FzZXMgYXJlCj4gc3VwcG9ydGVkOgo+IAo+ICBKSDcxMTA6IHJlc2V0LW5h
bWVzID0gInN0bW1hY2V0aCIsICJhaGIiOwo+ICBKSDcxMDA6IHJlc2V0LW5hbWVzID0gImFoYiI7
Cj4gIG90aGVyOiAgcmVzZXQtbmFtZXMgPSAic3RtbWFjZXRoIjsKPiAKPiBBbHNvIG5vdGUgdGhl
IG5lZWQgdG8gdXNlIGEgZGlmZmVyZW50IGR3bWFjIGZhbGxiYWNrLCBhcyB2NS4yMCBhcHBsaWVz
Cj4gdG8gSkg3MTEwIG9ubHksIHdoaWxlIEpINzEwMCByZWxpZXMgb24gdjMuN3guCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ3Jpc3RpYW4gQ2lvY2FsdGVhIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFi
b3JhLmNvbT4KPiAtLS0KPiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55
YW1sICAgfCAgMyArLQo+IC4uLi9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlh
bWwgICB8IDc0ICsrKysrKysrKysrKystLS0tLS0KPiAyIGZpbGVzIGNoYW5nZWQsIDU1IGluc2Vy
dGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4gaW5kZXggNWMyNzY5ZGM2
ODlhLi5jMTM4MGZmMWMwNTQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+IEBAIC05NSw2ICs5NSw3IEBAIHBy
b3BlcnRpZXM6Cj4gICAgICAgICAtIHNucHMsZHdtYWMtNS4yMAo+ICAgICAgICAgLSBzbnBzLGR3
eGdtYWMKPiAgICAgICAgIC0gc25wcyxkd3hnbWFjLTIuMTAKPiArICAgICAgICAtIHN0YXJmaXZl
LGpoNzEwMC1kd21hYwo+ICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtZHdtYWMKPiAKPiAgIHJl
ZzoKPiBAQCAtMTQ2LDcgKzE0Nyw3IEBAIHByb3BlcnRpZXM6Cj4gICByZXNldC1uYW1lczoKPiAg
ICAgbWluSXRlbXM6IDEKPiAgICAgaXRlbXM6Cj4gLSAgICAgIC0gY29uc3Q6IHN0bW1hY2V0aAo+
ICsgICAgICAtIGVudW06IFtzdG1tYWNldGgsIGFoYl0KPiAgICAgICAtIGNvbnN0OiBhaGIKCkni
gJltIG5vdCBzbyB3ZWxsLXZlcnNlZCBpbiB0aGUgWUFNTCBiaW5kaW5ncywgYnV0IHdvdWxkIHRo
aXMgbm90IGFsbG93CnJlc2V0LW5hbWVzID0gImFoYiIsICJhaGIiPwoKSmVzcwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
