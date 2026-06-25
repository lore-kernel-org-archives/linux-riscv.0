Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78062CDE000
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 20:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukNF5Ramr4qT+F5ADcD9bXd5cLtRXnjYrrLn7Rbmzmg=; b=kpnCj3qFy7YZ3W
	QWTJsSAKwN7SXvN4OnfruIVbOAWHhRokXud+gRdkgAXh0+xQAd75I9O8Kc/OfmgFsShY/yvgPrPNc
	W/hSbwJ4c71pgI1E/zZgHpbRha1PaMWH01B5DbiR239LIP1iP93utC8CKm86bu+A5/x9KDakYbgpj
	zDJSm5H3vnQ7y+ckmenS0l0UoazRrLt0+YjVglFJs456hEYt0ty1n6g10IzFNmxtXE2Luin+rSa1m
	xvf0CK8ua/0HhWCC+GfhXWDOaOIETk99Gg85qVjnYPYMlSKS35RIN3HAvRJhicG5s/ItNVhaaSS5t
	X3HY2j149z3c+CETFEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcqGQ-00000009m3F-3KC0;
	Thu, 25 Jun 2026 20:01:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcqGN-00000009m2M-2JyC
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 20:01:29 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aea1f4dc7fso155588e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jun 2026 13:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782417685; x=1783022485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oc0QJv7T+PDjjn884M5deHXdXQm6jHjFwABbEHE38VA=;
        b=UwAw+87UpT1lgrAWFZAwhV1lOKJlQTQlwO0dFjsMB0E67OVjVk66ZQyx7ZX99k8+28
         dVW4fgLmH8kuC4wNEfXlfiJvq+HFg/h6L+CNUS6lzzoNmv4Elj9E5coSrunbVM7GbLKt
         ooyjTvQlcQccGpbUBX5/2rs2aMpmQh5hIKs6mGJiBcINxxWYHXw4B4J7WsDQylpZgHIX
         rFcTglNkZ8SKg+sYqVB58X4BwlsJZH9U0h9CKv/fDSNt8vkczjsrKpKB98pWG/iXx/1g
         jsFnu6ahIRLrJOx7afy5aI/uLaXp1PRlMAi50Nbieba3P2lnF3ryqSPXVvaWV/rpLiRg
         EKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782417685; x=1783022485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oc0QJv7T+PDjjn884M5deHXdXQm6jHjFwABbEHE38VA=;
        b=SqmcTjRSMewDdMKYmJqxnTIH7v7MwPN9SowU2qCuD8OFL737rlj3qQ12phVnzYEUZv
         puoJaofC6BW5UKVe9t5JhRNQxcad7gan25Cmeq1OyHlHS0sEpVvqsRMCX+EuLBWRprIv
         aaszgtB8zHmQWbn2H/jl/saTe0S4xzQc53Nl6aWZcdR5k8XkNKj2Xo7LvNStQ1eUdXJW
         z6Nt11EyBVKvCGetsYppMARwDmVLMt6h7gaI4x8PLHKchVs8u3zRx1j201TVUecwsZ81
         oG8obNRGaCPjJ6iyBNVzynNS5+0OheWH0l0zKxXnPTpeo2lO5Wldh4LvUJKGopcsSRLd
         xb2Q==
X-Forwarded-Encrypted: i=1; AHgh+RooyscI0QJfcb9fjI9KBD3sQjolBwSMXx5VuP0Cc3Ob+ifkQouBi82SthEEygrGeYk4bZs8JpGpyhbhiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZGCVf9ZLVuSIahwo4CGwxs+upm6pHGr1vLOBo2LMCGCRrBJ3h
	znRAKey5rqiFRRmhP6UlgyU+R/XSxWvNcDB7SEH5f8XJUebeO2C3cMis
