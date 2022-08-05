Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52718C00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5GyzTIROOKGdNJ02i7aDr4sPDZ0MwvVsrPOEge+L00=; b=D7PKwjXvnhaiCS
	z14e/HR5W1WAfEi5xe4hKl18pyOVCrmRtQ55yx78UGzBCcw5qTdMdg6cqQhGhjE+GNisx9tnXM+T8
	8EBkfEoXr7I5tIkoPt3GyogjolDsLwj7kwrUr2KIQ1ROFViMWr+oRMHfNZpDkf2coZyrldA0lF4+j
	yZ6PFTUiYV2P7qqSLsd58Lk2X212G/k/MP2ikdZdA23zDRUv9LnuQfjkQI8piCI1wPTNF4CV1e2SD
	m9si08hIs6qrd/Jpd9lFLkt41SBLuB5rBYjsloDoxXKJ0ySxsYuFNpz2TOjPa/P4Ts9rgCRrX13bC
	Jpiqj1QvGE1j878ha0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK0CR-00Gkli-3L; Fri, 05 Aug 2022 16:29:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK0CE-00Gkas-Ra
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 16:29:12 +0000
Received: by mail-wr1-x435.google.com with SMTP id j7so3832904wrh.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 09:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Bx9G8JNLiLJhDs2y+OulTQ6Arh93SHt8PJNhnkzS76A=;
        b=G8MjgRH1Dn5QHvCiGLUoHF1aRHWwuzqsY8+wvXJca/a+ZTHD0d/fJq9ByzAG71C4Gm
         brpuYzE4q5EjV6KvPCrpP4q8RpKDe6BQP38FTgiaz7FvOaWB6HnBXC7Y+QemmGTQ6XFG
         Lql/qMKUyGD9o89w4PxplbuWHyocXiBfg11Ydjl3fzyMGp0iFa5haHQaEJ6LYLEGv/VD
         VoFzWhQ3mh9Itj2HrYNPxF09k6/cIDE9Bhv/zErgH0H7Z96OQE0yeeQlrN1EThLHsKpH
         JEYKHdu+rxrhXp70NsNm7i69uxBxb+6KjfurAgrsGgo0faWi1e/J/E9qFugnQXv6KItI
         NW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Bx9G8JNLiLJhDs2y+OulTQ6Arh93SHt8PJNhnkzS76A=;
        b=cea7jxX8CioOeJ1seezPddKwwu0woeZH8mpmu9KHq5rD+1Z28QPwdIfxeojZYMf5H2
         W3Akx5SEAySVAYpUJnluC3YT3lrNkXo5k0mRLGB1VMUkgmHcmdCVRg9IvWI0mpQ+uByJ
         r5gp/vcuWhrsv0GF03UtsL9zwbYzOKdMEGu+Rbi+xDfxwFHSfM8WO5uMGJeoef+cKrU0
         ddiwB++FWywt/dX62aqIzTujLWB2llHKBIcuGsN85lF8det/cAGEUZ3QnlIeUi3l00rY
         zNzz54Dd6Oyrv0EF6oQx0qpYbBLb4z1GYDnKzQn8zskZaCqW24T+3KfQXXZNVMc0f4JE
         Sypw==
X-Gm-Message-State: ACgBeo13gBvswXp6+lXRbJqx6PZ9kLxMYdxdzD8cFwag1Id1zgD+xljt
	dsA3ZT+KO910chXKffvSFFTrVg==
X-Google-Smtp-Source: AA6agR4qNHuK519Im+LmKC2Dyrt7fi+TNPv6Ialp08tZQks0jZtMsiBr2xk+CxzRIiLrK+LeQ/NxSg==
X-Received: by 2002:adf:fbc6:0:b0:21d:3fc3:99e with SMTP id d6-20020adffbc6000000b0021d3fc3099emr4737953wrs.550.1659716946942;
        Fri, 05 Aug 2022 09:29:06 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id b10-20020a056000054a00b00220633d96f2sm5210086wrf.72.2022.08.05.09.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 09:29:06 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 3/3] dt-bindings: riscv: add new riscv,isa strings for emulators
Date: Fri,  5 Aug 2022 17:28:45 +0100
Message-Id: <20220805162844.1554247-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805162844.1554247-1-mail@conchuod.ie>
References: <20220805162844.1554247-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_092910_951096_5720DF4B 
X-CRM114-Status: GOOD (  12.60  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The QEMU virt and spike machines currently export a riscv,isa string of
"rv64imafdcsuh", but this obviously has illegal extensions in it.
The presense of "su" is a QEMU bug, so add an entry for the valid
portion of the isa string.

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Although the commit message says "a" string, I have added more than one
isa string. My patched version of QEMU emits the full string with the
multi letter extensions and I am not sure what the policy is for
including them in the binding. Obviously I am more than willing to
change the patch text if needed.
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d632ac76532e..59b942c5b9aa 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -77,6 +77,8 @@ properties:
     enum:
       - rv64imac
       - rv64imafdc
+      - rv64imafdch
+      - rv64imafdch_zicsr_zifencei_zba_zbb_zbc_zbs
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
