Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD81FCD6E49
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BL0Ednh7KdJCLiVnZvTOJTLdj8pXChz6VlvZ2VIzNZo=; b=UMkSNvYJPG/b0b
	AxMMYT8I25kO+27PNL89ZiYFC9hcsmpPMlgTqhWvPmea3ZkPQcR48qJZRWFev3g8jkyYdcqPr6kIP
	251F+FuO0zfwAxIkUr6fBLk45VrZIRIuDm0qNwKgCDMEW8LSDHmogCQcFmW7TGLOTBarwrzHpwsBi
	VTtrNJ1ffHn8mUs4x1bK3CrLEedPVDzoZMWf9qMrrnkU4hsO5MXWYYwHwq/J9hybdWJx7wC7CI2d9
	keUMD2G5KYAyC6X8s3AeiO0tTUHc+dolQEWBwI6yGSTQ41Ht9JCJ/5SgB9nL1R23ek+TaHNf6cKla
	048mTI4snBDBuwyBWmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNax-00000008yD7-0zgV;
	Sat, 30 May 2026 17:35:35 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTNar-00000008yBo-39br
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 17:35:34 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-914bb8e95c2so483545085a.1
        for <linux-riscv@lists.infradead.org>; Sat, 30 May 2026 10:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162528; x=1780767328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=iuKZrGQEExKlQAX2aeYDrzesmT8urgP+AOvdoSCtIb3Me3UM/zWU0rUW8SldM3mqeS
         D5ZyiZojyuEX/8YtTWW/u2holNHzMbCXnuIMiWL/4L1cIcl4TOz57keUDZSdTwePUGfY
         Qo4yLmtzCwwDNULQHHUXQ3VTMEpzNMFsoBVf4bqH0GmJccX4Z0Crd3moa+hnqjxv3cMR
         iCu83ee8/bHZbvJup72jroRndcNXp4UJHUzRLL3T34x1DQtSAhr04X5yl8KykGPJq8mP
         mL/Lb7QyXlqcBMP1bx7X6LcpSY88arYUcRehdDmmUEBkugALpSKDNH1WZzanh17A/qaJ
         R1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162528; x=1780767328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFgcVH5XOq5/mrXaXDYrCpNPEGJCtaK+pfMk8iob1+k=;
        b=piJvDXRFKvESmYL2YP3jtHMSRZM9mE52rmYVKy+glMysRw6dWHdb4S9guN32dHeer+
         y0Xpm7Vi+XtmD2tlWt5vqGdtWmYkqqf8mK4NG4LVXRgkU5PVdiK52qn/fMY1A1hNihwK
         gbmT9g1W+/7WdxbcSJK3Pz5AoNUbrm32C7vY4ZP8b6Ugz12R4zKNVNBdWguUZCkGJm4Q
         xEOqMXZGsI0LDTCnCBmFI1HiCnJtSCwvXU6pZgWts6+Cyx+QRGx/qUO1kN6emvbxFEqW
         vbhpLM+CVvdfJba4wqisI+bgfqemaiPRs4pXS+wcTOBf7pUfI94pMImZOXhaRLL1WK3K
         q7dA==
X-Forwarded-Encrypted: i=1; AFNElJ/rdxW+FjpayeJbGN4CR0ctbuWfrEwV7Q8f/okLProvkoFNx6bpzgEatZSA6sU2jOCkoOYMzxzEgh2Gqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxatchDqQMHi26jGK4BFHI31N0QrawIDiyGGkMMzhZ/VoHzZLnR
	wdO5yKvdJ3wTX+tmJ+ZTvneMUXzG0uzssW2mft98qt9Oe4HouUmyOt+L
X-Gm-Gg: Acq92OHzpnwnSWfHyvjcZZ9iQX6QmPeyRQL/WX9bQIWAvmboRpmUa0ZrZZtdRygl5bj
	/YJpXvsfaM0otOxb7Axwu6Sy0woyezdEXF+bEpsiSrEFMsLwTieagtIdsevKxJRZMf5FpACMZME
	WaAolyWGjH+4EtBsfYmW8lFS90+PuopZb3cb51TA6ouI2IHHlJ+NzrR0RySMNOhIVRD7c4/Vi9h
	4kgywLEQC0+2ACCFhKKTTXwsyVQLW+rqIpHT5p02eOx8I9RBkWzWgqtFK5+GEyxMlRNnMYVCmbs
	OMIdLXo9di5Za8GGxZ/q0DCFkmM+U2Tkaj9SjK2qITRTymDSlb8MMatLZjQrqh+8R41/Zu2dsWX
	Qpq6KvvtU9pdDsalbr8eo5mVt2lSD28JCBFS3TMYeBniVy482jHeCiCOPgoR9NcfeQY6J17E+kD
	CrOHDXppAQeppPYcafhoRjL/Ug23S8TCG3jDgtb5PJQ4zFzfcQvky1K6087j7Y34jNQuk=
X-Received: by 2002:a05:620a:241a:10b0:912:c0b3:7d9b with SMTP id af79cd13be357-9153d96aed6mr474347185a.24.1780162528422;
        Sat, 30 May 2026 10:35:28 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:27 -0700 (PDT)
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
Subject: [PATCH v5 RESEND 1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
Date: Sat, 30 May 2026 13:33:43 -0400
Message-ID: <20260530173347.33533-2-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_103529_843954_1628B074 
X-CRM114-Status: UNSURE (   7.78  )
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
