Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EEBC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3290F64F6C
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3290F64F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yYS3jZNY19ZFDTe2vthKLy4UXC65QHpNJRQ9UK3ueQw=; b=LGDgudNXyjUJl4fh3LSfrqpKy
	C2zfNjzjCcc59XK3vym0uN+r7ZED4FzdA5A0hSV7gjcN4ETkxd58D6HIx1V+h3AaLuQvYks+wMvdx
	+LYVI5S9bSuosT4eD0C7c69dMOiyRZTyA38fdlkhVmIUI+50fs/zyX2CcxesdeT4OvciQK4UReoF/
	uAQPNExX2ug3qEJlkL5BIRHPm+d5yu5scNGGU7nlIYkH+QT57NwP1mh40eVvU2eLYk/2F/+iXUBn5
	UdgCsInL7BeCzvqbn08KEdU3HLtd67zp6fqboxdRkDBRIHeADspN/x35NdtzVG3yQcQemrVx/9bZV
	xjicCV+YQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7HlC-0005si-OS; Wed, 03 Feb 2021 12:59:54 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Hl7-0005nX-W2
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 12:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612357190; x=1643893190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TaWTUb08qqhShpx6lMxoupwm0adN9S1R3Qvyg1Dne/8=;
 b=LsMZFvbGTmsqM4ZjtF+XF0cVS/yxxKoRMItLf6BpnJmBOVGrS8FP6Yw+
 78neD4DPctO5HsCudsC5SixOkE0oTqubE6tF2f21JM5p5rzDQ1iz7GT7Y
 S1Ou0vnstNZOzrF++uFThu9wV3x1K9ONVWY6R4x6cc7FWAe3eAT5I0Mxv
 RYEyXo3an/26VRCXxl44DjfD80lcChmwnPN93i+2Z/7oDjlWsZMqbsbps
 olUDqwgjTo9jsJ8+AlqzCCxvyvaScSnGmwjxFUoL3W4QGsUQyx/15C38W
 Bf0iI5Z8A6opyr8D8rda8Ofhlp2rmPTRAnjj8EQRJO3p9wEqpoACZMnBR g==;
IronPort-SDR: brcd+LDe4sV2RaiH2KrmmBaYOpqSNTheW0haoetw2maly/E6Uzg+Ynwp/rhbpnZ3S6BzdSEmxd
 eVCP88vhFSZrWMkOEm6lPDV6gfJWyssVjbr2N/4ELkIG4y9Ug68S0o2g4J3K1sCJBmeHZQLaUd
 GZeqqFnwanKn6ps4ptyuPSSUyL8n5y6jN6OYb2K32gfLFRfFCwGKuvPMcxDyGr8pqa5Ttb9xZn
 f1jPN2vf5HAc0Mfufb1vR5y8MCvmiSODfZFjGLqUKOgHY8yIzNS58Kd3cVOAVzSM5UW2SFGJ+m
 BOo=
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="160202880"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2021 20:59:50 +0800
IronPort-SDR: 5vgAU5Lx1K4O1yv1OAcxW6aPiaoKAqPzCqGk5OEEC2REAQMOjLoVfzn5ZYElG4z22Tvsor+wQD
 qipgX6Yz8YVlKsoAJwc6B9TTcCrYXnKsokMMu/bxd2VSMxPz7s2UA/atcDb9zMpXL/vplv8gDO
 /ETQUQWDE1y367IDTOMlkLVlSmoEGtQLsAkNQNGek/86zQDWow766pR3WHDzuPr0YfHAsnLIvA
 hkVUpoTnXeaJWa4ZWvg5839lWwyTG/7c934rAL7SH0YWSoSRUIg1gcOQ12GIikKuujrHHjC8DY
 f6a+UYAdhH+tIFkG5DM8C04h
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 04:43:50 -0800
IronPort-SDR: bwpVQRTkmsEEutI7n/QSmnzRz9yD75I9XT92hMwsd/3dN8Lpj5RqgXJ9GWaxtXR+jDgQ+kSsTa
 JoogOprpxnY5zsBBTMABzLfI7UiH+d4Ua5Vm2SrGZevSBOsvq0LIjygvviWM2Jtg5qIeEVVI3n
 jsfZrPpd7RPmugSrguLw5XF+46mT2SQXEIU5BS5oGFmS6vFS63hBK4dtyW0YWii4e7/ArXvrKS
 vNnfU16HGTmmuYJUrOGHEAMjv2C+Oaunuwg4iWk1ruIUGDengbR5Zc9cKojHPV492LuP3WOe8f
 VTA=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Feb 2021 04:59:48 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v15 06/16] dt-bindings: update sifive uart compatible string
Date: Wed,  3 Feb 2021 21:59:03 +0900
Message-Id: <20210203125913.390949-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203125913.390949-1-damien.lemoal@wdc.com>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_075950_216896_AE83AC5D 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the compatible string "canaan,k210-uarths" to the sifive uart
bindings to indicate the use of this IP block in the Canaan Kendryte
K210 SoC.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 Documentation/devicetree/bindings/serial/sifive-serial.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/sifive-serial.yaml b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
index 3ac5c7ff2758..5fa94dacbba9 100644
--- a/Documentation/devicetree/bindings/serial/sifive-serial.yaml
+++ b/Documentation/devicetree/bindings/serial/sifive-serial.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - sifive,fu540-c000-uart
           - sifive,fu740-c000-uart
+          - canaan,k210-uarths
       - const: sifive,uart0
 
     description:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
