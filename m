Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634CCCFC518
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 01:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2wHMot4aQ2xy/Dpe45iXD77Us468A4Zzq41pGrjrNs=; b=SYGm+V7Yjertk7
	/4OcBLwa0utgLKH1otNBnLNs7qm9gvg5RIbkzXOaCIG0T+U5nZ2dATulm9Kbr+UHfJqNIxLIQyO2E
	2dxnA33+9gIU2a+ETPTQccmE929mB4elCx+GkvxLsBp5xzwJXrPgPTPeakytqENkTBpEAS2je/BKw
	AJOXA7WovbXyuqHybq7bMJsjV3lx4YPYfbjpsPlX6W7fAj2buA3b0IDrTwbQTV3QpawXRtN2Oz1cV
	jmPQ9tAgvyth12zcbiTJ9WL8X5Jb1sjoLY4nKHOmEJu5aNLcUWiPdBgwitJCtJw/skRfoMBA8LdBC
	wo3eKMD5FpuSmv3hzbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMcIa-000000098jy-0P2z;
	Sat, 22 Nov 2025 01:20:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMcIY-000000098jp-1zOh
	for linux-riscv@lists.infradead.org;
	Sat, 22 Nov 2025 01:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 996B760172;
	Sat, 22 Nov 2025 01:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 173ABC4CEF1;
	Sat, 22 Nov 2025 01:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763774421;
	bh=VAZ/Zm4cnlcYBg8w2uY2Wf/4jK6ScSKcXM6yymno/HM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lwcfBwK/M3UmajwPpjJYJtUBq4B39y7RqUlcrWHJCWhiT8T9cVXZ2vg/F61xEqGPH
	 6eXOmLD+OomZrhIGh7w8nr18f6nFr0PeQIhJ7hv0uYFBvZ9jyGZpvRDUVVqDBUljFj
	 WOp1ixL4+sqKSyOZ6zBPCneUsqkC0RxvEc7v9biNwRH9AjcDx3J0+hseQ8H+bohmci
	 /GsjiCaUKA1o1Nh9twOuB8gCqK1s21De7cW7acnjKDMS2aNbCIwcCoj7N0Ms68Sd5p
	 b51nQU4yHaoj/fGcK51l6IxnQIqV+Qq2m++Dkrhl8E8OEbqtzLGGZWSfhBO8JDoPIw
	 yU1pMGv9RJjpQ==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 488C45FA61;
	Sat, 22 Nov 2025 09:20:18 +0800 (CST)
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
Message-Id: <176377441825.203955.5834397117362427441.b4-ty@kernel.org>
Date: Sat, 22 Nov 2025 09:20:18 +0800
MIME-Version: 1.0
X-Mailer: b4 0.14.3
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
      commit: 9f393d8e757f79060baf4b2e703bd6b2d0d8d323

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
