Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5440C35FFC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 11:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09OxJ1is2XKFqAOLaP4g2ugH7Nazzy6SZvs3J/BB2v4=; b=rImVYeuDwO2+VD
	p4Lm9AOPisYgSGn1wyAhJkDTG5yp5tgBoB0VQZRWGBjTCsiQvDef5xfPHcwUvvMG4btfJ2O21G8N4
	QdGyeLGgfNbZJKxAXlrzmM2wzjLJ/YVIg8bATimcOt84B9MHeLUYkLJbdu+sAFgPnKLGJPkP6OAX1
	WDCNNobq+Nh2DVBBH6bAy8F+6jg0QcgymSrKyvGrxG8aEmZNMgb8iVLc4bMZXBXEGpE4+HtjwHOUE
	L7c1RI4AMNwJ5/QE84R9crQP3RCZdybDSkLbGkqnTbKyXjXC1zr64bmcjf2eqYM0RNuXqzQE62gEA
	NYYIFE5ee9um2/cZ2Hzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx21z-00000005ZTw-3Rbv;
	Tue, 25 Mar 2025 11:01:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx21x-00000005ZTJ-1x4f
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 11:01:14 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-22423adf751so99629035ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742900472; x=1743505272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFQjpijP51sT2xR77PHLhJDe/bbbSDnZKMZrsva8hbs=;
        b=XGNTN+SHg6nHUj+GXJCS/9YwOAB8H3A3ccP7+Trdjo/+fEwem55hEn+udTowGpUkb9
         eLDTVlERgWCzkVAj25wqoMEfWVp9e/MedQbaOSe3OtiKgn2joN5V0kXmxVRLOV2b6u9l
         PhDBNSOTXHNTIdnv95qkTB0YO0iRsvwOjmHwi82SVjw70MXPBNyi13HMui6MNZy8z06f
         jD8tTUrnslj52ARQuOfnmSDSdu5qsEboJm9e1SByWv49PavIP6VClxSmAsia61L2vk+V
         AdKeAvLGAs9/NiqPPkPGm0ICjbZB3nRIdhIv1hZNm8dhlfTfvtB0qAq+u0cZwT05DGV9
         G2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900472; x=1743505272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFQjpijP51sT2xR77PHLhJDe/bbbSDnZKMZrsva8hbs=;
        b=uPkWMD5HPhU0L0Hgmy0SxE/jeGeH04kDvYi8eFXSmsCzXpcPO96TwviKVgbjNblYw7
         cc/72ss2RkgEO/G25FtjnWD9tw5OwYrBEJk/E/Z9pwJxcwsoeOUoiUd/uj8sSzDWT0wb
         I8ZkkJksPNO3t3ExZ9jPnPmhai3mO/Vo7mo4Vq6AA6h0ZOuC5NgKePa81p77G8UY4/tW
         e1EDlyafXueL9GbkJciHoW02ll68/+SLdz9qHzyyANskb6eor5H6rlAi6l5AzL6bmreR
         sONhQZw8RCj1HuTTlnYiykhREB4pqHClkb7KkFYyH95mw29XCbI+pTo0P1XjF36I3Z23
         ETMw==
X-Forwarded-Encrypted: i=1; AJvYcCVjimFwu040hRkyzOAyRVV8A3HQqvJLPPrtEN9a/CO1gMmiZ/idr51TWQqt10mRTYhnVPcs8Y1CHGIFaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ctvWew3WiZCGqt3z759L2J3dAs7l7npc1XmtJdF82Ym/kw1a
	ufopq8CYspzi19TarPDkl6hdWbHuN1kKImn2MDAOoSxc5pGOLEJj
X-Gm-Gg: ASbGnctsIklkq1NHx8w2e0x/8+8d9rqve5VnXOEInhFbKOQBInnToRANWNuq6unyFIC
	oxFRJwABnMB+iVUrGZHq+RDtM5hOCJc8W3gsEPFFX4+oPqT0+1Vx5znmdLMGEf+WXVuihvvsIP2
	lk73OyqrL6Os4sZ9TpoYaZ7LChHgD2C/Xf59cU9bxICxbAK2Q7r3R8BTcdMUw0ZS6NHdzPdA5fE
	R6TaliX/4Qznu/O2ixiCRtF6JckQHgDMB2IZ1gtUseMGylAUVqfE4JMtpleWYJJb4I7jHSSJ9f9
	HUNeCWzCGzqQp0ptCpsVMGL44ltnf9WbzKxT+hJLdUjPrARb6ywTsug5SU2+fCZVUGU5qgQdXzk
	5dJ1w0QuGkrloQIIOenme/GVUsg==
