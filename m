Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B15C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 17:59:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B789020868
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 17:59:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tSvDw45d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OK7/DQPU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B789020868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=+9RtFgUk2LBROa7OPz9Osu/4bCXUwjAATzfwZOggCuk=; b=tSvDw45dzf/9edFmHblhCjCyc
	j1UL8/Kkp/bve2IYN50X/hNm4/C+Co+VIVzHBXR5XhEzsBMRkeipgzQ/B2T+3HF00D9bzY4lNZUl0
	HaLApHTxnU0xgB4xSVZJw2Fj+dgg5wLk4/rqlK98vghWKkVcprxHgqaTAv8cevJxH4ZFzhhQ5plPm
	S3XbCXe3HpS6gE89DlazvJFaf6pqQc37aEAmzOyPyOpQG6IDDu+bL7jzZt8quzJr21WfKuAMVnkz+
	R82hLyL70Znldx+LpSFtYlwny9dNNUA+udcjiRzECg870z8k58tgjcGd1Z8SVBnB+fa4mmHAC8dsh
	s4Aq6skRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVKP9-0004d0-5p; Fri, 07 Dec 2018 17:59:11 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVKP5-0004bv-DD
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 17:59:08 +0000
Received: by mail-pg1-x542.google.com with SMTP id s198so2045204pgs.2
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 09:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=i0Q9sHwMUr1ekdKWXnqO7o2xE02Jg3yQin/DuOT/sO0=;
 b=OK7/DQPUD/pVtDKYclK0FyeGWFC1aYMhNDPfQJfdXdLkt8jm2piokX5AC3IlMTVxzL
 IICcnOnP3OjFK76Mx/Ze0sBqXfolnlgACpKRrz+FJJUaf14fFekODHgFl8hH+TFxE+AC
 rlySbFnYUP6mqJhrumlXJOUnoJlr8ibryYHVYuybMqvQZ6e4HVwzevMQFA7lW8nGswYz
 bKHvRHhhyAnsD1c6P5vefSWTMW71hXt6XdHMc5lXdQP8PVTWzsDbEOg+QLviN2Wc9LiK
 yfLci+n14Z3LK/6/YX+j54/fN2tk2lnKBHMP1Su4tCvkQPIbtbw1xV8HR9eIQTxorTCj
 2cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=i0Q9sHwMUr1ekdKWXnqO7o2xE02Jg3yQin/DuOT/sO0=;
 b=hpPY+FeN9NFPr1e9qJUuvMldpJnwEZ6YUAzZVkeoPmplnBdLSw4tEizkm7pZV2eglV
 ajPu2CnkBOZlvUu2GEF0W03oMd4vtW6xO4DxZoSsftFUZ8t2G6y75Kpi/jzpEDYBbmAI
 SDYYFuhGU+wdQ7FpndXL72xfXeCmCEDf6cnx1kxJMaMY4qHN9Wdq9/9oy1KueZqsJm2A
 5kTEjXfZzaaCC5TIgQ933CY8tqrFLOYzrTfeFAqKyc6Kw9xYn5MXzTLhUz1qA9eNdQBF
 bwj770o0tHfReCiYCJF57K3WTCZi+Y/68hHTiRaD4ReJrSMxRPIv4zX5rw3UXk1lU6G5
 w+rw==
X-Gm-Message-State: AA+aEWYUf73GgaBajc2azxGNll7V7kxCiieooGt5AqpmJWicnimSMRg5
 6WuuIn0M5gWLOBTJsgcS4FFeHg==
X-Google-Smtp-Source: AFSGD/WoZN9ourd0BU90eh+nSpKc44uv0qb/DauBIPmCqOMuUtBJgKLBIw2p05q0mp1UrW0SAEn/VA==
X-Received: by 2002:a62:5444:: with SMTP id i65mr3278084pfb.193.1544205536460; 
 Fri, 07 Dec 2018 09:58:56 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id p2sm4796263pfb.28.2018.12.07.09.58.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 09:58:55 -0800 (PST)
Date: Fri, 07 Dec 2018 09:58:55 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 09:58:16 PST (-0800)
Subject: Re: [PATCH v2 1/2] RISC-V: Select GENERIC_SCHED_CLOCK for clocksource
 drivers
In-Reply-To: <20181204102952.21297-2-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-17317b78-68ae-4bf8-8914-e7d5a8348b82@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_095907_464045_B8EB351C 
X-CRM114-Status: GOOD (  13.78  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, daniel.lezcano@linaro.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, tglx@linutronix.de, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Dec 2018 02:29:51 PST (-0800), anup@brainfault.org wrote:
> The riscv_timer driver can provide sched_clock using "rdtime"
> instruction but to achieve this we require generic sched_clock
> framework hence this patch selects GENERIC_SCHED_CLOCK for RISCV.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 55da93f4e818..09a0f2582cad 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -24,6 +24,7 @@ config RISCV
>  	select GENERIC_CPU_DEVICES
>  	select GENERIC_IRQ_SHOW
>  	select GENERIC_PCI_IOMAP
> +	select GENERIC_SCHED_CLOCK
>  	select GENERIC_STRNCPY_FROM_USER
>  	select GENERIC_STRNLEN_USER
>  	select GENERIC_SMP_IDLE_THREAD

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
