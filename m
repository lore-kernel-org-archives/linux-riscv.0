Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ACCCD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qxYF1frPyjh4/4DPVcLKQdcUh8Bl1OhhNS0gc8BDLk=; b=QEBPtb6Dr9Up6y
	xEXecoYZ+Xn0xPZzDerr3Q+3cto4BTtdZ2SKFyA/H8xkftYQ45NGj5LCG9mWe97ySaZkB7h6BFRFz
	8OWyMLSulrgMZW++crORRu6occcbs1tnn/vU7L1AWT6wXDKFaTCEzNGsQ8LCRiEr9XV6fKnUQ4y3E
	MVDV0FGNg68zGgEL2ysxn6EAiGq+dEm9SIAFEFiH2hFWasSbLE0FSbmxHBtNjq3uv7GsqtvyqtiLd
	IYO29psofPF0SR0xojAiu1RKyboog5qvfYRkEQSquPGfuLrdrIgTOPwXTKQ2TyzALB3SQOFp/1WUu
	kuOPzCAOTV1NFQ9PoK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5J-000000046Nm-12ny;
	Wed, 20 May 2026 09:19:25 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5F-000000046Jn-41un
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 09:19:23 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-835386ff122so4772888b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 02:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268761; x=1779873561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oyw9vanLGG7tQ9dBSW9pJHSWXBGqZj5GxnQmef6pVg=;
        b=F0BC7GrQ9gz40k05v4xdh2evvBiag1cSC9iop9xn53qN2aJDBmUbtCOjJ3najRlZBO
         dTNzh8HkZtfRBLlvnVYwXhVpwMwW6E+EaiuJRB1jUspZO4CR5ZcR55WE/ZdNhRfzdf0e
         CDL6n/IlvbaKj3aF2uFgKBiQrHDRey1tIDEBUqn6YhTETkiys5vX1loKSztemkzJbqAm
         2RhwGH2paqIZENTEISkaNSHa7Cc69EF8LL7yu/13cBVT99+WBOH2XnXs2drZOPppQ5vX
         gBgSVM4wKTS3xN17+JYpUtafJciJAwly/XBPN+GI1hGN2+Y5HKYmzjEXaDx7jcBMiMIx
         +EPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268761; x=1779873561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9oyw9vanLGG7tQ9dBSW9pJHSWXBGqZj5GxnQmef6pVg=;
        b=I2IQ2lLNRS3+9H9Xfjn0nb/0x0AyWp/fXNRua1aSggnAxUc3N314YXzcnZjT9a4aW2
         qeww6LGKTwWEopDG2mznoXUwC4+Bo6fa532CrhBL3Vp7LCFeJVWU3gW/yqsUVTftO7Ct
         wYGGPbSZI6E745mJPgHokfL2AtsA7YTBWLjduXplCQ9txf5fu4IQHCmMCtbhSCG1G7Va
         JWIxN+/oUZoiuY1AMNfyGrb7ABUXDU0SsI655tbhV+6/H4UR+vG24SVB47Q8DpIUrMkU
         4ucHz5YQv8zUjIkxu0a2FtBrGAZ3iHlMHEOBpTqqh0DLswAK1AFHGhnDpHE7qLJQkQRJ
         mDvw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZKuqrl8BcDjosCa59H6BYGSd2+xBQfHtuhwWH/xOK2TjK8gnpEUbhRwSRc9Vn3UoA9R82QuKIZponTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOA/aCuAe5w2s6xM1UadHU1XQfo7xqs8agJzjX03+2giFwjxMV
	kNxQmxCXn3PS8VlHOaOvH1Az4/N6u1Kfg+99COGvvbDL5o2fiZu4u5Zf
X-Gm-Gg: Acq92OExpuU1QsIrMFOo3t5OtwbWaZkRO5fUSt4LCov7eo9OaAmXu49Mb00F08olpot
	TsrTKYe383jO9r/aD+2lFqKrwQjKo24hQDRDc/hZcYMenWISVHjVCa1JWgGgBdCFLkeKQCgdrb5
	1d3d4ELYxG8MpeYuQH0y+rkjX4cSiTtEPshF0FokJfVxaCF4gbjTLT5v+K9j8iMy+lPJYcAVucy
	c4I1+f9PKn2sHYLe6K5yxf9bmeGcCTxnfeE36yu5403zXGWv/VLOo5s90Vwk8wdWJqXNOuV7Q0Y
	1WXHtfNa1hX7UGov0PSLbvtCOaNwvzOsNmCh9s7yrPP7OCjbWznbvwA2Yt8SUHARJfIW0yfK1Ef
	mv8MI8Rpz+29QPzUoq3ic51cJ1xvsSKYkrBwPihGP7L+KSR/Fnt3p0VKk7L5/24O71M9HehUwlC
	pr9O1ExjAv+vDkLYErU4vCwJzrydh9ppVtNDlDSQ==
X-Received: by 2002:a05:6a00:3289:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-83f33c9b2dcmr22248125b3a.37.1779268761111;
        Wed, 20 May 2026 02:19:21 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:20 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 2/8] kexec/crash: provide crash_exclude_mem_range() stub when CONFIG_CRASH_DUMP=n
Date: Wed, 20 May 2026 17:18:38 +0800
Message-ID: <20260520091844.592753-3-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_021922_001238_12C20058 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that excludes non-dumpable reserved
regions from the kdump vmcore and will call crash_exclude_mem_range()
from generic, non-arch code.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 include/linux/crash_core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index c1dee3f971a9..0033d4777648 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -87,6 +87,12 @@ static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 static inline int kexec_crash_loaded(void) { return 0; }
 static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
+static inline int crash_exclude_mem_range(struct crash_mem *mem,
+					  unsigned long long mstart,
+					  unsigned long long mend)
+{
+	return 0;
+}
 #endif /* CONFIG_CRASH_DUMP*/
 
 #ifdef CONFIG_CRASH_DM_CRYPT
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
