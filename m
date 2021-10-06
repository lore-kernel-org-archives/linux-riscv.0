Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB6EBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:44:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9838F6113E
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9838F6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTAmbfblb/m304xbY2TJ+Ez1ojJBFW5Cec3l8imHLEY=; b=k1jrFIL5ABZmt8
	f7g0r67pVKk4g+jIJjNiqfc6s6RM5uV3jF9vnJ+VWfVFIDCDU8ZQfVXebHHLTA/ZVvOiOZomnTctP
	KvhEpOzTZvwpLk23h67WZvflhRg59eFv7AmNUzcb8AK18wYVCqfOv2GuxH1khof+sEEa3Kjcb/bfo
	X+9mQlHtWyg7fPzBVB/vPTy/l2LDVHpjBtdPMwwK1Mj+jhyxKuZNgUmGHc6fw+0qRpKnRe5EPWdGW
	8CyWiHebPAVJT8Lb80XuLvJBsymVUhYkwr7TNyId2VS+2w7rdfTxxb2nO5a/jeqr8ZZviivmoD3TB
	RKiIdXmd2eROdNsJS6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA24-00F2Yy-RT; Wed, 06 Oct 2021 16:44:40 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA18-00F248-Eb; Wed, 06 Oct 2021 16:43:43 +0000
Received: by mail-oo1-f45.google.com with SMTP id
 j11-20020a4a92cb000000b002902ae8cb10so1017729ooh.7; 
 Wed, 06 Oct 2021 09:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SdvZjQ/BWS45GZwLPJ4dVbNMr/Wj7uXKHO/Bl7X5Es4=;
 b=AHO3Sdp/UcIDwgyXPW7x7639juF28NBHRYAEKc/A5ofiYjuaF0QWog8rgaaEQ06y9D
 gV38Q2sbTja6jpH6N3E6oLCUhtqsyAk/HnbCGkE8LeBocTOjCJRCJS09AIcCi0drVKVi
 gBlcr9HUNzw6TnvC5dA2+zFHfnNp5CvkV4iBxcMapRXdd0NEf909GPJb+QBOclAQH9wS
 2/WurhBsFQhG26CUByTvdHS+o2f6dUu8tjqInshT04NSL8hEzkW+o5zVpo4rWFCDy8Dl
 5UFMavxDm2Z5gRZA54vf96N2l/2DkBUOn5PAqxZi46ZgaVmxPeVuToL0s4nx8HPRVh0D
 ZVMQ==
X-Gm-Message-State: AOAM530PXFwYRvdVQnG7oKBFINbXezX7G52Spmozygm054K7wrffHZyQ
 EtUMY64UCpW6+6MbT1FVc2whig2R3Q==
X-Google-Smtp-Source: ABdhPJy1h3H+xIThEc/Bx5W+PW+QqHTa7nGnBvK2axsTz6MHYy0vHuhJmmz3xzrXGNxNysUcAEgxdA==
X-Received: by 2002:a4a:4c46:: with SMTP id a67mr18657206oob.72.1633538621020; 
 Wed, 06 Oct 2021 09:43:41 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:40 -0700 (PDT)
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
Subject: [PATCH 03/12] ARM: broadcom: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:23 -0500
Message-Id: <20211006164332.1981454-4-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094342_500989_07E9C417 
X-CRM114-Status: GOOD (  13.69  )
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

Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/mach-bcm/bcm63xx_pmb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-bcm/bcm63xx_pmb.c b/arch/arm/mach-bcm/bcm63xx_pmb.c
index 0e5a05bac3ea..003f1472ab45 100644
--- a/arch/arm/mach-bcm/bcm63xx_pmb.c
+++ b/arch/arm/mach-bcm/bcm63xx_pmb.c
@@ -91,10 +91,10 @@ static int bcm63xx_pmb_get_resources(struct device_node *dn,
 	struct of_phandle_args args;
 	int ret;
 
-	ret = of_property_read_u32(dn, "reg", cpu);
-	if (ret) {
+	*cpu = of_get_cpu_hwid(dn, 0);
+	if (*cpu == ~0U) {
 		pr_err("CPU is missing a reg node\n");
-		return ret;
+		return -ENODEV;
 	}
 
 	ret = of_parse_phandle_with_args(dn, "resets", "#reset-cells",
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
