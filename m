Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFE9CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdRXkKkB0m82ywfdPbT1ODx9083+ACf2JfQaNtqVVWs=; b=rN1S3XjCObqxit
	w4gYuENPtzk0kqu/0XaJ2B2+lXHWlKaETQfpHYdvQvnDoBtW68bBqwORaNnYJ940Qe9WQ+MtjhgmQ
	fuhit1qBEs50V4NqasjNyCASFpPOJ7gNKlXvwUVLd1hGxWyi25sbhs9YAleQuDg5YFsTQflClQb8J
	48VKi3+1UgURia0DjpPIqLoYdaxGZQaEVIpfyE5+Rcg/N1a5ORTusRaJZb8AtkcdK9ljS6BLJOlXI
	asC0oLj/2GLy08ZSTEFInWO9yaPzg5DslalhAn35O/RZ+LD/1aLGEsMYxqidOZzHqokStLjRiBFAR
	cm3L7pF5NzIVNTLbgXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFl-0000000EV4u-2aL4;
	Wed, 03 Jun 2026 07:43:05 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFj-0000000EV4I-2YWg
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:43:04 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36b9d265355so3580514a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472583; x=1781077383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYwjqTH3WPvxIZCafdNOD9YOFH6+ZvKtdV4vpuopIps=;
        b=YZmqxmvm42dH9nMS7pnkilTdf14Ngu/8cZCWGkSOV9IoognIBT6qNsVpXj55SVetdO
         JekEHPcQtiWHD733XIQbQ/cEHGkCekh33ZkNPLq/S8axLaGq6gJAAjvneWwl7WSee0qC
         kgSu9uo5bkd/8L5d3QdbX/m+bJK0QUVW3vpW/+idMTwfU4nWRlGgGWKgWkaNqcschDpz
         gM1dWHyI2QFxJ/KwW4ae+bi5lWXhhTZyQ0/Z+BeZQTzRBdorASZJVftdKWUIm9j6Jzp4
         y7Vtwh8tUvmecYFqTFhLPKbiE/RNbCoL9tBPofMMeHUAfgE/CROb4reRwIBm5w2izMHo
         rsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472583; x=1781077383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CYwjqTH3WPvxIZCafdNOD9YOFH6+ZvKtdV4vpuopIps=;
        b=JFoyvA5V7XGDzFkYs1n+tdRLTtva5HIrryJG3XkJHp5VnmHix+feqvc0zK+R9cPcTn
         Gex5V7YLJw8C2yrq9Tum4llxy2fWaEPh7qtQcJNLbV4D0CNhkyPoRQCj9Z4ae3AxKuUK
         1cIAOGie4xqWBXhVWWbNfhgyyyRjVIfrYBlDI90gC4DJL5ZTAeSVeOoABtl5dnGzKFDt
         Z3z+vYPKP/5VyOWZWgQ/O/ydbcicC+gevLySBto61Uj7WebgiYmfzerugRDc1r041qFz
         aqLsZZz4ckX4WSSR8+SqvOwcb3xjObcaU2V5fEtpR8CYeHknV8ZWRkdYeCoDz56RBSPU
         Edog==
X-Forwarded-Encrypted: i=1; AFNElJ/eA6ozdXh0mL98S/nsu+FTHdcJtnbWVx/Mwre44YMvBalL/6i2pwDfPhgEK1/JbMbQgcNeC90BE/4G9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwiTqoLpkpO/4wit3QI5SADDhgQLquX05sDnQlCr8twt/V9eQ3m
	05nKUFjrAkc6XipMGRCmJW2P1shnDBBuJf77gdAeUlnUOCdM+waiJUBn
X-Gm-Gg: Acq92OGTqtC17h8OPTWTrblVYwsDDGSRa86oxZh4r5DkvCLFMq0tO08nuCTTUX5oh21
	ILjNI0lrxbtgI28reDRZITEcqWd++cJ6WrmCY08co6Wwb0OFeEUjk4BpN2G6nqIcuHFmiviHGst
	5b+MFabktqAVHWvIKoHUVyOeqBdWvFXUcv5bi/fXIS4p8iQwMM8HRvBXONFaYINViMPytlcwZht
	UT0SbyAG+wgEguZcgeG82I85jvpBjvHQA9HU0a0IG+DvgOIDbSu0Pdf0Jd5K38Gk/3OKC0s4PWo
	K8dn+zBbKAULWMl+g0HswGbseoxRdcm/vKLeku3gkwC9Bpo9i5cb5ui4yczr+2imZZ0AY4tdsS8
	iRCyA1qHedUWfP8XdYS3N/Y4YGMFe+ERo5R9F/fDKsThjv8kx7OLjKxtWnBdBjJBriLJ17u6KdP
	JYd7Z8meea6Ow58IMoy+3c5Qnx5sZxMBVL8v1Wi0BZQg2Ran0dz55BcYcqsE1QyZ9T7vloIQs+g
	f1QTZSz5ViiLjNxg93XQO+m4EqOGhLetFauOzkft1JPtbN+2Prd9Eakw2qTwSPF
X-Received: by 2002:a05:6a20:c783:b0:3b4:72bc:5b86 with SMTP id adf61e73a8af0-3b4977e30c7mr2399869637.16.1780472582830;
        Wed, 03 Jun 2026 00:43:02 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:02 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis compatible
Date: Wed,  3 Jun 2026 17:12:14 +0930
Message-ID: <20260603074222.593243-3-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004303_649668_EB34CA36 
X-CRM114-Status: UNSURE (   7.96  )
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

Add compatible for IMSICS in Tenstorrent Atlantis SoC.

Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../devicetree/bindings/interrupt-controller/riscv,imsics.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
index feec122bddde..442b8870f9c5 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
@@ -49,6 +49,7 @@ properties:
       - enum:
           - qemu,imsics
           - spacemit,k3-imsics
+          - tenstorrent,atlantis-imsics
       - const: riscv,imsics
 
   reg:
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
