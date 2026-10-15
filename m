Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C2ECA9EDE
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 03:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O6tICoSaOo20iDiIq8eH19ntmxIe43KYDjC2juqtcPs=; b=Xwa3Zcl9jq1raf
	GCCIaWw2NbRM4vA7Vu25lgGTwoJkWH4HlmtXv86h5r5P2PJZdkX886AJc+aZrnOTiRdcXXBt6LxPu
	fewodKDeDV8/hFLqOGn1X8KsQKTUd22HnMyOSXKn0lKWXMWy1+XCqZP8pxIN20NZEXDg3BaSPltCs
	t3IrwWxofJgVpqqe7upRxf4/Xq+CBA2RV2NAxB+nuxTMg2V2Ae9byj/BLesgMSLxuIC8Lnoz02JLc
	zpoI1KR8aK0brSl8/bLQCmUROMC0T1qNSeJQ7AVMKTaA1QSNB1W0CY0q2cSl7KhRA0RoOAcypYUCO
	k8AnNy1CF1DVMSNqWVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCH9-0000000GkSN-3xli;
	Thu, 15 Oct 2026 03:37:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHCH6-0000000GkRd-0HFN
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 03:37:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a16c399641so46338655e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 20:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792035417; x=1792640217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pvsVhU4kPk1tZp2qz93jFIik1GpyvPqpcxvOW0J3Tx4=;
        b=EypqB/Dzx3L7lWxqerNP9pBzD5jEA8eETPZFP/n8RyU76kxR05j8nCH1u1r6gjxBHi
         0hYI7vaNpc6ftUBw7wUZCdWD84Li+5Y2RFGRdEddEyDVuJCe9w/JPtJqyaNZ0dVoYZC9
         dd+VmYrKozWn1xMqhU/dLEkmiMYHPKt5MsqvDSsXDM3Vk4AF01mJGiSyB9XHGsm1E56U
         lUzryx71lcqhD/IprRIVk2SoX8MVp/y2lkw9AwP3IL4o5BXtq5uTtJZ5t0e63wx5grHs
         q6GqSBgQygtv5nMfOmLynXraUAwUyCXXcTJCKS3OviK+vaqJoATo9gBVDbjnw391tfje
         G83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035417; x=1792640217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvsVhU4kPk1tZp2qz93jFIik1GpyvPqpcxvOW0J3Tx4=;
        b=J50hJWnbgDzd6YBmLstWHadb5p9ZI9On5QCTaahtiOPcXnA1jmuobl75GzmSV++Uni
         1OKyvtaLRz9qg77IaTCVwQRfPNNXPsn2WaOTiE0kUyyR/3Imi3cnDEnC+kE5CFk+tjei
         DsM3Ws5LaW9mfvqq38ller9OZAewi30B3Ky2BFq2C13Q9VVuBkvmgOOxgR0lc4qC4Ctm
         Eicq8Oe9lVjLGtcKJItv95Ze80AIpGFlPklaHY2fVGbX6uqDTXNffLuxlFdLExPu9ZF6
         N/8zLyjJC5gNNZ3OJHOcHzEDIZMSXCb+/dAZlOuLwu3eAzqKpHV9Lg3F+4fwrGJm47Ux
         boRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQ7qMrw7BfNIhUQkT3DtTG6+oKs/xaxbNxOpkP//NvkmEqRS2qO+ubEUpE2f4mQcKXW3aljYlvI18Yng==@lists.infradead.org
X-Gm-Message-State: AFq9FYLTvNc9DS5+QN6onMFXf4PS3vgRT0u/jXHFRQsNOr60hQsSoLG6
	7W36W5AlDmi9XiB0BJsN9RCuz189CN7Hvx+6ewcKT7UXSHm6wHB/x2zP
