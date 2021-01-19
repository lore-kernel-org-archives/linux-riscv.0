Return-Path: <SRS0=fDxE=GW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2903C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 21:35:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194A522D08
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jan 2021 21:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194A522D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v7D4RoHoYwlEjGPbpHWpBHODFm3OnrLyRbkHX5qqoJw=; b=qzPj5TBG+8zJZAPDoW0gNzp04
	gcVjDN4DgfHqU6+bN3XuxEBh4VgxYj8edd3AnBgJNSkKh+hSxuxdBnyx0BtAV2nioJ2M3ZjzV+aGs
	8pmZOjw/Kvmjjw2FDek7ZSokRiWZpfJf726LymzvO+uLfiTa6pCd3+A4Kx3KRjM4yaACYaHursgDT
	sLXA2u5zchpU3oAYidBGb3PpnV0Io3fPat94yi5f18DH3Q0CogzBaBxcERu313y7ZVZyJkoMYe+mk
	B/XSCuUI/6i9N2CCDXdZj7gt4coORpeatBgH9ln0zeHEUz8fAtOxP/i3mDtdaBj2gYmxg6NkgSDFn
	85dlPUoHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1yeL-0004uJ-M6; Tue, 19 Jan 2021 21:34:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1yeJ-0004tj-OD
 for linux-riscv@lists.infradead.org; Tue, 19 Jan 2021 21:34:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id q4so11293295plr.7
 for <linux-riscv@lists.infradead.org>; Tue, 19 Jan 2021 13:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2tJFhFmEki0cmEwMWsS+zMP0KdbFiK5Gaw2t/H2Lbiw=;
 b=TD0v0a79x0XHb4dVqFE7RvlyuQIwC35CHmRKXf/R0J0ZziICD9BHGu4Z1ABmY3SISV
 UUVhQyqxBXsc82gKuMb5lKlBJkKM5YGfR4DAfXJnBj95ty3Sk5r87KFcHpaB6RMyEfjv
 PJfH7jcmsKuWV8QS6gukq3vl46o7ldKWVB39JlpFsjiODa+CHyJrOOrY7/N/jyWcYPMw
 r6lC7/RpUMhjiopYg8FZ7pLi1gWEkYjxwnbn+xrcCVe+TV0sI7pVZnd4Q20ctCy0UM+Z
 wjFHu6+3dsrv2FoeVavM1/AaFZacuza7YZHh1cOnUihTi1b2LwqLquyPA/km5w0ZV5OU
 Qkng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2tJFhFmEki0cmEwMWsS+zMP0KdbFiK5Gaw2t/H2Lbiw=;
 b=mYGrxl4r/Ua5DEDopLBCxC7481Bmyis6++pSGyegVosf8LLhdau4thpWJEhAeIBrGf
 fSEtxBDTtcFJ08Y6NxVQeLADjXX9tXpHL76wauB7a2izTBgev7+Hiq5iyqqk9KKq0sS1
 EwdTA/6J+Z3RyQ8VwUYfR6/e1/mWjawwTnVOu9yNh1QiIBhnGdEtGoNF+VS40cZhc93R
 e2VJG/OktSgR0iyN7iqCzZ+4DPTcH6Xcxs8z1mnbVf3BQnbNijTScue0+tpD1ketDHpZ
 9boM1gUbleAQaUGj+jXqr4CjU5klo3EusCWUchaacgg9yxDO7DsN7QKikkLRk9H2Kv4J
 abbA==
X-Gm-Message-State: AOAM531yUJ0MabXSrs5b1uwSr82hrRLnHX8b4bpWqcXZBzBhoHfBVZ5q
 QJTDpoVfPEaRLIS+Y8md/w0=
X-Google-Smtp-Source: ABdhPJx9l1hC3buN+HCmBXCFnwRv5xOWWVkLkGZhPH4WWBjq1jpLOdkXoQE2qZqEgEkc1fq3hp2fRw==
X-Received: by 2002:a17:902:9686:b029:dc:3372:6e14 with SMTP id
 n6-20020a1709029686b02900dc33726e14mr6697310plp.24.1611092087633; 
 Tue, 19 Jan 2021 13:34:47 -0800 (PST)
Received: from localhost (g238.115-65-210.ppp.wakwak.ne.jp. [115.65.210.238])
 by smtp.gmail.com with ESMTPSA id
 d19sm4069630pjw.37.2021.01.19.13.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 13:34:46 -0800 (PST)
Date: Wed, 20 Jan 2021 06:34:44 +0900
From: Stafford Horne <shorne@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4] drivers/soc/litex: Add restart handler
Message-ID: <20210119213444.GL2002709@lianli.shorne-pla.net>
References: <20210119080938.1832733-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119080938.1832733-1-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_163451_801819_D54071C7 
X-CRM114-Status: GOOD (  12.97  )
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
Cc: Gabriel Somlo <gsomlo@gmail.com>, linux-riscv@lists.infradead.org,
 Mateusz Holenko <mholenko@antmicro.com>, Karol Gugala <kgugala@antmicro.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 19, 2021 at 09:09:38AM +0100, Geert Uytterhoeven wrote:
> Let the LiteX SoC Controller register a restart handler, which resets
> the LiteX SoC by writing 1 to CSR_CTRL_RESET_ADDR.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks, this looks good to me, queued to my linux-next branch.

-Stafford

> @@ -66,8 +71,19 @@ static int litex_check_csr_access(void __iomem *reg_addr)
>  
>  struct litex_soc_ctrl_device {
>  	void __iomem *base;
> +	struct notifier_block reset_nb;
>  };
>  
> +static int litex_reset_handler(struct notifier_block *this, unsigned long mode,
> +			       void *cmd)
> +{
> +	struct litex_soc_ctrl_device *soc_ctrl_dev =
> +		container_of(this, struct litex_soc_ctrl_device, reset_nb);

Nice.

> +	litex_write32(soc_ctrl_dev->base + RESET_REG_OFF, RESET_REG_VALUE);
> +	return NOTIFY_DONE;
> +}
> +


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
