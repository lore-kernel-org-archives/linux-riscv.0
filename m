Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A3DC54E60
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Mar 2024 22:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0AdhmAqvS2nteJj5Uc8idWLrP9PLc1w23HFDguZDjM=; b=ZZWEqbIbXED7mn
	Uved563M5UlGDrg3g9v3iG0iHkpOy5+0bLULqPKyBD8GBGOqwmc5TV5vkHL15a5un1xpILhc8wdil
	5SEFM8z26KVSUq1k9/JXyVhTkMAXL4wdLh+m8wE/qm6lkf4a9RVmO+kMhPouWuR19iEYibcWQpvxI
	/Pab8pcLNmmtyIzn6di59xdRq4T5bpNBYSU8LJgNxDk33j3HwXzBlpm1CN9dYYfeGoElVw1wbjvZa
	iTwCRIAi++ozvggaGuNSvAtbFeBQI7dVQhFKZjjj9g9uGGYxvog9da6aNBTUyC06byjE2ra1LiAv/
	mCHdKQ6RzixvlY/+UBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlz1j-00000006eFJ-0T3e;
	Sun, 17 Mar 2024 22:30:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rly2R-00000006V9A-1TQx
	for linux-riscv@lists.infradead.org;
	Sun, 17 Mar 2024 21:27:49 +0000
Date: Sun, 17 Mar 2024 22:27:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710710841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3srrq43UiauzyNmV0S4k/pQ0+n44cbViGcHlmEyhFec=;
	b=1fNVmtkODQCyt/lLuw8N+h0zm9GlRxTrwdCdxVYqb0U61pUF+sSwuEpypKO9P5v6SxPboT
	F/UM87VVCz4tp1gxAH+xHT9mxvwzX/bw1BiLnk1tX+fl6FQ8UGe1hH3YJaR2vZIEBAuj2h
	ej6eAmtwLZr31q/Aq7Nz7rJDI5EdONmSNSdVXhZnQDbvXa4r+5/TIh5A1F0yo+aNX1+7xe
	HWqK59rrfupWFrxBGbVA3mUhrks5kaGIEpEAdTqoAzofwv5NbVQFuS4tejEyTTKkDn3Nqq
	ilemSoMXJBAPOsCMWEj3CN+0sPjuWnkv+5PbUet5upLzYFVXbN+JORTcIyi8QQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710710841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3srrq43UiauzyNmV0S4k/pQ0+n44cbViGcHlmEyhFec=;
	b=SylwjTSsGZaa+c23HhGRyB4sQnKHpj5LUrtHGIBxrFtqZWnK0ugZz2u31upBqdXswNlDOi
	Z9nDIgvsqHsLJmCg==
From: Nam Cao <namcao@linutronix.de>
To: Eva Kurchatova <nyandarknessgirl@gmail.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, bugs@lists.linux.dev,
 linux-i2c@vger.kernel.org, jikos@kernel.org, benjamin.tissoires@redhat.com,
 dianders@chromium.org, mripard@kernel.org, johan+linaro@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Boot hang with SiFive PLIC when routing I2C-HID level-triggered
 interrupts
Message-ID: <20240317222718.3e03edb1@namcao>
In-Reply-To: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
References: <CA+eeCSPUDpUg76ZO8dszSbAGn+UHjcyv8F1J-CUPVARAzEtW9w@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_142727_618551_19CBA1FA 
X-CRM114-Status: GOOD (  21.14  )
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

Cc: HID folks

On 14/Mar/2024 Eva Kurchatova wrote:
> If an I2C-HID controller level-triggered IRQ line is routed directly as
> a PLIC IRQ, and we spam input early enough in kernel boot process
> (Somewhere between initializing NET, ALSA subsystems and before
> i2c-hid driver init), then there is a chance of kernel locking up
> completely and not going any further.
> 
> There are no kernel messages printed with all the IRQ, task hang
> debugging enabled - other than (sometimes) it reports sched RT
> throttling after a few seconds. Basic timer interrupt handling is
> intact - fbdev tty cursor is still blinking.
> 
> It appears that in such a case the I2C-HID IRQ line is raised; PLIC
> notifies the (single) boot system hart, kernel claims the IRQ and
> immediately completes it by writing to CLAIM/COMPLETE register.
> No access to the I2C controller (OpenCores) or I2C-HID registers
> is made, so the HID report is never consumed and IRQ line stays
> raised forever. The kernel endlessly claims & completes IRQs
> without doing any work with the device. It doesn't always end up this
> way; sometimes boot process completes and there are no signs of
> interrupt storm or stuck IRQ processing afterwards.

It seems I2C HID's interrupt handler (i2c_hid_irq) returns immediately if
I2C_HID_READ_PENDING is set. This flag is supposed to be cleared in
i2c_hid_xfer(), but since the (threaded) interrupt handler runs at higher
priority, the flag is never cleared. So we have a lock-up: interrupt
handler won't do anything unless the flag is cleared, but the clearing of
this flag is done in a lower priority task which never gets scheduled while
the interrupt handler is active.

There is RT throttling to prevent RT tasks from locking up the system like
this. I don't know much about scheduling stuffs, so I am not really sure
why RT throttling does not work. I think because RT throttling triggers
when RT tasks take too much CPU time, but in this case hard interrupt
handlers take lots of CPU time too (~50% according to my measurement), so
RT throttling doesn't trigger often enough (in this case, it triggers once
and never again). Again, I don't know much about scheduler so I may be
talking nonsense here.

The flag I2C_HID_READ_PENDING seems to be used to make sure that only 1
I2C operation can happen at a time. But this seems pointless, because I2C
subsystem already takes care of this. So I think we can just remove it.

Can you give the below patch a try?

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 2735cd585af0..799ad0ef9c4a 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -64,7 +64,6 @@
 /* flags */
 #define I2C_HID_STARTED		0
 #define I2C_HID_RESET_PENDING	1
-#define I2C_HID_READ_PENDING	2
 
 #define I2C_HID_PWR_ON		0x00
 #define I2C_HID_PWR_SLEEP	0x01
@@ -190,15 +189,10 @@ static int i2c_hid_xfer(struct i2c_hid *ihid,
 		msgs[n].len = recv_len;
 		msgs[n].buf = recv_buf;
 		n++;
-
-		set_bit(I2C_HID_READ_PENDING, &ihid->flags);
 	}
 
 	ret = i2c_transfer(client->adapter, msgs, n);
 
-	if (recv_len)
-		clear_bit(I2C_HID_READ_PENDING, &ihid->flags);
-
 	if (ret != n)
 		return ret < 0 ? ret : -EIO;
 
@@ -566,9 +560,6 @@ static irqreturn_t i2c_hid_irq(int irq, void *dev_id)
 {
 	struct i2c_hid *ihid = dev_id;
 
-	if (test_bit(I2C_HID_READ_PENDING, &ihid->flags))
-		return IRQ_HANDLED;
-
 	i2c_hid_get_input(ihid);
 
 	return IRQ_HANDLED;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
