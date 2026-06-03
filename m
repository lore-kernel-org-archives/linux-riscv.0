Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B6ACD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ij8x66J9peb+z7FNfsEZbKddit+kg3h39aqGgoqk6ik=; b=sV7u7BFw0tMfmK
	L5BEzeYmer08UJO0mIgdNlD/BvUOcEcy/n1np/zx69Z/3pHQBQIyXG/CsMVDz66ofmNqjHqgPeLVX
	jhZNzOblsqw3XXADVhUCGyUrqlEB2+9v1mf/STc/Wgnmt6pPh+dB1MVBV0Hr6KeSQAyEdd92R3wex
	Z8jwGVdlN++8yqdytwxSFD58kaTbA49H4PNXqMGd4GNMFfiZJNEyZUPqTy5cj43saOGPbChcogBLt
	mwu5K8m43f6lv8Czx3dr5/2TcNDHZF2f950pjasdvOHrjDy2+WQaBmDw7gCKMztAT9SQIIowGTFCM
	FPerHS4ISH70qN5L3nfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgG6-0000000EVFs-0GUi;
	Wed, 03 Jun 2026 07:43:26 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgG3-0000000EVEU-19xb
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:43:24 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8423f1d8902so1346525b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472602; x=1781077402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVLVMX4sF+kg2pdf/ugOhP5GyXMNStbGUmph37aYsJA=;
        b=Ple4umL+4HwKHtd+1+YzoQUWuGyR2o3cwNIEUS+M+ylSodTWiV0Syzd87klIY7TWdJ
         jAiRvPqbhG7V8iALIdkWhUwpDw9qrVoecyksVQDfq+lNRS1E7GbBT45PDiShUX01F8Bu
         Cm9cuahdOja47ZONnSXvlBouhMnCDTMlECHNTHf9gmaw3HYLOe8KW1is+DXRb/tNN4ud
         p+7Q+fCLvPDBXe14YWOhNQ4AUeGHt1vbeovWVA2gm3OCpPauHvqqL8hk6g2AF7bn3IEI
         7e3DzmrTFcmUIqU5RMcGTSzoT8zvvE6ZWDU60IJb/Mtdud+aUUd9iDsUrERCEWRJewo+
         lBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472602; x=1781077402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVLVMX4sF+kg2pdf/ugOhP5GyXMNStbGUmph37aYsJA=;
        b=SC7r7/pfC9dRJg/C/FYDdqjYJHnt1YUemQoMKlQ3jpeBbKVQd2lO18iahuvRTeo9As
         zohq6uH8sMi4NtJUz7E5DpSg3MvvUt3Xp4t6YENKjo0gyhs0IobGds8PuaLOtH4sXg8t
         CXzeY1WxIMcUeyuuRPkO6fBfZhiWEomrAEOszfrTj/A93icIxuHrCihopoHoAReAWelC
         uyPoBN/dL2SzA2SGPgOiwORFpYXCJAMitEC8ptqV8HTaVZzZHm7497NjJ40ODEhBxzs3
         04MhH1QGmEjRkFxmw3/M0EqJj1dMS6tuXnTJAedpwqMax12LfxouSgBCh4/DDChrVtx8
         r7nw==
X-Forwarded-Encrypted: i=1; AFNElJ+6JcQUU7BUHhYmUGSWFkii9F0UNhqFu/IlPXKYXP8JkwYYBTHo08cZS8VH4RztV98OlNA41/+2mamRHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJOvPH26RG2e2Ysfb2A8Z+zxh0nmfk/VdSJ9o8UES9ZFPruk9D
	P1nk+tTgCadDHfYCNcSKyLicyLMSq0n8YG3/N8w0JpnlQHxK1Hcp0FHu
X-Gm-Gg: Acq92OF/lg/WSV2deOym9Pxj0jiDZgFwGMbjFWirOxg+ItNeHer6axeUxojb/LqhkMR
	sEKAoDytD3hOamCOeikr4pMVSko4/03qjGRl0NpWxoHwyU1oR+Ukem+VGqKLU7MdPTyoEbNzyna
	67m9YreU0sLWMRpbMnaHEp28XC9KFoqFh1BuREdllT4UoQbQO9uNTkaWMLZlO1WqrBtjx5KJHia
	yureBdZoF10yX8VUGVMENIW0aBNlDkDGLc18hTrB0a+qGxv5xjE3zmYTItiYepbVNAeHv6dIBcJ
	vX86FZiitE11zs/4l8A7wjF7nY+DyKd6JgUhqgJMWn9CMRyItjtLEOYLPnXouWR4DG918vJocUT
	MBsoiieBxY1azw/4/pVVLq4o1uPcuHR0ILHHNr9PYToPB36X5puiMaJoy4qhSUU7rpliclvifxv
	WB5w3TU01+vraHIgjk5BYyUIrN6YQmMdHIJGuyH5rW1vMkcKI8cZSySKL/t7X15YmS8a91/lmbJ
	NtrFAxFywpS+cc2Lohcb6coQUCs9JK8pz7sd8kWTvDzji+ZCiFz0xrd7PRrPn7/
X-Received: by 2002:a05:6a00:448b:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-84284b68651mr2330670b3a.0.1780472602501;
        Wed, 03 Jun 2026 00:43:22 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:43:22 -0700 (PDT)
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
Subject: [PATCH 6/7] dt-bindings: riscv: Add Tenstorrent Atlantis platform
Date: Wed,  3 Jun 2026 17:12:18 +0930
Message-ID: <20260603074222.593243-7-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603074222.593243-1-joel@jms.id.au>
References: <20260603074222.593243-1-joel@jms.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004323_318836_71E241E8 
X-CRM114-Status: UNSURE (   8.12  )
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

Add compatible for the Tenstorrent Atlantis platform.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 Documentation/devicetree/bindings/riscv/tenstorrent.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
index e15359b2aab6..7fb640e38455 100644
--- a/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
+++ b/Documentation/devicetree/bindings/riscv/tenstorrent.yaml
@@ -22,6 +22,10 @@ properties:
         items:
           - const: tenstorrent,blackhole-card
           - const: tenstorrent,blackhole
+      - description: Tenstorrent Atlantis
+        items:
+          - const: tenstorrent,atlantis-evb
+          - const: tenstorrent,atlantis
 
 additionalProperties: true
 
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
