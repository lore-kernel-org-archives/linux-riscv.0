Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275BBC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 03:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FIIyu67uXwq7gniF/eH76l8aiwot36KHj+gwoT6sAY=; b=y9FtIOY4up/HC7
	+UO3PBe7/G8odyAYGohrA7cMPTzD1lLq9/UvPoIItr4NXBcBkU3OO7JkneBfJnr+eKT/WTjlsfoHV
	Qw7vWeiLF3n2O/iQRn4g3E8gswZcfU7IxJoX3Rqkq0vorQoCFYN5wCXVMo7li3z2x/cPQL7oiJuPr
	kbIJpzNBQnhLv5UMCGf+lXCA+biv7G2byWQ/CYOkLfkEnHoEGp3CVTbHffbT5LqBnEhnm7gykYONv
	84WD3HLHu/l/ageEhjFxjBFRHCU7KuZsYouyzc6a618/QtlJV5KVstokYTr62HZkwUa66f2KLQxge
	soefB4bANmQ062nuwxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAkNx-00Fh7d-Rx; Mon, 11 Jul 2022 03:47:01 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAkNk-00Fh16-0m; Mon, 11 Jul 2022 03:46:49 +0000
Received: by mail-pj1-x102c.google.com with SMTP id q5-20020a17090a304500b001efcc885cc4so3773939pjl.4;
        Sun, 10 Jul 2022 20:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zH1rOKwt+eppc4uRJ3wzEb3jlVxvSJQcRh3p/hoLlMo=;
        b=ePx9tw2qDorWxYzPWcGRLOvGkwfDV4WFpjno1bzwsIkpBxrJHAnbnXDd+9TSQPIZWc
         rB8vctJmdtvbZmL7h6HXuBkhUVLcRj4hr5D8Xao8ADv5y3VOodNZydMQYF/4GMGusm5B
         AITvvCsvM4Fymc4mIY+V5NWWdLdN5dTrkn7xmybz4zKiKBZrzDwmWdMdWUAOQVASHsYU
         cWoYrJVQQwEh8W4X1CL7RJ+zQhdG9+qfpNmkK52I5z3wiRZLGNEEimJp5XIALeYrky8b
         md0dtPDDjYyabBKb/WuxSnQ+6lF4nSZ8gZYRptwvwsM03yDen/D8SIE11lqmoUisCWjs
         XneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zH1rOKwt+eppc4uRJ3wzEb3jlVxvSJQcRh3p/hoLlMo=;
        b=AIeuygVOSMEZyXf2WWkAZedxKcKqo27364cF8L9XMUCV5DhbyVGWuEDiU0jRKz7Itt
         9tAK7qL8iOc5LJOH29TnZUXog320MkpcgNgPI+6+yhVVHa82GzR6NFAzYWUmAAg2qELz
         hItAGnPm1bDls18m4g2ofyaBKlFpgUZ3kBoXbtwLPvVoiPSV5t8zPEwTFMOTla4pVaZf
         Itx7x9+B6G03acpf3ZhVT5JVN/fMnOAKvjEl9rnVESK2nhmS2ZkO2gyp3fLhbtqsThb4
         sZIlgda60Hfk6ilpAgse8p/mkXfLiaBxtwFi79heuCcLBh3ydjQvrn3K4scfqp2Msvpx
         FqUQ==
X-Gm-Message-State: AJIora8OZ0xDBdjrv3Uzx0itYbApzClizBnzd47TT9Vkk5m/ObcwwTLP
	7rot0QgNl9wW198pY8akZNk=
X-Google-Smtp-Source: AGRyM1t+IjLE84wZXwipeZB/XUo7NKGO7BarDvcoewmact2teddnhHzQthXl8IiBONeN1GAjHbnetA==
X-Received: by 2002:a17:90b:4b4a:b0:1ef:fc95:3c4f with SMTP id mi10-20020a17090b4b4a00b001effc953c4fmr15058701pjb.138.1657511206386;
        Sun, 10 Jul 2022 20:46:46 -0700 (PDT)
Received: from localhost.localdomain (47-72-206-164.dsl.dyn.ihug.co.nz. [47.72.206.164])
        by smtp.gmail.com with ESMTPSA id a13-20020a170902eccd00b001664d88aab3sm3447949plh.240.2022.07.10.20.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 20:46:45 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	darren@os.amperecomputing.com,
	yangyicong@hisilicon.com,
	huzhanyuan@oppo.com,
	lipeifeng@oppo.com,
	zhangshiming@oppo.com,
	guojian@oppo.com,
	realmz6@gmail.com,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>
Subject: [PATCH v2 1/4] Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't apply to ARM64"
Date: Mon, 11 Jul 2022 15:46:12 +1200
Message-Id: <20220711034615.482895-2-21cnbao@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711034615.482895-1-21cnbao@gmail.com>
References: <20220711034615.482895-1-21cnbao@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_204648_082101_7E2A1771 
X-CRM114-Status: GOOD (  14.05  )
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

From: Barry Song <v-songbaohua@oppo.com>

This reverts commit 6bfef171d0d74cb050112e0e49feb20bfddf7f42.

I was wrong. Though ARM64 has hardware TLB flush, but it is not free
and it is still expensive.
We still have a good chance to enable batched and deferred TLB flush
on ARM64 for memory reclamation. A possible way is that we only queue
tlbi instructions in hardware's queue. When we have to broadcast TLB,
we broadcast it by dsb. We just need to get adapted the existing
BATCHED_UNMAP_TLB_FLUSH.

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 Documentation/features/arch-support.txt        | 1 -
 Documentation/features/vm/TLB/arch-support.txt | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/features/arch-support.txt b/Documentation/features/arch-support.txt
index 118ae031840b..d22a1095e661 100644
--- a/Documentation/features/arch-support.txt
+++ b/Documentation/features/arch-support.txt
@@ -8,5 +8,4 @@ The meaning of entries in the tables is:
     | ok |  # feature supported by the architecture
     |TODO|  # feature not yet supported by the architecture
     | .. |  # feature cannot be supported by the hardware
-    | N/A|  # feature doesn't apply to the architecture
 
diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
index 039e4e91ada3..1c009312b9c1 100644
--- a/Documentation/features/vm/TLB/arch-support.txt
+++ b/Documentation/features/vm/TLB/arch-support.txt
@@ -9,7 +9,7 @@
     |       alpha: | TODO |
     |         arc: | TODO |
     |         arm: | TODO |
-    |       arm64: | N/A  |
+    |       arm64: | TODO |
     |        csky: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
