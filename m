Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F50EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 22:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zKyoVdxtgT7SfQO3DAF89lVhYoGEc0xJDJgn1QV36FU=; b=Mk4zgVCawNsD3T
	1wVBRVihQPeYA1apNx285uau9qNPsM7+6oXA9HSS6Nl3aHsDr7Z9kkkn7Delva8qycUIMEmnGAtrY
	E7Wy2mme0yBwxjItFCDsknD06p8GVtp3UKyWf8lTF/QXTh0y4vKkAZQ4QPDXi3SgsDyiJQVLgFRob
	yVGOjE5DvqIww1k0MZJFlc9TArDprpd9AWHgHd20AA+WAoUfhz79I1yU9JRxyPMLkUfR96Oz4iYeP
	4oVngELY6wkJdKKNK8xRFCuYef9N9oGsdmfUbw0ZEpHRjAIPYEazxYDim2JiWyRFCIt1ER0vQVJmX
	gYzdfAC4nqLcOLGtgtoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJMEX-00G1UQ-25;
	Tue, 11 Jul 2023 22:53:25 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJMEU-00G1To-1l
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 22:53:23 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-666e6541c98so5668773b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 15:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689116001; x=1691708001;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=QwQpJzgOUtDm0Mu+AsWoTryCpdZUtLIqv4DVHt8QxO4=;
        b=z8OmnTr0seCS26jvOPONBDjhlxJTZYePUhOFpMD0l5VMa3ErlifqcJ4QaapybuHXkt
         JnK0MktPO569YHoUhsD8H7qud2qebEfQpVsUqQnLcj/OZoiw/JXajoEiy9rmOXcW3CZk
         lZ/zoNt4HwMip8aZUm87KsjPhegzRscHZQ17VSNh/vHt1GbaGPYdelRmugrcWFLCxje1
         2q8bNRvWn2vHQaj0bXeRfk44RLjyabxkjzoHy+H1zHcRtUewurb2SDNZfuMGibbb1++2
         MVmP9QiJkf7sbTPh54r+wsU1yTT7jCbMKVOCxT4U1xvyqGS/4PDpAB9m9xc9/wgQt4Pr
         eSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689116001; x=1691708001;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QwQpJzgOUtDm0Mu+AsWoTryCpdZUtLIqv4DVHt8QxO4=;
        b=iCsbg+V1Gus7kCzQFqOUwHxWFWrkQuzZLe7dZIYUnhdq6kmAhALtsVs4rOSxSK+65V
         oc+qyzngpcNdgotZxRB2Cgm5eATP4fVGxKaVYnNt2k57n7aEHtdD8uPbTdxDw74pMYbg
         aI96Mq8IVKag6bHgl9JxXRGfdvcDl0yn0iV/ljWlvxyTCDc13PF2VsaxvZIW1kHnTEr+
         iYysXguasFOmcotWyUSlkCL78IJJPFqS6bHn0M7bdUdyzM69Qp3GxAgk+cdzA3da55/q
         joLcVoN2j7IV359jpm/rXLQENrsYfLJqhtFSVCmIRJz9ZTgn5eRb/jsNlYGG33exq5L+
         8u7A==
X-Gm-Message-State: ABy/qLYaK6vOIhsaWSfEVraeeer6bRdixyoFsPCicdjCpcXUPSGScLmh
	YjCu5gfWpQnPzmL2kvDkPveyCoD2zM2E4fj8HUw=
X-Google-Smtp-Source: APBJJlHpt3AxdwD8vqEhRMiXiTRwfVDLLIQ4wgIZMwTDewDv/hdFpdAz//llB0udmZbexy4ztwb1fQ==
X-Received: by 2002:a05:6a00:39a9:b0:667:e17e:85b7 with SMTP id fi41-20020a056a0039a900b00667e17e85b7mr20232495pfb.1.1689116000734;
        Tue, 11 Jul 2023 15:53:20 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id x13-20020aa784cd000000b00682a61fa525sm2280872pfn.91.2023.07.11.15.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 15:53:20 -0700 (PDT)
Subject: [PATCH] dt-bindings: RISC-V: Re-word the I extension binding
Date: Tue, 11 Jul 2023 15:52:12 -0700
Message-Id: <20230711225212.11542-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org,            devicetree@vger.kernel.org,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_155322_587093_A83B5BC3 
X-CRM114-Status: GOOD (  12.64  )
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

I'd argue this changes the definition of the I binding, as there was
more than just the counters that got split out (CSRs and fence.i at
least).  We haven't released these bindings yet, so IIUC it's OK to
change the definition still.

I think this matches the original intent, or at least what the
implementation does.

Fixes: aeb71e42caae ("dt-bindings: riscv: deprecate riscv,isa")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml        | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cc1f546fdbdc..31ec244bd32f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -67,13 +67,11 @@ properties:
       anyOf:
         # single letter extensions, in canonical order
         - const: i
-          description: |
-            The base integer instruction set, as ratified in the 20191213
-            version of the unprivileged ISA specification.
-
-            This does not include Chapter 10, "Counters", which was moved into
-            the Zicntr and Zihpm extensions after the ratification of the
-            20191213 version of the unprivileged specification.
+          description:
+            The base integer instruction set, as specified by the 2.2
+            version of the unprivileged ISA specification, formally known as
+            the user-level ISA.  This definition of I includes various
+            extensions that were later split out.
 
         - const: m
           description:
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