X-Gm-Gg: AYBFou2T4Z8HJYGP7avWIIDMV6NfRH3nHFpE64QVfYyC8s0xyGGSazkJNodT17UlH73
	cje5Zgb0V1raX+4YcPUSejf3prY4C8BD+CVOG9Eq9yG40vBWqSbyZPXUNwDW3hoxvMfEoNWLEJD
	e2zTIhKVCyn2zgmlcxkCTetzYosyeNff1IPcxUE/En4ru8YlL/ReV/Nih4g6O/mtuYYwfv/RxoC
	8BemFiRg2epKuFUJduBltQMwlcYZXj4dP0v5nLvQZCNeEoP2x8Vr3bnkZshzXSbje8vAGTcMHVO
	oNVKn4cni8YTTEbtNBFE3v48I5bS2NU8NGhuVKfaWSSX8mbVRbqYHJaO1UDiomegZOyKqB+Qw9g
	Cnuds9EAk2C+c/ae6IyKqE7Ir+lztQig1/AV9slINiiDQun/TaBrwzi9+d7t1Lt7mlzmOYyD1+1
	ou8DcjF62kyGAMVdAPxWIFkOny091LNAo9PWT/0kq1PfWxbJSmqyhzOfQdNpIkaLjzZSXuXcFqa
	MKNjbZevEAWHaUo2Pxgus/ELcL+T2FW7V2Bv36ndZGrKnJG5hyu6rX3dIqD7FStIWyOV4uFpUbT
	PIDVzNpfbWzc8YtYdCuZR/KAxc4chlntxxYg8NohBGxUGbrdLNlmiSCx8ocks4R26kSPZSdhHin
	W7uqk62mdtyER4jj+ng==
X-Received: by 2002:a05:600c:c3cc:10b0:4a1:a7f8:c12b with SMTP id 5b1f17b1804b1-4a1a7f8c219mr123205845e9.19.1792035417351;
        Wed, 14 Oct 2026 20:36:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aeb3-cd01-f139-812c-65df-b930.310.pool.telefonica.de. [2a02:3100:aeb3:cd01:f139:812c:65df:b930])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df5c3b89csm603500f8f.23.2026.10.14.20.36.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 20:36:56 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Mike Rapoport <rppt@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: Pre-allocate module page tables for execmem
Date: Thu, 15 Oct 2026 05:36:43 +0200
Message-Id: <20261015033643.84972-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_203700_122627_70F92C6F 
X-CRM114-Status: GOOD (  11.78  )
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

RV64 pre-allocates page-table levels for late kernel mappings. The module
range is guarded by CONFIG_MODULES, although execmem can use it without
modules.

With CONFIG_BPF_JIT=y and CONFIG_MODULES=n, execmem adds a mapping to
init_mm while the current process retains an empty PGD entry. Initializing
a BPF program pack then faults:

  Unable to handle kernel paging request ...
  [ffffffff78000000] pgd=0000000000000000
  ...
  bpf_jit_fill_hole_with_zero
  bpf_prog_pack_alloc

Use CONFIG_EXECMEM for the module-range pre-allocation, as powerpc does
for its execmem page-table setup. Both CONFIG_MODULES and CONFIG_BPF_JIT
select it.

Fixes: 2c9e5d4a0082 ("bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on a BeagleV Ahead with matched LLVM 18.1.3 builds based on
    v7.3-rc7:
    
    - unpatched: a native XDP attach triggered the Oops above
    - patched: native XDP attach and detach completed without an Oops

 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fb37b0b67efe..d92342c162e2 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1437,7 +1437,7 @@ static void __init preallocate_pgd_pages_range(unsigned long start, unsigned lon
 void __init pgtable_cache_init(void)
 {
 	preallocate_pgd_pages_range(VMALLOC_START, VMALLOC_END, "vmalloc");
-	if (IS_ENABLED(CONFIG_MODULES))
+	if (IS_ENABLED(CONFIG_EXECMEM))
 		preallocate_pgd_pages_range(MODULES_VADDR, MODULES_END, "bpf/modules");
 	if (IS_ENABLED(CONFIG_MEMORY_HOTPLUG)) {
 		preallocate_pgd_pages_range(VMEMMAP_START, VMEMMAP_END, "vmemmap");
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
