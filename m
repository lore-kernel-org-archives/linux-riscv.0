Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED547EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66pPrK0cO2q1QNcwbm6beswPWXUlf4e+7zrzkL5ibmc=; b=Lq01fcdTjnLEia
	zUe1x2yOVp9VD7uHo6AnASwAZ2F6DSyvHUrz17y2Hffp0hFlA3DKWCX3owK1Q4o8vrUXVgvhoFUn9
	0cfy/+5pjGGB5vsD4sGS0JUassbat8UncgS/AToUnDDfB+dKGJtSWIMKJMdNyZsP2yoT3fwEdwzE5
	m36c7m3+E1vf/utEup3fCXQVUVY+oeGGgS8wAtVxiXrUph9LcNaSADXgY/tUmaNX3a1qPx8upZsYc
	JZHRxt7QHfmg1Cqnjj66FZ43mtTh3DcZjGnLlZUYdn0nEbuyFLn9ig/T4dCDGrH3xx/7CU0/zCQtC
	QbTmnt+NHBQ16jWEmDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3en-00CUYZ-1P;
	Tue, 27 Jun 2023 08:02:37 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3ek-00CUX3-1F
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 08:02:35 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b4f9583404so35723505ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 01:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687852952; x=1690444952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwSOaaqXQuvrI4/1ZVdn4pZtlCvLtoOyfkYIM95Gkyg=;
        b=n61emth7MMMXsUyQZTn2mvezxo+aS/47NEiAR+fmv6JvaSIm1xaV9iIiQKlKFMYleg
         BACfQCvCCzvlz8m8pVn1T9s+9Xu52SSldssZvwFIOq+jOtUDEP3qWT8tSCLDsQUZhEJq
         lOBRo5s2ocWihk9SIQqEYtqeoSXTZkC4p7BBaSdojtvy+rnqnmy/ffBo5XhDjzM4RhGx
         pHx/gEbuUEibvf2NfoCq1WL512mVKT1bVCkfIHNIMAFTsTl7XUaBb4ZSP7vWOUcc4r54
         Y6GzvgMPO7rcsYBLdeeKYsui+8erpFQ8Kbx4MiwOvKUKMLBFCQaB9lGyPHSsZZTAejeH
         qYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687852952; x=1690444952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwSOaaqXQuvrI4/1ZVdn4pZtlCvLtoOyfkYIM95Gkyg=;
        b=jPo7rzvyxnCn+i6hTq53u5sqh5ruv8qmeytscTCLRxUK7X8sHy5Irg70s1CssPPO04
         9GvhzRvtsu7nLb3kgQYPdGsOKjK9Np1J8HPaCbtwTyAMot/x5+jQa1U3ko67HYwn6H1B
         FbEADJXucyPisTLVE//UsR2Mudow2ijDNmEg8x7z/RhcdDgJCq29WxbmrZFBXVNKgrW9
         lJguFMXgXa5rPXl0ZOyhJnSnBZ2nV3TCYIEyA4KGgeTWNnLEEnF8bdxhCoRu3C+vbFNn
         Tn1fiVPLETMOf7SKfb90ngj/9PZmokl+5f8z2jQlxfbQZxm/+HpJnzXXv46XSUMzTGqs
         Mh9w==
X-Gm-Message-State: AC+VfDxC1lpLedp1Guy3xrp8kNOhW+FEfG3h8yTVpzee8F/2FdueMiT5
	7sLfTXATeAJcpga16wOxMHVxbg==
X-Google-Smtp-Source: ACHHUZ6UZNXZmsJzaB9zcJo7pIb8wVgihAnTAOaXihsbTnFUpv6o9tz42ExvLlFerm1GhPq/VvjP2w==
X-Received: by 2002:a17:902:be11:b0:1af:b92d:b5fe with SMTP id r17-20020a170902be1100b001afb92db5femr10036126pls.0.1687852951788;
        Tue, 27 Jun 2023 01:02:31 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.72])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm5380340plp.92.2023.06.27.01.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 01:02:31 -0700 (PDT)
Date: Tue, 27 Jun 2023 13:32:23 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/9] RISC-V: don't parse dt/acpi isa string to get
 rv32/rv64
Message-ID: <ZJqXj7UdegnRP4mI@sunil-laptop>
References: <20230626-provable-angrily-81760e8c3cc6@wendy>
 <20230626-silk-colonize-824390303994@wendy>
 <20230626-e3ea7beb39c584bfbf7ee836@orel>
 <20230626-dragonish-romp-9acf4846ae01@spud>
 <20230626-4fb963235f3ab08383a6d9ab@orel>
 <20230626-ragweed-whenever-5b22e180dcd1@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230626-ragweed-whenever-5b22e180dcd1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_010234_427329_BF2EFDCB 
X-CRM114-Status: GOOD (  26.87  )
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

On Mon, Jun 26, 2023 at 05:16:09PM +0100, Conor Dooley wrote:
> On Mon, Jun 26, 2023 at 06:05:40PM +0200, Andrew Jones wrote:
> > On Mon, Jun 26, 2023 at 04:51:29PM +0100, Conor Dooley wrote:
> > > On Mon, Jun 26, 2023 at 05:14:15PM +0200, Andrew Jones wrote:
> > > > On Mon, Jun 26, 2023 at 12:19:39PM +0100, Conor Dooley wrote:
> > > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> > > > > @@ -333,8 +335,6 @@ static int c_show(struct seq_file *m, void *v)
> > > > >  
> > > > >  		of_node_put(node);
> > > > >  	} else {
> > > > > -		if (!acpi_get_riscv_isa(NULL, cpu_id, &isa))
> > > > > -			print_isa(m, isa);
> > > > >  
> > > > 
> > > > Extra blank line here to remove. Actually the whole 'else' can be removed
> > > > because the print_mmu() call can be brought up above the
> > > > 'if (acpi_disabled)'
> > > 
> > > Can it be? I intentionally did not make that change - wasn't sure
> > > whether re-ordering the fields in there was permissible.
> > 
> > I agree we shouldn't change the order, but moving print_mmu() up won't,
> > afaict.
> 
> D'oh, I'm an eejit. Sure, I'll do that for v2. Thanks!
> 
> > > One of the few things I know does parsing of /proc/cpuinfo is:
> > > https://github.com/google/cpu_features/blob/main/src/impl_riscv_linux.c
> > > and that doesn't seem to care about the mmu, but does rely on
> > > vendor/uarch ordering.
> > > 
> > > Makes me wonder, does ACPI break things by leaving out uarch/vendor
> > > fields, if there is something that expects them to exist? We should
> > > not intentionally break stuff in /proc/cpuinfo, but can't say I feel any
> > > sympathy for naively parsing it.
> > 
> > Yes, it would be nice for ACPI to be consistent. I'm not sure what can be
> > done about that.
> 
> Print "unknown", until there's a way of passing the info?
> Speaking of being an eejit, adding new fields to the file would probably
> break some really naive parsers & quite frankly that sort of thing can
> keep the pieces IMO. Ditto if adding more extensions breaks someone that
> expects _zicbom_zicboz that breaks when _zicbop is slid into the middle.

Hi Conor,

Instead of unknown, could you print "risc-v" or "riscv"? There is nothing
equivalent to compatible property in ACPI. Using mvendorid,
marchid and mimpid, people can determine the exact processor
<manufacturer>,<model>.

Thanks!
Sunil


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
