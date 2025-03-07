Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E3DC282D0
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ZbZi34qEk8/SLxdwcfpJnwg2rVt/MkihR+dtNikW7Q=; b=Asi7i70jhuFwJS
	nNp4RSkCbOcvg8wh7AQQNPtLfag8cCj4cqys37tJehLSXIHrB/0GV+SiEq1potuGrXla1V/gAldHI
	0QYaaEMKMPbpRdO+GYJZXAwiz3RJHbTPxS3SpqP7GvKZuS/fVFpSPFif53jmKvP5iHyoAddjuWhO/
	gZuHMCvyOEJIDEupd38hK3ixmCT0xuqsLJfpIB/QaKNfQN4NcrXqtRSl5QnNqC+PjQiAa6ucCjWdo
	vDwEnmzcHWtwfvGhL2ERIn/5I+h0NW2ySPCHdcSEDERMo1EfIDpqaprdG5jo/ksdJ88PQt0AQIURJ
	QDY1xdcxLXZ8W3tFyGaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSut-0000000DXQp-0hvJ;
	Fri, 07 Mar 2025 08:18:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSss-0000000DWqC-0Lzh
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 08:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 993215C4A3B;
	Fri,  7 Mar 2025 08:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F7BC4CED1;
	Fri,  7 Mar 2025 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741335401;
	bh=DEVRT3pYUTzTLAgL5CavIfRYoF9HgZxDGxwhWCp6/R4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErLB7r+PME0AvpLr3Uk77LtGmuAPKrLDCGGk0MonxsZLFZO8/gYN1aJuuVHfJMr7j
	 ZqvX9b1HxwVz9lGKboQGqCKrsrk8Hmz+FUC2EI7HCr9p63FhHHCM8VCdKkiz6xmiwJ
	 S11pJzDLVRMWK0f9bVmDRg0yxj1NCEnqeeL282iAd4X8D62weuS/D7eCAK+1YLmKPR
	 jed64eIOKI6SZqvhmvK42SMkUNKwOwokWvHRzPPBWj6XhrvukYUrmaS06Ri+T+1B28
	 4xYaas6OuVYbqrw+NWuLJZI3aUp8MwXEEgL3UgH3gGOZYh7iw8NaZaokmv257pq1U2
	 loRCy+nPVMMiA==
Date: Fri, 7 Mar 2025 09:16:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@4d2.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>, 
	Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: soc: spacemit: Add spacemit,k1-syscon
Message-ID: <20250307-gay-apricot-porpoise-9b0aff@krzk-bin>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-3-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306175750.22480-3-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_001642_160558_2E52447C 
X-CRM114-Status: UNSURE (   6.21  )
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

On Thu, Mar 06, 2025 at 05:57:47PM +0000, Haylen Chu wrote:
> Document APMU, MPMU and APBC syscons found on Spacemit K1 SoC, which are
> capable of generating clock and reset signals. Additionally, APMU and MPMU
> manage power domains.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |  80 +++++++
>  include/dt-bindings/clock/spacemit,k1-ccu.h   | 210 ++++++++++++++++++

Filename matching binding, so spacemit,k1-syscon.h
(or vice-versa)

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
