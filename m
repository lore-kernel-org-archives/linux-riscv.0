Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CFCCCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 16:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=81kiymOsKMLX3lXYkc+8pFEOATV6e+nWtim9XtZHZ+M=; b=KvpZTg4nxd4wHf
	biJrxYwn02r8JZkg7cqeUnsmHJGTK7HSsPFQy5m2+1IWIsoNrWDMuXY3xiE+dleRiRaXHCVPwAjUc
	OdKo8NAwk+/yAf9dTls5ZgkjlMOfgwslZdHREJ59DgkK5e9EaRlz0WoG0CKzXUmbBlmr8xLmYVfT7
	5xoWawm8Y7crG6wY4j9Qm5mtmiNpTFm8L8l51Z10DnDxXK6gLSTPnbshmwIYQZdJVIg+50MAdIL4L
	8psDQEX/J6KkkIJOx+ipJs/ry6ocr6RDMkOSbBuUlB2uH3CfWu9qb22sqIREmIbKYdUWGqb6tPzLH
	82FqlyGh3tstLpn3EHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8huo-0000000GzXW-0EAQ;
	Tue, 14 Oct 2025 16:30:22 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8hul-0000000GzWw-2ykF
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 16:30:20 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-793021f348fso5110517b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 09:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760459419; x=1761064219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQ9acaklz/P/nDwFY2BTOYnQh+KBD3+sU3KKAjNaoes=;
        b=SPwQytAbG0lzBpFiBpXQONtNrTTOduU6PMRScUlca566q5Q5mnAiG4KqfpMooyHEo9
         +aEa1LQpoTaeDhytt2mUt7AW25uIE/xqTUNVlEYuH1RC8Mi2WgbCR2DFE7WY0uSneGIx
         3N0SRD2fSWHmSoMqGeTwU8Iz/AScqOc1OfHLDIFPTss6xjj2s1oATjAJ61Gyi4hyHl9g
         ld5DgVKAyiROVk3ZOW9OGgTkYTV5bUvNj6SYt54z9xMYAayCCqKxGAOynYA9OLKcDnx7
         SxZLBIqYxksj/803YGLGfwWLeDlf4H84yuGA8PZ+PNd+g6xPujhTSB2Lj53WVbQiWC7r
         ENig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760459419; x=1761064219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQ9acaklz/P/nDwFY2BTOYnQh+KBD3+sU3KKAjNaoes=;
        b=JEFb+1Vpz20qoU2qTbogW13J96mrqejph3GA3xerhhqa6RzP6uGS9ObZiMHc1hL3it
         CMrxcJwnxaCyGOr0H1dUn5BumipTBw7tsmYCe8c0tuKfSzTNwa92yaTuivJrHovOPd3u
         VLyyu2pNqXUKPvkWnKSqt3tleV616NwLySDbBK8lVI6TKdHq5fN120tDXaTKV20JIKMz
         +MOPRjl9Gly3ZDk5aY56egr8G11ZTWF3uxxRHO5RonQ+W17cP10whWNNFNqj93wIvUSy
         Sjk7lj+mqIdZUUleC0wBTicCxBrs3IK60BN5w0XFA9qJGkbsdCB0RSB8jJIiRqx5f5pr
         xKng==
X-Forwarded-Encrypted: i=1; AJvYcCVleyUHtfn3Yumz1cEQwrVBXXZXXxAG6OyUlua3aR4jf21rz7eFuuuADzTYuUcwAEO7Uw9wDFYVLGl+gg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1vbqYIzTucahOcOn++wrBNjMbZkndEpyvf9PtEccQMEPDYXVb
	Z+66EF2LL+fakxr0rgteaJuE+cw7aDrrQ4IwjB4NbcrBXClqqXFYJRvdi0CYlIvAoMw=
X-Gm-Gg: ASbGnct+iuda2NUKkF5zKMOdzhYOte6I+1XxzKu2Ti0EI40vQhJPjcmBuFrE1AYE2nr
	NxY7nITJM91CH/B24shLxRL4cYSoYIuqqUSVdErKv/xfnGzEcG1yMFdYZLV+Ehztda1hfTA750n
	gitq4VkEwDAA0L/sOH5ujoDYq2bov9QIu+a1PRyLbvJHb9lUR0dvU1nFIyNUsDJxdKyHrAX+2PC
	829qjllXcdhGuz4DX5zmLdfzYSgk1PcCpPJezd2r2YlQ0R9GcQumbdu8IYTkaj3YqG8LQ88HIGs
	6To79fmE7ngRYQeNX/PQx50EcVmKIqJiK+dLp5iz1iAnowQ5rRhiFuuxMr2pWX8BR58zpswosWn
	m4wmafyVz6YjJVe7ieYrqKndlS2owe6emx/kGNVZE8IAr9CH5/nsLh+gY5AjNE7b5jT7E1emBr/
	02viKWOns=
X-Google-Smtp-Source: AGHT+IFKg+SoNpQ1p12OLoDHgMiJt2EKpjAPfsJVFpHN4o0hhnAyI7lP0r7N7cT4Fd8nYtzrUA8B2Q==
X-Received: by 2002:a05:6a20:3c8f:b0:2f0:91c0:1886 with SMTP id adf61e73a8af0-32da85090a1mr33776727637.59.1760459418636;
        Tue, 14 Oct 2025 09:30:18 -0700 (PDT)
Received: from localhost.localdomain ([122.171.20.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678dcbf919sm12478096a12.9.2025.10.14.09.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 09:30:18 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] RISC-V: Don't print details of CPUs disabled in DT
Date: Tue, 14 Oct 2025 22:00:09 +0530
Message-ID: <20251014163009.182381-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_093019_752327_ABA64CA5 
X-CRM114-Status: GOOD (  10.72  )
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

Early boot stages may disable CPU DT nodes for unavailable
CPUs based on SKU, pinstraps, eFuse, etc. Currently, the
riscv_early_of_processor_hartid() prints details of a CPU
if it is disabled in DT which has no value and gives a
false impression to the users that there some issue with
the CPU.

Fixes: e3d794d555cd ("riscv: treat cpu devicetree nodes without status as enabled")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kernel/cpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index f6b13e9f5e6c..3dbc8cc557dd 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -62,10 +62,8 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
 		return -ENODEV;
 	}
 
-	if (!of_device_is_available(node)) {
-		pr_info("CPU with hartid=%lu is not available\n", *hart);
+	if (!of_device_is_available(node))
 		return -ENODEV;
-	}
 
 	if (of_property_read_string(node, "riscv,isa-base", &isa))
 		goto old_interface;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
