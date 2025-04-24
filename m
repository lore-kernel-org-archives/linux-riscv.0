Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA167C369D3
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 01:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VriUtf4qgtM8wBdBvwlyj9k88Cu34tXTq0nXe6/+6LI=; b=xx/jwoifQXwaol
	oyfMVhLNvIxeyPm7TNZvCP4twLuoUBul4/8zCnPL6/tavpSUlat3dwjgi8CE6f+M0EM/Krt8q9MJr
	jI0uJOu7oy6hpOegy4lmmJjNpmqYv1ZlF8HtDlRcbOPVgez+cH9ZiJUmW/dbia/hE+ulzDTCjcYhg
	EaVO9atX1QlI73lnn4bMbCGDxPrYdQx3fzIv62SaqZJGSXTEw4OFnTiSydBsGKKHIaHWhSFQ9WqJE
	Iy2Xhb2UIiTqVrRrb5oetJUF3URw1gj71+v0ZpPV3bB8Urx2VLQUM9r3DcI6S7PwawCwXP8wBtJfG
	nD6HCq5jcKNlnZINSlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lKg-0000000CVuH-425F;
	Thu, 24 Apr 2025 01:24:54 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lKd-0000000CVtw-1LQw
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 01:24:52 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7369ce5d323so320504b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Apr 2025 18:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745457890; x=1746062690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DjSk/riKS3EidNdWxegqsSotH7MqM0ARsO0VOGtlQ00=;
        b=SNYeXKId8LHAadfX/XtERaHpCBed5Gc5bw2wUsCpBWfa/arcgTQ3jVSIzNohwN6kZc
         6BCptgnBziCrYSS5m8C60N3ydUm3f/xIRm9DqbJ9CUVp73greAZPaLNbWTWZrMYEyNNe
         MIv9Bkr6Ltv349cQdqS5/T6gXBGqNbcd38pssgFWbgWuwfY7uba2vcgBYeqrY6el5Obt
         I++oH4NE2nQ4l9H3WfUnz8kmpX11DN5joFPWh2Y9+TGTwQSWMGMXEvL/rou8AfOiBhip
         aWt5gMNdDimvEutEHj4Hii8HERgxLGai4uyz0gRxr3IesERd+5dV17hAngh/J0pOHWu5
         7X8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745457890; x=1746062690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjSk/riKS3EidNdWxegqsSotH7MqM0ARsO0VOGtlQ00=;
        b=uRNyZRcX9Lmtr23F+32zKPtns7t5OcGbdcx2eK5UbwaHmiF5gVMCvduaHQa0C+VD5j
         Uw3If6nKcThYE98Sltu11/KKS7Zu4jbFyvgG7AH5PrsReviZXxPsxPbMKIsL74thmrLo
         um9WRGzfybZTCjvHQtYB3bfhRRDOO9yLZ1QyNsmqUIS6KUpVzl7qljt3+pTyNHfWDFKN
         M7nvvSnAYlgEmqPCPILEmdrVwQsw5yDOwZ1pIqZV+H7Z45kZaC9hHeJ3YEkfNNdD7/lR
         zaxMSvP16koTeSYJ31J9XOln7E2aDEA3WY8/gtWIvNBnxBFrmEa6Da0Dw5fNsHYjpd3r
         NU6w==
X-Forwarded-Encrypted: i=1; AJvYcCUNZBaBxX4ZinAgg2BvSnxmrA3pwleIMkNHxWV+/DeTLz9y2uVr25gOplewtUqRRymsf6sb7Uzq9jo8nA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlGnQxiHaEaxiAW2ZNzbH9imJSNIMbWCy3Xbf68xcMfjo/d0e+
	TUi9SYWjysN9JTwGtfHHMjvI3vbZ+b8A9IldfHwv3/Z2m6nOKuUg
X-Gm-Gg: ASbGnctF3lmwj48wnG2NXolCU1NtGsSIcHXr/g+i9UV1DuoHJ6sWaZTlsgt0TlNdPrd
	76jEVbskFJUqXEjhXynTY/QC6dVJgORD8VofHAPM0WakFw7vo/zHYVNuYUjFJaJLk3/X1jtd9A7
	17TDIs/QI5unRZABWOVGSKzOWCoxkdlzoGiObnlEcrl7etDVVXLR0dLiXhUfFbkuLcTEoEFsg32
	9i1MWMsvaNdT5yzsqpaSRxQZmF1jBoVD+RHDnh1ZKp0NI98bqQfF+Aeyl7w2xr+9t2eIfSCeY2Q
	p+pcX+5BK97N8ytAEt5azqsTM8ZZo+Y=
X-Google-Smtp-Source: AGHT+IH+pq8RZMe2Oj6MQ/A9accMBVAbgt/Fo4AIrfNJvsNkLTtCSnyDrQrKFJLlIeZGRpNmZKTc4g==
X-Received: by 2002:a05:6a21:39b:b0:1f5:7d57:8322 with SMTP id adf61e73a8af0-20444fb9aa9mr966608637.26.1745457890068;
        Wed, 23 Apr 2025 18:24:50 -0700 (PDT)
Received: from cu.. ([111.34.70.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a8cdsm231049b3a.115.2025.04.23.18.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 18:24:49 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] riscv: pwm: sophgo: add pwm support for SG2044
Date: Thu, 24 Apr 2025 09:23:25 +0800
Message-ID: <20250424012335.6246-1-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_182451_357418_9B317313 
X-CRM114-Status: UNSURE (   7.68  )
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

This patch adds PWM controller support for four independent
PWM channel outputs.

---

Changes in v3:

  - Rename macro definitions to unify naming.
  - Modify code style.

Changes in v2:
  You can simply review or test the patches at the link [2].

  - Modify variable naming and code logic.
  - update "MODULE_AUTHOR".

Changes in v1:
  You can simply review or test the patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/20250407072056.8629-1-looong.bin@gmail.com/ [1]
Link: https://lore.kernel.org/linux-riscv/20250418022948.22853-1-looong.bin@gmail.com/ [2]
---

Longbin Li (3):
  pwm: sophgo: reorganize the code structure
  pwm: sophgo: add driver for SG2044
  dt-bindings: pwm: sophgo: add pwm controller for SG2044

 .../bindings/pwm/sophgo,sg2042-pwm.yaml       |   4 +-
 drivers/pwm/pwm-sophgo-sg2042.c               | 151 ++++++++++++++----
 2 files changed, 125 insertions(+), 30 deletions(-)

--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
