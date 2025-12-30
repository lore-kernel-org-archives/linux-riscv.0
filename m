Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF90DEE0214
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 15:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOhpLawlhdzd84W99VF9/05ZC4FCNWL9ivElH7S0FfE=; b=ZoF+kL3l4PVwYr
	zdPXrbjNeTvwo29S54qyTFeqHgMTTEMc2fExc0pbG+FuHVmbNh0mp2MP56Q71M1esPjyUjo0JXGDf
	pSJWCdtXyk8sLob/HuE0t/uTUifmpOnbdGZjn9T36KVJF59ZK60RlrthoG+fe4NyLtNkzUAIJ9bwm
	LEUDr22Fk5aaT4SnHaKS2o6u/0RG60R/Im1ytQ/O2TNCmpRr5ZgiNZ0zufOQbkNjPqyG00QhLfjCa
	C13k92aV+ZYUzwr3+vVgb4mcoBE2+ylmZi0VrRZQnin+GMXV1+KV42AmEklUG7i+t/d41WciSwH3i
	afL0bb0iAG5JFryesrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabjc-0000000502R-0cPm;
	Tue, 30 Dec 2025 15:34:08 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabjZ-0000000501u-111P
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 15:34:06 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-3825ae23d95so29428491fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 07:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767108843; x=1767713643; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIQJu7CyiY9gIZvx6eWahf0Uexh2lGW7onsdB+Wi7IY=;
        b=v1MyOqEoQ6RghvVFFrGoISbeFpFuhRpivYSIWgKSxPVJ32BuzwjOpuG4lZh87SWSje
         f6m8KA2nGG2y1xIAk1IVRQHz8eunf6BAGgmtP+nPNJTBKq7+5toEcmML4mn0Rtux1/TU
         YZDb4bbd+M3Lbd/eKGnkbVKPgb2IO1MJD86bWROR821/W5tenBkwqIYQFpB1vu3fHj9s
         RqgxMpwLQpY4E2kS8ePbzuXDtv43tMG6Mxxhk0Ux//sT60zVmWj+qgMSbl8EZX1zn9+0
         KcjVwy05Wnh7qwsayvb/JI8EedwJBu54ryLND7ZTcr3Pi2pqqWAytfQ56jO/MEeDyyy1
         cGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767108843; x=1767713643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIQJu7CyiY9gIZvx6eWahf0Uexh2lGW7onsdB+Wi7IY=;
        b=jJSKxQtLQre3l/D0thYB8aIAxPgXZGwAvyeiV9rKHTIp95l/1CSf+uWrlPA+B4usEm
         oh8SzonWNqx0JqBpjxb0WqH4Hf5MfkILb3FCviLxG0/hfJzAiQqoeBC3QlAn41GKKBuB
         58crTnhqF7791a0uWU1cPIAV2jMdNewBXbboCgHxYTxQX+YYqrFTPfTk9Qi6qMLDTOxd
         DWz3JwlLBHL8fcV87B/XcwrW2DPcUHHM4Eyi6xrn4dY2nkoHORrHHy9QNohJ9jZ4/2Je
         WkihzsS7vhIp6V1pxExXnqRJI4iDkDE8YRB66jMZSsLRlPzq1Mb7aKuPSqRbkO4Kvuxf
         2NcA==
X-Forwarded-Encrypted: i=1; AJvYcCUlHueFjc4zzh/QsjKSkBD+AF1bi3m3kv7vqlJh1eo+TND7C4J1YWdY7KWrCOD2uc3N8n7AqWT9QiKtSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya2/H9Hpb2vjo6d6GGkBo1vAVl/n6+CSjnVpzl23FvrLtF6LPw
	MExzsD3NJf10a6YFrS+DgI5vWoK4PcM7NZyZ6LTCjOAtXImYcQRDfNm4lwq7fHPhZIh+yn4Cr0/
	5S1BnCUBWFAe/t0h8Oy8OTFN9/V0JYHs7GCyy/UKdRQ==
X-Gm-Gg: AY/fxX7lCs+Oz6w+EpGXfrswGM05rO6MxM/+KyMOu69d3CFz9DJx9yR8w0sQ8LErw7I
	/FCV+FaltGEPqLpfc2dCzyDe8d1fu+gbLsXhKDKVOg5+EAlugelARl1XMUG62rhONrhz3emEFwZ
	52Qk842Jo7UxwCtpcPcK63TTm1hd0eyf4CmC9u83denN1mwndquSoIh13Z+PYwEgmPCnoTLpDpS
	z5/EZkX9Cr6pYzh07zeqOzejWi7RCB2qeBcGaH7gaYVt4gqNTsFZsG2k/uBr7H4Qiks+0rimt73
	rspizzk=
X-Google-Smtp-Source: AGHT+IEEzSWxU0Fr9jtKf4rnUE+MZIqWiBIfHx6EwjCFpsAYl5LLEX7BferoDb537v/2XTB1q5TRJQn0YC6nmgiVvgg=
X-Received: by 2002:a2e:ab89:0:b0:37a:3033:16f6 with SMTP id
 38308e7fff4ca-3812164513emr98831031fa.35.1767108842896; Tue, 30 Dec 2025
 07:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 30 Dec 2025 16:33:27 +0100
X-Gm-Features: AQt7F2oqCrEKFHiJvi35sI497oUVGoB1FksL7aATuRnp8180lObyxwQDc3LztRs
Message-ID: <CAPDyKFo905ptdO-rSkiJ-ax2u=P_+EAJA30b14n=B4j9adaaKg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: sdhci-of-k1: add reset support
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_073405_313953_B419B648 
X-CRM114-Status: GOOD (  14.38  )
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

On Tue, 23 Dec 2025 at 03:25, Yixun Lan <dlan@gentoo.org> wrote:
>
> This series try to add reset support explicitly to SpacemiT SDHCI controller.
> Previous it works well for eMMC due to it's already initialized at brom or
> bootloader phase.
>   The controller has two reset lines, one connect to AXI bus which shared by
> all controllers, while another one connect to individual controller separately.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Changes in v2:
> - To not break DT ABI, make the reset line request optional
> - Use devm_reset_control_get_optional() api
> - Link to v1: https://lore.kernel.org/r/20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org
>
> ---
> Yixun Lan (3):
>       dt-bindings: mmc: spacemit,sdhci: add reset support
>       mmc: sdhci-of-k1: add reset support
>       riscv: dts: spacemit: sdhci: add reset support
>
>  .../devicetree/bindings/mmc/spacemit,sdhci.yaml      | 10 ++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi                 |  3 +++
>  drivers/mmc/host/sdhci-of-k1.c                       | 20 ++++++++++++++++++++
>  3 files changed, 33 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251221-07-k1-sdhci-reset-1990d1170437
>
> Best regards,
> --
> Yixun Lan
>

Patch 1->2 applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
