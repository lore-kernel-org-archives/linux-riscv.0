Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D92DC25B76
	for <linux-riscv@archiver.kernel.org>; Thu, 30 May 2024 16:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-ID:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ce5K1oVhwy4Gf39lm+Aui2bF10lxhtzPtfLP/QUwEJY=; b=1hlQzgcT7kIRXt
	VWirHifX4J8EtCQwPobdpQq/nZ7JXSWuNR0hajhdl7Pe0OyF6XYOLViaeTSXi9h/obP0OwVy9NpeH
	JEpwFV+ctzkQxG0TnUTGSh3yB+k3EL0g/QAVHSfPvXZc5vsj/xEXoNGJXuylBtKJ56Jz4aJtltCIa
	4uFbcFudTfCXyyO+VjvSfVU2Kl2nuBK73/1irSO7c64eGqxAreYeEkPyxo7FK/FpkmNCuXxxrK65T
	YyqX36mZObdQBbj0B2vkboFJjNn26XiCrwSmWEt9ykGev+I5+6daWlj+FomzLwawwAxdulu1feoUB
	xTg3gQOA+riwjCQM0nfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCitv-00000007soh-04lV;
	Thu, 30 May 2024 16:45:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCitr-00000007snX-0jTO
	for linux-riscv@lists.infradead.org;
	Thu, 30 May 2024 16:45:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1f61f775738so6125185ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 May 2024 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717087509; x=1717692309; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=xOzegM0vd+pENLEU3lhD32Gn7D6Mcf1VzkpF3e85750=;
        b=PF+YcwpDPdTKRZLUtZi5rgWgkWmMTY5+sEEbgavwZ+w2HjtY5356JNXFkyJlyHY/02
         CAMiNqQmEPugDxsSwUCoDvxmtSgdCS+i/MmnrX6HixC/BDI9wsm9ItLBPdHW2LUZs+7F
         zLPAwUlCe5Ng8FWe0BpruqNxedV0UrC7xK6LBU7dN6BJPzi93LRtB/SKP+TIQF+zVoF6
         /n4fYQFf58EJCA5D4KK5Sw8WNkmvx+nDiaK9OibqoUoPAi+lZVy+Jb/1z2UbhA8yIqGK
         A2adAcW7VtEcsiDSBCeMOx47+Puoj/WnuTb47rORCiKnD+k73/l6T9c0hI9d0SZ/g6GZ
         WzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717087509; x=1717692309;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOzegM0vd+pENLEU3lhD32Gn7D6Mcf1VzkpF3e85750=;
        b=IDKiHcgBM+V+mng8jYyYXIUvl3rNlANkle2dUC6Zc5oT8p3cQwKB0JBJXYne08xXtE
         OhapWfqEfd9vxruRbqo2e7gDPIbmU0oX4shLK67o2fibYzwNEmdJ3BioCDJItazO8vOS
         oxgZfzitQ2yS0f5/2ssbsZbdMfR6TpnCuF/g54Hj4aFHzhP1eDLsrWxH2UU3lR1T4/cE
         9PyZeiva6QTJhYXPCdfbldS/tRRh7zP3j8KtWEkneE2PC+3iGpK4oJP8hU+fiVOuy3qA
         vFlDkslqbW31qrZj+SoOWEIJFex/fCYj2phXvI66iRBFIaeIlPs2f7EYisoJYIkhEWKK
         RD8g==
X-Gm-Message-State: AOJu0Yz+t/yaqbBUQunHhzz6E22jlRH9AvBfLM1xo0DoGnVMKpn/nsTj
	39eoTCuRcmQOZwNtI164vMGnTWcAPAoCgXKZdPkqj6953XkEe0rASrFLSqWh7SM=
X-Google-Smtp-Source: AGHT+IF5ZCUTHA4RbuWZrUM95v4mHrXe0BsCSWZE2Kc+Ge5l/lR0EiQ15vA/YZsp2wheVERfoRTC2Q==
X-Received: by 2002:a17:902:cec3:b0:1f4:8190:33c3 with SMTP id d9443c01a7336-1f61962ed55mr31844515ad.40.1717087509402;
        Thu, 30 May 2024 09:45:09 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6312b1fd5sm472665ad.172.2024.05.30.09.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 09:45:09 -0700 (PDT)
Subject: [PATCH] Revert "riscv: mm: accelerate pagefault when badaccess"
Date: Thu, 30 May 2024 09:44:51 -0700
Message-ID: <20240530164451.21336-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, surenb@google.com, akpm@linux-foundation.org, alexghiti@rivosinc.com,
  wangkefeng.wang@huawei.com, jszhang@kernel.org, ben@decadent.org.uk, Bjorn Topel <bjorn@rivosinc.com>,
  willy@infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_094511_239586_A941E2E7 
X-CRM114-Status: GOOD (  10.30  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

I accidentally picked up an earlier version of this patch, which had
already landed via mm.  The patch  I picked up contains a bug, which I
kept as I thought it was a fix.  So let's just revert it.

This reverts commit 4c6c0020427a4547845a83f7e4d6085e16c3e24f.

Fixes: 4c6c0020427a ("riscv: mm: accelerate pagefault when badaccess")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/mm/fault.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index b3fcf7d67efb..5224f3733802 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -293,8 +293,8 @@ void handle_page_fault(struct pt_regs *regs)
 	if (unlikely(access_error(cause, vma))) {
 		vma_end_read(vma);
 		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
-		tsk->thread.bad_cause = SEGV_ACCERR;
-		bad_area_nosemaphore(regs, code, addr);
+		tsk->thread.bad_cause = cause;
+		bad_area_nosemaphore(regs, SEGV_ACCERR, addr);
 		return;
 	}
 
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
