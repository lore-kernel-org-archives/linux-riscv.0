Return-Path: <SRS0=wXHl=NI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DF8C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Aug 2021 17:48:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9371E60FD7
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Aug 2021 17:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9371E60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fCc95dHjoFNboi2KmzUXD/Hqi2M9PaejE+pqN6dyEuE=; b=FSaCXDcJJEzldR
	2ppTLN4kzhvQbpCCl42M2SD079Jol/Ml+OTZXWosIt9s/DZVylbBgfit5fgwxk9zMSVhSB+hcOVgV
	mbP6zm32mvo/CwP6d90C1WvcD2pQQAoiBirfLe5crt1whel9dGxHGpZmtWVoEPJlVTZGlHRK5kwZw
	Tgq7cTr1c3SxEo2Atu4xbUhHQllpZFSfFo1QxMnbldkI2uxWO7k0aA3RGFZxNY+Ua4TpH0+5pIWX/
	JxSbAtqaceY5Cd7UgGYK91CC/sqhUZo8hoe7VCrsAOov+uVb/UGeh5ZCEmXS70oFIRsCKdk4Y5ZJ7
	m0Er5GUIyd0+xYzSA/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG3Bx-003AKs-AW; Tue, 17 Aug 2021 17:48:01 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG3Bu-003AKL-Hl
 for linux-riscv@lists.infradead.org; Tue, 17 Aug 2021 17:47:59 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 w22-20020a056830411600b0048bcf4c6bd9so3200159ott.8
 for <linux-riscv@lists.infradead.org>; Tue, 17 Aug 2021 10:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YfAdp6URMwEzxS/XiQNwuq815IjwGiZo7iZNdeIi3M=;
 b=EWdC1X0PI9eXb7br/haNhKHvQgTK7lJl+2GsQxrrJzmsdwd8/UmIc6WTQnay2Ix2+4
 RFwUs2StC4DoUEC0RphOEy13JV55l3s4wxd6sbqI+RL5e8GOd3MJiz4ta1XjL9T0DKt9
 qSXAX4FGqVlOsDHgV0rvn5NLygefLYfRkr2W89xdOCaHBIijf53lbVhQBbFymGEhPOml
 /TUlJ8y4nui3KgsP2vS1OU5p0SlRi2DMzD/yuU1+vyTuNaAVCA5+kpPSOsO40WDZAVyP
 2my3F+e7FIN/ATuf5tXotDQD82EP3X3N028zTfQARCATI84wSSl3tASCPX40pvP/zgRM
 J/qA==
X-Gm-Message-State: AOAM533+wvOlXPY+9mHaJygrQtrWpGwmedx8BzxwdVt9MUPIFrkEPVhQ
 GDUOfdibc+5N2HsIRGWJ9w==
X-Google-Smtp-Source: ABdhPJy7VVi+GLOzKivpGy0YvumVaoyarVaWyaesbRopUsLuB4FE1R2sf4Hyp3lR/rjUoReBiRlr1Q==
X-Received: by 2002:a9d:4785:: with SMTP id b5mr3566539otf.188.1629222476823; 
 Tue, 17 Aug 2021 10:47:56 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id o24sm617304oie.17.2021.08.17.10.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 10:47:56 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sagar Kadam <sagar.kadam@sifive.com>, Yash Shah <yash.shah@sifive.com>,
 linux-riscv@lists.infradead.org
Subject: [PATCH] dt-bindings: sifive-l2-cache: Fix 'select' matching
Date: Tue, 17 Aug 2021 12:47:55 -0500
Message-Id: <20210817174755.541735-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_104758_632706_9C5EBE1D 
X-CRM114-Status: UNSURE (   9.84  )
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

When the schema fixups are applied to 'select' the result is a single
entry is required for a match, but that will never match as there should
be 2 entries. Also, a 'select' schema should have the widest possible
match, so use 'contains' which matches the compatible string(s) in any
position and not just the first position.

Fixes: 993dcfac64eb ("dt-bindings: riscv: sifive-l2-cache: convert bindings to json-schema")
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Sagar Kadam <sagar.kadam@sifive.com>
Cc: Yash Shah <yash.shah@sifive.com>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/riscv/sifive-l2-cache.yaml        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
index 1d38ff76d18f..2b1f91603897 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
@@ -24,10 +24,10 @@ allOf:
 select:
   properties:
     compatible:
-      items:
-        - enum:
-            - sifive,fu540-c000-ccache
-            - sifive,fu740-c000-ccache
+      contains:
+        enum:
+          - sifive,fu540-c000-ccache
+          - sifive,fu740-c000-ccache
 
   required:
     - compatible
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
