Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CABEEC677F1
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbhTv/bK+zcbKieCaywRtfOnV9nMeUjPVR5ehTZBf84=; b=HyXPVs95RLkye5
	XhXZXFHRrHfY2OJ2p6CbqU3aJaBSAwd97msYLPaMFViq0MM60PfTFNfl7p7Gmai1IXFKZYiYVSFGf
	DQsvxW6rUzARyHx92JIM6g+lakhAhrhWRTw041FszVdXV7MGQzKblSuQu0xWk9Cnvy48/fYuOTiiw
	kOCZeOWLvSvZP+5g97571WyfJAMWSHsCs3wR+CIXFUKErihR/sv10zG8gQ/Z0P7FJU4+47auFffmN
	KOrydoETXHQT+BNesSe//Uaw0u4OXQJVVLm3Tp4nn7PR1H0K9uTLRyjg8ynUafaJNxls2wbdV9fjq
	PK6je+0UvL4C4A+5+wnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5Ql-007biq-3Y; Sun, 15 Jan 2023 16:00:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5Qg-007bgV-OM; Sun, 15 Jan 2023 16:00:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F98A60D3D;
	Sun, 15 Jan 2023 16:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1EEC43398;
	Sun, 15 Jan 2023 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673798418;
	bh=srRoyMhEcGCbVrLyfi/YwhTea+Yq+TgoCP9PTzDvRWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MpnGDQ04OAxYVgyGtooAbRxxt9PEeVpXwJPSRQ2liEurc7alZEU6/rrEi50L61iYv
	 rfXDcIptC//n941IIJt1VhadgTLQsDDAfC/gxheWbaLymMxUwiRnhrvp9pxlfuQ7rv
	 aQ4y/v+HH3G2hgcOZe/v4U2w//obZFm0TnPtLPwcLuqWPqKwPz3jfuJC/4ugAksm6L
	 OfYVe3TarbXuIR+nosCvr68n60AbEf5IWLIfc/rSqSSBn8quIhjFMeGGUpHfrapveG
	 2YJ0vutmWaQiC0EKiluwuesm3vV7SctyENxAhK9BJ2ymcooEJMpIRFZ5NGkGWhWnWf
	 LDxLFwXyF9fWg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v4 02/13] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
Date: Sun, 15 Jan 2023 23:49:42 +0800
Message-Id: <20230115154953.831-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_080018_855377_A23DF11D 
X-CRM114-Status: GOOD (  12.27  )
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

It's a bit weird to call riscv_noncoherent_supported() each time when
insmoding a module. Move the calling out of feature patch func.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 1 -
 arch/riscv/kernel/setup.c      | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 205bbd6b1fce..421b3d9578cc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -297,7 +297,6 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
 	if (!riscv_isa_extension_available(NULL, ZICBOM))
 		return false;
 
-	riscv_noncoherent_supported();
 	return true;
 }
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 86acd690d529..376d2827e736 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -300,6 +300,9 @@ void __init setup_arch(char **cmdline_p)
 	riscv_init_cbom_blocksize();
 	riscv_fill_hwcap();
 	apply_boot_alternatives();
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZICBOM) &&
+	    riscv_isa_extension_available(NULL, ZICBOM))
+		riscv_noncoherent_supported();
 }
 
 static int __init topology_init(void)
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
