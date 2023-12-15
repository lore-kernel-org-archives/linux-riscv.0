Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C768BC4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 20:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKOfYLfIVHaogIDBuXLK2XGIzGtWIsrvtJI2Ymjxz8g=; b=dIwmP5qNh2/bzd
	f4vmN+MKS3H94yMyUYOJUTtao8PJ5Qej/hxo99fWWNYhxUYaGMlngsDId9XQmrNAaSJzarP2lI7x6
	sE8gZ96Jff3RrFLmMWrwOl/Hfa0oHS+xuFfgqwQidWrgeDvfbDHxT2tD7JJIMA/5+0MN/c3k1LXpE
	GbVqs5drs7tUK0ZOuUv6tKGeBxsA962dkk+Kbm+5NpmXBvl38E2DXy/fXSkUHG2LVgvRfbho9x3ks
	ADVtmLs6TZBDl3tWEQFnXp8iz9rq3xveswvy3qupGjbPS4W74xNBR70EIX+wDJbWEYhvSznNZA7Ls
	tveQqGYfLzWZrEpJm8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEFF1-004XzQ-0I;
	Fri, 15 Dec 2023 20:57:03 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEFEx-004Xyo-2W;
	Fri, 15 Dec 2023 20:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702673818;
	bh=llzOJtxbkH31ZdRai4uKosxuCv2h8SX3YoPj7mI7JtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4kW0X2uhqogD19NjUBIqkwvrcTnDHeRo2eT4VKcg8nrVYlMVtXeQFz7QLnJS6fNRc
	 jG+6SL6EOqe5B7tG+vwIz9WiEA7wm2g31zNmD+ff3WO45KF5qH4W6KTyZBRvC/qq5O
	 NGqHr5yZ/jJ0Rphill5GVsz8ve5swsoJW7OuZfDdZBa+eakXmSqzndVYYWaywPO5mj
	 O4vRCR4Vf/PID9hCg+euDIPFeoZVPEYOkKTpLBjt7acfgpA80jLC3r4ZBvs9XlTb4z
	 AJkLkF6qJuaoWZy3TMFftwDoV/T3QWuOGLGAQsw3EIgZl9wxPJGMIBGUJRtmhjq+93
	 Z8ropt8cC3HHQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4261B3781FD5;
	Fri, 15 Dec 2023 20:56:56 +0000 (UTC)
Message-ID: <491f1a89-aabd-4c38-b33a-a298add1bdb3@collabora.com>
Date: Fri, 15 Dec 2023 22:56:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: net: starfive,jh7110-dwmac: Add
 JH7100 SoC compatible
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, netdev@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20231215204050.2296404-1-cristian.ciocaltea@collabora.com>
 <20231215204050.2296404-3-cristian.ciocaltea@collabora.com>
 <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <A7C96942-07CB-40FD-AAAA-4A8947DEE7CA@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_125659_949905_35EE29F8 
X-CRM114-Status: GOOD (  14.98  )
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

