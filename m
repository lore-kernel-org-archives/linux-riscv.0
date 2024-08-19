Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEF7C5320E
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Aug 2024 21:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjzoYMAsW3I5xQDm0SgmieFMJYcFURf7TojyiN0zpmI=; b=1VAKhciKniZlBV
	H/10ziaS8829faRT1soHKocQ5Gsp43XFBwdmG16oaOht+9DmN9a3P+AoWECwgaOEcwS7d1XnFnpt+
	ODZPU5KkW0jFk2XTagBwOQMqo+Hq+XGRxN2msmEwICmvYe1ACaKh78odGVKCXTsgculyR4WG/Zmwu
	KkyudPGyBlp7S0nt0VHvG3OeqLG0dw76gvzlNRG4I4cpZj8DdnLCRUhg8KKqjnz3ZnNZ6fkowKJ/K
	yFuyEI6BmB84ZQ3WTwbBxaFtrjeqaZDm0Q4CC2OxqvICVsAcxCbS2ZTTq81Yn0HtRqs9AS1epOkXG
	lGJ4GCQuAjxG1kF/4Sqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg9tP-00000002ypl-3APa;
	Mon, 19 Aug 2024 21:26:23 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg9tN-00000002yoi-01wm
	for linux-riscv@lists.infradead.org;
	Mon, 19 Aug 2024 21:26:22 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3db18c4927bso2777371b6e.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Aug 2024 14:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724102780; x=1724707580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TztiC5/1gr619POh5DAGrJTvEg+G+L5Qf1B2P2doR1Y=;
        b=tF7OXIbVZp9E3Bi07Ph2EICcpTUE+qcWoAeLElChAqT9MdkKKWDVdfOPwHjeQXkFnd
         i7y1OZ8hKaoF0QPjUfumObnREXjFgXaQVVNDB28GBNDlahOCQN1niJ4/5t9BnmLvKP/Q
         OtjgUKeJUgdmx6N+ZHuh6DIaax7RArKUqOgkmXdhtfYxn1CN2O1+U/xqTprZ1rI27l4n
         vE+zmq1QsAbFe6+03JP8pA0ZCpgMFyIBNX9fuK4snWbDaSQwc0C3GoQyvcwWEnzRllbw
         Y93SD3S48dZLnzMAVya+EthbcpH/m5GqdIzyeDtpT8h71O3fFC+rdvD037BVCorB/rwH
         BupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724102780; x=1724707580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TztiC5/1gr619POh5DAGrJTvEg+G+L5Qf1B2P2doR1Y=;
        b=TCax+zqg/AnSsdYb3ixliVg3Q49QBgMSPXmRWA5WVugzdJfal7WLF6Syd5e9RsANFA
         drKJ/nzUQooKCuqPA8UdSOGtW/tt32RCDuC6aKjA7IEWYEUKC9Xd3NXXY86298xZms2A
         aoXwo7COi+riZmXu13NqnBHYlbmhCvRq2+n1HEuG5Tu07KUWsxNR3LG9lmgQJskQ5RxO
         B60XH/zifwAm2f3JV0mM36kHvPVfXD3wp2K6fKZ2Y5Dt5IlIE4z8TZadYxbKA18q+H3U
         hAY6mkgsMnDQzFC3cDm2FglKzZEvbK3NOyyNVK4znWfPWYMVJn5LQwprT8lJH3mJg1Px
         hOGQ==
X-Gm-Message-State: AOJu0YwABZUqNMVbc0BcHnO9skalBViRCEvOYEwQPCLTMqmzGcpIRqOH
	0jCgj1BBiivvzWxc7XlVC6MtOHQXseMrQ3EGztyzGnhG7uNZpqg7g7/xx9K+q7WyvdSdYF5vboV
	E
X-Google-Smtp-Source: AGHT+IF5Ka5oo/Vsh95TOhJMsuxd1ErCS0kjAYsG9ayHXx5iEO+Eih/UfW0kpteVOEYBtV7XpNogrQ==
X-Received: by 2002:a05:6808:2e88:b0:3db:3102:adc6 with SMTP id 5614622812f47-3dd3ae1ec10mr15635770b6e.41.1724102779911;
        Mon, 19 Aug 2024 14:26:19 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61e7bd1sm7004694a12.53.2024.08.19.14.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 14:26:19 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v8 2/6] RISC-V: Scalar unaligned access emulated on hotplug CPUs
Date: Mon, 19 Aug 2024 17:26:01 -0400
Message-ID: <20240819212605.1837175-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819212605.1837175-1-jesse@rivosinc.com>
References: <20240819212605.1837175-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_142621_066815_23305D63 
X-CRM114-Status: GOOD (  10.82  )
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

The check_unaligned_access_emulated() function should have been called
during CPU hotplug to ensure that if all CPUs had emulated unaligned
accesses, the new CPU also does.

This patch adds the call to check_unaligned_access_emulated() in
the hotplug path.

Fixes: 55e0bf49a0d0 ("RISC-V: Probe misaligned access speed in parallel")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Cc: stable@vger.kernel.org
---
V5 -> V6:
 - New patch
V6 -> V7:
 - No changes
V7 -> V8:
 - Rebase onto fixes
---
 arch/riscv/kernel/unaligned_access_speed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 160628a2116d..f3508cc54f91 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -191,6 +191,7 @@ static int riscv_online_cpu(unsigned int cpu)
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
 		goto exit;
 
+	check_unaligned_access_emulated(NULL);
 	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 	if (!buf) {
 		pr_warn("Allocation failure, not measuring misaligned performance\n");
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
