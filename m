Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2262C636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t61BxAZ0P58HkswAytq931soRcV9YqPmbWlLfOnR90c=; b=E1N4j9aXSx77fH
	ge9d8atl0m7hmCzTk0rMxZ4p6jA3vowMWqwO36rjBxQecgZ9VpnfrLBlgfwx9ruY60tW17+e4hAGR
	yENsRL0TPK5AGlFDTBPGMylDnSihUH8q7jK+wYhdfJFApqSlD5vPHXbApv02mMekfplFDOf8m6CyY
	yG2yoxRk32U74milLRxJQLqVE0fags8B9HO/2h7fFLNZF0vyiEndpvPYBC3BGSDDPnOR4z8HO3vXO
	91gVYxH/vIaKaAQi0hjPSBjE+cTdzCnP0v1ngS3/ODUA3ZMglQWPb/6Ig1cyfmqOTplWlhc5nSOgf
	jMqzdEclIkIz+0q8xwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYpy-009d30-S2; Tue, 21 Feb 2023 20:02:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUYpw-009d1U-Vl
	for linux-riscv@bombadil.infradead.org; Tue, 21 Feb 2023 20:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=h4Uz8oInxrBVxdaNnCcRWzHNxIOpRGtwNCns0Csq24o=; b=CJk4iqLu7ZwezXLGZ/WXg2xxSJ
	+Q+FZUR2SEQMo2HGpmM7azg0VEltnSgZSupcNHCpiiKI6BFQ9IOpi4vnnG7SFk12n3Gue8fNGb6VL
	YkWgA7W0q/nfdRWHq3HOkaS43hikSEgSQnzoJxY0r88seDkZ4qJvpFE9IMJ/TtzcdQDFwYKd8YReP
	4GWyMIVlgD9Qw4a8y9Risj840zwsB9LPxklD/PxAo6bg3TG152jXzAY0Ls+SLapaJ4z5vl3daR6pv
	n/rsGDm9C9tA29UMQ5FZWfIIOcTAIcSIXQV0JZbAY8z0myBnMRsz5eQO09nfXuPEYAPQBjzLPfFME
	jJHLM9aQ==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUY19-00CGWH-31
	for linux-riscv@lists.infradead.org;
	Tue, 21 Feb 2023 19:09:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id il18-20020a17090b165200b0023127b2d602so5851341pjb.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4Uz8oInxrBVxdaNnCcRWzHNxIOpRGtwNCns0Csq24o=;
        b=5CAoJgBaxdsOsjJt2ARXvUAXbErBCB8xjhCRl/00BIB0m+EhiyRU3XZSidGXeE83LK
         +FRtmHOsemIRPQ/ytDa3xi5xQubu32PfYgOv1GgPMlj8GBuwVt+RKxxhFTTWQgWjLJbH
         yVO3GZ6Dl6SpXYXL2PGhBsRPKRHAhmrU/mwngeMnCLv+FnBGjy3WnIrrSyPN0GYSZyeo
         jlCTpaCtDtXLMs75oLfPUTbR6nm5b9ZUPk1JPx7ptYDFvYWEZy841oLGvuf8Tn0KoTed
         qy2eDXvLc8W845c/ngN141rjsv76Zdue6P6r4RixeblK422nJLdTcHMc3EqqMVYNZDZP
         9Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4Uz8oInxrBVxdaNnCcRWzHNxIOpRGtwNCns0Csq24o=;
        b=G22dNt3s7IyVFUJTKr3SEPDiBi41zm3E4digFjrENSdos/dh+hEZ40kEGPf+lXDPFN
         04+KkSLkkThGjw0/3/FFSz2LnxznsOTQ6yrPLVCCA+UhYhfWpBLUnY0cErX1mXDbj/mJ
         Pg11+Io5+Og93oRFwTvMkJBkVJdCp9XGf+ymQMkXGwAfND3hyOfv7o21TDaCkKWEUYNS
         cIbl0n90vUdWLD4oLW+y76LQwXAj4uuFLHJP1hKhf2/TUpr/KrSmbYJ+YDcglcT3EKAe
         juQnhTMmEueuu/DoEqxfvttzFkXF4eEmplq2/A8xmyPcD96ltdE8w83raP8pUfBRGs7R
         zUBA==
X-Gm-Message-State: AO0yUKUgCxMVdCmu1FQ0DYquaWNPBa/Q1ZkRI8Y0YtmK+6sAJFVB7gX5
	5yuVi3XfuGJ8jRKpZNjQ1AN5Jg==
X-Google-Smtp-Source: AK7set+it96+69j6MVRhBhTTnrkru5X6NVtEvUnH9vgxsurcSiwoU7po5lf6y/VdEVorq3aQjAMmjw==
X-Received: by 2002:a17:902:c407:b0:19b:dbf7:f9d1 with SMTP id k7-20020a170902c40700b0019bdbf7f9d1mr6464689plk.37.1677006573615;
        Tue, 21 Feb 2023 11:09:33 -0800 (PST)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902b61000b0019602b2c00csm1583863pls.175.2023.02.21.11.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:33 -0800 (PST)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: heiko@sntech.de,
	Conor Dooley <conor@kernel.org>,
	slewis@rivosinc.com,
	vineetg@rivosinc.com,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 4/7] dt-bindings: Add RISC-V misaligned access performance
Date: Tue, 21 Feb 2023 11:08:55 -0800
Message-Id: <20230221190858.3159617-5-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221190858.3159617-1-evan@rivosinc.com>
References: <20230221190858.3159617-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_190936_152989_1A83D013 
X-CRM114-Status: GOOD (  10.65  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

This key allows device trees to specify the performance of misaligned
accesses to main memory regions from each CPU in the system.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Evan Green <evan@rivosinc.com>
---

Changes in v3:
 - Added | to description: to make dt-checker happy.

 Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c6720764e765..f79e9e5c5ee9 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -85,6 +85,21 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/string"
     pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
 
+  riscv,misaligned-access-performance:
+    description: |
+      Identifies the performance of misaligned memory accesses to main memory
+      regions.  There are three flavors of unaligned access performance: "emulated"
+      means that misaligned accesses are emulated via software and thus
+      extremely slow, "slow" means that misaligned accesses are supported by
+      hardware but still slower that aligned accesses sequences, and "fast"
+      means that misaligned accesses are as fast or faster than the
+      cooresponding aligned accesses sequences.
+    $ref: "/schemas/types.yaml#/definitions/string"
+    enum:
+      - emulated
+      - slow
+      - fast
+
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
