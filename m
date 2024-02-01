Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E747BC47DDB
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 06:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zKsHLyx8XDHc2SlahBzO+Kj+xyE8dWGDQV+jiTgdBzc=; b=nBfyKNQybFpQy/
	j0qVkcwMWP1E3IJ1aOAA4Indpm3Ro6SftPCpw0eIWTxD02+JyLEuRZznDRZDBA/u03Jzpsqnh1rag
	jupkyS3bTSzbKHhBHvS7xLdhMfgOtNbavQfJPbndLmnOm9IVP2+v+WFq1IM1NDlm2ma44DR5UrIom
	Yg2X+o5EfapfKHEZQ4F/x+qBgvUQsLAAUw+SebS22gzYDXzdMEktNFQH7T4o78kt4neiZ3ii5HDep
	WQAil7ODaiSotXG13/kZOZ0mnETAYgsDiGp+99zFvJUdkAEeKpAguvZ/GfCl31ZbwmSMO0hFkR1Gd
	/7zoIqOzYnSUfvMb5Rng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVQkj-00000006nTX-3GbI;
	Thu, 01 Feb 2024 06:40:49 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVQkh-00000006nR7-0bg3
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 06:40:48 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-59a29a93f38so270069eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 22:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706769645; x=1707374445; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WtAlb93cBUuGmYqswMaNz+Fctsrood/l670QzNltOB8=;
        b=c2A61E1JDjuqEx4eit3klPhjiyv+g5NPe7zssZbb3Gz1ThZ2HbB/hVg5MJZ+fiaJvG
         mGHwW4UbLEgWnw3kkLsk53wD5V5PJZyqx8bBVrwsGQWxn7p8nbz9p5uZ3dMQz1/MNYcm
         fN8/ovSYYxW18aXkXGVd6He/tMANmWreAdwzlWTcyHIChzzirCLhZDc/eoHUJtbRKaZ2
         ZwMW7XTmjt1ZYCPAPNcfGhlv2mfC/JWEJecGAIM6LXCUkvfeE4jqxgetZB7P7XkVxelT
         M5MJ4BpVrcHEw38teEZ6ZoAXD/bnkJluem/b387+OboJ3OgZA3bfmSrNu7wDimp/cj94
         ao7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706769645; x=1707374445;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtAlb93cBUuGmYqswMaNz+Fctsrood/l670QzNltOB8=;
        b=mneuhNhbhokuD7GzkjQiPkOKA4wN/j9WKZ7d2eyiRKqaAelDe5BTLtRaRon51XVuEz
         zmzpx8tpEz4/Oqp43TzHMQvLKD7b5tznmtyGTIqoaWzLlLY9E1RMggjhiI4PdvpXm7Mk
         Jjoa3K82XzfLK6gUkBzCFmgjWyWxSf5N3gnL4hiaW/DjbPalLZvu2NxwH+M4fiHWKzUZ
         bq2r6iyFZDz0qisgUQuXrOyCo9Nce+j9wtUSn57wfY7jNBx5KA2C6Pljf88dmlO+Um6k
         /2oL25DARNvpHqmBA7M8eUaTXZyWXII/kC3A+fYyKTLbt/M9L7GRybjzaUkyI6Qx4r64
         IVmA==
X-Gm-Message-State: AOJu0YzUCbaKrJmhTGEgXdKipoJjmSIVGEU87F/OwLDYlPn6DldtTa8v
	j9Wx0oL2B5cHy5hxzoImvmzuCAhQJdZQT4S41Op8V7ZvCsd1cksUVoYX/P0kYP4=
X-Google-Smtp-Source: AGHT+IGWuqFCnmYn/Enpi4Gj7UjtNzwB/7aM7UciT57NXsd6mW97qniSYk1sMlvGKTqf3at4rxGDxQ==
X-Received: by 2002:a05:6358:1901:b0:178:7556:11e6 with SMTP id w1-20020a056358190100b00178755611e6mr3582160rwm.27.1706769644871;
        Wed, 31 Jan 2024 22:40:44 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id y9-20020aa79e09000000b006ddc7af02c1sm10925764pfq.9.2024.01.31.22.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 22:40:44 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] riscv: Use CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS to
 set misaligned access speed
Date: Wed, 31 Jan 2024 22:40:21 -0800
Message-Id: <20240131-disable_misaligned_probe_config-v1-0-98d155e9cda8@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANU8u2UC/x2N0QqEIBQFfyXu8wqaRWy/EotYHu1Cq6EQQfTvS
 U/DvMxcVJAZhcbmooyDC6dYRX0aWlYbAwS76tTKtpNKK+G42HmD+VduHCKc2XOaYZYUPQchO21
 h9dD7r6Za2TM8n+9h+t33A0h4BwdxAAAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706769643; l=1017;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=0A0EZZ7L95Ss35itIndFIHG4J0n0kRMyQ0DhF7dwS5s=;
 b=SeGBVfFBkE4J7EYJovzsM69HMfy3aak+n9KCMy69XDFTQYJ7A+C6YXRsFT36I1J3p8NOCVMv5
 ak3R0x0n060C/9eGi+WkN7w7629bYXVojTs1C8/8+7zKwdX1PqCEdtQ
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_224047_227639_6B4604C9 
X-CRM114-Status: UNSURE (   6.82  )
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

If CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is enabled, no time needs to
be spent in the misaligned access speed probe. Disable the probe in this
case and set respective uses to "fast" misaligned accesses. On riscv,
this config is selected if RISCV_EFFICIENT_UNALIGNED_ACCESS is selected,
which is dependent on NONPORTABLE.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      riscv: lib: Introduce has_fast_misaligned_access function
      riscv: Disable misaligned access probe when CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS

 arch/riscv/include/asm/cpufeature.h  | 13 +++++++++++++
 arch/riscv/kernel/cpufeature.c       |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c      |  4 ++++
 arch/riscv/kernel/traps_misaligned.c |  4 ++++
 arch/riscv/lib/csum.c                |  5 +----
 5 files changed, 26 insertions(+), 4 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240131-disable_misaligned_probe_config-043aea375f93
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
