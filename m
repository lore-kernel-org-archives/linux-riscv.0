Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A594C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 13:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mTmZNrJVV65Vda4JMTwsACRv+Y14FkWRFx4zfoSpz4Y=; b=cia8/jecUFBChA
	5lvBNJKAvo9NQ2FU2OmDus4tT4YiLh9Rp/kax4yF0+S8XgSytul4YX3N+DBjhu/bfZA/J4xqbZeCe
	7a8z+d/kAZMngx2J1QfbAkmui8WsVEBzlGx0avNVujny0a3GjSBFVLyckjP2mv/YETUAUIE5WzcUP
	iVNFQxoUG2JSs/yrrynspbR0CrjXVwTjKmZop6O14+xPCVMyasmjrSBbuxWGjRr//d7kZg7R4l7xl
	l9rXI8x/aZd+BZ/6M6te2BHSm1g/jY4rlDLoihk3mTr4oMp1fubV6Ps9i/yb14kyFE0rBsEWe51L4
	sda6RMyGFsxkYITNWNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnCw-0099jw-5D; Tue, 19 Jul 2022 13:24:14 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDnCr-0099Yi-Ly
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 13:24:11 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1D1A43F0C8
	for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1658237043;
	bh=NEnwNeO0CJTpgQRAzMNc/OyktHScHaIM2e/dnIHqR2A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=dCZ5vfg4v4JTuwfjRmoImYw+1CA6qtD58cWgLowFAXIrJp3X1bcwbK9bMtu4yYQRu
	 kKlPPdYvl6cgu+07rYpyUg7ZdLpJG2+uiqN9u4HQjevhVK9zejxAOkvkAiw2cFRbz3
	 aINdFWKR6DC5moC+L7N3/yBvO+ck7l+vU2j4a0l5TBkV+rPj/c5Eb5VEutN0WYllsF
	 t+dCOgipJ+UrDkiR8qkEtQ/g/Mq2d/Uy5xDOegRyIKrJ0RZZDnHEdRQk1fREmp5FmM
	 HVMBBp/K9R95xIqTfsnkfwjt47rSaGFkO04MrnwAi7fPWLi+Fv9Wf8RsjlZKnb7zQ0
	 jNh/Xb+APhr1Q==
Received: by mail-ed1-f70.google.com with SMTP id v19-20020a056402349300b0043b0f690cbaso9990651edc.11
        for <linux-riscv@lists.infradead.org>; Tue, 19 Jul 2022 06:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NEnwNeO0CJTpgQRAzMNc/OyktHScHaIM2e/dnIHqR2A=;
        b=KY2FiSlOMmdWQ3eLI2BlcebmnZfjdqoJjeyVJnQUByAhHtNeNuM73eNrArzMHK1HrH
         o4EGrE0n2AJCUAaWJa7PoGwzZSyFMNEJ7fo5/GqpRaILK8sQnFSMIfvcEmazzVdAZW3A
         hH4XEh84dXaJsTjofwHLgMbGNEiJIQZ92vHuoLdVpBTudxhs4nKbrVuvSjZjNQysKem6
         JoE7/nB6l1u7d7vja2rBWTgZZhn5qqvJe/nYcgfti6/b69yTheIEzCjLTAwcsFWSOCHR
         yltwRNm4cXUiTuOiVa7ZuIlQCAAtY1x0CcMWIbDYh1B7CCEEKYzhq9lR61ymRlU7dClY
         tGbQ==
X-Gm-Message-State: AJIora9OB+lqeorSVFmPilQp2NHD147UUlf+/UAfuxDYurDBGGI1qw8j
	FFHOOPXqCsIBxH0TGdzlMW3V3ata96rtFNC36LXQuY/matfcHB75YfqFETzB36B8u1UqLtF6G1Y
	uJrxiyB6hQloj5fp51ufAOt8fAEQYL5LOUDgS1flzg77GmQ==
X-Received: by 2002:aa7:c784:0:b0:43a:caa8:75b9 with SMTP id n4-20020aa7c784000000b0043acaa875b9mr42981344eds.311.1658237042255;
        Tue, 19 Jul 2022 06:24:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfyjfKXkaD87iqKYQR9PlNCxMZIIgmYzl1HjLWcMUG68oqnf4JIHYfUz56Vl8NCmixfGa/uA==
X-Received: by 2002:aa7:c784:0:b0:43a:caa8:75b9 with SMTP id n4-20020aa7c784000000b0043acaa875b9mr42981330eds.311.1658237042117;
        Tue, 19 Jul 2022 06:24:02 -0700 (PDT)
Received: from archlinux.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id t18-20020a1709067c1200b006febce7081bsm6682894ejo.163.2022.07.19.06.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 06:24:01 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Ben Hutchings <ben@decadent.org.uk>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: compat: vdso: Fix vdso_install target
Date: Tue, 19 Jul 2022 15:24:00 +0200
Message-Id: <20220719132400.75407-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_062410_079587_EE0C56C5 
X-CRM114-Status: GOOD (  10.41  )
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

When CONFIG_COMPAT=y the vdso_install target fails:

$ make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- vdso_install
  INSTALL vdso.so
make[1]: *** No rule to make target 'vdso_install'.  Stop.
make: *** [arch/riscv/Makefile:112: vdso_install] Error 2

The problem is that arch/riscv/kernel/compat_vdso/Makefile doesn't
have a vdso_install target, but instead calls it compat_vdso_install.

Fixes: 0715372a06ce ("riscv: compat: vdso: Add COMPAT_VDSO base code implementation")
Reported-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
v2: Add Fixes and Reported-by tags

 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 34cf8a598617..5cfbef613e34 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -110,7 +110,7 @@ PHONY += vdso_install
 vdso_install:
 	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
 	$(if $(CONFIG_COMPAT),$(Q)$(MAKE) \
-		$(build)=arch/riscv/kernel/compat_vdso $@)
+		$(build)=arch/riscv/kernel/compat_vdso compat_$@)
 
 ifeq ($(KBUILD_EXTMOD),)
 ifeq ($(CONFIG_MMU),y)
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
