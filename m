Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C031F606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eO2iS5RP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gXjIpAXR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ClfKNqX1JyROoQtI499HnnUFsnGxNH7KDlxQjheFwU8=; b=eO2iS5RPdUPZ1/8Xj0buj6vO3I
	DAjpACY4+gfRiMEUgOiV6/UmoWjfLucd9TRoVBaRK6/AGOACQ0sk6pSG6/A5u4eTvN1eqW1cyMgva
	3SXzlOTAZx3DhtBGaJbID5JxjVEBFK2DImdDpNIJcn7ivo5LFaAOd72jeQCe+K27Btak1FZELEhIq
	evwIAQJFvfWSpKnD8/nBsQzPVF1LSVqjR07yOc1uWNnpS2r6ypyPyDL39eFVUl9prHdE4ubXiktgr
	nF7JDt1o5wr+/9U081/TRd2JITSSyehYDv1P3fud+KcgvJjM0DzeU+m2V2JrWK9Jkp6d6uwrTmZ36
	rEapI5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0ip-0000000G1pz-1mEb;
	Sun, 08 Nov 2026 11:06:03 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0im-0000000G1ov-1qgV
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 11:06:01 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cd69954c755so4472a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 03:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794135959; x=1794740759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=gXjIpAXRVwWrSFKkyQzls9cEO2kcI1oWe0kSgNbe9D5I24WUvdXo0kq2Ne3goBBA9D
         vr+8r2aV13S9a3+EBHLm8moNj4vYxUv7QVQwRh0lXG6tLMWQmvlgQ5vktSUJuWnnNnP5
         g8lqSssrFIg1EnZ3N+FNNaM5UxspA6mxBnKX/0TNA5RCfClBZ4r5yvF5UAy+hMgboWdZ
         o34pcA/aa/varx7AfckmUD+87vYF71boT50DLZX2Gxm29U0TruUiZrh1cMN5wAn7S7qq
         K3WiIiSCmCQ5YTPiqqOenO0TeOmGjXJSGo/qecRw27WLiC91hXJSSS1yhMNtWZmd+XIb
         B/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794135959; x=1794740759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XnCYVNofTC0C6ktldCAu6GTGzm+Q8FA6+tvEuphsY/w=;
        b=OzjaRmqgsPFuLPXWA8b0Z1Hkhp8rHKmaMzIAuM8LTK0EUzbuhljIXJ8tFy5vEP1h3O
         aG5CqxtRXTUDtN82eoVNCjZbQOBVtZSzEr/IY4g1PEmf80Hh54dWLdjttP3CQchSFtuA
         BPYaFFOU7VNWGoKxHEmv7MUmSWOU3eMB828xLOO8LWe5xuKpGh7TRcoKDpEFQ2cqUdb3
         pim/PpfwXIhuiNwLFbuJaPSgBXcH2BcorxzZuHjcb3hb9C5V25/SqQNjuF7Nd7uTKdVm
         RL/EpRkSCno4c4Nlw6yOoDD/ahXvKMxlmyUokGj5oA7yMrse/C/ukyO+wQhFbAQFlye8
         3TGA==
X-Forwarded-Encrypted: i=1; AL+hErF6VcXchMbQLPgmv7lcCapfBa+qnXDKrWyPz/iXwskdB5vQZBUP7R3ljVMX8PWOSIbcBYyMRgdJkZNSww==@lists.infradead.org
X-Gm-Message-State: APuU4Z9o09qH5vLHY7DY0OzGc7C4UnaWhG0fVjcg/UgSn6eVg3xCk9cw
	W+s8Ik2GHlCKLzRURImbMTTtvcnVAHtsLGw7JNpATIVwNYj4pXfOEwlh0CpHshGAXKE=
X-Gm-Gg: AYBFou0vhjPRSBRSuFfWC+rTamFxf9KwJkF2dCoChtQFfcyTY+BfA9G23fuZhoBDMmN
	BX/o/1Iom/qNF0ysNNv29XCzOU8vnOALiRrHAcO8dH9V1AOA/wWt+ALV66SLKcrVjEr2IBMnLcP
	jc1yQv4amJz3HncNxI5clLV7EAuZ+P6XtUnW6C9BdPJaUAAHJTZzXsaLnyzgjAb4nj/Js6g1Ekh
	c116KOVcUDKA9Ijpz/wlZhiMHh4u4nruywqFpmUuHdeuOYcy+CYu4469vA/Cux0h1+I3G1oprWo
	uMNQcg0W+vteCu/DOoVv8J5DjqwFwAYhB1M0BLm8Wo26IdNqhfA6IvOpEDW9rseoHPlRcq2LWhY
	BR4VcuSHKdfNKD2V7W0tonEnOXxuwm9/IAkTzaKNj9YClpqBR/ESk/53YRZkYHx65lrEvAKZbSJ
	bpGf9Ps85hwKQww9EW8Xg3GPOKVClj4o61KJLI6wYO4N28ylZ3+4ng9jo2yrOWEj10juG9NrqzM
	ZwGEUp3xTnzyIZzgO9LMx8JmGhg64roGxt41GMoLc/IRAbJEC1XSxZ8QSmuXRc+r/Efljf3T2hk
	m1/vOb3phWPEXcDnwYSz8OdvG3kHhYRJN09OWYY51vjuuShcHfi9z3wS6M3aNkk=
X-Received: by 2002:a17:90b:3b8b:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b12d43f8c0mr1076560a91.48.1794135959430;
        Sun, 08 Nov 2026 03:05:59 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm2609818a91.6.2026.11.08.03.05.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 03:05:57 -0800 (PST)
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
	llvm@lists.linux.dev,
	dave@stgolabs.net,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	broonie@kernel.org,
	cuiyunhui@bytedance.com
Subject: [PATCH v9 3/3] riscv: select HAVE_CMPXCHG_LOCAL
Date: Sun,  8 Nov 2026 19:04:06 +0800
Message-Id: <20261108110406.97495-4-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261108110406.97495-1-cuiyunhui@bytedance.com>
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_030600_480307_8D40B293 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Now that RISC-V provides this_cpu_cmpxchg(), select
HAVE_CMPXCHG_LOCAL so mm/vmstat.c and lib/percpu_counter.c can use
this_cpu_try_cmpxchg() instead of serializing per-CPU counter updates
with local_irq_save() and local_irq_restore().

Suggested-by: Davidlohr Bueso <dave@stgolabs.net>
Link: https://lore.kernel.org/r/20260826010748.zphu3wh2hlm4t4o2@offworld
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bde1f1885038f..458ef01e926a4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -155,6 +155,7 @@ config RISCV
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_BUILDTIME_MCOUNT_SORT
+	select HAVE_CMPXCHG_LOCAL
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
