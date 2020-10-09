Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE303C433DF
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36332240A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ykQ8cSML";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="W+1iEf1Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A36332240A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bUQqLiTe6ENmwM4RRqizrnBDLcFTB0lgEXDOzwGIubY=; b=ykQ8cSMLgJaRcZL8c2gPiz9BL
	Pj9VP6Z5TxYiIjzohsnAToP8CEFqbL4mmOOc0+P5fKGJQxPCiDzAn+FANAm6BvcO3fWf/9tADU9ZZ
	X9J5VavQjKcGwEOCNcKI1irXOX+G32USVuMmeNo+YX+VbtdeS9stULFvhkxk0naYcPHYueJDqMXfn
	TaUGXiQPgtaETg1T3Y/GbYUUx3j+Eti+BL5omaga1Hc5NrnM3cYT4xvil9Wvh0Ff8xE9AxKV25xoB
	0LVoC2huk8CZ4RD8sE0Loguj7iHLGXDr4yJ2QHjTG2bf01m5nXabQUP50kC5MxKeNQUYbopDZxjmQ
	FEP+lWuOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQziF-0004sz-2Q; Fri, 09 Oct 2020 21:14:03 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQziA-0004kW-Fk
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 21:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602278038; x=1633814038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CEOo6JngBKtDuR3zNiPVEE237ISONrVcfU90kTdl4dc=;
 b=W+1iEf1ZTinqJmyI4y91+U0AkcOLMBCKxWVmMjMdaD6Mhf6zn5riUSA4
 Fv1jIW2lg5d62x4mU496TbDpZjISu7Fv+2OEHqnFcqmCRRERi66EcbB2B
 tcgE4GMpxjdgcjLFeBfvIU2bZIlSMXm/YhLYavVqwRD/hAmYLcxHVyaAD
 7obteQ6Kb7BEtQZN4vy5jGe/MslbvAj72pXhv+rn/fHy+gzL6eR4Bgyrv
 VlxnXvDYn9zpn234sdmAKkFLqbmomLcgaMGhbnF68rRa/rFrQFzDBe3/B
 lHas6PFVYK9uKorFuNZWixXdPVh2N/kBhPmDTyMiIFpC4Aa0lipJWqchl w==;
IronPort-SDR: dgsg4SF3LsGIKlWIYEAbCNDCNRRzsh17JfSTlbYFd38MxytTq1nSc1bf9tq7a39tktp62zE9Su
 vfNpFSqqjGazGNqFkJd2dNikk9NCYWyTCjOqD0OrQD+H3UIgrn/G/uLyQqKyaFUJlAMOxNN67A
 y/hgJcO5bEfOhOluJ5pCzlzOL0sybzmxYnmmTg3xB4u663Yalq2ZgLoiTzwyeeEmBbhtjggnT0
 GAoy++nKj8W+Y9j4EiR+pU88GNzWeLRECrfrEVwNxhcj/goEeqsoFMz6fGDzWMZPhwUknba206
 a+s=
X-IronPort-AV: E=Sophos;i="5.77,356,1596470400"; d="scan'208";a="149406020"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2020 05:13:55 +0800
IronPort-SDR: s8mODAAUNTK6Q/h8fFRFUMmAFE/nOAEAB+USdVPISUrYv3o8BB2tzATMEru8pykRqON2btyaCL
 m2ojxzgc+3N7NZ0HJWLasRWFhtsHCH6xsiYc6ln+k0SAbI3zha9RIjF24aI9PpW+YZnLXQJUo6
 sypNUEbf4abmeJ+fEf6HY8SRmYVseuadcM6944qAT0+Ex3RiQbervDtyDHhEf6vdZtGVZplkHK
 2RLy/pK6asJj/4YNLQUPcK2Ig1e3oCp7Eo4ZQtHT9ufevLWakZTs+o++b63Bfet2Ci2G08a58G
 +VKBl9Xl45cYD5AWmgxE7tIo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 13:59:43 -0700
IronPort-SDR: xXNYNpuECda/K0oZVXImx5r+Kibd3x1J+MzfXjxi413udaVCYh0GU2b9kRFOJQn6wk7UK+WREx
 6re5MRNGaGLYrVcdHJ4myYpM6ZmmwsiDeRlg1H1HDTmFSL3f4U/rI3hhlrx4QDGErN2QmVAO8g
 W30shVY2Tf7Pa4N3JshPtZyShOaRH4PWQRuUxGcwO/q8e0ZkuccrWJFe3QSBV55xw/1B6xWNps
 X2UT0lQgjuSXucitoPhpWdZf5ZcYabUQQrMLWzxL3t448DGDaNz9ugmCJChIyzUCsf1OD8dx9v
 Odg=
WDCIronportException: Internal
Received: from usa003000.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.38])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Oct 2020 14:13:55 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] RISC-V: Move dynamic relocation section under __init
Date: Fri,  9 Oct 2020 14:13:44 -0700
Message-Id: <20201009211344.2358688-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201009211344.2358688-1-atish.patra@wdc.com>
References: <20201009211344.2358688-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_171358_760359_3B68F6A1 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dynamic relocation section are only required during boot. Those sections
can be freed after init. Thus, it can be moved to __init section.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 15b9882588ae..4aedb4fd79e5 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -60,6 +60,10 @@ SECTIONS
 	}
 	PERCPU_SECTION(L1_CACHE_BYTES)
 
+	.rel.dyn : {
+		*(.rel.dyn*)
+	}
+
 	__init_data_end = .;
 	__init_end = .;
 
@@ -112,10 +116,6 @@ SECTIONS
 
 	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
 
-	.rel.dyn : {
-		*(.rel.dyn*)
-	}
-
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
 	__pecoff_data_virt_size = ABSOLUTE(. - __pecoff_text_end);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
