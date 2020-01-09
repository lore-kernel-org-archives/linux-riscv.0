Return-Path: <SRS0=HO0W=26=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FDAC282DD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2020 19:27:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7142072E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2020 19:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VTw3Dij4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OXQL6TqO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7142072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hhlS5r0bHcUkFdk5r4BVFKnYQHiudb5I1GHAOOKgB40=; b=VTw3Dij4enjMTzc23dOhuvHYj
	D9EJrZ9MRLf8y5MKLPkIQXI4CBmq5rQizZpa1Aw5jubnNuP/087QgRPwrQU37FRZ1nRuXE52VRde+
	zitpigbpyDkHydC/PgrSJ3NczWDuBtcOc6KbVtDpBvdQ9aNOQgZKbtrcekRO5mRMwMlFeXfeueO2J
	qPxVA39pt4x/MgbePD5GtLxqDGhiogN814jIQlOS6X9FFI3othn+aVIaNku1zhFwPtqL9AHX10wPa
	PsqDPv36dO6ll8CB9LG+KBiahDBWgCuLQ/kAT/dn0XGenOaofkY3FwhVXhw3EGA2SpJIdQQ+BrH/S
	VmNUtTeXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdT2-0007tH-UB; Thu, 09 Jan 2020 19:27:40 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdSz-0007sR-MB
 for linux-riscv@lists.infradead.org; Thu, 09 Jan 2020 19:27:39 +0000
Received: by mail-io1-xd42.google.com with SMTP id t26so8355637ioi.13
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2020 11:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=hhlS5r0bHcUkFdk5r4BVFKnYQHiudb5I1GHAOOKgB40=;
 b=OXQL6TqOfK9AYq+qp/IIHZ51ORk5NHJuC80QvHGf0eH7391hSSOMhSUVsKxOECZ1Xb
 evk0+LG9ftbTBkXGZ1DD631eY/JjGmSGm7UacSVkcBEbItf5Y4z2EhE+Fi3QEb2i7u/O
 oTOMXPChAEBWTAz4KzB1nt2CpHssKGqQBE+EKGNoi6FyJzDAPa98BfSh6azl9x5uDM+8
 htkiK2DYhbtIajfd0RAh69nNtSctG0QTQYL0Fu2qV3Gkkryn+RkR3dzBtOSBmIqAFovY
 dqn/e3Gga1WudhoNgr3YtuXKhKInwC1f6xyEHKKhT275NFyj2m1enMhI0NeCuuMCYJq4
 O6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=hhlS5r0bHcUkFdk5r4BVFKnYQHiudb5I1GHAOOKgB40=;
 b=OCz2PKjYbOqiZ/skDZ0oXQ3IEQxKHQnypP+hRrDT71jRj/6HbS9kK+iH+F2yr+wsv2
 JazH6bhLzaxoKsMMB2CNcZd1iGMkHGFyx/+/0OkFXZExcRWp/dJeBObFxTmpkAkaer+o
 756+TW1saRkawqcpdNaxm7rwNTuDTbiaPMihp3RG2dBv3L5EJX37yISf/5PFeCOx56ED
 gQFxjXBuk7E2vSUQsMLvekf+SbFvsCJ07wb+Rs6kt+8h3Cr4URSBxh7ST7XNBIfegiAf
 AUKvsHBIHYVqsq/QBJDOpbpFClTCgeQBclt70wffphkhKDTtcEkCHX3DGH0SHY13arii
 cj4A==
X-Gm-Message-State: APjAAAXqwJm+XoebNODpCPymuOfBGb7hZi2nZaz7oSYCa7ZnstLhkMX8
 KXP2plQuSpl/Dp1tYWZhK2k1VA==
X-Google-Smtp-Source: APXvYqxcpU92uMnaGwE2OGRBS2wn+iEnI2X56wCEWoY2GoXzqyILoN6ceTT3kjQAVCD1sHEZ5Np8hQ==
X-Received: by 2002:a5e:860e:: with SMTP id z14mr8850594ioj.10.1578598056639; 
 Thu, 09 Jan 2020 11:27:36 -0800 (PST)
Received: from localhost (67-0-46-172.albq.qwest.net. [67.0.46.172])
 by smtp.gmail.com with ESMTPSA id e7sm1641950iot.71.2020.01.09.11.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 11:27:35 -0800 (PST)
Date: Thu, 9 Jan 2020 11:27:34 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Greentime Hu <greentime.hu@sifive.com>
Subject: Re: [PATCH v3] riscv: make sure the cores stay looping in
 .Lsecondary_park
In-Reply-To: <20200109031516.29639-1-greentime.hu@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.2001091126480.135239@viisi.sifive.com>
References: <20200109031516.29639-1-greentime.hu@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_112737_759719_70CF1BEC 
X-CRM114-Status: GOOD (  12.11  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: schwab@suse.de, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 green.hu@gmail.com, anup@brainfault.org, greentime@kernel.org,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 9 Jan 2020, Greentime Hu wrote:

> The code in secondary_park is currently placed in the .init section.  The
> kernel reclaims and clears this code when it finishes booting.  That
> causes the cores parked in it to go to somewhere unpredictable, so we
> move this function out of init to make sure the cores stay looping there.
> 
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks, the following is what's been queued for v5.5-rc.


- Paul

From: Greentime Hu <greentime.hu@sifive.com>
Date: Thu, 9 Jan 2020 11:15:16 +0800
Subject: [PATCH] riscv: make sure the cores stay looping in .Lsecondary_park

The code in secondary_park is currently placed in the .init section.  The
kernel reclaims and clears this code when it finishes booting.  That
causes the cores parked in it to go to somewhere unpredictable, so we
move this function out of init to make sure the cores stay looping there.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Cc: Andreas Schwab <schwab@suse.de>
Cc: stable@vger.kernel.org
Fixes: 76d2a0493a17d ("RISC-V: Init and Halt Code")
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
---
 arch/riscv/kernel/head.S | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 797802c73dee..c9cc44ef7184 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -209,11 +209,6 @@ relocate:
 	tail smp_callin
 #endif
 
-.align 2
-.Lsecondary_park:
-	/* We lack SMP support or have too many harts, so park this hart */
-	wfi
-	j .Lsecondary_park
 END(_start)
 
 #ifdef CONFIG_RISCV_M_MODE
@@ -295,6 +290,13 @@ ENTRY(reset_regs)
 END(reset_regs)
 #endif /* CONFIG_RISCV_M_MODE */
 
+.section ".text", "ax",@progbits
+.align 2
+.Lsecondary_park:
+	/* We lack SMP support or have too many harts, so park this hart */
+	wfi
+	j .Lsecondary_park
+
 __PAGE_ALIGNED_BSS
 	/* Empty zero page */
 	.balign PAGE_SIZE
-- 
2.25.0.rc2


