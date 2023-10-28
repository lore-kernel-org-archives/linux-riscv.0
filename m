Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F55C4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Oct 2023 23:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Li/VAFYbscj6f9+EV6EJIvnlY67sDrtoWicRX6372nQ=; b=X4Bo/SomXEONMh
	VP17Z03U4wZ4AmzN+Fc+TZfoaKVhSbMUipTvNeQvc5FdaqFrR6Zs0w3DeEbH+8dUCVWym4MRVnwkt
	TVwuN4m379z0/uddDLdQ5RUvgeBE4xqUesbGqk4YoygPHU/poMBvOKVE9DqvqD85KKXZa8YtPcCm5
	Iw5BwisQSyUAzyyqpG7qyYYVcIXUPBW5Ro3eLG877ikb6ciMtkGmxXgHrSPH0L8+eoUylJkSOi+LM
	+Yj36vpH12KTq/1vjKNYp8eq+8EkcRDCx+a3WYkqApbobbNor+Z6dTCy8fcsgFl5OEqHfFv8wkS79
	1TCNaVl+Gvw/2GQEKoxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsVP-000vjh-2N;
	Sat, 28 Oct 2023 23:14:11 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwsVA-000vY2-2z
	for linux-riscv@lists.infradead.org;
	Sat, 28 Oct 2023 23:13:58 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5849fc56c62so2063451eaf.3
        for <linux-riscv@lists.infradead.org>; Sat, 28 Oct 2023 16:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698534835; x=1699139635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MROdnZxFJAn7brM6ye/jIKPJcvVCbRqlgsjUSxtP0PY=;
        b=cN5KGH3zyV/wkUFHz6vq7alGBC1izKw+RcEdHAX0laRx/fJ4lHSseYB4q5vvavUR/X
         Gba+yMSZhpd5j/Z+MCXx0iS7s4lAWGSAQMsoUT3kBA9bVb1867SIaWboKNwxbcSjkDvn
         ysZRnXhKuGWgO86kZ2UAry8taZ8PTdd9JD7mxlivIX5M+i76NVR9rdNCbg4pU1T9GGUq
         Za+dYUa25u8OLoVDYl4wZ6hz6B3lVYJw38pC+szfMCzbeX2+Vz8jQprBOeeFWxIB+24z
         jd1neXTtjdmzg8/9fEH0+Kd8sqQk57DgM9Uaq91Zl4zKzYAUImPmsVNrrI9MlvCw8hdu
         AMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698534835; x=1699139635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MROdnZxFJAn7brM6ye/jIKPJcvVCbRqlgsjUSxtP0PY=;
        b=OZY/o2m87noVEtGM7xH9Ih2U81YXbMhbuRgdhfKsWUT18meVFSm8TV9RZ97x0bsPAV
         p3oVx3rl6QpcGM7qhOmDc0WAuy7IIR+7IJgzfROTM10PspGbz+TaQ1rrWfWOcllqtFyY
         hpwpChIsDbCxNvIV345BM89zFm2TvFf36RT3Jv3/AssQCYMMMzxfRi870MD66qkZwXXN
         JQ1BPQRcO3mDnw93MNW6uKpuVSlqb0WAWR5X5febefymqne0t1KgW13nJsz075ycm6/H
         PcZ3I4agJjpsWZNWJ2nXirTYFOQjhq/J4EL2eln5pK0gv967bAEjSjzvVZhCZ47Y0hya
         OePQ==
X-Gm-Message-State: AOJu0YyzjQ8vMvseN39SPeUJyIgCGEN9JkB0gBeKAjOzMw9YO1ba+Ifr
	2rd2hhEw1zrkH7v5ces+pN6HwA==
X-Google-Smtp-Source: AGHT+IEpjr2TCXm5am55hbUBmsnjcw94CHvXcnlavbn7wyDrZYS6wclRzO1RWsfOFMjAji60OjxQDg==
X-Received: by 2002:a05:6358:5e08:b0:168:d6cd:7b2e with SMTP id q8-20020a0563585e0800b00168d6cd7b2emr6151237rwn.29.1698534835540;
        Sat, 28 Oct 2023 16:13:55 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001b8622c1ad2sm3679345ple.130.2023.10.28.16.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 16:13:54 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 10/11] riscv: mm: Preserve global TLB entries when switching contexts
Date: Sat, 28 Oct 2023 16:12:08 -0700
Message-ID: <20231028231339.3116618-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231028231339.3116618-1-samuel.holland@sifive.com>
References: <20231028231339.3116618-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_161356_963992_9570B58E 
X-CRM114-Status: GOOD (  14.38  )
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
