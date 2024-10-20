Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216BFD3C92D
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 12:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZxTwuolqzqRxr+oUCVB4NvlDU08Usp2tz+pL1fAJxX4=; b=hfb+2+nZa6TWA4
	vX67n+DTdddF4Hhusvp45k+WcFSUZ6jcGi18ZIIXkynSh+7DaRvnZ0AtCSyvkiQD5CstkWIHQJQK+
	tVtZR1cBOrVNYkS5LGgNVCD3H8y+sX3Ic8qjwjlCEQsHHfEtoorY2xrMie6LDcyob7M/o5Zbql2uq
	ogY0o18E/iuS1RVVtV/7KC3QAyIOc+PxGaOf9pK27T8UBIpW1FSCGz3PXWQZLSYnobkk/4/pIWved
	2YcaxGfDyS5yO9uQAtpuOZngOKNQnJkuMVHnfgF2zCPRKAEzNDjeZ2H6amJgZyj7fHrkRl2786ojr
	EoKkH1ps7e7vZVAqgb5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Ulp-00000004r9n-1lbk;
	Sun, 20 Oct 2024 12:10:53 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Ulm-00000004r8b-1Mkk
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 12:10:51 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-20cbca51687so36786895ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729426249; x=1730031049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YR6kukrYW3XW5Mmc5j+vJ4606eE7jMLvpy+flni7FiI=;
        b=TVagf/PajKJ5hgg797brNz9qvuvcux7P7SRmd6Av1IwSOVoOA2Lc83K9w/PiiYJY03
         FpycRYiPutIzLKcDQcjEBZxQ3LezPnr5Sq7IZNepAmFSfz8r+XfWoPX1DsGc9dtEhoRG
         0yELfq0kVkxUqgUSQfVFPM5cp/kNPNQCzdsjnoMEZMkcyROdINyfuhOuFfxxo334C76C
         mAYLwK0ZprmY2gGW+aPZMj+f94id8madQkA9J9NSw5rxKLjzXBL3BOLlhQzkgOvM6jLD
         bihIAwfamL3hv5ZYyY3b3iWjqujlH6hGrz3ckO9qRnA6EDhROoveof4kyUKzNvstn/uw
         HbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729426249; x=1730031049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YR6kukrYW3XW5Mmc5j+vJ4606eE7jMLvpy+flni7FiI=;
        b=op4Selc4p36UclvOSJc0Rg3nOuWBWHjG3BBEMgZzxYrXMIMdBfOqfek63O8fMVzkB9
         0LJCcclH3TMsSn2kIOvNv5krA0V6/JXxE1enVDvYdTLNdlL8sx+BJte9xHZzlBwGKJrS
         1OxEF9y7mXYzS1GSsKAIa2CPhG5SoRgZFFFGSDQsepDqsgL6Rml9mSenLrgpViRCqlmM
         u+u3UKqrAtWeW6dQmVKRDbIlPRwqJTlhF/PPMZp+bgDu+HigHzD8II0SQeXNyqWFa04t
         PmTe6/gjpz3d+cRkTumZcrTHkVL5ZvBid1GEnR97W0zqNH++9ZiGVQPsenIHufSpZ8pK
         i5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW3SwtfXXZzWjLlWDOMB6HxUykneM5HQ+f1PoxSVPzK1kTP5lwt2guj5YX2YsMekOQNUt6P8TQJWj/Ag==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfcYIFLR7fUM2Urp0bOobYSOHmmu5cU0CbxPICH0p2MqRQS3vw
	yDlrWJkURTY5HYtrfqKDWKxhSjgPxZ+H1JdWDAgmiIAiSkfdXUE+
X-Google-Smtp-Source: AGHT+IHYOv2qQdC+kADm+ERk7EtEWe3brWnELNZHrGus3nuSRFutOBxzEUbqaoMuD0INlSw8WF9BUA==
X-Received: by 2002:a17:902:f54d:b0:20c:aed1:812b with SMTP id d9443c01a7336-20e5a8a40d4mr98543035ad.29.1729426249341;
        Sun, 20 Oct 2024 05:10:49 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f36f3sm9331855ad.263.2024.10.20.05.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 05:10:49 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] riscv: interrupt-controller: Add T-HEAD C900 ACLINT SSWI
Date: Sun, 20 Oct 2024 20:10:27 +0800
Message-ID: <20241020121030.1012572-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_051050_393715_E99FE3DD 
X-CRM114-Status: GOOD (  11.18  )
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

New version of T-HEAD C920 implement a fully featured ACLINT[1] device
(This core is used by Sophgo SG2044). This ACLINT device provides a
SSWI field to support fast S-mode IPI. This SSWI device is like the
MSWI device in CLINT/ACLINT, but for S-mode. The only thing is different
from the draft is that the T-HEAD version SSWI needs to write 0 on the
SSWI address to clear the IPI.

Add full support for T-HEAD C900 SSWI device.

[1] https://github.com/riscv/riscv-aclint

Changed from v1:
1. patch 2: use computed reg offset to avoid uncessary reg additions
   when setting/clearing irq.
2. patch 2: fix mulitple format issues and improve some comments.
3. patch 2: disable cpu irq when CPU is stopped.

Changed from v2:
1. patch 2: add SXSTATUS.CLINTEE check for T-HEAD cores.
2. patch 2: add select GENERIC_IRQ_IPI_MUX in Kconfig

Inochi Amaoto (3):
  dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
  irqchip: add T-HEAD C900 ACLINT SSWI driver
  riscv: defconfig: Enable T-HEAD C900 ACLINT SSWI drivers

 .../thead,c900-aclint-sswi.yaml               |  58 ++++++
 arch/riscv/configs/defconfig                  |   1 +
 drivers/irqchip/Kconfig                       |  11 ++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-thead-c900-aclint-sswi.c  | 176 ++++++++++++++++++
 include/linux/cpuhotplug.h                    |   1 +
 6 files changed, 248 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
 create mode 100644 drivers/irqchip/irq-thead-c900-aclint-sswi.c

--
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
