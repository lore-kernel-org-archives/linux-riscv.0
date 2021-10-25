Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0EDC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 04:06:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 705BC60F46
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 04:06:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 705BC60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpvHBtx4oUGyHQ0bHff/YeylOrcQTT5QqpEYOVFB82w=; b=vfFVjfzh9IBnaE
	woxd5tVw9UyKfog3KGV7c5DI+1bfCcJW3xt3Hm92FFF8eWVjPGR5YmuRuiCCmsRYPNEC79rv9Ocnr
	AREg6PqeeTjw4Lhpo3klAhDsTlbxD4m20kIgQmGXBkmHPHYfudIIBgMXPVXVhKcJGw/v2OIKNtI02
	q62Kj3yxK2yc2BfQpxN3moZ24OO2rgCX2HD4Sqwt/WDDuA/QoMDb9OUYyTUMAnPBOCSf5QsN7K57p
	xudK+6dpOlsJuLmFNrCwPdtoD2D6kbFwwPeaVy02wsHGTCCXx2nm9uDYsphDt8f5KbqzXmBkO4gap
	fvZbHatzWqqJY8sDvYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1merG5-00FEk4-1L; Mon, 25 Oct 2021 04:06:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1merG2-00FEjL-Fg
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 04:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635134805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNlijVk7PzQ228mi67x5njQYMSIM6uDFOTPJQHw/Nyc=;
 b=aLzdgyXGj7ILM+tdc6eCVRPoEs1p0ywSYLAre8+2OjGk6EzkNdDBE9cDppXJYEU+nOKCQ8
 SeM54Ng6e8ORExlQ9WH6+dv+wYxr7fORBDVq7WqewS7VJTTg/wf/rS2+rp2TXj0phLqkhl
 CF+/ZSmmaa+t6rQooeLHm1TqDr25sG0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-Rxryp20-NsW3nZIxAUjuGw-1; Mon, 25 Oct 2021 00:06:44 -0400
X-MC-Unique: Rxryp20-NsW3nZIxAUjuGw-1
Received: by mail-pl1-f198.google.com with SMTP id
 n9-20020a170902968900b0013f23b51142so3171114plp.8
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 21:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cNlijVk7PzQ228mi67x5njQYMSIM6uDFOTPJQHw/Nyc=;
 b=byE3xO/JLUgciA7xGc3R1JWFl3s39mR5qxX1ABOfzRdDxBsPJPBtYqEaV09zJU8jCK
 kVpDBzMbwiR6A3HPioOPrOhv1svjjkOcdRnYXIdIJs0InkRZr1pTEoAdRXUhITj8SbxE
 WG3WuxhqF7PCkJvSAgmnxjRKqoDl/O58ys/34BtZ/o1ffOOOQ7FCAbYudtla8Sc/Pbbf
 qJCxpbZF/836jGH3wDpuO4KAnIwlox0OexXCPNgZNONBxmVFPLjvsA9vIpcrAVvnUNwy
 uJiAwW2klAzIxq7feylw8IRUmlfxW9nNCVI8Ddy5vUAAZC3Gk4dEPV/ddIpz8C3qqhiY
 f/hg==
X-Gm-Message-State: AOAM531tbIacalTcfAqlI1fkYbhttblri9TWz8W0+S6K/J0+a70X3e7k
 chy7Ct+iWZp95XZGn4p9Eua0fkPBe5xYCmuZIUImX0RKFdmrXqrl4evdX3XEfLYP3XyW/aK6b59
 4/AFzDw0WUvYIzaYz75coUX2bXUK7
X-Received: by 2002:a05:6a00:888:b0:44c:c00e:189c with SMTP id
 q8-20020a056a00088800b0044cc00e189cmr16143359pfj.79.1635134803318; 
 Sun, 24 Oct 2021 21:06:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz74iLr6y99+nWWkiHWP1w3ziPdvlmjUT7sKfUmbESELDOMrhN6VxRhkVg/u74+SKHnw50Xgw==
X-Received: by 2002:a05:6a00:888:b0:44c:c00e:189c with SMTP id
 q8-20020a056a00088800b0044cc00e189cmr16143322pfj.79.1635134803111; 
 Sun, 24 Oct 2021 21:06:43 -0700 (PDT)
Received: from samantha.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a12sm19583944pjq.16.2021.10.24.21.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 21:06:42 -0700 (PDT)
From: wefu@redhat.com
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 guoren@linux.alibaba.com, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 dlustig@nvidia.com, gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, huffman@cadence.com,
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RESEND PATCH V3 1/2] dt-bindings: riscv: add mmu-supports-svpbmt for
 Svpbmt
Date: Mon, 25 Oct 2021 12:06:06 +0800
Message-Id: <20211025040607.92786-2-wefu@redhat.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20211025040607.92786-1-wefu@redhat.com>
References: <20211025040607.92786-1-wefu@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_210646_625708_3BD61AFB 
X-CRM114-Status: UNSURE (   7.95  )
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

From: Wei Fu <wefu@redhat.com>

Previous patch has added svpbmt in arch/riscv and changed the
DT mmu-type. Update dt-bindings related property here.

Signed-off-by: Wei Fu <wefu@redhat.com>
Co-developed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index e534f6a7cfa1..76f324d85e12 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -59,6 +59,11 @@ properties:
       - riscv,sv48
       - riscv,none
 
+  mmu-supports-svpbmt:
+    description:
+      Describes the CPU's mmu-supports-svpbmt support
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+
   riscv,isa:
     description:
       Identifies the specific RISC-V instruction set architecture
-- 
2.25.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
