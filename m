Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8312BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:45:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C9061175
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51C9061175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSujylSZ/PbL5M/j+Z/cE6mK+8RqorKR6CK1I89nLs8=; b=2dhvovzSE35qX4
	2B05HorKmTBUcOs3V321XKz97G13Lc8f0n/0C18K/FrZLHMddKcRR4We9RRlqjhQUNrYZ563B+MAV
	INzJUoPYGaPBvn3fWnwyAfJ96eAoOHIagwhl/LqFrSuNowI8eH6KCoTsrjsK8X/pfWhqrfCs4G7fo
	EZasjnsVK7wSRnH/CKENkBHOV9HEnF06wBMVe8QxI29CIbBRgSKizQC0TL4rhUAZPnexwRw5GeBuD
	IXK5sPy1exCVCGrNUJ5JQbx3cdrZTYZPRV0dIASrAx1xcFWEXPSYDboK+c79oglMolrd/NIyp/hlJ
	lmcJEsrDVtJq0LghGpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA2z-00F35L-Rn; Wed, 06 Oct 2021 16:45:37 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA1B-00F26I-79; Wed, 06 Oct 2021 16:43:46 +0000
Received: by mail-oi1-f169.google.com with SMTP id s69so4786094oie.13;
 Wed, 06 Oct 2021 09:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CN2tRnfV0nmrSbuDbyHoypag3neEaofRCNv6xL7Eiog=;
 b=nPBBNZkw5USLBYw+mFWTSqWC14IDfYJ4+U2sr+EOJqX/6yPkoij5YNvJfN/FmT7vBa
 XQPa5p9N/aUt7QvFIOOk/Oy84PvwBMHMtR5DP/o5hgrmiN4IeMm877y2vFEkEI2hMfet
 3ihCxPM+ZsNr8Vbvch+ufIONz2hF/XXhzDXjHT3eVyL5JUF68Va9asy/UX7/fyF+ibcp
 5b+8NrzBlCaYfDEnHXsZH+cCALu31VJZP+8S66L9osRjOjqyRda1UQNYPJpvpu0+8sZx
 /zn7khK1QT8fVXuY8cP7g4sxeuX+w0uBBMIqfZ2wnGyHXioxrftuFKQJ8c+Cx1QcgFgh
 YRiw==
X-Gm-Message-State: AOAM5301YESWexjrVlUMxVTSV1l292uNLUcS2Ot9Tst7YehY0VuxPmEt
 xsEaBKm9aT+mmH3V6tu6JA==
X-Google-Smtp-Source: ABdhPJz/z+8TSD/WdWHkwOUMUF3/lnf5Mt7uWOPSGKwTcm1xutcPl6qw5jPqaYPZiNT3CeLWfPqlWg==
X-Received: by 2002:aca:30c9:: with SMTP id w192mr7839682oiw.93.1633538624646; 
 Wed, 06 Oct 2021 09:43:44 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:44 -0700 (PDT)
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
Subject: [PATCH 05/12] csky: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:25 -0500
Message-Id: <20211006164332.1981454-6-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094345_278168_F4C46D76 
X-CRM114-Status: GOOD (  12.12  )
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

Replace open coded parsing of CPU nodes 'reg' property with
of_get_cpu_hwid().

Cc: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/csky/kernel/smp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
index e2993539af8e..6bb38bc2f39b 100644
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -180,15 +180,13 @@ void __init setup_smp_ipi(void)
 void __init setup_smp(void)
 {
 	struct device_node *node = NULL;
-	int cpu;
+	unsigned int cpu;
 
 	for_each_of_cpu_node(node) {
 		if (!of_device_is_available(node))
 			continue;
 
-		if (of_property_read_u32(node, "reg", &cpu))
-			continue;
-
+		cpu = of_get_cpu_hwid(node, 0);
 		if (cpu >= NR_CPUS)
 			continue;
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
