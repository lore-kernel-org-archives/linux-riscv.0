Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1114C2BB41
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 20:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEL2bW5buEecU9hVntVw1AeVP/7eSwAu2dZmoCaoTTE=; b=Y+fZ/E/SR066k9
	Cd+sNMiVH3KmeonKHMEvtTnjxpfGIV4AsbiZint3JjBmTavwlk+t71yMxC3ngB1Z7/ZeNYocW6B2t
	mcCzSRhL3YidhDZz0mvmUQed7RyhKoneLPxb3lhssdXdNFR/p6arGY65oDSlBr1d+PaS7HQhf7kF6
	1wXhfzKI9unZXKWZlbpqPZhDoYkByqkcCp5D4JRYQiygkX1b4Q0yIk0mSVA1CI7Ssvz7lLW/tM+m/
	eY0xGMqLwhanUsbzIsdABPIkp8wtuvGHLIbZUXkP9x8s6seUoYGWo2c/cnN+McEDsu2DS/7hXZvY8
	Dhr+ONfjIdSgoXuezw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIq-0066es-Lk; Wed, 17 Aug 2022 20:06:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOPIh-0066VC-Tf
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 20:06:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so2108710wmk.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
        b=SvB7YEP3eBYgrsleZ9iJFkse/4XFgJLUFnZphTSo/h+JulyMrKVTZD8RO5Kg+xC5CU
         DeM3YEJ/7AJzDEuYTEFUS4u64EqaNwRPh8LLxU7fOu+knhpXuF1UoqLMf2vDzColvBcG
         l7EmjVeU4ldGrhztpHd+yPyzkjgGuYQURy1EZIMtGAO8cM/JJPCeB+60hrOrBaNrDsS6
         AaVH3j6cDsNPNUKbsndY9MAU8mfFXMKGQOiukc6NDpw2gXBhTGUTW9yoLzJt/azZ3xzA
         7hI0vRlX+AqEl3fe97FyADdLJ4s6F+sjgTgO0k8BTw9+Ru5FXr9VeuJ35AY6NZA3XKo3
         rDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
        b=j+xQFoh7FU9qSLX257OQgHBwc2VdVWesvRcQn+6OEFEgNOkAmh5XPpKcWCk+StIu4X
         ftIzySHnHtzPll8iLqBQWFScjSaaFK7s/YbJJVKtgYZNbhRF59IM0PSK+2nNyM1XX4qZ
         9kwZ+AKsxSkoXhNcsmPH3XiTC4vfnvgwhtqPmQmI2xrOHYc9ONblTB/J22LORQDJAz20
         fL3paDtkq+6JvssNhAD3iHQjhZ4kkDrbwTjhtlgU5FCshUZbAfk40svhzmA8INjpba29
         BNrtRHxfMtTZM2/NRFnWLprSkHo9Uv6F/KythBlqpo7ArmSItqZ6TSUrHglca+Q7I9F5
         HxtQ==
X-Gm-Message-State: ACgBeo25Sue4yxdfsy1KTs37eO5LTXo8m31H5rTJHKPPrjEwiz3OO798
	msKORqL0Poig1QKRs8+lJX9oVw==
X-Google-Smtp-Source: AA6agR69vG8ENkmh+Uqgy8Kv6cQH+ISkT39e9E6kBR+5DdZP6du68vAeHlgf+tU+DqK4XBGR6h4HRw==
X-Received: by 2002:a05:600c:3b0c:b0:3a6:aa0:5966 with SMTP id m12-20020a05600c3b0c00b003a60aa05966mr3076942wms.183.1660766762106;
        Wed, 17 Aug 2022 13:06:02 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i133-20020a1c3b8b000000b003a531c7aa66sm3400883wma.1.2022.08.17.13.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 13:06:01 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	qemu-riscv@nongnu.org,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2 1/4] hw/riscv: virt: fix uart node name
Date: Wed, 17 Aug 2022 21:05:26 +0100
Message-Id: <20220817200531.988850-8-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220817200531.988850-1-mail@conchuod.ie>
References: <20220817200531.988850-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_130604_011541_F70D7EA6 
X-CRM114-Status: GOOD (  10.67  )
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

"uart" is not a node name that complies with the dt-schema.
Change the node name to "serial" to ix warnings seen during
dt-validate on a dtbdump of the virt machine such as:
/stuff/qemu/qemu.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
        From schema: /stuff/linux/Documentation/devicetree/bindings/serial/8250.yaml

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 04331d0b56 ("RISC-V VirtIO Machine")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bc424dd2f5..6c61a406c4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -917,7 +917,7 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
     char *name;
     MachineState *mc = MACHINE(s);
 
-    name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
+    name = g_strdup_printf("/soc/serial@%lx", (long)memmap[VIRT_UART0].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
