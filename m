Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E97C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:46:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A73964E36
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A73964E36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ITnr9zE2dh0kqqCm2u9281uTq5ck4Xu0EtKr/SL0XWo=; b=X8nquuZUrScVUG9PymWhsrgFv
	UVe25QZ5QZ0ciP73/5E0VHQSEQXGTsAh56c+rcH73gF6qyv39bQPXJeb+KI9JYb1VZwyx59H7YC+z
	Ngy/4jB1u1OHnTGf6s22ehLDs3N9SiCtvFKc0rGx5+cXm8m3ta2SKFhOlx9a6gpf0Gb3/0wIiCUJx
	TJerH71elwauHjtRPqlahFBBaZxur8fYngXXfZVSmaeYFrLEizLgcd7uELbgnXpk1OffcAr266f74
	nvFfLD5Yh7QFJUiFDoZC0q/7aYzu8F3wvPprbX3tFJ+NKO70yYPLI278sjRP2MwlrxBYWwREFduR5
	oTkexikiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l70gb-0006pi-52; Tue, 02 Feb 2021 18:46:01 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l70gY-0006on-Mw
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 18:45:59 +0000
Received: by mail-il1-x12e.google.com with SMTP id p15so19336237ilq.8
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 10:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wq7pGFTcyQVS5VHHV8GUbyK8pzqY8jYx+8baqL3TKmc=;
 b=lAFYsESjKmSjzbxny8pK8qIiHh8wJNTyMSiD/wu0h52t3rHjnleHsR8hyxbcIegtCQ
 x0Buj/bm1BpmG5HVGPodA/RTKd8gWUQW0pcntBnk4iSL3kitbpohlLHQ9iEPqnaXPZtV
 c+fhUegroitny7WH8xLrEvg/o8a9hIBG/5ELE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wq7pGFTcyQVS5VHHV8GUbyK8pzqY8jYx+8baqL3TKmc=;
 b=EO1R/EhuN2gsoYu+c38A47/TmHUoJZGJHK1Fi6qNXc5NBmmrtX5UXgL0XRRMpk7l0E
 74taNohrA3uZ/nTJRrA/a7SZDUOrWJMRRFMOtkAxz/oxAEHE9v+KVof4ZPuEED5lLbIW
 c8Dz7adQ+6RCKGhx5O+yu3E+pb5AVIWZG7PfCAlSGHEJFA5jglxz4ZqCSrWpfk7txUcV
 G3mfZrShI8YToLAkWmhxEdaxlVTHoPUqkQWjLfr+xZ4SXf2DxgdG398x7wdCmF5FG/Ms
 cyV/p3CVkIQ04jvyQHqiUCcako/WYMpQ28mIcbbnrRJngfzd4sfTCWLcA7vdj2aSXg5J
 ZP5w==
X-Gm-Message-State: AOAM530fffnJhcEMnHSic9F5xdevqSBZ5MOtZRXymcP7LAwAr2ee4D4b
 S8DETKDMCuGZhD6b7+bHHGSw1jWlp6W3c5N+WFbR
X-Google-Smtp-Source: ABdhPJweRT7F8YDnb72o6r7Vof4UUGAWpx8rTIwCvCLZmSqVzwEHmQVgk7A3JOyhvXsTV+XD1L35VsJz0W7kZAzinN8=
X-Received: by 2002:a92:ce50:: with SMTP id a16mr4284798ilr.219.1612291557061; 
 Tue, 02 Feb 2021 10:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-9-damien.lemoal@wdc.com>
In-Reply-To: <20210202103623.200809-9-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Feb 2021 10:45:46 -0800
Message-ID: <CAOnJCU+fgbGv48Lhkn+jZ45CPM8wMwrk9ys39s2G-KBMijO9tg@mail.gmail.com>
Subject: Re: [PATCH v14 08/16] dt-bindings: add resets property to dw-apb-timer
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_134558_795024_DF226EA2 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Rob Herring <robh@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 devicetree <devicetree@vger.kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 2:37 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> The Synopsis DesignWare APB timer driver
> (drivers/clocksource/dw_apb_timer_of.c) indirectly uses the resets
> property of its node as it executes the function of_reset_control_get().
> Make sure that this property is documented in
> timer/snps,dw-apb-timer.yaml to avoid make dtbs_check warnings.
>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> index d65faf289a83..d33c9205a909 100644
> --- a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> +++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
> @@ -24,6 +24,9 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  resets:
> +    maxItems: 1
> +
>    clocks:
>      minItems: 1
>      items:
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