T24gMTIvMTUvMjMgMjI6NDcsIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgo+IE9uIDE1IERlYyAyMDIz
LCBhdCAyMDo0MCwgQ3Jpc3RpYW4gQ2lvY2FsdGVhIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFi
b3JhLmNvbT4gd3JvdGU6Cj4+Cj4+IFRoZSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1BQyBmb3VuZCBv
biBTdGFyRml2ZSBKSDcxMDAgU29DIGlzIG1vc3RseQo+PiBzaW1pbGFyIHRvIHRoZSBuZXdlciBK
SDcxMTAsIGJ1dCBpdCByZXF1aXJlcyBvbmx5IHR3byBpbnRlcnJ1cHRzIGFuZCBhCj4+IHNpbmds
ZSByZXNldCBsaW5lLCB3aGljaCBpcyAnYWhiJyBpbnN0ZWFkIG9mIHRoZSBjb21tb25seSB1c2Vk
Cj4+ICdzdG1tYWNldGgnLgo+Pgo+PiBTaW5jZSB0aGUgY29tbW9uIGJpbmRpbmcgJ3NucHMsZHdt
YWMnIGFsbG93cyBzZWxlY3RpbmcgJ2FoYicgb25seSBpbgo+PiBjb25qdW5jdGlvbiB3aXRoICdz
dG1tYWNldGgnLCBleHRlbmQgdGhlIGxvZ2ljIHRvIGFsc28gcGVybWl0IGV4Y2x1c2l2ZQo+PiB1
c2FnZSBvZiB0aGUgJ2FoYicgcmVzZXQgbmFtZS4gIFRoaXMgZW5zdXJlcyB0aGUgZm9sbG93aW5n
IHVzZSBjYXNlcyBhcmUKPj4gc3VwcG9ydGVkOgo+Pgo+PiAgSkg3MTEwOiByZXNldC1uYW1lcyA9
ICJzdG1tYWNldGgiLCAiYWhiIjsKPj4gIEpINzEwMDogcmVzZXQtbmFtZXMgPSAiYWhiIjsKPj4g
IG90aGVyOiAgcmVzZXQtbmFtZXMgPSAic3RtbWFjZXRoIjsKPj4KPj4gQWxzbyBub3RlIHRoZSBu
ZWVkIHRvIHVzZSBhIGRpZmZlcmVudCBkd21hYyBmYWxsYmFjaywgYXMgdjUuMjAgYXBwbGllcwo+
PiB0byBKSDcxMTAgb25seSwgd2hpbGUgSkg3MTAwIHJlbGllcyBvbiB2My43eC4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogQ3Jpc3RpYW4gQ2lvY2FsdGVhIDxjcmlzdGlhbi5jaW9jYWx0ZWFAY29sbGFi
b3JhLmNvbT4KPj4gLS0tCj4+IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFj
LnlhbWwgICB8ICAzICstCj4+IC4uLi9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFj
LnlhbWwgICB8IDc0ICsrKysrKysrKysrKystLS0tLS0KPj4gMiBmaWxlcyBjaGFuZ2VkLCA1NSBp
bnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPj4gaW5kZXggNWMy
NzY5ZGM2ODlhLi5jMTM4MGZmMWMwNTQgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4+IEBAIC05NSw2ICs5
NSw3IEBAIHByb3BlcnRpZXM6Cj4+ICAgICAgICAgLSBzbnBzLGR3bWFjLTUuMjAKPj4gICAgICAg
ICAtIHNucHMsZHd4Z21hYwo+PiAgICAgICAgIC0gc25wcyxkd3hnbWFjLTIuMTAKPj4gKyAgICAg
ICAgLSBzdGFyZml2ZSxqaDcxMDAtZHdtYWMKPj4gICAgICAgICAtIHN0YXJmaXZlLGpoNzExMC1k
d21hYwo+Pgo+PiAgIHJlZzoKPj4gQEAgLTE0Niw3ICsxNDcsNyBAQCBwcm9wZXJ0aWVzOgo+PiAg
IHJlc2V0LW5hbWVzOgo+PiAgICAgbWluSXRlbXM6IDEKPj4gICAgIGl0ZW1zOgo+PiAtICAgICAg
LSBjb25zdDogc3RtbWFjZXRoCj4+ICsgICAgICAtIGVudW06IFtzdG1tYWNldGgsIGFoYl0KPj4g
ICAgICAgLSBjb25zdDogYWhiCj4gCj4gSeKAmW0gbm90IHNvIHdlbGwtdmVyc2VkIGluIHRoZSBZ
QU1MIGJpbmRpbmdzLCBidXQgd291bGQgdGhpcyBub3QgYWxsb3cKPiByZXNldC1uYW1lcyA9ICJh
aGIiLCAiYWhiIj8KClllcywgYXMgSSBhbHJlYWR5IHBvaW50ZWQgb3V0IGluIFsxXSwgSSB3YXNu
J3QgYWJsZSB0byBjb21lIHVwIHdpdGggYQpwcm9wZXIgc29sdXRpb24gdG8gYXZvaWQgdGhhdC4K
ClRoYW5rcywKQ3Jpc3RpYW4KCj4gSmVzcwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
