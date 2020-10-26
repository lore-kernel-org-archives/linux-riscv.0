Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B2DC55178
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A208320708
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 23:03:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R2N4oQv0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="JXSoMBF4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A208320708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jItsVKgw3M8EfidQQEWfLINsB65ulKh31mJBLTzxhDI=; b=R2N4oQv042pLH7TrdlwNl7i50
	JjJy5OvLFC7t//03XjlRdVlWhM7FNziOhNkUx4TR4LRsdhYbQzg1uMxn7yAmZXSXldhIR6W2JsZTO
	jEOLLZl8TALQpLU/nc9Hx27O2pnp9vVLtXNjp0bi1hXSf09zSdDG99wlmmlgTwsxi58Z8opCAtLlc
	b5eYKGc/KQEhrPrF8/K3XPpKjb/ubPyDnL4Pe2wxp1arN3ruor691TL7rSFM9u9RbJUiSaE0C4H52
	+5ywoRk22VlNHevpvSo7+Ciak7INBHIQGNvR6n69NNMsPvEHvhzlw/63bQ/dm8p6jMNjN6vCogORd
	SDruDBTMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXBWX-0004Ij-0J; Mon, 26 Oct 2020 23:03:33 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXBWS-0004G3-NQ
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 23:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603753408; x=1635289408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AVRSSDssQdWbrcRKwBjC+hUtmkwJEL8J+eqHnYnc5QE=;
 b=JXSoMBF4ncwPVXLxewMSTeYsKp0BzDGS31RbupMBJvpJXzJAd/M1iJmL
 TBSJVfuyzHcCdd1Il/SovevTs8tWGJHiD5H6/jgM9WngeEiBJfRRrAJEi
 zz2z/CTcvEF8uUNS/NeXxi9zHprzolNuwagt8HIJQ4im6++Z+V4MYBBFa
 rIwOLsRyNRuPQd+uavq+ecYDaII6BW0AQgMPlbBFs20+h4l9ug/5r8lvq
 vkaGEWWmHJy+Y7uFf/H59nyE+YyVgl5VWIXxeq+lTsBLThebrhcfNR5rF
 mX+GKYLwKesukjd5kivkf/O4bChtj+Zk5mjygV0JXnu8/qKTgdKGgFb2c g==;
IronPort-SDR: 4YNJctnRQh5CAun/n5enQjM7oquvPrOE3nkGFW+C5QqyuTdTfMuPC9ObswJdNtZwfXOZSP5M47
 iBPtDJ5kPm5b5SYNOuUKAQ4oE8q8nZ2FxIJT8P6gv9OeHvvG5/KH6gbbwAscyn4o7xOmg7CKr0
 jtoKxdwABk51IwBt/KNR8GAxr+yFheq2GxCKokyowKQ7NR10DGS87oI72liz3W2KnjsAvP2g2P
 zQWDZ1IVj6vcGosiDETTFL931i534FP9dlQ6Qj75JQ8WbRCsmrMJkEqLHGdpQpPCOjvKI/c+F5
 vTk=
X-IronPort-AV: E=Sophos;i="5.77,421,1596470400"; d="scan'208";a="152152907"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2020 07:03:24 +0800
IronPort-SDR: rJJ/C8JZke0ThawF2PuVIjlUTsSDKbnB73s5tnzsxw/p0QX5zEUP6q14uvBl6dU4RoaituDCkX
 n8z2GJl3XoFXVFB9aMQAACJSppt4l3VQkYp+g4VAc9icZSGARojUqMHmfIZ2GUtB9AoDv5tyj0
 q2xQFgoW//H8fhLERqeSoNYn04PByFAqa6rpWjZc2LLmNIyjNFqnHY5Pt/73yZyqdvLYuwrNUC
 olBFQjlaaXPsankbmZBSYN4NJX37cZjcNTKQ2CpkOEMM+CinKrHXsShQEx6J5FIysSY33/fvhQ
 ypYbSqAvYJ5rr0SpmaSNGvdH
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 15:48:35 -0700
IronPort-SDR: 3Ij9aVJeppLgiNBWU3i6/X2lSE43Hhk1vz4ATQcxpjVCxcKhKrhmo10TYjsLHqnNpODk0WtNen
 Jk3krrwCqPcL89Wud7ibOl0NwE8tiPXGwsV+VOBu7+XKdtCGk/wxHi26nHu4oq3DgH1BoSgD/M
 yerK255lPug90GLaMc/tBilGkgTn2lyb38VH4Cd9zyBbfIniEjmkrpqFWHyXEDr+ZTPAFpzKMm
 x+t6xCJh33r7HlknIojBzHJXHJZ+dw0Lj9+d9N04W6lg2IfrWFFKMUVNhjjU6p4QVZ/yqZzPjo
 I/U=
WDCIronportException: Internal
Received: from 8223p12.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.110])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2020 16:03:24 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] RISC-V: Initialize SBI early
Date: Mon, 26 Oct 2020 16:02:50 -0700
Message-Id: <20201026230254.911912-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026230254.911912-1-atish.patra@wdc.com>
References: <20201026230254.911912-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_190328_882682_FE50A426 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, SBI is initialized towards the end of arch setup. This prevents
the set memory operations to be invoked earlier as it requires a full tlb
flush.

Initialize SBI as early as possible.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/setup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index c424cc6dd833..7d6a04ae3929 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -89,6 +89,9 @@ void __init setup_arch(char **cmdline_p)
 		pr_err("No DTB found in kernel mappings\n");
 #endif
 
+#if IS_ENABLED(CONFIG_RISCV_SBI)
+	sbi_init();
+#endif
 #ifdef CONFIG_SWIOTLB
 	swiotlb_init(1);
 #endif
@@ -97,10 +100,6 @@ void __init setup_arch(char **cmdline_p)
 	kasan_init();
 #endif
 
-#if IS_ENABLED(CONFIG_RISCV_SBI)
-	sbi_init();
-#endif
-
 #ifdef CONFIG_SMP
 	setup_smp();
 #endif
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
