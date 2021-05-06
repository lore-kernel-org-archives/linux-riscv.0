Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43403C433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 13:22:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D91BD61154
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 13:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D91BD61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/yahRPcuF1/ZlTMsWOQaF/EUrY7ZE/Zj5oq9WE7kULY=; b=OVHWY49eIyUmns3DZxn2yjyT8e
	YN+SMV9O26smtih6xEMlS8SHXT8Fe3WTHJJRamEMaOu9HJAU7XpTlyhKSYmMkUBKwhufG3HmTtinu
	9AqIO96InYcJV4LYNWullC8HAn98XUaiddZ/MIabZJJzB9dDo0KYE47pns72eWgt8MWryNVraVID5
	7p6T1ziyY2QK2XbC3xfuBzK4AM9Fx0yW1Xly43P0E1F6Gp+2xvyLElSo+XTjxXhKUVSA+YNlHe5EB
	vD+K9FrxKm4Htxt67RalejGnyV/LknBSu/Yca0FcDAUvY1JCIK+BGj9R04t9Pa0oXM1TkQl/zaXor
	bYgav7+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ledwz-004IoR-5z; Thu, 06 May 2021 13:21:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ledwd-004Im6-Tr; Thu, 06 May 2021 13:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=MaZC10xJIhD3fyXwAWN0FRZN/Tuv7tbX7bFB83Khdws=; b=VGFvUjEFQIycUatwojZofXyEJI
 DvI+49CnP9cBeVwH/XAjGa30y+k5o8shtjGfjOFXRPz6FxVz+Y0eN9b0AW1w/r1YQlw62OGO4nh6+
 AhRFmue+GSFFKCaP/0zQ3eQpqFmXiEHAVWup3paC8GjnI5W3mX/yOPjJJjEFbYCZ6O7NsDlHAr5Ax
 BvPbbGdc+YAnMUtif5SqxBunir9tchbxS5Gfy4h4ek46jgBuaMN/nrXkEOqzh/GDR5ZgbNgzjawap
 08NIzGU01FGXPgIhh55f3lLr1AR6HO0lYDrig+9xC0fzuUgZVZlGH9f2URujPmGAT/bB1lRDzmlCx
 BzVhlkMA==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ledwb-0063PL-0m; Thu, 06 May 2021 13:21:34 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FbZ101qmQzlc6h;
 Thu,  6 May 2021 21:19:16 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 6 May 2021 21:21:13 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Al Cooper <alcooperx@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-serial <linux-serial@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list
 <bcm-kernel-feedback-list@broadcom.com>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-stm32
 <linux-stm32@st-md-mailman.stormreply.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v3 0/2] dt-bindings: serial: Change to reference the
 kernel-defined serial.yaml
Date: Thu, 6 May 2021 21:20:47 +0800
Message-ID: <20210506132049.1513-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_062133_248408_DC7EC381 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
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

v2 --> v3:
1) Change all references to "/schemas/serial.yaml" to references to "/schemas/serial/serial.yaml".
2) Change "additionalProperties" in file renesas,em-uart.yaml and st,stm32-uart.yaml to "unevaluatedProperties",
   Because they're currently referring to kernel-defined serial.yaml

v1 --> v2:
1) Change to reference the kernel-defined serial.yaml
2) Move the new added "label: true" into /schemas/serial/serial.yaml

Zhen Lei (2):
  dt-bindings: serial: Change to reference the kernel-defined
    serial.yaml
  dt-bindings: serial: Add label property in serial.yaml

 Documentation/devicetree/bindings/serial/8250.yaml            | 2 +-
 .../devicetree/bindings/serial/brcm,bcm7271-uart.yaml         | 2 +-
 Documentation/devicetree/bindings/serial/ingenic,uart.yaml    | 2 +-
 Documentation/devicetree/bindings/serial/pl011.yaml           | 4 ++--
 Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml | 4 ++--
 Documentation/devicetree/bindings/serial/renesas,em-uart.yaml | 2 +-
 Documentation/devicetree/bindings/serial/samsung_uart.yaml    | 2 +-
 Documentation/devicetree/bindings/serial/serial.yaml          | 2 ++
 Documentation/devicetree/bindings/serial/sifive-serial.yaml   | 4 ++--
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 2 +-
 Documentation/devicetree/bindings/serial/st,stm32-uart.yaml   | 3 +--
 11 files changed, 15 insertions(+), 14 deletions(-)

-- 
2.26.0.106.g9fadedd



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
