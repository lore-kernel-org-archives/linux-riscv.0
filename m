Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C3BC7EE23
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 05:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G10buMTf6El06h9j3tiYOkqsxXM78QFk/tXNzq6VZP0=; b=iv5ynxJVjLttCe
	UY16/4R2ZgoKir4uX/LB1obeAoS7cQOFk4lTmoFBBiFRJTtO3J60Dtd4QhXqd7c1BgQ65bYRg8RLA
	i0P69/59Ewpv/Za5ncGLJbMkCR+uoS1wDWGQzpkORg69YatGj01wKLxC2A3iTkDctxhIKcwP8P9TN
	5FwggmNNSbzlmwIejftcDI1tZ/KbOco4zShtUOibCcBLfDKmThnxTjjoE9OuqYXI53yI/uTVECUTb
	CMU83k9I51G7eGrIw09SMzPBOQqCp617pPB+yCm5JmAe+mRQD5mB3F5DT0TnNKx8FO6onm6C7WsxV
	B7/nIliQCpqq+m5wc2Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6lLA-004NQZ-2i;
	Wed, 07 Jun 2023 05:04:12 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6lL8-004NPQ-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 05:04:11 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-777ac4344f9so93702839f.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jun 2023 22:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686114248; x=1688706248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ee1qHw85e1eBuIdTgig6finUlPCk2EHIHBldhRjpTW8=;
        b=OlSi4zFOBdfhM/9fHTRPXVQIgMX47mJAkJXrVv5KF5pz/WxqZXoQCduHEFKhManpO7
         KTDg0Z6xT7TBRvCR9p09OHs7kQwsLLqr7TuD/ckBw/BWx/xl+T2CPih3OovP4CZszGqd
         9PU2ldNC1ZZZjbMfqbWLne60ymEHFiHGCPZVOhJg8P8nF6kg+xZpAiLR8RMjYP9VfpEN
         MeExXgXTBydcEj2ruDuphqNm4tksbGuBygXxlE/7NFXdkOkmO9PgkUI56MiSz5yIfVgQ
         s3g7Sa4CCWcSk02uIqrXWSCp8J0DBgb8VCalYMSaBUbweLU0fyKDymtRwxtUir/gt/K7
         CfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686114248; x=1688706248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ee1qHw85e1eBuIdTgig6finUlPCk2EHIHBldhRjpTW8=;
        b=KT6xJICIvxx8oeWL/9eq63T58RsKrGXrHncTl22g8EXNG4VMqEo24Wy1IF7yeDZuyR
         NzsVpANPtASvZb3QqF32pgF3LRdeKPSCRiqJ/4p7OghuO7PD/auDRm5R/5KhAYuFXBM/
         nq/Q3SwFda6JJ3ro7jDBGOHbnidDxuoITFc1l3+7lkXCe2uyJEIPKGz2Z6XOkPg4rjq/
         NtnxG8EWNIo8p9qm+NPyt14dlDG6Vv9bsOLcSy3nvHPUCWwRGq15Zad94m/catpqOynp
         Frg1kuL1CE4KFpSO/A1QKfcDD93h0pzCzLORsHVGNLeSK98rQgPdwfVUTHJUp2CVx7Xy
         74bA==
X-Gm-Message-State: AC+VfDxvpEBOw/KCEFGi6vWjyOVy0/PLJCxA7M6OIGQ/xjtwFzpimxlN
	9K0XfGZm2FYaGmvOjQJnJHIszs75FGJicMLBM32Mkg==
X-Google-Smtp-Source: ACHHUZ4Z/iohestmpyscDyMKSE2JiJGGdU65tjAlQFbm9eJHYAacPAnDBkWRMxzeQTL6/kERoYlX3w==
X-Received: by 2002:a05:6870:c82b:b0:19f:1947:551 with SMTP id ee43-20020a056870c82b00b0019f19470551mr3995485oab.6.1686113763954;
        Tue, 06 Jun 2023 21:56:03 -0700 (PDT)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id ed43-20020a056870b7ab00b001726cfeea97sm5564537oab.29.2023.06.06.21.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 21:56:03 -0700 (PDT)
Date: Wed, 7 Jun 2023 10:25:56 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 -next 1/2] RISC-V: ACPI : Fix for usage of pointers in
 different address space
Message-ID: <ZIAN3OHhPbvgj0uV@sunil-laptop>
References: <20230605143512.707533-1-sunilvl@ventanamicro.com>
 <20230605143512.707533-2-sunilvl@ventanamicro.com>
 <20230606-conduit-cupped-1791a640713b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606-conduit-cupped-1791a640713b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_220410_484801_A54DEC97 
X-CRM114-Status: GOOD (  15.28  )
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

Hi Conor,

On Tue, Jun 06, 2023 at 04:35:29PM +0100, Conor Dooley wrote:
> Hey Sunil,
> 
> On Mon, Jun 05, 2023 at 08:05:11PM +0530, Sunil V L wrote:
> > The arch specific __acpi_map_table can be wrapper around either
> > early_memremap or early_ioremap. But early_memremap
> > routine works with normal pointers whereas __acpi_map_table expects
> > pointers in iomem address space. This causes kernel test bot to fail
> > while using the sparse tool. Fix the issue by using early_ioremap and
> > similar fix done for __acpi_unmap_table.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202305201427.I7QhPjNW-lkp@intel.com/
> 
> Is this
> Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
> ?
Yes, I missed it. Will add.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
