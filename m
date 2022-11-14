Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF70C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 08:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZBRU+dWOItdtA9MQzKYOGdVCwmmg6sQXmtPZD8dXGqE=; b=eZRiQQf2X81a7z
	LEnDEJf6V26y4ODoAmQEE+WLgXiSaSlrwmFxjTd4IPp66Zws+C7s6mueH5k1XF8GIx4GmmsapXwn1
	KaXPB6GMuue2z7CcUE7qOeYJdbfeHjoMhfrQR+Y80pXu4SRaXpnL/zB7Tj+T3XdUb+ejUHU3a6tFw
	KSzA6wo22H4EldnK/sxtGCHVqH+F9a0umiyRJrR9Q0wpoh9hh/dxDYCG54007VhbwzHXMZfMhzEgE
	40Mhc0Y+Syhire6fHFpwzeyKO4uBGpVAdOiTK38OZpJe4Xi+glPrDlM9Cln+B5+2wxDi3k7/rNHRh
	YlrFiw5InSsEXhvkuijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouUqu-00Goaj-Ia; Mon, 14 Nov 2022 08:30:00 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouUqr-00GoZD-Hd
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 08:29:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id x102so929261ede.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 00:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gVofUJ2Uq4x2TFW/dAc67Kc9J5o9mzOrEl2oknfp3Uo=;
        b=id89WuoHkMYM53T95xk3EMrMHAWhLrZ/ESP3CSNO/yFzypSvXfoJSD+Ur7hoA3fuJ4
         o5zIl4IWOv/IjsIa6TKvg9BEZ6Z8TRT4I/ELX5bQh039wh4p/UCCd698kG2YGummQN3p
         zmpIP9ljwdwE0Qs1kRMAyLVRRc7BgYxzGX9DeBDJjV06hoF/EXFZeQTfkk0qmyCl6GN9
         iXQdyuZJYalvc3/1IYFaijlkR6R2L4BLaS6etkzw4dq2dljUcc/hxI0NvirWfHYU5Q3j
         Fqf9mplLRpFV8V5yudgz2ogiraLDCoNxWfNuId86fiW4S4YOpgqZNyGasUE+MgCI24xn
         Whog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVofUJ2Uq4x2TFW/dAc67Kc9J5o9mzOrEl2oknfp3Uo=;
        b=tEwdBkcv8IzTM923IcsuEGSFmBk7ODMNgoCMtAYp34magg1TYd9/JJpNBigFZlzO/k
         RuHIChWtulyRRMQgA5Y4MLHN4S3CHWDtFmWChLac8Y5IidARtsHt6IsuSI51aHMSzsAA
         VnWTqo+M86jrNkN1ogqsVmUWjmdUmQBGFwfd5xO+vh6X5ShB2sIYz3TMkcD3lm9esMep
         gfWN9QplMYqliipGWkHCQN7LkTj0++aYthqudWEhc/1MhEJmOseHSrR1qHi1CnmVqK62
         bYlg+qS9RQKBy65aFh2jQXcLwell4I4EN+qjFwmeEH/zbH1Ft2lXX5+0TKwdLHLYMLXy
         4Wow==
X-Gm-Message-State: ANoB5plzUA2Qg4YOtua8LGTp5bEyN04tLmasT1bvdtF02SGuSKBkpHBw
	zujI6ReDGAX5n8MqCtOsnkQrvg==
X-Google-Smtp-Source: AA0mqf5VQ1rCXuvr5yEZrbbrDN0RiTgIAEg8HVy1HvJqENiAdesIIvhS9L10jFhuk6iwWGE1m2/cMg==
X-Received: by 2002:a50:ee13:0:b0:463:a83c:e0af with SMTP id g19-20020a50ee13000000b00463a83ce0afmr9910985eds.158.1668414595909;
        Mon, 14 Nov 2022 00:29:55 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id a5-20020a056402168500b0045bd257b307sm4426740edv.22.2022.11.14.00.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 00:29:55 -0800 (PST)
Date: Mon, 14 Nov 2022 09:29:53 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 2/9] RISC-V: Add Zicboz detection and block size parsing
Message-ID: <20221114082953.pidqz5icx2vqkku3@kamzik>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-3-ajones@ventanamicro.com>
 <Y17i8sRf4KXLFkrK@spud>
 <Y3FuniwXbN/hRNJj@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3FuniwXbN/hRNJj@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_002957_634279_D8EA2C85 
X-CRM114-Status: GOOD (  14.33  )
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

On Sun, Nov 13, 2022 at 10:24:30PM +0000, Conor Dooley wrote:
> On Sun, Oct 30, 2022 at 08:47:46PM +0000, Conor Dooley wrote:
> > On Thu, Oct 27, 2022 at 03:02:40PM +0200, Andrew Jones wrote:
> 
> > > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > > index fa427bdcf773..bf969218f609 100644
> > > --- a/arch/riscv/kernel/cpu.c
> > > +++ b/arch/riscv/kernel/cpu.c
> > > @@ -144,6 +144,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
> > >  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> > >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> > >  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> > > +	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> 
> Forgot to mention it at the time, but given Palmer submitted a resort of
> this in canonical order recently - seems like zicboz should sort before
> zihintpause?

Will do for v2. Sorry for the delay on v2. I need to finish some other
stuff before I can get back to this.

Thanks,
drew

> 
> > >  	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
