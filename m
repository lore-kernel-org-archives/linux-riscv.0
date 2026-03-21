Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938251099B3C
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 05:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePDuzQXDSs3tjkSX2tAVN3Coh74+r84HGSgLdGYRHeo=; b=BrVSq7osUGRDYG
	2u86T+T9g3dvZtZ+sSpzdPiuNkMVU/O1oejhkhDyOG0cISR59BW6UNrGcIIOeTyuEqVAWefTvm8hp
	xUt26T7wIMSQlg1VFxULdAN5eWJ+0Z12W3KPcOM8Y77dZldUUillX/uyf0NYkyQbWyBtVcT1GQrSY
	HdpQFK8lgdQ29hM+Ds5sB9wIMwnbichhiCtixKcl/4wuB0STuRFLrK+jfJ5/5N0GsuzUSuN9tLiZH
	MNpYzHOlrywEm4Zdxsx7lexlk3a8S/VaPIuOeiSlJN2tCtbO86Yagdog7lT9UV2tke1ccixz/K2RV
	V5w7xQEkUOvB5I87DLLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3okg-0000000E4kc-3qqO;
	Sat, 21 Mar 2026 05:19:58 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3oke-0000000E4iI-0taI
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 05:19:57 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35b98def50bso1769807a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 22:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774070395; x=1774675195; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N5slH90cGMNQaJ/nUAO66vR2HM7xhu3omBUy3YIB1Mo=;
        b=PapAKbeQWSS+JJh+t7zgkY6RD9ktK/wJPg2a5ciWWtVt/1N14Ujc6yuP9Vl+YOJLil
         otl5I2fKio7Z3RTorML+3zTPZunz94pqBo6TXGBwyC2Wan7cV+UcYx7hAisF28e3zCxZ
         Bl+CIaH1OkO67x0AfE4CcKnuNQyn6iG51psYHImNoitHTnpGpCRivCq6eSSyKGhvJm+Z
         q+OiQ5nGtH2eXOvQLiyIaUR8Caka8flV23+TLo+d0yA6n0qGrUhZBRXpzk/B+fPVG61Z
         JeldBoPCpL05lJL0qkdXLQ+1xHCViEzvYxTP0dhb5wBYoJPeSZHmF8+mo6Vdx41r42JB
         J2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774070395; x=1774675195;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5slH90cGMNQaJ/nUAO66vR2HM7xhu3omBUy3YIB1Mo=;
        b=KFgWMYDZMC9viEfHvWJ2qiz79KgKGACSBrIHpD854//0mza0s066fz89cZV9oWYdkg
         l02JthGCfPO7Y7tUIpjMsWW63wgDkbXOZxFR1nRks5V5CkR2rkidW9lkETno+mwZdqI4
         LmhZFWW0SG+XdqdjcjrYYXQqkgvw69mp95ZtVp1gMKqLsYOhlD78k4Tr/SbdT0OjQCH2
         BNKlklDJ7mxkT7NdrYsebEo5CpovbP/tHXzw+7kG6v7+lKSAI/VMHYkQgZUMvqxS33ks
         EtOU7PkBNQO3+T4CKiIN9cnEO0wjdkf7J7GEv2IBGppZx5ZseHWNPCRb9mu1Kap9aKyL
         mX6w==
X-Forwarded-Encrypted: i=1; AJvYcCVMAC7pdBQQ4rkFzky9u88PLR5pkET6R8HKXPQ/ksEyIvP27T/l3EFscJF8pTmptH73/CwuWHN+RVv83A==@lists.infradead.org
X-Gm-Message-State: AOJu0YydpGQYwZD6KXp4kj7UGmf37WwVkGS2x+7Brf3szh20msHz3R1s
	FNcEGhhtmzFayHemjSVZHBFc1l0jo95ife///tzIMlGOiy96GwXumaQR
X-Gm-Gg: ATEYQzxL+tVsbnly5+t/E8vhtAaC6Hpkutw1leXRiQgQf1DnNZei9CeonxTBAOJuMr+
	bY/BCmOUSKFK6P2ZvKCUDhFuW2JzQOEj4HEHwtAejynuc0dSklSGdfX9tDPeoV1Z1IewiabO2/P
	kg+yL7zwiSx9grM+2jyUH7Mp/LWBXj02fk1NKA+ZrdL/wmP438hJB+vXI+If61weIo2WYLPTDDj
	KdASIzRUxAbqHlvXTbvpHvMsdEBFZk/dY9yf7ZELsmbVN/0GCS5J3U93eBPPGCzBQ9OCzfr0fkS
	ibNEntvYd3678ih4EIsCvOiGOhEBw4P61MJD9BfhGhq/bXsLGPDDeWquygxrEb635S/7zSvPfkk
	+4kWl0nY6YyV33K0Hf2mrJXUjZMum2NX02I5zSyc821GfBY4ZoO2u1lHu7aUWNZB98jCwH8Rp0o
	sMIhHUa6TabRjdNr4L0ig+sQ==
X-Received: by 2002:a17:903:191:b0:2ae:c984:6d72 with SMTP id d9443c01a7336-2b08271e23fmr57382855ad.22.1774070395090;
        Fri, 20 Mar 2026 22:19:55 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836955dbsm52944385ad.72.2026.03.20.22.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:19:54 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] mm: change to return bool for ptep_clear_flush_young()/clear_flush_young_ptes()
In-Reply-To: <5d24b34d8b7860dc2188408b3fa530193bcc5caa.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 10:48:41 +0530
Message-ID: <fr5tyd3i.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <5d24b34d8b7860dc2188408b3fa530193bcc5caa.1773890510.git.baolin.wang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_221956_253964_B0E5D4AE 
X-CRM114-Status: UNSURE (   8.16  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> The ptep_clear_flush_young() and clear_flush_young_ptes() are used to clear
> the young flag and flush the TLB, returning whether the young flag was set.
> Change the return type to bool to make the intention clearer.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/pgtable.h             | 15 +++++++--------
>  arch/arm64/mm/contpte.c                      |  4 ++--
>  arch/parisc/include/asm/pgtable.h            |  2 +-
>  arch/parisc/kernel/cache.c                   |  8 ++++----
>  arch/powerpc/include/asm/nohash/64/pgtable.h |  2 +-
>  arch/riscv/include/asm/pgtable.h             |  4 ++--
>  arch/s390/include/asm/pgtable.h              |  4 ++--
>  arch/x86/include/asm/pgtable.h               |  4 ++--
>  arch/x86/mm/pgtable.c                        |  4 ++--
>  include/linux/pgtable.h                      |  8 ++++----
>  mm/pgtable-generic.c                         |  7 ++++---
>  11 files changed, 31 insertions(+), 31 deletions(-)

LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
