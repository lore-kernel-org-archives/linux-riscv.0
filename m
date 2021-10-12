Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C69EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 18:34:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED63D60C40
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 18:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED63D60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4Zd62ZsXTsM0LlqsT6PUFaaDXVRxDZCmsVe3S2R9y4=; b=sIDIGYCMVzfgM/
	lI/4CddCMlrx3oGZRVakZ3JEdUhwcrCMYc2uuqIQW3ImweZmDf87TrzACF21AtrT1bWseboiabPHo
	lx3JqO6cIURs7MoauxRup7vSEL27b6ADsJxo/hneRw0LpObgvKcF+F0RL1zmkrv4sswdE+Az2imcx
	F+Rq8zXX/F4m7CAouIAQMEb+Ux1qmgd7oa5LP1O5djfYQ1RL0+vchHkLpSXLtxxzRELiTEk+ndxG8
	mA1H9hyI9oTR6fzuWnyYLzq8fx35mtXAHiOQMW92Ezr7RdGGmJcGUtP+XqUcbPjxAuZVqRgFzkB5G
	EA8HSNlAg4/vVgA5SwMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maMbY-00DlBl-Qu; Tue, 12 Oct 2021 18:34:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maMbW-00DlAo-7B
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 18:34:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634063660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYn2UN+PCHx5GV9R556nliuyOIUvMr2XfooerQCV58o=;
 b=ZIS5s4+b1QnN5vMf6B77ot+FYWJjqfH+fWJdCc3r3MHkHpFFx3wMO8s3jN34ghvgxKrdAi
 7LjWReMMLo/MyFnuUFcnHUUaU31oh412qk61V6oQi1as78aUwrZYPw+iShqdOAJmLGVDoU
 f7aRmv7ZAWuws84yb0pNFvs3Zl5Zloo=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-DNo784V6PISLTWXJtknYsA-1; Tue, 12 Oct 2021 14:34:19 -0400
X-MC-Unique: DNo784V6PISLTWXJtknYsA-1
Received: by mail-pj1-f69.google.com with SMTP id
 h9-20020a17090acf0900b001a04e606e13so177757pju.9
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 11:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nYn2UN+PCHx5GV9R556nliuyOIUvMr2XfooerQCV58o=;
 b=gNWqy/m694c6q+KwIrzLN8WuIjxkAfvvwMVWNJehX3lbc5iW6r2VlMOmbTd3UiQPio
 T6VpEi6zIuwx/2fwYXzxX/eeS1BORz2yCyKtsDZcjIAjBBdt2sZub+BCo98e3dETg6vN
 B6TeiG5HKFJIxdfeRgD9uizny02htHwhIn9STG6yjUkJFdEztnZn3td80uJPKTXlkHuj
 NMTF3FQHVMWPG1zirRBcyYFmQwtZXNp+FhSyuYEZ7d9d7558U1Y8mntGbn59X0yokHLh
 jVDt8z/3TCvgXO+50J6SSlIB9gjEv4wUk8aq4GtEX53VSyCBPH/+EVM1WspC9kU6hrTv
 OdBQ==
X-Gm-Message-State: AOAM533uoVSwZCuWL5oyiWs+Zetzr40y/3JuTQef1ywg94lihXYro/lI
 KlwkNWnUhBpLKDrA17ZziX1o5bomQqTEtAc25qKttAXdIM0ChePLROzvtpdbuzFiPNTOErGOepe
 TqHgjof7C63yWw/IYmBygjo2yvitX
X-Received: by 2002:a63:2b12:: with SMTP id r18mr23683920pgr.256.1634063658318; 
 Tue, 12 Oct 2021 11:34:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuhdPj8LMwjOhpOZoKPlUbm6hkFroKNtw/F5RLD4p3o4kgtU+iDfWu7RevbajN7vmCUgI5rg==
X-Received: by 2002:a63:2b12:: with SMTP id r18mr23683880pgr.256.1634063658052; 
 Tue, 12 Oct 2021 11:34:18 -0700 (PDT)
Received: from samantha.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b10sm11617706pfi.122.2021.10.12.11.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 11:34:17 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: riscv: Add mmu-supports with svpbmt
Date: Wed, 13 Oct 2021 02:33:43 +0800
Message-Id: <20211012183344.105637-2-wefu@redhat.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20211012183344.105637-1-wefu@redhat.com>
References: <20211012183344.105637-1-wefu@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wefu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_113422_362975_A8405FA1 
X-CRM114-Status: UNSURE (   8.16  )
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
index e534f6a7cfa1..c481c110d391 100644
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
