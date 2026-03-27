Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48DE10BA435
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNYYTBNvNc/NWscn7XRNFKq2uGOE/3tNC63tjEIcLNs=; b=U7iXqVNr1MWAIC
	bSUsDOB/Bui/O4onSAxaBs0TIGntt8Da2mOetyMSf4aK2jjZ+BmtxcRmbdHz8ngSDbmxaOpH38yuY
	7U3GIo9D7OPiAfTcZEcwEGYZ8uDizqmJlYIavUyCh6P7Br0XbfkBdko+f8GrzXW0zi/MFVo4cXTol
	ykx12IzglkZjwa8sQkj99S6f2BpKrf92WbqfZ1KdexxOtRjzqwweO1fyFOQkiPZGO4ZOy2YPLdsGZ
	ogPJR/Z4Y2fixoiV0O5m8vaOCaWQpjklzUSYh89B6xPDmr/a5X1PtID36vDQcQ6h7RMhr8heOBt+E
	keKubrR8zyO8+nDWxlXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627t-00000006v8c-0We7;
	Fri, 27 Mar 2026 08:01:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627q-00000006v6c-3pBx
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=2HryrWoWtiuMl3LNqbcdlk98yeRL5cKfDbuBDTCXl6o=; b=hqagPN/m+G4++c2TkiswTd/EsU
	WHtMPOaTf0GsaxmA9UUq3g+XWEhxgAly/z7icB/yfUaCHsMvbmO7MQ/f7n15bjHLeCluzbkr5T69t
	nauDgkfZlcyCZnt607uoEx2Va23Q0ex4iySnFVuCyLz1PKewsw+C/tgJ2O8jlus0GhIP/E/tnFr05
	7t7ik1cRWVp3DE+eRLIV8WnjodendNtaLUF2V4w4gYyABQGl6v79OQide0NOZSI3kkPKcQfhsM88f
	eBCZvtACJCTTqniTK4KMziN7Goql4Grz04xbwS8qeNi4ttQ2TIAY2RthQJolsvgaY0qG3s0g2Luk4
	R1pySTzw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w627l-00000009vIe-2EPZ
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 08:01:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-486fb439299so16831015e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 01:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774598456; x=1775203256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HryrWoWtiuMl3LNqbcdlk98yeRL5cKfDbuBDTCXl6o=;
        b=a2ObWdOBi6aiE9fHmvy1H/lv1aX2T+psk+U/0ynZCiE6dcznIa4cDiWl2ruxWdkSbp
         MrcSZK1m5483RkuzIlj6k0cNghgBtHTCag0ForuVHLVQyaJnpoPHkBxDy1qq5fkYUyKz
         M91bTzB6podg62L1q5xCsLYO8PMwqI3/K4WRd9qZNhGNIZj6qJz2PetZC4mT41IfyQgC
         hsjiQGLU56Z3C1FlQu3Ms88ZtRCF7SjSc64YG7IgdODp81ztUt64wYSJ4dVJZPV9nYJ2
         j38FOvC4o4ZofBpJbmxaP9/HHWdPFsf0PZnQPuBA5trYrT1pbJxNCzcinWoqo3HlqQzd
         hGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774598456; x=1775203256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2HryrWoWtiuMl3LNqbcdlk98yeRL5cKfDbuBDTCXl6o=;
        b=bHrjd2ocStVQ0Ir+GQKNAMcoFTvvWZ0JKVYF1Y89jhLQbcsVTf9CjH7U3A/Tk10Vkx
         IjCsXBkYvBi1pLGTDnfAf5GRuvEpiS4AP2BbvRAAPGfyTkP5x/s6gQriaOzDIsURgsIE
         Qlc8vEaqHOiN7ehPq3qQdlc7DFJa/jVd2E1oAfWbT3hLoUsy16kwApYaGXHAUwjerDzK
         EH2U48zzF/XtXf19TvkYznZ12u+BdPrtRlVIPigyQS8Zm4SG6b6/TkPsp3/WN4P/drQO
         wem0tZPXe3smYQiIFxymsGolRJUCbkvfsmJmGCZhYGGBXX3Wo7CY2+3lJ3k6hUr3LXTM
         0pJw==
X-Forwarded-Encrypted: i=1; AJvYcCUIxa75IHGvgKBYV3fMzul860FURacPh+iYjQ/MAhiARPWPzH/AKtYCVbzZbfIsD/HJTiYHsKh2zgpVTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFxvshgJbrNxjfIJzxmRwgM6mglNhqXwv/B6m9jS/3qs5FlrL/
	tk7p/ZZ8AaIhIuizo3Ezouw0mCmhkFjxt7vENZAifEDm1L5hDTkMYQg/QAByYaoiuHk=
X-Gm-Gg: ATEYQzxhfMvG1YHthd2HYz5PDHUF6BV1UJD6xmHJl0mVfzEfkl1h4n+WfYrZfx+WRXP
	3MQbbnvqLESLhj7O9MYaNynK7VJWs7GrXPfj4TRObVDWLCFpo7YsOk4D+q7Z+rfVzX8cZ9oUo8x
	JTeOEbwYsgJBzbcfA/BcHBFZwj9CZMFu8HlFQKklOgqZmiZMEfOoTX/GzBORmFsZvbTiY2u2ER1
	wicYL/8YaRFLxgm4TCde7Qsj08P1F54W7UsZ7uDEO/gQohabrMHcfG+vi+v92kPcADNyYUC4de9
	uS97gxbsMpOJzj1kGrZD0NVQ4lVHwR2UY2rKnPrL1N+FFOMVZYM36lGIo8D72Rvnr6gaIELcrZA
	v2Fax43xvP4C6hBNv86zcizTTWOdq4B5Zl/jR4xEiNwnPWeoVeJAITKDRXzG5QS6HGQliTiQ7Ji
	aD8IoTff8pSM/ZK77064JM0bI0OGkoUdWwSMpUqpaK
X-Received: by 2002:a05:600c:5249:b0:487:386:3714 with SMTP id 5b1f17b1804b1-48727f7bb08mr24460995e9.17.1774598456054;
        Fri, 27 Mar 2026 01:00:56 -0700 (PDT)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725fc4827sm12089735e9.11.2026.03.27.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:00:55 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-riscv@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] module, arm: force sh_addr=0 for arch-specific sections
Date: Fri, 27 Mar 2026 08:59:00 +0100
Message-ID: <20260327080023.861105-2-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327080023.861105-1-petr.pavlu@suse.com>
References: <20260327080023.861105-1-petr.pavlu@suse.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_080057_790381_7BE981B0 
X-CRM114-Status: UNSURE (   9.99  )
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

When linking modules with 'ld.bfd -r', sections defined without an address
inherit the location counter, resulting in non-zero sh_addr values in the
resulting .ko files. Relocatable objects are expected to have sh_addr=0 for
all sections. Non-zero addresses are confusing in this context, typically
worse compressible, and may cause tools to misbehave [1].

Force sh_addr=0 for all arm-specific module sections.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=33958 [1]
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/arm/include/asm/module.lds.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/module.lds.h b/arch/arm/include/asm/module.lds.h
index 0e7cb4e314b4..f9ad774b2889 100644
--- a/arch/arm/include/asm/module.lds.h
+++ b/arch/arm/include/asm/module.lds.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifdef CONFIG_ARM_MODULE_PLTS
 SECTIONS {
-	.plt : { BYTE(0) }
-	.init.plt : { BYTE(0) }
+	.plt 0 : { BYTE(0) }
+	.init.plt 0 : { BYTE(0) }
 }
 #endif
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
