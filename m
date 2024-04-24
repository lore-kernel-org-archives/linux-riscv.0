Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CEC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUXuYr4SZkN0O14SUT0CK5HXf1XTRw22xSYKM6m3kqk=; b=qUpC128W+JhlY8
	Dad4kVJ1RoEdQyef7HafG3DT4yhk4VzN9NL2f1UrmbHMgXhABqYcRchayNvB6q9FAWU2SVlGPkq0d
	kAheRW6ExAszeTGoADNw8fJb9gAUI/kayUWHqUCieBybPvqzPFdocgCbZEhloXC0wecYeZQxydJ42
	KA6v1Y65MxJsXIAg+J683tufNfEPXnzSqk09mWFDMysyQ82GDXACn/Os4EWM2TnR1VbTaJ0fbOg/I
	p9IJRSDbCp4qab11nY10fpvv4McganMvt+TWxpO9751Jd8jUsPEe1yjI1gc4ZBbeehA3xLHj8bhkn
	B4p7eviO9All8yl5xS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZwV-00000003iAs-1243;
	Wed, 24 Apr 2024 10:33:35 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZwR-00000003i9t-2s8f
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:33:33 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a5224dfa9adso143237866b.0
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 03:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713954809; x=1714559609; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Se7FkiOFFmLiB3Pc2t7VYJjCSUTnACj7ZQGFyLtCFek=;
        b=a6RIDBOQwMSZGsTqhu2ljzGJhJYV5FwfL17uwNkgew3Bz10IfVa9uTjzNFjRoCH+1C
         8PWNkO0VY71xzdSuPTZeVljnnDALdeZbNmn8zXxfN0s0HyLbbgOIC/h+W/ys97A7qW8y
         YseoXL9T3ZvWnzhvQvGFgjeLnVWNQtBIGa9gaD1rAhbaVySIMYTCj0wm7TfknEA4x1s1
         SbjnFx9M00UwKoqL5Bxtbq7V/trJ42AzePm1XbDQo3YBIfdL8uLWJLKsHqF6g9KD1BuT
         CLszMplanWD9vSN/QGgJW+o7qdUbDtV3HfLOLjnPC1j35sQpHE+ofOxelVD/SOJREJV0
         BtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713954809; x=1714559609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Se7FkiOFFmLiB3Pc2t7VYJjCSUTnACj7ZQGFyLtCFek=;
        b=NBvXKPL21nkWN5pK71BH9Xu5loNeKyeGNIH5riGMiALD18iLBKrI41vvDvGBESRPOd
         u34hnOPuHWZlDqW9DDWeS6Wvy6vlrPlJaIcDHFBbsHvwLPPKcK3bst9Qurm2x5euq4vd
         eItelmVFGFcriJ5D3WNjG0O1+UN7yDrJy2NYPmMKOwC0NDGtaPAmTw8A0GzuUlyE6vzq
         kdwiFA/StAmqdv8qrJLN0D8R8Gwtiy0z+UmkIgCOuKuPh6qQrcFeq9p/S/Ba2zlhWnbo
         Gh86Is1NuIRqsP9Dr+R+laG3glw/rfJajIGJMwJcnu6mBLLHWpaF0YfH3N3IHPQUSndC
         5wVg==
X-Gm-Message-State: AOJu0YxIRR4MsFocV2S8QL1Ax7RzUEUlzxUC6BIBxMGlKXhMcwin0DAN
	lNcx2YJYN3GEbTqHBTMlJf0PihdvdxeOe3MxcPyVdGC4rdvAQtyYSSdo1QXFXMk=
X-Google-Smtp-Source: AGHT+IFj4T2+hm1slCtEVGeBY7iMCWhPk4r/Ngwo8GXo+y6TVgrCQQFA8pF5V3jV9SQ1EOvstfL3uw==
X-Received: by 2002:a17:906:a2cf:b0:a55:75f7:42fb with SMTP id by15-20020a170906a2cf00b00a5575f742fbmr5835263ejb.24.1713954809533;
        Wed, 24 Apr 2024 03:33:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bn16-20020a170906c0d000b00a51dcdca6cfsm8177993ejb.71.2024.04.24.03.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 03:33:29 -0700 (PDT)
Date: Wed, 24 Apr 2024 12:33:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, cuiyunhui@bytedance.com, 
	woodrow.shen@sifive.com
Subject: Re: [PATCH] RISC-V: selftests: cbo: Ensure asm operands match
 constraints, take 2
Message-ID: <20240424-d96185a44365c73d606c6526@orel>
References: <20240322134728.151255-2-ajones@ventanamicro.com>
 <20240424-familiar-subdued-74d8922444df@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424-familiar-subdued-74d8922444df@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_033331_751996_01A94CBF 
X-CRM114-Status: GOOD (  16.83  )
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

On Wed, Apr 24, 2024 at 10:41:10AM +0100, Conor Dooley wrote:
> On Fri, Mar 22, 2024 at 02:47:28PM +0100, Andrew Jones wrote:
> > Commit 0de65288d75f ("RISC-V: selftests: cbo: Ensure asm operands
> > match constraints") attempted to ensure MK_CBO() would always
> > provide to a compile-time constant when given a constant, but
> > cpu_to_le32() isn't necessarily going to do that. Switch to manually
> > shifting the bytes, when needed, to finally get this right.
> > 
> > Reported-by: Woodrow Shen <woodrow.shen@sifive.com>
> > Closes: https://lore.kernel.org/all/CABquHATcBTUwfLpd9sPObBgNobqQKEAZ2yxk+TWSpyO5xvpXpg@mail.gmail.com/
> > Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
> > Fixes: 0de65288d75f ("RISC-V: selftests: cbo: Ensure asm operands match constraints")
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> This has been sitting in patchwork for a while and I don't see a message
> from either the reporter saying this was a good fix or from the selftests
> maintainer that it has been picked up. I was gonna mark it "handled
> elsewhere" but I noticed that this was only sent to the riscv
> maintainers so we should probably harass Palmer today to pick this up?
> 

Yup. Thanks for the reminder to follow up!

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
