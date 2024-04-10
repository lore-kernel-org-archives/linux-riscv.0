Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FD6CD1296
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 07:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udw8JDQm8Qns576n/JWZbOYl9Oiu+B6eh3jisVFvXVA=; b=XAeNwLkGC+3HW/
	sACdp+zWytNicCvXdIOXRSus/hJZzwa9YzgOTMBD7BUWzLEdtDYY5EJV6kIVy7FIpOqCrYPgIXAh5
	/5FlnSkPn3JFMwoCbJiiR8h20kTni0a7iEUCjHbhzS59Fb4VnvCio+S3eJezrQ9uOB7OUvKMWPHSf
	gGJhYuUjJqwlP4Ibz4rZpHLmlyJ6g3saBZdFvJfI/KzbR7rZbUSYkFiwZIRgQKzGAnRnnbbcvauIF
	y1TAClxtns92Q/Y5Qd8UbNFUILd4E9O6Lq90Jt7aVHl+PK1v1+yrg7XdDUi5mEVDAmffPVBMbBn5V
	A28D/KFmrbFTpis4/ZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSqY-00000005k4j-1Tye;
	Wed, 10 Apr 2024 07:58:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSqV-00000005k3b-2w87
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 07:58:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 327F6619F7;
	Wed, 10 Apr 2024 07:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EDBC433C7;
	Wed, 10 Apr 2024 07:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712735894;
	bh=K/eDjeU8Zri/YVQwV2qqe0Qm0px/fLneFb5gHVWAUxo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bFupmW7Tlfsnv2qcx3KCImDyVWL/qCvyNMXXxmV16EXbhEDlOjSy/aTx1HPNnvwBJ
	 H0RSqWI31Fnv1gaZsQo9a4FQvHrUqKBZ0kG69NT6sSfjx8b3C2ZF+/AoDL5BkmSuGS
	 1iL+tHfz4Lj4uzZwblWR3k3ffJ4NB274arbgIdFRcp8aIJZ2XJ/4NuAhwNPceq5TeT
	 gvVkuCXzL2XbYKS+8i6utnWpuU7qZKYBS+CPXmKfGqAXfOBCHt0fhR1vUWR2u4h3AG
	 xJz4MKuRRQ66aOqWxpoQqze6Wo2RRA0LQDz43l/xDbjhPRQe4DzAqB9qYGIto54H57
	 q0DgaMBDq7t4Q==
Message-ID: <858299c27c63aa2974b169f9adf624e9.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240410033148.213991-2-xingyu.wu@starfivetech.com>
References: <20240410033148.213991-1-xingyu.wu@starfivetech.com> <20240410033148.213991-2-xingyu.wu@starfivetech.com>
Subject: Re: [PATCH v4 1/2] clk: starfive: jh7110-sys: Add notifier for PLL clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
To: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Xingyu Wu <xingyu.wu@starfivetech.com>
Date: Wed, 10 Apr 2024 00:58:12 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_005815_796170_EB6BAFAD 
X-CRM114-Status: UNSURE (   8.10  )
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

Quoting Xingyu Wu (2024-04-09 20:31:47)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 8f5e5abfa178..adf62e4d94e4 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -385,6 +385,32 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>  }
>  EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
>  
> +/*
> + * This clock notifier is called when the rate of PLL0 clock is to be change,

s/change,/changed./

> + * The cpu_root clock should save curent parent clock and swicth its parent

s/swicth/switch/

> + * clock to osc before PLL0 rate will be changed. And switch its parent clock
> + * back after PLL rate finished.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
