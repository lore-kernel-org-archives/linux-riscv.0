Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEFFCFA469
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 02:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lVWWiZdoj/JseR1CGFEOqGhfMXq0Q6I1AVKGxuI7Yo=; b=UNlc4hm4rIAniJ
	UuxwI8mqCervIH5VuIHztyPR09pcVYfbA2MXqiSYIhrROmsqAXWmwoCB6jI5RguzOFNK+HsouBlf7
	McZs1dGxmQEm90l7sIqA4Rle364AZkJYnjwHh7bo+32sxytfUkZ3ulixzKouoB6SRTBEGGzkVLeMT
	zgLNqeuQYwZVhz8syS5W4UozOBTMqocgvx3YAJ6TCnKIncj2kuCGY/EhypHJcXc1jvHY0NeIk1yvS
	PIhy14/aeME1P91O5Rv6y2q/IwSUuHZPLEHeIlFmvyqb+7NHmbpLZnoLkYswS4NMsjZKF5dRo5oA2
	Bg5GjOerYKH2TfPDT1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHMA-00000007jfm-3kmF;
	Fri, 21 Nov 2025 02:58:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHM8-00000007jfP-0jdi
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 02:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7B9C408D5;
	Fri, 21 Nov 2025 02:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E1FC4CEF1;
	Fri, 21 Nov 2025 02:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763693918;
	bh=1bNQbwHrYuW7HQk1KCxPp9vMuOHIa6T5fJNOx6hn+Is=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bWhS1yRElPkMGupvWAWEtHGTKAlv3U7wwvmZrbmiCJXyJyrDJCihpr+9pEtMAmErC
	 6sNYVR/LwDIRLwJgLQ6SeitmYMxcHzqGUfbq2KZ0BOCr6cQoCfl3azk03GdswQkxem
	 9pTvPVXW1dwTMGPysxIjc+DEGoOC5W++xXu7kGuuOBx7vvKbwpyxNH4matqfkfBCua
	 GEVJ2/uWQ1zFoWXuoo23ouimtm7VgaeMMwXXhm2Y3KVs7AaA8JvZioIe0rLiqff7dN
	 M4/BbzXQS/wluBuMvJXNbl5eVlzqhHmvJDG01OBirplPk39nahRHEpsY7/2gWiPPWE
	 Je7X0KhgLpYmA==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id E67465FDB4;
	Fri, 21 Nov 2025 10:58:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Charlie Jenkins <charlie@rivosinc.com>
In-Reply-To: <20251119203508.1032716-1-geomatsi@gmail.com>
References: <20251119203508.1032716-1-geomatsi@gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: fix vlenb property
Message-Id: <176369391591.4121578.8100709414179507629.b4-ty@kernel.org>
Date: Fri, 21 Nov 2025 10:58:35 +0800
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_185840_265738_0F740BBD 
X-CRM114-Status: UNSURE (   6.12  )
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

On Wed, 19 Nov 2025 23:35:06 +0300, Sergey Matyukevich wrote:
> According to [1], the C906 vector registers are 128 bits wide.
> The 'thead,vlenb' property specifies the vector register length
> in bytes, so its value must be set to 16.
> 
> [1] https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
> 
> 
> [...]

Applied to sunxi/fixes-for-6.18 in local tree, thanks!

[1/1] riscv: dts: allwinner: d1: fix vlenb property
      commit: 57c5543b94d0c0280145a4a7445a2c1ae074879e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
