Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1A1C19F2D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 07:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cSnAOXIEVBhKWt+2NCRP7c/PKfzzv80EG6nIbxxabUY=; b=KHH6YIbtXulIIa
	267p+jHuvkBIEXMfA1t+UlNVhMlO+2JR6bGjKWhSIJtWQJ8lEcZfvKXbec7qQoara9dDqapHYcIRD
	ao3Y61jjAJg43c0KvnvGuj7YRc8hPgBLL6XYctX2BYddYeL3HqxRU0UyF1WGqOUVf4raWCa2Nai4w
	cDeHac6+phjcme83L4ahUm1puBttNppPacX0uSEOxyYjMiY/LU2PcRX3LxL+3BwYjdbfOSTMcpzLw
	jSVkYc0owCPLJpdsxVIQ1cFSi6zZybE0asHXFfsDBP1jJFALjU5Uw7iBB574gn09Rf6SlY/hBiU0W
	AZb0DYQDj+eGF5JvzfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM2G4-007kNu-Q4; Thu, 11 Aug 2022 07:05:32 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM2G1-007jxK-8Y
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 07:05:30 +0000
Received: by mail-ed1-x52f.google.com with SMTP id t5so21738910edc.11
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 00:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=bk1qevapMhDm+JgbQICH5FeQCF79nTZHyWRD8Iuolyg=;
        b=HHXOsENPykilzkk+9zAEH6snB06XhWIvJCRH2YfsbkqfhUw7tFwUiUzKPpzsoZGVie
         3McguUxrq2oo5EM3p5EoUd60Lu4HVYsAlq5BcqWEogIZnEVPrlpnmqZUCCcL8nCtSgKE
         Ap5C7UA0aTQH4dTZZ4/0WoQ+MbP+gB+7tV8oXQcsfOZe7Qbw24uN+SXE94tAKB/nVdJW
         X8V/Jc6nshPUaacNc1eoPIjFuLRjIPgKziAuFHZn2ECqHjGgSDsltmsNT7YId0OmmltJ
         t6R0bCY29wW7TBX6AZ4sh5zFAVcMWSEHlCK3JWG+frmdKMUxzue4pkCvExw2ts+23+4n
         1uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=bk1qevapMhDm+JgbQICH5FeQCF79nTZHyWRD8Iuolyg=;
        b=pJAJIk3CXQrzv/yY5HGQme9h5ArI0gHvfIZwU6MvMY38fDGZxWxQj1cZFbRmq5Kt0q
         RcgBvdvqK5/iBCVVQmoTenEdOAuaod5eJYyxylsLBFK5Js33ynhbTo4eGCPebTXGV7H4
         WxHjrLHx+kA4gc8uM1/IbkM57hRaMhOioSH/qxuXQW1GzwpzdQuv//GzXGcd34NMfTTX
         uu9PLe/MnwMXBJXv1khWVIKdCsf86ZunLp7NLwY/hE52AZ4lLMZacPUfoyOsvwfOe77k
         geETlw7+IjJpOgSJVJViLzf7a0RPAib3j0prjGx2EJnM0XOjSu3YMsZj34vQfjhZFj3s
         72ow==
X-Gm-Message-State: ACgBeo3EWFtm1IXj+BRoSE6P3j+TADiLvZSL9SdNu4r6A4u0l+TtEtQc
	YqbE0tUk2bjW1kqmKuKRGb8=
X-Google-Smtp-Source: AA6agR4Qj9Zxnp5RPjzHOJWUZnvDcMKS0ttojT6gbGQkpd5WvKWIm3lfNR+byryujQ7KhVjhE59v3Q==
X-Received: by 2002:a05:6402:304c:b0:440:d482:2fa6 with SMTP id bs12-20020a056402304c00b00440d4822fa6mr14642512edb.344.1660201525897;
        Thu, 11 Aug 2022 00:05:25 -0700 (PDT)
Received: from felia.fritz.box (200116b8267089004d8d56997cb46253.dip.versatel-1u1.de. [2001:16b8:2670:8900:4d8d:5699:7cb4:6253])
        by smtp.gmail.com with ESMTPSA id ds13-20020a170907724d00b0072fe6408526sm3184188ejc.9.2022.08.11.00.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 00:05:25 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	Wolfram Sang <wsa@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: rectify entry for RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
Date: Thu, 11 Aug 2022 09:05:06 +0200
Message-Id: <20220811070506.12252-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_000529_335909_A6E7B7FC 
X-CRM114-Status: GOOD (  10.08  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Commit 3cbd67384677 ("MAINTAINERS: add the Polarfire SoC's i2c driver")
adds the file entry for drivers/i2c/busses/i2c-microchip-core.c, but the
file is actually named drivers/i2c/busses/i2c-microchip-corei2c.c.

Repair this file reference in RISC-V/MICROCHIP POLARFIRE SOC SUPPORT.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Conor, please ack.

Arnd, please pick this minor non-urgent clean-up patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9203efedea1e..797fde7e1821 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17544,7 +17544,7 @@ F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/char/hw_random/mpfs-rng.c
 F:	drivers/clk/microchip/clk-mpfs.c
-F:	drivers/i2c/busses/i2c-microchip-core.c
+F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
 F:	drivers/rtc/rtc-mpfs.c
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
