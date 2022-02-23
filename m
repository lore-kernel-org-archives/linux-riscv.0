Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8831C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 02:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AOyOqSHl57SMmNgJt9DCN7sIATiSE2LiYJyJ419Qrgc=; b=v/tmd1Y5Osm9NIfj+LlUGnumKC
	ISwBWSQ89juqvP41Gn4MTP9LpCqOcR8Dl4nnOhTqqYGgHi1jXaJovJg/oyHvI+9yZzWM+RzSNdMRp
	BI9fngbxA0s+wuKEaaFiRKtesx2TeFSgOw9aPjfXMS5+OsVPJM9cbujmqACFHigqmy6PLGb8X1byi
	TJcS7RcxPCqm+ukKm4xzNQe/WQr+q7HDtQOG3dQHcRZraedIOioVnOIdHHdkTDFey8BtSgHaxpJt2
	sctKe6JsWu6YtnNLVbQh3Qn3OkAYxYtO5Q3cUFp0B3U+0N4DqwYsjUSU0gs1pKvkFIDJjaFjCOO4/
	Jx3lOKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMhe2-00CP35-L0; Wed, 23 Feb 2022 02:44:46 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMhdz-00CP2Q-Mp
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 02:44:45 +0000
Received: by mail-pg1-x532.google.com with SMTP id o23so2201724pgk.13
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 18:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xNjYgrxzvgqZSCGyz8v0iYxpUnXWeVHH7MAvsOkAEWE=;
 b=gyTLCGco8UgxWqpc1mHWpiDeHOAUXUYqpWpL6DHlYiOhQhVStVX/0CizQEUEEf6Ek6
 6cE8tfbn716P1QeL/M5pLJ7jml2PTvU3l5ZUIbgfyn0Qii7R7U+QU58IwWSRUX2kLuVY
 PzvdWxgFKUZR46mmbVoXVOXnAEXLrLrvMmaqaDodzTD1l5PrM+xetN61lEiCZT9PhR1x
 TrTrH+jkgy9beilU4DoolRGKkqafCWeU3dLDISlsWHrO4RKxfu6jtQ/HNZvd07UZZEfN
 heIyo6b2493n/Hlfl0B4t6UtIVyfqPlppOCePmP3JmBLwX/FzIjjvu+JFv4V4og7rYa8
 zz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xNjYgrxzvgqZSCGyz8v0iYxpUnXWeVHH7MAvsOkAEWE=;
 b=C6dZlvEw+Bu882XJrD6C12OZbqkxJG04xV/sEbFOHV+MRkBCkJY6BjNfeQXnVDEvUt
 vUEbRN+Z4uGfRuanT3fOqofaLHtEa5HxPIE0OhhBukhXvq3wPteowVO1bfVXTSol+nje
 E5i8cgZn50zET0ag5DimCpoIu51qxonhUTpMT5S26asot3yQf2R1qC5auTwZQqmeRuPm
 93a14AP6y1wVeRbM+bK6dp6OERMFlyCe4JylWbf6aakjPmFQoBUcJ7SdDLEFlAFJfFq7
 SjQNZYhGbAh6YzjrSkEbee9H9yIWLZ7BIkxZCWDP46jY8sP6PU+YXghoLX5KlWrbNNsK
 Musw==
X-Gm-Message-State: AOAM531Ry605wfAiUzIVqthwYpyMh3WFEpokzSmtbPjEeSeJq8+zIrGe
 M0py5cL0cSuNNSQdy3TO7cQk5w==
X-Google-Smtp-Source: ABdhPJyreK6PKQ3KuTbaK6YuupZTHlnoLZGp58oZj7nnXEKs5xZzuEkujwQ4RLy8w60BNXKOV3ZAPA==
X-Received: by 2002:a63:e5f:0:b0:374:62d8:c551 with SMTP id
 31-20020a630e5f000000b0037462d8c551mr6736173pgo.129.1645584282472; 
 Tue, 22 Feb 2022 18:44:42 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id u39sm19835143pfg.195.2022.02.22.18.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 18:44:41 -0800 (PST)
Date: Tue, 22 Feb 2022 18:44:41 -0800 (PST)
X-Google-Original-Date: Tue, 22 Feb 2022 17:49:57 PST (-0800)
Subject: Re: [PATCH] riscv: defconfig: enable hugetlbfs option
In-Reply-To: <20220204152347.1469380-1-mchitale@ventanamicro.com>
CC: aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>,
 anup@brainfault.org, atishp@atishpatra.org, linux-riscv@lists.infradead.org,
 mchitale@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mchitale@ventanamicro.com
Message-ID: <mhng-39da5f9b-10fd-4244-bcc7-cd636ae6f46a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_184443_833384_CCA4A801 
X-CRM114-Status: GOOD (  14.87  )
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

On Fri, 04 Feb 2022 07:23:47 PST (-0800), mchitale@ventanamicro.com wrote:
> Enabling hugetlbfs in the defconfigs to allow tuning KVM
> guest performance using huge pages.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index f120fcc43d0a..7cd10ded7bf8 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -108,6 +108,7 @@ CONFIG_MSDOS_FS=y
>  CONFIG_VFAT_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_HUGETLBFS=y
>  CONFIG_NFS_FS=y
>  CONFIG_NFS_V4=y
>  CONFIG_NFS_V4_1=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 8b56a7f1eb06..e0e5c7c09ab8 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -100,6 +100,7 @@ CONFIG_MSDOS_FS=y
>  CONFIG_VFAT_FS=y
>  CONFIG_TMPFS=y
>  CONFIG_TMPFS_POSIX_ACL=y
> +CONFIG_HUGETLBFS=y
>  CONFIG_NFS_FS=y
>  CONFIG_NFS_V4=y
>  CONFIG_NFS_V4_1=y

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
