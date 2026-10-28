Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D533606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 14:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dECcV8pO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GPHqnxYq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LM9gmAPEdhv/dQOgPYEAWR5oJM1X2FRiGttm2QmiNqg=; b=dECcV8pOj+495TZr0JX3J0GFK9
	T1T2dFMrZ7ASbY7fQYVI9sooY9JQbx6BHoS8exQPsHdQ4MhvvQkBAKaz4BZlo2iNoTsm2Jjy/2/Oi
	dKbkV6OIQD+HeEaB/LN05vvkknPD4VjHn31gd9Xhw0YGBZS30j/imzq0220YdRxmSaMz6C1VTVTfE
	z8uOtWVesx5CfsOomOj7Gh15CUh90h6+jH4Gt2b5nhrIsrrdROgYzdlktocv+646HDMXilBzFIiSN
	a5dcWdweBRv0MJChffaLpqVpAlVzBvFcR9gUNFt8qbuSSzOA+svUiyAY6flDIcG4VJAbns8JetmjM
	DrTPA4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4jy-00000007DGs-1jwn;
	Wed, 28 Oct 2026 14:34:58 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4jv-00000007DFo-2HEY
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 14:34:57 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so635631a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Oct 2026 07:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793198094; x=1793802894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ydu1rAo9dDQ2P3ZEd6v7MpsvEnSOLbGCjA1CautF4xg=;
        b=GPHqnxYqg3jk5XJ2BVs/9HtjAL49yNFhR5RfCpGefELO8w3ggXyaImWK+DjGxQ7k94
         QjTXB/AxL+0bjI9vxBMDE+tZL4EaZd8trAe6iGMfkYGQUEWAOzWkdfbi5YmPSx5EpSoe
         gKOK7uGci1amT9MdsLZEDwKFl9peyvXKlmD2LVWzOxR3LJRD7YNov5u3vE51hzS9rYP2
         9SIjce3dklfwGtyGdDvhB7f+1cJt1dUH/mCja1AzYFZb8pBqqHyxjn+AG8Cv3aSBDNqX
         K1y35YNXItJYc7vPHTUkezicwFu+/4HEVG+Tri3UQ7R9wqIV7oMZdxXY0aIA3fNSqb4V
         yDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198094; x=1793802894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ydu1rAo9dDQ2P3ZEd6v7MpsvEnSOLbGCjA1CautF4xg=;
        b=xRq8OV4LnkzhIWIxWgFaYDh1aYbc7S8C8S8BmeVxFR2OQ4d1EhDR5npJ0kyy67PlOD
         PKpA3pRdnVUUXSMj8vYnDo73iJpAfAgnYZn5AuzWnrKq8c6ZBy6FI9eVOsjLYXMDIE0p
         9AlY/dWIRkb2HKnXN2fDMMgDSvp8L+gTCJz1DPA3C17pFie4WXZRMEHZKe/vnTblySdy
         NqCgJ1wk4RhQWQZ0ftmmdEDPsxQ+S13im2iHFn2SrmHiQykHHQf9AqkEGRlSiDhoGycd
         a+odWaWmLRR4zT5XUWGFs4LpmhM13uamnsBp3nPs+EQXtrnt4Q2ltufCdXNvSotsWcAs
         6ddQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYOZQtGT96zdDZwIFSQzQzZCmStkdnflPwJyMAg3ms5QyYAOsz2BF+fGafPVTU4fPMksgPN+ZGbS1/5A==@lists.infradead.org
X-Gm-Message-State: AFq9FYLHw0clEHk88BnINlAoH4pDye8Mka2g7HL5/StKosfylpxUgr7/
	+C/Oc3b7mHi8pIGi3h01KTotohDMF52smpAIsPKlz2wLMoTyrNAMyvXd
X-Gm-Gg: AYBFou2k7t4JbY/6my2SXav3AdEZ1nhPGoosG7IBsbSSTLhB7IehsAJDkSpa40c24gt
	0VaoJaof1ZkBPrHds/49XYFSRfgti+bTvZb+U4JyMddsCpncMXdwD6UExY8hIO+KkFBlY6YL3xs
	YSWcUNtoJOdEmRjILVnvmtQV4EMYsofsBh1dq/AJM+n25rgfIoZ3MX6PnwNQTDfxO5WZbWEYec9
	0du+HPQDWQgEordkvQCv+Edqtles2JFwCOgn25HjBrGEC03HQ25eqsMvL3cejX/hiXDWIlwdQVU
	sFaCeWLw9KP4MdhHuPx84OEbVO1i01yEw6fcB3CNLoyIgQCKgrNS1mrHRVEJ5pPY3DHd3Gym/Rx
	O2MVtin/ClEbZTuK1yo5kvlEOgsDw5bTEYa2pgkX0NMwysKsBO9Z7U2NeEAX+vloRCGCtKLKAKo
	1rUa0gLFeIrSIQQEQESuTfYs5EomeoT141I3tAWzFVZYF1SAVWJVReUgrnDFCP77Ut27hvRsP1t
	jL5VJY5fhYWNvqufkoDKXmwLfdeKz/jTGLLBQIXpLS3WqFqmZgUDCeEfiKZHi5FAzfwzPfWf420
	exnxms/C5oy7fCGwpZTu/W2ctLdafg4Wzk7IXV0cnQsQoRn3LpVq8vb3nw==
