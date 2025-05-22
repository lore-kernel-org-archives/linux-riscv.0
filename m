Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CED5C54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 22:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjLJQbx6kiFRNg+tcKn2KWsE+3q8n/OeSJhBIzLH42A=; b=aXtNAC6uK9EzoJ
	Zg/PJK9j5S35PXbYD97BbuqbdNIOs+ZTSigHMP2CGy+pj0wBY8Db+rFdltcrLX4hldbojII+PcXAk
	VS0Tzym4Ym+chVFkEVufRkcLYyO630MEHa9q9Bxo2cNEKi5lRiJbBkr6W5vRLmQ0yO91uEzHioMSh
	1RkpqiC8/ZlVTJKDPwNSq6np2wM7yhdZvRDcKGn9wV5fvnQ4pFtN/se8rtHmeQcdXB7AVujrdR4Qw
	vGGz0yOf79VI8eyYl2jZs088zYR+hfi9xX2zoKWgx3NPOQnCXBa2HqnAHMEfEI2nEINWgsri41OHc
	6KpdZgSr10SXoR6KziQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIEKc-00000002Hvs-3ZBE;
	Thu, 22 May 2025 22:24:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIEKc-00000002Hvi-1JzF
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 22:24:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A3D462A4F;
	Thu, 22 May 2025 22:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F17BBC4CEE4;
	Thu, 22 May 2025 22:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747952645;
	bh=mrLS9ALfBZ8yDjiGlgYJ6hgL8zQmN3FGQBk+6r5tqHU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mUZb/mZS1vNI8UcKuDHETaKYLKR1O3GUUCqJTvBz632A/5rSQzAEk+icjo+Oe+3hk
	 zmx5cWsZwIIpKOk8QqpLWLQAHdOaHa2h9ZKFtE4FT+s35mXokl+ESPtH9w9ze2Ic32
	 SWoNyzDHVSHXTa6lnVuAyMk4AASlnsmyXrBw/dOWXMGx0hVbBMQrt12pErrfDt7gBa
	 Jy8QS0ZT5aQu0awPGxeGuv0cDM3ismcLwzJ++UxW+V18LxIhVWdcjUcJb4KYZOJgOl
	 4mxsb3tzJSKaNduR5wasuYBy1Vec61q7W0SH7HfmkJ5SZF8KzkUpTAoCSKWODIQa4c
	 Dj2fgY6z0IUQQ==
Message-ID: <018214f410632eb3dc6c6bd6ab58cba1@kernel.org>
MIME-Version: 1.0
In-Reply-To: <aBus+Yc7kf/H2HE5@x1>
References: <aBus+Yc7kf/H2HE5@x1>
Subject: Re: [GIT PULL] clk: thead: Updates for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, Michal Wilczynski <m.wilczynski@samsung.com>
To: Drew Fustini <drew@pdp7.com>
Date: Thu, 22 May 2025 15:24:02 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
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

Quoting Drew Fustini (2025-05-07 11:56:57)
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   git@github.com:pdp7/linux.git tags/thead-clk-for-v6.16

I changed this to https://github.com/pdp7/linux.git but please fix it
next time.

> 
> for you to fetch changes up to 50d4b157fa96bfeb4f383d7dad80f8bdef0d1d2a:
> 
>   clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC (2025-05-07 10:09:28 -0700)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
