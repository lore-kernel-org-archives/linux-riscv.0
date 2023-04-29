Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9F2C77B7C
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 18:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P0ILZEGz0w2wU0YkhmSG1hpwMNifzKpo5bfvqsyNMfA=; b=YRO+tYBfMC7ILjXOaEWbKav+UO
	Mle8uO0SS0CwdbpDoMS7c2QIioE6ytlN6ZRifQKef/D+6QRfw4BFVEIVF3LI02I/boCHRANncSyLX
	r4mp+DM1+tPVAlVvQPfIscSP0eXhPp7Fvcz2yhoW/r0ENtqCAi9XO7STHn8lf4iTDIjpr/+kGXEbr
	jyy6r3QO9jCQb/7MQViGMheWpIHQfyWdblmWY06yYnEyzH9hgAFANMFnoWcO49SfQGri2ZoQww+Mg
	KB1g+tVwnRSDZZoaiXWVNfuBCqFKOJOnxhvKkxckiHRxWVEu1WkqDtkawDKXKTR6dE6drIo/Krdn5
	C6NMCR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pspFk-00D00L-2h;
	Sat, 29 Apr 2023 18:25:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pspFd-00CzxV-1i
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 18:24:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1a6670671e3so9276615ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682792692; x=1685384692;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGl5HMSK57VmBSwKSnwgm3VXr902jH6XBJlNczgIzTY=;
        b=l+H0JwRFKwAD4TzkKtg69sq/SE0iMjDe/NX6Txlv16Ba4kBdBRnOLJE9cuEp/EtowJ
         pvTfeswVQQvBqhKyncNpPdAR29BMkNe6LB9ZMzoVyBV5Q9aGwXPM1Fc+6Qr50SDIiKsJ
         q9xyHClsPNOcAaBRr9fQ8UfCjonz6jsBwXrYvJjTpLiOgKgKgvN8uwk1fTPbl8XK+035
         m3QY80DvBeDJf799u5hnhHuLgfMpPNb4a9jtTjDBw2OzLziw75OHG2J322CH+dAw1HCw
         HsmmVI7grjIDtuj7uBS5rk+EMADzgTEglzedbNWVOsorwBluoILEBWp5M0RLFiHKNfCf
         2+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682792692; x=1685384692;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGl5HMSK57VmBSwKSnwgm3VXr902jH6XBJlNczgIzTY=;
        b=SAoQ5XZso4bcIIYrpdnr16eb8e2/v30+AB5d0ipdLMZs5Y1LEGUmC84bQ/kwF8kubK
         3hOcC7wXb+zqrPrRth4tKXEodZ2KGhTru3q4p9E5nSoNNws7JMHfWo3WF36ESwBmet/R
         R7U/WzvRCdOFURn5zKPAuCbKoK84xtFSNUTu9Kypr9o7nYY/emENu1WbVqXL941JRgSR
         vFDy3YBXjm1Cip2Yu/yqPthhtck4HP9kNfksvRLjtJ4XCyiBBh0NfgssP2yqwQfTSGmc
         Z2nCi9FKjfAM9LR7sXqOeCl0rat0ptMOxkpzSPTFMgmrAQnyAdNKAGGrAAEqpML1W1bv
         miSA==
X-Gm-Message-State: AC+VfDxDvqmFhptTiwdCzkvvVepiioJkLcpgR3Cxm8Xo3UjTk2rkcmUo
	R2vzwI0eHo05DzCdjmpdcr4ZMQ==
X-Google-Smtp-Source: ACHHUZ6ZiLzN9eR+ckFMqg7tN3D4bPpq4geojnHO1Jqz7HXa46oxZHVvxREPvQQtQygRvSqX/lxFkg==
X-Received: by 2002:a17:903:124b:b0:1a2:8c7e:f315 with SMTP id u11-20020a170903124b00b001a28c7ef315mr10630845plh.21.1682792692014;
        Sat, 29 Apr 2023 11:24:52 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z2-20020a170902708200b001a19196af48sm15137375plk.64.2023.04.29.11.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
Date: Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 11:24:33 PDT (-0700)
Subject: Re: [PATCH 09/19] riscv: cacheinfo: Adjust includes to remove of_device.h
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-9-581e2605fe47@kernel.org>
CC: davem@davemloft.net, robh+dt@kernel.org, frowand.list@gmail.com,
  linux@armlinux.org.uk, wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org,
  daniel.lezcano@linaro.org, tglx@linutronix.de, amit.kachhap@gmail.com, viresh.kumar@linaro.org,
  lukasz.luba@arm.com, amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
  angelogioacchino.delregno@collabora.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  thierry.reding@gmail.com, jonathanh@nvidia.com, tiny.windzz@gmail.com, lpieralisi@kernel.org,
  sudeep.holla@arm.com, agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
  anup@brainfault.org, chenhuacai@kernel.org, jiaxun.yang@flygoat.com, Marc Zyngier <maz@kernel.org>,
  vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, sparclinux@vger.kernel.org,
  linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
  linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
  linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh@kernel.org
Message-ID: <mhng-8827afbb-9f5f-4a6d-b528-4b79b1a32f8a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_112453_606988_259D7BFD 
X-CRM114-Status: GOOD (  16.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 29 Mar 2023 08:52:06 PDT (-0700), robh@kernel.org wrote:
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  arch/riscv/kernel/cacheinfo.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 3a13113f1b29..e3829d2de5d9 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -5,7 +5,6 @@
>
>  #include <linux/cpu.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <asm/cacheinfo.h>
>
>  static struct riscv_cacheinfo_ops *rv_cache_ops;

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
