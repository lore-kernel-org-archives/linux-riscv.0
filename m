Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27AFC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 11:06:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E7C23D98
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 11:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43E7C23D98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y2TTGE6va9dWKSo48sblYl2HeVo39IPdO0J1ctG91c4=; b=nBFc9J5JpWCOxNWhaI+j3HQD7
	3qblcaUCA2TnMNSXum1Zx6m4tGLQpUVtzVo72K51tPa5TtJx9NVOJtJykTqpz5nAbtLVVel8BY7vo
	QlbGh16BG6nmdMPunxX63Q/pXvDMXzPb4gg9xn/glyC7/y5HOgwkLK9a23zrK235P45R/NJr8bsmX
	hStQqtM5CpaKzW9EpBlJGgIUfLRn+o70uCsGOgw5PmkOAN4v/r6dP8UIllepagVTBm8dZa+U3LIWA
	YfWkQVN8ZBxWNAt7z8ApEGcdYxKvkS+wuLq3NRij3KI0sNSdUWT6jBUlOG94RE8xrD1TyKmMP1Cfg
	SJ/f7TkdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knJmW-0007XX-RH; Thu, 10 Dec 2020 11:06:44 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knJmT-0007Us-HS
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 11:06:42 +0000
Received: by mail-yb1-xb44.google.com with SMTP id w135so4304482ybg.13
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 03:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ETGSMY6awNXPXPJo5cOg9EbQ8Jdr01cRs6yp25MZwq4=;
 b=CEUoIrXzXOfWzXkhrhgG4vM6yIbY5CUSJlpFuQhAg5ptSMGwa1BQYNQ+ZRmvrcddpl
 A5aBXDOuu4LVlk2ZPoiJJHBKvULxZf3hwBz6Cgbm+y/E6ZbvrmNG69esnTt78RoX9wcr
 xr3EHyggFRodZCQbnudjL71WPq0w7OjadyqUPpwN0Z9hI1DExi6twGG1CrhEFAOUA7zR
 gFZY0mbcXV9UcCBv42CmbMPD86CqVVDLqC6M1JRX5NmCeigwekfkvbxCutl6xa2XdqP0
 MG5J5KWGgiq70KU7nB5tBoocydlp1lZtw5trZDzaxybp/BL08jqn+S4hQ7MmbdYvY8zB
 JhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ETGSMY6awNXPXPJo5cOg9EbQ8Jdr01cRs6yp25MZwq4=;
 b=XugTcqPX9cG9UiNtJN32F2hQ+xUafq7rXKrb2x39isUSD4OVMhi6Z38QFy7niWFajS
 d5Gq7DRb8ay2LGgU9f2akXdoPbBTk+OoiEJyYF0GF3BRBDa7nPNv+ZDyKLbC2FiPTB7L
 XFqEoy/5hePvS0tfxVYvKYrMBHBGKcbFHKgI9AwTUMWpHNnGnVowoavdXhhaCgz5BsYs
 0dUretikDE57Q4KnlO1t7uII+nmP4RH8+QvM3tK72On+yri0EZIPbNhqy9YY63iu72tp
 ObLgSqAHcJtRYtbYpFY6ThuRcsKUHSDKhp6dtUjmmZSoe+1ad+d6PXu3ElC2PU89ZpTJ
 ipgQ==
X-Gm-Message-State: AOAM532eX/ZJkEL8GyscTFRwv5doGbgpFocNpp+LLVYKYcqXqTrVhFlT
 rFAY7Vf/XjwOhUcZxbnJBLjujzNXIvbZL9CFcBE=
X-Google-Smtp-Source: ABdhPJyUHpmghvFm6Cre6IHt0eY0oQI7lbjRspYTn+O1XN7rgEwvLPWvYc1jGSRyf2hoesxTlyH4AVRtUf7f/f1rej0=
X-Received: by 2002:a25:690b:: with SMTP id e11mr9980504ybc.314.1607598397208; 
 Thu, 10 Dec 2020 03:06:37 -0800 (PST)
MIME-Version: 1.0
References: <20201204085835.2406541-1-atish.patra@wdc.com>
 <20201204085835.2406541-4-atish.patra@wdc.com>
In-Reply-To: <20201204085835.2406541-4-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 10 Dec 2020 19:06:12 +0800
Message-ID: <CAEUhbmU4hrVRGs30oE=GK42NUwpgOtnDXWRcE76xdxmC-z25qA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] RISC-V: Initial DTS for Microchip ICICLE board
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_060641_594701_73A6747B 
X-CRM114-Status: GOOD (  10.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>, Conor.Dooley@microchip.com,
 Anup Patel <anup.patel@wdc.com>, Cyril.Jean@microchip.com,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Bin Meng <bin.meng@windriver.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Ivan.Griffin@microchip.com,
 Albert Ou <aou@eecs.berkeley.edu>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 4, 2020 at 5:05 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Add initial DTS for Microchip ICICLE board having only
> essential devices (clocks, sdhci, ethernet, serial, etc).
> The device tree is based on the U-Boot patch.
>
> https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-padmarao.begari@microchip.com/

There is a newer version of U-Boot patch. Probably needs to sync again.

>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/microchip/Makefile        |   2 +
>  .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 331 ++++++++++++++++++
>  4 files changed, 406 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
