Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C856C5321E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkmEPuVJqIfEQG1PYsVZ4Iim88opGYF3hEMaBG5dMfM=; b=Bfj9T+HGoHIZ/Q
	XgUOBQ9GIkeoyWKA6uBVHQrOTq8avcrESc9wFwmEZysXdjJQcLBJBuIgCG8BrUpLe5kdccqmPl+h4
	0UOxoUYTWdNd1iJIjiX0ti0VV9XcipDUEdCLh06kQGG7BeJblDzDPMUdc/2aytw3Pkz724ynDW5V8
	T5KryAkGbbK62NKO5tsnYUunjcQ+LwjHkVUvcSNBGqhMuB+gLuqcxwbJR68uW1zBQCCqfwLWoLx1W
	T/h01CR+dDVuDC3ordJKCIkEclrJEsTs11ce2vKMdeR2quz0MGNYwOGH4+1Voco2G4sXPjxc871yu
	9VSXwtGfH6L/oU1BkI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQlm-00000005olw-0uIN;
	Tue, 20 Aug 2024 15:27:38 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgQit-00000005nJD-3ukt
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 15:24:41 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2d3c0d587e4so3935482a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724167479; x=1724772279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcWMRJ0Y65fLMG5U9Pko1FotKijofEtRgUtr9N2ekns=;
        b=Jr4YMYI8QFwX0pAik/zvuK9uJk6+1Vex4+dLBqNqN0S71XMQkhTIhIscygPmFORwHQ
         TS/SkWKqppTnD/Mlq9CemDn1b/AT0WSU0ESdyeHAcfsbtnCkySAhd8Jl1Rr5pOIZbVDv
         FsJzrcOU/nF5D4hHCgV5r1HPp8ePnwCSkSr/THR9VcYhBeiwjIo0bWn+GO9PB2vcdTcK
         QpCI8I02YyF3vqXPrf9uniD2zvNgZIbcUln6wspWt8jK+GM2DbmQecv+DCVk9uOfiAHX
         BSKOsIC5k4CU2WaWd8GW+UrNYfIcEmhWHtbYOLDEvvwxgq3EaywR7xznsI9IeG21pcYS
         QSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724167479; x=1724772279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcWMRJ0Y65fLMG5U9Pko1FotKijofEtRgUtr9N2ekns=;
        b=UqyV06J0Jrmt5+OxyM+EPDSHqkg9hxNwY7vN8qkkUO0s/Uk3/iId84KITlUyIghwxx
         y5xvTcljvUW3MZ3m6uVJiIjS79AbrDQx4nhQLgp7hiu0/rk1y5YgC7nj7KRF0VpKDJyi
         2AwhAyW4CY61Sq2H8WPQQ/rWw1ninOkZotALK/QvWp3kbtZEfwVnB4SjggH6K/xZdOG3
         eWrGbOEc7sRKX9RX1nwwDFAgWThaLVmjzxXcH4K2X3YjMisCTV55Gh59odlBP2lMENpu
         rL7tbR9KSmngPaYw1RxzatdGi6o1ePuvE8W6CKqksyf65/Pk8ZzQ6gKDC+cAC0OaRloF
         mc8A==
X-Gm-Message-State: AOJu0YwiblFMdZQrZlpW3DBW0+zTtS1uJmriD915gdQDjnm1MNZ3xfye
	vu4b8qJa0ZFtfC7Kni39JydVwx4TPcpWyT2n9+YPSedKhU5pSLjk8/cIU0zxsU1NZ7d0kyWi1r/
	s
X-Google-Smtp-Source: AGHT+IE+Km4Z4Uzp0Ic/89irlMkCcLxwcNYIyvvdXIzqeBq5tarmpBAMzPn+ZBc205ATxzcUSAGINA==
X-Received: by 2002:a17:90b:1086:b0:2cd:4100:ef17 with SMTP id 98e67ed59e1d1-2d3dfff6674mr13170727a91.31.1724167478774;
        Tue, 20 Aug 2024 08:24:38 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d40bea7cb3sm7258157a91.25.2024.08.20.08.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 08:24:38 -0700 (PDT)
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
Subject: [PATCH v9 2/6] RISC-V: Scalar unaligned access emulated on hotplug CPUs
Date: Tue, 20 Aug 2024 11:24:20 -0400
Message-ID: <20240820152424.1973078-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820152424.1973078-1-jesse@rivosinc.com>
References: <20240820152424.1973078-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_082440_004278_32D65660 
X-CRM114-Status: GOOD (  11.00  )
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
V8 -> V9:
 - No changes
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
