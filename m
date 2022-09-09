Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFC0ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 21:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvAonXtKgc3d/Y7QkverP7AUs+U6qot/3hshBTgIWAo=; b=OtWqnqcVCH3wCb
	Cx6GDkTzCjEuHfjRBxmnTUnVoW4t3IzqSpbusnYDuJt/otzc69OhnmswKiIGRWibd2JdIqtpzE4WD
	nY6ubc7QQSPbxbOJQnhCaPDtVSSVkQPtJDkpjyefVr15ErfBg9htLhTTXTsGd0nozP3fuuuiP1h/n
	42sVDxVAZ/bake7dygHZwPnIgCXXeFfgGO3n1GBbS/gr8006mm3aL5xFOnrsiwKi0czERNYiRJ2jO
	c6uDXXgz1r6JrE0/0vrEe9GLBCxkRUNkN9ouun8WMm1Mt4H61coCFeaZjddHYFOFlxhKC3zMSXkWD
	8A1xChzJemvFB5w6E1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWlXM-0033nN-0d; Fri, 09 Sep 2022 21:27:44 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWlXI-0033kz-Sy
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 21:27:42 +0000
Received: by mail-qt1-x830.google.com with SMTP id a3so769392qto.10
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 14:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dB7aB7ydAsOfWnmw3wC7w0o+kgP2MH0De3DP8wevgV8=;
        b=GY3BRWQWGGj1Ko79vpxpCZgd66JyEAtNWt3a4lTwp5nOONldrg0bK5IxP4xUkISLih
         RwnIS4tJz9im/Nc6yXRupuwPeFHx9911EYQseFXQV5f1exucPQCSkIzXquyiFlbADFq/
         obQz6e/w/27+5I0Cq7FrqUd7zBFuDm/eNJrOavSgmmV7YV1C/WRLXairJPoLnlJFg5+b
         r5JQPWip3Lq3Kqpx5qsTMtEoCi1dfBDsy7xDLkzzxJZBM2RElCkuvPrccFBhQ/FvE1qP
         rqf1xxHrxEdZenESTZNhMtfCbtSxVYTcjdaJMU93zFftvODuY80r0HuKi1qJ8cHZsQ0s
         z/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dB7aB7ydAsOfWnmw3wC7w0o+kgP2MH0De3DP8wevgV8=;
        b=mS0g82tXwsXEL46oi1xYI+1qu65D1tyhPqUNS8K28Vp4rOCYXvB6erh5te8MPEoTEO
         ScwdDqT5EusnqMnIAnLTYEEUJ91OTAkRYwqefKlnpgBP0JRbxtaBV0RsUbycLBRbvyMp
         u95Ocg0TPufyDGtfuG6X6X6FyakL3BOHiDyMwwceNxlZlBByeJ4Y0PqxceYHL/f7/32/
         NB9aVVSxRjkG/9cDCX23b0YeLvlfTqfCAkkN8IAPVlkxjI0rg575TZ7JBvi5l5ACyhE5
         TqMGsqD5ursdHFQ1+K7n0mMe6iVrTDsGN7BkbfZzFj2CiD0AhOlTnHXdpIQ0ZeJXMpCS
         bEqw==
X-Gm-Message-State: ACgBeo3kn43Ro5F/JAsrglZMehW8INt6vOgdBbUqeWViGO+27M+kBQ1z
	ohNlPC/5CaSYHwUbViaGW52XzA==
X-Google-Smtp-Source: AA6agR6TgVwVZWdRLnm4mtuaKCgIR16McG5+g4KNgQugD0Yaz+c3sjyDAJ7BTtHmchyMuojz7xR+sQ==
X-Received: by 2002:ac8:7f53:0:b0:343:652:ce62 with SMTP id g19-20020ac87f53000000b003430652ce62mr13795166qtk.514.1662758858422;
        Fri, 09 Sep 2022 14:27:38 -0700 (PDT)
Received: from abrestic-xps.ba.rivosinc.com (pool-71-105-112-35.nycmny.fios.verizon.net. [71.105.112.35])
        by smtp.gmail.com with ESMTPSA id o22-20020ac872d6000000b0034359fc348fsm1085138qtp.73.2022.09.09.14.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 14:27:38 -0700 (PDT)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Celeste Liu <coelacanthus@outlook.com>,
	dram <dramforever@live.com>,
	Ruizhe Pan <c141028@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 2/2] riscv: Allow PROT_WRITE-only mmap()
Date: Fri,  9 Sep 2022 17:27:31 -0400
Message-Id: <20220909212731.1373355-2-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220909212731.1373355-1-abrestic@rivosinc.com>
References: <20220909212731.1373355-1-abrestic@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_142741_180992_118D3967 
X-CRM114-Status: GOOD (  11.04  )
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

Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
invalid") made mmap() return EINVAL if PROT_WRITE was set wihtout
PROT_READ with the justification that a write-only PTE is considered a
reserved PTE permission bit pattern in the privileged spec. This check
is unnecessary since we let VM_WRITE imply VM_READ on RISC-V, and it is
inconsistent with other architectures that don't support write-only PTEs,
creating a potential software portability issue. Just remove the check
altogether and let PROT_WRITE imply PROT_READ as is the case on other
architectures.

Note that this also allows PROT_WRITE|PROT_EXEC mappings which were
disallowed prior to the aforementioned commit; PROT_READ is implied in
such mappings as well.

Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is invalid")
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
---
v1 -> v2: Update access_error() to account for write-implies-read
v2 -> v3: Separate into two commits
---
 arch/riscv/kernel/sys_riscv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 571556bb9261..5d3f2fbeb33c 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -18,9 +18,6 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
 	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
 		return -EINVAL;
 
-	if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
-		return -EINVAL;
-
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd,
 			       offset >> (PAGE_SHIFT - page_shift_offset));
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
