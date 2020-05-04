Return-Path: <SRS0=z6m9=6S=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF3FC3A5A9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 May 2020 20:01:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C926D20707
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  4 May 2020 20:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nQsSvcbt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="qrHszcJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C926D20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ZFRO3RhADYIeDpbw4dnAWyjVt7yzrlI/aPmG+9d8qeE=; b=nQsSvcbt4EoSYp
	g2lqr69qyBEtYHLgwmHJ1em6WSyeuOpzKf/UtOWBCXimTRgzV14VC4tLWM8WsJj8mtjhHQE4FT4fN
	KbYNmAcHHbf9bd8eg+hXQxqPwH+Fj0NwtBLfiWLkWqmh8zoAxYG+kbFAyUcPr2qWhYddV7CkeQJPh
	a9qcTpgLuDR+Nwr88CQmsUOSB823JO46uZ/X2PG001noAFtd78EVmxy5R0godosKFrXZcWT5dB/Sk
	jPzzEbG1jLO9v/EOIEnr9l7jw2iNTgIX3UgmThc7nB2grirfDF+Ko/I4TG14tl9lvowxLk5W0YFU0
	6dkudedVJqdeXN0dcCiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVhHW-0003f2-UJ; Mon, 04 May 2020 20:01:38 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVhHR-0003T2-28
 for linux-riscv@lists.infradead.org; Mon, 04 May 2020 20:01:35 +0000
Received: by mail-pl1-x641.google.com with SMTP id h11so201404plr.11
 for <linux-riscv@lists.infradead.org>; Mon, 04 May 2020 13:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ZFRO3RhADYIeDpbw4dnAWyjVt7yzrlI/aPmG+9d8qeE=;
 b=qrHszcJGGSIsCedROR57TweuB7bX5mbZsxDa1hb+YaSY5m/twRdgsGDaKjFpj1FT4N
 V3ECCU3uh6lis3rOAqcfqTQFIoLtc4zGPki5ISHQzFRgDjGkRwdfSu8CkSBUiSKcJgiN
 NM4EF5poDdfcNB/62wYhnyLMSNCzCJpcWte6mNPF9NsqMNcZhm0uMDZQWCgNOYDo1Ohu
 GlAjPDD1qGAC1SHA99cElOMjxrhYtOKW+YnG3vVMHZXdgDCy9UwHxWSNR0bKV3na+jYG
 eJUzGB70l7kBEHhrWRgbWMAsO+hihmceg9Zo2H2vXXs0My0GoiqKsOph6Z3gBJZL0qwe
 pXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ZFRO3RhADYIeDpbw4dnAWyjVt7yzrlI/aPmG+9d8qeE=;
 b=XcqfTwVpxwZhfaVpd38FWqDzKffePZHPfRakGsxj+5PFYBW/JiVERUYND0dp0hliMu
 YVVz1H+10/HO2ToGEmVe7aEHf63au4GhZNUWVx/lOiTDJy8aHr5UZoB91BOfgROn3IqW
 24yXQvKKdretBWvQCav2ZWXZL/8GVi4Ln6xEEgeWqgz8ZfFXknmMCUehUjXH1PqYhdpf
 ypl+7bThRy9pG9JaqGGtMFoNGjYkhtw5TLBl6xzmJPyC1WsZHhglvGuk3y6bPaidUAf3
 mZu+ZncAQfBZoZhSnJnPHsMeqcpg1Alg4qf0YnCEXgDNX2G4OIVhBzLoo9fPyKt9OnYc
 nfOA==
X-Gm-Message-State: AGi0PuZClmyBOLnKvVE8qX53xvbMYot9ka+4m7aj92eXvctffP5BTNAE
 Y+aP3GbXDqrOmOcl6UUok0t7hw==
X-Google-Smtp-Source: APiQypIFC8V36B+W7lp+3i/NHiQ8u4AgxMSexVW/Rp60TpLxCPv8LY5YL73POlfEskWD07QJhyN/kQ==
X-Received: by 2002:a17:902:8497:: with SMTP id
 c23mr868287plo.335.1588622488940; 
 Mon, 04 May 2020 13:01:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id p189sm9716682pfp.135.2020.05.04.13.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 13:01:28 -0700 (PDT)
Date: Mon, 04 May 2020 13:01:28 -0700 (PDT)
X-Google-Original-Date: Mon, 04 May 2020 13:01:06 PDT (-0700)
Subject: Re: [PATCH 0/3] RISC-V KVM preparation
In-Reply-To: <20200424045928.79324-1-anup.patel@wdc.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-be6b9ad5-d81c-4ae1-9eed-9b2d63600b37@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_130133_161653_CEBBCE26 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, kvm@vger.kernel.org, anup@brainfault.org,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 pbonzini@redhat.com, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Apr 2020 21:59:25 PDT (-0700), Anup Patel wrote:
> This patch series is factored-out from the KVM RISC-V v11 series and is
> based upon Linux-5.7-rc2.
>
> These patches are mostly preparatory changes in Linux RISC-V kernel which
> we require for KVM RISC-V implementation. Also, most of these patches are
> already reviewed as part of original KVM RISC-V series.
>
> Anup Patel (3):
>   RISC-V: Export riscv_cpuid_to_hartid_mask() API
>   RISC-V: Add bitmap reprensenting ISA features common across CPUs
>   RISC-V: Remove N-extension related defines
>
>  arch/riscv/include/asm/csr.h   |  3 --
>  arch/riscv/include/asm/hwcap.h | 22 +++++++++
>  arch/riscv/kernel/cpufeature.c | 83 ++++++++++++++++++++++++++++++++--
>  arch/riscv/kernel/smp.c        |  2 +
>  4 files changed, 104 insertions(+), 6 deletions(-)

These are on fixes.

