Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB49DC624D6
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 16:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryvuWeBHPKw4HfSfcBClGJdqwpbITTXqAWN1xJFk0E4=; b=IorNHzvZYyHzQu
	6s6jo+3ijSH0RmJzYOPk2qc+B6M2Hw36UJvPQ7NyAsKl8qGHpvL+0Z4oSisLuZuLIjAj8Rj+ixT2F
	DROcrVl9fIZPLbSg/THgGA5VsCebRZ0Zf+m5lCwX1Fk/lcAit1dbOnCm0h6Kpj8qBVclSY5IJYtz+
	UW2HN+BK1mhDRCTAT10MiKECnrEkzUqbpbCiOZly8eVvIdJe5VYlJMcGZInyvLy2M9rPfYnC1sKaX
	dqid4dOa2MEkGah87go+JtZA182oQaceF+RmkUt4nD05arIfBVhX4WzpEnQxUCA0gwHu/EU6i1hIk
	C4aZsxRcrF/KhMpcFHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2tTJ-00000004GnX-47Ku;
	Sat, 05 Sep 2026 16:42:30 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2tTD-00000004Gn2-1ad3
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 16:42:26 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-871c8a36fe3so19614517b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Sep 2026 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1788626539; x=1789231339; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KLW1pUYTfPr1fy7y/Zlio4LKr099xCCPQ8MqnoWy0Aw=;
        b=ZYLrppQjzCTQsBXfZ5e54e/9nLdbGNW6xMhrnXQBH9toGU02LutOl5YHx5+74H4XbJ
         KN64pC1U5v1S5CrCKxT33tX2vE7qjoL8gOqL5riaQzEjnMFU6j0rIxShvkzRQTserMTW
         wBpa0gWcwjdVb4KEnCF8kDMxghq6h1hu2dALLxE34G9vdHvxeiTcYZZhUSzKcFMdOLyE
         2ahb1bghH8e+6Dcj5gcgYB48zJr7JC6hFPgFsBVv7WX0WSFmfS4asdo8xNar74b0ZvTG
         1kSEKjkzTkmBO8GksiixkLWkKtx9yUIyEprUwUWmqz22kwBxAe7jGMhWlNBCW5nvN3SU
         /eKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788626539; x=1789231339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLW1pUYTfPr1fy7y/Zlio4LKr099xCCPQ8MqnoWy0Aw=;
        b=kxBBnJGV6KJVP/Pu20EE4qo6G2wKUvYYkUBABHwHqIS9Ahcaqf9PPZHdSwe4UTEue5
         VgXcfDldkIp8HsmEx8o68HqIeaNFBJXmGu4yZWVWefNBn0ArdlCCQaHT23lRgyjBDUV9
         Yrj1yTr4PTo/hR9jK3rRR/pqkLqApWv3tC1asU696wfKgN6ttUvvmMqr6zhzZ24QszuB
         8Nz8DsQC+iVA0auOuVY83d7c2T7wBTHS2IwwRBnZzKQ4k2Lfb7NmhJtMdmnuUMe8TjeM
         kn0rK96dCjp67SP+pvViW4KBycVuxa1jOx9QX/x1alI4aGCu6SnHxuMGfTJq9jqroZEE
         af7w==
X-Forwarded-Encrypted: i=1; AKwUvBwGbeKpWSkbFvAgP8LeV9k+1BDc7yv71GPXBLJlRdWNqzRvsafpk45ytwhy4GkeROlMumFXFCV9WUINQg==@lists.infradead.org
X-Gm-Message-State: AFuF++kmJlPjKemytD3H1ISJPMZcqwYK0hJjYDgAO9gDsipWHVZ/tzry
	zvxM/xSJrXFaYHWZb0HCxQQ/cc2VUuIDRVvWGwCR6Y1Ydkx3Li0bY/0uS+9UQBH2DV4=
X-Gm-Gg: AYBFou0trePqufJLNUrR/wWs1an5LXfhkfOROFvduQkXmgD9JS5LZmAcLalMT60P9pS
	ewpBOOOXnsk6/t+a/CFXGhHWa0zLFSKrfyhmhECZcSZQtjm2pVPOJ/hoCsTLQXxeEMFPQ5kUWZp
	9UI+PBHAs14orX0NnwvKor4Mk1GdaUoajI8VI3c0EnYFU9hWv4oDSL1TJqULLNW2lxkXIo3rvtV
	cxrgCJy4wK+axiyc1FaVrHPvOW5kDfCruqvF8buCGh3tiJYL58OehYw0oRWn5CpItSOjZ3qqKtJ
	GuQvlHD13/0LD+E3Vf4uJkPLKhktCIkw+W0QuErgvtK1SbrSdZJcO0060L7YurNOaFLyayl6sly
	AZnWAIOe+52kitIahxThT9scUUzjsq+BkPixKiU65lACZmDxCHTQwdez9S4mEjKGi6aWADrewqP
	sXEFokM/j+HgYykynM4kcfL9DtoDrwX3+pXeZNZ9hvjIaTq4+BiFfX7qyURiUJJkVyPdgoy6T97
	OvxrhQ2Lm8+gDTQs095ftesyZ6s6bSrCpngoth5D0GR
