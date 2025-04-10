Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A56C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 12:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=424IvHmOu+o+gYX2t39Sg+aj8BuMt6XRfR+jxz3v01s=; b=VrkFb1OxPbpd1+
	M9c0NvMz9rQ3nIDUqgcLu0zXHGC7eXHnkbrYKIlj8krgmyZbsnIAnbK9RxbW2j/vpwrlfREMKzeh7
	13ZOsgN6N4OP1lRyQDK59eTMH/ZUuLdCIFT4+HT73zUr6LHX4aLSvuHaRIDdbM0E0mon5T5yeBZHU
	JX6j1vvuHTcNjilHHWKqRzn/Wkde5wOLFQZEQjNdPXuvLR6OFMG3ugroJ6ezLwaBeForE2zXrOHXL
	BxZkhr7AEoSzdga54dTyHrfJ4XSTXEzzmY2ilmHmt1gLXXZffvh+qgpyichvhkpTjLSyD36wI9sPF
	yf2lBUf4qBYNc+K8FQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r5V-0000000AVYS-11Dl;
	Thu, 10 Apr 2025 12:32:57 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2r2a-0000000AV38-2aZ2
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 12:29:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso1225289a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744288195; x=1744892995; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W58zftoxA/h0euOQhznKhUitEEsPpASpF27ovwB6sRg=;
        b=Oz1Rdz+bGL77nzktCcOLF0yz8kv52jvtNjenSbNcXqN3eNb3BeeD6gokNLEeVbk12N
         VnDc/IZ4/ozsTC0PQyfFGOSax1TCWMeyS6ATRrES5/ecR8eBE217j6NQxvHWpQT2MnGQ
         J44lOwbWKY7PnPlQZKzcgjd02Be+j0e1wBXzsbNJliWnc/Wr6nI16Ay14/HKxvHI0KxZ
         /FUMTe1H9lBk6FY8fzuQX0tGY38376zk17xOREPyhGnBqrMsx4mxca0qeS5LLVZWopQG
         eba/5H5jcYfOu8aIsKck1CYz/S5yC+b1A7fCg7joVlZpX0lEiecIT4+SXGG9Vp3jIefc
         7lRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288195; x=1744892995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W58zftoxA/h0euOQhznKhUitEEsPpASpF27ovwB6sRg=;
        b=TXWAReUAFCQ1jMRo56WjMIgnTiQbMXgT9c9WpijgJc/4J8OnpxmQA0BhTnzzngrSbP
         7G5gm8LQJh6yW9Mx6zoqjKg7XLyB+Ak5Fvg/Do/b72RV+x8RUzwCm58DgWfepchPqjfF
         A4Ie1Vi/y5s6XE0fz8Tg/PQTC6ILc9E/mIHPDoPEGSd0KvlWzkrfdDQq8Gnlt/wFrbH3
         Am8yxsSpO80CEoI0835ZzB/lNux2nfBF+XNBwRgAuJXnt7ARhEkIhEMF6V2w7TpD4E/T
         xzJyKPMxjBvQybiVqW1NCR6ia9Rr3PVeo1PjLISZOAbTB7MheeSctk0py3rawA4US7YM
         LXwA==
X-Forwarded-Encrypted: i=1; AJvYcCXBqvMaxaIh9aaZryFeIU6WSSqzGxs3XVtxKasHmKPbDi3tTcII3LEYHfLR2/0eEvq3T0v2RKiT0IgiVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1em7yrU1aekl2IDEQeNRZOrAC7Zpc1kDX8I6vt3OMFBI9bk+h
	FbZgXb8tLVihe9O/n3Gb3kz7Bd1zKHaCuQE0n8YvlO4724jfYIPiUhhEO6lzsMA=
X-Gm-Gg: ASbGncv+85jTm39U1LOVXKmv7egNGC6BUD93AAmn9otO7UibWxWaz/+np16nfHYVkZI
	jGmrEkFhK75shjuA8bX2KBKA3p0O0XwC9BIRx8LYPFqUl4jf4JSNNCHxXSIoPjvWWO8bUTnTW+z
	MruXypKOnTLMEDlYjbV50P54FC59P0zf0yn7UJ2qqj01QVyzBdlfQjpO09CkOrFM8MDIXBveiOS
	Abc9iv54TbEb+oghQkBr1F0mUv3PDMfqaIRZowkBT0pqIhJrMDALTIJRw27YDKM/fgioe6URITU
	ByfRDCIbPf1WL0Adyio5iBgMDfgBvq51jvvRPCauTwk=
X-Google-Smtp-Source: AGHT+IGkRcCdesVQfmGut/2T1Nf41hQW3Xy07xSRue+c6AyThON1gDnGuZ55vBm3LGdN2t2bjeOkNg==
X-Received: by 2002:a05:6402:5194:b0:5e5:4807:5441 with SMTP id 4fb4d7f45d1cf-5f329337b8cmr2248387a12.30.1744288194931;
        Thu, 10 Apr 2025 05:29:54 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbd17646sm2295348a12.56.2025.04.10.05.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:29:54 -0700 (PDT)
Date: Thu, 10 Apr 2025 14:29:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Ryo Takakura <ryotkkr98@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, bigeasy@linutronix.de,
	conor.dooley@microchip.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, john.ogness@linutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	u.kleine-koenig@baylibre.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2] serial: sifive: Switch to nbcon console
Message-ID: <Z_e5rWcJKUh7eozw@pathway.suse.cz>
References: <20250405145915.493173-1-ryotkkr98@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250405145915.493173-1-ryotkkr98@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_052956_653412_140712FE 
X-CRM114-Status: GOOD (  10.25  )
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

On Sat 2025-04-05 23:59:15, Ryo Takakura wrote:
> Add the necessary callbacks(write_atomic, write_thread, device_lock
> and device_unlock) and CON_NBCON flag to switch the sifive console
> driver to perform as nbcon console.
> 
> Both ->write_atomic() and ->write_thread() will check for console
> ownership whenever they are accessing registers.
> 
> The ->device_lock()/unlock() will provide the additional serilization
> necessary for ->write_thread() which is called from dedicated printing
> thread.
> 
> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
> Reviewed-by: John Ogness <john.ogness@linutronix.de>

I do not have the hardware around so I could not test it.
But the code looks good. With the added comment (reported
by the robot):

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
