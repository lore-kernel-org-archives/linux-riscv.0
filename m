Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A2C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FbDaUHOhj/fpBzszS7D7PuVle/cNOltHTZFn+q0jdtk=; b=Ec+h0g4lRjoK+I
	O1d6tz1hviQg3sqAoudOCOvOSEdQ6Q9o7QB1RCBYh0Weve+eRwIjglKvSLKpRv5sPvecroTR579Un
	fCAYGzZ0fiSV6x5a1c9FjJ1x+gNKYRA14c/Z5OHvd0z4/MAA+U+w973BP+MjpoVaJPOjZN1UskgrO
	e9uakd7lF9g+l1g1vIRqyS1ZaOrsgXDKhHuCYRZMMgfb7p2yNKQXhpUJPCK7zzE/DkP1APO8w320t
	V5c5mH4Nlr0nvMnf3B5oxra0ONvmSkML3fXo5RpQkLXWsYuPUe6kA+7Pg6GCtD8wx4bTZSs61w6et
	0eOTk51XMFDAsYb1aDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2GfW-008dCK-8K; Fri, 17 Jun 2022 18:26:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2GfT-008dBE-T4
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 18:26:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id i17-20020a7bc951000000b0039c4760ec3fso4903945wml.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 11:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ya0EzOgnAcpV7GCT5bqp95wfKfqrEjfL8vVRyEAKh/U=;
        b=Yu/5AIrDyhpKrKhSnucWE3Dl3ExEa9M79AJP2VuJEPYCpc3V2LxO3oS0fJ70CTpoMm
         kaR3DYn3BaeZxMhLa7fYVhMi8dPTUmJg/OTjlFXkywyVPOSnk1x839IrKaHOsBc9NSew
         4N9iU8ar6cRxvtCb6Bla1WcQzuBjG1rEufHstQvKrZZDCmUkwsEaV1b1sqrDpsnBUc+B
         Fwi1UYeKxoAbQX8Qf5vq5KB4VhJYiAVhem9P//t2klP6KjZidcNFeAMf52wESQs2nx1u
         2y2pAfh0BW3CXqZEUBklxDjI+0jR8QL0hZnWsq4touiYdABbYLurEfenoKX2mrAZ9m/g
         iYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ya0EzOgnAcpV7GCT5bqp95wfKfqrEjfL8vVRyEAKh/U=;
        b=L6iSr6IGdJ6/6mzCII6XOv/BuXDAFNEX/AAPPhswGOX0NqwW3pKVsqbKoSWa4QTKBu
         wu1IoMivftp799QjM8rAcg5v+T4/pMn/LgetY1qngEMIdIm5CzZvrFi5XigFCI/KfN/M
         kAnx0aeOwZ5wY8nW82z/Wj32jxQ08TvEMzf+nZlG8KGspOV0jmCS51A4gXKbyGDoXCao
         xIrnNAx2X8bDl9a/G1fq/Zf+YxmTP1nvlQC66MPCsHh2dZPeBHkA2esUlJ7ZDzcppAqx
         fj7qKRy9t4lnLN5JLPZKKmB1AvKkT3nudSiP9qY/Kbxl7zhZMVnGKp8gdRaNMjSW81/M
         g7sg==
X-Gm-Message-State: AJIora/zocT36R7a3bipnveofS7l0fHXedPsh69y7lx6N/9b3Il3gGqm
	EF6a8dD0iEWIrk3XewXlthOwxg==
X-Google-Smtp-Source: AGRyM1v0PsYVEH1DcykXdpeOuvz1yytWdpVvL5Q07EH1EYlHnTpGwNfegZNEmqhPaZgwPK/hmTRnRw==
X-Received: by 2002:a7b:c1d1:0:b0:39c:605c:1530 with SMTP id a17-20020a7bc1d1000000b0039c605c1530mr11574590wmj.80.1655490361125;
        Fri, 17 Jun 2022 11:26:01 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u12-20020a05600c19cc00b0039c4e2ff7cfsm10214194wmq.43.2022.06.17.11.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 11:26:00 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] riscv: config: enable SOC_STARFIVE in defconfig
Date: Fri, 17 Jun 2022 19:24:25 +0100
Message-Id: <20220617182424.324276-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_112603_995334_0DD9E5A6 
X-CRM114-Status: UNSURE (   8.56  )
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

From: Conor Dooley <conor.dooley@microchip.com>

SOC_STARFIVE is the odd one out among the (compatible) SOC_FOO options
as it is not enabled in the default defconfig. Add it to make catching
dt regressions etc easier.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

git send-email gave me an error that was unclear as to whether anything
got sent. Checked lore (and my inbox) but didn't see it come through so
hopefully this isn't a resend.

 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0cc17db8aaba..f8d7d9527c6e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -18,6 +18,7 @@ CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SOC_SIFIVE=y
+CONFIG_SOC_STARFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
