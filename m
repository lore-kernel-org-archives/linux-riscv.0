Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B26E88D8B
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crIHbJxcSZW2VUQDhjUIwBBehLaYFagsb+zA2wzaQQ8=; b=NJIwBd9bQWTjEu
	eAPmSryKF7wJOnj2YAoibP7KaEQpCikF2ctfTa5Y1niVkmtki0t3/aFseJ9uOEZc9ymDDshPPUj15
	MT6iGWMn7If0GgcKGXcbFxHAGj70PwGUAUVnVEOgZtFEN5H9Bf8bz4cBkE+YFFEkJwJqm5c2JRXqG
	/w7TRdMbr1AstC6y3ZlzfoqBxigOyHJVUJRbY0hGHYv4lD6ZJ/haix5Vw3Kk+h7rcpDqYA5RAXZdM
	twiNmFo/vVxNwCBRgCtJIJ0zo4UMzX27F7DWxLfLNFNuo7g7E6IRc2hkBSktS215WAzY5OceBkuhE
	fghzot6IMiyDPS8ThcLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w900P-00000003S5z-18Kk;
	Sat, 04 Apr 2026 12:21:37 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w900N-00000003S5A-1D3W
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 12:21:36 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c736261ee8dso840270a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2026 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775305294; x=1775910094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxbGgf4+lSuSxIXzDbxhYHMBptayAf1Wj0PvoCJF+ME=;
        b=kOtuTes/JDh71Tt4jHzWWxxV75axFMKnsr2Mpqro49YXeQd9iyEPKWreWEbGGtE3Hk
         B4kb2rm6H2dh1ewhoM4q9oQpFN8Qw5zQwZi99jMV+d2vw69mhSQjVJGh0iHmVzsDSx2v
         KDwdWvNHCCWtMlvtfL7H4iKgmI9mbFYsNorl9ezXplKVBc3BdQH4pIb4JUyrLvzKktXh
         FowXpO1tfeZdL8Urx55Keg0W7uT+oJRtZp6/KSkr8zIn+PxkpnHCc8YRK9L19z8b8EXN
         w1tzfSt1BdASK4N+NapTdglCXYt5wITYChu6ofrz9Ayn4D/tYKhHx46sLr4IXGQpFaoH
         hkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305294; x=1775910094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qxbGgf4+lSuSxIXzDbxhYHMBptayAf1Wj0PvoCJF+ME=;
        b=UQt+4mjpS5woAwmZ72d+syzBNCawFtVYLsXr+HwKRA7A/7chmui7AM0RRCyjLpHa3f
         yhmZwlvzbjG53y95Bqw9pprfCTJRx4PMbcL5a4sM6BamLdFxA2O0oKLNcEl15ibk2DJa
         8dAG4PAldi2cqO9mCmwHeoLxOF45eUPu/klP1cZmFG2PmmtdSoH1RVqKDjtHLo7YGRa/
         EiF9bLIZ1tp40weNAMbCAneqAZ86LfEBBFg2S74E64pEMvyvzpnIrIKa66bodIcIbB7z
         EpQod9jNKx76blXLqu7fdWY8+kAS1UAHd/zhCHvUerKt9bfaPmEfX6rMgGnIC7fjFkSF
         N92w==
X-Forwarded-Encrypted: i=1; AJvYcCX93YNaRUJ06HLWLJnPptjIrrmhjh8QjaQh5CuZ2G9dc3gaWsODfiEXa5bikgz+tc0JuP0qqriuoJPksQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvto25S+55n4Zws3MjCgOdAtz7Y2Rw2ja5pRwDyzyawhgM0EJW
	dRdHBc666NwINcvAs3Ne1+WYmgkkydBr0QlmL5ji0gpzKQOpzZefBTNXoB9x2yGTGso=
X-Gm-Gg: AeBDietrt4/htmqs/2Ojrk2ZLj/kf50JwtrdQJwW594OwQvmaopIRDXj9ki06qo10MF
	AP3ptEJe1B2t0WqCrknnT3w95CmGo5JGIqsqIU0bf4dB+uLv2QB2uMWTRVjYF7l6oHxzKL/nP5y
	abg6diPn7a3Bu7blJ0UsAOJvP/08ZMyoCfhibNKsHnVutTsRHziVNTTUMAzl8WCDZXr+9+bxMRo
	DWMdjU5rZ0/J4vsIthTuUftdzlB+CmMlsFoVDMd7znhF3ynBBxf9LvbgCATipp6yXPaIAhK2Epp
	gmxpMXRZBhRVFm4S2YJGONfHhAQq5YgIboHnhY84qVPj+2hxX+uTE+8FKIuuHbeVhYgMKxBU0xp
	/lt1P8cDTw/vQJH0magBYXJYg9VuJS6S8BW3lnsw+B+Xla6RfSzHDtLrVRKmiq0GFIJ+laqg7zH
	aJ+kbyytnIAIpIpKioZlYDVznWSOH+QZpQFCW3K1Xg/TQ=
X-Received: by 2002:a05:6a20:430a:b0:39f:2dd0:65d5 with SMTP id adf61e73a8af0-39f2f07e2fcmr6795719637.39.1775305294226;
        Sat, 04 Apr 2026 05:21:34 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm8327063b3a.59.2026.04.04.05.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:21:33 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Austin Kim <austin.kim@lge.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] riscv/mm: drop vmemmap_pmd helpers and use generic code
Date: Sat,  4 Apr 2026 20:20:56 +0800
Message-Id: <20260404122105.3989557-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260404122105.3989557-1-songmuchun@bytedance.com>
References: <20260404122105.3989557-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_052135_322130_BAAC69F5 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
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

The generic implementations now suffice; remove the riscv copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5142ca80be6f..f7e7d7c2e97f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1429,19 +1429,6 @@ void __init misc_mem_init(void)
 }
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
-			       unsigned long addr, unsigned long next)
-{
-	pmd_set_huge(pmd, virt_to_phys(p), PAGE_KERNEL);
-}
-
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-	return 1;
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 			       struct vmem_altmap *altmap)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
