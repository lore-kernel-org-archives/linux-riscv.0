Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A889C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 17:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF0D20851
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 17:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TjXZ9shd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ro4axiIX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF0D20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=rS7WBwU2LWkRvAljKzlyiRinBvxfTcvKAB5W4T8/j+E=; b=TjXZ9shdpn4r3KqpPo6f6U9Bf
	OHsWUL1H/rLoy7yIHDqrR+YWSf7tzqB/YK1dRWNM/+T3u9vxkqVTQp5MHg03yz4YcJ3061E2i3Nte
	QriWtM+Uhi+5AECgQ+X5MpZSNlqYB/uNXp57pV74jN+CgBw5VJ7p4hMO1haNq+HuKMak0IiOpo2AE
	DL49uTjYdFtnZKa5a4oupOX0ckfPcz2qa0cOQr65+3vd8obJ28TVOyF/SdNzYlyiqwk29u01CRvuu
	9DjS0iIHEceo7hW6cjX+zBWAW44eaMfFmEq+wI3WdvoRi+jmg35AgL43TtFzxtADPgVh3V9YXDhB6
	aprDlVMgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWPdB-00069S-Nv; Mon, 10 Dec 2018 17:46:09 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWPd8-00068u-Ms
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 17:46:08 +0000
Received: by mail-pg1-x542.google.com with SMTP id t13so5281439pgr.11
 for <linux-riscv@lists.infradead.org>; Mon, 10 Dec 2018 09:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Mqj/hInBJrqadxZw1FUKIU4EFe57TRrDWBMyK4jWzO8=;
 b=Ro4axiIXscgWZwW29Zh2WMOeJEAT1tBvzhwl/YxLwynaEnw8UW7PnCPaD2Iif/ncCf
 jG4/0Mk4/bN06c9JL/mJ1EFv/iFX36jegoeng03DKaiNomNuNM8IQ268eaCKdgDVtvdT
 oSzpUSPFoXW22zuXSlYhnnqzaNqJkuy7HbQpTM99eQZSddah7wknnGKmhsIzbicti1q4
 XDTYMJhEtrlavW7PsG9mMD87XR2JjNxNJ3KqeFwd3T3I7Sh5qy0b/Ppuih+kD6WPHcU5
 +3j/Es2l8Kekh0Mfd3YTCe9NMmw6RrGlQ+oeZrF87nBJnak2tIUvOXFVM4nVe5WJgcaE
 x75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Mqj/hInBJrqadxZw1FUKIU4EFe57TRrDWBMyK4jWzO8=;
 b=JJa1XySCUSLZlMQ7h87/SP8GSaA8IURDgzc76+zYVhJlJU3VNZ5zMmiyZ3u/+a3OA3
 KGoLOJYJG5ErP8F8oiDM7oNHO0MKwAN6t1ka+QCDM3iYhGFBC57ouwCa6nnZbdd7M8+e
 2CRPTi6GP0mwrRqSwXyLEdEvwJkqes8a4JK9opLmJLJFiSItfhH4cud6ReCGsX0fcoV5
 170HAE9NuO8ZJC4RhuvVHMUDhZKqxer6g13CLx/pqv9DZfkNNeyUyc/7I93USCu5dXfq
 YLS2yTWIpNaneXpEmzCMnTb2ZnxGWGvqP4snBsq0NYDxju3kkDdJFIdPTXcbqhUP5Wcu
 SU5g==
X-Gm-Message-State: AA+aEWbCO29tK+pj8uq/dRJr4hjFSKFrLfhdKnHt1lyfx/nXsBucqZw+
 0geBklqm1hIHkGfOSiQxl02fUg==
X-Google-Smtp-Source: AFSGD/VAf2Szn7csElez15lhlfrz+WSkI5N21wiVT3wuekfJfQmpu5cJXDNRgZ3lOtwpnOku90UFng==
X-Received: by 2002:a63:e156:: with SMTP id h22mr11703038pgk.255.1544463956129; 
 Mon, 10 Dec 2018 09:45:56 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v9sm16920525pfg.144.2018.12.10.09.45.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Dec 2018 09:45:55 -0800 (PST)
Date: Mon, 10 Dec 2018 09:45:55 -0800 (PST)
X-Google-Original-Date: Mon, 10 Dec 2018 09:40:50 PST (-0800)
Subject: Re: [PATCH 1/5] clocksource/drivers/riscv: Change name riscv_timer to
 timer-riscv
In-Reply-To: <20181210165243.5625-1-daniel.lezcano@linaro.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: daniel.lezcano@linaro.org
Message-ID: <mhng-fbeac354-518b-4c8a-94a3-ffc4f7a9dfd8@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_094606_771188_DAF203A2 
X-CRM114-Status: GOOD (  13.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, tglx@linutronix.de,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 10 Dec 2018 08:52:38 PST (-0800), daniel.lezcano@linaro.org wrote:
> In order to unify the names in this directory, let's rename the driver to be
> prefixed with timer-*
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/clocksource/Makefile                         | 2 +-
>  drivers/clocksource/{riscv_timer.c => timer-riscv.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/clocksource/{riscv_timer.c => timer-riscv.c} (100%)
>
> diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
> index dd9138104568..ddf697b29df9 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -78,6 +78,6 @@ obj-$(CONFIG_H8300_TPU)			+= h8300_tpu.o
>  obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
>  obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
>  obj-$(CONFIG_ATCPIT100_TIMER)		+= timer-atcpit100.o
> -obj-$(CONFIG_RISCV_TIMER)		+= riscv_timer.o
> +obj-$(CONFIG_RISCV_TIMER)		+= timer-riscv.o
>  obj-$(CONFIG_CSKY_MP_TIMER)		+= timer-mp-csky.o
>  obj-$(CONFIG_GX6605S_TIMER)		+= timer-gx6605s.o
> diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/timer-riscv.c
> similarity index 100%
> rename from drivers/clocksource/riscv_timer.c
> rename to drivers/clocksource/timer-riscv.c

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
