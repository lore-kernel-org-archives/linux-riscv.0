Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B906CA1015
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 04:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YYKYhXYlcVKwYy49sw5RE8ftYli166qSefIlEYcJ1R8=; b=nAmX3DxaLJENnt
	7iUo+a1VYjeeFJYw6VWWJR1JGz8KVc6r9xDjJ1oEHwuXMmSJUqoNtNNt4RLJVuszXzSwEpQk7BSN2
	Wgw/mklbY7trY8bdtiI9ksyZT1VoOnXcpQjE9DfSKDqXBoKMRdnMAzkdjnWiHQWfq+7sP/moyVxlp
	3wD3g/cY+9mapkdAW0bm9tMtsn8iZw5nwoUvm+y5ocEg0U3o9UU+rWsqnU0X8ST/StCcEJ6ZFVtrf
	YSYjJ5B+1HLrxKnkUboYDVt0I/OwbBgrHiibq3yOMkd5Nowqb/sFqWs6bBS/g2KxI2+2kglygxv/8
	xdHM4XzsUdmwn+fRJhPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNuC-0000000Ggcq-45Pl;
	Fri, 05 Sep 2025 04:18:32 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNol-0000000GfGB-1jdt
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 04:12:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757045567; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gM/Sls9VZ5T1dHf2Z1rAFKT1cspPYL35GR25pDh+8laJ42bY7UJ1J05cWvEL48knRhFcHTIfoD/96gWesM7VQZLXnM4lUgvXtq1bklTf+exzJkqZxW5jQUepiPZ1/NJQvincmXcjAhWsDPsZ9WRD9+DliciSKoTO6ymCUPwH1No=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757045567; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6j8WVHUzpjmtLTPxg0zlXLMcBS5g1yEiQQDtA+CKY3s=; 
	b=jVma1J2O5vrPhl0q1pbGJGQpMoWcV1sL9LwMP7Y+OEf0ftbvLfOnPn4+3M4HA+p5gg672FKY3GZoHAXHKe8WEG8w8iicdYDzIRwTWb7o9UnSNiDiCnrqKc9xMfFF1WtcvJqFUOW/ao+/5e7aXBfXk+4CxDase0pL/Ks7hSsuwac=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757045567;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=6j8WVHUzpjmtLTPxg0zlXLMcBS5g1yEiQQDtA+CKY3s=;
	b=NZElVJmd0ndkhsNVJtUQSDK85slBkQPcXeL78AZDCE62ojFznh07Twt7hjZab9f6
	iQjgHMOQIuxN3OPiIOs5x54Tusq6aWAOouc6ZqLRm+N6u+nxmW9agI4Ta6vnGv7tNBR
	S5gSlBFdCWuWWQyRLuIyAPlCUsT1QHJbng9fPNyw=
Received: by mx.zohomail.com with SMTPS id 1757045559172945.1322496024884;
	Thu, 4 Sep 2025 21:12:39 -0700 (PDT)
Message-ID: <c0775df8-f959-4c70-9f06-bfa22dd27d54@zohomail.com>
Date: Fri, 5 Sep 2025 12:12:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] clk: canaan: Add clock driver for Canaan K230
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <20250905-b4-k230-clk-v8-0-96caa02d5428@zohomail.com>
 <20250905-b4-k230-clk-v8-2-96caa02d5428@zohomail.com>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20250905-b4-k230-clk-v8-2-96caa02d5428@zohomail.com>
Feedback-ID: rr080112276c7d67b73e77bdc8490d709c0000502e5d5094ca03801f33702c9bd07a306ca3328e5fa12003bc:zu080112277d54128bb0a004aa7d227705000049afec9605f2514ce51188b05b1ed005e393bf07381131e24f:rf0801122cd74f153e3036c567b85a7cd7000082ae154bd1fb4dfc1866f22e5df40d10ed18265ec4bb620f84aae37cb6ed:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_211255_519674_0B54588C 
X-CRM114-Status: GOOD (  10.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Stephen Boyd,

Is the driver in this series satisfactory to you?

If you have any concerns or suggestions, I would appreciate your
feedback.Otherwise, I would like to know if it is ready for merging.

Thank you for your time and consideration.

On 2025/9/5 11:10, Xukai Wang wrote:
> This patch provides basic support for the K230 clock, which covers
> all clocks in K230 SoC.
>
> The clock tree of the K230 SoC consists of a 24MHZ external crystal
> oscillator, PLLs and an external pulse input for timerX, and their
> derived clocks.
>
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  drivers/clk/Kconfig    |    6 +
>  drivers/clk/Makefile   |    1 +
>  drivers/clk/clk-k230.c | 2456 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2463 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