X-Gm-Gg: AfdE7cmtK3bqO3nj/QcXZTZ9nax4lHFPT0IHbMy4j5UW7ALP+7bj9RiqdmxSQQxMP5u
	mRVmsiWvUwc7Uk1AUs5gwg4SFJxm1tnRCPBT3zfmDz3Kg8V7P7mptMRlFvLAHMB6LhE9Hd3nNFh
	mNnSauV8vf6afT2o9vN7zJkhDRUesRZqO8AlhJ9Iz3C6/rjt3nvG8W5KbRpc36Y4j78NX+gJXXl
	HHwvAK/ta0qpW+lImkEzc1kDZeN8TC6E8tn8KI5pmJNbSzDlDU03LkJgWRdDgiOgJ5aau1CsPme
	frRUhHjj9rWDHj+KXm4TqOtL33EU9NYGLwGgOlJmyoSxboy8kjnwyQRqao1mSjlZUrKaUYaz5iB
	0KujJufyN+KBYa0GGUE+x+l82l+dGwEZF0IhmHj3ivX7lrGVt3iur4s7x6XIgkY+nLnW5tRI0S8
	ID76ryMBNh+84HaItCdkDqjp6cZhNfXDIfwr9y5qv4Dza8Fzjdiw==
X-Received: by 2002:a05:6512:2251:b0:5aa:65a3:468c with SMTP id 2adb3069b0e04-5aea1e246f6mr1149630e87.7.1782417684632;
        Thu, 25 Jun 2026 13:01:24 -0700 (PDT)
Received: from ik5070.localdomain (85-253-35-150.ip.elisa.ee. [85.253.35.150])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5ae9d8fb537sm1793554e87.21.2026.06.25.13.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:01:22 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: felixonmars@archlinux.org
Cc: daniel.lezcano@kernel.org,
	tglx@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Indrek Kruusa <indrek.kruusa@gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-sun4i: Advertise a real minimum delta
Date: Thu, 25 Jun 2026 22:58:37 +0300
Message-ID: <20260625195837.882048-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624220434.4183732-1-felixonmars@archlinux.org>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_130127_605704_16B73F2B 
X-CRM114-Status: GOOD (  18.89  )
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

Hi Felix,

On Thu, 25 Jun 2026 06:04:34 +0800, Felix Yan wrote:
> sun4i_clkevt_next_event() compensates for the timer stop/start
> synchronization delay by programming evt - TIMER_SYNC_TICKS into the
> hardware interval register. The clockevent device currently advertises
> TIMER_SYNC_TICKS as min_delta_ticks, so the clockevents core is allowed
> to call set_next_event() with evt == TIMER_SYNC_TICKS.
>
> That programs a zero-tick interval. With oneshot/highres/nohz timer
> operation this can leave the next event stuck, which was observed as a
> boot hang on Allwinner D1 after the clockevents core started reusing
> forced minimum-delta events.
>
> Advertise one extra tick instead, so the smallest event accepted by the
> core still programs at least one hardware tick after the synchronization
> compensation.
>
> Fixes: 12e1480bcb49 ("clocksource: sun4i: Report the minimum tick that we can program")
> Cc: stable@vger.kernel.org
> Reported-by: Indrek Kruusa <indrek.kruusa@gmail.com>
> Closes: https://lore.kernel.org/linux-riscv/CA+fTLhgLmTY+exGujKf8OYYQvcEW5X5NJ_5sLq2AYL6zER2c0A@mail.gmail.com/
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Felix Yan <felixonmars@archlinux.org>
> ---
>  drivers/clocksource/timer-sun4i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-sun4i.c b/drivers/clocksource/timer-sun4i.c
> index 7bdcc60ad43c..c2d04ab7cf2d 100644
> --- a/drivers/clocksource/timer-sun4i.c
> +++ b/drivers/clocksource/timer-sun4i.c
> @@ -208,7 +208,7 @@ static int __init sun4i_timer_init(struct device_node *node)
>  	sun4i_timer_clear_interrupt(timer_of_base(&to));
>  
>  	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
> -					TIMER_SYNC_TICKS, 0xffffffff);
> +					TIMER_SYNC_TICKS + 1, 0xffffffff);
>  
>  	/* Enable timer0 interrupt */
>  	val = readl(timer_of_base(&to) + TIMER_IRQ_EN_REG);
> -- 
> 2.54.0

I can confirm that this patch makes my Allwinner D1 board boot
again with v7.1-rc1 and newer kernels.

Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
Closes also: https://lore.kernel.org/regressions/20260531165138.2696250-1-indrek.kruusa@gmail.com/

Thank you,
Indrek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
