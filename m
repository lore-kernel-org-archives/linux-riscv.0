Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A080EC38A02
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 23:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bHbVrX35KG5U4u4ue4+lN138qTTICRIiOspaBeeIgHY=; b=Wep64IqxVVqX70
	ltSOadQ8HuXHwMFogF0Go50HAGFtiPakmch1Gfgu+Hs0yyc2nKaYc7X/wflEsamTgPBvgYdYCjnby
	FatdmNgmOQusAOwn9dyFJKXj0INhClY38UYDvPOWX8DQWwgOWOm6+WBFe+D+2IgD9I4EDMhcOMEv4
	LBhBctOOQbuF92bDcxDbufBkwWvh29O13hAq9SVSt7Oy1D4duc0W8FykBoJhhNJCIl1ofMQdNzaqB
	IxQgI5SUkGUu9fIZHIpCR8Z8c6n1M0wXoEVsILL67gh5jy3ReS8cGg5JRPmrIdEoE6sGNQH0c58Mz
	0DT6rdD2Pyy7QrTw2jog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooYdf-003EoY-Do; Fri, 28 Oct 2022 23:19:47 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooYdc-003En5-8E
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 23:19:46 +0000
Received: by mail-pg1-x52f.google.com with SMTP id g129so6065673pgc.7
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 16:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdbgZ8+Fu6n0HK4tgOaOYq43eN2AjNjj/Lhga+VAiyM=;
        b=aMw3oUjEz8KxyX5NRy8i43+HJNi8jXjsGtcRnti8nSdP4d/D/7x/NYETkIaL+23EEd
         37AA/MvumskK4g5anPHvbmKTEazSBxU8xWFpbfzNfVoHL8XP0rk5+6xe+EiYp19r4lgg
         3E2+1UsnCFUXhBv/6PElhfyEisP2ddRRJSTJQBGQiJch9HkvDg9XowGTYV86BxzccqYz
         woDM+lrq8UDV+DZZ021IjdtLqgVhH6v9U57om+imUTcuJkGHkuke/Q/IBc/q3cH2Vblp
         rbMzYHQKFrzrAiJ7g5Rku+VyVCcvidbHmCvRJM8e14ayWyUZFgykrPs9tabdGTJCZyeb
         IAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdbgZ8+Fu6n0HK4tgOaOYq43eN2AjNjj/Lhga+VAiyM=;
        b=RIVvLu2epGcrGmQE6bgDJV/PxLV/z+k4fXa0QzORjuDFp8DklIP080mcHYkNJyo390
         fzmJI7IkDzLGXWI6B60nJ1qoODUJLQsVQT+MGVGl9DnjbRBEMHk+HoZXqfcoknmcfiMB
         w7mIqQau/PdNPTDUo0GEZPf2TJrEQZY695/EV5v+NKwJ0rx11mPAGc6gK4y5p1mjuYlP
         zFZhJqRg9KmvECTznAqjwv4biM5O928Toad512/5HX5R8FfZlUefNQGWvVpwymkQdYhg
         yAKsN/qZcs8Z4HXxkZyzc/9eC/wiqQeME7UgWVNzoaZsynSfELm/HLgQXcjuPKis4THv
         eNCQ==
X-Gm-Message-State: ACrzQf3daaM2FFS8rG0EQKmNBaVDpWxqKu9Fb8SHn3Udgzyqk1fhj5V9
	gtw0pPy5pJGVd4+oOhYpjpMRag==
X-Google-Smtp-Source: AMsMyM7kBxRafshIfMOooOPKNBPhtCi9z2rUeho/arEVqJ9+3KvlGJVZHHufukrQPzCdagMN4rm8IQ==
X-Received: by 2002:a63:69c2:0:b0:46a:eeb1:e784 with SMTP id e185-20020a6369c2000000b0046aeeb1e784mr1617170pgc.589.1666999180528;
        Fri, 28 Oct 2022 16:19:40 -0700 (PDT)
Received: from rivos-atish.hq.rivosinc.com ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jb5-20020a170903258500b00176ea6ce0efsm1335plb.109.2022.10.28.16.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 16:19:40 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	devicetree@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] RISC-V: Do not issue remote fences until smp is available
Date: Fri, 28 Oct 2022 16:19:29 -0700
Message-Id: <20221028231929.347918-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_161944_327610_82904FA8 
X-CRM114-Status: GOOD (  10.71  )
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

It is useless to issue remote fences if there is a single core
available. It becomes a bottleneck for sbi based rfences where
we will be making those ECALLs for no reason. Early code patching
because of static calls end up in this path.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/mm/cacheflush.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index f10cb47eac3a..7fafc8c26505 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -19,6 +19,10 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
+	/* No need to issue remote fence if only 1 cpu is online */
+	if (num_online_cpus() == 1)
+		return;
+
 	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
