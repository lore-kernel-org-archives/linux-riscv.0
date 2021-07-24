Return-Path: <SRS0=Dv9V=MQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6D0C4338F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 00:58:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F232960EB5
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Jul 2021 00:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F232960EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Y6dtyXoBchrvBBNCwCvs2mxP9Aosp9zDFPriMArmRu8=; b=Iw95IiJS65rquOLkE2QOpnJf2L
	Zj8TyAEnaLyFNYL+kJafvUPagODrVFL7oojrTvSGWrC/mGyH4yYFxuYN8VYICyFYJSIPZ7g7tG9An
	p9ThkEpYOZy0bQUx8CwXgMAe93Wsk/6t3uBl/aTYIPwRqzKONmnyMEMlDtRLdBTF8rhH1TpHBjaKP
	CThk218Dgp/HCpGY7nR6J6f1+y6KwgbR9JhuEdWzimZsOsvfWXJMg/5DX/BrtV0PrbZjSe5XEgVHu
	fYCqfi8qAiirMCLD2ymYW+UoMRYUnFAyxStUNzZx36U3j8s2XTn5d35F0Db6P0fy/O4GNnRbFeXoO
	uzUZreEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m75ze-006UVK-Ab; Sat, 24 Jul 2021 00:58:18 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m75zZ-006UOK-J3
 for linux-riscv@lists.infradead.org; Sat, 24 Jul 2021 00:58:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so5971075pjh.3
 for <linux-riscv@lists.infradead.org>; Fri, 23 Jul 2021 17:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ixp2Efw04Zmd3ojpMMirglfvU4JyFrlYnefPbpvE9qQ=;
 b=l9EmVZ1b8261Fr7etjdogpbySpGIQb72E9mXlzLasGgTGWAJ8EtVZTKMd8zbqGSMJc
 7YIbBQh9V9p0HVnWd19DovMR24aEgea4rFtpb21KtqEp1fAJ1bQIsxr+Ro7Ca+XRbJti
 AaPBqClr83WbK38H6hMlj8Ux1ezhqf6w3PM1/0f/1tSq0cHWZb7pNMI5Q0ClyXlxf41X
 7rqvgNVh5C4wJEO0M59w2xU8cdceEWdq6sVIY+rrJMLcVFAAFqhc2pOn6gckWmsnB9a2
 zu+husRrFIUNK3nLfWZLOnroMNLehpEAurSlwX4ZzIJJ/GqkKknqJzQR2dJaVqeU/AQN
 5ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ixp2Efw04Zmd3ojpMMirglfvU4JyFrlYnefPbpvE9qQ=;
 b=i4xxVF9+1poGVTtofiXcqtr8WXh2Ry6GnIWWziM8cfn2+IzX9aTuIanExYMleXsCgT
 AzTtZW4J0poeh0kEt7pD9JDmJ1V+V6V0vaktejzmOWFqlX+l0Jtb3aRCds2Erdmd2TeC
 HREfG7H1den1fhFYvQ5XDYxSe/t/cbuLOVllLrO3cGKzE+XRFdgCj3ABjYWlDRDFqSNT
 evw6jtp6hnBSRC37jqHEGTr9aZIA9I74QVl1aMvJOOjH3kq586pT2KzrZoafNMjTjq1J
 tGphKWSN/4uTWVKWXLIdTEubIelrIsREqah+ih0x6SVATwQy6OMj91Hcu/g/b0/IVelJ
 t2yA==
X-Gm-Message-State: AOAM5311MyV26AddHQV4dD0E5140WFK3stChmp26YFWV6TkuVJpUn4t6
 qk9I9mOFTvZmCbXhbUU9WQiz2g==
X-Google-Smtp-Source: ABdhPJxSoQnZ7ArDNB+xyZSWKkPLPV63ZJuP3n9jQ2eYDIVHIqFpcrorc0FpHDVXGSt+1cbT3m/aGA==
X-Received: by 2002:a17:902:dcd4:b029:12b:fd1:d95 with SMTP id
 t20-20020a170902dcd4b029012b0fd10d95mr5740043pll.13.1627088292770; 
 Fri, 23 Jul 2021 17:58:12 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d3sm11434430pfj.17.2021.07.23.17.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 17:58:12 -0700 (PDT)
Date: Fri, 23 Jul 2021 17:58:12 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Jul 2021 17:51:10 PDT (-0700)
Subject: Re: [PATCH 0/4] __asm_copy_to-from_user: Fixes
In-Reply-To: <37097718-c472-025a-2058-55667badc5b9@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux@roeck-us.net,
 geert@linux-m68k.org, aou@eecs.berkeley.edu, akira.tsukamoto@gmail.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: akira.tsukamoto@gmail.com
Message-ID: <mhng-b80245ea-c042-4de9-8a2c-22b3e188434c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_175813_697976_1C93C2CC 
X-CRM114-Status: GOOD (  13.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 20 Jul 2021 01:49:42 PDT (-0700), akira.tsukamoto@gmail.com wrote:
> These are series for the fix reported by Guenter, Geert and Qiu.
>
> One patch to fix overrun memory access, one patch to fix on rv32.
> And two more for clean up and typos.
>
> Have tested on qemu rv32, qemu rv64 and beaglev beta board.
>
> Thanks for the report and instructions to reproduce the error on rv32.
>
> Akira
>
> Akira Tsukamoto (4):
>   riscv: __asm_copy_to-from_user: Fix: overrun copy
>   riscv: __asm_copy_to-from_user: Fix: fail on RV32
>   riscv: __asm_copy_to-from_user: Remove unnecessary size check
>   riscv: __asm_copy_to-from_user: Fix: Typos in comments
>
>  arch/riscv/lib/uaccess.S | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)

Thanks, these are on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
