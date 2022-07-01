Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0778C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 04:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=fQUPI8qyKvIGrzNuzbi4T4hE0FIpLiVq0/9dMu8EBks=; b=G8MpwKXMXUknIZvyXmF/ewC3bQ
	4KusH47+7/pNqSGYGKCzkjV+o9/AgcUM1Xz9tD9dhj8gs/lC00W+ajzKHHwCDa9wXh6oyvgTsnJcP
	Fl1useW/ssnkua+/nN5ZyQQh7fvhN8Qz3iW23kNL1/TadS20CCb6Z5c4bBz4m67ImtcI5pgykzErw
	dkU0w/vkTAJIlZs+EPaqpSttg+xzgs+yIEn1rpEcsblJqPM2tWDgDLmMjTZGCi0PjYFW03vqNNIgf
	Ena8OXDMcA/aLnf/hrnWID+wixAMZ/GifpFnKDzhfk0/kiJKyeSqA5Y4djfLjp7fdbfkvymbNbxtc
	X8NWdCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o77vz-002mKl-Ej; Fri, 01 Jul 2022 04:07:11 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o77vx-002mI9-1x
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 04:07:10 +0000
Received: by mail-pf1-x42c.google.com with SMTP id x4so1320906pfq.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jun 2022 21:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=IY8goiZ1JBtpku++C9CD9bs6j+IuJRusr8YmntfJEGo=;
        b=aLj1r8Lj4Ms0Ut7M6JiRsc+4eKHLPrUHVY4czgHSqwLAOqs+0qTppNNDCco5mZXu4J
         WRpWOpCD/C5Dubw14p67oFWZzT3vs9GOdbnIkbx89rYGfh9fol438aSEcQMT2UA+4eo2
         KepnJUP9wu+5ADp0RuZGmn8ZxRGG7rgI/AC42eIx7ZTZvfEKMJdk3IIUFwJx9ysNujQ/
         zuAUoUMWIUDB6CIn8kcaf26sW1Uz9Bb5fDIVfpwNoropRLfJwNdgxhAxCubwK/+oysx/
         y5VgndyDuRjsvbWsQcxo9Tp1WnK3SmyyNqoZwuxJbItJLScmq2VpPF7u9/7hbEDMh8VB
         w/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=IY8goiZ1JBtpku++C9CD9bs6j+IuJRusr8YmntfJEGo=;
        b=gDHoquQlsRqCiL98m36x5AQl35MKG4sYkvvMue/1FjPZO3WSlqbCVc2w88sKTIc3HA
         21pWVSKBVZ8hOFIPJKfUfjTAQ+1jtHFNPatf3U2+Q67J0OQrwUIuy9w0yhc+fNm0qpqW
         FpSyA07imZEoFAfrryYfZzMeYOkd043RCUUwyZKQpsuFbZU1WPiI5nlYzLwaXGzvQPG0
         PoNcZlR0E7TfCfG6y9J+/sfX3xxf64PRH2J/IVY4SthcrI74iFHjMHLrvQP9ICHhWA/w
         7h84m7zSZQ0xWngBA39/tc0gNAv/BTgW/yz1bV1DwAf1YXQcS4WVF+O82b6t1DberM4t
         +JAA==
X-Gm-Message-State: AJIora8v+MOSstetu7bQTFbT5k8NsawJqIvNEZEYoiVRYgmjf3BM9XOk
	x30cXIQ03Kzc3o9xWy+RyCxm6g==
X-Google-Smtp-Source: AGRyM1sVBp+DLhMeTViEgDkuBeGdR/Y0NrmWeUnt3HCL253i4fvsg3QWDQ2JDMBTvhNrr3x8R5JxpQ==
X-Received: by 2002:a63:6b0a:0:b0:40d:ffa6:85c5 with SMTP id g10-20020a636b0a000000b0040dffa685c5mr10481968pgc.327.1656648426398;
        Thu, 30 Jun 2022 21:07:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id v22-20020a17090a0e1600b001ecbd9aa1a7sm5462214pje.1.2022.06.30.21.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 21:07:05 -0700 (PDT)
Date: Thu, 30 Jun 2022 21:07:05 -0700 (PDT)
X-Google-Original-Date: Thu, 30 Jun 2022 21:06:53 PDT (-0700)
Subject: Re: [PATCH 0/3] riscv: Kconfig: Style cleanups
In-Reply-To: <20220520120232.148310-1-juergh@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, juergh@canonical.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: juerg.haefliger@canonical.com
Message-ID: <mhng-bb67d78e-c98c-43ec-92b9-b2bcc46c9265@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_210709_345519_E84C4854 
X-CRM114-Status: GOOD (  13.18  )
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

On Fri, 20 May 2022 05:02:29 PDT (-0700), juerg.haefliger@canonical.com wrote:
> The majority of the Kconfig files use a single tab for basic indentation
> and a single tab followed by two whitespaces for help text indentation.
> Fix the lines that don't follow this convention.
>
> While at it:
>   - Add trailing comments to endif/endmenu statements for better
>     readability.
>
> Juerg Haefliger (3):
>   riscv: Kconfig: Fix indentation and add comments
>   riscv: Kconfig.erratas: Add comments
>   riscv: Kconfig.socs: Add comments
>
>  arch/riscv/Kconfig         | 19 +++++++++----------
>  arch/riscv/Kconfig.erratas |  2 +-
>  arch/riscv/Kconfig.socs    |  4 ++--
>  3 files changed, 12 insertions(+), 13 deletions(-)

Thanks, this is on for-next.  There were a few merge conflicts, 
everything looks pretty straight-forward but let me know if there were 
any issues.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
