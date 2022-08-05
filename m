Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2BDC00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 16:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQN/0gCZKReCLIlHkViObHqV+F/F3EzqhUXqetdRxlk=; b=iU9L32A9/FMisG
	J+rdVE3DFxh6Bp8l3Bn6+XzaUlNkpqalqKRYrtKDZGVQuUWuzp/Yr+lMTlYKgra2t2nfo5hEpxgX+
	mMAyWRVXqOM23UFMAzjJQyxBuBJiiwUtAfqg9wITwjuuXpQQkFhF8ts3oxPbMhJihmMi4mIf5ssZI
	q8LCM2DoHeAcHy54eWSof/01x7bjCwiDtsvsKux1Fe02+ygKYz3dca8XfJVag5C7pgBT4r8loVfQU
	LCtCdJNSdHIDX4RZtAZNamhJD9kzeKimezoP5uruWF3k61yUkwocDBgZl4v170x5H8GYqaCiP1IKG
	B4rhhoW4uclmXY4+X9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzkz-00GXSg-Dj; Fri, 05 Aug 2022 16:01:01 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJzeW-00GTaw-U3
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 15:54:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id l22so3708932wrz.7
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 08:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Oh6dm/6O3Dvyl0Eg7I+pxcL/xv9k+9dvQbu4oYzTsCM=;
        b=Ae0oAEXkVYED9VuonJLUUDST+CEXSzWteDmRMtes0Qri+D1vqZUBn8ZtShZMBRbPEO
         ixuMl4x4pr3P4pgLbGagBFjl3rouF+CLLbhFiwyf+T2k+QAiHYdPkWhPpYLsy67D/IyP
         mCxjqUqxCwGIplkzWboM7khvjE18NyApn5hSSChH4A+C/sddlAKwDoOelcL/WVAx+Ltr
         M5m+tMtxvZRvkcdC/1tNvCl1UASPi0pz6tFKT+X9zuYg1O3yfkyDerRzrrUQcXLOAdnN
         gmhMGQWWK1SyLvB/CILQxrMMhcaJrvwjX6PJ+ilRYR7qwjZizhePOflcgXTRI05FNUBY
         p7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Oh6dm/6O3Dvyl0Eg7I+pxcL/xv9k+9dvQbu4oYzTsCM=;
        b=BCoab71wlgfPLqVbOVoWULGamZs/8drcjftVAqwM+3gdz0M8sw4UZ+Z/G+aJeAsPOr
         gANXF1d0kHRdUf5btkztp+hUgJzbTB507Qk8ivvEW/NuvDKh6rFprNBV99cVbrO5JlB1
         rLjdZR15NCv/Qddd3/0N31rI2fkY1pRpWqcHiP6ifvev5nQgoiBe+8GafZX5XAX0hdUk
         pkCkC2cQDhvmA1HpfQBKKHTmMJCgiAdvc+CUdtSCR0HOwAitQV964bcN5gm6CoYvM4Z2
         J9hqhzUkInVaS+GWHTZ8jEQ+cGzYJUhLc3u/sIC+DQ+Tw+vcskiQI7nfAgwh0HcDIL5N
         dRoA==
X-Gm-Message-State: ACgBeo0f69QtgcpShaSftDvK2li4WFEL8BvU4jSGpmAa0nljgBfesv+K
	9t/FqtURUfEjwKmlTwH1GkdpXIQ/RGWMwKcW
X-Google-Smtp-Source: AA6agR5kJBunV0x+i6qOrg5xPhytUuJZAw8O/LeDbbx0DL8bRSa6qQTVWnnI+mVilWhlvy3wGBD+oQ==
X-Received: by 2002:a5d:518d:0:b0:220:688d:4443 with SMTP id k13-20020a5d518d000000b00220688d4443mr4577769wrv.677.1659714859293;
        Fri, 05 Aug 2022 08:54:19 -0700 (PDT)
Received: from henark71.. ([93.107.66.220])
        by smtp.gmail.com with ESMTPSA id t10-20020a5d49ca000000b0021d6dad334bsm4133543wrs.4.2022.08.05.08.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 08:54:18 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/5] hw/riscv: virt: fix uart node name
Date: Fri,  5 Aug 2022 16:54:02 +0100
Message-Id: <20220805155405.1504081-3-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805155405.1504081-1-mail@conchuod.ie>
References: <20220805155405.1504081-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_085421_009250_D2BCD5B4 
X-CRM114-Status: GOOD (  10.23  )
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
