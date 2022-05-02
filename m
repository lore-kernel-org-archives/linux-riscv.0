Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FD7C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  2 May 2022 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+XLIiN+md9sWZhHD4f85BcV3+0LQFNNk/eI/q9HLbg=; b=duIraV0rwcGb91
	MYq9mvx4chFTErju9b6pzldRjdFillPMEtRo4Ojjw321r+MRuqhqal+jioJ+n4Ua2baJ6E6SxhiFl
	2gCaf6l2C4zZHTSybudYrWoSbQVEUFoemV8cPeLfFTraTqhoD7JTVzcoxV0bs5xOk6jTyu5+wzYu2
	iYiWDv6qITpCDrjLt/v8Yaj5IhUp4fCP1dU3bB0Nsdall27O6n2XxBbJueOmY33Q3k78slrnqNVTR
	6EpzRRweYKuY0StYEZ9+8ot0Atu45EK3+PODrkYlnj8XOU79rmjBnenhDyoCrMXbmNzmiv/MhIDgc
	uJkYOsqFrMCeKK033XmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlVVX-001Axp-Hc; Mon, 02 May 2022 12:50:31 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlVVS-001AvM-8u
 for linux-riscv@lists.infradead.org; Mon, 02 May 2022 12:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651495826; x=1683031826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eLJN+n+sefzeIkkG/0s0IS3RfDLV74k6PsaZqR+kLa4=;
 b=NkxOE6pJ86Fg7snlNrRC29i2dHlvE4xM4CUrgMeMtzoftp8/rBxlKxUz
 6Y6fnzGWhRKP8vfFL/SKwxYRA7p/QK9FlnNCBqPtW9tmlP9amEScAALi/
 FEgf5Is2NYGnkhU3RYhYSk250N4xDMXHe9xQnRn8MSIaySlfB4seGHlVF
 gzAay9702Lhwt/rMGQ/Wd87gIlNHhMpg24N4pcozIK1Y5/RSpoMwCCQ+e
 ZNtqhXp1or3RfkwbWEcdkNyFg7mZtoB5yASdF04oah0LycnXjL9J1tfP/
 Sbu1ldCwe7+DLIH0T3waPx4TFk+rC5D/tlTzNPxRou2kn6OC5uJYag9ne A==;
X-IronPort-AV: E=Sophos;i="5.91,192,1647273600"; d="scan'208";a="303547582"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 May 2022 20:50:25 +0800
IronPort-SDR: xgc+/oOy7xXASVSMBvXiuySU5uMDFQs7sJYMSx4mTvqw6blTicD+E0xDYAh/rbGkMvKh6X8pWF
 4CkN8MrruMa8YjGaiOgqNLXOTm4yhLYfa4Ei239MAVbkEB5a6txQIAeMVXnIB8Bvz7p5P4rZ3n
 W1IFVIb5G9xTJOmlvVxOhfVBKhmFuWeU4FtY+VAtHUgGIBbeGYOjk9aJgY+TWUP3ze4TIff4ik
 mCuR+H5M/lKkCuXUJMOExKDlBmGt6KFYsz9U9wgPCcO4BmgXXooXq70QLtMcYQnZOxz/LizrIL
 ss8/Z/eMoFaZqAZ+SSU3qzdd
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2022 05:20:30 -0700
IronPort-SDR: 4xIBTdSWJgkBOymEhh4E6E9ntp16YB1VtoJtBXf2g4/UG7UbnfOoRmXMyL7mRlZrSLuUQN0tWI
 HfMv57rlk5P9vQqhxdmrCG0sKW7rAOmiZx1FOgLZkVr42B/+WoM9W5Qd2FK+b2FcKnf0kelXQE
 fdM7R7tgzmW7aRfdliTt3XtFytLhWwlKtvmkQ9Q5oJeNCisMq0imMwYqEhgQMXHRv0ezUz/TYA
 KAoiFsSbp11uiGFYfoWseEfG5igRZKh3WGbVjaW9lmSrToaIClw62OoMNICIYfWTmyfAcp2YO7
 SFg=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.66])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 May 2022 05:50:25 -0700
From: Niklas Cassel <niklas.cassel@wdc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] riscv: Don't output a bogus mmu-type on a no MMU kernel
Date: Mon,  2 May 2022 14:50:14 +0200
Message-Id: <20220502125015.1345312-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502125015.1345312-1-niklas.cassel@wdc.com>
References: <20220502125015.1345312-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_055026_491527_9324774F 
X-CRM114-Status: GOOD (  12.60  )
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

Currently on a 64-bit kernel built without CONFIG_MMU, /proc/cpuinfo will
show the current MMU mode as sv57.

While the device tree property "mmu-type" does have a value "riscv,none" to
describe a CPU without a MMU, since commit 73c7c8f68e72 ("riscv: Use
pgtable_l4_enabled to output mmu_type in cpuinfo"), we no longer rely on
device tree to output the MMU mode. (Not even for CONFIG_32BIT.)

Therefore, instead of readding code to look at the "mmu-type" device tree
property, let's continue with the existing convention to use fixed values
for configurations where we don't determine the MMU mode at runtime.

Add a new fixed value for !CONFIG_MMU in order to output the correct
MMU mode in cpuinfo.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 arch/riscv/kernel/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ccb617791e56..ecfb3e85ffb2 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -138,6 +138,7 @@ static void print_mmu(struct seq_file *f)
 {
 	char sv_type[16];
 
+#ifdef CONFIG_MMU
 #if defined(CONFIG_32BIT)
 	strncpy(sv_type, "sv32", 5);
 #elif defined(CONFIG_64BIT)
@@ -148,6 +149,9 @@ static void print_mmu(struct seq_file *f)
 	else
 		strncpy(sv_type, "sv39", 5);
 #endif
+#else
+	strncpy(sv_type, "none", 5);
+#endif /* CONFIG_MMU */
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
