Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A13C38A02
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Oct 2022 00:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KS/JXLe5BxXicMZIkHUrzFFIhVHEtKWNiv/xEsKl2/c=; b=gozdqqa8lfx8Xg
	AgIbRcZ8FNvlvEiKEFhjck2zbTDY913KdOosHjQ7ugslQfNW7hwJ231uI1KqmHKyWGrSgZ0kVkvb5
	P/8fKVjaHR71kqyjFx818+XWEq5Hnme1QtIB1jIgxqO9oHN92PrsCtaLV6tQ7i5dLEa8jn+K+QpiT
	I8QAoI07g2i6LYq4P3OwP5XQc7o63nMJLT0S9tdsvsDN62M+1gjhHrD78RabXkC91oQDQRbduz1XU
	SizKyAJmtEfYJCQLFm84nogytOrdym3HpuSJVmOJJw2nkktyxIbBUwXLjYX0D+IPtIwEJapIH3mct
	HXacfkLlXaWOfhTFnCGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZpF-003SsJ-F0; Sat, 29 Oct 2022 00:35:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZpC-003Srh-5y
	for linux-riscv@lists.infradead.org; Sat, 29 Oct 2022 00:35:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id v17so3181549plo.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 17:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Le86NMxhBnkwa5kXIbP7+Mnqw0bru/EQIoCWyjB5JU=;
        b=nmrPcbR0b96pJMlWdwC19vFW4cVVyauU/WSjiEytPk37rCNtpgeycpqCqQHfLsZt3q
         Ppyp/Gr/uETexxp9LqIQyUnMQU5yg89bfbscBQy/Vl844c772hTMMMvkg5F6gxVe9uCJ
         PlifKUXGhExr4CqKt9voKFhDNIDyn/s5AAaE3RtRGdTv7ADWTm7B1uwZ7zMHC+8eyAos
         PYkpSplgYuguDmMJRGmovbcsVYJmleSzFtIHqqyyxydD9TRIVTGAop4cosXtXZ9v2tZZ
         oYaNy/8x7QMpNDF1zbZID5rDT8atzMz8L5yg3otKeQoBwTS15R1TqKftxexhD8cWg1VX
         57rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Le86NMxhBnkwa5kXIbP7+Mnqw0bru/EQIoCWyjB5JU=;
        b=tJfFHZUpj34BCtRun8ECz36so1Ic8JswX78kxzDgmqKnTcI64bwihnPlrGBMKUvzTp
         jJHeLP6XonnlcB/sb1hbi56wEzGviIvfkm5KUfNhZAyDI6Cr5nuq0Ow02FVIif86QlTu
         WHOkF0gUcH9C/PvXowVBFwgOIC3BofEVVWDv0AHySjoWWOXkopsY3Yv/Z01m7kqa4xFG
         KMSGRap5QSstGpmBqFwz7Ft7AZ5kYfLmmwc/4w7B5QhWOTYdhe6LSBs4GrjchFjhoSYS
         /jnj/WhGk+Opmt+HP4bv0MaUa7TdPKMN1phVAYosC74PxUACgo8IbgiP1tPC7hufz1+V
         8+BA==
X-Gm-Message-State: ACrzQf1J5CNGpkPbDfQIUk2pwuq1cGSq5pFbtbR7haxehgnobFieEqC0
	UalFdfVJh+zs+EQqukc03Ttnet2gAPLpyw==
X-Google-Smtp-Source: AMsMyM41ZIZU4gyRBPUNxDYN/sNjzM8zdfkKZiOwAlrxqpZJXo8roQRqf9d/R2h0m+WZNAXumYZJgw==
X-Received: by 2002:a17:90b:4b10:b0:20c:c3a8:38e with SMTP id lx16-20020a17090b4b1000b0020cc3a8038emr1979085pjb.195.1667003743482;
        Fri, 28 Oct 2022 17:35:43 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c70-20020a621c49000000b0056beae3dee2sm49349pfc.145.2022.10.28.17.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 17:35:43 -0700 (PDT)
In-Reply-To: <20221012120038.1034354-1-liushixin2@huawei.com>
References: <20221012120038.1034354-1-liushixin2@huawei.com>
Subject: Re: [PATCH v3 0/2] riscv: Support HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC
Message-Id: <166700373783.11702.14374051952974242875.b4-ty@rivosinc.com>
Date: Fri, 28 Oct 2022 17:35:37 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Björn Töpel <bjorn@kernel.org>,
  Liu Shixin <liushixin2@huawei.com>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_173546_461671_70144233 
X-CRM114-Status: UNSURE (   7.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 12 Oct 2022 20:00:36 +0800, Liu Shixin wrote:
> riscv64 can support sv48 now, so we can add more hugepage-related features
> which rely on 3th or 4th level of page table. These two patches will
> enable HAVE_ARCH_HUGE_VMAP and HAVE_ARCH_HUGE_VMALLOC.
> 
> v2->v3: Fix the commit log.
> v1->v2: Fix the build error reported by kernel-test.
> 
> [...]

Applied, thanks!

[1/2] riscv: Enable HAVE_ARCH_HUGE_VMAP for 64BIT
      https://git.kernel.org/palmer/c/310f541a027b
[2/2] riscv: Enable HAVE_ARCH_HUGE_VMALLOC for 64BIT
      https://git.kernel.org/palmer/c/be79afc740b5

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
