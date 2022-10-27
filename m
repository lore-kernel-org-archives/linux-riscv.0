Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16FEFA3740
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 17:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x//kdq5t7dxj7IEdKsfaaCY2fxthRFVhnGPGRJEryC4=; b=We4WsWDgo/nH16
	t3pG8H+2PLNYHW1dJLtYbzauNXYPMAr02qStsWUwFQAT2iJkCfPpDkdS/jjnZ1TTjo5cJwTMaZPwW
	r4yMJ1tDSrwKt5ufV9uFfEr+BYXRR4xXhmSwKvfoMuha+S5qXVEBkQ6uBqz4WP8YRFTAAMrog2aFD
	gyTMmEyBrvm8ALIN4aJ3XNgGVofEHau3isPGpc7o73X5RfrWjrWycBKGq1m+q79N98dpGIHKS0Rr7
	XpjjpsO2FXnfeSvtXA6wCnkSNWIKYzEgvfMB/LEZ/jWn9LQYZcYJ+ixkStkxueYeT1QaL3OjyK70d
	1M2J8HQgn5FI+N3ok0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6ch-00ELvr-KB; Thu, 27 Oct 2022 17:24:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6cb-00ELsy-Jn
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 17:24:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id n14so1447046wmq.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jamieiles.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7H2fA3TgVsTYY/HIaf7pUlh5mHTNEuV++5yA9EyQnCw=;
        b=UbmdkIwdbHq9cSHTl01bB6MfZ2lS0V89zLsNmFGPJa10O9FbjvfX9LxUf9NsK7DOwv
         DIhH1LLch/++tCuAvzslyOKThcImUYgFkJl7gymYSesP6BuOHO34tEPFc3nKcWtwwUcx
         /f5qM5fU92ORMbNw/jle38WStJj0FcauGvSn+XhXGVuSbPypmHKVLIlg/tSZKmasW0nA
         HVdVdfwOt3XQ5o/3n60cMtV33hZvaL3pbOWbO/TzLSLjddDM1z+xsOAG2x2/BpRb6BZj
         pSKd+n0DqbAY2laW26/u94IcvSBYf67MQwgbJvsCzK1P37R/PILZZVW5kELb0NVlWl5E
         vJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7H2fA3TgVsTYY/HIaf7pUlh5mHTNEuV++5yA9EyQnCw=;
        b=HTUMfstPsnPOWOq0nWEnH3di60+amXSL2vpe8iPaGwXqLv/rKNOudTQrxINgbQ/8il
         vr+uEDEQvkpZs16emPwMKqlIbwyJ0/2gFxcFE5T3V5j6QSXdpy2WKyPXn02zz1z2gZp7
         oZG/FB1I1+jBCN+yi8W7wRrlwZ+NW5nDnyVpClM+8x97pz5yLvce2/IT33bZra7JAWHi
         kDuRdjDhQN2LGDDrAN2LcaUIqBjC9wmhpAUoT1qslE59+l5IgZ29QxpsMjYGY+srcpHQ
         HiBjIvBsTHFbmBUdX5yLAeyug+ewJpqjhL4qLzEETEtRN/Q9tO7qeK3JjFLs2pmj3nf5
         Q+2g==
X-Gm-Message-State: ACrzQf1x9RS5XH8hneJM0ezDzfnZeyODKxaep+qppzFCwBevJ/XGLtzj
	XZh9l4SSxPEsj1mijYpBo7nR2/mYF27u7A==
X-Google-Smtp-Source: AMsMyM5V7Mk8cH1MhR/deswphZSCqThNaZoLkVpf5zbxDhnuU0HhG/C7Y6CRCI5R2dnkuFrrg9Fxtg==
X-Received: by 2002:a05:600c:5407:b0:3be:d303:d352 with SMTP id he7-20020a05600c540700b003bed303d352mr6636455wmb.94.1666891484811;
        Thu, 27 Oct 2022 10:24:44 -0700 (PDT)
Received: from localhost ([5.181.106.148])
        by smtp.gmail.com with ESMTPSA id e10-20020a5d4e8a000000b002367ad808a9sm1686529wru.30.2022.10.27.10.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 10:24:44 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-riscv@lists.infradead.org
Cc: Jamie Iles <jamie@jamieiles.com>
Subject: [PATCH 0/4] RISC-V: Dynamic ftrace support for RV32I
Date: Thu, 27 Oct 2022 18:24:31 +0100
Message-Id: <20221027172435.2687118-1-jamie@jamieiles.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_102449_933330_238A0A39 
X-CRM114-Status: UNSURE (   7.41  )
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

This series enables dynamic ftrace support for RV32I bringing it to 
parity with RV64I.  Most of the work is already there, this is largely 
just assembly fixes to handle register sizes, correct handling of the 
psABI calling convention and Kconfig change.

Validated with all ftrace boot time self test with qemu for RV32I and 
RV64I in addition to real tracing on an RV32I FPGA design.

Jamie Iles (4):
  RISC-V: use REG_S/REG_L for mcount
  RISC-V: reduce mcount save space on RV32
  RISC-V: preserve a1 in mcount
  RISC-V: enable dynamic ftrace for RV32I

 arch/riscv/Kconfig         | 10 ++++-----
 arch/riscv/kernel/mcount.S | 44 ++++++++++++++++++++------------------
 2 files changed, 28 insertions(+), 26 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
