Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217C8C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l4M2PXeEHnNblNUPX4guIyd4VmDObBj2KS3OF8jiiKc=; b=tBpY2a490+SbBE
	j8cbLfmjO2Thg2EM15g5EBNab3HbNwo7hg8VuqLMxLbS6KgojIRkioErGU3RW0NaSroxkxP1lEtwV
	GMHRTsqk2hwEvvS0BUFXkEeyigwRCubU9fW6ZiGM3V/PoOA01+s/kLTCtDIDw9OU5EyIra3ql+MqR
	UmTquPhX4pwafIuUFi/5ktKt+ximp6N7N+pUWKHJAxvvoO9X8+svJVw7X4Yl1I7K7OVuXOPjNSQz9
	YuTfIsQpaouS3XC0ifqRphguGG15DEC19XFCcwguPst9Z3BSom0g+AYkJMMyGDDqDYiEvZalAovsF
	RnjYJWupPoUL+5/PGHSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JM0-0013fv-1X;
	Tue, 07 Nov 2023 10:30:40 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0JLq-0013TK-1j;
	Tue, 07 Nov 2023 10:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XvIpI/fOswr56cvCQAdqf8hdZkC9UDpjjIC5xLTkoXs=; b=MZ0naxFz3vids07yM45pty4W0P
	d/bJc0iiIcMu2WMIvxlsdkQ48DYAqikA1U1XIPKonM/Mz+2Iav738rVRM3IqwFFfP+jriZ7nKNrhd
	2+yW/E2p3S1VBDGQA30p4wMAkO02wThiHZslySfz63HPYdrwCLZfTzFRUwWX6iyYv37UvqdBQeHFt
	ft+ZCf3/DZpaHpUoktVg0SXl9U/xDWqKLhVVNZfDCcuj6zCP8nE4mGpYMQsE0RUSNoBR++2zhE54h
	4iqc47813sdIbYiWv8ILtQbGZHv3QjU+8uBNJ3IDTx+qPEEkl6VuC9EotVzNj3/Y8xf0Hz/usasWL
	IvZbpsIA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42222 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1r0JLg-0000HM-0F;
	Tue, 07 Nov 2023 10:30:20 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1r0JLg-00CTxd-31; Tue, 07 Nov 2023 10:30:20 +0000
In-Reply-To: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH RFC 12/22] drivers: base: Print a warning instead of panic()
 when register_cpu() fails
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1r0JLg-00CTxd-31@rmk-PC.armlinux.org.uk>
Date: Tue, 07 Nov 2023 10:30:20 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_023030_619243_F0D51802 
X-CRM114-Status: GOOD (  12.90  )
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

From: James Morse <james.morse@arm.com>

loongarch, mips, parisc, riscv and sh all print a warning if
register_cpu() returns an error. Architectures that use
GENERIC_CPU_DEVICES call panic() instead.

Errors in this path indicate something is wrong with the firmware
description of the platform, but the kernel is able to keep running.

Downgrade this to a warning to make it easier to debug this issue.

This will allow architectures that switching over to GENERIC_CPU_DEVICES
to drop their warning, but keep the existing behaviour.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/base/cpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 221ffbeb1c9b..82b6a76125f5 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -551,14 +551,15 @@ void __weak arch_unregister_cpu(int num)
 
 static void __init cpu_dev_register_generic(void)
 {
-	int i;
+	int i, ret;
 
 	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
 		return;
 
 	for_each_present_cpu(i) {
-		if (arch_register_cpu(i))
-			panic("Failed to register CPU device");
+		ret = arch_register_cpu(i);
+		if (ret)
+			pr_warn("register_cpu %d failed (%d)\n", i, ret);
 	}
 }
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
