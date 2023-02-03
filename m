Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83B6C636CC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Feb 2023 09:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VUUaASjtv7eRY/y6WJoES9P8w/qkPO28cg4deOC3RM=; b=cBmFmZYyHk8NMJ
	IF31M7sy5rHJtFg7PAxeFKlw2LpSmlXDItte47DqYDbJVv307d0lXGVcD3ZTIGKUUOaiYGaEy6LMC
	FQ2xMyiAW1Dl3K5CVMJCVc1PiqiRKSsd69UDtlbdSPCpMPJpV1Q5ChGrHV7Umb9xE35DrBPU0kB/I
	e9hf/16l0X6asfI3ZNRxJVmYoJQB3J/y4oZp+TWlRmbxPGJu07ZeFAlz1TXQRYuTKJ6gHEecFo3gb
	KgsSiLs5sTdQB63a7D81JNmAwQDXHOVNfkCMBhdfBLnCN4qGYr1J37hQkYJ2nBWgPPLvanzfd57YB
	oE+OWN3bez3kCDAvMWDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNslK-001G5Q-VM; Fri, 03 Feb 2023 09:53:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNslH-001G4a-FN
	for linux-riscv@lists.infradead.org; Fri, 03 Feb 2023 09:53:40 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h16so4099758wrz.12
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 01:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i5QShHShRSb3MbEZp0cEzsm1PDDFiQtDxU+us44l7bo=;
        b=Awio3irw2YvJs14YcXx9NE0X+vx15AqaiH8x21vluvrwaRAhT+WL0j3XwTkRPo/eXG
         kDdPhudPu8dnl6mXezjqA9M75dIERI8u5gEYAYQXUdcpggYA7AdLxiX7pI9TVCXSXb33
         +zRz8FnPUepVqQ1saM2fmfulM1Fye8+8Mm3o2vtpC/TBNH9i2uQWyOzDUfsCnPmqi+mX
         SmoBGdOhQejsaNwv2LChvBZjStwdGBqBJuU1qpgvdsOxrii9JTsnGBsi4Nm5BSZvjLTJ
         7udFubAx77rhlFD1ueEgET1hDcoxb0JM1Y661gp5rzdbzUp2NC5SlxQHrabFn3vyJCLy
         heMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5QShHShRSb3MbEZp0cEzsm1PDDFiQtDxU+us44l7bo=;
        b=z6jM3LVBO4fM07pb3L3XEf+i7X3hcQhjBMFmUh5VnJ5kfJlTvGCl0xultVsXL9FMGF
         SjKfJ5yDY/nnOBeDtl/vsf3OOnWC10NaYxogePOHAsDG1o7mlhAlHSUzSnGQUMYd6p0i
         vs8T3JgLmTJPBTelJnYiKgNVtGQTEzSKLa77ur+risUb9MVOhXMa98NLqWF5DO7JabDq
         OZPIy7ZUKFjPbuYorOhDjvvBhrV/NMSZBVjNj7OwBlyfI7T5sszwDDsK/1yAmoxxDUDr
         SIdVQZ6qIg0VW+OQqFd8zJT9iW/QSDZN3KG+m+yQZ+ItLQCc5YvHjQHF+WlEW5CZ8HmK
         mMdg==
X-Gm-Message-State: AO0yUKU3JhM5lSCn9Mr3wDITdOclSRM+ADtcMC4RvSROiIr5+PXteyy5
	vKvP5uBk4bhhzF+oNacDaPyHbg==
X-Google-Smtp-Source: AK7set9Hv7i83cz+4NNrVjUDpu9HvZYGftiLG0HUrgwReLaGd3cMbPb44Gc3/320s3/R78WlmER8ug==
X-Received: by 2002:a05:6000:78e:b0:2bf:bd69:234a with SMTP id bu14-20020a056000078e00b002bfbd69234amr9095705wrb.1.1675418017281;
        Fri, 03 Feb 2023 01:53:37 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ba9-20020a0560001c0900b002c3c725bdb5sm1546774wrb.117.2023.02.03.01.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 01:53:36 -0800 (PST)
Date: Fri, 3 Feb 2023 10:53:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, jszhang@kernel.org,
	Conor Dooley <conor@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu
Subject: Re: [PATCH v5 0/2] Zbb string optimizations
Message-ID: <20230203095335.dpnphjlzth4q7vcm@orel>
References: <20230113212301.3534711-1-heiko@sntech.de>
 <167538114992.11760.6205423234384730716.b4-ty@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <167538114992.11760.6205423234384730716.b4-ty@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_015339_537246_549B39C7 
X-CRM114-Status: GOOD (  15.86  )
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

On Thu, Feb 02, 2023 at 03:39:09PM -0800, Palmer Dabbelt wrote:
> On Fri, 13 Jan 2023 22:22:59 +0100, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > 
> > This series still tries to allow optimized string functions for specific
> > extensions. The last approach of using an inline base function to hold
> > the alternative calls did cause some issues in a number of places
> > 
> > So instead of that we're now just using an alternative j at the beginning
> > of the generic function to jump to a separate place inside the function
> > itself.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] RISC-V: add infrastructure to allow different str* implementations
>       https://git.kernel.org/palmer/c/56e0790c7f9e
> [2/2] RISC-V: add zbb support to string functions
>       https://git.kernel.org/palmer/c/b6fcdb191e36

I had a few more comments on this version which I was hoping Heiko would
respin for. Some where just nits, but the extra labels (which don't hurt,
but are confusing) and the s/words/bytes/ comment change, which also
doesn't affect functionality, but causes confusion, would be good pick
up. With those changes, I would have given it an r-b.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
