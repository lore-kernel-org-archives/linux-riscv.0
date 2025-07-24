Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95562C87FC5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 23:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5j1aPzQ2MjXi+QplTq1OoEzQNR60d0YK2tyGOgDvv0=; b=zljhp9lRTCM1Gi
	QAbyuknZaU1cBjymI1H4YLFyRcmdbw9oW8XiIzvTmGESWTkQETiDxlHvh6ZVU4OJL3c71wmeMNPia
	lBaFzPvk9S/TP5QiBfMRdqj6t7iz1MjZM/Ly/2xDfNBdp0R2+zc2F/E/phRu+caUGK7akK7/CudFQ
	Jl/EeCeNbJOBB9eXCZZW1pPWvjMa02sIaw7Stiyt8LYsHxbeRiUND+E9MgilOBFRNXXcS7LUdwNSX
	k+bcpj27qk0VwhLq7ZuFS8kYjG4SR+eRetFPSelrkem/u1zqBA4b5Yw0eGzorQAXs7WEK5zxSSQQx
	HAFjQ/DWzsQ02/CMpFKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5f5-00000008iCh-3X4u;
	Thu, 24 Jul 2025 23:47:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf5V3-00000008h2I-47Vw
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 23:37:23 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2350b1b9129so10752135ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Jul 2025 16:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753400241; x=1754005041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yl+fpaUgVvAgmSBmN0Uf0wW/gDpMMKoNCvx2z4Q9Om8=;
        b=WCMCbuu7WaARyvPDA1aBU2EAeJTAEvb82Q7aMQyO40nLj1PYEd91H7SRHmOSujS1ga
         W0W1BAfd+gE/ZcDTNTupCB4uklGjQQMWkf6OkqWHiE6FQrNxR6ivKg12AkGqtRePkq63
         QVxZFLIilLmPVKLRukDB8Q6SHXWecHglk1hdWPR8Ea1dshad1FlB6sMA3FnNny8InjfA
         TKhwjgC1E7lPRKo3z05qP414+ieytxXRvSRG/Q93SDZSx0DrkzzXp81Wo9U4GSoRJny2
         b4ijhyQ8SNFdPfMGo8BUclvyBq9tvC9VQ2ujQR7BzNu0QkG1aHZfJbm6KzKzo7cZU5B3
         FUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753400241; x=1754005041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl+fpaUgVvAgmSBmN0Uf0wW/gDpMMKoNCvx2z4Q9Om8=;
        b=QmSrYj53pkzvrJdzKb9VWKhUmRU2v6HDI7QitqEbWAvtK0/xBfurEj0uQwEku0lXpO
         1+04GVNccbxvSdhKUVBNkjUK2y9RIq7gCWQoAdKN4bOrLNQZ4I1rg890L8MxVvQSy9q9
         tAI+BCt8ab6BD0IxMhXE/xHzfOYDNnIJdzsMizlQ/IxJXfUMcXytRHaLvOhRIxvB66WR
         OuKCK3vvWAlFg8R1yDfyQP08gcce6WoOjWtDpc0CXcf3s5pcz0QDcvKr736DepOBN7vM
         uIG3mKl6cLE7wzOKghxy1Emjcj3tzbwdRC2fWBki7fdh3YHQWNyKGlmDr0YSFKmOuESq
         ZoZA==
X-Gm-Message-State: AOJu0Ywnft7ke1pL+Lb1XMNrsVvEpWcZGtb79DCMrciYx2uiKDmdG4rt
	s5Oa5P7voQPtBoKROBBV6tns+G1Lj59TA7jD3wSOy4tjkIgFIhsQo9Ao5aqx4gkvmsk=
X-Gm-Gg: ASbGncuaUbGMJRJKa8BNnaL7G8BIpyCLxXhDP1Jq+TjZ5YsCOstMYADD1boWFEQaOxl
	Dxq40ctXmoYqgcfpiwOeqM7J0rJp2ryQE5k5mMxWj95CkfQ2l9ph4yBKzVedOllmNmVUE+8zJPt
	R3Lj4T8wo4ZpWEqR65oWOSYZw1wSHDLbmEB9TJYsPpj6Xm4BiXxfiq6BS7QQWbxF6G0s22bRbOV
	Zm4U/J3AK4EH7UJoUj8VGaBHerxrcA4pcSWbJHuiE/zmcS4vWjiisHttQC4tT53LRf44EMVg5Jl
	HQ8daq8HqZYeOc9jsGPL141ZXDmyUFEDZY+id/8U5COKYOgiQr5E4k+7uEo3w/akrgkX7ERuKTg
	tlh6xRD8CNz9Rm+p+vsenMSn08/Mfovyf
X-Google-Smtp-Source: AGHT+IEFvddaBDkybC2q7ob0zwYNRuGaOi2n4X57ciJYKI00Yd6EYfDqXnoJ8jUoGCKUz8NAesStww==
X-Received: by 2002:a17:902:fc48:b0:23f:8df8:e7b1 with SMTP id d9443c01a7336-23f9820d012mr133037965ad.32.1753400241217;
        Thu, 24 Jul 2025 16:37:21 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc706sm23598685ad.106.2025.07.24.16.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 16:37:20 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Jul 2025 16:37:00 -0700
Subject: [PATCH 07/11] scs: place init shadow stack in .shadowstack section
MIME-Version: 1.0
Message-Id: <20250724-riscv_kcfi-v1-7-04b8fa44c98c@rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
In-Reply-To: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com, 
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com, 
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com, 
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com, 
 heinrich.schuchardt@canonical.com, andrew@sifive.com, ved@rivosinc.com, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_163722_024539_0A05F020 
X-CRM114-Status: GOOD (  12.25  )
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

If compiled scs and arch kernel shadow stack support, place shadow stack in
`.shadowstack` section.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 include/linux/init_task.h |  5 +++++
 init/init_task.c          | 12 ++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/linux/init_task.h b/include/linux/init_task.h
index bccb3f1f6262..a2569cc5a7ff 100644
--- a/include/linux/init_task.h
+++ b/include/linux/init_task.h
@@ -40,4 +40,9 @@ extern struct cred init_cred;
 /* Attach to the thread_info data structure for proper alignment */
 #define __init_thread_info __section(".data..init_thread_info")
 
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+/* init shadow stack page */
+#define __init_shadow_stack __section(".shadowstack..init")
+#endif
+
 #endif
diff --git a/init/init_task.c b/init/init_task.c
index e557f622bd90..e21af9db5c09 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -54,10 +54,18 @@ static struct sighand_struct init_sighand = {
 };
 
 #ifdef CONFIG_SHADOW_CALL_STACK
-unsigned long init_shadow_call_stack[SCS_SIZE / sizeof(long)] = {
+unsigned long init_shadow_call_stack[SCS_SIZE / sizeof(long)]
+#ifdef CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK
+	/* shadow stack must go in special section */
+	__init_shadow_stack = {
+	[0] = SCS_END_MAGIC
+};
+#else
+	= {
 	[(SCS_SIZE / sizeof(long)) - 1] = SCS_END_MAGIC
 };
-#endif
+#endif /* CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK */
+#endif /* CONFIG_SHADOW_CALL_STACK */
 
 /*
  * Set up the first task table, touch at your own risk!. Base=0,

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
