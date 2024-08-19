Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41432C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 23:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WQvvIyDsZSnORIrgUgCYSp79R5AJMm06R6+YevZvb78=; b=qxbe44p2VuDWAG
	MlJ7oh+Da32fgWtZsbkGOo4A6l7h3B7Ni8MJNOZfqTlYTq8fLV0mT42EdgTepjC9+ufA4wsjdv0nM
	gRF+yepFx4soDDUvV1BXTgd6KHqZqBsFoTEb33DT0EFoLQDNPZQa86gZPFcEombgy9SunWaSQMeQ9
	JXv1M9J697i85d7JUl93KsVGrRFV7G/1Us2cVzZLYkKAN9peDMlmswPdMFCx4WpDLZ7uRiJt3ZWKg
	iJebP1mTv8gEZVXB/2LPJTHrEPRf2cTx5PNU5fqGDbJrFRhnZKp9lkqS+PyMMNn1wXnalNz2x/EDM
	60r3N8XuliZzDHd73EsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgBU1-00000003CIq-2oFr;
	Mon, 19 Aug 2024 23:08:17 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgBTu-00000003CHo-26ar
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 23:08:11 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20219a0fe4dso21354555ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 16:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724108889; x=1724713689; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=chwDL7bJ2k4VMKox9bivVTl5tCb9HfYtJn62XBZoAXg=;
        b=NpHMif3NfO5Zi3zRBuXBkRV7frr8hyURAsnghX97aOhpf73i+GYe52QsvrbfyBfVqT
         07NZO0uxYFCIwDp/lSXsRhwcSJ74aTfXregY+l+EMID05SN8gDLOFwYYgcxTdfk8H9ct
         Rj4rEQp+51txLAhmr5vFoZhlWTw6QGoq8bdOPkG3h4WF+MuNpiYUW9xCJDSfHxeSMFXB
         kM9UahgE04a2N3dPa5GrL9hDnva2LstQmndpiZlv8I4Km8BJuzrXwS1EuOqVBOhGd4JG
         iMyexxTQeDP0f6qOxg015bF1+Pmik8yK3C7VKzLNeh3zpqMIErUgBFentz3csMbrWE+Y
         7IHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724108889; x=1724713689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chwDL7bJ2k4VMKox9bivVTl5tCb9HfYtJn62XBZoAXg=;
        b=hxHltjt2sQfz6/w8uRc+968OjA0NPGRmL6VTNadOanaRjRsSkgVpSqhCMaM0BYRMPd
         2uZ/N+1vUS1/TZwSzySwl53dnMuWm00+43QQxZzsGv21X/nES8IqrMs1jQ2NTvz+4USx
         BSs5/Kho/6xnNbBYvFTVrQQdIhHfLlDipbjscQ75hHj8WxJrrziWr0XFWNo3hzr7Ofjm
         KAeGn/cZQIbUxiRiNgU8XQipqedRawboFpCaMtiQ5jbfjCIsiupcmw0ppDCEomV1ujX7
         KgBAl9j0OokuJ7f9p4wdarxjhnN73mUJJ6RMSt3LAbuK/CfGyt0+ne/tX/usPpcIT1t/
         G7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCX0jhzCv/+HVOecM/AqaU2GN1kqiX3+kxcg9ZrmKxSsaF27r3mILBBzLIxNeolpELJJABPdK9I+bfjBRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXECYK86OcKy1gyHVY5An/miPGF0Z/p9A6SPdCkV07kNv9GqA9
	8/I3+CqFE1Baa61oR7hEhnLQzN7r9pe49OMNmCYbWe+Wm7vx/KnwHH7RzAlIIRg=
X-Google-Smtp-Source: AGHT+IEd2Ijgt3VG47p1nwI6CmHUL/s5AbjumrfKfEevtuBsy0bDvH3X6zujx/CBhbDOTnL3K9WNBg==
X-Received: by 2002:a17:903:41c8:b0:1ff:50b0:f5e2 with SMTP id d9443c01a7336-20308aec25amr7296975ad.13.1724108889287;
        Mon, 19 Aug 2024 16:08:09 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f031c68bsm67211625ad.109.2024.08.19.16.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 16:08:08 -0700 (PDT)
Date: Mon, 19 Aug 2024 16:08:06 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: indrek.kruusa@gmail.com
Cc: apatel@ventanamicro.com, conor.dooley@microchip.com, guoren@kernel.org,
	heiko@sntech.de, jernej.skrabec@gmail.com,
	linux-riscv@lists.infradead.org, samuel.holland@sifive.com,
	samuel@sholland.org
Subject: Re: [PATCH v9 00/13] riscv: Add support for xtheadvector
Message-ID: <ZsPQVpJAh7L5kuXX@ghost>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
 <20240810185815.116-1-indrek.kruusa@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240810185815.116-1-indrek.kruusa@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_160810_562921_065AD3E6 
X-CRM114-Status: GOOD (  15.34  )
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

On Sat, Aug 10, 2024 at 09:58:15PM +0300, indrek.kruusa@gmail.com wrote:
> > I have tested this with an Allwinner Nezha board. I ran into issues
> > booting the board after 6.9-rc1 so I applied these patches to 6.8. There
> > are a couple of minor merge conflicts that do arrise when doing that, so
> > please let me know if you have been able to boot this board with a 6.9
> > kernel.
> 
> Hi!
> Regarding issues with Allwinner D1 CPU I tried to track down the problematic commit.
> I tested with MangoPi MQ board (Allwinner D1s) and starting from this merge I can't
> get beyond "Starting kernel...", ie. no output at all (and u-boot keeps restarting):
> 
> author	Linus Torvalds <torvalds@linux-foundation.org>	2024-03-11 14:03:03 -0700
> committer	Linus Torvalds <torvalds@linux-foundation.org>	2024-03-11 14:03:03 -0700
> commit	4527e837801e76bbb196bb3b19375d8e43d636be (patch)
> tree	9c5b6c1a9f7d42530ff6140bceed737428ebac2a
> parent	02d4df78c5ae70d283ebb4f78b9dcfdd4dfb71c2 (diff)
> parent	678c607ecf8a9b1b2ea09c367877164ba66cb11f (diff)
> download	linux-4527e837801e76bbb196bb3b19375d8e43d636be.tar.gz
> Merge tag 'irq-msi-2024-03-10' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> 
> 
> Previous merge boots fine:
> 
> author	Linus Torvalds <torvalds@linux-foundation.org>	2024-03-11 13:50:30 -0700
> committer	Linus Torvalds <torvalds@linux-foundation.org>	2024-03-11 13:50:30 -0700
> commit	02d4df78c5ae70d283ebb4f78b9dcfdd4dfb71c2 (patch)
> tree	cb8d854f7987a864e3699a616e028953844181db
> parent	045395d86acd02062b067bd325d4880391f2ce02 (diff)
> parent	f7f56d59a3923e95bad2c49615a4d7313ed78314 (diff)
> download	linux-02d4df78c5ae70d283ebb4f78b9dcfdd4dfb71c2.tar.gz
> Merge tag 'irq-core-2024-03-10' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> 
> 
> I hope that someone can take a look at it.

Anup sent out a patch to fix this:
https://lore.kernel.org/lkml/20240817081218.2985171-1-apatel@ventanamicro.com/.

- Charlie

> 
> Thanks,
> Indrek

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
