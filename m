Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28DAC021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1sB9NoEnaXFlqSbjwN8PEjwVOEcNVzYfXNu8lEWcm3M=; b=BUq5L7tkEn6UJC
	I4M8YePWy4NrulGrymAN6Pp7g+QGyVAPzv1F6zowKcxNgOmpL0SVyyjXPEhah59wZtikxyRYfyHhh
	e50D0GFlEy+cGnLzHHLJn3I8PcihbOUBFD/wYngfqw4aKeftQPKiLpx5D0gk9i9cjwF/sXIoJluWW
	IGr0hl+tWQIuEvByYQetrzfsU2jYqPWjCWbMrxa+M/Hhs2vVSB8zthPSlPjp7uiacsGc4IxTlJIda
	boP/gukVwgDEzvasUutWThqUOnBSVVtENPQ+umyk/LrvoC9tgUyDtZJRtPcn11yDHK/c8WXDl4CD5
	ezUBDsQCivhYFwPoIxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6e-00000004ZYe-1vzb;
	Tue, 04 Mar 2025 12:10:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQwb-00000004V62-2UiT
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 12:00:18 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43bc6a6aaf7so14938025e9.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 04:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089616; x=1741694416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NB210ZztxQ2LtczNET1K44yOz6rQJqr3jB3V+b0mE4A=;
        b=k4uoE0nMNt8ovzRsmG7829Z+nu7Q03C1LRLZiJp7ck/VDXXVPIGBX6iwDtsEheroyZ
         7qY3fH7Yp0x45bCPAKTkR7r6hLaJhWmK2s3rgZjEWpHe/IKqXq5lu+vZHO9uLNBahObX
         vaVok4Mt9bfhZHVqNLchBwCXuuBl+m7bk37vzjKDIpOEsNq4u8NTniL31K9xlWgPv4fd
         fXX4xokFYL1od51nN8ChNGfpVjTc/79+SZjwxLnAs5obeNSf8h+fjEyXejJKDHmGH7Q6
         8AJOks1j58BqLZzoSRrl38WY/8ElCfSrukFnXzkI/ddrLQy+miLyo6lj7keroGJFP5DH
         KYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089616; x=1741694416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NB210ZztxQ2LtczNET1K44yOz6rQJqr3jB3V+b0mE4A=;
        b=JQ8d9DcHk8WnubP4pJW2T2bO9BgY2W4GUw3Egey9vAGZXzSQ/cZsCA/OwxorEVCg07
         n+DFEtPBjpDuowkZdzZ2hPG12gcAkLOnjEb3HYo/Xjd2eIfwcX/LF4FerEHrW79U29Di
         Qte57KcElf3a+drq3ZXoRlqXM0UpH9Ffb/XdJj079nUSQx7frK6N+8rxqRAyKf10CSx6
         AVse4l3PNHBqDflcHIR4mOAHs5nw2+wyjLlzUAYfBsBTerFlZKTndU/9+oqlwHz5wJiY
         FOB2NfbPSU+5Nw6y7Q3C/eR0/60uNItzpBQ4gMFxjRmkdlxJyBvNQ1NUq9Ti5l+S5ZG5
         htaA==
X-Gm-Message-State: AOJu0YzofT5sO8monqTOh4Ned7zFMuuYXebsU3w67LPTYKgbvou9bg+c
	3GnjoX/TE2Hp5+CbuiHJmr8Dg0ltAoibnLaT2pfgglMVsIgryWP/bGaUMcyvdfPDekSwoY8D3pb
	q
X-Gm-Gg: ASbGnct1pp9o4UMVVdupLStZWPyMTB4iGDS1zCf49PCZZ1j7BLXsYisDPkHmj8AkuIQ
	6jpz7Ez4bb8tz7BaYnjhhk7Z1e3MqdIyOew5JwFEQ4zNJrxhjeb9cjxlHG3VoqDlquPXVKaAsFy
	hrLLoT2+olXbzbb+uorcBeeKRJTID2rdFPSOa/bNA0MIr8/D+1b7L3Lr0h0PCg4KhKKbsgby6fT
	2Hb0/PAck8GcXE8WJCrELGWU5JR1a/0WocG/LOAp5i9UfZLiCEe8chQRxzRscDCwzLCCwgWEa1Q
	Xuoe9VUxqWqSToZuxf1SgpO68UVvpAlp
X-Google-Smtp-Source: AGHT+IE28Ld4ZbsEY6m2165jne/c4f8G51MRYc/QAM+rC+BPf+C5KmQYo2vTrDADjsSOJ3h4TGPaEw==
X-Received: by 2002:a05:600c:4f95:b0:43b:cf9c:6ffc with SMTP id 5b1f17b1804b1-43bcf9c7b45mr3677925e9.12.1741089615752;
        Tue, 04 Mar 2025 04:00:15 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b737043aasm192879455e9.14.2025.03.04.04.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:15 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net
Subject: [PATCH v3 0/8] riscv: Unaligned access speed probing fixes and skipping
Date: Tue,  4 Mar 2025 13:00:15 +0100
Message-ID: <20250304120014.143628-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040017_637797_9F116943 
X-CRM114-Status: GOOD (  16.17  )
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

The first six patches of this series are fixes and cleanups of the
unaligned access speed probing code. The next patch introduces a
kernel command line option that allows the probing to be skipped.
This command line option is a different approach than Jesse's [1].
[1] takes a cpu-list for a particular speed, supporting heterogeneous
platforms. With this approach, the kernel command line should only
be used for homogeneous platforms. [1] also only allowed 'fast' and
'slow' to be selected. This parameter also supports 'unsupported',
which could be useful for testing code paths gated on that. The final
patch adds the documentation.

(I'd be happy to split the fixes from the new skip support if we want to
discuss the skip support independently, but I want to base on the fixes
and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
or not at the moment, so I'm just posting together for now in order to
be able to check for my patchwork green lights!)

[1] https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/

Thanks,
drew

---
v3:
 - Fix compile when RISCV_PROBE_UNALIGNED_ACCESS is not selected

v2:
 - Change to command line option from table


Andrew Jones (8):
  riscv: Annotate unaligned access init functions
  riscv: Fix riscv_online_cpu_vec
  riscv: Fix check_unaligned_access_all_cpus
  riscv: Change check_unaligned_access_speed_all_cpus to void
  riscv: Fix set up of cpu hotplug callbacks
  riscv: Fix set up of vector cpu hotplug callback
  riscv: Add parameter for skipping access speed tests
  Documentation/kernel-parameters: Add riscv unaligned speed parameters

 .../admin-guide/kernel-parameters.txt         |  16 ++
 arch/riscv/include/asm/cpufeature.h           |   4 +-
 arch/riscv/kernel/traps_misaligned.c          |  14 +-
 arch/riscv/kernel/unaligned_access_speed.c    | 237 +++++++++++-------
 4 files changed, 168 insertions(+), 103 deletions(-)

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
