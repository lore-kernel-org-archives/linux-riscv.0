Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C8A10F3DEF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 17:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BL0Ednh7KdJCLiVnZvTOJTLdj8pXChz6VlvZ2VIzNZo=; b=1M9lO2kDRTrYcd
	W1mvZXB9I2AzJxJUFEEpWX9UCjGUFEwhZuUQlR2mCDsDcW/ZcUv9fv1ferBhuBUBTIQX28zCMCU8A
	9F4EMGdpQI+l9VZL3m2+ofVl0XUwoFxATsRzc7Z8redzRL0JdBIyHXaPsEEG6JWNWs2y2gxUrNDs4
	PddJ0P4sAUaPHtq7FUnyA16RIIDBRUtPzYa79vK8EZv0VosM7e5vyXeLzPNTpwn+7GvCRQeWeJC2H
	8iXMJcJS9gP/jmEW/PkyjqUr9MULkoD2CC2jpGkwhHby/rlBYaqIt7KKcH/ON8PVrMosGMorOgulQ
	IPHta5FFLDXeUdFAt8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Xbc-000000099lv-3Q1z;
	Sat, 28 Mar 2026 17:37:52 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6XbZ-000000099kv-2c4w
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 17:37:50 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-50b268fba9aso28616841cf.3
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 10:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774719468; x=1775324268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=XR4PtI56yHZwoWzgwoMFw6dtkK6r6kipFGBp2UeREQzWpZDWxYR/Sa1m/O+QamLk20
         9STm6NqoOaVNvJfToRAQq6tdpQnJZOag9WHaIAP/OfceP2FC62pdtN/zI4imb7svKKT+
         vaoKuqxDARzYrLzEu0s9sp06teIyAMTsVNxrolMP0D/cPBL3B8bLMcMHB6cM8/KBBCDP
         Uy3QjckejpTka2mbYSBQlQqcwNQcO32L3iaCm1NHBMAY90Ui8nC3zeROwMxyZs+Ybs/d
         fQhonDQGsbK34RcZTZZcE070ew4gTMaaWz40mWuWjltXdaFYz/KKXkIxGIIlRoVDnxLX
         rsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774719468; x=1775324268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=Y1nr+5hQKEk1r2fB8u1cARnYoMs77AGYWs9F1BVVDRkr1c+2mdMVSc6HP1HLSaxtBl
         zYrDn9p66DJurU/jOOy4J7VgwFe3ENUVE/q0+1HDl3isCqMFOJttnFls3wqCvn5wguYn
         +6wa+zys7lu84niR6MDv8k0MAdgTRAptAEz1qxEzLnZ7HpZ+8PaTqVNwzWCS7Npt+N71
         rMxGsk08cCmCO3/P2AvtfTJuztCeUYfWHkdhxAL0ZWQExDBYABgQur1gJE3LaJw4oKNA
         zANBHNKQ0DMv0B9i5eoSaCuQMFanMBy+RBy8jIdRo+PNY/zPNi2s+CC2e4eJe8xMoWNZ
         LHsw==
X-Forwarded-Encrypted: i=1; AJvYcCVp+LEOKjN0CeIkZSmb7yInWd7znLCnZCPPE5P9EWCKhenYaeq+MczBhT6PQJxMfSD0QaJb3oO79GMpNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQG4CAy24w+nQvcVDgn2PuNCSd9JvwDGeUto7GJhdE5CXRzzla
	LMRr2mSBU7Lch0BFRdwXS9wX/mJfM4U/UFBDX4LTKfegt4QOGOhdszlf
X-Gm-Gg: ATEYQzxnh0S2I+ryqu7sAN4aW1mCsgaqEz0txXaDQ+bdQu3W0ci0fJKi5xIUiuXp56R
	aKgjD2d99THBoyyAT/JBd7CiOvr9ifkPZ3+JR16bUHAv+eP2jh1wzqZnvR9u2KVaOI2aV53jcto
	VmVwu9ALJA+2fdOa5v5J1kaB5barDOC+DejShhutLQQYK5qIIEOZWyXaO9cqHPlq9z1xv9qgI8k
	PBVYHnkPGFyk/Vt7nqFfMO+DNQGLUvXU9I8XBKnDLHfyVPvlqqz3VxeEVRIXwUnsFRDfl/jkY+N
	qDqkLqyJhyZ6qofjRK6wfAIIgZnrAMBs1UX/KJyLeiCWtdgcKAhdVEqcfYtgYMq3XuiEykY/evw
	d67zeyYdOp12I9dGCq/xbIWn/PJthEThoEhaEeJ6m+Va6shNn+EIPT269FIqnIPblnWZP3MOXJu
	+xFZwtyriUurYwrPbyHs/+cEMWBtFQanMV+ylUMkMtyeC8T/q8+uRGzbyd
X-Received: by 2002:ac8:7f0d:0:b0:50b:3be7:afd with SMTP id d75a77b69052e-50ba39fffe4mr97544421cf.65.1774719468311;
        Sat, 28 Mar 2026 10:37:48 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c9c93asm26629641cf.7.2026.03.28.10.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 10:37:48 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v4 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Sat, 28 Mar 2026 13:34:46 -0400
Message-ID: <20260328173450.219664-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328173450.219664-1-josh.milas@gmail.com>
References: <20260328173450.219664-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_103749_663054_1E8ECA3F 
X-CRM114-Status: UNSURE (   7.52  )
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

Document the compatible strings for the Milk-V Duo S board [1]
which uses the SOPHGO SG2000 SoC.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
index 1c502618de51f..0b6fbab48b743 100644
--- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
@@ -31,6 +31,10 @@ properties:
               - milkv,duo-module-01-evb
           - const: milkv,duo-module-01
           - const: sophgo,sg2000
+      - items:
+          - enum:
+              - milkv,duo-s
+          - const: sophgo,sg2000
       - items:
           - enum:
               - sipeed,licheerv-nano-b
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
