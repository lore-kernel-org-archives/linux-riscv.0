Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802ADC433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:02:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F66C64DA5
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F66C64DA5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p+h4x134gJTTPimgViONaLlk0DP5wX4tVDGDWo3+sJ0=; b=tLvOBO5dTGQNMxw7Rbzp3eZk3
	iChx8olhHoJHNxh1dl3oZEPSu1eH4GYC0nv4palHjPcUrjkGjKe/QKCJ3pOTGxLET8z9BbbCWEa8t
	9znmeQGRIRH94t5Hv5qWYGO52XsCp8XDTeVAHqkh3kDyAuhXyw6mVtd+vA13yiVyJfT8h2jlorFVH
	oPF+jIq8brPmCWogn61NLgxs3E9YQYtdDmzRb19Pp/iNaFf2uQ1Wy4JPHBZFzYQV8QFF3dWXFsNOx
	HsNSCj5g3hijrIdRO4P7VBBd8rMI3HlQv+rvxWSnMA3x9C8BTha2zfUvAVbIMtp+vwPKW6JBnYl4W
	h3UBBUoXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9heH-0003HM-H6; Wed, 10 Feb 2021 05:02:45 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9heE-0003GM-4e
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 05:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612933362; x=1644469362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aoKNRmpsieVqZQfH9jmT4jDXbR2ecaAZxAOVYPky1SM=;
 b=AWxnNsOFe87vImP3ns8Hj1v85a1AB26tZ/goohFxwJga8iwEM1N09Hk/
 Lqj86Me7kCflpUSWWh8/7C2RgGPJr7frDxiKcqtjog4OwDWyuauI6xVpu
 rqQCSPAIbw1c+ansWqG/5Q1TXRSYj6vu1AvJuhqU2yTyVGL2EzbscwNbz
 2B8d/gMoMrHxIQ/3VAE+F1IbpJYXjTRxa6LnEgVWmMUfZ2q90bjPA/U+o
 buL1i7yGTI79dg5F5eLmN27K9tNz7aK48oqZZNDoJgsp3/+78BeQ2Mhuq
 NMZgRpdH4GH0zEm4DmZWomk7PGhg4php9lsEsjuRIrhKcR+UQfTBbjAko g==;
IronPort-SDR: 8bYHjnJp4g6cJnmnlIiEBiMEg5IAwYoJUaHW7txrH1DBzmWA2l10ruGB1+QlWdm6xtYVYflkX2
 gh349i23cqQExBo7/YC0sYYw0T0I+06n4RS5X7MoVArj4C1Rm2BPJXlYvNx8IKvfqBBiAlqDv5
 FTS/pTV5g9/OjndpFpCcgWDZ2tRn2cE9C9HZQM19DftVhWLVEPqWyUK4zxudEI+f6CggcQsYV6
 3khAiMSiZMVOmSn0zOMIUxTKMqfWuPPOlV4jhE5ZEXv9b82Bn79gYdfjzJtVntMUDTkwUtsQbw
 bUE=
X-IronPort-AV: E=Sophos;i="5.81,167,1610380800"; d="scan'208";a="159592661"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 13:02:41 +0800
IronPort-SDR: chd+/s4ceEO6w1IggkeFTQVyxA0pushPrc/It2j6anFQ2VTrc5SxdtRLejEgsPUTn5rtmm8Pq3
 vceuPX5nbGG11NxkEB8SP4OpIcIzP2VIZ5O/YkGqqaEI89Rgp2iSo4H2LnFydJ67KHhjcSHzG/
 5EgCBXTuXgVaw02gwKFCIWoMZNjgv3we9IYmvzio8OJCrqaAvvkm1TiqcdYebk9hDZhWyTDsW8
 qgp82mwL6KkyVrt8mYw4c6tKDHti74Ktn1RTtNbFHo1Wk+D7D4ipMsfhTfTDtfQhhu6JNvBGrc
 pxbFqul9JRKxq8OmSKeZa/66
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 20:46:25 -0800
IronPort-SDR: 12P0yy/TUPAgk9Qz7V5KTAB/XeAzocyey5MnZTMdaxyFPUVN0ame8hMraDdaoL6DWng8QLomxx
 49hRR1DI64mQUAK3W7D2Q27s/5wguQoNpJ2WNOcS9lbTDakeI7HY5e5/+nkBDn2jogMkF4f4Y1
 baq+Cu8P8KAHqMvlW1+tU+SX/mrnbwjcpcC2h+H4peLgew7XJma/66HNzLChMPE9pdEZ80Jnxp
 8T8OYB/i/WSmDttmJPXx9nyBqg1PTKGDC3V91mMZGzNz5hcM8oIR3msxDq5QuP6khqG88zm9XO
 syc=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.72])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Feb 2021 21:02:41 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v19 02/17] dt-bindings: update MAINTAINERS file
Date: Wed, 10 Feb 2021 14:02:15 +0900
Message-Id: <20210210050230.131281-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210050230.131281-1-damien.lemoal@wdc.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_000242_347493_D9C21822 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a reference to the Canaan K210 system controller driver bindings
file Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
in the MAINTAINERS file entry for this driver.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3031c2012865..dbb293fef3e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ CANAAN/KENDRYTE K210 SOC SYSTEM CONTROLLER DRIVER
 M:	Damien Le Moal <damien.lemoal@wdc.com>
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
+F:      Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
 F:	drivers/soc/canaan/
 F:	include/soc/canaan/
 
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
