Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1200105F7B0
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=knB2rREKyFg+VjE6VWPPDCWtireMlHAaISbFxTmlt9M=; b=2K5TkAkNktV/z5
	gu+lGQlVgLc25XoxGWJrxy/1jbNYeore9jsWo16kmPk7HPh3bDstTr2scJnWlquzKg2uWtENkzqfa
	caa1VpmF28/9O5lnQjeLNeNROg/esxQlAdDmK71VV6ighBS+C95tFJVGD92eFpqR3AiYyrge1hTWy
	Ibp7sOiA7DlRmPKPWrXxkUOYEOoIpbUbLOe/I/CBgH2WHsoPWcgAVBpESI5y2T7mMVuK6ECWr/xM/
	RdvD1rr4TmLEYrunCtY5gk6wmV96uyt50F75fzFGTD2Zm8hqIhAB1sqsu9+mvoJMiU6VbtwJnaEmS
	i6/9vmbMc1gfrV6wMQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KEo-00000001cce-3nqu;
	Sat, 14 Mar 2026 08:20:46 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1KEm-00000001ccL-0q2R
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 08:20:45 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b93698bb57aso563487266b.0
        for <linux-riscv@lists.infradead.org>; Sat, 14 Mar 2026 01:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773476442; cv=none;
        d=google.com; s=arc-20240605;
        b=NrlH60WeZcptIrJPnxCgR3WT4xkWsNZjIeATYP7u8bOGx18YelAngTxp2vmsdr8KiF
         7WZOXbkB5hwBnGpsFw8B9+IpMd9UYty9KeofyDIyB49ayCnrZygDLC4HVbQ6CNheSub9
         WAtZ4epTQhljKqxeoPOzTb/R29RyBu6qkGPMJ0op9Gy7o8Ruc272TjEinU4hx2FnR35b
         Xpp/MRbcqXUlwvnc+APIquHwQzfbcliHJhtRzINoOKNxOkNBudnM3AAhi2fOfWiQVxlv
         lpG4R95Dfvnr/ugUprLvz2UjaWYNWuVfTumR6UhSsBRv6AtKGCbCorcHoKGGkz1e3FAQ
         S4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
        fh=LBKyGCzoTEY5BSQ9lHn4glIWXZFamskqlJeXYBiT+aQ=;
        b=Ydk4y+nI4BRRxEVnrJj/AS5n/ZSQ+JIwUB+b9P5W9D+bNKUpeObMDQQl0lp6G7yoxl
         zuwW1mbjfNtu+pHi9Mt7FsYMc6YwpO2+ThvsdjIY7b+n/bnzqkbKv35g3/bQfvyjtXAZ
         DtppYzuX4LiviA7wFQwe6iaOmrXK+GNQCVTcHi8RbRby4/1kcovh3ZTLWqo1188GOQRQ
         aVmY1CiK1Zn5LdjUVoXwhu6eGfIydfFdNMnCAm6R1o6Y/EcJaPD5vN8hg+kcQ2qgDIHm
         wcoV2bQL+bMQuKdb4yFMtEkL/Ce3rjawD3+FhNwnrfqcoMwKnIxRdaWqolr3/58l1p2i
         Rebw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773476442; x=1774081242; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
        b=MU1YflRJNbFGxPJMpf/UUnfWB71BBWrO24GXOgii4JodLWOnj9BAt7DlJAFEe5E3J6
         Gu6MMSzsUp+oQ6HwyiI0eOWs0Rf7krW3BO/62UokUnAN6mXJzYs0vOBHm4QZJj8Ic9SL
         tujWsH2Odse376Zf9B0L9lqQX9yg2/mcIGJciaS3HFJ6uuYuldMApAPXgivGU757R3g4
         U23Zo746PWhVpm5LBwW9WVajJEzQEIAQlDHG1hrRDv5Fhc4dVIeyG05L2PhsP2lY6Fr9
         pMF46sD2xtaRoMKSMxiRzayBa9gJXJkIQe0l9o8/Vkx6hLaa66kqJHa8HLsqiTxOsiv9
         IiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773476442; x=1774081242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKEodoFrsnEUz7A+3wp4L6Xznh2GG5VgXnuRS4O4LBk=;
        b=dBKHldAtrewIA/knEjJK43NP+1jMdWY2aazk8m89qKkfdeYxorI5Em1LxzkbzVhIE/
         LfrC4Uli1ijXaBjo6ryJi/xJDADJb4GbeKw1rluI9G4/oy+GxhqnRwfglh+KGCHhMzL3
         3iTePQ/mvBV2C8zPR++Jp9NmO6yH/VMm2F56ECKFHfKKuYS/kjZYSBk98oYajXkkHT1y
         s8D6jeqKdRdDT6I6/ukhG9RcEqprJgsEVMaNHj53+pqRZxQMJ18tJ/n8Bdu6bdMZF/zk
         MdJjb73Lb1uzbQbdRFU9FeTQc+M66AfWeg+tMjgxRcy+Y1rYak0d827GH6C0atdmaQL4
         RWJw==
