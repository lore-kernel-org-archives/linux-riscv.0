Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428F9FF885A
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 06:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bNYlej4e3Gjc0FQWKUI94G95muxuFTix79am1vN7mws=; b=OXNwM5cRnD7BZJ
	QvmVWQ16jJeOglh+ocs+Tj4eS2rfHubKud1hdzq06SKcO+q95evAIsHLEw36+PkjA3thWxy9sV1EJ
	hDaXCGPsLklxtfE8J5udYQfgmstLMsvr6FmJmPiNbJ74DXLatzYk4nFPvZK0azpz5hcTKcdYyY48M
	g1tINDL0CHPYhALdFhDAOLSqCFQnwCGJo7Fxmbd0SoakVCYn2dCMdLCM3L2xbjy3NA6tA4hx2DcGo
	rXMP3kHVIse6ubdal9f4XIBbf+yCZiuQpY2pW4yPCtDtiV5Rf2hDp9DZIUUetwQWkprEd8K5M/GLc
	1F1xY+CfqEP1g3IQujSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK99N-0000000FH3o-3HMK;
	Tue, 05 May 2026 06:20:57 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK99K-0000000FH38-2rby
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 06:20:56 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8296d553142so3676186b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 May 2026 23:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777962053; x=1778566853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IABxPdOKi9qQ0ncIcorYGTDUXVbyRSpLw0RRqytGSAg=;
        b=gRA7+U7jV7r0I63vWId1fkBD7Bcj0I4utf7eev7PjaxLsL08CIspWJqBEr+eH04zns
         BnDU5YKzm1NP4FmHRuKqmupql6g0cZ0lQC6WXpqkASjwnLiTMSOD2LWLwVRmnczLemI4
         VLBtQrXtkvvTDGthElYVlvpEpTokjKQ7z3DVTrnEbgp944n1szmKeQsGxjb7Q1xxNqAn
         cjxKHTYE603y8iYrD04SwTt6PYAXGjesmL4XVVKAnFLkmIdVuSQOCI6zfj1C4uVpYVHD
         3ghN050rSE585H1cG6LMCoEAUskNxDi5DuHnEe5mjzhVXVCJq8G3v+e9X5W069rWnC5y
         5Npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777962053; x=1778566853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IABxPdOKi9qQ0ncIcorYGTDUXVbyRSpLw0RRqytGSAg=;
        b=eB5ddy6Z73IBovTj7LwPy3q88id33yNgiD8kERaVGYHMAfcvjqDtH8nSGUL+D0b67b
         2RAZ8lTZ26TJHBlCJp4S8aeQNpEJBj69fBI/dDpI3obnhHLu31aXJDKOE54ixzuExJWc
         kZogXUWgs2a2ZzMZ8D4XWP7Jch25f6tAlkVuN3f/3stRNwtu3JsGD1saqkSqtZ+tTPWV
         XjdnjWm1NYK2z018Qc3ezKVHAg2z0QVd1JlntLDJPO6eLIjDSMEscCJ46SgcMz/1tlGZ
         s23YGY6Jvg0l4bkcDAVV7ehKc4iCuNUx+mp1Wj4Mydtw/e6v8uIX12NrsQRZZvZUGALV
         ulvg==
X-Forwarded-Encrypted: i=1; AFNElJ/RuTmNiK4ylwrwzNSHMAv149u8swHsTrhw/mC36y8xo0Fs3y2SVwZgp3f0IXcvYddkVdhh3zkOwA20Xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaSMlnrlvgSDSArGNtCPfBRn6mjbjU/hjwNCL5i0U1qPOa8G3E
	QJM9wohTLwbZkQMLGsFroNdOXiHcjJHELnlrrM217ojN3s5angezAlEXFLqlR1d1wMo=
X-Gm-Gg: AeBDieuVgBeQWDTX7T2keeBKgOSm17Qh8dWTQuvSp96D/zau16gjAq63EKa1+PuxS4j
	cTE8mIpCGVfos40wrI8Aulb2PDxbFJlRfoQxAIgxqvgKwv8LZ8u1tKSK+sHPH/R1snWE43zaqVT
	ZB+1GIDbV6ML63hSNR0k/xCxjHzjguU2HYg9Bqbb3J4HxXys0xOSZuBkDhBNpV+HGqSvd0NKDS0
	XEv1f9xs6AU4YIRxVI7H5F7U5eAwAbt/GOOureuIH7+QuhjchDak901xb92Bayws6e3Y219E7Qg
	uDj4eiLfJc/g0pm6teCFSNOOTLKroyU5DqsuTWBJoIqrwrAErsIZ1AmZ1/R0MHyJOMtfJo887Jr
	HuTuUfyNb5MkPJ8BjLwqr+hCLaQknQQ4tbg0kgyOGhmRXBOogw/koSDNVnRjxYK6ld2K2S+lURb
	+wk7R5YlpwBQh7w4merUs0x5l4N4yACS1F/xElPG4hB5LCU3PGgXD2NFZz6ow3VNjk
X-Received: by 2002:a05:6a00:c8c:b0:838:3f54:a0ee with SMTP id d2e1a72fcca58-8383f54a1aamr5208071b3a.7.1777962052522;
        Mon, 04 May 2026 23:20:52 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c10sm880738b3a.37.2026.05.04.23.20.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 May 2026 23:20:52 -0700 (PDT)
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
Subject: [PATCH v4 0/3] riscv: improve percpu helpers and PIO mapping
Date: Tue,  5 May 2026 14:20:23 +0800
Message-Id: <20260505062026.91724-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_232055_071485_5DB7A547 
X-CRM114-Status: UNSURE (   8.93  )
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

This series makes three small RISC-V cleanups and fixes around percpu access
and PIO helper handling.

This work is motivated in part by build reports from lkp and by follow-up
review/discussion around the percpu access rework:

https://lore.kernel.org/all/202512202218.FI6bB5kV-lkp@intel.com/
https://lore.kernel.org/all/202512210052.w0bpUAAO-lkp@intel.com/

1. Avoid forming invalid PIO address expressions when I/O port support is not
enabled, while keeping the generic pci_iounmap() behavior intact.

2. Introduce arch/riscv/include/asm/percpu.h with RISC-V-specific percpu
helpers, including the fix for the 8/16-bit add_return LR/SC fallback.

3. Cache the percpu offset in thread_info so percpu accesses can use it
directly across the relevant RISC-V paths.

Yunhui Cui (3):
  riscv: io: avoid null-pointer arithmetic in PIO helpers
  riscv: introduce percpu.h into include/asm
  riscv: store percpu offset into thread_info

 arch/riscv/include/asm/asm.h         |   6 +-
 arch/riscv/include/asm/io.h          |  26 ++-
 arch/riscv/include/asm/percpu.h      | 284 +++++++++++++++++++++++++++
 arch/riscv/include/asm/switch_to.h   |   8 +
 arch/riscv/include/asm/thread_info.h |   3 +-
 arch/riscv/kernel/asm-offsets.c      |   1 +
 arch/riscv/kernel/smpboot.c          |   7 +
 arch/riscv/net/bpf_jit_comp64.c      |   9 +-
 include/asm-generic/io.h             |   4 +
 9 files changed, 326 insertions(+), 22 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
