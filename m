Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51979C54E58
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 08:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OF1hwtxWy5bDVQfix9jknh3k9e9zB9u1O9y7GI1oKuE=; b=I4N7sB8wOXm61L
	DhcTtTMBSCgSylHV/N3AD/Ey7ZJgRnXvMaqrJ8Zm7i42FyzZU3DYc3Nrlq24/68JoPab9opaNr/E/
	zz74lWIrrUCQ6dT0it8bwcJNLsNkbpKahEFSb55GDauUIfoLnnBc+fohtINoupZu21BrP4uwvnRGz
	ZZYXfJKLiZUAtOf7ssNsOUJnPaqlRIfYI8TtF1imX4NHU5E+3uZGNBmSvm3Dh9kLmxr+GeUoa8jwM
	/v6DMb0dHSvZq8wS3PHIH5i1EGhIaKGrO8mSjhAASQK75jX4E39t9HQOrh765SXbUZrFzU+BF9J++
	7KxMO9iT7KI+EVtrM0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl2fE-0000000H66F-32on;
	Fri, 15 Mar 2024 08:11:40 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl2fC-0000000H64V-3Bby
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 08:11:40 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a461c50deccso213149966b.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2024 01:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710490296; x=1711095096; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s/GjHxvspqde5PDmyzE58y/UK2LQWPcFmtqDdmYzTvY=;
        b=ZVEZZQYn8RQysOVnnHwpcWI6Xlh+iGKkGf1r+6x1YAvneydNXlG62qKxdt2O0AKIBz
         kdvNjgrJx23qAAewYZ9/jTzhwt8nIspejYTbZ7VcY6slsL3XVIfn4rKKFOC4xsplnxaI
         qjx7Yzwhv+cm342trG6j6z3raNZzh3P/J31yDUYZHdP0vV/K5R3KnvPuhpcGpKL6jlRf
         Q7cBtDHAqwFi7zlq45haTB2WaR/PNosVunHFxObtO+F85iukr5zhN0h9OmLomSsu3oWg
         XZp4pCAOvH+EYzpkcBjD6kokgkd1KSkxfOSjEHyJGskFKv0/7rJmDB4l/2RRDZZPKfgS
         bAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710490296; x=1711095096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/GjHxvspqde5PDmyzE58y/UK2LQWPcFmtqDdmYzTvY=;
        b=n+6b5AhXOgvDl2ossmZNoCZIT3QK+Poj1/uf461l7xGfe191lN/LTKg52wglY+CjUO
         cC8bqa+GhEy5z6oLg2qCG18GhNrpLCS3VOkRT2MXCqcHFW2+NDqAbr2W0EgcapLrma8l
         C52I9iWgF3MywswGA/AOJFBejn7co4Q/Hi6pl4sdzNsBgXa53v8YqV71i1kIh7qsjrao
         wgQ8aVqT1RCmwGC8Q48ku/QrnNqhNpp4i9+tZDfjgqe7JWvKRnoea+FsTYHfy2Z1n1l/
         fH57mUMeCk9sAfj7rJ/kr4dVqgm5dDN5vKjEA4y8oC39SoWERBM/9wa9Qm7uKIEEe0AB
         ldEA==
X-Forwarded-Encrypted: i=1; AJvYcCWI0Kv+NHZmBSAstcpRdRytQgPLE6Ead4IYfo06Aj7mBh6fNXR2GEROcd3ekF2kuPbGrK3h9imA8pfW7AdheX4EtNGEtSMAdxz68TSPVKG4
X-Gm-Message-State: AOJu0Yy34NZk6cX2U6FQjQJSPbalYSzqitHndeObA3B+d18UIni0DAEh
	534qiazP1lNcOXjUSyT28QalgygWIq0e0hDMBhzVeVRU3EyA00mGVy7kacls1/s=
X-Google-Smtp-Source: AGHT+IHkkLwS46uOPoHgx+M42KZhCd2StM3WX/KkNEtooUlZc+lcqKpZL+XZ9e/wUMtsDkqtuWHieg==
X-Received: by 2002:a17:906:c144:b0:a46:9395:818e with SMTP id dp4-20020a170906c14400b00a469395818emr156069ejc.68.1710490296654;
        Fri, 15 Mar 2024 01:11:36 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id h11-20020a1709062dcb00b00a433f470cf1sm1467996eji.138.2024.03.15.01.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 01:11:36 -0700 (PDT)
Date: Fri, 15 Mar 2024 09:11:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Conor Dooley <conor@kernel.org>, Qingfang Deng <dqfext@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf: RISC-V: fix IRQ detection on T-Head C908
Message-ID: <20240315-73aa13079ef83a4559869084@orel>
References: <20240311063018.1886757-1-dqfext@gmail.com>
 <IA1PR20MB4953ECC3E32E95303872CD14BB242@IA1PR20MB4953.namprd20.prod.outlook.com>
 <CALW65jZ+q8sDiRKgsRL9n+939HNUCnkKuO=YJjHB5Js=WYQeOg@mail.gmail.com>
 <20240312-evil-resource-66370b68b9b4@spud>
 <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953CE8999960BA71B46DE6CBB2A2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_011138_891726_515CDAC3 
X-CRM114-Status: GOOD (  19.31  )
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

On Wed, Mar 13, 2024 at 09:31:26AM +0800, Inochi Amaoto wrote:
...
> IMHO, it may be better to use a new DT property like "riscv,cpu-errata" or
> "<vendor>,cpu-errata". It can achieve almost everything like using pseudo
> isa. And the only cost I think is a small amount code to parse this.
>

What's the ACPI equivalent for this new DT property? If there isn't one,
then the cost is also to introduce something to the ACPI spec and add the
ACPI parsing code.

I'd much rather we call specified behaviors "extensions", whether they
are vendor-specific or RVI standard, and then treat all extensions the
same way in hardware descriptions and Linux. It'd also be best if errata
in extension implementations were handled by replacing the extension in
the hardware description with a new name which is specifically for the
behavior Linux should expect. (Just because two extensions are almost the
same doesn't mean we should say we have one and then have some second
mechanism to say, "well, not really, instead of that, it's this". It's
cleaner to just remove the extension it doesn't properly implement from
its hardware description and create a name for the behavior it does have.)

Errata in behaviors which don't have extension names (are hopefully few)
and are where mvendorid and friends would need to be checked, but then why
not create a pseudo extension name, as Conor suggests, so the rest of
Linux code can manage errata the same way it manages every other behavior?

The growth rate of the ISA bitmap is worth thinking about, though, since
we have several copies of it (at least one "all harts" bitmap, one bitmap
for each hart, another one for each vcpu, and then there's nested virt...)
We don't have enough extensions to worry about it now, but we can
eventually try partitioning, using common maps for common bits, not
storing bits which can be inferred from other bits, etc.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
