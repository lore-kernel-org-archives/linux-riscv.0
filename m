Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C67EC36008
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 01:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y94STdBcXdkkj8f2eqWrAaqhqqPq9od47APU6GC20hU=; b=4VBOXE5wd2n0se
	nlYgWk6dDu7MgkAJUfAwGPSTAiA0LZ51In0v7qKVTgSVWVeGxuEvKRY71PzLkqqhuhS7xbQGhD1X1
	5LXR91SKL9yGNj+Z53H/LF9/WxQan7Fm6hwRyQxvf4CIRSXAnzBtSTvqoaWGlDGmmtSkxEhxuOlOe
	qCWMl14UgxFqI4cksJ9fVNmUoRJlAHysywPdCTYhlCHAr1NxMCl2rng+cSsoEUYu7qNU8ZgrYImI1
	FfNO7LAnRkojaZzDylIyBXB1r3Pbq0eNfHSNmuGnJMRkI3TcrObYwL2cRVdQ17g7GBx5LmjzIfk6I
	lESmg62UFKAyu67pvu7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyhIQ-0000000FhSe-2tYC;
	Sun, 30 Mar 2025 01:17:06 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyhIO-0000000FhSJ-0cvq
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 01:17:05 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-227914acd20so68577135ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 29 Mar 2025 18:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743297423; x=1743902223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovcY3FlJhLAlcHfJCYvAAuLol4KahlQ6od7r+edeYnQ=;
        b=FwEYOqzIK+eALsRFI5UiCgraPPJ1bkZEWOOsMfrQsLdpkhn35+riZ+1NiR2Rlz+MJD
         3HFw8ZVmqIvbC2YyMrTMLuJIE7Mp/gGMklGOlL9/hhnJAmVWVWw5moJ3TsQeWEX1fTLp
         KkreivrSlci+eX/nKdEl0EWlAad49hZTYzR3BhR5xe6BzgfOU+Mqaf9ToTRfUrIMH0PQ
         JZkz/MdHHxDQi+tDbfT/hfkykaTdWHeH5NLCpVRucQlMMFGS/A+bJV44UZpeCGod7q+U
         /XyiArg94sfhuOwnaqxE9Z2Q9hm6tu+txhKiVRyS3ovOQwOUNW6wMRE9/+2zwMYkQj5D
         YHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743297423; x=1743902223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovcY3FlJhLAlcHfJCYvAAuLol4KahlQ6od7r+edeYnQ=;
        b=vSYKf8vbi6UCJlK0xey5PV41i/1kWpIdsAfDJzt5SD71Ib3BDcXFW/MMyLKgf9XTeJ
         g6Lb0+SQjWmOURW1Mg93896UDxUC1k6GfL4yn4h0jDMmT8FDFqetIkRJM3ql71YgXGdd
         L7TP3yzJZswhQQ6vV4o22deRr/j9uG81w29UPE5jw1XcoEUGsV62Js/n5z1bgkuNr9x0
         QQ90dM0uhgkefouJDK6I6X6MWljUsmu6Z4vUU4ZiJLz9aYPf39AR4r/fPe1uUuBdH5Ae
         UdlGqIzVz/IP8OWF8biNo8HAtHynfcgiyQr133kKvsqqkjP90PSks+f43IKoRckyr1tp
         uobA==
X-Forwarded-Encrypted: i=1; AJvYcCU6+t6a+4xb5hLwlsVxCEht45ucEzwmEQvfgocMMIhmeHtlylSDzwXihQdIrturfRPRP8RaBdiSnj4/5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwbkeoKMICUB4q8a66s1bLnKHqvFJkenMlvroDUqJFiccYGhXu
	iNMzj/ts778iFQ4oj9inus12TTC/d2TfLKNttdeRdu73LSOhk6zN
X-Gm-Gg: ASbGncukqcC8HohIBWv1y8cAMdZlVe3aYasmTH8818tOZmj/ZvXSdT+8L1T4lnqcNLT
	QfhGMAwG7DZj7V7C72fREnv78Pzy1sWYuLRC4Q+WLjvCsm5DLsvpSZO9vPkraQF81XmkQz6vD2Y
	SWsnShUGojniXRB3LEwMJOf9xETSA2BYmJ4meFgaWdM4apWBlcAhUwhkRwCl4EmdVX93bpDoKas
	MJ30JihM9mL6jBSjSIpAudmL3lcatSutq+af/zTx4A2DMiLHRSsOWBomUJi0M00nDf1qYcvt2/7
	ZKWIvNWDoJx8PoOgJJQl1xzcpTC2SrDuJNrJH1h55auQsNafyzmbjBXtQK4cgHACbdp0TgPEV72
	RQrIBtbuY5bGl6/v5Ow7UjafBOpZuWjw=
X-Google-Smtp-Source: AGHT+IExY0Kwk0LiQcVFg3q5/x15pk5JiYTn786iSOPSIwCtGaKXfANA/cjX9M8xUqFQ2DVybK8rug==
X-Received: by 2002:a17:902:e5cd:b0:225:abd2:5e5a with SMTP id d9443c01a7336-22921c7af8dmr108875945ad.4.1743297423271;
        Sat, 29 Mar 2025 18:17:03 -0700 (PDT)
Received: from localhost.localdomain (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee210csm43496455ad.70.2025.03.29.18.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 18:17:02 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	samuel.holland@sifive.com,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	u.kleine-koenig@baylibre.com,
	lkp@intel.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	stable@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	Ryo Takakura <ryotkkr98@gmail.com>
Subject: Re: [PATCH v2 1/2] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Sun, 30 Mar 2025 10:16:10 +0900
Message-Id: <20250330011610.388077-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z-iSb0ryR-tiUCj0@42be267012b8>
References: <Z-iSb0ryR-tiUCj0@42be267012b8>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_181704_187246_C4E55A5A 
X-CRM114-Status: GOOD (  11.91  )
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

startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
The register is also accessed from write() callback.

If console were printing and startup()/shutdown() callback
gets called, its access to the register could be overwritten.

Add port->lock to startup()/shutdown() callbacks to make sure
their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
write() callback.

Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
Cc: stable@vger.kernel.org
---

Hi,

I'm sorry that I wasn't aware of how Cc stable should be done. 

I added Cc for stable but please tell me if this patch should be
resent or if there is any that is missing.

Sincerely,
Ryo Takakura

---
 drivers/tty/serial/sifive.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 5904a2d4c..054a8e630 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -563,8 +563,11 @@ static void sifive_serial_break_ctl(struct uart_port *port, int break_state)
 static int sifive_serial_startup(struct uart_port *port)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(&ssp->port, &flags);
 	__ssp_enable_rxwm(ssp);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 
 	return 0;
 }
@@ -572,9 +575,12 @@ static int sifive_serial_startup(struct uart_port *port)
 static void sifive_serial_shutdown(struct uart_port *port)
 {
 	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
+	unsigned long flags;
 
+	uart_port_lock_irqsave(&ssp->port, &flags);
 	__ssp_disable_rxwm(ssp);
 	__ssp_disable_txwm(ssp);
+	uart_port_unlock_irqrestore(&ssp->port, flags);
 }
 
 /**
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
