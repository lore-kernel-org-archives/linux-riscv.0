Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8363C25B78
	for <linux-riscv@archiver.kernel.org>; Sun, 19 May 2024 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KjHGu2Iw4/ZVU2cH6g4LzZVXll0/O+PsA/5ay6pAEtU=; b=byN43lymK/qoCL
	7X8Oou5XmpIZ9Fe+8Di38sosPCMWI4bHqwywHlbOmtSsA+9+W9VeY4axamT9TCUbRlBSyptnODEwL
	VwNYEpukEiAao+DJuv2aMOSYA/ijaX6XZRtV0S/C5XWqZCFRC750y+ABOQwnCVFd3ztwJQZF5vT2y
	BWagoHiWUzUf6g6+ZNmHnJsR73llnI49WefjIPt5dpnhfehuShrGwTBwBZyp91K8bF1f/3BDQyfJj
	wMMN3M2oKCLkNzy724z42BR1UK1RekYYBqovgiMuNRPYhuSMcenpRnJCqybIt8l7iZuOyKR5pqjJ2
	8EHMwPREYkaBkocObPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8kos-0000000CRnO-0qWY;
	Sun, 19 May 2024 17:59:38 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8koo-0000000CRmq-3ORr
	for linux-riscv@lists.infradead.org;
	Sun, 19 May 2024 17:59:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1eb24e3a2d9so62974215ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 May 2024 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716141573; x=1716746373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kG64scUmDV9RZX8aGJDebzvj5lW5EFJ8Ke+u/bGx9yo=;
        b=F1h+tZTiZ1wOnynw7CO45h0pHr7Qep3JEhrwKvK7G/vrfAko9kTRlWLerUVnSwuIk2
         0ssXQ8LtwdE3DWSEob0ke3143EgxpPy8DW1CkBL8h6fuN1iL9GdtByfgL4TcUZdOwaUT
         m9C/tPWuhBuAM5Keb7s6qk5cHPsKPVJumYgMMTFDoZ8fWyqayuVwdax2pidOX2T0uUsb
         2dOv91BdXCm0tlk2PsssSxvEjgMeQymUWvJSxsZJk5QTDrgku8ovWAYW7W9oWVZ0GSVM
         De5fwyYKoJYcE7iuSkerGNYtC6hftyPNG9Rs/zA1+r+T10HcDlaCFzbeQGrY3hjH9e1y
         hKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716141573; x=1716746373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kG64scUmDV9RZX8aGJDebzvj5lW5EFJ8Ke+u/bGx9yo=;
        b=h8vQ7E9EuUKp2NtaXsxxcNQc7JJ4T9/Q9RoZ+3WNUdDKeWh3nwLvVIK5eVFXJbbAeQ
         Lzj/M0cXqdhnS6LDNxd9APxFiuzmnJs+Wi6clxxQNOEam8oWo4OPGsg0U/bwf1gT8wVY
         R7dMncHBkia44MT2m5W3nigUG17MAnl3gPxM8023TSR/fCJyopXG4iumiRq9kAs4h1C9
         P9bLnht0k3W4kIHFmQJkN/dQ1Rq2N7R9/fva6sUDzJCNMojOC/dtLRW3OHLLa0OccUvw
         ENgMZGA41L/aYq5F3rbt2CTgry8VHKsXo2VLs1DQb8hRwC2mb70VPKxGjWbAigaXMr2T
         GLMA==
X-Forwarded-Encrypted: i=1; AJvYcCUTV0Tn00wqBfEufMFl8pNrojwt4gto5fBN11pv+rTJrX0kUmkv3JrjujiI7TC1IQeJK860z+0fLlDBS2RzmiwANT3PDaVTXaX2Bux+xvlX
X-Gm-Message-State: AOJu0Yx1yeX743hjyIjGbWpt6I0D6pGdYHlxgLYjxShbOvg4IeEpP3Vx
	xFcub/F4M+3FLzFJIAmfkX391d/rWSOTV7MUiDl6rmLt6bcw8vdB
X-Google-Smtp-Source: AGHT+IEczpamkxmCwrga/FiYTpqpvAegXACXG9PidXpxFjPexilJ65xg+Ps4Jh7kntQymBxlaL/ZIA==
X-Received: by 2002:a17:902:b414:b0:1e8:5cf9:37fc with SMTP id d9443c01a7336-1ef43e23f6bmr330376125ad.35.1716141572825;
        Sun, 19 May 2024 10:59:32 -0700 (PDT)
Received: from localhost.localdomain ([223.178.84.79])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1f2fc5a015esm9424325ad.14.2024.05.19.10.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 10:59:32 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
X-Google-Original-From: Kanak Shilledar <kanakshilledar111@protonmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/2] dt-bindings: interrupt-controller: riscv,cpu-intc:
Date: Sun, 19 May 2024 23:29:04 +0530
Message-Id: <20240519175906.138410-1-kanakshilledar111@protonmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_105934_867001_7F36DB11 
X-CRM114-Status: UNSURE (   9.18  )
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

This series of patches converts the RISC-V CPU interrupt controller to
the newer dt-schema binding.

Patch 1:
This patch is currently at v3 as it has been previously rolled out.
Contains the bindings for the interrupt controller.

Patch 2:
Contains the reference to the above interrupt controller. Thus, making
all the RISC-V interrupt controller bindings in a centralized place.

These patches are interdependent.

Kanak Shilledar (2):
  dt-bindings: interrupt-controller: riscv,cpu-intc: convert to dtschema
  dt-bindings: riscv: cpus: add ref to interrupt-controller

 .../interrupt-controller/riscv,cpu-intc.txt   | 52 -------------
 .../interrupt-controller/riscv,cpu-intc.yaml  | 73 +++++++++++++++++++
 .../devicetree/bindings/riscv/cpus.yaml       | 22 +-----
 3 files changed, 74 insertions(+), 73 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml


base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
prerequisite-patch-id: 158157d32a32e765834a0cb4fc6335f9009d9962
prerequisite-patch-id: 4007c7386e66f93b67a2631dddca08cadcee708b
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
