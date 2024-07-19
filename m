Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377FDC3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlONZIwWlaTnvIBmwfFLo2uDX2qwO/rX/CRSmX/raYo=; b=nmN14Dhf9a2dwd
	JZ5xXRKvX4WYebaLllxH2e7Hta7kcoXewveyOJNHMznmDWniiSrsFd5fcIfgmt6t3K4tNLTT8EvZ2
	dQz5sQlzUo1kcYET6vLheYvZwvNvff3PX/0ZxBim7INDCsJty1OZwPIk+DPIZIPIrrZ7FuKsrP232
	u8ZQY7rw8u7Gk+n5y8ULr0BLYxlCB8rLS/3QfT22z/f5pqyTzn2EmUs+zmJgHkbupJ2cfF0rpWi2f
	3ulECZ43qwaJRIdigCYqGcvPN7edYS5vB09yTWMLWm/TaY7UsRp04eyEVzXGRd/BWB6SwO/R6D8Xu
	ku5ZGzjozbsKWDaloSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqB8-00000003BRW-318l;
	Fri, 19 Jul 2024 16:09:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqB1-00000003BJo-1dLG
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:09:48 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fb3b7d0d56so13757395ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721405386; x=1722010186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvm3hpKvRW81Dir7XpGK5V4AZ1ZJAiyVeCH2mMtrPq8=;
        b=DinHFzDy9oTST9xsnkx1XVO3orY5VMxbeLCYR+RSIz5bjxD6N7vp6G93bzJiFg/3Hj
         LB91qFbPtZ8P1jn+c53SzBFW0hLAvFbBkust8zUyAGfgyutU2hwvpNp9zExE1dgrMuu1
         E5rhYFz3DcB2KM9jRlYZtpwQrvEtASncc6DfYPaMGew1NTx0cwAxjB6gymZ54bUK33on
         yPkdLNDGlODhNeV8edunwpKw69Lfqwa8z3sXRkRA0GmdToGnsBwtP+NtusS6OXkZYcLZ
         SIOyCd6wdHyRLXzYJCLXciXt9m7eCjJX8ooBTHqJHPOcG7l9ZlSjc3KhfdAl65cy4xDu
         ZVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405386; x=1722010186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvm3hpKvRW81Dir7XpGK5V4AZ1ZJAiyVeCH2mMtrPq8=;
        b=JyTDPziJ+Qwy7ASZETzJNKYUBcOXIG6kZF0aOmPsgFmp2niwN2U1N9kqPWMr3/yG5d
         FnZ9DyirhJikIh/L/K1yLIoMWPaq7ucrTHSoykJaG+JLt9qby/dIk67hB2SZuFyugcuq
         7JWKPNd8NjsqC2pONxBjPif7QZ0sUVIgyRNhMCT4ioct8196U/mMt/2fhHtDvXgal7Fs
         fNx0v0odOMfi6gNi/sisYyi3dkGT9X4JdhtQAZQnWuAHNa7FzS/Axo+7aAAAzSlrW9/X
         vdKC983u+XOk2IpyGDZiB43nePP+1LtHWTXmsJKdXEPq4GBn/Z4l9WycyG70yfQmh26d
         eZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/ftBM+QKJ6w/8b9U9MUe7nORW+HxPcSBrm4RVPFXUpk2WPHo45cQr19ssov6lYvcd5WSStSv1dWKDSN9X8ufzHp1I1c0LjJ55Dq5YhfDp
X-Gm-Message-State: AOJu0YwOFpHEx3aFRaFn+t83Abfu0GQ5VGA4edSA7juOnwXq3OiOt1gF
	wABYi/FvZ0NUStP9Yj/wn8BKnvJi3Y4S8b5O+IT4ij0L7dcNkDwdyMQzdw50ESc=
X-Google-Smtp-Source: AGHT+IHTBp6zlsH1hrlMfviNDvDhBwVMm6bPyuRntoKMRuaLAxmrocV1MrWIWDQcyMq9zx2+n0JCxw==
X-Received: by 2002:a17:902:dac8:b0:1fc:5e18:f369 with SMTP id d9443c01a7336-1fd7459dd67mr3483245ad.23.1721405385835;
        Fri, 19 Jul 2024 09:09:45 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([223.185.135.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f518sm6632615ad.69.2024.07.19.09.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:09:45 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 06/13] RISC-V: KVM: Don't setup SGEI for zero guest external interrupts
Date: Fri, 19 Jul 2024 21:39:06 +0530
Message-Id: <20240719160913.342027-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719160913.342027-1-apatel@ventanamicro.com>
References: <20240719160913.342027-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_090947_451028_26A56F43 
X-CRM114-Status: UNSURE (   9.51  )
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

No need to setup SGEI local interrupt when there are zero guest
external interrupts (i.e. zero HW IMSIC guest files).

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/aia.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 17ae4a7c0e94..8ffae0330c89 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -499,6 +499,10 @@ static int aia_hgei_init(void)
 			hgctrl->free_bitmap = 0;
 	}
 
+	/* Skip SGEI interrupt setup for zero guest external interrupts */
+	if (!kvm_riscv_aia_nr_hgei)
+		goto skip_sgei_interrupt;
+
 	/* Find INTC irq domain */
 	domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(),
 					  DOMAIN_BUS_ANY);
@@ -522,11 +526,16 @@ static int aia_hgei_init(void)
 		return rc;
 	}
 
+skip_sgei_interrupt:
 	return 0;
 }
 
 static void aia_hgei_exit(void)
 {
+	/* Do nothing for zero guest external interrupts */
+	if (!kvm_riscv_aia_nr_hgei)
+		return;
+
 	/* Free per-CPU SGEI interrupt */
 	free_percpu_irq(hgei_parent_irq, &aia_hgei);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
