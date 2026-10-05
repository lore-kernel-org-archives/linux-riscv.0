Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE22CA5FF5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 20:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AM2gcrJ3O4o/08e/LpvDju7ssoM+dsBdJg/UcaOgK7U=; b=NTK9NxaWsVMyDF
	xF/dwu0GlplLeGa1nhwbsbpx9b3KimNlGOtx+wJC3WcRW5w/ro4EnqOiwqUQgdQQxUcIpUQDdyKxK
	YKpiWbuOiPdTV+IrSh/Rlt4ZHYZ1DgZXx2J4Q8FQZEOYXmp9RGvyOX6Yv6MYrYKPcifQoab88hwkq
	+cY5XWTkgl74u0MPlHNeMoDPo8JKwi+Cpcz37SaYojyB+pjgz3NQqHli3LrS02ZaHtlC08ZMvypW2
	MX5zQRx5HJRoZy2isoqk7mHMd0yv+SonLMGl2HsIa8w5AigKjVlET0uQm4z+5EOqzsjXVFJwIn/bC
	EBjB9A2jlL7QkXZaFnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDp74-0000000H7KU-1Ccn;
	Mon, 05 Oct 2026 20:16:42 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDp70-0000000H7Jk-2zFM
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 20:16:40 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-8ac8a2ac52bso2509197b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 13:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791231396; x=1791836196; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nCiUSXl1sTqT+a31rbofdcXjLxgQuX1RkjO3vSRBV8Y=;
        b=IEfg3U6iBqP19/dzwLitaW+L/GjNTlmkTtx/1UBuV0fEYkqHqRpzfoIzXkmOAkMknY
         7uRU/LOUa3zbnEjG17wuoUIwGEh/3CDMJQjCbifECgQFAbwN8gTx+1lK95mpKnkVNo2y
         x7tNA/2CRUxKPrTQlnSnNya98/zH4oowD/st/MTLqhZJCFkEf4KXS5IfINN638cMi8zg
         /EU3USlm6ziT5t5IEVRtrDjDzm5ble9Q3Hqv1573MrPWMSJgTlqMvBOgAdm76krcDJgk
         tV2XTCcAn5FqYk8r6Asph1Dtosoh8Yxw1Ro8vvwNtf0wtmnAFIu3NdL1KBcu2XuNW/+P
         QyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231396; x=1791836196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nCiUSXl1sTqT+a31rbofdcXjLxgQuX1RkjO3vSRBV8Y=;
        b=suJ96oaGNqqa8zbeo8Vstmg5c5SK5hB4YAoqvHJPvDhG8LFVS2badEtW2at8fo2JNI
         Ju47kShVC0CfJQbCeCtHhM08sYjDfvP3+iadvSr+HSvupl32YSGdm0TYIB3NJyj9DDSj
         is4UxMPXH5lut6ktjCwlK9GVUGENWkal/r3EJNoaoJYzHQ+tNFK1TYzkg90tLaSyHGBb
         GiKujoUUKq9FnvbYzC8dx6158jmEAmHlWZvGPrjOZ4NDLi9Zh8EjnQuEp2UilWy6sjER
         YcvhSW0Ir9pjsmJB6zM6a2E9KuUVGkdvFE+58zHMC7qJ6coBIvWMWElniuM5LKDnk48O
         zfKA==
X-Forwarded-Encrypted: i=1; AKwUvBzJ5qTDMwY/z8Qyp1z18N6ers2q4NRFKYIpAYIvyUyT1cRbFzck/v2MKHWGgc7490ASYBPLeqvLn1yoyg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLN8B7Lwx+DHLTzeJ5+BacsGCx/5INkz7K/aR+aB3syaCOu+ETF
	fChd6/UQm54g0b+eS9RvFFEWEHLbkq42JaPE1EIzGAW0Nw2AQza9u/VPCY9taZJx1CQ=
X-Gm-Gg: AYBFou2udjbsKhl/dSZtvad1CxN4H4jm6TYa9OAnXmmcX9J/NH2CV27PvXW41qoKWcD
	jZSuZ0SQd9q0pktQs+xfvm+DcPzbDW0Q/tb+lj8Mm4hVPj8CcB7isVnC59wSMAsfHy+7T8Vz1uT
	naOg76XWbaPe7hQZFAmdGwS0Ecb5gBqC+vRoiBe+X5dqGb9TsBbqVKDXs6MBISnxZspDDWGzYCW
	LQqPUV43FNNKF7XnLOIuulLhIOn0wMN4inJiTl5S3h2btjWlGwPSFbszzAZm58gf/oOGEt52iNo
	SoEP/HGQ/lOyBafCJaDuR3+0Vt2ch3KbtTd3aqHgcSSaF9pZ/l5E7TqFWVHVO5EPIHt4sSnq0Rh
	zTQkzNGCJPbjHDLneTlezpmjkYxRiyzi+YBJbhCZn/7z5wVOdD6MCbyQaAp8XmMPEuJb5MZ5hw5
	n586EqF4uxLD2z7gRB+wvgeT19bsNhQhNYdniLwQJImc5KJTwH67v9gYLWoVG59igX5Fn3602kh
	G70yDsSJnl6Jss5wW58iXchVffd5/wPmDi0mQ==
