Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23DCCCD186
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHsSoeZvzMqNHGuzXMXR8uHD4uavmBYs3jdJOufGKww=; b=Ol5tI3EY5xeT3D
	8BIBvukIlVWNYDuOSP7RCjoDrC5T335x0qZpkjNXSE8p1KrgAadkI217mvLqVJykn8Zwx5ZIsW665
	n6lcemYxhpYgr62kHmbvL5Tq0X2lRwkvpdyBTQATrv0qA3wgm4oVQ9eEQHDyvumI9DJZDPXZIy9Ng
	VgSy5q1le9cE2KeaxdCixS1TaJoAafBVtGb775Tg+cU/BidF+dm+wAH0EXvH4JDRH6nNG7ZZ+u3Gk
	esNo9/JSMPSj3TryBGWfO9cnsdBaTduNdIkOPn/pBul4pGFEcVwHeoTuhSE0etFDHXmRjdgNqvpOO
	znXV5DITsu9AzPCANmZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LL-00000001w6N-3lP3;
	Tue, 07 Oct 2025 11:58:59 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v66LI-00000001w3K-3leq
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 11:58:58 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-57e36125e8aso5685330e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Oct 2025 04:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759838334; x=1760443134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ut4udALSNwNlfbYZc3Tgg1u2DqNTE4rygUYw4A2JFg=;
        b=a9K3eL7wWz37grMrRlBPOwiA2Rt4rR1TLkh56mzLoQ1USn1uZRfxXGYZs1BwFugXGw
         QXs+mWtevE8eoPJiyiAnzKoINWFef76Rhm/Ft1GlIkrYo88vU8pztJYvcgVWNiw4EXAO
         wOFheMa1hPxL4EHJsP20RIjmh8DA/0CgUxWq3ZEQQGQYSgdx32ANRYWLvF/mBWP+UMd0
         nxCJk62D1iUb2wcKJE22Due/P66y3bKxSoR++mzUT7LJkIKeuLoPR7jTZkFrAIakl2sh
         917kzpjLt1i3Ho/Y1IV3QFKEMelPQXdr5NjsjMbJNZFOIfWdeb6O2yylseY2WeaIIhf+
         ndHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759838334; x=1760443134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ut4udALSNwNlfbYZc3Tgg1u2DqNTE4rygUYw4A2JFg=;
        b=FGLxkOf2UEaVNNZhsEGWLmK0j8vNc2S2fkuVBesTTtipixt4qKDF5ZC70QHVSi7oI+
         /WtBuZ8cpsvuPb/i6eG0sZiTCZjeQ3TAG0oMm0gLX8ZQolpiKdCJTUC1BFvGXT76m94m
         KuJ/i+yo7uJTqWkcCUQ1pyFE/HLgE7B1HRUYt+mqwcCAD5KODpWYOJsO6qFr1AmNVDWD
         jrKsmUWSHxhDxNJ9EMvEHoES8h8qEoQSZVWtJoCx5FKwk5aO7bzX4WY3YvcmBFy6XFN6
         JKjJpTT7dEiYZ8fAEXv5Rfs4M49/qWoyxpyl5HvGaqn0TjcjKT/AJDgM80B//1yPqJ19
         xgAw==
X-Gm-Message-State: AOJu0YzIhrNyqV4uOxkAImHeZs+DR9BBjn5PE7sIW20KPjvVUPWLOSKS
	tlUGstqBuWR0vIBM4EkRojrMsz+pAdNYqgmefbVeAtUuqgiV7lV4ahgbO56Egso4
X-Gm-Gg: ASbGncvyUhbqEkmEW5bnx9x/zgRwEL+86T1yK68RhhhxpeGpipNb9vLGW10ck2RWryl
	AoWnZCuGt4rVIaykBwx3kzi9P9mYZbhtC7jAnM0vMafYPtZGQREggTPgMRBScdQjI4DiLAEGQQh
	tclJmHVVCCs8LbEH2lDYoYnFCcGsSjofwPCImErRd2pK2LjJnmw8FFyrZ3v8eEOUodM/gG8RQGF
	Ia5sKY+5ob5kKxAJv8mSDTJmRt69e6xWiayfElhlgTFiFy+XmKB1ZHMJxiS7+P7HSnroFo9Q9pr
	zKRRWHqd2Al/KLfmTFt76jIvRQcrEkpXawaDR28Ri/+wQtWcNXLB3cgrEMtSi8Vb8PqptlalJg1
	/kszbtD+Kk/W4l4Eih9/gcSP++GAtWgoppMZBkw==
X-Google-Smtp-Source: AGHT+IF9hiTWhCe1Oqso+uN0BybHSEh0X/p2CShjwG4LdtO5K/sFgcxScdEgvNjZD6t+gVwSik5F2A==
X-Received: by 2002:a05:6512:3a92:b0:55c:d62b:d0fc with SMTP id 2adb3069b0e04-58cb96631fcmr4719071e87.10.1759838334241;
        Tue, 07 Oct 2025 04:58:54 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-58b011a8941sm6043339e87.114.2025.10.07.04.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:58:53 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nam Cao <namcao@linutronix.de>,
	Joel Granados <joel.granados@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v2 6/6] riscv: vector: initialize vlenb on the first context switch
Date: Tue,  7 Oct 2025 14:58:22 +0300
Message-ID: <20251007115840.2320557-7-geomatsi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007115840.2320557-1-geomatsi@gmail.com>
References: <20251007115840.2320557-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_045856_956754_E6F48ABC 
X-CRM114-Status: GOOD (  11.02  )
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

The vstate in thread_struct is zeroed when the vector context is
initialized. That includes read-only register vlenb, which holds
the vector register length in bytes. This zeroed state persists
until mstatus.VS becomes 'dirty' and a context switch saves the
actual hardware values.

This can expose the zero vlenb value to the user-space in early
debug scenarios, e.g. when ptrace attaches to a traced process
early, before any vector instruction except the first one was
executed.

Fix this by forcing the vector context save on the first context switch.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/riscv/kernel/vector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 901e67adf576..3dd22a71aa18 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -120,6 +120,7 @@ static int riscv_v_thread_zalloc(struct kmem_cache *cache,
 
 	ctx->datap = datap;
 	memset(ctx, 0, offsetof(struct __riscv_v_ext_state, datap));
+
 	return 0;
 }
 
@@ -216,8 +217,11 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 		force_sig(SIGBUS);
 		return true;
 	}
+
 	riscv_v_vstate_on(regs);
 	riscv_v_vstate_set_restore(current, regs);
+	set_tsk_thread_flag(current, TIF_RISCV_V_FORCE_SAVE);
+
 	return true;
 }
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
