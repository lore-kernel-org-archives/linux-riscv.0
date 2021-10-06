Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C9EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:47:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 910CA60FDA
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 16:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 910CA60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVus+ZuiO2eE/nhvewznJfhzzkPBNDXh48Y3YsvQETM=; b=s+U6QTYyhsP0DJ
	dlDpwKghrCiBcpveM+oxeHrprL0E578nC33QC4goXMTh2xwZXGk/BJwTkzkZfo8FWSHBiOAUkyuRH
	T4fOo2fmTz03hSGNnsAxcYeZlGPwQi7x7S6XK2Oy9rK1mKuDdECOj423UChaFfXvRDRcMM+fjm1P5
	f8ea3IBgTqm/kaX5FCfeyFJ+kuXzUZcp2FAGGB+01Yeo2XBZb60ADz60KC+0ipmIXXYcEH45ShpSF
	s/rE6TBN3FtjM79TD/gj/6+10FRik+E4tb6XsQbhquI0YqkCUopG41MxX1NEdID6ddjcOO7JWz00U
	htC/YK+0IzPTSRLRtHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYA4z-00F4Ba-Sv; Wed, 06 Oct 2021 16:47:41 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYA1G-00F28O-53; Wed, 06 Oct 2021 16:43:51 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 j11-20020a4a92cb000000b002902ae8cb10so1017853ooh.7; 
 Wed, 06 Oct 2021 09:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lY59MK3rRpvbu1Z+VUSRhTP9oCogI9gtd3qobuL4xSE=;
 b=Hrd62ZRPTtZrLA86b4Zzxn8wWC4OkfrnKeIakXAqB7YEH1dC7j6i0GC7sxkLDYyyfV
 HrgKrRyu5Yj/iqa4CnchNZqIKh/HWdJ9BiMfBj0yyH7UJCVOh5+v8Y7Z5QR0WmHQiMvo
 78ltj+kct5F9uH+4YG0ZCdP0N8FEfitE1XRhKiI8vORzXgLpFYBdSPyuSJ3cLXM0OwND
 zyqP6+whl0rWys/CdlB4Icbk6Sv+3ClNJ4D2METDML4R7u7Ej33OJIKXaZ8ncxveBZN5
 Vgdp2EEccyh/3AREK3hMAB52ikfzuRT1td3+/hzGBqhb+jT+PFDWJI9aSqS8hfwDW+DX
 IZtQ==
X-Gm-Message-State: AOAM532AiFHhym2L3+wquOl1x3hQ+iCQml3fqSRc5Ff/4RNxcjJPH9Mo
 rUfEyd8V1Vu6G+YAGx/Y8g==
X-Google-Smtp-Source: ABdhPJz0UBQruF1+4qwCrW51W9Ryn9cj8arPhEOykPX2X80Gkf6HFF4wZl1tVkLGt4TXGOWPUlKBPA==
X-Received: by 2002:a05:6820:1018:: with SMTP id
 v24mr19468852oor.27.1633538628646; 
 Wed, 06 Oct 2021 09:43:48 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:47 -0700 (PDT)
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
Subject: [PATCH 07/12] powerpc: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:27 -0500
Message-Id: <20211006164332.1981454-8-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_094350_201779_BAEDAB88 
X-CRM114-Status: GOOD (  11.79  )
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

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/powerpc/kernel/smp.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 9cc7d3dbf439..d96b0e361a73 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1313,18 +1313,13 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 int cpu_to_core_id(int cpu)
 {
 	struct device_node *np;
-	const __be32 *reg;
 	int id = -1;
 
 	np = of_get_cpu_node(cpu, NULL);
 	if (!np)
 		goto out;
 
-	reg = of_get_property(np, "reg", NULL);
-	if (!reg)
-		goto out;
-
-	id = be32_to_cpup(reg);
+	id = of_get_cpu_hwid(np, 0);
 out:
 	of_node_put(np);
 	return id;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
