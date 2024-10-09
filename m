Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5B0CEE32F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 16:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EhkaSzjh4TgiREdFJ+LFr+OncOIpTY0LTWiKuS3BUqw=; b=UKt7P3aeWBdfVG
	vMPnt7Pni855Bdb9/r34O6g+EXamq9SzwFnczS99ri4qPn00+tA8R1vePEeqAZV/EnlDgJmH9KYOa
	fiq4v2zpgfhGPHThqYZh7kE973eFU4/90aTm+zesdNiUjdk+Sc4wfOxTaMAsSxgFbBOPekFua+T3V
	hv5Vswp0K9vz1Mq0ZK7Xerc3Yd/JqSv8+QZ371jSpN0F0pyR5juCwi1AZrPT9uScreF58yk/wNylh
	69CR6o9ZQvw3DQO8lpO7mqI59JWABdhI91Co32PfJ9zqdH8dee+virmweufDpUhHNlk4+ASKViazB
	RcibBCa+XFXRethSLShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZUk-00000009wpI-1gmQ;
	Wed, 09 Oct 2024 16:25:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZJ1-00000009tdM-2r8t;
	Wed, 09 Oct 2024 16:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uTGIexYQlN6YujaQKltAIaLDe0TVEea23e+dQ8YBlMA=; b=F2hBX2JZzP5OTQR8h0A3Ok1h8y
	MuTibZVm1V0kB6fVi61zArbzZdtE2TwQWy07/exigWvKaQKw9zXxkS1ypKGn6izGQ0lg1+xO2BB+O
	XzJ9T7MkqVDzpcVOs7oxL4qS7hdOo83Wj7DP2fnXgC/kTGOdfcnA2LkxCcjWT/CBdqhvUAVMAiW+p
	bxSj7Nc7Ki2BB3+alnS9ArZL+GfijVwman6zsNSDnJ+Qb38h9xIaZPoLoG2+l/SmH7L/ryw4GWDb7
	A3lO/EzJlrenEKQInIMsqP3U2oPAjiWTKoEZ/jRQe4yXljoMugiS30C9I2WqWGwAGMiwXvHW5lzkd
	AS7pbuyw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZIy-000000050pz-3LKC;
	Wed, 09 Oct 2024 16:12:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 241B7A44228;
	Wed,  9 Oct 2024 16:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04529C4CEC3;
	Wed,  9 Oct 2024 16:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728490368;
	bh=S5aG80GvrKdfMXVhakyIDR2NbDXeLTTdwzkg9R4l52A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hxvP+wX7aPWLqTtiZP+W8BDHgAQNj/T5T8gVd3ljVbXCq7+6iSTL6G8IFidPvHgFc
	 KVENSUMRVifuvcHhLxz+1mol24tzx4g1EVoBfTmbqkKr9OFtjFEjIa7uxWtpZqtzNq
	 wZgU/F82FY31jx76spPYH2BrUz2uHoqf7DLMn2JMMdmdglyYA7o/n7BlG2Rgbtdirb
	 VSQx47sSgJYaWCmy4huSPc0iRSCOJfC/QqAU0B+RlrLPor8c0w1u+w8SdmTJJiE+5/
	 cfAKtrz9tOVWwLAuLX8q9qjcv70jvJKpZnupmXLtzLB9Lq/CWM9iv0MExz+UeL3NTS
	 IctUKp5itIGUw==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241002-clambake-raider-a8cbb3a021a8@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-clambake-raider-a8cbb3a021a8@spud>
Subject: Re: (subset) [PATCH v1 03/11] dt-bindings: mfd: syscon document
 the non simple-mfd syscon on PolarFire SoC
Message-Id: <172849036272.666113.12889452067505651673.b4-ty@kernel.org>
Date: Wed, 09 Oct 2024 17:12:42 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_171252_978746_C8318F0F 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCAwMiBPY3QgMjAyNCAxMTo0ODowMSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+
IFRoZSAibXNzX3RvcF9zY2IiIHJlZ2lzdGVyIHJlZ2lvbiBvbiBQb2xhckZpcmUgU29DIGNvbnRh
aW5zIG1hbnkKPiBkaWZmZXJlbnQgZnVuY3Rpb25zLCBpbmNsdWRpbmcgY29udHJvbHMgZm9yIHRo
ZSBBWEkgYnVzIGFuZCBvdGhlciB0aGluZ3MKPiBtYWlubHkgb2YgaW50ZXJlc3QgdG8gdGhlIGJv
b3Rsb2FkZXIuIFRoZSBpbnRlcnJ1cHQgcmVnaXN0ZXIgZm9yIHRoZQo+IHN5c3RlbSBjb250cm9s
bGVyJ3MgbWFpbGJveCBpcyBhbHNvIGluIGhlcmUsIHdoaWNoIGlzIG5lZWRlZCBieSB0aGUKPiBv
cGVyYXRpbmcgc3lzdGVtLgo+IAo+IAo+IFsuLi5dCgpBcHBsaWVkLCB0aGFua3MhCgpbMDMvMTFd
IGR0LWJpbmRpbmdzOiBtZmQ6IHN5c2NvbiBkb2N1bWVudCB0aGUgbm9uIHNpbXBsZS1tZmQgc3lz
Y29uIG9uIFBvbGFyRmlyZSBTb0MKICAgICAgICBjb21taXQ6IDhhZTE2ZDNiMmZmNjY1MGE5MGJl
Nzg4ODFjYjg4ZGNkZjFiZDEzNzAKCi0tCkxlZSBKb25lcyBb5p2O55C85pavXQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
