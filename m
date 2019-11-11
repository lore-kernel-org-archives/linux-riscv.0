Return-Path: <SRS0=SgWD=ZD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913A9C43331
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 11:36:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63A6921655
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2019 11:36:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WK9c3I6i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="bxHpIPb5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63A6921655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmBncmg6KexC8878sFyLGwUZymfc7xYZ77zhN/OH8OM=; b=WK9c3I6i1qFAuC
	IIuWBUAzNIdKec1amOljp160tcSaLRYlkybSYZ18/BIBQEYFtz7wEFmy5cqGhRBB5qdkiJf3IeDhP
	LpEEnOqTbFhyHFapZT/X7GGn9+LesRcPTvsBx3uCJ4WX8kiDw8a3skgjrM9vNsr5othMKwHENYG78
	0Gizlo7ZZX4MJ228PXwuqRSkqXJYQcS8vIONYIF/nGQNLigyJJ3mDwgZhd6AYZEPKi+6D7LKGJT7y
	aZXKy5on+/PvoQXFRFgMp8+ZutWRls8YM+7ke2DOlOTSVQ4M0ot44vZO1plmYC7NT4zp1I/HX2aj6
	jz6dtq7E8LkHMqGFdI4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iU7zv-0006Z7-Hd; Mon, 11 Nov 2019 11:36:43 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iU7zr-0006YD-Hi
 for linux-riscv@lists.infradead.org; Mon, 11 Nov 2019 11:36:41 +0000
Received: by mail-wm1-x343.google.com with SMTP id c22so12865494wmd.1
 for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2019 03:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y0dulQXEpY4JTRjYNrgxL7H4Oc+cEpHXSad2UPEfcck=;
 b=bxHpIPb5phD5/xnyo/ChAZAMq+BdxeaAyc6U/zw8Sl83T8N5fzUKeN95dyN4AbByx4
 QNGTpquHrJxqPQO2cqiIHQ2xGmU5avPs8s2QfezmZ++a5NpQMU35u+5KyGmNEzAruCOs
 H2FSzP5CLlAOpkaoFUQyAkVvhvJ76TBZvk65gF/5pA3xvKn5rUe59p6lzZZ+Qzq18wql
 eSqtJfMIohZsY/OldoyBBzP9r4hsvs2yeIzz/2iytuuiUh1dPmeDMmiDSN3UHRakIwsV
 nFzL/cLdwv5l1flpZ5DcbGZtbEYmTbPj2AyiFTBM4xfjtF6Bk+H5L/uClwVVlRggjvb4
 1Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y0dulQXEpY4JTRjYNrgxL7H4Oc+cEpHXSad2UPEfcck=;
 b=sUAbEVwzgzZIRNzZzyXMqN9qUWU1bWkPa68oHG7Ll/VxVA9L4EYeMp7r6TGXcdfpqv
 LOAva8wxyJfQifvehtDUAtZManJQoHSVIc0FBcBrJehppaOTYZssKPhAO7JCrM6kSYbC
 ENKP+Ow+S85LW8cnIbZU9NmyhepiZvcNnlw2BYrtiJmqj3nl0TefPCj0KmdscQgsj0G2
 RcOPJtn0KrYl9d8FYg1mrpLYdkecvkMKXGgKIRsTsfHLl5b4MKMQK7NBh7mqC+Sz155Z
 WZIJOHokaE2/1ceh+04CM+ksZFuJgEIoiq2rrgWl+Yb8a44urrjkxgTh6/UIOyDp7HCB
 AXyw==
X-Gm-Message-State: APjAAAWQk0GCm8rKJ6Zvo9CFj8hO6SiRrhdh/4Xer63yhIueV9rci+Wf
 00xicqv2EPwbjJjwd3n4pIQglPGgDgTU87uWa6Flhg==
X-Google-Smtp-Source: APXvYqzukrpx06aOA3LqbJs8I7XR+FwIaaQYKy+Gm7Tz2e7dz1DLqlFOVFvJ8DYuDBp3HPhpvJ+qTAC1ypDwtFmt5ow=
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr18470654wmf.24.1573472196560; 
 Mon, 11 Nov 2019 03:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20191107212408.11857-1-hch@lst.de>
In-Reply-To: <20191107212408.11857-1-hch@lst.de>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 11 Nov 2019 17:06:24 +0530
Message-ID: <CAAhSdy3SGAkOFMhx320KJdPDh6c=qcKqCZ=qrXNKBGtejpZwSA@mail.gmail.com>
Subject: Re: QEMU RISC-V virt machine poweroff driver
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_033639_729338_25178B40 
X-CRM114-Status: GOOD (  13.16  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 8, 2019 at 2:54 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Hi all,
>
> this patch add a driver for the test device in the Qemu RISC-V
> virt machine which allows properly shutting down the VM.
> It also is added to the riscv defconfig given that qemu-virt
> is the most popular riscv platform.

We really don't need this driver. Instead, we can simply re-use
following drivers:
mfd/syscon
power/reset/syscon-reboot
power/reset/syscon-poweroff

Just enable following to your defconfig:
CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_SYSCON=y
CONFIG_POWER_RESET_SYSCON_POWEROFF=y
CONFIG_SYSCON_REBOOT_MODE=y


Once above drivers are enabled in your defconfig, make sure
test device DT nodes are described in the following way for virt machine:

testdev: test@100000 {
    compatible = "syscon";
    reg = <0x100000 0x1000>;
};

reboot {
    compatible = "syscon-reboot";
    regmap = <&testdev>;
    offset = <0x0>;
    value = <0x7777>;
};

poweroff {
    compatible = "syscon-poweroff";
    regmap = <&testdev>;
    offset = <0x0>;
    value = <0x5555>;
};


Here's the QEMU changes I used for above DT nodes:

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d7c5d630eb..7f8206c726 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -186,7 +186,7 @@ static void create_fdt(RISCVVirtState *s, const
struct MemmapEntry *memmap,
     int cpu;
     uint32_t *cells;
     char *nodename;
-    uint32_t plic_phandle, phandle = 1;
+    uint32_t plic_phandle, test_phandle, phandle = 1;
     int i;
     hwaddr flashsize = virt_memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = virt_memmap[VIRT_FLASH].base;
@@ -357,13 +357,32 @@ static void create_fdt(RISCVVirtState *s, const
struct MemmapEntry *memmap,
     create_pcie_irq_map(fdt, nodename, plic_phandle);
     g_free(nodename);

+    test_phandle = phandle++;
     nodename = g_strdup_printf("/test@%lx",
         (long)memmap[VIRT_TEST].base);
     qemu_fdt_add_subnode(fdt, nodename);
-    qemu_fdt_setprop_string(fdt, nodename, "compatible", "sifive,test0");
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon");
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[VIRT_TEST].base,
         0x0, memmap[VIRT_TEST].size);
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", test_phandle);
+    test_phandle = qemu_fdt_get_phandle(fdt, nodename);
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/reboot");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-reboot");
+    qemu_fdt_setprop_cell(fdt, nodename, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "offset", 0x0);
+    qemu_fdt_setprop_cell(fdt, nodename, "value", FINISHER_RESET);
+    g_free(nodename);
+
+    nodename = g_strdup_printf("/poweroff");
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-poweroff");
+    qemu_fdt_setprop_cell(fdt, nodename, "regmap", test_phandle);
+    qemu_fdt_setprop_cell(fdt, nodename, "offset", 0x0);
+    qemu_fdt_setprop_cell(fdt, nodename, "value", FINISHER_PASS);
     g_free(nodename);

     nodename = g_strdup_printf("/uart@%lx",


Regards,
Anup


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
