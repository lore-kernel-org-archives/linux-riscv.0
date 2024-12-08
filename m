Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EA2E77173
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Dec 2024 20:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5DAMH2zYLWoLBIHOs67fYD6+ILAV52zlenrflgj7PM=; b=QLYOcveNJaCTGH
	0/9lQNm9LRA4XnEJd1BMhr+iL4FCtKU3abvRY2BBvXmhzblulwPojcrYHjrNNPgYPYnrbPdOpc4cA
	YgPtlk0TaCV7n7MDN8lLL9G6EG4Tw4wKUHd3LbI629UMSb8gmZF/Zv1G4V+yTAEqOsXtnW8ktA69L
	Ibhm2JJrHnmBeue4fW6P2eYe2Vx9EGnTSnIH2eN8Zg04WXHeaevWZXYZ39UerLDZ4FIfkIs5QF8OQ
	H53foM+DwKp0Qk/uD2Cdw3So7C39ddWZ2Ltg/iwBSr7hyqF2fdD+CjZ+0jQVHVGS8kr6MIP9FDOBQ
	EyEKYs5OYmnNnp8B3ZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKNhE-00000005n71-32A5;
	Sun, 08 Dec 2024 20:16:04 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKNgB-00000005n1y-4AFZ;
	Sun, 08 Dec 2024 20:15:01 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733688896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAEQztHm1MhKPD8YoJhLpgLMiVgRYQF2dVu0Kq/kagg=;
	b=f8+TC7GyPwKR+f0lNsaBVoKKD3KlCaZGtfTGZ+3xwWqaVF45nfsC1HIZlmeTvWrT9RLL97
	xRy/+BFSDZGpDwbgceTdv5tfi90TM590x/d/hGSd9Wc1RfODLrWOG2S1QOeKhsozKVXaUN
	dVPoWsZ+/VbVkHdT098l2Kvqmj46hWWcnO4+lfzCSWZfY8QgHl2aArbP27wysqMxcdlYoV
	NCoZMmx1955V+/gJ3pbWJflcknE5ihyTUfqFzn5QuJSCkMUxaaT2W91ylhj5ysGSjZzZBQ
	TKi0DMX2rGJfKza8G/8fnXyAgybAPZCHLv0JdDBf8ZxIYouwy4CfUqKIfQ2stw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733688896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wAEQztHm1MhKPD8YoJhLpgLMiVgRYQF2dVu0Kq/kagg=;
	b=H49E2SmjbwoTLq8t13TzNFlyjC9Jw5sOC9pE3IqaR0CyOkweHNA006NzU0lJDqMxvtF1VA
	1GJ4HGda++cvRGBw==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
In-Reply-To: <20241208150711.297624-2-apatel@ventanamicro.com>
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com>
Date: Sun, 08 Dec 2024 21:14:55 +0100
Message-ID: <875xnuq6dc.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_121500_170546_527A25F6 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 08 2024 at 20:37, Anup Patel wrote:
> +
> +			tvec = vec->local_id == mvec->local_id ?
> +			       NULL : &lpriv->vectors[mvec->local_id];
> +			if (tvec && __imsic_id_read_clear_pending(tvec->local_id)) {

As I told you before:

I don't see a way how that can work remote with the IMSIC either even if
you can easily access the pending state of the remote CPU:

CPU0                            CPU1                   Device
set_affinity()
  write_msg(tmp)
    write(addr); // CPU1
    write(data); // vector 0x20
							raise IRQ (CPU1, vector 0x20)
				handle vector 0x20
				(other device)

    check_pending(CPU1, 0x20) == false -> Interrupt is lost

There is no guarantee that set_affinity() runs on the original target
CPU (CPU 1). Your scheme only works, when CPU1 vector 0x20 is not used
by some other device. If it's used, you lost as CPU1 will consume the
vector and your pending check is not seeing anything.

x86 ensures CPU locality by deferring the affinity move to the next
device interrupt on the original target CPU (CPU1 in the above
example). See CONFIG_GENERIC_IRQ_PENDING.

The interrupt domains which are not affected (remap) set the
IRQ_MOVE_PCNTXT flag to avoid that dance and don't use that affinity
setter code path at all.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
