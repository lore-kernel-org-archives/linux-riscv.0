Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F03C433DB
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A01D64EB1
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A01D64EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rDOsYd80hg1kW7D7IGobBsRgC2QIET2X9X+AVMYW0Ss=; b=MqfECFI6K2DHxJ9jOdw2JGAjO
	modzrGkbJ8osLn9Y62DBwh+yF901o0/xV0xrCE17jiYWqBcB5Ryo7h06vNzaG6HA1U1BjSIUXepox
	ubUon2e5wFfXBHW6168pq+AmbEnkZIRHnEb/9ou6NtD5uoHKOxf/4xyTY5AoGm3qrayqGD35TcuSd
	cXsiq+3GaW/jZz5GEiuK4VBoVKbqqpMZxIyVMFT4vylnXzPvCIXTPqCXUahBuoF4DNhO76M109RDq
	L5Kv+3UhlmO2xB2tO9hkBDH+77xEQbvwOOeqtKsqwwD/nLDrh0mx6UWvbqzqtCFmp17sbR7EK/ABX
	YhPB0A4BQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9SA4-00089o-Sd; Tue, 09 Feb 2021 12:30:32 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9SA0-00085Y-3a
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 12:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612873828; x=1644409828;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AIY+mENCG0OfDogqN2TK/zkNool8y2CBwzDhCDvMBTc=;
 b=oEqzJHDb2afh0fZoUNyFebYkHz79ttkKwYHfmQ4UH43R3geXwahh6aQC
 ekieooyk2EKkd+v3ymFhNsE+ZqA71376cFJcnLLb9pkcz1iTC+eQMoOPg
 BkRA4UFjRMG05+28JAr7kJT0vUvm/RYCTMxolWrJCkmiNvtlVANCam4d+
 etbNLFUdj3HqER1evXhZBxPStfHilbVpbkhc74Sz4isy0xoyxGgxsLrj7
 1uJCaG3lyzy0Wq/bSg/RRIAUFfsUPMAj80frpw1yGCYD/4+1T7roGbxCI
 AOiYDD0em3uxIBSyDJ1J+BrY4Cyo2ecEtqoM+Lmn9Re3aE4+m6TE5rWCG Q==;
IronPort-SDR: mwscthNsz7DMN0usOU0XZlpdAHnWiTnKvzTvRPtJ5RqGPcd//dgkGPs2B8clvSu/qrH5OnCzvc
 b/esNbhikgiKO64N97B601jgFDyNtFfodVK4Xdp0MIPESlSZIozTxfvs9xhzduQzgK5Q0FKkNg
 lWqQAvN9Ed3462Sh3PviC9ehMnML5xVJrepAsoQ+Ay5rFrorg1Uiu4n8RYEu//CYDb5xye2jaN
 jBCEmOlzLT7vmnARGLvRxKUC0B4hy5tFTIbJaqo6fhIniaI/FhT+4QHVe0A02RRp5HdKp1LP5Q
 uH0=
X-IronPort-AV: E=Sophos;i="5.81,164,1610380800"; d="scan'208";a="160707554"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 20:30:28 +0800
IronPort-SDR: ErhL6eywFuQGfBrK6y+10eHSzLxHRVmN2nQAX32HaIjV4kk+ZTgMuj7cTAoVh03y/39VrAzRBj
 bBk0D41GtZyjVCk3Z5jsU/pFSC4BTNziV1CjnkqyhtD/DUxeLRz9+w9aDJf5ph0sxcXvEkhG9B
 BJGlpNZ1R9F0GF4S7hN6qBK7T953u57q3XzfQL1zIVPX/ykAWdlTNFgP0rsJGjirfosd0+PPQO
 iJzBprLL4CzFTatvB5EdIKP270fgPrm4ADWLY1pLtrpwkPPlmOB1cOu7LuX8wpTrDJtLCVP2Ab
 XDx3vnh9oNb1iOq0NA8b1rCg
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 04:12:21 -0800
IronPort-SDR: lupY98j76pDHZuYYE2dQnSvWhf/sfGpMDlmBHyuIQEEnke/G2Oyg/37jDggAlx2Zd9ElclfcPk
 c2BdbxJJx5Mxs8PkBvAz+pIAoozWNypYTFm/zP4z4oLlF51Kuykg2QgyQGn6oBJGgVofsZX4tO
 IM1XA4IbvyPTHB8f+cWPsyoF+FE5+irbtsY9/RdjWvAW7JdO9nkTiwx4LlxMahUOspwwSSQ3nw
 6h6YFTUZuKh24aZXVLuIR455J5JVBfDDYEJ7sen5dHxf9F6F9rEYV3fjQuZBSAaTwIAzf3JkYJ
 OIM=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Feb 2021 04:30:27 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v18 06/16] dt-bindings: update sifive uart compatible string
Date: Tue,  9 Feb 2021 21:30:04 +0900
Message-Id: <20210209123014.165928-7-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209123014.165928-1-damien.lemoal@wdc.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_073028_336831_E3FD96F6 
X-CRM114-Status: GOOD (  11.22  )
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
Acked-by: Rob Herring <robh@kernel.org>
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
