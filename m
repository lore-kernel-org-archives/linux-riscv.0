Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C88CD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 08:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aawPa//LauJskwzbI4J5KPecg2rV62MGKFip38BVkM=; b=XVqL4/PolVY1E4
	BRKcNt5j+c88Q06Wd3XYf4btdAwsyLKWWTKss5mvMmCQNoy0nfCJ+u0gVR1oiozz6k0f47P2d5DUJ
	Pu38xO2Svt9FUzUiIsp8lBrgQsMeKsziPnCNm1J2KpcfBYLv975dD9MwEtr3kk1wlvrDbXjdx2qkf
	IoYwAGwYeWuNTbg/Y0Kf7bt7IrKVml+DyL943bmezCGW6ugQSfkOZErq3SgCVbV7pzTdqdEJaDYWU
	oBcxBH1v+LMfJ9ipuZmH8FUV2NPrFrKbevMI9PL9pAPYr+6luOoQIMbpBTTQoEE7EgCdT47Ye3Set
	HdXz1+lbB249ncfLvVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4tI-00000001jEx-0uVy;
	Wed, 13 May 2026 08:24:28 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4tD-00000001jDc-3Lm3
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 08:24:25 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-67bc8609a9bso11800584a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 01:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778660661; cv=none;
        d=google.com; s=arc-20240605;
        b=dlW60X41sqId5zicxjxcg7dcsyjCkQ7LbPPUgwyRiQiL01ejYdMTscLMVGsTstwkE2
         41YobXMQi0UHs/4i61/BT8+tkoHtliZTQzEi0WiP1QiRru8+MCC2IWxCdI6pfS4ms8Hu
         G+FV9fLADOD5p3vaTwBJZpYxAHRMZMDS0njmJzw9wgPnoFVS7T1KP08WmSJ1Mxz93Klj
         h1YdZAak9tMGJ2TcejZBRa2M1273hFc5WF4taiuGNx12ROXkPJa2sJa44yeXcLxWa9aD
         O/ScoNir4DxVMQXED+hdEKVyqHf6kzw6Xxq5dT06g4W3wySF032wYMzUtTUZiZiWemhF
         UrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nYSyg8L9M5z+qBtwq1ZJJwTOzPdHBSzFb44dE30H8ek=;
        fh=oZ4PESySny6KkLw7ddFZnisWn+fiLxxiPtChsl3E3ns=;
        b=gGHSlqlgqiRP7BkKRX2tBcPQrTcUDSIyPlbZ2uJLYYxG5p68c0gIsLAcq/xcwk8RRt
         0Te+EazGFnhl0fbaUsDbJVy2nV4xu7S/ZyBUtE8Oj/jkqKhDofhIbZjfVuYj0OJk4qLP
         mxVRsLn5lYqHwgftRo6v9DJ/srm6gl8k+s6cL/BWrdeML4i2zI9ZP3tfRrKLRiKVv+DF
         EO9waxWAUfyyQ2NZ5FvpaeTH11k6kOu6mt+m7EH4tgwGbjPOjcVqOVBijPCBnRelnQhW
         374fuWxn21jzyPKN+4GZ9nIi7oW1hxywuN9XciS9gZgCKe/3go4X+0Z/eAe4/XwsH1rR
         TNPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778660661; x=1779265461; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nYSyg8L9M5z+qBtwq1ZJJwTOzPdHBSzFb44dE30H8ek=;
        b=Kqg1XO9nbh7q8p0a1t7XEw+Y4lDPmbjmo55dnDhPIiAfF4iTktpOeptG95GXVTdgCh
         QcgIOvPZl30wnfrF7JJiKzFHXo2upbkdLI9xC5MbWNsnv4Fq2657yib7J7tTo35oFkAi
         IqsWa9xnmPqSUkS98scMAvUBOIoyLMXfF10WHtAcf/7giPQi6RNLH5UrzJra9s1aUIVs
         HRdW2q1qWxChKtCBjL6nQ4Av55Q2BAquHEd34qqfYuRZ30xWf7tUySmmHhgEqOe8rFWl
         WB0NlxS52Gu3rViV7/5MJOrS45xgGiyRX2tWxZ/TE3EKSa3+ezehcsZ8LUu2lhtbllxL
         KkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778660661; x=1779265461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYSyg8L9M5z+qBtwq1ZJJwTOzPdHBSzFb44dE30H8ek=;
        b=CFr4uj5QyzmOytT3ctGpAzQn9fBXh1tNoNuY0JQ/btQJq+4KO+GUNb87RGUVHPHvv3
         fSIlWehaa7aiErtBg7WwsiSZDqqQv2a2PGS8/YrshMmbhVKxdARhd6Hr5B0CoqOcQY4t
         x8DCY+MnZqCw/5azn/27T9xpuoYV+iYoFal+QZgxNpnT9aB/9Vvxi4iDAOBDq14g4Pe6
         /JYlxNKaDYgqvUJRQDuu8bivuUgbGfYdI/476SIXPxuJMo8X5OUc0Ld+jNtAbDMFD5JG
         jRj4leOK8+4JqL2PSnmIl1+Ne6aBCI3aIG1FRf3YgAP2x9rAYrM6d70yp4Re3XnD652R
         zBzw==
