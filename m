Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF63DCAC5A8
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 15:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:To:From:
	Subject:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WaflqyFcuRiiIhjplj5OLYAeNvXJXLxSFqea2tKukcs=; b=LdmwgvZmLPZi+U
	POW4bxL81y/pr032FNKA9B8L3Sj5zZ96Q/ApGDMAg3OEc/J98NAoL9NWNJZgswcNicDIGKLFVggTy
	FzRM6YT/tTIyr2Tv2/fOH91K+F8HhywH3zzyXFX+LlZoEW0oR+++FQSzh8xtqYyalEmlo5PDj5aXB
	mjbSdmxmxDLR6ov4ehizAl2IsO81fOODZQj8Jh10iKZg/LUZlvpJfrnbc1B+pNW5L/kMNHMI+uqXx
	jee6vt/95J+tN+ZQvJb/iahMy0MrnJtLJ+s3KRZwp/aKk/nWk8Ueng43Okkr3t1ZzVgjkl1egFM6a
	GvA6+qHYhtsiP6325S9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdVw-00000003RLr-3gAp;
	Fri, 19 Sep 2025 15:59:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdVr-00000003RGb-1659
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 15:59:09 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-244580523a0so25357985ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1758297546; x=1758902346; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgJHB0f2ZN3bUarxuGAa6kT4dSp6f27kYDaIU7kYRH0=;
        b=i3DOwDCVUhMAartmltaPelqsn9/2s/TPfDME3lboWh3fPkB6ikndrmEzdEwWLgTdaY
         cAlij/dWlYWa16brYafSbR3F3aBhT0sbZl+/it9JtFIz3VFjQgrqB2xSWYmYxttcG96p
         XBjFBgzytGSEvtm98oxsrVzLZrYZD1hk+MIr9riizUwzIu2L68fDCRs6Lz4L8slvvn/k
         N1o1zHtjv1FTDExFetzqsaeFx8sqFueAPfbLoOkaFzNQ5JNGzaJTvFwLLZSwAOognjIX
         DWQW1vIeFIiJ3yOiMOiNnBlimdGlY33mWwwAcmu//4CJ6bVQKpYQIS/wq2iQSfxcHnq9
         MzMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297546; x=1758902346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CgJHB0f2ZN3bUarxuGAa6kT4dSp6f27kYDaIU7kYRH0=;
        b=Y1XrJgAhzBvbuJ2KGWaUuMXaVvkS+3lVy4Y+h8VkxvWGv6XYcjQw6wy4uTxEoNhg3J
         DTwfPGRnpKkCuu4v3t+VJ+aA8HNX3H1rY7BpwRQZ4L/ZaXcKyKAlexXS4LzBmP+JA3gn
         b1qx5IwZHgF4faK95R7OLMWgDywYGfyMtcZroVZ66YdoiPv3AJdacm28BiNG3cVvxkpB
         T5GrjYjKaIf4L6zSBtZqq9oty5ZhiZmtGQICsQ/s+T6P3uklYjyC6r+cSgg9SDfVdLFf
         gbqNU20aLBMs++Ku8a4N8THnYkuQUpp+wn3yNzn//5sT3DIrL3dANPZ0fo6zB8Undz0I
         Ii/g==
X-Forwarded-Encrypted: i=1; AJvYcCVOhTgTRpq/gTvbuF4hQet6ZWpDdNmyro81Ru5OHEPywR3wwyV789Rs906lMpwwNSovjCR4xtaMg1zJWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHyZxuSDJ2pw80q+uyla+5IQ7M+b/BPc20PPJeUHaz2GllJBxJ
	yKiRs/ZKAY/5fshFijC8pbj1/DUJPYMJnQfhw0rhS5sIwZSCyPaJMnydDAwyMTL67io=
