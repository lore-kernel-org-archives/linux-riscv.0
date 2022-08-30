Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D426EECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 08:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jsKbvz+vgzMfZANaNxG3mrgE7x7BmSASLNk2Sn3hGQ=; b=VTDmOkH2x9kmwX
	bOr50fPNmGuepKGdoRBtYgag+1/ehBONBBPzfm8FGCddloQsuZZ7cpYDIlxc+SH3qxpW6bafRS7eF
	jRLRYdjqhSn+x/KDX99TgDTnniZZwMAPtrB6tpTSIlfbLAF0kEIFhFrhOm57UVD/8hq11px/UbCYD
	CEmK3ib7to/qb4xGlybPRQlnvv0rwQkPUQLeQwmF6LMaf+uMnWOZtB0M8FXGADQqNPRFeFjv0bF6V
	BquDlmByD1WyCZPr/M2P8sPiDXfMouXjAtPc16jsET5adASlHz5oCWnEx9mC9OnSiwA8MjFFtg8sF
	9gQC3dlaW/OR+bzQSoqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwjH-00FGgs-EU; Tue, 30 Aug 2022 08:36:15 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwjE-00FGeU-PQ
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 08:36:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id n17so13192718wrm.4
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7s4lILp9cgE/VG98/TN3p3rL3NeB7y+YGCWWz/Ak6qo=;
        b=f8vJlaQIaOD0LhgkU6RImXqEPI+WgCAqwQAigvfLBKFYbgeH2rlKl0k8DreR70zh+w
         0C8641L/YrYbXe2uHosTogQlDX+CodlwCwKvvxOZPuJ7wqtB7SU/sVMp7Vz8A11GTENW
         BiMkFO2VKDV1xuFaOyFYRhr9KrAa37hNCUmNf9Q3fdRhNq2YKzbzhv/3zU+pvjkgGaK9
         fgjdT/I+Cc9xwKdsxiylIuc0OC1bD8TF4EXzH6X39WyZCbVbkfqo14vI3O+z5AEHMjD+
         TYa4+/l0DlOFsrkUktogRI2vO+YUUUYhwkCa/JRcBEvhZhhZTJvGl2m4oID3dNzJGrq2
         g2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7s4lILp9cgE/VG98/TN3p3rL3NeB7y+YGCWWz/Ak6qo=;
        b=7cJIWVKey7vsqbgonQvWITWoANCQKfq+gs8OHYI1fsiKSiFsSX69gCg/0hWALyLjSa
         E21Ld7NYMH9+bldp+l5Tk6Xbe1Lxoy1D0k/Au5YmYPAfwWTRpkZ0bVvy5ayJFAbats8Z
         YCufoNtz2oREAAALuaJJnMg7u6QhnicUCBkKl5m6ehJEkTbe4/hYeI2orji1k76Y2Qxg
         kStLQHv4canWbAW5Tmu3LAgYzyyVvzUzUcSltwWdZyQ9eB0mIBTLjiGeyZjjsiqr0r+m
         kXGoMAS2EDGxqpUpTnHocG7iLHCpeyBsodO9xJgeWmYpnJoQ0z9IIe+e5rP+gWiuTdtl
         P/gw==
X-Gm-Message-State: ACgBeo349b42TS5ousgLQ/xNlHWDbQhwh9vPRYHw1GC27fPasD3TLEdI
	mZjaR6boDJwy07HPyaMVU4WEbQ==
X-Google-Smtp-Source: AA6agR5q3TtmuYX0WKLzHbeJm8JxO08jiubOnZgNqy61AvpeJ26B2/whlTWLVxv2LWR+oHv6O3ovqw==
X-Received: by 2002:a5d:4d0b:0:b0:226:d4d8:c3da with SMTP id z11-20020a5d4d0b000000b00226d4d8c3damr6604794wrt.370.1661848568754;
        Tue, 30 Aug 2022 01:36:08 -0700 (PDT)
Received: from rainbowdash.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id c66-20020a1c3545000000b003a4efb794d7sm13129915wma.36.2022.08.30.01.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 01:36:08 -0700 (PDT)
From: Ben Dooks <ben.dooks@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH] dt-bindings: sifive-ccache: fix cache level for l3 cache
Date: Tue, 30 Aug 2022 09:36:06 +0100
Message-Id: <20220830083606.1681385-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220829062202.3287-1-zong.li@sifive.com>
References: <20220829062202.3287-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_013612_870651_F731529B 
X-CRM114-Status: UNSURE (   9.59  )
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

With newer cores such as the p550, the SiFive composable cache can be
a level 3 cache. Update the cache level to be one of 2 or 3.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 Documentation/devicetree/bindings/riscv/sifive-ccache.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
index 1a64a5384e36..6190deb65455 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-ccache.yaml
@@ -45,7 +45,7 @@ properties:
     const: 64
 
   cache-level:
-    const: 2
+    enum: [2, 3]
 
   cache-sets:
     enum: [1024, 2048]
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
