Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257AAC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 15:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMTpnPH3UppXWWt8SUKzBxfGl8jchZWKMrDKiyoa9lE=; b=D+RBigom/QXwLB
	6uKCVbYWCkJfSHNp/xwWXtZCRvXXhRokDeL7PdUE8B84v8GcMujVBY6fhQZQw/sXQo3r9Ol3KiAjd
	9OfunOU55G/BBgOeupamdvr9ucc5I6QvTxH5EktOnYxitxzjr4HsVnzII93HV/gJIT5Rq6YBD6HBs
	/IaqfxHzPl2kRLgNxy4hRPLR4FR9NO+I+SFt7rFMwfP+KVLDi19p0iixKWL2AczeaYCRFytrG/Uaz
	yijqzkVu1Ilrrk9lG0Rq/0FL8zFPGSAoWsNM3ETCFFq6RiThos7cLr23RWLyUFRaNeaiYsi20y6ZA
	1Vi6zT82nq2J/12m6Mjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFGvZ-007fLk-Ar; Tue, 10 Jan 2023 15:52:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFGvX-007fJI-8L
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 15:52:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id bk16so12232304wrb.11
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 07:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yW6pSygwaRFLykMNVfFhYMtkRvNlw3uJaphCvSAWUAo=;
        b=kYvIhgG2sDWlPTVvf4eObZi7PYH1ZhLIAqeyiQwBQdvrouTO3pPQfsnFU4Oe9OQ+GI
         /qeZDbMEb08P+q4K5JfK56UsPkB+wXo3V14ISQR6bWcD1poY+IdwN6TmjQs21YFP5Pgs
         /Fu1d4K4JvnMKg9BLFnk4Jt6/gKG1v2z4vnoUN4RMopI4bKecOI3Sh5/7F+V/MxPTQrK
         zxHl6VvnAp2IIDDvpN0F6W+AFzeHgZtHIyn+5RxlYnL7mR9CQCPC3EREaIii9PqkIBfO
         /8CsBHt7HlP45Nyib046cTQQYxU+bmzaeM3n2ioRQpc7dHJuCWTDFFjZl1DqsXqsmNkJ
         Sfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yW6pSygwaRFLykMNVfFhYMtkRvNlw3uJaphCvSAWUAo=;
        b=rdgUdfSKOMdaXm4/L13zQkeYdA09my7PzkeCOktNWHuD8DtevzLJVHh79iMsi9f8/y
         x1AsMT5zehZyXYIcGZkp3uymDvXBM4G8fU04dVHBCszKW2PeGefjcNT/4vO5fvjCMbi9
         fxJbYS4EBY3sGAQcwVPKhj00+XuJYA55i9eJUf0FrBj3hD9vZYXjtmAZHzVtqghhoAPN
         GFXfftbmuFkl5vMc2HazsMP8NiiD9E84m+uMPRAE6amiExHJXeVz8MHPXjtBUlUUrtO5
         qL3UV487AMDZI0JTmv+aCemAUMfyUeE/fTg19CL1kTX7wcJzFApY7LDIyEatLoVnGmT7
         xqnw==
X-Gm-Message-State: AFqh2kptbWYEPnnszswATnhhxGu8aa38ZZNBEDwtYZWUED/C+XjKsdGX
	/RpVQ/ZKrbXRHW3oMeHj2/Ug+A==
X-Google-Smtp-Source: AMrXdXt3ch1ld23BUvHXlzUHAv2eXtfxEAQgycLKPdxeKGRBB8TFXkcU7bdTbwvPaWjuJBogp3W7SA==
X-Received: by 2002:adf:e787:0:b0:294:7be9:8740 with SMTP id n7-20020adfe787000000b002947be98740mr21403875wrm.21.1673365954003;
        Tue, 10 Jan 2023 07:52:34 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d6647000000b002bbeb700c38sm6423724wrw.91.2023.01.10.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 07:52:33 -0800 (PST)
Date: Tue, 10 Jan 2023 16:52:32 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Leyfoon Tan <leyfoon.tan@starfivetech.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	JeeHeng Sia <jeeheng.sia@starfivetech.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>
Subject: Re: [RFC PATCH 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20230110155232.oildjprzhk65cnls@orel>
References: <20230106113216.443057-1-ajones@ventanamicro.com>
 <20230106113216.443057-2-ajones@ventanamicro.com>
 <739948a9f799485da88e0d7ed9f956e8@EXMBX161.cuchost.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <739948a9f799485da88e0d7ed9f956e8@EXMBX161.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_075239_317261_B33480A9 
X-CRM114-Status: GOOD (  13.67  )
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

On Tue, Jan 10, 2023 at 02:55:20PM +0000, Leyfoon Tan wrote:
> 
> > 
> >  source "kernel/power/Kconfig"
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h index
> > 4ca7fbacff42..9834ba4ce3e4 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -29,6 +29,7 @@ enum sbi_ext_id {
> >  	SBI_EXT_RFENCE = 0x52464E43,
> >  	SBI_EXT_HSM = 0x48534D,
> >  	SBI_EXT_SRST = 0x53525354,
> > +	SBI_EXT_SUSP = 0x53555350,
> >  	SBI_EXT_PMU = 0x504D55,
> > 
> >  	/* Experimentals extensions must lie within this range */ @@ -113,6
> > +114,14 @@ enum sbi_srst_reset_reason {
> >  	SBI_SRST_RESET_REASON_SYS_FAILURE,
> >  };
> > 
> > +enum sbi_ext_susp_fid {
> > +	SBI_EXT_SUSP_SUSPEND = 0,
> 
> Macro name with "*_SYSTEM_SUSPEND" is better? Avoid confusing with CPU suspend.

The _SUSP_ part should cover that, but I'm OK with adding SYSTEM as well.

> 
> > +};
> > +
> > +enum sbi_ext_susp_sleep_type {
> > +	SBI_SUSP_SLEEP_TYPE_SUSPEND = 0,
> This should be SBI_SUSP_SLEEP_TYPE_SUSPEND_TO_RAM?

Yes, that would be better. I'll change that for the next version.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