X-Received: by 2002:a05:690e:4504:10b0:66f:c1bc:c075 with SMTP id 956f58d0204a3-66fc1bcc7a6mr1655174d50.61.1788626538948;
        Sat, 05 Sep 2026 09:42:18 -0700 (PDT)
Received: from toolbox ([2600:1700:220:59e0:9cba:538b:87b9:7f0f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm40923517b3.45.2026.09.05.09.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 09:42:18 -0700 (PDT)
Date: Sat, 5 Sep 2026 11:41:59 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Yixun Lan <dlan@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Inochi Amaoto <inochiama@outlook.com>, Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, stable@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] clk: spacemit: k3: add CPU PLL rate tables
Message-ID: <uyl23bmb7dtvkneu7wbpmq24gkmrpmr5n5xkanjrnjf27xsp6g@gcjezv6xwolx>
References: <20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_094223_743518_7F485C36 
X-CRM114-Status: GOOD (  20.89  )
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

Hi Troy,

On Thu, Sep 03, 2026 at 11:06:24AM +0800, Troy Mitchell wrote:
> The K3 CPU PLL rate tables currently describe only one rate per PLL,
> although the hardware supports a wider range.
> 
> PLL3 and PLL4 support rates from 1.05 to 2.4 GHz, while PLL5 and PLL8
> support rates from 1.05 to 2 GHz. Populate the tables with every
> supported rate in 50 MHz steps.
> 
> Cc: stable@vger.kernel.org # 7.0+
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> The corresponding U-Boot changes are available at:
> 
> - Add the CPU PLL rate tables:
>   https://github.com/spacemit-com/uboot-2022.10/commit/787b5cf44c8dbc99db886d5522c0c9cd5a96ffd6
> - Correct the 1.10 GHz and 2.15 GHz table entries:
>   https://github.com/spacemit-com/uboot-2022.10/commit/16a775c20e9efb54ca55352215e76eb3f12e6cf0
> ---
> Changes in v4:
> - Expand the update to every supported PLL3, PLL4, PLL5 and PLL8 rate.
> - Drop Aurelien Jarno's Reviewed-by and Tested-by trailers because the
>   patch scope has expanded.
> - Add U-Boot references for the complete tables and corrected entries.
> - Link to v3: https://patch.msgid.link/20260831-k3-pll5-pll8-1800mhz-v3-1-530ed0978615@linux.spacemit.com
> 
> Changes in v3:
> - Mark the change for stable kernels starting with v7.0.
> - Add Aurelien Jarno's Reviewed-by and Tested-by trailers.
> - Rebase onto v7.3-rc1.
> - Link to v2: https://patch.msgid.link/20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com
> 
> Changes in v2:
> - Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
>   will be handled in a separate series.
> - Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
>   patch.
> - Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
> - Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com
> 
> To: Stephen Boyd <sboyd@kernel.org>
> To: Brian Masney <bmasney+clk@redhat.com>
> To: Jerome Brunet <jbrunet+clk@baylibre.com>
> To: Yixun Lan <dlan@kernel.org>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: spacemit@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/spacemit/ccu-k3.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>

On a recently new K3 board (shipped with OpenSBI/U-boot dated
end of July), I was seeing upstream kernel boot hang after IMSIC
initialization. Some logging indicated that it was hanging around the
clock controller initializations (k3_ccu_driver_init).

On a board running older U-boot/OpenSBI from May, I originally didn't
observe this hang, but doing multiple repeated boots showed a rare
instance of this hang happening. Some changes were added to OpenSBI in 
this period (end of June) that trap clock controller registers to M 
Mode and handle reads/writes there.

Yixun pointed me to this patch, and it seems to fix the boot hang on 
the board runner newer OpenSBI. I think this avoids some kind of a 
race condition with disabling/re-enabling a PLL that the clock driver
does. I'm finding it a bit hard to explain/understand what exactly it
the reason though.

Yixun, could this patch get added in soon?

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Regards
Anirudh Srinivasan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
