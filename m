Return-Path: <SRS0=vikP=Z7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC163C00454
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 17:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B00F120828
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 17:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SNJ45MAl";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7syrMdQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B00F120828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BNCw8ZLuRZFhPijRpMqXTUSJYcWT9YK5uJt+c/1wpxE=; b=SNJ45MAl3m6YRH
	kuhQpXHyLdMWjPOIkFNkDzv8SPMDnK0CslbQO8s0TaDGG4/FyJWiP01FPwXUhiLPzInEFbJ7mnUbj
	ZnpF4gitY+MuDMalAMzcb1qsoHpQRVTwK5Wa2CTwsup+lV2s3AnakYpVmS7bcup44C6KOLabfLDyF
	KByDzfw6sDoLue1X9LCcumzPOKKkKMKdvOVoit4WfyIRcR/zEmmtNOmPIGstaqGm49hXcplHK2BgM
	f2eMVnYrEowVG/+ZcGp/8wtPW9T0Bp+2iEiqzXcjbO5P6IsSGyvRB0dJLpEGyMFxauMwHSpzHp0eC
	jPJFjyo4fm55Mw8t5AHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieMtE-0004UE-P1; Mon, 09 Dec 2019 17:32:08 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieMt8-0004Mh-On
 for linux-riscv@lists.infradead.org; Mon, 09 Dec 2019 17:32:04 +0000
Received: by mail-pj1-x1042.google.com with SMTP id r67so6196310pjb.0
 for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2019 09:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BNCw8ZLuRZFhPijRpMqXTUSJYcWT9YK5uJt+c/1wpxE=;
 b=b7syrMdQLRdmJqKeslHa0OrbiFCOHk5VEYemE7weyZnuuaYVznuyKpmWFBR8lyo6kP
 yGmjhggOh9emFV8hukxxUpWO1eii90aRClJVfM7b+bwsZBAxhOekqV+ukncrnYvhLtXM
 pCvumWBiO2ELk58wvN8WvIMTYRvRWOvF7GZyuRDYJ5Clqxuyyn1B3JCD4t6XxmJHrR1r
 Fz26XQj+ini66Hogzfc9faAaols2T66ku7hzmKlr4OHhgfu714PHeP2dFh6e5wlblZ3r
 3e+yAs/fr3GQ5T0blwgwCAXTcETIIN3AHfPAqNQSVNCEk1FuZIk1YwLFzYD8KyLz7EEY
 9xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BNCw8ZLuRZFhPijRpMqXTUSJYcWT9YK5uJt+c/1wpxE=;
 b=VOfkS6ge6MbQzLHqrK7FbUhzwh2WRB/jHqjsbX1oc6T+K5Lb3tWbWG74rSWnm+AuCe
 /WiYUMb9GWx5vzgTmciFEysxj2pZDaXcIdYm+JtKyewDec15144vIpe2z4uepWb9rojx
 ubY97N/BuD6E6UjLmCtehTzWN+PmW0xhi8FLzBV52v3g9tQjC3jMxVPOreRrnHEmBMUK
 hTlLJmoypNXlYoM+5H4OoMg8wrKua/x7egPXEWPdRC3KvyW4YhGV26X8w+wjA0E01PUi
 bxQNb5u1udUs/8f3QOqtXAXAKqBpVQ/3UNlVBqMuP6s59kQU93KmwUIOQebZ+ogw1cPM
 Ue8Q==
X-Gm-Message-State: APjAAAW3qqKL3hkbW9w+Fbcd0jXCDZiIgTdRiFjKdGA1TNhoDdCHvJVS
 ySfb+Ezx10N5bqvVniGw+O8=
X-Google-Smtp-Source: APXvYqy9HFzdcebDinK4pQ1i8ARP6HChfcwpNNcw7Sjeo3SRHNx3mFUKRIy77RI0aIokZfEt2wuL+w==
X-Received: by 2002:a17:902:8a97:: with SMTP id
 p23mr30685730plo.233.1575912721683; 
 Mon, 09 Dec 2019 09:32:01 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([192.55.55.41])
 by smtp.gmail.com with ESMTPSA id d23sm54943pfo.176.2019.12.09.09.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 09:32:01 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: daniel@iogearbox.net,
	ast@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next 5/8] riscv,
 bpf: provide RISC-V specific JIT image alloc/free
Date: Mon,  9 Dec 2019 18:31:33 +0100
Message-Id: <20191209173136.29615-6-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209173136.29615-1-bjorn.topel@gmail.com>
References: <20191209173136.29615-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_093202_823500_D999C25E 
X-CRM114-Status: UNSURE (   9.08  )
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This commit makes sure that the JIT images is kept close to the kernel
text, so BPF calls can use relative calling with auipc/jalr or jal
instead of loading the full 64-bit address and jalr.

The BPF JIT image region is 128 MB before the kernel text.

Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>
---
 arch/riscv/include/asm/pgtable.h |  4 ++++
 arch/riscv/net/bpf_jit_comp.c    | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7ff0ed4f292e..cc3f49415620 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -404,6 +404,10 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 #define VMALLOC_END      (PAGE_OFFSET - 1)
 #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
 
+#define BPF_JIT_REGION_SIZE	(SZ_128M)
+#define BPF_JIT_REGION_START	(PAGE_OFFSET - BPF_JIT_REGION_SIZE)
+#define BPF_JIT_REGION_END	(VMALLOC_END)
+
 /*
  * Roughly size the vmemmap space to be large enough to fit enough
  * struct pages to map half the virtual address space. Then
diff --git a/arch/riscv/net/bpf_jit_comp.c b/arch/riscv/net/bpf_jit_comp.c
index cbcb33613d1d..f7b1ae3a968f 100644
--- a/arch/riscv/net/bpf_jit_comp.c
+++ b/arch/riscv/net/bpf_jit_comp.c
@@ -1672,3 +1672,16 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 					   tmp : orig_prog);
 	return prog;
 }
+
+void *bpf_jit_alloc_exec(unsigned long size)
+{
+	return __vmalloc_node_range(size, PAGE_SIZE, BPF_JIT_REGION_START,
+				    BPF_JIT_REGION_END, GFP_KERNEL,
+				    PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
+				    __builtin_return_address(0));
+}
+
+void bpf_jit_free_exec(void *addr)
+{
+	return vfree(addr);
+}
-- 
2.20.1


