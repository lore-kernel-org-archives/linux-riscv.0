Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E02C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 11:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R5ovMY56G4fZmEe4sQ7+fqesw92IEde8CdyyYFYeG9Y=; b=fPJW6LNCSXEVlb
	SyvVweZev0Ps3GT10pa9fkQsJkLZrwVerXb4SzH21Y6BcVxWxhzwCBWijEAMP7F4fFGl5lZ2TLAxT
	oYPg1Qx3QmokQw+YqgO6rxikiZkfbnHJz03W/nlzV3GDhGRfOlGtUQe1bLq5UCb6579Car0d4ku3O
	MS75RMgT5ZrJ1UFDDR7AL7+eU9JObM7ksi8MGpVeg3EX8QAolHGg91G0IIXY2l9ttZaP+AqQgJwZ7
	+1uOX6OspY1D0az8UYFwrpUE3yPVJ4FaKS4hmFvmUFIb6WeKdiUgiqfGSLwBJ+T0WXSY/jpOxhSLf
	Jf+cjJPagfV+3TC6D9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWng-00G3cc-Cs; Fri, 25 Nov 2022 11:23:20 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWlv-00G2Q7-NK
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 11:21:33 +0000
Received: by mail-pg1-x535.google.com with SMTP id 62so3683406pgb.13
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 03:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYP+2oM34cmJFG3V0Ltp7GNtutJIbBXEhCpqNRxYA1c=;
        b=Pj9Bv7nv0hGxcqolfF4+yd/oe3Ub2fzfkcuWjrMi0VinpJH7fvdtr/YljSrODKWK0f
         FM+Mz95Ur9WpLh6f0vCmbssVFWKWW2ofL/8GDnurs+S0sQiggICep5VwM2LXFol6x39I
         VidgCoZBzSc/iITMBjwMr6oD8SDGBCXmlYseTtMP6EAqIiGyrcbLVj/aWlZlvIJVrE8X
         XCIDAbGNlmDkUOdyCXP80IqSGHQa/rtF0lFEalT59kd7Z3ns30vsO3buNBshk1Ou/CtZ
         RkgoP5HGq+zNCis3/uBJRtzaqXjfKRsy/UrYeKJDNpEsFezHd+IU/xnMvU+wH5KoJRrr
         ReeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYP+2oM34cmJFG3V0Ltp7GNtutJIbBXEhCpqNRxYA1c=;
        b=UsySWa70titxARI9zRB6CSSc9dfD4wgF08NVbjysFfhuRMldtn3d34EyAo5brUVlkB
         XGXBrTJ86qniHQS+cshH3xW69+IVP2mpzF+JWlZ8trkHzwVIQokyNKORrECepUe8JA/a
         jh29e6VIDwWKGFuwlw151wTyd4HAqlzsmUtns0u8prgwX9d7Vm3rqs8WkVxkioSoDUW6
         MIWAWBL7Qmt/ipKvHUjO2SbvkyYo/WQC9jec1EWMdTw8/G1GJXwP4gplhsJzLzM2SxBk
         y/8cdqke1fq+nPO2n1+BsJIKhxeAW4lVZswFoSx2muY76uD5Qdh1lAKZOKig950arVXA
         cKPA==
X-Gm-Message-State: ANoB5pm6nCbTFNLVuy78PwhIUvBs6GCamG6WLyiV5QQitZaOP7SHOoLK
	bfPC50j/a0VvXYUgam0w53DRrw==
X-Google-Smtp-Source: AA0mqf60LcLJuXxWEdKaVgoRREe0TX/v6dAlHlqUjeI4LuwEdKNOY1o0jWc8FMMP6h8gnDcCdeadMA==
X-Received: by 2002:a63:131a:0:b0:476:f92f:885a with SMTP id i26-20020a63131a000000b00476f92f885amr16224287pgl.478.1669375288411;
        Fri, 25 Nov 2022 03:21:28 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id e66-20020a621e45000000b0057488230704sm2834335pfe.219.2022.11.25.03.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:21:27 -0800 (PST)
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
Subject: [PATCH v3 0/3] Improve CLOCK_EVT_FEAT_C3STOP feature setting
Date: Fri, 25 Nov 2022 16:51:02 +0530
Message-Id: <20221125112105.427045-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_032131_850369_B0F1EF7A 
X-CRM114-Status: UNSURE (   9.55  )
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

These patches can also be found in riscv_timer_dt_imp_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Include Conor's revert patch as the first patch and rebased other patches
 - Update PATCH2 to document bindings for separate RISC-V timer DT node
 - Update PATCH3 based on RISC-V timer DT node bindings

Changes since v1:
 - Rebased on Linux-5.19-rc8
 - Renamed "riscv,always-on" DT property to "riscv,timer-can-wake-cpu"

Anup Patel (2):
  dt-bindings: timer: Add bindings for the RISC-V timer device
  clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT

Conor Dooley (1):
  Revert "clocksource/drivers/riscv: Events are stopped during CPU
    suspend"

 .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
 drivers/clocksource/timer-riscv.c             | 12 ++++-
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
