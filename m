Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC7EC43219
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 16:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gA/iUjs3nul2I4J5uslcXVPuw+OnkT5daThqqacOLEQ=; b=KSTA1lCHol7YH8
	QO4O4vqcMFn/xmemombhl89zzzTwlrIzyf9hAwWo0jBPCdUPHxMgIPRJFCmGUPEw/DSRWB0vLKemT
	iBDzPMVb2cXaLP7mlqJMdF2EmuQzCNDbsVpr0HkIOH2VJEIMFEZogeTlTlitXFsPrBIqUAVliau5p
	qNp1FA2uW2yB3TbDLRT2HKOR9RLLfJoO4YkM5IGtqNxUYgsylJAc9OMJG5NCJeWalWQ0RGPS788/Q
	4PZwfKmOucbBDn7diSCZnXS0el3Spxh+9UuXGG7WP4l/mjOyw4Ko7Kg176UQ7N+rxhLo41HvZCL7c
	+2odd0mDEHyidkeuN68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Bf-00CRGL-DL; Thu, 13 Oct 2022 16:35:59 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj1Ba-00CRDS-S0
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 16:35:56 +0000
Received: by mail-pg1-x531.google.com with SMTP id 129so2004665pgc.5
        for <linux-riscv@lists.infradead.org>; Thu, 13 Oct 2022 09:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kwuxZs+UoVTYbZWTGQWT2WRev/DUFUJX/Y2pD+tMq4=;
        b=VVn8RttxzdFeDoBXehh9mOAXlVXdmCyyqS4xskYEc3GOM/k5ejarZMa23nqbmkBReX
         o7939g8vbFsBQz7PV4FZdXDExepzO9l7Hj2TLHTpdTfSgNPAaSvFG/aYr30qYRpmiEt4
         sZ+BB2jh5wwyeLWFaxCbmk5QoyCEbcDgsUvTSngdvuAVuSNbaxIUQbteFZ8gvpy2J8zv
         MEt68Pj3LiP9/kk51XdNvXND/i8Lg6l1HerxwUZxcbrVOvfb17HV2nu/gqkEKuXl2RVB
         8r8ueK4uwnIQnSqTkKcw1PQLqMvmce24j8VN7wPCtx5v4POkOqPCwVvgxwYVWQP4Ymws
         Yyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kwuxZs+UoVTYbZWTGQWT2WRev/DUFUJX/Y2pD+tMq4=;
        b=i3HdoTZR4aHlGUpXZ8/3qjkk30Rw+xX3MyBZuJTsIvUAqgE+IbpjCc5nhP2fCyBZXy
         d6dIqNnjUcW07tNPOzq/v1NsA/JNKFL0ADHlCAje0rw8xDdQYWEagMe5/1hSIDkM97nl
         BbovXuEouq/ghx+IFjqUcvyl4felaQ9xy0TwG6w2C5sRTftjd0WGMQqov0ecE+Evmgmx
         l1bh57rproPj/zkXUBFOvecHpS1zv0SUEcIbX4YBfU6I+/zd8TwUicuAv4ygfxApDcYI
         SPN8zfSv4R5WGzylXN+hj3juE9ZIyrLwEYftlyTo3XdU0XrDsb3dqBxogl3KZuCwA7AX
         BLBw==
X-Gm-Message-State: ACrzQf2MQdv95/4O6oF/UZki2Ba2AclWBSRaLCuBvu+ExiSlInoJLFVi
	tvJQTx+sYiNO3n4GMSjss/CIK/zh9J65iQ==
X-Google-Smtp-Source: AMsMyM5oUZBy0uX+3+0/wzsy1seyFA2Fyi4RjkgOGTqHBKfgXzt9sh2Xobdlov+xB9cOaIOjczPuBg==
X-Received: by 2002:a05:6a00:2402:b0:52c:81cf:8df2 with SMTP id z2-20020a056a00240200b0052c81cf8df2mr421785pfh.40.1665678952004;
        Thu, 13 Oct 2022 09:35:52 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n13-20020a170902d2cd00b00183c67844aesm105170plc.22.2022.10.13.09.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:35:51 -0700 (PDT)
Subject: [PATCH v1 3/5] dt-bindings: Add RISC-V misaligned access performance
Date: Thu, 13 Oct 2022 09:35:49 -0700
Message-Id: <20221013163551.6775-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013163551.6775-1-palmer@rivosinc.com>
References: <20221013163551.6775-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_093554_918263_99E11E44 
X-CRM114-Status: UNSURE (   9.09  )
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

This key allows device trees to specify the performance of misaligned
accesses to main memory regions from each CPU in the system.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 873dd12f6e89..832ae9101d05 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -83,6 +83,21 @@ properties:
       - rv64imac
       - rv64imafdc
 
+  riscv,misaligned-access-performance:
+    description:
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
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
