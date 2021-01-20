Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE8BC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 18:22:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C1E1233ED
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 18:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C1E1233ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=q8SrcN623Q4o7es9ISntPkiW31ZrfHGiPKhxlwkJA7A=; b=z+yaOYyBvJiCUC0Mnf315mI2F
	E9MJbPBv6lLN7luWXBTZuOaeHrzOjPVj9D0O1OFTiVMb60jELVoVf+7zhYz9+xZqkEozwGGDV01f/
	kNvBjHVWSsDCkYM14BcQ5JQSvKqJ5K6abyVg/t5Dy0d0T5x6pe6E3iBt2uCA3IwzHKT5n/1UKj3VC
	ha+uqumNOzm17JBYQHUlnapuaoYfKXwPl9eYNgLVCRA/Rwr19rD4fN5FgORH7G20yMw4nPZz7wJGi
	DXZF51AOdFtt3uu0/annoaPEaKT2l/eg4LDaUvQpoIohHCUXZbZ5hfTSu1Kq8IjCAdKVNM0f6GkAw
	6arJAitvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2I79-0000ns-Rf; Wed, 20 Jan 2021 18:21:55 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2I77-0000mj-Oi
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 18:21:55 +0000
Received: by mail-pf1-x435.google.com with SMTP id q20so15015424pfu.8
 for <linux-riscv@lists.infradead.org>; Wed, 20 Jan 2021 10:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=3zA2PNOgC/6qMsKy4aM1hGJRHMX6FMexQumMpBDwYYg=;
 b=A2qykjDjIALvxy2rFZKrHfmDImHmjIdmVaOm1B4dktGCC6yYKvZrZ6S7nG7X9dROx9
 XFrIpnfiuGjIXk19bJ5F9H89C0OapDwiH4l3CTO2FtJI2eo3Ia/zCXgKqr8o2Vtpd1Ly
 gtNNmG6xu4x2tMeE/lHyDX929zDR/2iG7zXXMti9igv6IPU4rLBJvCxWRBB1RkgNfPEk
 EcrFtDCIeIrrs/7e1C8T8d1TZR+3eZKB02i2onasg0Zx5PtiSn3kz4tmSzUggXyi1i7y
 XNxwbYay885qrx+O7+HpHrSk7cd+e0dt3xDDRCk3C4peRJWEEGCk1KsGpbeRHkNPP1K7
 u+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=3zA2PNOgC/6qMsKy4aM1hGJRHMX6FMexQumMpBDwYYg=;
 b=Wky3MGJVPpCk7utbtq45mRKkAkEWQMEGSTd9Ehwer+06uZhUqY1+o9CpzR5KZQCTqF
 iX3lRnVMoYmaKIE6VyOj7EzGSZ1Xo8qF+AeijbybeZK+BnQRH63getEkR0qyaC1aD5ao
 xPPYyzZ7tTv23CfoFNDeB9uvXKORjKsFwFNu5d78WTp8dmkCyf7+77zV4zrJhmMihgF1
 14UOUv+J5bQITNH5tvT1eqEIhwYeD73qDIid9ER4cKfzSEa219LTXrpJ5YiGqG2iDsCG
 UOXgfs0umDhBnm0qC/isKciOdI8dZMIJSohS0Ic+WxAop8bJANADj5bHFx39WMyaA0rV
 xkIA==
X-Gm-Message-State: AOAM530r0xhHilidlhWx2e4C33PLAnzZ2X5KssRi5g59WHwf0aXyDKHN
 NnolWdxvCbEIdADHJxCB4KDeNuoO+ur+qA==
X-Google-Smtp-Source: ABdhPJxZ9IXq8e3w29XqwyA4tFdKUt34VgrdrBdiovLR95Y4t32vajYGB/nJA8DVEItUbXob/hqirQ==
X-Received: by 2002:a63:1142:: with SMTP id 2mr10642235pgr.263.1611166909930; 
 Wed, 20 Jan 2021 10:21:49 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x127sm2965069pfb.74.2021.01.20.10.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 10:21:49 -0800 (PST)
Date: Wed, 20 Jan 2021 10:21:49 -0800 (PST)
X-Google-Original-Date: Wed, 20 Jan 2021 10:21:47 PST (-0800)
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA
 driver
In-Reply-To: <CACRpkdbTazK7yLPVe79SoneD+tdiXv9GPvN29dSMgCZkf8Pjbg@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linus.walleij@linaro.org
Message-ID: <mhng-8e7e9405-6528-4fec-8d2e-41eb7ec1362c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_132153_961218_9A0C65DE 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: linux-gpio@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
 linux-riscv@lists.infradead.org, seanga2@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 18 Jan 2021 05:33:05 PST (-0800), linus.walleij@linaro.org wrote:
> Hi Damien,
>
> this looks all right to me.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Shall I apply just this one patch to the pinctrl tree?

That's fine with me.  The DT bindings are in riscv/for-next, maybe it's best to
take those as well and I'll drop them?  I don't generally like to drop stuff
from for-next, but that's probably better than having everything all mixed up.

https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/commit/?h=for-next&id=ed3137edb31b86702511e7ad12b4abe8686b6805

> I think the line that touches arch/*/Kconfig should be dropped
> then, that better go to the SoC tree.

I'm OK with you taking them along with my Ack, but if you don't want to that's
fine.  Just LMK

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

> Yours,
> Linus Walleij

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