X-Gm-Gg: ASbGncse3tH43rdnNHcSVb4md/HjgkwzPjW66DyPjPVS2XG5uAGbkhmlBfsgjaxKPPX
	arUyK2JYUZWOy2PHX2O1YLPjWPktx3y6InG4jwUlJpWpLtrcIJLzlqOiTz+5MJ7dsL9yyP6rKfv
	PntdhjHNpJsil+QXInYQ758CSIo4MIi53rWyAbx3iRkEVU87iMUn9cV3wNk55uuqTfBYH7Q2PQ1
	h8PycLHWXtnp7pQOxlc4EwSgVebopHo8nXeHP/Dfbki6Dg97zzNfvVquUGuHfvOQOhiUtqVH821
	TYW9MOIO0dEERKCEFVg/krFQ9zCrHpnfKbO2a2aEN5A/k7bSTuE3K7eZkjB0pz3ABdc0j//FiBL
	mqLUVWOHVqEriPLfu
X-Google-Smtp-Source: AGHT+IGNuQ5wFE2K6Nm8Kz3yDo5AYTJUE8K8r5l2u7bFKGNu09la1L/D3nVqxykUhB1AH+EfTslLDA==
X-Received: by 2002:a17:902:c94a:b0:269:ba77:4ec3 with SMTP id d9443c01a7336-269ba7755b3mr50030245ad.21.1758297546450;
        Fri, 19 Sep 2025 08:59:06 -0700 (PDT)
Received: from 166871acc15a ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306064afc2sm5800499a91.8.2025.09.19.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:59:05 -0700 (PDT)
MIME-Version: 1.0
Subject: [REGRESSION] riscv/for-next: (build) while in macro instantiation in
 arch/riscv/kernel/entry.o (arch/ri...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-riscv@lists.infradead.org
Date: Fri, 19 Sep 2025 15:59:04 -0000
Message-ID: <175829754399.237.5173912564335866295@166871acc15a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_085907_317531_608408C9 
X-CRM114-Status: UNSURE (   5.42  )
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
Reply-To: kernelci@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org





Hello,

New build issue found on riscv/for-next:

---
 while in macro instantiation in arch/riscv/kernel/entry.o (arch/riscv/kernel/entry.S) [logspec:kbuild,kbuild.compiler.note]
---

- dashboard: https://d.kernelci.org/i/maestro:4adda9bd89f93f21b8d87a69ffbf3044dd10a850
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
- commit HEAD:  a054965b36af884083add1a286cabf98caca549e



Log excerpt:
=====================================================
arch/riscv/kernel/entry.S:117:2: note: while in macro instantiation
 new_vmalloc_check
 ^
<instantiation>:56:26: error: unknown operand
 ALTERNATIVE("sfence.vma", "nop", 0, 86, 1)
                         ^
arch/riscv/kernel/entry.S:117:2: note: while in macro instantiation
 new_vmalloc_check
 ^
arch/riscv/kernel/entry.S:446:41: error: expected ')'
 ALTERNATIVE(".dword do_trap_insn_fault", ".dword sifive_cip_453_insn_fault_trp", 0x489, 0, 1)
                                        ^
arch/riscv/kernel/entry.S:446:41: error: unknown operand
 ALTERNATIVE(".dword do_trap_insn_fault", ".dword sifive_cip_453_insn_fault_trp", 0x489, 0, 1)
                                        ^
arch/riscv/kernel/entry.S:458:36: error: expected ')'
 ALTERNATIVE(".dword do_page_fault", ".dword sifive_cip_453_page_fault_trp", 0x489, 0, 1)
                                   ^
arch/riscv/kernel/entry.S:458:36: error: unknown operand
 ALTERNATIVE(".dword do_page_fault", ".dword sifive_cip_453_page_fault_trp", 0x489, 0, 1)
                                   ^

=====================================================


# Builds where the incident occurred:

## defconfig+CONFIG_SMP=n on (riscv):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68cd6d0875b320799d2ffc5d


#kernelci issue maestro:4adda9bd89f93f21b8d87a69ffbf3044dd10a850

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
