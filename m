Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7422CAC5A0
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 05:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZRK+NJl4dypAwHZyVbOptRtVLHfHZuGvv9OLrhH600=; b=t2WCFhbh+Rj9RU
	2pkni+E2QZ7q0v8TAzWLGYuj047adYSceNDXisYUOhool5IPg8L8C6xvqS4wZe6//5/elDw4m0NHj
	q/nUsre9PjILJZNVlQI0MYAiQu53+H/+4C6Lyo/zBmNZn1CR6QYay9KCB6Q0t55wyjMGVPVLn59gV
	x01Jt++2gtc+6Sayvy377XFW6asR30EbxwU1zFNFkvNX4JBv9n9uxRhY0Ngphsw4S+1OVjsRhPhai
	MasGps4+Z6Rc8FTI2HJNUPIEsOvGQr62yydk8TKuUVN1gtTEffhb1Xy7+NoxDNawOg7YAnvCqoGcT
	R+glWighWjmgfEyoNACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqZL-00000004q6X-1yYR;
	Sat, 20 Sep 2025 05:55:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqZG-00000004q4x-0OI4
	for linux-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 05:55:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB833449AC;
	Sat, 20 Sep 2025 05:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3127C4CEFC;
	Sat, 20 Sep 2025 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758347729;
	bh=0fZkG319TCKEqELzv7fC5eTm3rE9Hyx3FHG91aaL7DM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jAD+kF/v3QIXS9CCkBOC5gafGCuNukWhRtLxZJ0jI1+eSIfMYxMFIU+FwNsOOsSI5
	 JofldBL9F6BwuFcd8NY/18FURr0J1YFAzcRMQAmoc71mUi8DEr4QriKWw4sNZmoCVo
	 473WIt7Pf9aUeSXIZ9xcCLrnOk7Is0DP1S1LiSoQdMtdKRlVx/HhHn7Ay1EO7wlsbk
	 u1JWX4AKOsHxmoY8IEjlF1tbQxYqiDTdktgI1yuqzkBTw6WBzBqnSH+/DcHaI7cqh8
	 V5wv1NnQ7m/Y03/gtEmCue8TV7MGCpEpGmpeNNQxs35ZhH2cvFFiOf67NkHwHVgLdw
	 n5HLhvXFM/JvQ==
MIME-Version: 1.0
In-Reply-To: <20250911-k1-clk-i2s-generation-v4-3-cba204a50d48@linux.spacemit.com>
References: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com> <20250911-k1-clk-i2s-generation-v4-3-cba204a50d48@linux.spacemit.com>
Subject: Re: [PATCH RESEND v4 3/3] clk: spacemit: fix i2s clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>
Date: Fri, 19 Sep 2025 22:55:28 -0700
Message-ID: <175834772899.4354.17970704155310133154@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_225530_157119_1C266F85 
X-CRM114-Status: UNSURE (   8.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Quoting Troy Mitchell (2025-09-10 20:34:05)
> Defining i2s_bclk and i2s_sysclk as fixed-rate clocks is insufficient
> for real I2S use cases.
> 
> Moreover, the current I2S clock configuration does not work as expected
> due to missing parent clocks.
> 
> This patch adds the missing parent clocks, defines i2s_sysclk as
> a DDN clock, and i2s_bclk as a DIV clock.
> 
> A special note for i2s_bclk:
> 
> From the register definition, the i2s_bclk divider always implies
> an additional 1/2 factor.
> 
> The following table shows the correspondence between index
> and frequency division coefficients:
> 
> | index |  div  |
> |-------|-------|

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
