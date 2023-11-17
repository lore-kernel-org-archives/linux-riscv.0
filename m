Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E09C072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=enHaf9k94OHIzpez5h/iXfxGQZwqJns/a4gh4zUISdM=; b=o8T74CvYpDj5N8
	jIDkP4HSCnKYt55LoLTEU3tyyeJfk18V3t0Ki8e0NqxeNehYdpoi/oUUgwMlKcU5jLwJaIuyzayON
	z/UGcNds7R1L0uQjW49rigVvhcp/+AnoIcFbPCNh+q5hHIqTa1Tg2o4et9D4dyQP2CE2u9D2Usnk/
	hhxoEwysxoXvYnw7FUY06DYL6YOIOd5L0NOitO0LajsTfh2IjeipK3CTM4ZtGbBOeROPlN6ElUpEv
	0Pv/aZ2Ok1w8RRGIA1nIsz8n5pDgSvV9bBrr72fCC+f3aPWnt1jm00imj5yBzdE1Dyko1nEHMnpZJ
	aFZ6vWMAEDOAYGidkoeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r42Ow-00704j-2J;
	Fri, 17 Nov 2023 17:13:07 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r42Oq-007008-11
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 17:13:04 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1ef9f1640a5so1172019fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 09:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700241167; x=1700845967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/hoNZwah8AjVjd5/pBBVUbPTzEhp3jSCj9zR0qy2e4=;
        b=K/BQRkJyYCWbj/InhkxMpbUqC+lhQlsNlTQiPF+x2Cj4BxDOnqFKdLKT0nxupNth1k
         +psv1ODDIX10ON2aGZKoUOAYJiyIIp77o1ickij9cODpzYo1iFL3kXkTkxseyzGx1Djw
         in3/aI22/aKvG/HCLDcToAZ/dZrFfzu+uBn9BptjqllqRYL52pn/aQRmbTULBgN6mn6J
         ZqiAoohTRvOj9f0oYZNkJdGysK8nBCByvq5dBKmNE6CExLXD6FMvYC6X5dh4ZnLdDmN+
         UsoeeSA2C2LG2xQXVSUHE7t8AENY1U+UOi59fbnnK6XSgj2/bWhBk8bCuigGX9wsxxu0
         9ZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700241167; x=1700845967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/hoNZwah8AjVjd5/pBBVUbPTzEhp3jSCj9zR0qy2e4=;
        b=OG9zEvxD/W/hhDGq8GqRhG4phEE5+E5gX8Mku3xMbEjoUQYo59zk65s50knsaE/D+g
         lfD6RFBHfFiTKvzvqXUcdOmrwdZYRD7VwP4gbycB1Fe1QXzC/fKbEFL6G8pJFTB6Z96e
         I5YEMB8EgDZi7syBm3i+n2SyBWHnN/kbB+YO3Si/asyBZATlHcelkLxapCKC1eT2sMtW
         IgDqFxub/8vQlFl4lE5CDnqSO1iOi8GeQNg8FrsryUNO5PVvSyT00KhfqMEiYIy+wLnM
         AzPPLAHiBvZdoK4btp/g3jle6NBKs2GKwg4mSkP+QxmcxAzvHWCQedQvCmm0DZDLBUm+
         ehDA==
X-Gm-Message-State: AOJu0YyowUKp1eZKRXAR6FTCp0fFSzN3jKsXot6kpdu7n+CQCFcZEHZU
	gentQ0KWRXqVJhM/2GImii07oQ==
X-Google-Smtp-Source: AGHT+IGZa62vapzDx4pgL5oXuVfeSgvxyZs/DOL/6iahwpimVnUoBkONoUtxcaOA8eIG11XXmAro9A==
X-Received: by 2002:a05:6870:ff89:b0:1f0:36b6:ef25 with SMTP id qp9-20020a056870ff8900b001f036b6ef25mr20556215oab.23.1700241167452;
        Fri, 17 Nov 2023 09:12:47 -0800 (PST)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id an41-20020a056871b1a900b001eb79fedbb1sm331092oac.17.2023.11.17.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 09:12:47 -0800 (PST)
Date: Fri, 17 Nov 2023 12:12:45 -0500
From: Charlie Jenkins <charlie@rivosinc.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for Nov 15 (RV32:
 arch/riscv/kernel/tests/module_test/test_uleb128.S)
Message-ID: <ZVefDTKIeGa+ts3f@ghost>
References: <20231115122752.6b12654a@canb.auug.org.au>
 <1d7c71ee-5742-4df4-b8ef-a2aea0a624eb@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d7c71ee-5742-4df4-b8ef-a2aea0a624eb@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_091300_354876_701C6D77 
X-CRM114-Status: GOOD (  16.05  )
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

On Wed, Nov 15, 2023 at 01:01:24PM -0800, Randy Dunlap wrote:
> 
> 
> On 11/14/23 17:27, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20231114:
> > 
> 
> (using gcc 13.2.0 from kernel.org)
> 
> on riscv 32-bit:
> 
> arch/riscv/kernel/tests/module_test/test_uleb128.S: Assembler messages:
> arch/riscv/kernel/tests/module_test/test_uleb128.S:9: Error: unrecognized opcode `ld a0,second'
> arch/riscv/kernel/tests/module_test/test_uleb128.S:15: Error: unrecognized opcode `ld a0,fourth'
> riscv32-linux-ld: cannot find arch/riscv/kernel/tests/module_test/test_uleb128.o: No such file or directory
> 
> 
> Full randconfig file is attached.
> 
> Is this a toolchain problem?
> 
> thanks.
> -- 
> ~Randy

I had an assumption when writing this code that uleb128 was only
supported on rv64 toolchains. Since it appears that there do exist rv32
toolchains with uleb128 support I will modify this test to be supported
on rv32 platforms.

The config AS_HAS_ULEB128 in arch/riscv/kernel/tests/Kconfig.debug
should be auto-set to N if the toolchain does not support ULEB128 even though
the randconfig has CONFIG_AS_HAS_ULEB128=y.

There are a couple of sparse warnings in this series that I will fix up
and send out in a new series with this fix.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
