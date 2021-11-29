Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6768DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 01:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEW9Jo4XYiCPXav89iVjskNF/jbeIDWOl+xleMi5ZiA=; b=QuOxqlkS1mRznI
	TFD+XJLUEwe7JrM9OqBcQnDZDLvBZeSWZ1KU7mZYGlkTBICZPQS81k+kUlNyP79lJnjxh5obAiTb5
	dJF/Ntd/wB5QTNS3XJroYFOqjJ5HHktK4Sb4u7OM6UpOezkFh5xYbd1YmOfmQblrnt9cRfKN7IAuB
	pNvvNrj+uyctoO1r1VsUhror4h4nTzLaHRTM/4gL0JhDsjnyYmkrL0xaZ4XXTBKhJqZavyeg//ydR
	q2ezEWQ9kIis+hAIJw1M8uIv3yUHD94QPlDbp+KbaSvqhpLaD1L3q21FBuA0NgSjkrbUZiiP9DwFb
	W8uV0+Zyn7sVOdAIdFlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrVf4-00H3S4-NC; Mon, 29 Nov 2021 01:40:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrVex-00H3Ql-Sq
 for linux-riscv@lists.infradead.org; Mon, 29 Nov 2021 01:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638150047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2HyyYGI9uiNR/BblzOT5yZYpLYUd3YwWGGNeg4QQFI=;
 b=LsRn4olYmlUdEAIJs9Q4x8vF2lNvhehAzRrQO0OsuZV6OW+b4iVQLn9HJuSISClnX+Ah4D
 E73l9x78tHts+Dk2z0fFpcduwvwPEpbsvrKiDYa7h1c0Nk54w6ydInhnrbVi3Yjvh2GY2H
 0bweedftMRd+KXxm7JihpggKTNIeVZA=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-AHc-Pg7EObG6QFYB0UqAKQ-1; Sun, 28 Nov 2021 20:40:43 -0500
X-MC-Unique: AHc-Pg7EObG6QFYB0UqAKQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 t18-20020a632252000000b003252b088f26so4021841pgm.7
 for <linux-riscv@lists.infradead.org>; Sun, 28 Nov 2021 17:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k2HyyYGI9uiNR/BblzOT5yZYpLYUd3YwWGGNeg4QQFI=;
 b=cly1gvHmsKjtCNBtm1olHowdcYt9/yKTt2yNzdtM2sDrddfjn9Z5dXZHXK2+fqgmQ3
 9NC0wn9fGLavP81mLhvAJ2HvViV2jVJmnB8sQ35Yd3wNBCr8rPhXe04xci9oRKxh3KA3
 U9eY+6adLIaSjEoyvCvyvdpYUTWpupM3IHkGz9qOI/F6ObzW+IrumqJ638mnpjc39eVs
 NNDFl7zgobmmqbySXUyrnC2cN5kgNLec8kNTYdD2/WgC9PWdIA8RX9vDMVjvCVbes+LT
 G1I744JubXRVBIlgnHBHci+rxY0WqR5faV9xOlajYEO4GRlyDkpRlqDznxcs0GukqLM3
 VKow==
X-Gm-Message-State: AOAM53162QQfph7atqvBzivAi5L4VB0Jw2SRvbuyHBeuMOrelC8KRyvL
 Q2UKx7RAbgiJsWpno/J49VcIMC8sJmnE7J2uhjRnmO8yuDfS9m8VljSt8hzrA/sTlI6W0N2jQQM
 ObwvVRlH0XLQU91UkUQ17YjXvxM5A
X-Received: by 2002:a17:90a:db02:: with SMTP id
 g2mr35017343pjv.76.1638150042530; 
 Sun, 28 Nov 2021 17:40:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzfqf9/+YWzUdcEIBNa1uk2fXxWr4qKG4LaM8zDp5rwntZetIY4fp+YtWSMVpTRzNqF/xMX/g==
X-Received: by 2002:a17:90a:db02:: with SMTP id
 g2mr35017297pjv.76.1638150042296; 
 Sun, 28 Nov 2021 17:40:42 -0800 (PST)
Received: from samantha.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id e18sm10367575pgl.50.2021.11.28.17.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 17:40:41 -0800 (PST)
From: wefu@redhat.com
To: anup.patel@wdc.com, atishp04@gmail.com, palmer@dabbelt.com,
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
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH V4 1/2] dt-bindings: riscv: add MMU Standard Extensions
 support for Svpbmt
Date: Mon, 29 Nov 2021 09:40:06 +0800
Message-Id: <20211129014007.286478-2-wefu@redhat.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20211129014007.286478-1-wefu@redhat.com>
References: <20211129014007.286478-1-wefu@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_174048_042402_44BF2451 
X-CRM114-Status: UNSURE (   8.75  )
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

Previous patch has added svpbmt in arch/riscv and add "riscv,svpmbt"
in the DT mmu node. Update dt-bindings related property here.

Signed-off-by: Wei Fu <wefu@redhat.com>
Co-developed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index aa5fb64d57eb..9ff9cbdd8a85 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -63,6 +63,16 @@ properties:
       - riscv,sv48
       - riscv,none
 
+  mmu:
+    description:
+      Describes the CPU's MMU Standard Extensions support.
+      These values originate from the RISC-V Privileged
+      Specification document, available from
+      https://riscv.org/specifications/
+    $ref: '/schemas/types.yaml#/definitions/string'
+    enum:
+      - riscv,svpmbt
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
