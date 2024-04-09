Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E435CCD1297
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 06:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qaqUbe/mgl89R9bQQ0Pj/4B7/pjWTj3d9c36p+vDRDc=; b=CKBhH7U8ENfMbQ
	cZbqib5lMaN9R+D2WRQSX3a5nmGvk/DdnzlORns/KTZCyyhzA/XnsTkh44pTdoe7dbsrDLWa9l0Sp
	TI+5TwCOX6mAE8/ljtZoq8gYsXraiYxXKrZ+TB4hS0wfmduRauaPlocPfUyoc9KqxFW9wIEhZCi9S
	QBFKexKp3UohzHYHvZ7/IXOZwiVO5vBy//VzTW9DazzkD5T/LuEw1lYTQ3lzBIHmvO59K7YEtSOqs
	PULy5U1iyBChDzd+xP8ew1BtAnkjwHW91Zk4ffTB+nm80dPyUBIR3wqca56nfDSq/EMKuhrCzs9O6
	wddC1uXIm0tqugrd3XYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4ig-00000000W7i-0hbV;
	Tue, 09 Apr 2024 06:12:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru4iM-00000000Vma-0O8G
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 06:12:17 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e3ca546d40so26859185ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Apr 2024 23:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712643123; x=1713247923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otFFuZ99fXcVhYb8FNCR9GjZzpzmViSqESgMKU4iT8s=;
        b=BCAudTk+Brd8Z4SIicrz0njxPTRGuVuE/I2InfUaQxb8mjkLHUTA5VufoqWOrzxaqp
         yz+IZeFi0REun3GluwQbmwNA6qqyjmSL95HulSvEsWDv5e3Ejrjo2jMzm0LDdslp2XNQ
         NLdX7KpFOGhBBd/Z83XiD7gFzZL5wbVnubty0pf7ROanzVmDOFBRpIdR3RSLpRjQV3wG
         M6AJxyWvj+uS5wmObT/AeQ6KrbP42pTB7zbEXqMsT4Ez5E319/30UIHwkicxI40WaBuO
         R5EWU/sAKVfU6z7b6300xIEhhMrj7XM+4wlvYAGULr+RkS37GmvOXgU+sdkXfl8Vc5O+
         8aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712643123; x=1713247923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otFFuZ99fXcVhYb8FNCR9GjZzpzmViSqESgMKU4iT8s=;
        b=Gbe3U92JmgF9TM64dcwb6MJ0PiSJfsXs2BxweqmBIt43qUa/Spk2ROobKFJ9ZIMe1I
         zgYlauyVnmYtEU/EKKfaclG6eJnafoha8WsaqOagEAoFjbRMWaLf6a66Fs2GqtrhmYni
         SLku26Jl43NDogntKYBgDLrUi6uPg0tiLVyOv26MHzLwqrN/AgkITghpuZiNE5mgrgoC
         cd4PEAl0hvwNs07c2nSslpv2iD+CQn/MO6FEWkGFfsIKyJh/+0ghDBHemBZTm1uPP+8O
         6+TW36yor46+sH690jg3E6QYXRxf/XbeuIEcc5a/zPawUDx5ZJOXn/yrQpO+2jdWl8Rx
         c7gw==
X-Gm-Message-State: AOJu0Yx842BQucifuRzlNNkuPB5bGfoR4I1yWVQu2WHr6xGQyBZpwqlA
	sHj6INJbBS2FDtIyzj/SOdLVyPiRncrisLVhYLXefV1q7IzQqBYQo4Q4v6xJkCvqj2JlE0bHReZ
	2
X-Google-Smtp-Source: AGHT+IFyiikZL/hhay4BjKgWK3lEvoskg6V/4zLFxKB+Bpw4p7lBdSTWw7dgsT6Vm8oj6bbr2fXrdA==
X-Received: by 2002:a17:902:c40c:b0:1e4:62e2:fc86 with SMTP id k12-20020a170902c40c00b001e462e2fc86mr3254513plk.7.1712643123055;
        Mon, 08 Apr 2024 23:12:03 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902e54300b001e3dd5972ccsm5775564plf.185.2024.04.08.23.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 23:12:02 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	andy.chiu@sifive.com,
	debug@rivosinc.com,
	hankuan.chen@sifive.com,
	guoren@kernel.org,
	greentime.hu@sifive.com,
	samitolvanen@google.com,
	cleger@rivosinc.com,
	apatel@ventanamicro.com,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	waylingii@gmail.com,
	sameo@rivosinc.com,
	alexghiti@rivosinc.com,
	akpm@linux-foundation.org,
	shikemeng@huaweicloud.com,
	rppt@kernel.org,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	willy@infradead.org,
	jszhang@kernel.org,
	leobras@redhat.com,
	songshuaishuai@tinylab.org,
	haxel@fzi.de,
	samuel.holland@sifive.com,
	namcaov@gmail.com,
	bjorn@rivosinc.com,
	cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com,
	falcon@tinylab.org,
	viro@zeniv.linux.org.uk,
	bhe@redhat.com,
	chenjiahao16@huawei.com,
	hca@linux.ibm.com,
	arnd@arndb.de,
	kent.overstreet@linux.dev,
	boqun.feng@gmail.com,
	oleg@redhat.com,
	paulmck@kernel.org,
	broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: [RFC PATCH 03/12] riscv: after saving expected landing pad (elp), clear elp state
Date: Mon,  8 Apr 2024 23:10:34 -0700
Message-Id: <20240409061043.3269676-4-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409061043.3269676-1-debug@rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_231214_592291_72CC0454 
X-CRM114-Status: GOOD (  10.38  )
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

On trap entry, save expected landing pad state and subsequently clear it
in sstatus so that if there are traps later on in kernel and sret happens
back to same mode, cpu will start faulting.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 68a24cf9481a..be07355b9eff 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -56,7 +56,7 @@ SYM_CODE_START(handle_exception)
 	 * Disable the FPU/Vector to detect illegal usage of floating point
 	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS_VS
+	li t0, SR_SUM | SR_FS_VS | SR_ELP
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
