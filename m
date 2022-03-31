Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7749C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 05:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wcDlkESucuKckWjPM5HtpEW6bEUT4RJxJxuJbDpBtAc=; b=Af40OpubVEEKwVPgoQmZpxsSEq
	iwH6p0uAlJ2RnFfepRl8mAhLQOkz5lJS5Z0sxOlOrMijW46fChbeUBpfhGapqRvy7V9s6qjxPKv2C
	+iTIyhdi6htjV5kqayaK2dJezaZ5ooYJw70ijjM9vRfz6dIv2mdkTHuqM6+BRYdy8qEdGSrh04PJ6
	2u1qOn3WmJxa5B0DkdIuWelnoP2ie1CmMngwPr32Dx/vli7ufpouq1Nox48ccyUZhOddfO6hQc8gP
	CfYdRJRkhCpAEZ4MrASPPaSq+T/sDLeURmU6b5N1+VrQv8qU/pDQHAOn+lV06qySQwSYKupwPlLFP
	mOVvHb1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZnk9-000lV5-D9; Thu, 31 Mar 2022 05:53:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZnk6-000lSZ-Ld
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 05:53:12 +0000
Received: by mail-pf1-x429.google.com with SMTP id w7so18277588pfu.11
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 22:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BrVp20BmQjd9WSbsMvWT5kt24UKCTLgZvgR7hPflW5I=;
 b=J0orAsxOAk3R3htaeofa12dEY09G1ZOT6xFMUw8eRPdblGAX+zKgalF+zG53xNIBfN
 JIdsxH0KeXhELtsIMEfbGGS8jMDN+ePq9zcaypxHtex4s+/DgPdLpCaI+/6Q6+GgWWKs
 KJEdpD76ISx4i9sPdkdNTpnORTU/yyvxrRPlPLbAYPe0AeCjVdFf7yGjU2RhRFTgms2/
 0RYnJfjAzMGceWUdQXG5RxDGdiaQYO94yuq3nKHFmfxpcOlFbLUCujyc7JzsG35ovPBW
 OeK74pluni7ZWl5BfCWtd2/Z/cENsuT48GSGZFcv3nsYh3EjxsvjTQNwnxUySCiQeBAn
 eTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BrVp20BmQjd9WSbsMvWT5kt24UKCTLgZvgR7hPflW5I=;
 b=7K1zpUaOTE+657VTvoEsFy9e6FhOD7rLLQKbzZhaygum5bDWFwMW/dhs4N28m14TUu
 piRlyUA4i/94m6bf76hhfoCJTGf3VwW0Yz87SiZkoyIaFo+Xt1X18BKnxzJs+/0cUxwI
 VNyns1NmMiCGFd1czUaVniX0q95Vx0YujKskJf5QV/Eh9q5y825Zl0S4LvhhFEy/VR+C
 qCyensbLm+2fpItq/HIh/n4WZgXNi2PJYrItBy8dqLIE/26Ds1kS+F9HdidrhReSdtzQ
 7eQXgdMXoKcCLrg6UU5y+5j36d1ZlCR/RWwCCHAgp39WREbXl+QDqSO3eJ5CKKCHS3Jh
 s1jg==
X-Gm-Message-State: AOAM531w3TtBA2R94VhJCIBuw3JDYq7CI38yYaf+pytX1tfVqyIcR0B5
 cKk1BNR9y8dfH0hSeApgkCSTvw==
X-Google-Smtp-Source: ABdhPJwpnANsxo4xZlJjPDa54Tplqd+KoCrSUKkTKC74/0HoCkJtQWqclS4PEP1Ao1Wh7C3CzDf7gg==
X-Received: by 2002:a63:6f44:0:b0:398:31d6:e37f with SMTP id
 k65-20020a636f44000000b0039831d6e37fmr9285910pgc.177.1648705990089; 
 Wed, 30 Mar 2022 22:53:10 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 n18-20020a056a0007d200b004fdac35672fsm1695461pfu.68.2022.03.30.22.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 22:53:09 -0700 (PDT)
Date: Wed, 30 Mar 2022 22:53:09 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 21:15:09 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix fill_callchain return value
In-Reply-To: <20220311065815.9985-1-nikita.shubin@maquefel.me>
CC: linux@yadro.com, n.shubin@yadro.com, peterz@infradead.org, mingo@redhat.com,
 acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, 
 namhyung@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 han_mao@c-sky.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nikita.shubin@maquefel.me
Message-ID: <mhng-d348c041-9628-4aa2-af10-51604edbe48c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_225310_741320_B0F770B7 
X-CRM114-Status: GOOD (  16.68  )
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

On Thu, 10 Mar 2022 22:58:15 PST (-0800), nikita.shubin@maquefel.me wrote:
> From: Nikita Shubin <n.shubin@yadro.com>
>
> perf_callchain_store return 0 on success, -1 otherwise,
> fix fill_callchain to return correct bool value.
>
> Fixes: dbeb90b0c1eb ("riscv: Add perf callchain support")
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
>  arch/riscv/kernel/perf_callchain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
> index 1fc075b8f764..7aca6a238173 100644
> --- a/arch/riscv/kernel/perf_callchain.c
> +++ b/arch/riscv/kernel/perf_callchain.c
> @@ -68,7 +68,7 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>
>  static bool fill_callchain(void *entry, unsigned long pc)
>  {
> -	return perf_callchain_store(entry, pc);
> +	return perf_callchain_store(entry, pc) == 0;
>  }
>
>  void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,

Thanks, this is on for-next.  Looks like we share some of this code with 
at least arm64, it might be worth refactoring this into something 
generic.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
