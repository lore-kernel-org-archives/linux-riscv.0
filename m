Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120CFD2FED2
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 18:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTQGIVR4q6Q6oOblwbpFkWCKuWss8BA/yWaHzxOJZi8=; b=4oZiL8FAElbbuU
	wzwovYmgw0CrvFPyrCZljT/ZtTjBpuPjZp/f8tyTWfSi6SB0G6rPHvhAWo4lTdZ7/+RVtWpfeAzp4
	IUW8wbyVYiszkAo4AgEo+ZyFd5A6GpHrB8DCGw2PGvpyJnNbVX03VnvQ5o1tQj+MhzbU1JR5W9Cjk
	i3CwakI6Rpa3uBjFSJmTus3Mq9yqEKqW4T+nKM74CmNgPvqOMO1EOv/qe8Fym37L2EakKlwVKgDqV
	DikJZ15SWCH4+UQNDjqpyTywbvzxLYQAuZ6KcMXtlFF3ahgn60VH3+fLfkcEPOstIhiX5xPRw/57Q
	EKJQA7lNvH3VzUSxRkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko7N-0000000EqJ5-3oEP;
	Tue, 27 Jan 2026 18:48:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vko7J-0000000EqHn-0MRO
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 18:48:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso1077205e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 10:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769539723; x=1770144523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=JRrX5Qx6WoAbKHMdSsqUQC7GdjLfELEHWGajcHBZ8wlxN4R5FJH0ZIIq9iXdXcMosE
         Qcgrg4vqUuZ2PrwzO22otfZPS8Q/JXbggCM3bgPR9VLPfXSmoL9Q2i+VtYMH38K8qbEz
         9rudzcxR+jb1kIBSMRX86ZvMfJ+A7K7eWa5l/fjCjAMDPror+GDBGYapZbLJeFlxKE8u
         Fv40VKoD+DrxURveKZzZhlaE4pTT9FsN+ADkCWvN1FWcinI9Q0A6wwjHgN2MGfkqCNZb
         z8Le4haYd6RVMdqpQgpuiPiTV2QUA566VaNTFYL4/3/Rupj7eU2AUvfNEohErmmBA5MW
         DNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539723; x=1770144523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j6l444t6jpG+w7dlEITp6QEjvTc4ukc4CjhdbSiVZ9s=;
        b=Ghizd70WM32vGD8rZmIb7xQxpI6nIlqEIeV0nceaWt7vn+++mQ/fZjV+q4Y9Ev6KEn
         dNUfwx1RA6qcjvdHjcArfXYoPQkVvdcF2gQGCGuPd/gzYfMNN2t5o/Ojxpfuc65qx8rG
         d/dphyUBsHYBiIHzvcyhjrXJwSUa500L8S781N/Qcat06ILfBPzjdyqF3fq70vShtjaQ
         i6xTz1eeu5imjMmVg5BHmWJExBRWqihXt64gayEjJHUKvBNWDJ1qYJYVX1rMaHKw9iam
         nkZ8WNZgA7EU7WNcEI/L0e8F/pcbJtBphvkkACCTZlMwF9Oz3HCHZh51tD/iWRjb/mdd
         pWAA==
X-Forwarded-Encrypted: i=1; AJvYcCUfr4JeLlrCERNLJD19fL+YRzdgxkl4Hsxg9A5vZTAOyvPZ5C/UgiInhvCAsZLjfGBVIWa5U4BKplKrAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7iA/pL2uXbPAizRtiQ1dRbzFtTNZjyoBsmv9s9Ha0z4w7LjVF
	d1E1+bAdwvVaqVPuR7IxYbuoFT5ISArFLH8qdTfTjcWt3XcsrMfd3jWs
X-Gm-Gg: AZuq6aJfopG4NBuWQUaBKd3y6cIdeTCXfdNSvFf4OPpAJ4BgNugMBweHgPnbwT719Mz
	tQOXc5dGQK7q/QJ/QcOzAm2FEpEC+XXO+Otjm4LEYoyyEQlvP5ZeHABGkjZZwYfHZJt7CdJ6TyV
	GFRQJCRDQprKnSXverJNqFMtOk8HtRkZ+dC/85soMPW9oarVb45UJktpHfACjCBluSB4a6shb8r
	IX8ob2R9bYyezx/qiba88ssE2dI+cxZAPU9HdVSJcU8RJ+VuNIADludxi/TYDlC3C8+6PS3XVWw
	xQlWMhjUpzaP8FWLmTLwLL6NzJRzFzOBB4gLN4DdmoGI2FO7n1CnrgQZ5MPBhfpOQFiAlfwW0WY
	o7AEtXIrkBceUz5t5hRZCKGt/TGQt841pqJlYJ5s59iySX9EsSaurrDxdOI8JHTFYm7qI2/bhex
	TvQwBs+1EqFw/1M4Cfijy+HrHHvsWgVcYIIL/93KdYjfRi
X-Received: by 2002:a05:600c:4448:b0:47d:6c36:a125 with SMTP id 5b1f17b1804b1-48069e9b5dbmr38558875e9.17.1769539723087;
        Tue, 27 Jan 2026 10:48:43 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee057sm903100f8f.15.2026.01.27.10.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:48:42 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 27 Jan 2026 22:48:08 +0400
Subject: [PATCH 2/2] ASoC: sophgo: cv1800b: tidy Kconfig spacing
MIME-Version: 1.0
Message-Id: <20260127-incremental-for-i2s-dvier-v1-2-431b809c632d@gmail.com>
References: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
In-Reply-To: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769539713; l=698;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=H84erZxT2MlAaY5J3iUKm8PxILlu1jOlSTZ53NjhBCY=;
 b=N5uJIXd1MfaMnAMCepcgyt3gC9Xj7DoHIF9W3uU+gs94PPz93VNI4wEbeV3fdbL7ZL/vEo6tZ
 kH+9BQDgcF5Bj2ECBnA1a+a29Tr89ihFUjfl7+ue7ClXiU6Yb9Xs6wS
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_104847_651241_21623A6F 
X-CRM114-Status: UNSURE (   9.01  )
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

Restore the empty line that was accidentally removed earlier

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 sound/soc/sophgo/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sophgo/Kconfig b/sound/soc/sophgo/Kconfig
index e4786f087589..9b454261bcfd 100644
--- a/sound/soc/sophgo/Kconfig
+++ b/sound/soc/sophgo/Kconfig
@@ -28,6 +28,7 @@ config SND_SOC_CV1800B_ADC_CODEC
 	help
 	  This driver provides an ASoC codec DAI for capture and basic
 	  control of the RXADC registers.
+
 	  Say Y or M to build support for the Sophgo CV1800B
 	  internal analog ADC codec block (RXADC).
 	  The module will be called cv1800b-sound-adc

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
