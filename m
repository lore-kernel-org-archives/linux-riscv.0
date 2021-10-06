Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9166C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:47:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D08B60235
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D08B60235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tt/farfsys3X7Z85gGpU6GNjLISIQ9Z2xoofSKmhrnU=; b=EmNvkSN4+4eAhX
	UYbI+Y38mHWjRdfY6hRlJYkHNk0vzSHfRor2fgB2/b8GT0AuKcYNN5VsoXqalunwvAS6t3QnUaM0v
	Sm7rIkqHo6hQhryA0moN1mFpYEoFaOhHkMDebPcI7up+T2FrT1TWrXwj9IYPLe8bW6To+zZZcggEH
	eLGCujjg3RgwGCMYMnxZxMrQ1xAwMibyv/CfZ019dZYS76wL1luVbS3TJM/+plEYz9CfDj0GQZ9B/
	3ditXS+Qm4o1uSRFwUE9RCtYUlxQnwnLwE5d+nafdvTiE33fP2+87rWYrf3pOPocNv1vGHef6hUo0
	EWM4PKtE/oxZwKAitGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA4H-00F3ok-Bc; Wed, 06 Oct 2021 16:46:57 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA1D-00F27O-UT; Wed, 06 Oct 2021 16:43:49 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 u20-20020a9d7214000000b0054e170300adso3803230otj.13; 
 Wed, 06 Oct 2021 09:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E46c5KotLBJJxu4fxLSa91xNqDqPq5a/10Op+mtdz/c=;
 b=n0HYgX72WIbQiU/88fiooHoX/yXsxS0c8/hXHMZ/Ro5vtC6nmxDUu1qHx02vIPp8Az
 Glre7ZnCQgnNVgE+nm8b9QWpOghwROACq2yHgHWbik6+pGSY+xmn6bJX0fCYXuTKNFdQ
 qgM3pdMoot6WDRXqsPYWQEZMxIfdwdCdFauY3T4qIE7XLpI0/vVonjhdrskWxpj4c0WQ
 GaL682Ti/AySdWYUoVMkhDL0QPI45Sz+8TBZTdI7Q8DoeCxI251deHNOGNK/tlWvu6a0
 ZduOsgMHDEpG45tPH4fy8kbYUGMA7q63GseFyWj7G/Bqj7ua1/p5oVt95kfFq0Kc2jq4
 lqpw==
X-Gm-Message-State: AOAM530nlFhJxktXN/YH5J/ylobOknrJ6rMlgMuGf9u4gvXk2lVgvbYX
 GoHzxLoPBfmEudL3NDj4yA==
X-Google-Smtp-Source: ABdhPJxehVSGYvZXtuNP7Z+wFAXu0A1JJQzA5MrGIRkKPVwBp+gSYiQNHX06q+RB97zQgpf/RwBd+A==
X-Received: by 2002:a05:6830:1d8b:: with SMTP id
 y11mr20406228oti.291.1633538626550; 
 Wed, 06 Oct 2021 09:43:46 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:45 -0700 (PDT)
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
Subject: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:26 -0500
Message-Id: <20211006164332.1981454-7-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094347_992409_A2821356 
X-CRM114-Status: GOOD (  11.27  )
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

Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: openrisc@lists.librecores.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/openrisc/kernel/smp.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
index 415e209732a3..7d5a4f303a5a 100644
--- a/arch/openrisc/kernel/smp.c
+++ b/arch/openrisc/kernel/smp.c
@@ -65,11 +65,7 @@ void __init smp_init_cpus(void)
 	u32 cpu_id;
 
 	for_each_of_cpu_node(cpu) {
-		if (of_property_read_u32(cpu, "reg", &cpu_id)) {
-			pr_warn("%s missing reg property", cpu->full_name);
-			continue;
-		}
-
+		cpu_id = of_get_cpu_hwid(cpu);
 		if (cpu_id < NR_CPUS)
 			set_cpu_possible(cpu_id, true);
 	}
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
