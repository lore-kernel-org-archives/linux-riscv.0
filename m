Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7E2C433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 13:22:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC27B61154
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 13:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC27B61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1W+oEdHFun/UlRhcivvi2CsB8EizEP24UT1aNaQtnv0=; b=DrxvpUwlNxhucITcE4CAIEFDO
	Ujm5wNFBdndI5a8IvMoBUQb4tJOexbGc0j7nVVqEb5kX26t6ReBKC6VW+7UXox/GrA99wJmwbY8Sa
	TYWIc+CqO+Z5vdgf5TMMRx1kSwIz49NNVpyJlEQn/d0Cnj4TuxH/LYq4w/lLf8UhFwOq+cXYyTJam
	+DI6d4POt4XcOSR2pJOO+fOoT7cB/1KBpavdIrWNZWSr4HSvC1T+dnqp2OPDV7yfQ4T4WjvVQvbbu
	f/13ptXGWVy8cy0DBal8+G8Dwgztfs6KuSNi3/Ma+ZuanQM6JgfZybXjdiVJBnyMdhmxOICUlDw4k
	5J5dKSwDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ledx1-004Iok-17; Thu, 06 May 2021 13:21:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ledwd-004Im5-Qx; Thu, 06 May 2021 13:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=ijpcudPExsY5z6p9/V7nuLjzO7/PcoGRY1zqyZRtedQ=; b=wbuW6XnndWE00pYwjYkaWfY5gQ
 TmIOHjnUZtlGqWcB3ZlmsK3T0uqhLSUek1FA5s913BBlGuJfCZ7XQRxb/lIdJm41ZxwyhhZ2Z85mp
 PtQAkVlE5RokAiTqaqQeMW3ZbCXmmwCTzj/7rKICKAhEMUvhfomLfKfRMFvir+k+OFRu8a69QE+b/
 2N181MzJjse6dDvqiBUkHiWEeM+NZMP2+esTAvhj+p1WnpzRz6MkiBUpvOr21jHm6IrPLuBW+Brcj
 qoYiH5HpyML7ZTPHP7DNovIL6wcou5aqsG89zapNqtlPI66WhzTO+r6y+nKyPoC/wvN6rVQGlIcl/
 bH2bF4oQ==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ledwb-0063PK-2Q; Thu, 06 May 2021 13:21:34 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FbZ101PT8zlc6W;
 Thu,  6 May 2021 21:19:16 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 6 May 2021 21:21:14 +0800
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
Subject: [PATCH v3 2/2] dt-bindings: serial: Add label property in serial.yaml
Date: Thu, 6 May 2021 21:20:49 +0800
Message-ID: <20210506132049.1513-3-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210506132049.1513-1-thunder.leizhen@huawei.com>
References: <20210506132049.1513-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_062133_293732_BEBF7E65 
X-CRM114-Status: UNSURE (   9.17  )
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

When there is more than one serial port present, the property 'label'
allows a custom name to be used for briefly describe the usage or position
of each serial port.

Without this "label" property, many dtbs_check warnings similar to the
following are reported:
arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dt.yaml: \
serial@ffd74000: Additional properties are not allowed ('label' was unexpected)
        From schema: Documentation/devicetree/bindings/serial/pl011.yaml

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/serial/serial.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index 2fdf4ed198da781..c75ba3fb6465005 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -23,6 +23,8 @@ properties:
   $nodename:
     pattern: "^serial(@.*)?$"
 
+  label: true
+
   cts-gpios:
     maxItems: 1
     description:
-- 
2.26.0.106.g9fadedd



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
