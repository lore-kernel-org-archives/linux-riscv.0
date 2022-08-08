Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389C5C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 21:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y+7967tu6wimzqMwP451TzV+E6ITkxDS4Gf91nk6+yg=; b=AIADLNk9HRDEl5
	R8X9eKQf3TCZ8nMcyG5D4aBiRkT8uvYqTFmJvH8gIG99LXinj2n02JRkX6BUoaAVf80UbdqCh7gOW
	SDDDAz1WoEdtdbXvcwGVJYOGQVBaJRUWYEyePNabJMmLxG7cIJhEQeK4YBDveUlpw1PCKUoUpXJVM
	DmkUT5CwRo4OcRH6g9MKM7JgxJrS+NAxSEmz+SXqeHaAnGreyP5gQj/KgVClDg3up4mwfCDR8DdSf
	WH6iT0VhYs/FJRXAnXaJ86sCzSmziXnbjIhGNbr18HTJzLtl5WPa/E9oYKFZ0AEMutxCnMjGCPkFK
	jaSnngje8u/4EM28k1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9zH-00G4kL-DW; Mon, 08 Aug 2022 21:08:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL9zA-00G4e7-BW
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 21:08:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id l22so12224106wrz.7
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0ajOPxy/v/tTsJ/HZ3G4BXDWf2I29Kqy4qHffsnPMhs=;
        b=KqSVU6AK6ulgYPeBs31yngVlU2Ee9aa/rzGfsjILtNR8FqtWpA0dwzUZZ7/etxclxr
         8WuNH+vABTf80sM1zLCdhfz+AQzco9TpRL6YrrGnlBoHit566hNJDvXPA6HgY4bkbv+k
         OaiiTvuG8c0M93RYeCzhye1Cx1Wds010vQiUwRBpOOQZ236PGWxn6N6BM3OoQMuwTMH7
         EM/D9uhjquvXaTf4u3J+Hq7qIKn/IiB2bwpvA9j7/4wWX+ckBgJHvY5eAN+aFHJN1BCq
         Nv69EyF0Ukj8K95n8yhE4hK2uSe5Rh0wf5XL9UjgD869mWeMSPpn6TqDZpWgQOLlr7ZU
         PYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0ajOPxy/v/tTsJ/HZ3G4BXDWf2I29Kqy4qHffsnPMhs=;
        b=2UHhsjV8RFl7x1hu6+dxqPzBk81X747/v93LrDpG5tKSrXkOxtow7Oa0zTmJzeBs3/
         4JC6AX7wNQ3+6AuP4MroJgDUE6saVF3MOgeZkUNJMO7UnsMyS3f32F9i6YRaRVnSAppX
         wOpOwQx3qvqVFIsTuP3f/uoUBVhcgFYZEhDSH4pVe3yKT8lmvS8AtJ95PX/KmtkSVWBM
         KHU8WaDHGokA1qF1MkWiBexAvobBkclMDnedA6TNw2DT65G3NDGD6/UJBG3VR5IEKbxn
         WmPALVRtsHtlHdeEzoA012wXvl7IJpZ6xyVokyUzEVs7nHZXdXk+3XpN2Sv+uP/jAeGM
         fc1w==
X-Gm-Message-State: ACgBeo1MEvGK9jDtxRzQriLk+ybZxP4mYERI5dqmgUU01gpqfsGWasw1
	6DF3/3/tZJd7HRNlu5Rw2XirLQ==
X-Google-Smtp-Source: AA6agR6LlfEnOfEbh1WK7NgwLMeQG/O7QUNUT88MyPL54Pg5NAkbxDOKuQugCAT9FIpECNXnBS2EsA==
X-Received: by 2002:a05:6000:812:b0:220:5a66:ebd0 with SMTP id bt18-20020a056000081200b002205a66ebd0mr12753638wrb.519.1659992903425;
        Mon, 08 Aug 2022 14:08:23 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id i17-20020a05600c355100b003a2e92edeccsm19811955wmq.46.2022.08.08.14.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 14:08:22 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/4] hw/riscv: virt: fix syscon subnode paths
Date: Mon,  8 Aug 2022 22:06:43 +0100
Message-Id: <20220808210643.2192602-4-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808210643.2192602-1-mail@conchuod.ie>
References: <20220808210643.2192602-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_140828_443894_5B24E41F 
X-CRM114-Status: GOOD (  10.24  )
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

The subnodes of the syscon have been added to the incorrect paths.
Rather than add them as subnodes, they were originally added to "/foo"
and a later patch moved them to "/soc/foo". Both are incorrect & they
should have been added as "/soc/test@###/foo" as "/soc/test" is the
syscon node. Fix both the reboot and poweroff subnodes to avoid errors
such as:

/stuff/qemu/qemu.dtb: soc: poweroff: {'value': [[21845]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-poweroff']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml
/stuff/qemu/qemu.dtb: soc: reboot: {'value': [[30583]], 'offset': [[0]], 'regmap': [[4]], 'compatible': ['syscon-reboot']} should not be valid under {'type': 'object'}
        From schema: /home/conor/.local/lib/python3.9/site-packages/dtschema/schemas/simple-bus.yaml

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 18df0b4695 ("hw/riscv: virt: Allow creating multiple NUMA sockets")
Fixes: 0e404da007 ("riscv/virt: Add syscon reboot and poweroff DT nodes")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 8b2978076e..a98b054545 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -896,7 +896,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     test_phandle = qemu_fdt_get_phandle(mc->fdt, name);
     g_free(name);
 
-    name = g_strdup_printf("/soc/reboot");
+    name = g_strdup_printf("/soc/test@%lx/reboot",
+        (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-reboot");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
@@ -904,7 +905,8 @@ static void create_fdt_reset(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, name, "value", FINISHER_RESET);
     g_free(name);
 
-    name = g_strdup_printf("/soc/poweroff");
+    name = g_strdup_printf("/soc/test@%lx/poweroff",
+        (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "syscon-poweroff");
     qemu_fdt_setprop_cell(mc->fdt, name, "regmap", test_phandle);
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
