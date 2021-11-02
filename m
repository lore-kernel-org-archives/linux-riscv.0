Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D5AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BD86023D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2BD86023D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBFCyAmrcm2wkJlVKC5u4aPcOJ5QlPm29vzO5qdAGQY=; b=bKUE3smEJTV4Jd
	IDz9wJ9oAccS6ogOlnrakxvHl49qe3SPkluxYwVnwoaJ2ZrZND24MlMc1CHyQoW4sn3qXQTOEObcw
	67qWLn2bxPG9OvJpUHLvEAUWoMyyzbxQPXb+W2pEXTuaDdFjlstIqVzi+TpYv6J61e4pe+6maaPsa
	Aw69dEgzYArBg9/0kq7SzWy8WJoQoHaEbmmkrOGdRY98uHKW8apxa3MnJUAz8o88XDBJXVMBARgYv
	Ifj26LxBqNath0mdIC1r72pFgsSkU24xSblNIXUYLjUp5lTttdjJV/1XWAseT9jDHH/x6FER0tmIU
	xnhFSXrmXGfZIPatH83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwOE-002FSN-BL; Tue, 02 Nov 2021 16:11:58 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwOA-002FOf-Di
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:11:55 +0000
Received: by mail-ed1-x535.google.com with SMTP id 5so76678908edw.7
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 09:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JB6hpmX7hgdEksB90s0jcnSr+ju9+L9HjspXKT59qjU=;
 b=fVb101zrOEdS1jAihWIfIyG+HQ66faBfoTEPEjsImMCJlaDk99daHWDiRdMv9qAm6U
 GM9H/u2t1uEvPHe30jLQEM+ouGBlHQe+ZhRo1x05dUPrBFSf8SKhs3rxpXbbxcQ+hLAp
 etv+xJQmu+twe90NWHLP3z3ci25uyuukUISDFEK6i2lfbVbpaopLQYGT5SSq/BvwlQbj
 EZcCo5CLWZIg+UbzGNT9ufQwPkQux5wMhqJsSJQOX7IxtVW69drDJMh4b77eacE469jg
 t9hRSVozQqpwWK2svSUwTunE16HCRfntTzc3PMSOsRLxVQFt0VJfX0xnWdeHbmoIQU7v
 AFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JB6hpmX7hgdEksB90s0jcnSr+ju9+L9HjspXKT59qjU=;
 b=WazYO2nmk6H8laOUmfPJUSnMTKT3SG80/iXfdf+j4Anxz6GfZgUuSKiNVORy/ZtT84
 Y/h/Pa1Y5tViL8FzkFSzOgCigUa109a3th7vuUMVuHaEMqzMLxwVHLTGRuaDIDeht6KH
 cZgwYtbk40Dqkrrg5j1oD4aeWFct5Q50n4FEFaPsrCftIaFesWYBrBee3DTr4/HA+CFW
 0LMxc4bvL1dvbKxL9a+37bsuPW1E6czbOVtOc2YWx1HLMJHa/2tlum3Ghcdkcjrq650U
 nEzQagJ7QJ5rJI6fq2fDgcZdLcVJEwtKUx36Zh68/xmva3SVh6HHGwSYImuOWtuH2Xcq
 td3A==
X-Gm-Message-State: AOAM531BMMSj4VEIBC3QNS5yZdcNWTsDjW1ZivjEm0N8pfsLYp7IyBAO
 vqaqcH1tv7OEUdzus/thq4N3SnA204BTxw==
X-Google-Smtp-Source: ABdhPJxfmR6VqzkUY6gH2B1BqxHGO4w5PXJoyND0TScH00vVuowx+rxq+rysIijJ0FZBUXcxhZe0Aw==
X-Received: by 2002:a50:fa99:: with SMTP id w25mr48882966edr.324.1635869510676; 
 Tue, 02 Nov 2021 09:11:50 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:11:50 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 03/16] dt-bindings: interrupt-controller: Add StarFive
 JH7100 plic
Date: Tue,  2 Nov 2021 17:11:12 +0100
Message-Id: <20211102161125.1144023-4-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_091154_506085_E5C4B000 
X-CRM114-Status: UNSURE (   9.70  )
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

Add compatible string for StarFive JH7100 plic.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 08d5a57ce00f..28b6b17fe4b2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -45,6 +45,7 @@ properties:
     items:
       - enum:
           - sifive,fu540-c000-plic
+          - starfive,jh7100-plic
           - canaan,k210-plic
       - const: sifive,plic-1.0.0
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