X-Received: by 2002:a17:90b:3c92:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3ae5822faecmr1918100a91.46.1793198093715;
        Wed, 28 Oct 2026 07:34:53 -0700 (PDT)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a5e73sm3236015a91.10.2026.10.28.07.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:34:53 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: Han Gao <gaohan@iscas.ac.cn>,
	"Yicong Yang" <yang.yicong@picoheart.com>
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	conor@kernel.org,
	wangruikang@iscas.ac.cn,
	ganboing@gmail.com,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	cleger@meta.com,
	geshijian@picoheart.com,
	niehaitao@picoheart.com,
	cuiyunhui@bytedance.com
Subject: Re: [PATCH v5 0/5] Add workarounds for Picoheart erratas
Date: Wed, 28 Oct 2026 22:32:45 +0800
Message-ID: <20261028143446.293107-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017083100.40157-1-yang.yicong@picoheart.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_073455_585494_C77490D2 
X-CRM114-Status: GOOD (  16.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Tested-by: Han Gao <gaohan@iscas.ac.cn>

On Sat, 17 Oct 2026 16:30:55 +0800 "Yicong Yang" <yang.yicong@picoheart.com> wrote:

> This series add basic errata framework for Picoheart SoCs for handling
> upcoming Picoheart erratas. And add workarounds for the first two
> erratas on our hardware. Also do some fixups and refactor in support
> of the erratas.
> 
> Changes since v4:
> - rebase on 7.3-rc7
> - make cbo errata depend on MMU
> - limit MXR enable only for __get_user()
> - Restrict Picoheart errata to 64BIT and skip alternative patching during
>   RISCV_ALTERNATIVES_EARLY_BOOT
> Link: https://lore.kernel.org/linux-riscv/20260915083305.81913-1-yang.yicong@picoheart.com/
> 
> Change since v3:
> - workaround CASQ by patching the system_support_cmpxhg128()
> Link: https://lore.kernel.org/linux-riscv/20260907072149.72031-1-yang.yicong@picoheart.com/
> 
> Change since v2:
> - rebase on 7.3-rc2
> - merge the MXR fix and get_insn extraction into one patch
> Link: https://lore.kernel.org/linux-riscv/20260728094627.94975-1-yang.yicong@picoheart.com/
> 
> Change since v1:
> - factor out a common get_insn for reading userspace instructions
> - fix the issue from reading instructions of a exec-only mapping
> - cleanups and code style refinements per comments
> Link: https://lore.kernel.org/linux-riscv/20260715084724.26578-1-yang.yicong@picoheart.com/
> 
> 
> Yicong Yang (5):
>   riscv: Make get_insn public for instruction fault handling
>   riscv: insn: Support decoding of CBO instructions
>   riscv: errata: Add init framework for picoheart errata
>   riscv: errata: picoheart: Add workaround for cbo.clean errata
>   riscv: errata: picoheart: Add workaround for AMOCASQ errata
> 
>  arch/riscv/Kconfig.errata                    |  35 +++
>  arch/riscv/errata/Makefile                   |   1 +
>  arch/riscv/errata/picoheart/Makefile         |   5 +
>  arch/riscv/errata/picoheart/errata.c         | 235 +++++++++++++++++++
>  arch/riscv/include/asm/alternative.h         |   3 +
>  arch/riscv/include/asm/cmpxchg.h             |  21 +-
>  arch/riscv/include/asm/csr.h                 |   1 +
>  arch/riscv/include/asm/errata_list.h         |  25 +-
>  arch/riscv/include/asm/errata_list_vendors.h |   5 +
>  arch/riscv/include/asm/insn.h                |  70 +++++-
>  arch/riscv/include/asm/processor.h           |   2 +-
>  arch/riscv/include/asm/vendorid_list.h       |   1 +
>  arch/riscv/kernel/alternative.c              |   5 +
>  arch/riscv/kernel/asm-offsets.c              |   6 +-
>  arch/riscv/kernel/cpufeature.c               |   3 +
>  arch/riscv/kernel/entry.S                    |  14 +-
>  arch/riscv/kernel/traps.c                    |   4 +
>  arch/riscv/kernel/traps_misaligned.c         |  52 ----
>  arch/riscv/kernel/vector.c                   |   6 +-
>  19 files changed, 424 insertions(+), 70 deletions(-)
>  create mode 100644 arch/riscv/errata/picoheart/Makefile
>  create mode 100644 arch/riscv/errata/picoheart/errata.c
> 
> -- 
> 2.54.0 (Apple Git-157)
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