X-Forwarded-Encrypted: i=1; AFNElJ8YJy1w4uDHQmWR3Ibnlyy0xPd+P3evSngT3G2uqF0Zh4aLvKRAW86yHp0PKmZmJZ0/8m7Cn0QM9Ttq/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjSQCp2y++Y7YStW0wn1A8fsWjkMD0qr0tH7y6apCTFr3qAx4W
	vkOq/8hkwogf9fEY5uIzkpMi5pLdU1ZuCflnXaabirl+7mLMQFXNoFezgmEvrS26aY4x/qAFZ3Y
	d/bEwy6WGYVfuL1s+f7WaNtvHg8K7zsg=
X-Gm-Gg: Acq92OG+2rxUPjWgPboEulyRJCpDhHkpy9JwzshLcyd1l8gV+XPp6Zp/NDBQWta/cn/
	cDtNBmpsFIvV5aUG89P8dFmorU1IvUL1/10R27L1vYaaUmJle3ZAkDsiwmOsq0CKccW9ASB5KwS
	+xwhO6QlfUGqg+/0aVEWiDXAu0CA3cZo8iya7qvFJ6VUBxiqMm5nYmKBRN0D9yJhOlnduJjMuF0
	2oIbvqKoacsRD9eDSm3ee4E5Ibtzc95e9vKdC1BAM+xN+lvcp1iLpw7zOK7jxLiVB9n0CS8PPM0
	HeMJAw==
X-Received: by 2002:a05:6402:3112:b0:680:c7b7:25bf with SMTP id
 4fb4d7f45d1cf-682558f0800mr886488a12.6.1778660661158; Wed, 13 May 2026
 01:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
In-Reply-To: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 13 May 2026 13:54:05 +0530
X-Gm-Features: AVHnY4LhB6N7LiGPVl7TNwMFIk5YuvTL8zITcPKn8T3qoq1cfBO8XJO_5-DoyFc
Message-ID: <CANAwSgQvGy9LMmHczxUSYDAq+fCFHctR=wbNr1=f+sLTts-9uA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: drop unnecessary power supply from PCIe
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chukun Pan <amadeus@jmu.edu.cn>, Andre Heider <a.heider@gmail.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_012423_860898_94A99D94 
X-CRM114-Status: GOOD (  23.51  )
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

Hi Yixun,

On Wed, 13 May 2026 at 09:06, Yixun Lan <dlan@kernel.org> wrote:
>
> The PCIe Root Complex found on the SpacemiT K1 SoC does not require
> external power supply, this match with the dt-binding documentation[1],
> Instead it's the sub node of PCIe ports which should add vpcie3v3 power
> supply. So, explicitly remove "vpcie3v3-supply" property from the PCIe
> controller.
>
> Link: https://lore.kernel.org/all/20251113214540.2623070-4-elder@riscstar.com/ [1]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> The problem was introduced at the time of PCIe DTS first committed to
> kernel, the vpcie3v3-supply should be added to PCIe ports instead of PCIe
> RC node.
>
> Refer the example dts of Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>
> I'm not adding the Fixes tag, as this doesn't cause any severe bug, thus
> not necessary to do the back port..

The vpcie3v3-supply is required for PCIe operation.

However, according to the device tree binding, vpcie3v3-supply is defined
as a required property of the PHY. To align with this binding, the supply should
be moved to the PHY node, and the PHY driver should be updated to handle
enabling and disabling of vpcie3v3-supply.

Thanks
-Anand
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 2 --
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index e20daa50a152..c70081856606 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -316,7 +316,6 @@ &pcie1_port {
>  };
>
>  &pcie1 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
> @@ -332,7 +331,6 @@ &pcie2_port {
>  };
>
>  &pcie2 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index afaad59e6bce..7e5915023eaa 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -313,7 +313,6 @@ &pcie1_port {
>  };
>
>  &pcie1 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
> @@ -329,7 +328,6 @@ &pcie2_port {
>  };
>
>  &pcie2 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
>
> ---
> base-commit: f068b204555ad62d6a841a49feb4ea8c4f45b25c
> change-id: 20260512-k1-pcie-fix-supply-d12f6d50d8d4
>
> Best regards,
> --
> Yixun Lan <dlan@kernel.org>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
