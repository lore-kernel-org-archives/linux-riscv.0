Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B17C43217
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05ED860FDA
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05ED860FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFFlPJzCAFIyiNlo7Ypty/G4tHq4FKcSEBWbw7vWDWQ=; b=QbMH8FbZXKFQJL
	qbioKUXUvXndpfpJOFXodUcpxBefmu7xbcyzDzaBi8W035Ti577tC4vMzGYM1dQH9/zLJXi1wLbBl
	WN2SFgL6uK5ZLHrU/NYonAim4/LzTcNiPI2sZmt43oL+J+OdbWIgfI3IWJEqoRTiNstCEQzO2MESY
	ZTPRo05/kjBK3vwek2dn5Xa0q3wOX/RtIq46EElzUJc9O8NUL742FmXEGiPHnaMCHlvxBlYuhIEBW
	tEuC/9myEHk3PqH2JNsP/OR96zI1Xavkq2KdGSbc3NEzrRZsAkTOfWYV12xmTw4pEBroOthJuBJGC
	ONLOln6/FWURV07R+1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA6K-00F4qr-3W; Wed, 06 Oct 2021 16:49:04 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA1K-00F2AT-Bn; Wed, 06 Oct 2021 16:43:55 +0000
Received: by mail-oo1-f43.google.com with SMTP id
 w6-20020a4aa446000000b002b5795cca03so1019054ool.6; 
 Wed, 06 Oct 2021 09:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVDBxu87TJi7lJ0TsvF77hW6cToukGJnTBFK4bAPEHE=;
 b=ErP6xKV+ALlmtyXriN1EaAi0d2nXxaNoWiTfPt61DFyIJqR+a3bmDeThgXvfUQJu5A
 mAkt8RnqRNypTfjm9RinH1U3Mm7rWvIgrcic3y/04JECec27nwjhKBZN/VT1puKnMa8l
 gX8tezSHUdQFqXNH4l0XL4HN8sNUxx2sNHNIr4EdtqsWrZi7PR6c9ohDosI1/RuHK/DF
 vTSQUtw6Q3tH8oG7CPzWPZCxILtp0vfNlFVTDMaRxoPuAu+BLDbcN8Q2o2bo/ki/v9nQ
 iEQh0+G2dE6+GRd1SN/uuLu8fxo/XNbNi3v3H5ymu5YVU1Ttk2g6KaiPclck5qv3uriD
 Bg9w==
X-Gm-Message-State: AOAM5324y7CRl1e+ikMTQtPESLl0wlnzjrM0pm/g4xuZVwiyW/APcOda
 EmHXBs3v1CNRs7SAuBa1/w==
X-Google-Smtp-Source: ABdhPJwSo3vtevHig5e6wcfYzHn+p/9LVu6izXiBqHPOZc+ml50aXK5vctwJYkE3EswfiMHjHBf9ng==
X-Received: by 2002:a4a:e597:: with SMTP id o23mr6391984oov.96.1633538632948; 
 Wed, 06 Oct 2021 09:43:52 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:52 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 09/12] sh: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:29 -0500
Message-Id: <20211006164332.1981454-10-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094354_435626_0AE98087 
X-CRM114-Status: GOOD (  11.54  )
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

Replace open coded parsing of CPU nodes' 'reg' property with
of_get_cpu_hwid().

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: linux-sh@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/sh/boards/of-generic.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/sh/boards/of-generic.c b/arch/sh/boards/of-generic.c
index 921d76fc3358..f7f3e618e85b 100644
--- a/arch/sh/boards/of-generic.c
+++ b/arch/sh/boards/of-generic.c
@@ -62,9 +62,8 @@ static void sh_of_smp_probe(void)
 	init_cpu_possible(cpumask_of(0));
 
 	for_each_of_cpu_node(np) {
-		const __be32 *cell = of_get_property(np, "reg", NULL);
-		u64 id = -1;
-		if (cell) id = of_read_number(cell, of_n_addr_cells(np));
+		u64 id = of_get_cpu_hwid(np, 0);
+
 		if (id < NR_CPUS) {
 			if (!method)
 				of_property_read_string(np, "enable-method", &method);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
