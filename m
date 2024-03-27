Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E915CC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 06:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLB3xJwyDt+V4H9HcdYD7X17kR2W/K5QMJXAG7DV0No=; b=E4Gw5TThaFwt4J
	+NwoYEUneqoaoZcIKT5R5NGzTtJWMIPFFmV1px8Lfil9i0bGxQ5l5jDzE+CnCJQUM0TqxnIH9yy3R
	wUWivdEne5aQa0iT2WW+L58Ocru68Mx6KuTqUKVnz7Y2N77RpZ8DKTEJma9KVRUqnEwiKuEdIFIi9
	OcD/epFMUlX1c0Nt2LAuC8wRSvJqaGd2vgaslC5hGHybmYDpXm9ZsDJpgAyiJagKhv2sYvUO5Qy/g
	Y/gfHEV7yhUAQCz8iQnDXC/tXcNiz7gAGseeGnb+iuYq33mVuiVAESWEopN6RA5OU3fjLivsQQYWX
	gocLOBemqBI7d0YgJbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMNQ-00000007bkW-2640;
	Wed, 27 Mar 2024 06:03:08 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFg-00000007SFR-0BBt
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:51:06 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so381506b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515061; x=1712119861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwpkv2OuO7YHUplKH98oFVfOa+CFbclxXNu0ysmduyU=;
        b=PV09Steyhc52RLNpCRmB+LTuOKqR0PsYqJyEW0YmkZ3z8J3Y9Aghwc6+zpbUrEICq0
         eSyc6DFGjweenKY2HTKxoxwDa+Xq/Jf54ux4V30sWJ+u7ZVkP9nQaJaGXkk5sxw0xosN
         8eisEFLnU+mmUBmRzXW2SF0f+XU6V1PQcFucdgQWpBKRcwN9zdmpxVgtfSD/Zskcz3OB
         4IDwLk+4/Ph3y8cefxs3KEIgDDOcfFopoegs0K6WziiCe0sp//EII4Yvzwy+l7ZB+rRm
         vab2JEQfI6FNHtXnC/cdIlKK0Z9I31C2pvRLH58etAz8cCp7O3YnQuf7eXrBNYiA+/ly
         VQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515061; x=1712119861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwpkv2OuO7YHUplKH98oFVfOa+CFbclxXNu0ysmduyU=;
        b=cuVNFaj+4EP8FCdq28Z5lLjYPFZC0yNqPFThWoMI+mRzfl3q1LezBG0yOKHI1LmLy/
         3KPG/iQr4f2nWlmJhusZuUS50NNC7EZfYcMwlxqLDTyzoZFEd7hqEXzBDB3QmGkcyQUn
         RcjV0dsFsTgPHGtj2vJCp3HJq1+rA0D2PqFs6Pu4m8BSHqDKssy2AJ/nWyHVD9eOzkCu
         1esTe1OxyK+WWA0c47GN2+cChwwNY7/4E6TL/UF7APpOcHfDXv0LOSjZ4sYyi433aOlu
         LhjtwJNEJax6I+xqXDxUDZ58sCKki9w42n0vVfNi3GkXhyHaHoWBPMY7FSEQj4JX/LOY
         DM5w==
X-Forwarded-Encrypted: i=1; AJvYcCV2XWAeDvcbvekxcCWCAnaqxqq2oOJUIOuzwzaNXDjEDK7YdmpH9jKp2yosB8U3X60qsHD/OaOkD4GwAl/AUTiD495d50+nHOTtFazjuNll
X-Gm-Message-State: AOJu0Yw2epBioYqqEFPFgQhHaTqMA/dMjCgt1RoUtzN4vJBPUluJLYgT
	fuY9h5Is++QVIx11fQD/YBP18V3tqD2YmM0j+wTCEWJQqaNibyHns1QHD5y8MHY=
X-Google-Smtp-Source: AGHT+IFIatp35KNpgDUDmJycAxTP3nvYaAVXQURqJcQtx3/AD7qiy3AeB8dChiHf0CcNcubYBhb1CQ==
X-Received: by 2002:a05:6a20:7345:b0:1a1:67c0:c751 with SMTP id v5-20020a056a20734500b001a167c0c751mr5157753pzc.17.1711515061281;
        Tue, 26 Mar 2024 21:51:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:51:00 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 12/13] riscv: mm: Preserve global TLB entries when switching contexts
Date: Tue, 26 Mar 2024 21:49:53 -0700
Message-ID: <20240327045035.368512-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215104_986643_296CEE5E 
X-CRM114-Status: GOOD (  14.57  )
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

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/riscv/mm/context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 0bf6d0070a14..60cb0b82240e 100644
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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
