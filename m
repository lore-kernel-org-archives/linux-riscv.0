Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D669DC61D9B
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Li/VAFYbscj6f9+EV6EJIvnlY67sDrtoWicRX6372nQ=; b=4+ku44dz9B0Fs+
	Ih6dX+TGlnWuOjUcfLHl2CyFoetgXkMC9cUJyEZQWtco7XMafvUTU3+iMyge8/iB69zMsM8LbimRJ
	me4ZkGpgrgOqBHlLZmpIp2bDuqnIu1lk4XI9+pY/gvu6fm3y1RYQFZfXueBTy4iRR5HjWxohekMKp
	OZDqg2GxbWpQhatQY4Mrs1P3sYDVGx8cLKKPrKkjx572uBzvcMJNymzPceXBqoelH9GodZ9IXnA4u
	akORMLAys58VPW6RMDwdeSmvJDCpyEQBq9QC1DUYYGP7TpQeSscN/QN9W0WC2gZA7fSzWLQVlkqTc
	xAX2H4Pq2+KX+bY4Yg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bjE-000NGP-1M;
	Wed, 22 Nov 2023 01:08:32 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bj8-000NBU-1b
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:08:27 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6b2018a11efso6318582b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700615306; x=1701220106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MROdnZxFJAn7brM6ye/jIKPJcvVCbRqlgsjUSxtP0PY=;
        b=Ie3IVsVQbnTEWMjEUZhnQHztatCc7hKq6ZfVplNfGDEIBDL+DOkycGJ40jaRmZgges
         neqN6kEDZ2HBysRy1/aUrpYlvwkDOrAif67Cc3XZKEEo8O5mM5nJop0RSlQ5xRS+t6/a
         6gbxqflwIikkpd3OO4SOtGgK8Nr9w8o4mNMB8JHxn/sV8dyi2wgscErofSoazSPKYiJf
         3YnDYUkrSmlNPv4mSh4Ves9ODjM5Zg7jzVqFaCCU1i3Rr6c2WIcT67wDOp/zpcHgQiyk
         M+Xt7q/RokyD9Mr6E1fdq2aqoradbwSf9N8SBLdIWbBCA5eiOCvyeqSK5f8aZ5hJrst7
         Zp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700615306; x=1701220106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MROdnZxFJAn7brM6ye/jIKPJcvVCbRqlgsjUSxtP0PY=;
        b=d3Y6Oc39KdDEQuovu4khE0TBCzvsBO2jsv0Tu0GDR7Iy1sS/4v3Qmp1bjFhnE6+wr8
         jtB6jPI7tqsZUh8h8r8WV/lytqPn9YQ2HekLUM/Mf9AXrE4TvoZF8o9OQ1Mgit8twU0r
         KQYwf9yW/mjEu9PGXSQ6ghM4qk3CvV3PiyTtmE2z4wGymHxP9JYzfgFugDdXlR9mikv6
         CaJkdOL1h7jYXcozO2TAnUCfMovUdkMx8ETcRIXmKJa78f6+i47N7BViQGlJ61Zovvaq
         k/sL7lZSzwvD7IxWI3Qg5Mgf0F1Ycr4jKZclL78pseyRB21NTb9YG9XZAX38WAi34ICG
         HJsQ==
X-Gm-Message-State: AOJu0Yxia9PkuCiNl+1gF48Nbb92WhwJVbejJ7+/dp6PwcVvv+gsK2Wq
	1iubdSw+/rqvuwxc4RQpojY0Sw==
X-Google-Smtp-Source: AGHT+IFVZu+XEimHfZXOsjvtj11LrkIBAYyBlYwN/UfpJ7aqLGYZgxb4tCN+mMPanboANiNPoJtK3w==
X-Received: by 2002:a05:6a00:b54:b0:6cb:a1fe:5217 with SMTP id p20-20020a056a000b5400b006cba1fe5217mr1041980pfo.16.1700615306009;
        Tue, 21 Nov 2023 17:08:26 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bn5-20020a056a00324500b006be047268d5sm8713961pfb.174.2023.11.21.17.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 17:08:25 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 7/8] riscv: mm: Preserve global TLB entries when switching contexts
Date: Tue, 21 Nov 2023 17:07:18 -0800
Message-ID: <20231122010815.3545294-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122010815.3545294-1-samuel.holland@sifive.com>
References: <20231122010815.3545294-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_170826_533753_DC3B7818 
X-CRM114-Status: GOOD (  14.45  )
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

If the CPU does not support multiple ASIDs, all MM contexts use ASID 0.
In this case, it is still beneficial to flush the TLB by ASID, as the
single-ASID variant of the sfence.vma instruction preserves TLB entries
for global (kernel) pages.

This optimization is recommended by the RISC-V privileged specification:

  If the implementation does not provide ASIDs, or software chooses
  to always use ASID 0, then after every satp write, software should
  execute SFENCE.VMA with rs1=x0. In the common case that no global
  translations have been modified, rs2 should be set to a register
  other than x0 but which contains the value zero, so that global
  translations are not flushed.

It is not possible to apply this optimization when using the ASID
allocator, because that code must flush the TLB for all ASIDs at once
when incrementing the version number.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/mm/context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 43a8bc2d5af4..3ca9b653df7d 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -200,7 +200,7 @@ static void set_mm_noasid(struct mm_struct *mm)
 {
 	/* Switch the page table and blindly nuke entire local TLB */
 	csr_write(CSR_SATP, virt_to_pfn(mm->pgd) | satp_mode);
-	local_flush_tlb_all();
+	local_flush_tlb_all_asid(0);
 }
 
 static inline void set_mm(struct mm_struct *prev,
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
