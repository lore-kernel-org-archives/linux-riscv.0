Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EBBC25B4F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 10:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KAds+EVL3XaByN8HENxNnqcTdfT7QKw7mFowU7aFD5Y=; b=Ya2X/acjZUpkVo
	TG4f5HuP+Hej75FqPCZHoZS+n7f0L88fZ3w1MjndSR3+BtqXAawzgqE8bjlDcSVARj578N2oIrvYb
	LgD5pvUEOvKRF0kxo1+QoJ7yraGVN2uJ1hwOQ33KTwnA3RCDazCPTopBwyxqzzPVy8gwotN8IC8pF
	LC9sFKhSNF3OHSFFN4ZZOavIEuiA2c53ijlcMCTRPD7rO8DdvPmVbneEG40ftMXMFk3j840S27mvv
	Lr21FRLcBC8BHp3NuH9Go0ewu+G+kOx6TL1HRCGqtppgnxDLfqUcgbj89ufoQgLlmaql0wOijrBaq
	+7d127TdiIp2fwAMEmaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2pjP-0000000FxyI-1svZ;
	Fri, 03 May 2024 10:01:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2pjM-0000000FxxY-1fEo;
	Fri, 03 May 2024 10:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 821266143F;
	Fri,  3 May 2024 10:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E19C4AF14;
	Fri,  3 May 2024 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714730487;
	bh=Z81kJ5Jzse+D1tt/hKahWdZHLWz3jrL1TFiptgq6cIE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=h7CECoV2zrBhycyFBBAhOXnFnpoEfarqglCNzR7GGa3PNe1gRF0kDuDQErO1Ajvy6
	 8TFeGl2KayFG6TTYWdlT5GMS19wpQgS+hXmHk5DUeEH6nHjsiLA2N7gU+297+e6FJ1
	 QrbvrMZVYv+4fi9KdUKHoB3W7WbiKdlAByb5lvgC935LJucFVRkUeqZpkYOMPiDO8D
	 EEUd3kRKLaF0WcZ7qqy3GKhBT9k52HxcEdwW004rPZW4BA6zUkYstpWtk6E9ADWCnc
	 BB30uzCGrgWrH6fne7nrKbvTnHd13e6TeDYEdUoPA7Y+MvWQ/bAN227MFV4RWHDV6z
	 oi7Jj925Tr9Eg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
References: <20240503072116.12430-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: Use full path to other
 schemas
Message-Id: <171473048435.1337417.17257640057136086841.b4-ty@kernel.org>
Date: Fri, 03 May 2024 11:01:24 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_030128_522287_52381243 
X-CRM114-Status: UNSURE (   5.57  )
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

T24gRnJpLCAwMyBNYXkgMjAyNCAwOToyMToxNiArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToKPiBXaGVuIHJlZmVyZW5jaW5nIG90aGVyIHNjaGVtYSwgaXQgaXMgcHJlZmVycmVkIHRv
IHVzZSBhbiBhYnNvbHV0ZSBwYXRoCj4gKC9zY2hlbWFzLy4uLi4pLCB3aGljaCBhbGxvd3MgYWxz
byBhbiBzZWFtbGVzcyBtb3ZlIG9mIHBhcnRpY3VsYXIgc2NoZW1hCj4gb3V0IG9mIExpbnV4IGtl
cm5lbCB0byBkdHNjaGVtYS4KPiAKPiAKCkFwcGxpZWQsIHRoYW5rcyEKClsxLzFdIGR0LWJpbmRp
bmdzOiBtZmQ6IFVzZSBmdWxsIHBhdGggdG8gb3RoZXIgc2NoZW1hcwogICAgICBjb21taXQ6IDU2
NDI3N2VmNjBiNWY1ZWMxNzUzNDg5YWQ2OWY0NTgzZGI1N2U2ZjAKCi0tCkxlZSBKb25lcyBb5p2O
55C85pavXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