X-Google-Smtp-Source: AGHT+IE/9aU5DXDSbNLr6CpVc3OhmADZ8TZGgoBnPhuMD9l4jDbW2fGVkGfWJrE5J2PwPPFItN+9FQ==
X-Received: by 2002:a05:6a20:2585:b0:1f5:7eb5:72c7 with SMTP id adf61e73a8af0-1fe4300f7d1mr26494791637.29.1742900471815;
        Tue, 25 Mar 2025 04:01:11 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.local.valinux.co.jp (vagw.valinux.co.jp. [210.128.90.14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a27d9a13sm8842971a12.6.2025.03.25.04.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:01:11 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: john.ogness@linutronix.de
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com,
	samuel.holland@sifive.com
Subject: Re: [PATCH] serial: sifive: Switch to nbcon console
Date: Tue, 25 Mar 2025 20:01:07 +0900
Message-Id: <20250325110107.28570-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <84sen2fo4b.fsf@jogness.linutronix.de>
References: <84sen2fo4b.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_040113_504916_09DA4FCB 
X-CRM114-Status: GOOD (  18.30  )
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

Hi John,

On Mon, 24 Mar 2025 16:30:20 +0106, John Ogness wrote:
>On 2025-03-23, Ryo Takakura <ryotkkr98@gmail.com> wrote:
>> Add the necessary callbacks(write_atomic, write_thread, device_lock
>> and device_unlock) and CON_NBCON flag to switch the sifive console
>> driver to perform as nbcon console.
>>
>> Both ->write_atomic() and ->write_thread() will check for console
>> ownership whenever they are accessing registers.
>>
>> The ->device_lock()/unlock() will provide the additional serilization
>> necessary for ->write_thread() which is called from dedicated printing
>> thread.
>>
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>
>This driver has the same issue that the 8250 previously had. The
>->startup() and ->shutdown() callbacks are called without the port
>lock. However, the sifive driver is accessing SIFIVE_SERIAL_IE_OFFS in
>these callbacks and this register is also accessed by the ->write()
>callback. This needs to be synchronized.

I see. Thanks for pointing out.
(I didn't know about console_on_rootfs() and what it does. Interesting!)

>The related 8250 patches fixing this are startup [0] and shutdown [1]. I
>am assuming the following change would be sufficient:
>
>diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
>index d032de6199af..1de1b2a5833d 100644
>--- a/drivers/tty/serial/sifive.c
>+++ b/drivers/tty/serial/sifive.c
>@@ -564,8 +564,11 @@ static void sifive_serial_break_ctl(struct uart_port *port, int break_state)
> static int sifive_serial_startup(struct uart_port *port)
> {
>       struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
>+      unsigned long flags;
>
>+      uart_port_lock_irqsave(&ssp->port, &flags);
>       __ssp_enable_rxwm(ssp);
>+      uart_port_unlock_irqrestore(&ssp->port, flags);
>
>       return 0;
> }
>@@ -573,9 +576,12 @@ static int sifive_serial_startup(struct uart_port *port)
> static void sifive_serial_shutdown(struct uart_port *port)
> {
>       struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
>+      unsigned long flags;
>
>+      uart_port_lock_irqsave(&ssp->port, &flags);
>       __ssp_disable_rxwm(ssp);
>       __ssp_disable_txwm(ssp);
>+      uart_port_unlock_irqrestore(&ssp->port, flags);
> }
>
> /**
>
>The fix should be applied first (and likely Cc stable) since it is
>fixing an existing mainline problem.

Ok, I will add a patch in the next version and cc stable.

>Your patch also needs the synchronization. The ->write_atomic() callback
>does not use the port lock. However, the uart_port_*() functions also
>take the nbcon console ownership, so they synchronize against
>->write_atomic() callbacks.

I see, nice!

>Otherwise, this patch looks good. If the ->startup() and ->shutdown()
>callbacks are fixed in a previous patch, feel free to add:
>
>Reviewed-by: John Ogness <john.ogness@linutronix.de>
>
>to this patch.

I'll add in the next verison.
Thanks for reviewing!

Sincerely,
Ryo Takakura

>John Ogness
>
>[0] https://lore.kernel.org/lkml/20230525093159.223817-2-john.ogness@linutronix.de
>[1] https://lore.kernel.org/lkml/20230525093159.223817-9-john.ogness@linutronix.de

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
