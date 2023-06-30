Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64768EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8N+kCtjYL/LrSZk8pb2e9E78Eveefio23ldnqZg35BA=; b=XP7oONvp0nG4La
	BAhAtAzV81qd3UC76ZySZy09I/yZcR2QQ39S2lsezZZFbawgTytJA27Lq9tlLaieRXUnYYKcNjn20
	Eos9U1S+i0F6pKdHog2OIjyhMxnnASS4rKwFPSSRyUuUHuCnyHiIljeAx++BxJxE4TKDI7UJ2+mAs
	vq7lhWBQOoZcYFVYsPGcJq6RvvsZOk2i9gs45/Kyi78/35WGuNZ1S+6/9qjlYtGESGFGyRytrtaeH
	CoOD+7/oSXaOU2GiRo8JDjlO03/SDjiPc9Bu8sOf/uWnAnBxma4wYNlTl0jFZrhH2gLCD48+GLek3
	dF3LLtZ3xzegI417aiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF8qE-0037S8-2b;
	Fri, 30 Jun 2023 07:46:54 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF8qC-0037R0-0m
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 07:46:53 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51d885b0256so1876694a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 00:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688111210; x=1690703210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkEVUn+BSGCw26Br9R1zJay0XQU2Hj1OrR3nyO4XYMs=;
        b=pXW7rqo2IPCCQNelaVb4brBvc66A3ZsWjaSvhuweZhbnHl52z8pQnkZvsPvTuVFnjl
         O8sSSJB0DWG46EaLZsvx1SOe+L/d37a9A0x6Pevillxw2A/kVu0f3BQT78pI7QFeCwZp
         G2RZH9s5TafP0LSUNkJZ3Ovd/EcLBs6haxbhhkqWvvDTwNZql5nbOBbMc5AJLWw96j01
         bO7wHfy0r8BbfI23SDIZN5JRXVO6/sOLrrKypk3TSwwoR7EpX8rRtDLO05FoUywhlI/N
         xI1lmHzC5sKJ2bN+jiDxyTOWr1cTFW4pxG+g1r0ycbnhuIqVpMPXwBTgLmCn5DF5EVoZ
         TaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688111210; x=1690703210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkEVUn+BSGCw26Br9R1zJay0XQU2Hj1OrR3nyO4XYMs=;
        b=FquVwzqIWw005wzXto8O/Tqy+hc/Zn47s8QkcEFJD2/SSwrjLfW7y/Vx6JD+gdmY97
         3oRaKQB8AB/nO3MH7TQcw5xDgqJtcqjs7wEAkbnae1LKom/k9I8jVetTFWPAx5sr8fvR
         vEq9YB4M6YG5aeConn74MpsxXBh/lnGdhmtPY/nCNa1h3fOi9iLBa3cTXxKNJm7r8WPX
         X6gDGcbReBRZKCCAyIDn8oG9ZxKxSd3rthEmdj1MatPqwrXQNn141OeeyjZSelcOMyEX
         1xk+DBhh5d6nOmcAFIMLHMC+FVGZFV9W7KRq5pp56BdgDn9hI9DJWlF9SuBCw804Y90z
         qD7A==
X-Gm-Message-State: ABy/qLalJfTf7SwTcmTdobsPLa2sUmXcgLXZCAlNtil5cSmX7xZxfyLP
	mCMLQIvr0p9ILplwdJn1oqtxMw==
X-Google-Smtp-Source: APBJJlFgqHa9gDbozF0P92T72GWSMIP3fuYpYu4HFpS6dAtkIvNTi5BLg3397B7OHXeTVHiRxxPH/Q==
X-Received: by 2002:aa7:d98f:0:b0:51d:e59c:6190 with SMTP id u15-20020aa7d98f000000b0051de59c6190mr1208294eds.2.1688111209947;
        Fri, 30 Jun 2023 00:46:49 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i12-20020aa7dd0c000000b0051830f22825sm6503023edv.90.2023.06.30.00.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 00:46:49 -0700 (PDT)
Date: Fri, 30 Jun 2023 09:46:48 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 10/10] RISC-V: provide a Kconfig option to disable
 parsing "riscv,isa"
Message-ID: <20230630-7d0f6fe66c9415315d491f15@orel>
References: <20230629-landed-popsicle-ab46ab3b46d9@spud>
 <mhng-f060b5c8-aa99-4952-b1e1-ee85a92e6b07@palmer-ri-x1c9a>
 <20230629-angled-gallantly-8fe7451a25fa@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230629-angled-gallantly-8fe7451a25fa@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_004652_276535_F9A528DE 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, Evan Green <evan@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 29, 2023 at 10:44:18PM +0100, Conor Dooley wrote:
> On Thu, Jun 29, 2023 at 02:16:49PM -0700, Palmer Dabbelt wrote:
> > On Thu, 29 Jun 2023 13:20:55 PDT (-0700), Conor Dooley wrote:
...
> > > +bool __initdata riscv_isa_fallback_cmdline = false;
> > > +static int __init riscv_isa_fallback_setup(char *__unused)
> > 
> > Maybe it's better to support =true and =false here?  Not sure it matters,
> > we're already down a rabbit hole ;)
> 
> Dunno, not implemented a cmdline param before. Seemed "cleaner" to check
> for presence, don't really care so I'll adapt to w/e.
>

I don't have a strong preference here, but to throw in more food for
thought, I see this DT-v1 vs. DT-v2 choice to be a bit analogous to the
DT vs. ACPI choice. The 'acpi' command line parameter, for RISC-V, can
be 'off', 'on', and 'force', where

  off -- disable ACPI if default was on
  on -- enable ACPI but allow fallback to DT
  force -- enable ACPI if default was off

So, if the default of the isa fallback command line option will depend on
Kconfig, then we may also want a 'force'.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
