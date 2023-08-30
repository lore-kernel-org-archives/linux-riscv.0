Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6EFC83F14
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1yPU5+yXsHjilFeN/DMqpVPww9EDicuQ7kQD+JJkvI=; b=k9g2GXLISgU3Ew
	B431bbnPkHz4DYfDYxMxCZBKzyP/z7DFws4m824PNCcYoj2s3N5cl5DAzqRKHDZUoGmqY+PFjQIUe
	9aPoXyYRJULJapH1wnrTLzDDiEN51m1LaQhCsPJUK0aEMgOiIfTBtUcjCeBE2NG1dLTr0k04aI+Vr
	/0kvZglkSKZiqMI2RKM6PrjWG23JptDvMJjhn3iRg91tZ4o/j8zyPIcIxcmdPsWw0P0aB4k4xtklu
	CzjeMYDjo21cXe0iqsnqdynNbMaiLhkYKOE170jlXqJv5ELibO6Fdr0/5nZ8LQUgPh/MSAwlqPG/T
	WQJ6lBBsNE4Q7GfXGVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLBl-00DZFq-1J;
	Wed, 30 Aug 2023 13:24:53 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLBi-00DZCT-0W
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:24:51 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68bee12e842so3861571b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 06:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693401888; x=1694006688; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ook+FTkyICrUjBd7fQtOEeWleupa/6WExjctivOBh1U=;
        b=SDhZXMVF1V4F6Il40qKO2CqeGebggYQsAQtVbhVBQpj89jbEsDLN9GSHbhHaG6wtXw
         QNe1SWnQx2EoqZGe/m2elugvOLzE8BNeabTFPtBo2cSi3VbMJGlEeIR8j6G+VwXZ7/nd
         T1Sp3ydkC0TyyRda+rRiAxLsL2t19k/RlzN2IAXdquqv/e2x5fR1fZ2JrqVJ4uw1QXuk
         iC++FGYFlX6qh937gMOu+L4MXUkZGaDxgRessUjFUOds7BCTAa4h8sQNDrBBqnSFGYpL
         TE5oVZuM/34kZqwQDoMv8DRBcA9UbbuY6wBEznqyQ0Wxv9Wx3502Qz8/d6bgie+HeFmF
         +gxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401888; x=1694006688;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ook+FTkyICrUjBd7fQtOEeWleupa/6WExjctivOBh1U=;
        b=UB2rArTHtiMQ6PE/0CR8oLaM7wHBxsphJhOl+aICokXY4eEP1irSng7jp8lJWO5c81
         nhSxg6bmYFmhof4bj9CdElxdk8KvLzcMAvrfuDGrdM2FbDrekoQYekEO85FJ4P7P7cfi
         qH1diJQHospkvDpEwG7eQqvFRuxi06/aN44WQvSyTlTW7aIPBsclSdmDCQrCnqeujSgY
         LfGOctgxpTUPlRLID29dmnwNLglzONB4y2aWZ6AEoUTj/DULO/t6yJ76hzo8Qfh/8OgX
         fBdrjckiatrYV2QtbPJDjjL2FAoXTXP/bUAnIKymP4+j1+ATDb06FJhzsBJ/oWszbhEA
         Aaxw==
X-Gm-Message-State: AOJu0Yzk2O8hqgfjgHHTxGX4of3jQPtLWVVrzYPwEHL/+8Q95xrDbinf
	c9Ov6V+HdRr8QdFYdYgU7fu93g==
X-Google-Smtp-Source: AGHT+IFxZTjAILqNa3f3RrZLF9BvSy4qVQtIlHlGVAYql2Bunt7iMjjyBJzDwiPBLi6U8zBDpWImyQ==
X-Received: by 2002:a05:6a21:7781:b0:131:f3a:4020 with SMTP id bd1-20020a056a21778100b001310f3a4020mr2505730pzc.33.1693401888044;
        Wed, 30 Aug 2023 06:24:48 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id n26-20020aa7905a000000b00687375d9135sm10082581pfo.4.2023.08.30.06.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:24:47 -0700 (PDT)
In-Reply-To: <20230727160356.3874-1-jszhang@kernel.org>
References: <20230727160356.3874-1-jszhang@kernel.org>
Subject: Re: [PATCH] riscv: enable DEBUG_FORCE_FUNCTION_ALIGN_64B
Message-Id: <169340187985.2480.18103495945853549626.b4-ty@rivosinc.com>
Date: Wed, 30 Aug 2023 06:24:39 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062450_201001_9F73A766 
X-CRM114-Status: GOOD (  10.69  )
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


On Fri, 28 Jul 2023 00:03:56 +0800, Jisheng Zhang wrote:
> Allow to force all function address 64B aligned as it is possible for
> other architectures. This may be useful when verify if performance
> bump is caused by function alignment changes.
> 
> Before commit 1bf18da62106 ("lib/Kconfig.debug: add ARCH dependency
> for FUNCTION_ALIGN option"), riscv supports enabling the
> DEBUG_FORCE_FUNCTION_ALIGN_64B option, but after that commit, each
> arch needs to claim the support explicitly. I tried the config file in
> [1] for both RV64 and RV32, I can't reproduce the build error as [1],
> there is no reason for not allowing to enforce this function alignment.
> 
> [...]

Applied, thanks!

[1/1] riscv: enable DEBUG_FORCE_FUNCTION_ALIGN_64B
      https://git.kernel.org/palmer/c/74f438e75483

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
