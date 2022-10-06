Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E41C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 02:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dxr99dU1YpDKwJhPyPH6LsCXcTSBBKxAPva+XC2LQHg=; b=StCYdc95pGxSdDIbl7O5x/I3Ze
	4f5xzNE9OaH7p8Si3rvhnNJ4eWR/9E4GJsSfCk84qO1r6TAKh/mYBDZ0usElMa/snG07VyVYwxbVd
	wPXxvaSDWBzx8bDc6bkqUIsF7qUyXcpFmDQ+T1fxPK2LB9Y/58/8N7RxHAUuC5q6cn9wPfUBBqizf
	t/LSbCG8sC3CvAkwnsAouo7kkQ1eeIhDlJ0liuLA4rULF0/RcUaUk3z9xofsdGza3KabVxUEry06m
	pQrlJe+XGLAzXZC3BET+kugN0VaAwb8x0SY6TVv9RckAAfGtxBaXf6dlBnWWJHU2tp4doOJtnGuAT
	t90uXyOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogGjs-00GzWa-VM; Thu, 06 Oct 2022 02:35:56 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogGjp-00GzVp-OA
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 02:35:55 +0000
Received: by mail-pl1-x62d.google.com with SMTP id b2so475531plc.7
        for <linux-riscv@lists.infradead.org>; Wed, 05 Oct 2022 19:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wvcyuPvcxrZx5D0Zm+5pCFbzfcierdnsA4uXezxQUo=;
        b=xbwA+ZMNj0MRBaIdl+o3hLiLz9BMrGHJbY9QMLSq5uXA68XqSkiDkfUnzW74GWIQvN
         /Pdzk6w8Ywd3Bg1EX8sA8fYDYoN0d+TRaTeWEG4/M1vc+imiyAXZn1fkP9EoRHEkt/Y/
         Uq4Vs38xoccCRb96IePVWeHiJdL5lnuo8BW3gzQ7LzaM78sxHxHEUaBdHZF8WEgZKUtU
         573Oc2jQjlp07qXhkolM09NM/DuGzrVlxRSmItwf0inFvjK84Ud9h2OWL7tpnbWkVjT+
         jyJs556xNrQyeGNBi39pmDGw6wn/ST3d1wmFhgnPDISRxL+226wXrBErsr1Df+tX9/vW
         OCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8wvcyuPvcxrZx5D0Zm+5pCFbzfcierdnsA4uXezxQUo=;
        b=Ux4igDtgoxyr7HB1p/+t7m1z8SgL6I0mPHJXqjE4JesApMYnRbI5hrbWzQaVkn2wE9
         HaEP3aBBcmGuI33QIECpsVQMozwCpcn6CK+6ehJKqW2tGy+Thi7n9tkE28UvNcRD3yxi
         V6alPlhBdnlUbO/0oFY0hugg4ThxME2lSc4hsKTGw6H+7w1JlJRpGBR4oIW+ZW+Bvd9t
         oR1PtGqqU+1W0GEsInuz/SnS7k8SDNfj+rgCkezu69QHG36Dn9nYgOng6Q3oZ9POYkhr
         NRcXRAsD76+5E84kUnvA/Hmw69j0Qn/d7QVmthrZxKX5g0oIBCqG6qJ0/gDlvD7mPcHY
         3Jvw==
X-Gm-Message-State: ACrzQf0uTfGHCNesomkxkmfWvdy8v6u+TigHJNT0JqkC8YxLoHQkwyR4
	asfn2zJvx8OsfTBwIZwIx+hhcA==
X-Google-Smtp-Source: AMsMyM4P0BNCBo45KoqkaEoROX7DbTzwNozF5HONt9BFzlzag9dkVZKHnZOabat332ZAqJ/wrz4tNQ==
X-Received: by 2002:a17:902:8a97:b0:178:1939:c721 with SMTP id p23-20020a1709028a9700b001781939c721mr2439990plo.108.1665023752463;
        Wed, 05 Oct 2022 19:35:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id p30-20020aa79e9e000000b005623f96c24bsm1748979pfq.89.2022.10.05.19.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 19:35:51 -0700 (PDT)
Date: Wed, 05 Oct 2022 19:35:51 -0700 (PDT)
X-Google-Original-Date: Wed, 05 Oct 2022 18:08:26 PDT (-0700)
Subject: Re: [PATCH] riscv: compat: s/failed/unsupported if compat mode isn't supported
In-Reply-To: <20220821141819.3804-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  guoren@kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-48fad324-fe89-4cb5-8898-15c2082c6cb7@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_193554_036181_B25D0F89 
X-CRM114-Status: GOOD (  18.15  )
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

On Sun, 21 Aug 2022 07:18:19 PDT (-0700), jszhang@kernel.org wrote:
> When compat mode isn't supported(I believe this is the most case now),
> kernel will emit somthing as:
> [    0.050407] riscv: ELF compat mode failed
>
> This msg may make users think there's something wrong with the kernel
> itself, replace "failed" with "unsupported" to make it clear. In fact
> this is the real compat_mode_supported meaning. After the patch, the
> msg would be:
> [    0.050407] riscv: ELF compat mode unsupported
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/process.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index ceb9ebab6558..b0c63e8e867e 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -105,7 +105,7 @@ static int __init compat_mode_detect(void)
>  	csr_write(CSR_STATUS, tmp);
>
>  	pr_info("riscv: ELF compat mode %s",
> -			compat_mode_supported ? "supported" : "failed");
> +			compat_mode_supported ? "supported" : "unsupported");
>
>  	return 0;
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
