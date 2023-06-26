Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DED0EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 16:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAe400x9AkocBOdka5XuUaLmI+cmf6jT849T95nK9R4=; b=YuRHpeJbBTWU1r
	bhSFi5KmSCRr4+/u6cJFgWHy5+Ofgbf7v9043XD0FvUL84zNzd8vVFK2XrR99ugO4122Q00VwgWQ2
	bdeYsLInp4u7DAghWvxKU4VuG1zxwPseYOKsAJI59BKYGX4M9uyD/xgJUmGSUnhGI4Tr0mO5Q3iKQ
	h3sazUYXo109XwUZvownsjW0IfTklii5Yzhk9NWRIg1MZZ5ObYZaFsoDUgn5f+ECU3wl6TbjnZT0S
	i09WxGB1fqn+iBHmpe8CMgqi57te1UGsAsseUyb74FOPX/bR78grxvgGfJpnh0tljnhDTDlXJRLeC
	Y1Uv5zxCsz3OTcv+oDjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoiq-00Aa20-2J;
	Mon, 26 Jun 2023 16:05:48 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoin-00Aa1B-0E
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 16:05:46 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-98746d7f35dso521400366b.2
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jun 2023 09:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687795542; x=1690387542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UeZ2gJ78a8GPVtCoXPkcAEj2A8pLXaEVQFdsULkrHhc=;
        b=jEWUUYrwq+I7qYap8fYbNnhmWuPRYIfZ90Rtqjw5+TT0j7h3+O+JlSrwo/JgaKqr4W
         p3Qc0lIur63SOy/9nVNGESmL8qMzDlfUfeRolhh3ZGgGofF39npPWZTXx/NLSjlFylXy
         OwcxhP2X1HmNyo1lGb9c7ba+as0ILVT3aLJr8kz5yGpQvybGcz0M4nZvMO5dSYvVShlp
         mJpEdNjO8YT3HiHGyScAYstiNItI56E8LEZzhXG9xGuEVa54plRs8mq3CLgHfH4fdsyG
         c3fQpSRDFKCZXUbc2gpQ2bDn6Oa10jBsu1RnUce4zLCCXVu1uwtApMJxK5/El3tzIZUS
         0mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687795542; x=1690387542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeZ2gJ78a8GPVtCoXPkcAEj2A8pLXaEVQFdsULkrHhc=;
        b=OGqzGqWZp64AWlttJRNhtU9d7n8j2Z69J7EmiE/S3Z3Y3R3hVoYO2HtR6faE3AcNuZ
         JX6khs+eDIuQercOr0wfL+qE8x3l9E+LFUWbN7tdPgMEC8/IJHj481hozKud0VUXnxlG
         5rcNTnNKyaKWhyiUph8k1RCKS2kNAojY1njX8czSrc3DZLsKqk58JkllcbkkkkFOYXnq
         DpgcWpHf/GvbCNgj2bUzHgBr0r804nhKlOB6M3dLGSd3DuUUIDP0vkUHWwTpkeZujv20
         EfWPmBd/bQov4kWzl432XaVlbV5t9E+T7SFFuuWTAA2oFuZgX8GMD9RVjICfJVaU4iMT
         3lUQ==
X-Gm-Message-State: AC+VfDwgVPsTzTmFmHH+zbsYGJ/ih5PE8Qc2fNbYxt1aluBEEN/f7oqp
	OULO0Y4QSIiRtVHryxMgrpsY/w==
X-Google-Smtp-Source: ACHHUZ6SnSRadXIWV7VvaW8UyxWKn2ImofeQoznE415eOPemw6zL9MGMc9FMnlWeraLZOM63YoxFyA==
X-Received: by 2002:a17:907:983:b0:94e:2db:533e with SMTP id bf3-20020a170907098300b0094e02db533emr28662335ejc.49.1687795542064;
        Mon, 26 Jun 2023 09:05:42 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b21-20020a170906491500b009828dac8425sm3421335ejq.105.2023.06.26.09.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 09:05:41 -0700 (PDT)
Date: Mon, 26 Jun 2023 18:05:40 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v1 1/9] RISC-V: don't parse dt/acpi isa string to get
 rv32/rv64
Message-ID: <20230626-4fb963235f3ab08383a6d9ab@orel>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-silk-colonize-824390303994@wendy>
 <20230626-e3ea7beb39c584bfbf7ee836@orel>
 <20230626-dragonish-romp-9acf4846ae01@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-dragonish-romp-9acf4846ae01@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_090545_115908_C537D599 
X-CRM114-Status: GOOD (  20.14  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 26, 2023 at 04:51:29PM +0100, Conor Dooley wrote:
> On Mon, Jun 26, 2023 at 05:14:15PM +0200, Andrew Jones wrote:
> > On Mon, Jun 26, 2023 at 12:19:39PM +0100, Conor Dooley wrote:
> > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > @@ -333,8 +335,6 @@ static int c_show(struct seq_file *m, void *v)
> > >  
> > >  		of_node_put(node);
> > >  	} else {
> > > -		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
> > > -			print_isa(m, isa);
> > >  
> > 
> > Extra blank line here to remove. Actually the whole 'else' can be removed
> > because the print_mmu() call can be brought up above the
> > 'if (acpi_disabled)'
> 
> Can it be? I intentionally did not make that change - wasn't sure
> whether re-ordering the fields in there was permissible.

I agree we shouldn't change the order, but moving print_mmu() up won't,
afaict.

> 
> One of the few things I know does parsing of /proc/cpuinfo is:
> https://github.com/google/cpu_features/blob/main/src/impl_riscv_linux.c
> and that doesn't seem to care about the mmu, but does rely on
> vendor/uarch ordering.
> 
> Makes me wonder, does ACPI break things by leaving out uarch/vendor
> fields, if there is something that expects them to exist? We should
> not intentionally break stuff in /proc/cpuinfo, but can't say I feel any
> sympathy for naively parsing it.

Yes, it would be nice for ACPI to be consistent. I'm not sure what can be
done about that.

Thanks,
drew

> 
> > >  		print_mmu(m);
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
