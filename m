Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A567EC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 06:46:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7528120825
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 06:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SGWPxpZU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NN9naLgZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7528120825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BdFyXlUiqgMV+nF1sKMNGWxYicafaS7FiQMaMk2umjA=; b=SGWPxpZU0TMNya
	D3qd3UIp0X6HANH6lCc8WiXHfhm0GkHZSSVyRFwCepKNG0oeBig6l5GKSW9UA3P1s9I0cb9EGwVh/
	xYIKMHp35ZZ2xTCirQJupx0n7WbKRR5yOVG7yz6daq2sab5XQIP9FGnwNNFX6a00rc3IvndxJ/jSD
	7arL8pDR5uUKKZ7twq73GuPumjkB8dl6uumhz9prCWqIeYzAl+kri6XRM9cLSfSfgevbHtzbqjLVf
	ugAnxSFSc5x57I/z5VMYFtvM1D8e0YctlWTJMO0oEH7HuvADX6LwMhjOCyqydSHYO0qlj+Lg2Hw0M
	NM2rQftTMxG7IfbjwdfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLN1z-0001Sc-F2; Sat, 10 Nov 2018 06:46:07 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLN1w-0001Ro-7j
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 06:46:05 +0000
Received: by mail-wr1-x443.google.com with SMTP id e3-v6so4041775wrs.5
 for <linux-riscv@lists.infradead.org>; Fri, 09 Nov 2018 22:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wSmwO/A3iz9yjq1Nxz1nrZto0VJAqkpQ7ytp/hBquDI=;
 b=NN9naLgZGQOLpprOYIt/eChXk+Sgv/+rdhuomGZic0dlbhV2SEL+Ng0jZfeLwzJOJ0
 FVbmFQ4WL5VUdrY/DMalaTyOA4JYccjyL7ztHEs0CfLJay+4FyjP3HBDHmz+v08hB8YG
 spqYkfBdoW6+l3ye5ypfyaqQ/pti+cPO+rHYn6O6H4pTPz0akKP/u8Armg0vr0lvaPcN
 PvlwmDTL80sjSZltrfcRC123s86l2iU85jrHNkkswaQ6egcdMzBE2c/QzahkHHiiNXgv
 ww3yM//9mmsvfGvBfxm8+ZvrNPo/V9hl3DoA3IlRcHEQ0efocr4WqiMabhIVfvM6ofum
 rF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wSmwO/A3iz9yjq1Nxz1nrZto0VJAqkpQ7ytp/hBquDI=;
 b=WbwKd895rMhFncLhVS67aY/ZB4ojT3NwiMDfG4UamqMb8wCBFex3TbfYfEqCAoCsUE
 x1kvdw5Xs5emHvlvAMYcWqUYHtYtZ69vgopdfZjJlZkV1rUH07dVbKxX3Uon52E7JECV
 /u9exfPGHPQOHVVfu7XlAkNWtTL+FefggExAr1iIYyhI0GqWZypDE0JBMNZLfsC6mVl+
 dRrpqCCgFihyuYgxWc3eFWxpW3pxpSDr1IdnhlpnS1mH1ykSdVjok+EWqqW8iagXBMwm
 ayTbmsEoQpBd0hhBRRGEX8HaA8LF2ARVpENmMtD5Ry0yYMl1wLeQPEfSfS+EV5I3R2GV
 1gZA==
X-Gm-Message-State: AGRZ1gK30lfQyogfA82uLBYIwkhxB1chw+XShtNVEiY1M3LxW26Yfg7p
 P7HF20q969AWl3ezykM6YJQ=
X-Google-Smtp-Source: AJdET5d2UggJlhYEg1BA/jf33tB4ShV7cXXNSryIBDIRx958vX9aOMmUqImjzHNxkh0fVi9RnpvNzA==
X-Received: by 2002:adf:f342:: with SMTP id
 e2-v6mr5183608wrp.219.1541832350159; 
 Fri, 09 Nov 2018 22:45:50 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id e14-v6sm5878036wrv.93.2018.11.09.22.45.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 09 Nov 2018 22:45:49 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: add S and U modes to ISA string
Date: Sat, 10 Nov 2018 07:45:43 +0100
Message-Id: <20181110064543.12411-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_224604_276280_4AD3A9C8 
X-CRM114-Status: GOOD (  11.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110064543.jrCifSpCS558UsW4O42JcGjH1AZ8TTcxs5DvcbbMJJ8@z>

Booting kernel (4.20-rc1) with riscv-pk @
6ebd0f2a46255d0c76dad3c05b16c1d154795d26 (master/HEAD) on Fedora 29 one gets:

[..]
[   55.075000] unsupported ISA "rv64imafdcsu" in device tree
[   55.075000] unsupported ISA "rv64imafdcsu" in device tree
[   55.076000] unsupported ISA "rv64imafdcsu" in device tree
[   55.076000] unsupported ISA "rv64imafdcsu" in device tree
[   55.077000] systemd[1]: Detected architecture riscv64.
[..]

The patch adds the missing S and U modes.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/kernel/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3a5a2ee31547..4029c7e6872b 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -64,7 +64,7 @@ int riscv_of_processor_hartid(struct device_node *node)
 
 static void print_isa(struct seq_file *f, const char *orig_isa)
 {
-	static const char *ext = "mafdc";
+	static const char *ext = "mafdcsu";
 	const char *isa = orig_isa;
 	const char *e;
 
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
