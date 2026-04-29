Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CCCFF8864
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 07:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUduxOc6BeGIUS90pgUnhe4QT8sub217XAH04bdmbFE=; b=vyG00+Y7I060TF
	zARC+QWAPblOcMUIPhLKAjdXmFISETzAYYx1wVwFWTgQBc1CxgqVhTm1/fwjecUsPhb7IBxJ+Zhsu
	SqUN0h3PzXFl/Csy+79B1VeFRPLThux93DALiTkmm5IIoXbRfvxj4ihLpVYpAhxy0scapMQyn4SHs
	5e7Jeepuf9BbyMIWGhxGLwhhwZPAz5glMXAvPWmZdhuWyuvPcxUypiE9f3gWJ3a2137cJErksdAdY
	UVXYIgIx4emEXpHxj0/4QubRqE/j6c65M+wqHTFKr4hzB3vYaq2yYLiH1vedOMm75euxlA7hcLpHw
	V0kerxOU+ylc27QeowSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuL-000000036EB-0Zn1;
	Wed, 29 Apr 2026 07:00:29 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyuF-0000000368H-2t25
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 07:00:28 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-82f943870baso5218873b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Apr 2026 00:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446023; x=1778050823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=;
        b=LFudkao5oCag3MoYvIYD1ZXkeTmm0xi/P7AwIH3ECBG+HBIBIgN1sXnGBvSGEIrG/W
         zVDsCvZL+l+8BN9srixxT1QJTiK4tWWomzc0nM/biqmtoclbghnZ2Kiu3+QtrA+YkinG
         gbksMhzQPs888oq8is6Kn6PFxeREEvGigCCBCbt6rF/aodXhDkmbW2Qr29JMvy7CDbQS
         wCrY+n9hH7Y2z3BsV7vRPC2JIAeP6/iLhtLjDb7mtA98p5BgyTxhozKQSuda8IdGegKO
         Wr+wuk0z2m/tjXy84+2snBL9/U0zKTM1S94TUkJv/wIIPf3EDK1kiNcgd8/oHRG93PQa
         +Sqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446023; x=1778050823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=;
        b=DQ6vq/cW0mBXsd5gtoY9n0os5u1FQJOVsnF58lG1Srzju29ggYCX0adN4SHLCtkjue
         H1BzD7ZxhvBXcYUrLvF7mXNruY+PJdu+csSlN7zeM7NMIlDHTrqWFVky9NqY86L3SNHw
         boMKZXRm19AituMPJEfl7VsxOP9QunNf3C/9IHJSLoD9yfjyYctS3NBhB4cElGymFRZD
         e3Ktq2+Hd0fXWbNYRHmYNoSldRWn/LVb9XEih0Ld8PU+cOAKVZbPFNcaYDauHr67axGo
         vmE8hlqA3cspa3lgD3bEoA36i5B7FeasouT+STmRojxtKYddNgJgKRnYfe8hOMRwq4N2
         lLMg==
X-Forwarded-Encrypted: i=1; AFNElJ+WSkhINg00H+9wq6LWtf3hiP6w2IBHiw1frcfhkMwa4I6rlxnC0zgj3fJvXQEkamaY0MfQBNKZJxdN4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3KCrSEuym5GnZJVaY45pwor5ldEu0drkDE95OJXJO6I699JEi
	VYyVEd1+JJZ58a43RFuAF/sKvVJIelX8TKJ+fo9zPREaHis0Lfn214d0
X-Gm-Gg: AeBDietRpu7Km6Gdzmx/9eCKxdRPWkVa/L7WbNCJNSw0HG2+vLWX97i/G5L8igcxh2B
	1/rDFmc/cGEH4hgC+X6o0BuuCOjusVtje0qo2UB3aGMRxxKzgK6UUfD7TaQnSNklGj8v56DNLrZ
	Pl9rtv9I5gEE4SR3EAgYXhTTD0ouxsqUnBvwBLnhGsGUwHi7Qpi2+TVKJiWSCxtsrlrs6RWDILK
	uCoyl3VlnrcSYbohCwAKBtao6sDBFGqlXQdriEQObUAUT48l8FBP9KEwIdm3LbV0/OQmSeaaACk
	avNIp5MxaCatY/u5pmjkvvTY8m6/hAh0FUtubSfXwJej4uUpkPOa29VfnSX3X8bEaBGp4T3Iyq0
	UhPR9oMSsEB8vGmhrfEjGU6VD7EoHNae/1DN8MEAs7CIjfyWBflkVcg/gXZw1/y0+oeYu1a+B/l
	M8WRH2nIXNTS8Jl9dWwl7SFrvk560JXCH57IjhooppDnzO0rdn
X-Received: by 2002:aa7:88c9:0:b0:82f:b519:a5cb with SMTP id d2e1a72fcca58-834ddc50c40mr6750211b3a.37.1777446022861;
        Wed, 29 Apr 2026 00:00:22 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:22 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 10/11] loongarch: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:30 +0800
Message-ID: <20260429065831.1510858-11-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_000023_792913_7E5A1148 
X-CRM114-Status: GOOD (  10.00  )
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

Apply the same no-dump reserved memory filtering to LoongArch kdump as
was done for arm64. Use of_reserved_mem_exclude_no_dump() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_no_dump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..742fb9affcb9 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_exclude_no_dump(cmem);
+	if (ret < 0)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
