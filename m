Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD20C83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTV59TxX8JBQ6UFkfPv0Nx3FJpcgxvfEFLxmN4v3bVY=; b=XGCJpUYGlQJ7da
	p/zCNR2MkW2rXdt3ZH7joHUjM5h6P5pH/+JoPRRnoIUAxpG+0jR1zdU2FawaGBNme0YescvYQHILI
	E0WXd2gBqdQ9S8sPFO0lbjAFA+CqPr+9XjtsR5y1RTvqBWiH5n2GW9kEWuUD/+sqtmYNuGrcRoUH2
	TCuSP2Sl7KvL9+Z7c3Er2Ynmi0jNDJTKkqykQLIOzkikFu6XnQhrfIn3a3MFOShIb2bgbwsU56lf9
	Zzs/N0twDOnDX30BXwSZrHb8dIZuqC8LNJWRk5CMdV1GARFmaZLX0SJbPvYl437MHwYay8j3PP6Hk
	H2X8XrIAo4yRNkJyw5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLBk-00DZFK-1Y;
	Wed, 30 Aug 2023 13:24:52 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbLBg-00DZBH-2m
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 13:24:50 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bdf4752c3cso34396355ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 06:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1693401886; x=1694006686; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEvZNSVZiS+7z6Mw17Qm1I/j4IIyodcA9POjfT2QHoE=;
        b=emmH7zVrVaGlksJY1o7AU09juyFrOA7a5813XsZ63WXPgY5Y6oPEKV4Pe6wUH6k2Po
         rwVPL7nZa2x9l+GbfJcJuWHlNMp+Eg6FolHaxJUu7xOHCbwRe/OvLG3WHSvI+bUI16UU
         ZXgdNB0vMpL2BKTF7SgkAQt4OZgkC7RevAkrrr/QTbsxpuOoQiZt53YJh0HomxPhGJ0l
         rmoB5ORMvHr07RBtDZwn2eQj71si4l1WQorWEx7bPAoV+gOquX4b1CfMMJaFNJNeCZKm
         31Z+MQ1XbG2+s2beXYM/FWevUEzqNLt45QzDjtSQjsWTTENRYpjlWaROEdav44rC3W3o
         MK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401886; x=1694006686;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEvZNSVZiS+7z6Mw17Qm1I/j4IIyodcA9POjfT2QHoE=;
        b=BwRKgaOPG5+lyesI35kCT91YNwELvazG/PlWJHdiwTjPnFbWXhtrq8zEMsQYt1i+EO
         5W2JLcxyDjX7oVZmYgdv28QRrUQOc2y44ntUO0n3idTUx45q7l5wvA4QNQeVftaw4sDK
         TBu+d/cV1NElBS/h8d71j59w0wcnfhMSJij7lcoD6GSR4sOQC9lsD4/fhUiHVwddNWR0
         f7HaGzNAPvEaZS3AjhhGQI3JCP100iy9NGix5JRMXgF/k9TOjkoATVoDW1t0n9ddsi5E
         Obe3B/I7g0f1K30IwQLdL//Crycd13Hj/e0jpTK/gsCP/r9VHUrHq6LWBV1uN3lfVX1U
         PpAA==
X-Gm-Message-State: AOJu0Yw+5kw9tWThkv56VxFnRpNgJ2BCuNKqBqzgwQpkalcbF5YvmX1w
	DrxUW4Y+U1Fd6iDXcZXpJdHZIA==
X-Google-Smtp-Source: AGHT+IGN+AGaRkiEA4vJ3zSkuQYNSOInqPwcLpnv5c07Z8QUjaoeEXDH1OeDX942Zop0w53P3FzU2g==
X-Received: by 2002:a17:902:c951:b0:1b3:d4ae:7e21 with SMTP id i17-20020a170902c95100b001b3d4ae7e21mr2033147pla.63.1693401885877;
        Wed, 30 Aug 2023 06:24:45 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id g9-20020a170902740900b001b8953365aesm11026197pll.22.2023.08.30.06.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:24:45 -0700 (PDT)
In-Reply-To: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
References: <6d2acfa4-7f44-d3b4-b0a8-5495c5985e4c@google.com>
Subject: Re: (subset) [PATCH 0/3] arch: include asm/cacheflush.h in
 asm/hugetlb.h
Message-Id: <169340187982.2480.12772091186084147276.b4-ty@rivosinc.com>
Date: Wed, 30 Aug 2023 06:24:39 -0700
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-901c5
Cc: Mike Kravetz <mike.kravetz@oracle.com>, Russell King <linux@armlinux.org.uk>,
  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
  linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_062448_898827_8D808D4A 
X-CRM114-Status: UNSURE (   7.01  )
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


On Sun, 13 Aug 2023 21:50:34 -0700, Hugh Dickins wrote:
> Three architectures are using PG_dcache_clean in their asm/hugetlb.h,
> but relying on accident to include the asm/cacheflush.h which defines it.
> 
> 1/3 arm: include asm/cacheflush.h in asm/hugetlb.h
> 2/3 arm64: include asm/cacheflush.h in asm/hugetlb.h
> 3/3 riscv: include asm/cacheflush.h in asm/hugetlb.h
> 
> [...]

Applied, thanks!

[3/3] riscv: include asm/cacheflush.h in asm/hugetlb.h
      https://git.kernel.org/palmer/c/3aaad36808b5

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
