Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D327FC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 12:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gMi978XrRxsmn7Um0IPQykhbIFdt1vIAp/ixPCzYe84=; b=CKroEkWr9b0/oW
	Vs9+uOtBh5CsHAUDaw/i+5Mi/wtuVX1lch5TmHywgUqJBCXMeuWBq6Q1Uxaz864NeLIwFUj2urBnI
	2ZJt7E1ms2wAaBDAtTPob6O1rFW/WHGYM2ug0MN4ZCMfsgvCIionQydSBKD3XWIMv+vTfov/c0UM9
	kawnoy7TF11rNBLjacadHbK254M7JIvr2Jvnq+6FGmiQwu0QcTQkjOS7zmP1AIOzUYLYTps80XUJH
	Qm3AJr3GoFyPybrwu2oKpTvySqYzaKuzaYmlahg7/MvKYERpQ6q+hPo+JZ4NoYI8I+Of2yU1g25bG
	ottZTIyqtJxoNqeqMESA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd0w-00000006wCS-1vi8;
	Fri, 03 Jul 2026 12:29:02 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd0t-00000006wBh-10TE
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 12:29:00 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8471013fac2so458896b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2026 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1783081738; x=1783686538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3xWVG/3qQZSSCl9XZAnFe0CG/d9wAGXcusZYIWuv8No=;
        b=b93pCgUy3EsD0Rhu0EZ+D1VUbWZLnKrUNB58lgAl1Bv0xo9OGoU+TXRZ6BOp/qvwTL
         dxwQESaCL8ClOS5Qu1D/RtpcSjvMPqEWEMWJ+4TqXu7NwGlyIgIV8KQLk5m9q20vGtpa
         h5c50WEojkjKz6Yd3OGIaU2i6pt6fWFts5SDmLzltRNzafhT9EF8mNwkdbrwpOZIcpje
         fAFmbmGf877/qxfLLiexRGDOfT9Eh/+bdSJHU7MSAr+1HkXPtfU6VV+3+wTqBiiaxzzb
         laWPmupcWvU+ihviFTNw1hQJW41YAbIwWqkAqDp0SKgKB1fBw7Aon2zvT27/Zentityj
         3NTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783081738; x=1783686538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xWVG/3qQZSSCl9XZAnFe0CG/d9wAGXcusZYIWuv8No=;
        b=EmWnBEaU4eGbobSfdewAtvcktXmJRhFB2dn+sRgQs9J0KniPeXiR1mtFpSTwDRJwt8
         C6V3nuCK2VPVLH9Sqa3BlMOxfbpKZjeipgbjkjsaGQqahJHWINodDPSJB2pYz3vCttl3
         5zBnhr/iLIRyEnKADjUf8GEJ9J4Wq0NJLLqqPgHsV+IOJvPYvW/rECWZ2fP993P5O6Tk
         1M8uSG0/ELCxSZtxgR6wVC97vQvcGLPzkcSk25wW+MWZ8OGG57UOBXVX3Yqx2WvmyHjM
         dJDueeSI0Gmxme2KZmkYn7ki+iHzgtac6bJH25bIOc/FhTTV1is0oIJm1VZlCZwLSqKV
         6bLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqk7p6KUVTp3QOOotXyGNGqGru41aQRjkx0ix/yxZ3F22LzZg5dXpGI+RN6x5Gpg61kg/Ya/iO/d2BJDw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm53AGETIOm1Z0ijZTaUJ5ai+Al4sCOq0vh6UosTyyYflyQQka
	31erd/lzlQCqwGeQQBP2XYPOgNCIHK8YrRpcNo49FciUJcIkVmHAyM9iS6GPBqlt98o=
X-Gm-Gg: AfdE7cnzIldANeeOIbgJPL4HAxVu1G4H8hMqdZNG9ar9DHa5Y/4junp3MH+qsFfA+7P
	+beO6Re90I5IgZOI/fgRfa0YveHHLsy38+0RY2MMbieapcPFQiMvbiFWUtttcp7KuPdrPsEbmk0
	0BxbCTUZ5hoj+UoRdkKHnsXwCvdPj8261hq5Q+Vxc3KILp1YB5vQencEjothLkUQnivG7qUTD5j
	4E1JScL6OY5487Z0L7k5DxLgZBF1M1DvKWZqT5Vluq4QuejKarH02e/xK96bL0LXpEa/azyvBg9
	gCclxvT+em1wu572SbotkCR9x7EYxufN/bgmNF9fDzC3YXO4zYmPXRcQ7R4C138nsA+9hCNkt8Y
	uTUtB6O2kRhYponcOAtCvE7Yk2mQVXem09l9PrWUa5D5eqsxn3gmxttRACuJRxu1cpAdH+ldV7g
	ggF2CTevJy45MMexL6/dad74KFsNAbP9JHONgjhY2nNNwKXc4FR2+sgUBKu7MERg==
X-Received: by 2002:a05:6a00:18a7:b0:847:8b0f:2508 with SMTP id d2e1a72fcca58-847c0686cc3mr10380342b3a.13.1783081738170;
        Fri, 03 Jul 2026 05:28:58 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.224])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f3d74ccsm2705551a12.9.2026.07.03.05.28.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jul 2026 05:28:56 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v8 0/3] riscv: fix PIO helpers and add optimized percpu ops
Date: Fri,  3 Jul 2026 20:28:29 +0800
Message-Id: <20260703122832.15984-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_052859_282925_6841C9CA 
X-CRM114-Status: UNSURE (   7.78  )
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

Changes in v8:
- Fold the TASK_TI_CPU_NUM cleanup into patch 3.
- Pick up Arnd's Reviewed-by tag for patch 1.

Changes in v7:
- Rename the internal AND helpers for consistency.
- Undefine internal percpu helper macros before including asm-generic/percpu.h.

Changes in v6:
- Keep the RISC-V PIO fix local by directly guarding ins*/outs* helpers.
- Add the missing asm/cmpxchg.h include and clean up LR/SC fallback naming.

Changes in v5:
- Drop the generic HAS_IOPORT_MAP/ioport_map changes.
- Fix 8/16-bit LR/SC fallback masking and constraints.
- Initialize secondary idle task pcpu_offset before CPU bringup.

Changes in v4:
- Rework the series into the current PIO helper fix, percpu.h, and
  thread_info pcpu_offset layout.
- Keep the generic pci_iounmap() behavior intact.

Changes in v3:
- Fix this_cpu_cmpxchg128() build issues when cmpxchg128 is unavailable.
- Fix sparse warnings.

Changes in v2:
- Add non-Zabha percpu add/and/or support.
- Add the thread_info pcpu_offset optimization.

Changes in v1:
- Initial RISC-V percpu.h series using optimized native-width percpu ops.

Yunhui Cui (3):
  riscv: io: avoid null-pointer arithmetic in PIO helpers
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/io.h          |   8 +
 arch/riscv/include/asm/percpu.h      | 300 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   2 +-
 arch/riscv/kernel/smpboot.c          |   8 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 8 files changed, 329 insertions(+), 15 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h


base-commit: 7de6ae9e12207ec146f2f3f1e58d1a99317e88bc
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
