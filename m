Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ABCC61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 11:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWRGf8VCoqY6izdkdM0DZ2GnCGn6c5SGwelw2ufPpiY=; b=Jd6WKpwfl3JFkA
	dXFbKt/Ufo9iaZ2Or8xm4axigh8Bv0Qc9Lsv3otFKcPpmFLJX6/JAwSkCP3Nmm3tMUqe+x6JHCPl6
	pGkD4Co2b8bp7NtabUO/mzLd0RQ2yUTJlwIJ7lFold7j/bujwWuuYKrupZ4B37n9YGVOL5n2xkJ6p
	zI1vzNBwYqlFyG7CGg/OUiRklMRIhOJUVjUpzRhLYL1KkvpZiu4lOID8I4kh3HFTiZUnpdER+ZweX
	PuOaqDysPX+NHDE+ZQroWemHF4tYryUfI8ICBvKbY1AqgX7Bnfty+JxK1ylqCdqVVdGzGwkFLw8pb
	Qgoo6f+oPgzan7GkXmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRthQ-001Rtb-RC; Tue, 14 Feb 2023 11:42:16 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRthM-001Rrd-Ur
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 11:42:14 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id D06EF1F383;
	Tue, 14 Feb 2023 11:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676374924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fUeGf6y5tf2KsuLMak22k+k24KUuAb9SQgUxv43Mdwc=;
	b=hTgKoLtMn1WEz7RJ32zme/BnvJ+Ux68vY4Si9TGBg6PaogO8Fpn2fZyEDg3eIUcGIRSaPm
	HwAj6fQXxtCDh9fm0X2kcnmUTD8iMEqXfDDPYsthQoeIygeY5vXGBwiXLdPDgGlIHnEhUY
	9UEAcL9pPsSVL4Z7MyCDoXVBL85ZZpg=
Received: from suse.cz (pmladek.udp.ovpn2.prg.suse.de [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 673672C141;
	Tue, 14 Feb 2023 11:42:04 +0000 (UTC)
Date: Tue, 14 Feb 2023 12:42:00 +0100
From: Petr Mladek <pmladek@suse.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: jirislaby@kernel.org, senozhatsky@chromium.org, rostedt@goodmis.org,
	john.ogness@linutronix.de, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/1] kernel: Match preferred console first.
Message-ID: <Y+tziG0Uo5ey+Ocy@alley>
References: <20230213113912.1237943-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230213113912.1237943-1-rkanwal@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_034213_204829_6BD32A2A 
X-CRM114-Status: GOOD (  27.13  )
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

On Mon 2023-02-13 11:39:12, Rajnesh Kanwal wrote:
> For cases where the driver registers the console with the index set to -1
> the `try_enable_preferred_console()` doesn't work as expected for multiple
> hvc consoles.
> 
> For example with `CONFIG_HVC_RISCV_SBI` and `CONFIG_VIRTIO_CONSOLE` enabled
> and cmdline set to "console=hvc0 console=hvc1" where hvc0 being RISCV_SBI
> and hvc1 being VIRTIO_CONSOLE (the preferred one as per the preferred
> selection logic in `__add_preferred_console`). hvc1 never gets enabled as hvc0
> matches first with the driver name "hvc" and index set to -1.
> 
> Here is the hvc console structure from hvc_console.c L217.
> static struct console hvc_console = {
>         .name           = "hvc",
>         .write          = hvc_console_print,
>         .device         = hvc_console_device,
>         .setup          = hvc_console_setup,
>         .flags          = CON_PRINTBUFFER,
>         .index          = -1,
> };
> 
> The expected flow is that hvc1 should take precedence but given hvc console has
> the index set to -1, the current logic will try to assign the first console that
> matches, which is hvc0 and return. Never touching other possible consoles.
> 
> This change makes sure the preferred console is checked first and then iterate
> the remaining list.
> 
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>

Unfortunately, we could not do this. We have already been there, see
the commit dac8bbbae1d0ccba96402 ("Revert "printk: fix double printing
with earlycon") for more details.

It is sad. The patch would make perfect sense. But we could not take
it because people would report regressions.

I am afraid that we could only better document the existing behavior.

Proposed patch:

--- a/Documentation/admin-guide/serial-console.rst
+++ b/Documentation/admin-guide/serial-console.rst
@@ -33,8 +33,11 @@ The format of this option is::
 			9600n8. The maximum baudrate is 115200.
 
 You can specify multiple console= options on the kernel command line.
-Output will appear on all of them. The last device will be used when
-you open ``/dev/console``. So, for example::
+
+The behavior is well defined when each device type is mentioned
+only once. In this case, the output will appear on all requested
+consoles. And the last device will be used when you open
+``/dev/console``. So, for example::
 
 	console=ttyS1,9600 console=tty0
 
@@ -42,7 +45,29 @@ defines that opening ``/dev/console`` will get you the current foreground
 virtual console, and kernel messages will appear on both the VGA
 console and the 2nd serial port (ttyS1 or COM2) at 9600 baud.
 
-Note that you can only define one console per device type (serial, video).
+The behavior is more complicated when a device type is defined more
+times. In this case, there are the following two rules:
+
+1. The output will appear only on the first device of each defined type.
+
+2. ``/dev/console`` will be associated with the first registered device
+   when the last defined device is ignored because of the 1st rule.
+
+The result might be surprising. For example, the following two command
+lines have the same result:
+
+	console=ttyS1,9600 console=tty0 console=tty1
+	console=tty0 console=ttyS1,9600 console=tty1
+
+The kernel messages are printed only on ``tty0`` and ``ttyS1``. And
+``/dev/console`` gets associated with ``tty0``. It is because kernel
+tries to register graphical consoles before serial ones. It does it
+because of the default behavior when no console device is specified,
+see below.
+
+Note that the last ``console=tty1`` parameter still makes a difference.
+The kernel command line is used also by systemd. It would use the last
+defined ``tty1`` as the login console.
 
 If no console device is specified, the first device found capable of
 acting as a system console will be used. At this time, the system


Best Regards,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
