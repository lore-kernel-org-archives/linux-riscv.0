Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3995AC4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 07:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIH/AwjJe08hrADPQL6kCPtPyVpjA1rOfafEm7oVHk0=; b=Vz2W8YUpY3bwdt
	TIEQ3HI1uh5UiNO8qP3xtg7ITF3xzMJkNXEC5cdIQGACmB68L4e4YQZeM0gBmbYC15GFSRi733TQ9
	Wxs3z2YtJfk8KpR7G0DC0PrMhr4fq/uwrQnECRjZNSKeeIXv2rN6rDk9evyMO8Fm39bi44hV3xIQl
	IL6UfTWu7bIDLVL/ad/5RE6R++DO6q09VobhWjUw1oAyyTkeiZvJDGYWYBkTGNglGIZHwKYa7ZBvD
	FBX4/nvyNIRx/TWhO65QmkgDntiMcHdIz7dTYW+jr1pfx9YxMHb/8TFF+zvfPZEr9IIiLPQMXZdH3
	lubEdNrWJCgm3xQkPmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25om-00FXfZ-Q7; Mon, 05 Dec 2022 07:23:12 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25oj-00FXdp-93
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 07:23:10 +0000
Received: by mail-lj1-x231.google.com with SMTP id a19so12557455ljk.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Dec 2022 23:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P3yE5QioYLPBdRrheVQTeMKHmEb+i0C+Uxq8lZYH3bI=;
        b=hzLBzBCj/UTbf0W32P0cXQWBb9OToirON8fO2yjbciQEZmAyEJtzkOKWClJCBoGSXZ
         NazQEwwhj7x2OSE63q9Gu0S4nNQoAwRDJVPDxjMI/Ma0kCILMEjg8qERnfSigkfXkTFe
         L63okalmpzjNwmywAB4I2xPlYx1mfbN8OSLO1S2nydo9A5tBbr5pDIyuRxKY6kXHaycC
         sE2B79qAeTOdn1Sm55lHeYqo67S2vAgamr8Z4Hq9TiH5SBgLegX23fPT+yhD1/TFVvW+
         dYeDpbw5lnFNeDBF0cOdbgRIqkDq0PdnDuQ4z8RkArG+9K1xXe0d1IUH0ZVSIM01oxRw
         sRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3yE5QioYLPBdRrheVQTeMKHmEb+i0C+Uxq8lZYH3bI=;
        b=vYO4zn3GZQqG+OX8GFL46ZpdjdYKzGkHXs0bw0N4qR6ZzklYvLXRpbegz4ZNBwtSrp
         D1E2dU7svLh9HWp23YnRO7+/OQkzir0ipTJTg0kwVIF7sQGFc6jx+sKbXqZF2xDW4MxC
         6yfUxkyBMcivnvC3jv+Ds1CAgzvud57F2UeZg8ObaOEuFSG57lLzZ/Dy5jeyNiXIyG1h
         mZWHoOaJStYFj8HmwmMTREy7q3ir2nKXba+1WisL0B5jecJ+WHlJe4P1wEMRb+Fw3+eT
         KFZGZm2HmbT/kyACkDdvVPafkoR+tKYeTAgsidNv/O23ViH2FxqfQ8Dyg3Pkrtdy8kDi
         gebw==
X-Gm-Message-State: ANoB5pmM+F+XUxXHbf5/ioWcJdWxS4BNoeZzabTmpxFT4LpQx6jzrsCK
	7qT89O9oFNS8ntHhJoZ68wo=
X-Google-Smtp-Source: AA0mqf5+CieE6QDHh85+9Q/epKhfM7CeYJKsYqEo98af3XXlgBCqgnPuQvE2zewUADVd0YWy+71Dlg==
X-Received: by 2002:a2e:b88f:0:b0:277:f46:617b with SMTP id r15-20020a2eb88f000000b002770f46617bmr24206778ljp.221.1670224985808;
        Sun, 04 Dec 2022 23:23:05 -0800 (PST)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id m6-20020ac24286000000b004b501497b6fsm2018851lfh.148.2022.12.04.23.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 23:23:04 -0800 (PST)
Date: Mon, 5 Dec 2022 10:23:04 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: Re: [PATCH RFC v2 1/3] riscv: add support for hardware
 breakpoints/watchpoints
Message-ID: <Y42cWLG9+EU+Ew9B@curiosity>
References: <20221203215535.208948-1-geomatsi@gmail.com>
 <20221203215535.208948-2-geomatsi@gmail.com>
 <Y40wmUcqMQWQLBsI@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y40wmUcqMQWQLBsI@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_232309_364384_58519D59 
X-CRM114-Status: GOOD (  16.19  )
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

> > RISC-V backend for hw-breakpoint framework is built on top of SBI Debug
> > Trigger extension. Architecture specific hooks are implemented as kernel
> > wrappers around ecalls to SBI functions. This patch implements only a
> > minimal set of hooks required to support user-space debug via ptrace.
> > 
> > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 2a0ef738695e..ef41d60a5ed3 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -31,6 +31,9 @@ enum sbi_ext_id {
> >  	SBI_EXT_SRST = 0x53525354,
> >  	SBI_EXT_PMU = 0x504D55,
> >  
> > +	/* Experimental: Debug Trigger Extension */
> > +	SBI_EXT_DBTR = 0x44425452,
> > +
> >  	/* Experimentals extensions must lie within this range */
> >  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> >  	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
> 
> This is an RFC for something I know nothing about, so was just scrolling
> mindlessly... This caught my eye as odd - There's an explicit comment
> about the range for experimental stuff but you've not used it? I guess
> there must be some reason for that?

IIUC it is not so experimental. This SBI extension accompanies the debug
spec v1.0 (frozen but not yet ratified). So sooner or later is going
to become a part of SBI spec.

I am using EID suggested in the draft v4 for this extension
posted at lists.riscv.org tech-debug mailing list, see:
https://lists.riscv.org/g/tech-debug/topic/92375492

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
