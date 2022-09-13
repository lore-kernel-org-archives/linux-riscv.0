Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F54C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 09:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3KwyD+Wc5i/T+y38X5DTxAcSmtx5z5Ck4xRhRjyiCQ=; b=W6uZ3P2tInQaOG
	pAkKvLBQLkaXIRdSMQ9wfAmGjnBJ2mKX9Gs/WLwLbIi9wQo61enJzjmIhzDrYDEmSp1wnYm6WpaXB
	8K/M1ETxmgK+LV3Wlr7sPW3Nrnt0Wzlc/OVrOa6zBoFnFfWN593gH+w6rDO8mpm9wZO57qwFeMkNk
	FQ+B9ywAttot5as/LFMEeXHqC0BM5oEit3L++ROJTvA/EVLZLoFWuNRROxKuOQcxJ1UT+v+lGPiZW
	sEQfKi9AfhH6ICjuISLRzfBTZGOMDYJJVNOba7BvHJzqXlWIVARwlNWLbVB108S4BU/KjVmazPc1I
	EO5VX8nl0mPtlNmYyTYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Sg-005Puj-H7; Tue, 13 Sep 2022 09:44:10 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Sd-005Pmd-8M
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 09:44:09 +0000
Received: by mail-pj1-x1035.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so15062519pjm.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Sep 2022 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4fh/qa6HnXSgDnhm0JxBkM8k5ZkulWvzr+Zcbwg4RXM=;
        b=atqATK1ZeKCXMBWbzRSUgZxYFGHp05djysHzKgikLgiiCCAE7Wy49eSm6GpiG0ddXA
         02yKToQnlyT+vZx+eO0iS9WvdL0swqUwfC7jzg1MzQ2USnlHlGy4lcYAW6p1pS55e9Cz
         zlqfINSBE8nlQ5fpxgWmGdWtwiT5mwVRZDVmh+izffkfrZtrXPiaJ721mUbJGuH/dGyG
         3tuLeZcefLniEB3fs7k25kshkrYRgkvW1n2O14FsWV6eOHmb6QHQMLggzMt7aVScisjn
         MNLqQUQQZENOWwVxrvJD80Pm5WygyirFTdhH/IAlT96QSquZoOYwEG5eRcVU8GmNRJiA
         oLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4fh/qa6HnXSgDnhm0JxBkM8k5ZkulWvzr+Zcbwg4RXM=;
        b=D0jIvNoz8RPLefWNJ9UkmptafbwUd5of0PxDtdi+AhECDdYry17jooBRubG6ffLEDu
         gcIKQmOCyqoufFUyDmbBG2kyP6K9jPFmmPUbFmArcHhrZ8P5ulEVM1/IEg1nEQD18P3T
         IB5AbLHbBkKsj0b1lUWdE6BnLgReggr8TV1aHNf/I/KpHHvhVl+1c5KgrTuGIn8OAACV
         LGEhHTiyj+ocZvuI1Z5EOuzr3fbFQodJkxTSyzfEI1Uq/I7kBghuYD1glIBzkTqa/hV5
         3vh1uDkc3mF1P0VudJTUxYVaPWHi9xRSnyZjZr8NdXWX0fZ65A5dZ+A92ZSobHkfc6c2
         pb2Q==
X-Gm-Message-State: ACgBeo03CA1R9vBeDtBtk7GN/thD1k56poTD019kFpVE5Sy8/q4i+DsM
	MOesX5EUddj5NfeQ+MnzZyDvZw==
X-Google-Smtp-Source: AA6agR7Pv3IcOLIeJnL43KewnHQIjqtc2BlvZp1mv+eRJYsZ8Q5h0RGSnQndguMeGFjCJF2Ccsp7ig==
X-Received: by 2002:a17:903:2442:b0:176:c8ee:a5d6 with SMTP id l2-20020a170903244200b00176c8eea5d6mr30237049pls.20.1663062242603;
        Tue, 13 Sep 2022 02:44:02 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79e1c000000b00543236e83e6sm4904428pfq.22.2022.09.13.02.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 02:44:02 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	ardb@kernel.org
Cc: greentime.hu@sifive.com,
	zong.li@sifive.com,
	andy.chiu@sifive.com,
	guoren@kernel.org,
	kernel@esmil.dk,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC v2 riscv/for-next 1/5] riscv: align ftrace to 4 Byte boundary and increase ftrace prologue size
Date: Tue, 13 Sep 2022 17:42:48 +0800
Message-Id: <20220913094252.3555240-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220913094252.3555240-1-andy.chiu@sifive.com>
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_024407_328996_FB35FC0E 
X-CRM114-Status: GOOD (  11.57  )
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

We are introducing a new ftrace mechanism in order to phase out
stop_machine() and enable kernel preemption. The new mechanism requires
ftrace patchable function entries to be 24 bytes and aligned to 4 Byte
boundaries.

Before applying this patch, the size of the kernel code, with 122465 of
ftrace entries, was at 12.46 MB. Under the same configuration, the size
has increased to 12.99 MB after applying this patch set.

However, we found the -falign-functions alone was not strong enoungh to
make all functions align as required. In fact, cold functions are not
aligned after turning on optimizations. We consider this is a bug in GCC
and turn off guess-branch-probility as a workaround to align all
functions.

GCC bug id: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88345

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3fa8ef336822..fd8069f59a59 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -11,7 +11,7 @@ LDFLAGS_vmlinux :=
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux := --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-	CC_FLAGS_FTRACE := -fpatchable-function-entry=8
+	CC_FLAGS_FTRACE := -fpatchable-function-entry=12  -falign-functions=4 -fno-guess-branch-probability
 endif
 
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
