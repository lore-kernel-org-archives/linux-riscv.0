Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170DDC04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 11:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jt8c7Hz8vKd1rM+N9TSrxP2JuAOCcETWOfBKlm/EFro=; b=jixP/EyW2GreuF
	vhPazz8fgYBo7R7PO835dE1oOqO/tZ7aovWQNAqthYYm9YOG8pDHm1H831BD3qTaHaT1F4jZJhANw
	VhaXORAPOyifbver9uqnCf8HZXeHByAPP1S9pqOAX1kWK9it2VepGg9T/Y6Q9990fDpEuBoNUdPsY
	zc6YnNI3ERrFbFojw/C8qaGwMe2CfyeTugtr4nJWmHBadSLp45UmVJs97Uh3Qt6N1UDqFbwmeXM1M
	dgDI2HIKSNmivUU3RJ+t+AAZuvh7OqvvCcVwUp3exljG4ORHNwXbUWhxfkwYp3nxObIU/zW7eKOTK
	MDIiYOv0nuuIsqITCQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfSI-00D56N-8W; Wed, 27 Jul 2022 11:43:58 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfSE-00D53C-OE
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 11:43:56 +0000
Received: by mail-pj1-x1033.google.com with SMTP id ku18so16145892pjb.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/7ePXmHdwHU2OjPT92pojdb5hOsn4+tmUhcWnC3P2SY=;
        b=n2kvokZ6QBtDMNxlIgXlVTyF5/T+r6EWQgPYeiNlJ8uGN3wV/9vjxdgCodlT71/VeL
         l6POfqmKabMw/olF/IR6gLEvM+DmiYD0qsmibuQHhpHtdCUubckTsia0fe/x1IiSxHzf
         ume/BNNmQUR/tb/+Qjs0xN99ZfgrrieC/+VnSxzNnUZE26igUchsDhgo4iO8R+P9WO56
         g0L09xdD4xwXgG7A1T7NvUx+2wixN1jCYsfJt3jANC9xrL1MAvmsBmBhpWwcMowhtDS4
         WrD/UxtAprONWcCv3JynhtjD/0mtODz0w1IoVcvyqVW7tKrnWg6V6YJWBDRZJ3n/fIGU
         ogQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/7ePXmHdwHU2OjPT92pojdb5hOsn4+tmUhcWnC3P2SY=;
        b=dvW8qx9ww9Ued/NkYyWP5VTt093yqqOfIrNPXpflIMQOKguSwoU+ixIw7bxm/fFWlG
         ACPwWPJWY6+ZBBd48UszSW4mnv7ok0Q8nvVnxL9rES25Uvk8i6zBrTxxNpku/qGVVApy
         i5uSEbYYc+06Z53Y4JSLmeIr0hDZT1EJ7G8EExAO12HRlvX4oRTPzUm0JUq/DcdwClTP
         4Gkl8hqdUk0Z4UK03al/3o28d55HK27oS70tPpMqg2zlQogqyC6O4U2i/ocBWIOGDHdY
         NafdGDr56s6GFjU1r1lhsIReKoBB24TrhpQI6RCdpK4LeQUEvzI2IfNLbEfuyb0LWlWB
         z2fw==
X-Gm-Message-State: AJIora8GJUNPJlVj2n4PhKpu5tiOifTS1LG/MHgabLMaoJ0stc6Mjz3K
	j2hkyBcusacDp7lIteBvbpsJ2w==
X-Google-Smtp-Source: AGRyM1u9ZDX6Uohi7hKG0s8RCc6AOjPOCEKAJndtw4mRC02EhgIbii2uHsFndUckh6by9gEB56ZcBQ==
X-Received: by 2002:a17:902:e945:b0:16a:1c41:f66 with SMTP id b5-20020a170902e94500b0016a1c410f66mr20580720pll.129.1658922232923;
        Wed, 27 Jul 2022 04:43:52 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.87.63])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902d4c800b0016be9fa6807sm13486685plg.284.2022.07.27.04.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 04:43:52 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/2] Improve CLOCK_EVT_FEAT_C3STOP feature setting
Date: Wed, 27 Jul 2022 17:13:00 +0530
Message-Id: <20220727114302.302201-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_044354_840235_BFC5CD09 
X-CRM114-Status: UNSURE (   7.69  )
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

This series improves the RISC-V timer driver to set CLOCK_EVT_FEAT_C3STOP
feature based on RISC-V platform capabilities.

These patches can also be found in riscv_timer_dt_imp_v2 branch at:
https://github.com/avpatel/linux.git

Changes since v1:
 - Rebased on Linux-5.19-rc8
 - Renamed "riscv,always-on" DT property to "riscv,timer-can-wake-cpu"

Anup Patel (2):
  dt-bindings: riscv: Add optional DT property riscv,timer-can-wake-cpu
  clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT
    property

 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 drivers/clocksource/timer-riscv.c                 | 6 +++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