X-Received: by 2002:a05:690c:7448:b0:8ab:3938:dfbd with SMTP id 00721157ae682-8af721149cdmr3487907b3.31.1791231396588;
        Mon, 05 Oct 2026 13:16:36 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8af515d034bsm12664527b3.42.2026.10.05.13.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:16:36 -0700 (PDT)
Date: Mon, 5 Oct 2026 15:16:09 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
Message-ID: <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_131638_905088_29750211 
X-CRM114-Status: GOOD (  21.03  )
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

On Tue, Sep 29, 2026 at 03:10:11PM +0200, Lorenzo Bianconi wrote:
> stmmac_update_subsecond_increment() ignores the error returned by
> stmmac_config_addend(), and stmmac_init_tstamp_counter() discards the
> addend and system time programming errors, always returning success. A
> failure to program the addend (PTP_TCR_TSADDREG) or to initialize the
> system time counter (PTP_TCR_TSINIT) is therefore silently swallowed,
> leaving the hardware timestamp counter in a non-running or partially
> configured state while the driver keeps operating as if timestamping
> were up. This matters for TAPRIO/EST offloading, which derives the gate
> base time from the hardware timestamp counter.
> 
> The same hooks are also called from the PHC callbacks: settime64 and
> adjfine drop the error and report success to clock_settime() and
> clock_adjtime(), so a dead PTP reference clock goes unnoticed by
> ptp4l/phc2sys.
> 
> Return error codes from stmmac_update_subsecond_increment(),
> stmmac_init_tstamp_counter(), stmmac_dl_ts_coarse_set() and the
> settime64/adjfine callbacks instead of silently returning success. On
> failure, roll back the partially applied configuration so the hardware
> and the driver bookkeeping stay consistent, and report the reason
> through the devlink extack. Also guard against a zero sub-second
> increment, which would otherwise divide by zero when computing the
> addend.
> 
> Reset the persistent timestamping state (hwts_tx_en, hwts_rx_en,
> tstamp_config, systime_flags and tsfupdt_coarse) when (re)initializing
> timestamping, so a failed init does not leave TX/RX timestamping
> enabled on a counter that never started.
> 
> Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to generic HW Interface Helpers")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
> Changes in v3:
> - Do not run stmmac_config_addend() in
>   stmmac_update_subsecond_increment() error path.
> - Return error from stmmac_adjust_freq() and stmmac_set_time().
> - Reset hw ts configuration in stmmac_init_timestamping().
> - Link to v2: https://lore.kernel.org/r/20260924-stmmac-ptp-added-systime-error-v2-1-beb2a6b5f866@oss.qualcomm.com
> 
> Changes in v2:
> - Initialize sec_inc to 0 in stmmac_restore_subsecond_increment()
>   routine.
> - Link to v1: https://lore.kernel.org/r/20260920-stmmac-ptp-added-systime-error-v1-1-8ac9e7a3fce2@oss.qualcomm.com
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 106 ++++++++++++++++------
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  10 +-
>  2 files changed, 84 insertions(+), 32 deletions(-)

Hello, I'm noticing that after this patch was merged into linux-next,
boot seems to hang when ip=dhcp is used because ethernet isn't working
on the TH1520 Lichee Pi 4a. These lines get printed in a loop over and
over

IP-Config: end0 hardware address 72:ca:a8:eb:27:[   24.872982] thead-dwmac ffe7070000.ethernet end0: Register MEM_TYPE_PAGE_POOL RxQ-0
f2 mtu 1500 DHCP
[   24.900412] thead-dwmac ffe7070000.ethernet end0: PHY [stmmac-0:01] driver [RTL8211F Gigabit Ethernet] (irq=POLL)
[   24.912780] dwmac1000: Master AXI performs any burst length
[   24.912801] thead-dwmac ffe7070000.ethernet end0: No Safety Features support found
[   25.010229] thead-dwmac ffe7070000.ethernet end0: PTP init failed
SIOCSIFFLAGS: Connection timed out

I suspect that this has something to do with the error codes being
discarded in your patch/some particular quirk of this hardware where it
doesn't support these PTP related bits.

I've CC'ed the linux-riscv list, in case anyone here is more familiar
with this particular board and knows why this is happening.

Regards
Anirudh Srinivasan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
