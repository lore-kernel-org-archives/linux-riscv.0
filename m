Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605A1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 21:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iosu2Wi9/7LjliFGyvJ6xYZMJTCQ8ZHZaJ8b6TVz1TM=; b=uUaUfruARlG2CT7tDwcQxZG4jy
	+3pe+R3XKMNQUnAf8X+741Pt47cwTZ1c0geg1e77b2y4GLjif3XrL+Lkj7Da2PkxLDKp6nkm1ro7M
	6T4yPqC0vSKysGiqRiR+00K1g5ODTmyE30WV/hESEr8Vao1r7BndJS8OFNk/cmM6WKGx+drBYfZM+
	bDFx3pRJjA+KI7PAgQZRoawualb+IYPGGnS4ZNJul1Rw/kXtAKt38WL6gyWQZyLNCgSA9X5MROqXc
	h7DcKn427j2NihCptQi8JSSW7NGFiD4cPsdwniyF61OweXYzzKx7vtoQe/mxHzk5xrTHBChs/chHi
	xG/Tejug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntyci-00CkMZ-D6; Wed, 25 May 2022 21:32:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntycf-00CkLe-0O
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 21:32:55 +0000
Received: by mail-pf1-x429.google.com with SMTP id x143so40302pfc.11
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 14:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=fLi8Y5a/s0Xg4Sk1cYFIfOl1cphXOIvzxubSQqTFwj4=;
        b=ZWirXg9GI4GKB5Uq33+V6Gj1KKxuFriu0iWhLDVoOxYETu/nz4VSIKpm201of+wkWj
         CUPCPkaw0fddmC2mD9R6WQB/GeZKKfyL7dBQjJQ9ClrVMOZkXKYgvjJEFY+Q78p09g+3
         JTfQG+yBJgJRJAEo47nC1yU+ncAzpael52p2lKdIc05vXZtbLXylgcMzbDXd2dGf/g51
         poOQ8lg9+epyhpGQ2/J2harSg5MIIpaCavtplU7+1nO1NMjqncZ7aWmOYs9XIesURp0I
         fYHptTdPy3T6LKXrGHdwGNXoXrS9DITPtsUsk8x//s+b1tlyES6PEkq+yZzTcdiCY5od
         AF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=fLi8Y5a/s0Xg4Sk1cYFIfOl1cphXOIvzxubSQqTFwj4=;
        b=Jz8ZhlQhjbxCF2y9KgwtqFFETsWnHialfaDG1Gvrr6qJ41vQ4C8nWF+ViI0OH6eOSF
         cK76/hpfFVJU5U2sxFxpSTKPQikEPNGT39FzX2Kewo1aKqS1vxb6bEfKWsJcy5BMKsHI
         zpSJarO7ECrFaE24gLcrcQ+ixGO4Lt4FDXcSWmIYuTwIT0J+zMvh1KoJpkdS2vNoHf3T
         9ORu3bEsRkZI2b/NOgBgsu/Y7gNfpofRUI5einqvC7Hds+hbWlOr8EUDd7g7dwaLdASI
         rHbJ2xD6+7ob3CyffwZtWOHqBFij1ifPF+MRyXIm8Fq8iSyxh04ZgWWMj68xISssxKKS
         N9Tw==
X-Gm-Message-State: AOAM532GHpNmE1xJVfx25GzQqUBCytbZOwPQmPgdtANBT7sNxMQQpEkV
	p/OLOhtusOXSqQPsK9gZc9iJ4ulm7eaPfLTz
X-Google-Smtp-Source: ABdhPJzxUwdWZSvkE8NvpYTpsxHZCR1FjjsO5G9TYaUE/rXrn+mu2UY6/q3ZhQaX0rWjrhSR4hSqDg==
X-Received: by 2002:a63:131a:0:b0:3fa:aa7e:b28a with SMTP id i26-20020a63131a000000b003faaa7eb28amr8518300pgl.569.1653514370848;
        Wed, 25 May 2022 14:32:50 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id y66-20020a62ce45000000b0050dc7628138sm12320869pfg.18.2022.05.25.14.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 14:32:50 -0700 (PDT)
Date: Wed, 25 May 2022 14:32:50 -0700 (PDT)
X-Google-Original-Date: Tue, 24 May 2022 17:52:10 PDT (-0700)
Subject: Re: [PATCH v2 1/4] RISC-V: Avoid empty create_*_mapping definitions
In-Reply-To: <87a6cfh0bq.fsf@igel.home>
CC: linux-riscv@lists.infradead.org, rdunlap@infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, anup@brainfault.org, vincent.chen@sifive.com,
  guoren@kernel.org, Atish Patra <atishp@rivosinc.com>, alexandre.ghiti@canonical.com,
  jszhang@kernel.org, vitaly.wool@konsulko.com, gatecat@ds0.me, wangkefeng.wang@huawei.com,
  mick@ics.forth.gr, panqinglin2020@iscas.ac.cn, rppt@kernel.org, linux-kernel@vger.kernel.org,
  linux@rivosinc.com, lkp@intel.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-3fb658cb-0f64-4c62-8318-b9b4c906ef00@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_143253_305096_71DFD1AE 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

On Wed, 20 Apr 2022 15:11:37 PDT (-0700), schwab@linux-m68k.org wrote:
> On Apr 20 2022, Palmer Dabbelt wrote:
>
>> (create_pmd_mpping() ends up skipped on XIP_KERNEL).
>
> Does it?  There is always the semicolon left as the body of the
> conditional (which is why you get the empty-body warning in the first
> place).

Yep, you're right.  I fixed up the commit message, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
