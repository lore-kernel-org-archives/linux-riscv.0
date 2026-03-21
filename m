Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1A21099B3C
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 05:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cc7PGKmS1mKi6h7BnAeRpNIpZIVRlzTej0364oEVvS0=; b=RSaI/QqzS8FhnW
	s4JaFHxvE6pYiA2LPZSm7aPL+oCZSfPDX/CbzqrX1SyXO1GAZRf13hK4duwgG2xGhA1yT47zl0lfl
	jAa0fv8c1BZiNGIXku6Xs+Mo6oGLV2CEMpPg1YYQO0tOubBD+K3Qayh05m2P5cI5eC29N040codsR
	zX1Tqmdrj9k0lKNts4qLnGOZsvwdamt3ethS80D90jb7K3HhP0LAEfPA/HEav0rBVs7nJcP2PNvTs
	KzMnfMSHhH0rbMJFbnllazoaZBQLvbCt3xKv4uJXJ2DhUxCIOmurW8cYULiNDaFXh4v2RI0aBaQDf
	4Aka8YsByNpaubdumKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3oqu-0000000E5fg-0NmW;
	Sat, 21 Mar 2026 05:26:24 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3oqj-0000000E5es-2z81
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 05:26:19 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35a211df8e3so1827823a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 22:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774070773; x=1774675573; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PPum4GWetd7qCwPivtEJVV9TkLkZOn6LkWq6BWUPBjA=;
        b=Oc4XFMr3+RGPyKJD+xlTwWOTPt4mvL8Rovr/bawnECX8+x7+U1hcJGKtMDeBF1FVte
         GsW+PbGYO4IgZBpuCp8RHO6sKvDuqxqC1qmdbouF2xytfZGh2MyQM+XNhex72GxyRX4Y
         jDHwZZDsfJzxedK10QTaHnkRSXXBRR/b6pVcAaZgq2jEZUn10epdhiramruuoSjkaSPm
         HIxEUYdcBhYZ4QzXh4da50s9tseyV72D/dB704iSKQm18XBEovZoTxHWO2krb7Zp6tYt
         DpPfHXVpMqQ7imZmhFOGLnFYUsnq2No8sZo2TkDWvmhdFEnnxz7pKsq0tqu5KDcqAEMc
         A0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774070773; x=1774675573;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPum4GWetd7qCwPivtEJVV9TkLkZOn6LkWq6BWUPBjA=;
        b=CFGtTpOpHLzGJfps+XNEk3ZWcBmxMW1dwEJr2V2y8uiPecW2YzjuTPF99h6RSKa5Zm
         6zWIrJaHmbpxJ3Jo8qmTe1/FmmmipvRqnUUkMz+mg5tYwbPZpML4BFT8ZEB1/pkly46v
         UlSvG621OzAYvWYXqdvmy2aOaQtP+aS3xKLogoFBV37hA8ILQVaWUym0vG9bjpywYChP
         K2KpEceLZb0dDaBcJhGy+ZLm9Dvl2hArsS8njpjb3OBdr3NYBHanXmG+JgJ62tudm2VC
         TS1626E3wyJunLnCxMBDov0pxoETiJcIFO/SvlMsnjxN7zLL/+8swlHyalywCvazcEsO
         mwJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvHsQWjAZ5w8k3mdqQ8I1fmFTn8dNorOBrceEsiOt9etI83dQZigsEP2Nzjwf7IwQFh0Mm8lLXGGdoJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDlN+dkRGLRGKnMfrLFtEdSKb2n+nCt0lwPOBm+mtW/etXDWc0
	6PB2Hyn/g70xbR3x7mlSxAc+hwcr35+IRdYRuoHARgN4oodd9FpwEyiqj4rtSuKP
X-Gm-Gg: ATEYQzzUrxU8fYZXiScf+tOY+C+BKpUeT1iDAqfAv/5qDVLLWijYNb6q/IsOko1aT66
	QDuABtEaNG+3FNXlcS+nkl+pn2kak/fWw614HjmI1FCLbdUj8RCEzK/T57UmJYs6emrZqKo/icI
	D2Ewm8cYEYkPbFGF36X+K1Q2PUhfZuWligISj0vC/Wkdj+RfQOBAuM+eLcO883qQ0sqP2rn+mdj
	NgwSR0ZDx49+IftMpcG/LKx8Kp1qdxDZL/G6WbppoTjIYuxfFKRy4ph55TgYIxQiY5PGff1n/7K
	w607Z0NWGZT3RFvrn8KXZHCzwg2eIshwrog4z3+to0S14YBMInwFK0Hra/xXBZl9fgFLJrhZokS
	r/2WrteS//5zEN3MbD1no3+ZrNy0ElBxW8lGYJcwfaLubtaEwHvMr+7Bo/276N8l2rTnMxMxoQG
	/Zj6eW10XimfLvcgxYs+a/JA==
X-Received: by 2002:a17:90b:510a:b0:359:f3b1:6811 with SMTP id 98e67ed59e1d1-35bd2bd5ceamr4620697a91.1.1774070772650;
        Fri, 20 Mar 2026 22:26:12 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd41347f0sm3299371a91.17.2026.03.20.22.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:26:12 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] mm: change to return bool for pmdp_test_and_clear_young()
In-Reply-To: <8025b898d0841a4bcbd766998959b4e2ae4d4abc.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 10:54:05 +0530
Message-ID: <ecldycui.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <8025b898d0841a4bcbd766998959b4e2ae4d4abc.1773890510.git.baolin.wang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_222618_276992_93AECAAC 
X-CRM114-Status: UNSURE (   8.67  )
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

> Callers use pmdp_test_and_clear_young() to clear the young flag and check
> whether it was set for this PMD entry. Change the return type to bool to
> make the intention clearer.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/arm64/include/asm/pgtable.h             |  6 +++---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
>  arch/powerpc/mm/book3s64/pgtable.c           |  4 ++--
>  arch/riscv/include/asm/pgtable.h             |  2 +-
>  arch/s390/include/asm/pgtable.h              |  4 ++--
>  arch/x86/include/asm/pgtable.h               |  4 ++--
>  arch/x86/mm/pgtable.c                        |  6 +++---
>  include/linux/pgtable.h                      | 19 +++++++++----------
>  8 files changed, 27 insertions(+), 28 deletions(-)
>

LGTM. Please feel free to add:
(assuming you will anyway kill the unwanted externs)

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
