Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3223C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 05:06:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445A564F4F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 05:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 445A564F4F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m5t3uCmarmuYAX5GGQeliR9425+ho0GBN960CIJh5hg=; b=OUfcNdkQ3I/o+f3/meV7bTqStY
	vvYsIji8uEbDUSPNmEBIhB+LJjtYRXgD4xrqtEf9rVtzNPoKO8JNt34UeTgFNnqfHpgPHFSHkkeup
	vTWwkgpUBYdimBN3ZvS94nwxHBswaOJaozZTCFI4cKes1OMTAHrTL5UHieS71csO8J7+W7fdstWg2
	pssNbJUiT04neDYa0MOApmvGEMalV+U6z2zA5irRjowmLps9mWhxh5JNU5HoeBvh4/Od75lqW6lQ1
	t0KoSbW3YiOHtq0DPy3rASMJI02DTUGfmM5xFYYvQSKZ9PEfn/wsndz121oSL9eIYpwBzdj1SNeGO
	kZ+QTM6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMONE-002TxE-2K; Wed, 17 Mar 2021 05:05:36 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMON9-002Tvx-DN
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 05:05:33 +0000
Received: by mail-pf1-x42c.google.com with SMTP id h3so289591pfr.12
 for <linux-riscv@lists.infradead.org>; Tue, 16 Mar 2021 22:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=74MWaAFPWeZRrJY/C5d35d6IGwQth/42igzA+G1JWys=;
 b=MGlPr2zNtZRWeH0WPOublJqa7uHznf2J3FG5zh7XjRx3S/ZeQ0KuQ5NQ3dS3AAqbnT
 /uJmhIvdium6Xrztsyx/YkwvWvPttDavnm8mmA7FBQ3fDtVD6QOFNnqW1uzRt5RoFEwq
 JFkW9Ys2gnzv6EItdJXk0H13KxkjBJLbeWCnQgLImGOw2yoodaX33yRLsWhTjy+1h/JX
 AQC7cWBzHXq0QMAUNTQonFITBCYf6wid1mA1ZfZcRot9q5XDH+s/U7m75NyPvM5lhx7r
 UpE+CDWBtTWQnFkQijdqLyyQIk2JXVmMxBELY9eb3EpV1TALRUP0oUpFjTsh1OYkp+QQ
 ZNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=74MWaAFPWeZRrJY/C5d35d6IGwQth/42igzA+G1JWys=;
 b=Nvz35z41mJF6c7SQULheN3NwhLIOB6goo1lCdaE6BYazHaYz83ESB0n2te7PenvSy8
 VMoDllV6b/AZ5Swg1EaDz/6MRBmdZ1x3g+8+CDhJt72N4jR9iB/tGW+Hfr289IZCNOme
 diJh9nxjxvU99ofWyu5IGYwC47zPyhAljsjPKorL4qCPpFlX8E3PjIchuEdKD1RB0FrS
 2x4X0mWgc3in7o+iq8kskSEKikFrztJo68sEFHjPMdt6qJGYi0OsBgAqlSgfBMvWAzub
 9cLoQZKECAG7sWbc3CUknwB5AIKVeUfAP0gvV2Y35CN761Yh9Qtx+IPWMcReUkFuBuq4
 g8+w==
X-Gm-Message-State: AOAM532rVFu9Go2gbIE9OzveKlafO/6+JIo0eIXQlzJZTPfL9abFxQEy
 eL5DdIwT1c8GGJNb8gWSuvcwwQ==
X-Google-Smtp-Source: ABdhPJwyAS37AVZmYTT26BlYGq3rImNXpjkfbo7T3Sset77tFACl1dGuMH197K5UPPZZ6GRFEWR1bw==
X-Received: by 2002:a05:6a00:b86:b029:207:8ac9:85de with SMTP id
 g6-20020a056a000b86b02902078ac985demr2671100pfj.66.1615957530001; 
 Tue, 16 Mar 2021 22:05:30 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d14sm1031270pji.22.2021.03.16.22.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 22:05:29 -0700 (PDT)
Subject: [PATCH] RISC-V: kasan: Declare kasan_shallow_populate() static
Date: Tue, 16 Mar 2021 22:02:48 -0700
Message-Id: <20210317050247.411628-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, kasan-dev@googlegroups.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 kernel test robot <lkp@intel.com>, stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_050531_813249_694FA2A0 
X-CRM114-Status: GOOD (  12.02  )
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

From: Palmer Dabbelt <palmerdabbelt@google.com>

Without this I get a missing prototype warning.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: e178d670f251 ("riscv/kasan: add KASAN_VMALLOC support")
Cc: stable@vger.kernel.org
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 5c35e0f71e88..4f85c6d0ddf8 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -155,7 +155,7 @@ static void __init kasan_populate(void *start, void *end)
 	memset(start, KASAN_SHADOW_INIT, end - start);
 }
 
-void __init kasan_shallow_populate(void *start, void *end)
+static void __init kasan_shallow_populate(void *start, void *end)
 {
 	unsigned long vaddr = (unsigned long)start & PAGE_MASK;
 	unsigned long vend = PAGE_ALIGN((unsigned long)end);
-- 
2.31.0.rc2.261.g7f71774620-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