X-Forwarded-Encrypted: i=1; AJvYcCWcplq2RRePLTp7OHL8ooBH6KFpA8hkSfrssSDXA1gMd/cCRh34n1qAC7bXVRZXLUOgDFdn8PrF7XqJbA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo2YksUDDJsyHHBiHyFGvIE+8CPQLmFzp2VCOi7RLPRLxnymQ3
	0PtPgR8oVjaaiOpAMzJXpiMZ0kYbw5xT7vK60h1U5i78JQZs6o70pLc9WJXCLUZ9i9dPzccPZ6D
	FXb5wOPDmQNxIA0+lGtAGcDWprZMp/JI=
X-Gm-Gg: ATEYQzzqpTkoypBvLCI4SrondHSSoZ6bKmPMSNo2qi99cXKKLpaZshIqEbbADvOvsmE
	9SUDNid1ni8yfjrPOJYr4vluNHWSAiNGVK9yiWAjt04/I2P6FXqDVSRq2JBLyn6s2AaXRubl+1f
	mV3kFAlY/IeqJg7G4iQqJ0ssikfa7FPqklVEddJum//TWdV/vxbpoVBqXh3awNr3raZywqRrAW3
	E/iQLawJdDV8ZGd7DFOIizpwpvDmB3bK/NpEvEkIa+v9PU8qkCk2U30aEBp+rBmHyTGMtog8FHl
	mdzfsg==
X-Received: by 2002:a17:906:dc94:b0:b97:80be:c9a0 with SMTP id
 a640c23a62f3a-b9780bf0140mr178652466b.28.1773476441488; Sat, 14 Mar 2026
 01:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech> <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-1-8c3541da16b1@pigmoral.tech>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 14 Mar 2026 13:50:25 +0530
X-Gm-Features: AaiRm53rSdWgcmbPnwhHtOT4QoH5qCsuKsNqkPJOpNSMw1Ld03rj8Uh5faUWLZI
Message-ID: <CANAwSgSreMvKmWuV-wikoiEQDGEQ4YCo3MN8Ke4s4+Y49OOY2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: spacemit: return -ENOTSUPP for unsupported
 pin configurations
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Linus Walleij <linusw@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_012044_258073_63F06E43 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

Hi Junhui,

On Thu, 12 Mar 2026 at 14:14, Junhui Liu <junhui.liu@pigmoral.tech> wrote:
>
> Return -ENOTSUPP instead of -EINVAL when encountering unsupported pin
> configuration parameters. This is more logical and allows the GPIO
> subsystem to gracefully handle unsupported parameters via functions like
> gpio_set_config_with_argument_optional(), which specifically ignores
> -ENOTSUPP but treats others as failure.
>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
Reviewed-by: Anand Moon <linux.amoon@gmail.com>

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
