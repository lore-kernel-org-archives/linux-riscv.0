Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ACF5ECDE4B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 19:07:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B562081C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 19:07:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uYC/u8Tb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpXVov7h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16B562081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OEvLI65lPj0RAUAiTLXOZqeyZCqZw8ioddM+hWd3Rbo=; b=uYC/u8TbCHwhKS
	Ot8wI/Af62knBWlUEVL/iPaBOcenn0xtgtrTeA+Ip2qEzZcRRgmFm7hHyVUUsopprBtS1b7IFlpTF
	MCPcmt2PEap2aNFP9NxsfH7fCjezDi5aqthLuxVO7sgxGkYcVgAcoNNI/UGmaL0pLRNmzIeJ1U86k
	akCFjOu2Z1NHjHQo5z7MeGQ59wVUxUgcBym3kaQxjebfaB/wF8nX/3e5uVI4MLQF+IKKaOihc+MCi
	NAQqaZrynbaC7dDZKPuzQYPyleA4IRGJMBopBQMwDjLLSFCO3oQCiN6nFm+K/vnBwtAK9h1w7f3Ze
	rPWYIU9q9clj7JNWAVWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKpeA-0004B0-3d; Thu, 08 Nov 2018 19:07:18 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKpe7-0004AN-OG
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 19:07:16 +0000
Received: by mail-wr1-x441.google.com with SMTP id z16-v6so22442540wrv.2
 for <linux-riscv@lists.infradead.org>; Thu, 08 Nov 2018 11:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tHsK0hhrKmdeeb3ghMdlBw0MAo3rlZFjyqHNm6Q0ZR0=;
 b=rpXVov7hv6/psus9dpe+GRQrRwrJI6lSNw64tpPO97PeC/DUs5VBDTUMFjmHJ131Pg
 oJVFCkIuAhOqE3RrExVlvVZsqpZlyrcCpJ7yJNgbNccOBbRT622zi5K1BDnxKyyzrYrT
 9Kqy/LMqJxqq+5F7DLPi3DGnVAtlHRjr6A9AKH283vEu2qMwgkIz2Ah4uyQc7lvv8Jc+
 LXlmlv/yqQe/25jHzYhiI3UbQqRpHMK+kRbNn7vDzW5aYL6tD+T5TrKKbWSHcXJiLZyS
 74xhdl4xx0JRuEGP9mBPF3hW3JDRumRo+lC5kCL3uWdaTt9FV3kEemo4BGFZmXcUxPGb
 HC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tHsK0hhrKmdeeb3ghMdlBw0MAo3rlZFjyqHNm6Q0ZR0=;
 b=Eb6M76BBokTxUf4G3ATQlaMEg9JA6P4ce7J/l9R7F/09LVwEdi6uB7QFmCesVCS1LW
 lKFnXdMHFb2zyeCsHtp8PjGY/wD1qSY9aUO8+P417assHgQ2Fsb3AKWJQuxKhdyexnM7
 tmbPFFKNh6dqt60hgpd9ob4AYYfvKiMoVuOMJvtIInardYc8Vpp7WVUdFaAphBMlnF8C
 5xa4X3WFKAga8MxnCLHO9ZCNC0j0bi/axijOGxtM5twwCEuRmg+QoEEnV5MOeXf+oCD9
 uf4IpkAh/a5SWzXO2vNi851lvtZedeAbQmT369w2jdNRLWDFAWjtTrWLlawYx90zCLQ/
 azIQ==
X-Gm-Message-State: AGRZ1gL0ixwgmrX3Aj/aWojcKbVvu6aJMm+iozentZNTq8KZzBpEh4o7
 sgbMqnT4oTAEF78GYLzJo7E=
X-Google-Smtp-Source: AJdET5fut7tiCpoKcNQEH1HIxdbI46PYanxIm3fghms0xgWRCgt93ADAyeh7ZaKotZnfe76NRAObsw==
X-Received: by 2002:a5d:664e:: with SMTP id
 f14-v6mr5398407wrw.218.1541704023838; 
 Thu, 08 Nov 2018 11:07:03 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id e14-v6sm3010547wrv.93.2018.11.08.11.07.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Nov 2018 11:07:03 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: fix warning in arch/riscv/include/asm/module.h
Date: Thu,  8 Nov 2018 20:07:00 +0100
Message-Id: <20181108190700.30825-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_110715_790067_359F2B8E 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20181108190700.OSZfgOlW4M84W3yjnhh03PlwQsPaPkHULc8ydBQtkWc@z>

Fixes warning: 'struct module' declared inside parameter list will not be
visible outside of this definition or declaration

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/include/asm/module.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
index 349df33808c4..cd2af4b013e3 100644
--- a/arch/riscv/include/asm/module.h
+++ b/arch/riscv/include/asm/module.h
@@ -8,6 +8,7 @@
 
 #define MODULE_ARCH_VERMAGIC    "riscv"
 
+struct module;
 u64 module_emit_got_entry(struct module *mod, u64 val);
 u64 module_emit_plt_entry(struct module *mod, u64 val);
 
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
