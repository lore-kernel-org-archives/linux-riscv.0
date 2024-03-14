Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED868C54E5D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 07:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S7ZZZcriv4R001GepJY6U3kA8b5H95U586dW1eSbeK0=; b=GKNdBDIHZ2Ja2n
	yngw9m8LXjduuSEPqbGlOgtEFjQsdbKl5hvcT42rKq0lFtnPdEksQY1HqUfzj/2IP26awrvcw9ses
	XnPF4x3dnaoIgZ/hGz1oim9bScqH6tTIZNilICqPvRMRqLj+XslwVAPxedhvY4hUyQxkAGbF/oEOS
	nVkIoDVTf3jbWOd8R2CbUcG1XmfpB4iFRfB3F4xVKjrgiA+NKL43ZMeANjnZVBDysjl4lQRaf8GbZ
	OEvu0L1JqoA7AE7pWi2TCqpRL0k408itFnyhkHoVdckrT/t+rsiFyBV0xPJD7PcT1eJjf8QrjyWe6
	gm60YkdW1XX7VLWmkrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkfGs-0000000DLbi-2PtM;
	Thu, 14 Mar 2024 07:12:58 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkfGp-0000000DLas-1ZWV
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 07:12:57 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-513c53ed3d8so918242e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 00:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710400372; x=1711005172; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3NVA96cL/X1I7WqZvh883rB2R1562Xmgvbo2h1NKsxc=;
        b=IHgDSUlzEG1SvxPwncg3uNhMTfSesA8PmdWCXtNppBpzGEDSYIUh7rdepJWnhuEocw
         CwSMlM05WOa79jNIv1gj4ot8tPmjz5NLFUPOMgNb0xeUfqiY3WVe31PvgARKS+IacQyb
         JrgSJhe8UJv6ljzQJ/0UPxbf7iLdA0tQ7vR7olul45/nYScAoYyh0hthfFA4YRqNZ1+f
         Fti6G/0SnLWZhP2e66q0Qe0EtXXve7qQJ3Trrle9oVJV0mub7ESog45f+oTBlmPvp6PD
         peWw+gNOjcZKGztsA+cAKAnSdw480ERzOPetcrjo2CbwzoWwZY4F+pv3gDWgt/+TzS9y
         yqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710400372; x=1711005172;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3NVA96cL/X1I7WqZvh883rB2R1562Xmgvbo2h1NKsxc=;
        b=d61anU7g5IjqovsHf8yQQmESXOBV/jEoIoArRd+SZDxuZjrrH94jJwJoqHMMC43tTh
         R/FBC80bdSwqTXkyUdY1KUcc2dDXjzbAE2oL2lhJe/hDR4lTQ5su2ewIpupj901VCQIg
         LE2WCmx6bc63lfFC0Mx82J1kiuRaBnkgtt1w4PYd5EUh0NWFl7z0uUjpWGSiGvlD02Ev
         3//Jl/PWXN6RXOvn36amwP2QKzKzhqqrUCn+fyHMP5zMSME4aUOj6czTCMmL9/FLNlHA
         vZtO6WEoIApnPYmbLvQjC/1pgBv+EfHjcWZGRoX2KPID3w4agUF6B6MvXJ8SxN3WMnrA
         lbkw==
X-Gm-Message-State: AOJu0Yws+2mee6S1AtXIvFfl/fRK7/e1zOOM1H31GMajKehUUniWlTTz
	7gyopGE41PajJ1ZK3nQN6IbQ4wayxxsXznHnNmlbvmuzziQI4x7cbL0y3ad+v7arUAoHSEe7M8w
	5ZT0oxu3mSGjb+HzyYJ1/peGfeKwMcMjAYY8=
X-Google-Smtp-Source: AGHT+IEjO0Hyfm1GpeQqIONHtbOGa0mptX9W3GQy+Ipj2qrV4B6RTZ/CC8T3ekSQf5mvanAUzJbVm4HTTSvON2LyJH4=
X-Received: by 2002:a05:6512:3e1e:b0:513:4fb4:5388 with SMTP id
 i30-20020a0565123e1e00b005134fb45388mr670738lfv.41.1710400371789; Thu, 14 Mar
 2024 00:12:51 -0700 (PDT)
MIME-Version: 1.0
From: Eva Kurchatova <nyandarknessgirl@gmail.com>
Date: Thu, 14 Mar 2024 09:12:40 +0200
Message-ID: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
Subject: Boot hang with SiFive PLIC when routing I2C-HID level-triggered interrupts
To: linux-riscv <linux-riscv@lists.infradead.org>
Cc: bugs@lists.linux.dev, linux-i2c@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_001255_439876_1B07E496 
X-CRM114-Status: GOOD (  14.37  )
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

If an I2C-HID controller level-triggered IRQ line is routed directly as
a PLIC IRQ, and we spam input early enough in kernel boot process
(Somewhere between initializing NET, ALSA subsystems and before
i2c-hid driver init), then there is a chance of kernel locking up
completely and not going any further.

There are no kernel messages printed with all the IRQ, task hang
debugging enabled - other than (sometimes) it reports sched RT
throttling after a few seconds. Basic timer interrupt handling is
intact - fbdev tty cursor is still blinking.

It appears that in such a case the I2C-HID IRQ line is raised; PLIC
notifies the (single) boot system hart, kernel claims the IRQ and
immediately completes it by writing to CLAIM/COMPLETE register.
No access to the I2C controller (OpenCores) or I2C-HID registers
is made, so the HID report is never consumed and IRQ line stays
raised forever. The kernel endlessly claims & completes IRQs
without doing any work with the device. It doesn't always end up this
way; sometimes boot process completes and there are no signs of
interrupt storm or stuck IRQ processing afterwards.

There was a suspicion this has to do with SiFive PLIC being
not-so-explicit about level triggered interrupts. The research of this
issue led this way: There is another DT PLIC binding; a THead one,
and it has a flag `PLIC_QUIRK_EDGE_INTERRUPT` which allows
to define IRQ source behavior as 2-cells in DT; and has some other
changes to the logic (more on that below).
When attempting to mimic a THead PLIC in kernel DT, and rewriting
all DT interrupt sources to use 2-cell description, the hang ceases to
happen. Curious as to what are the kernel side implications of this,
I went to see what `PLIC_QUIRK_EDGE_INTERRUPT` actually does and
bit-by-bit disabled the actual differences this flag makes in the
driver logic.

This return path in irq-sifive-plic.c@223
(https://elixir.bootlin.com/linux/latest/source/drivers/irqchip/irq-sifive-plic.c#L223)
is only enabled for SiFive PLIC, but not for THead one. Removing
those 2 lines of code from the driver (whilst keeping the DT binding
properly reporting a SiFive PLIC) fixes the hang. I am not an expert
on the PLIC driver to debug further or determine what would be a
proper fix to this, but this probably gets more experienced devs
somewhere (I hope).

This is reproducible at least from Linux 6.4.1 to Linux 6.7.9 on RVVM;
Affects any hardware that would have SiFive PLIC + I2C-HID combination;
Most likely this is reproducible on QEMU as well if it had i2c-hid emulation,
or if we passthrough physical I2C-HID device & inject PLIC IRQs from
it's IRQ line.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
