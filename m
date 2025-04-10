Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA98C369A8
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/SMHBWjrZDLgzIjwa18pBwae2V+Y2W9x5BcUvpc3oI=; b=V3JEHSXtYsnWOF
	xjBYs5L10IBScIA9sZA1MiiLofBBQLTezMWOIZ69K7jmAI8oLgt77XLX17KmabrCM1ht+/dTtTM8o
	9vK6L2IAhDalJE8G1xleXlWSAKhZB96gO2YXZ6vCy4idI+5ZuDTqUNtOpqJpmwH/KziL/J+9NB4R1
	0fizzRJTaSOeeJk7kerHEZ81Bqq7AsK+i3YiPmFWZKydSydodIqx1xSHIMQBhiXRCSN9LXo7bPzOT
	6GQXGF5YYjJ9EMU2mIjGdCePpy1vCRpLdkD+kii0Xr3DDBZ0u5c6KZ8pBkEM/+s3OJWdam4HyAYqx
	T/uhhtHWgNb2+6LXBL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sp5-0000000Apu7-2QCk;
	Thu, 10 Apr 2025 14:24:07 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2soB-0000000ApgD-2ICN
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 14:23:12 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso976450b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744294990; x=1744899790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1KzVOT+eZwRVkPvH/8cwKh4uQYPRiQGRGZVOEfjMOc=;
        b=A36haZZI+g3RoMlISLr3Ue00vjITRCzA63ng6GCN8x61ENE/CU/yr58C/BkcMqvpBo
         ynEkZCTgmyqxLpP0WCq7N+YohkMAaV5Qjf+Z+GJ81sAUiq3IfIeqzyVet/e60+cdg+ay
         jlHHS5bs+7i9350wX7p5r7OQwiDtF8hYHT1fM6Y6Q5Hn4FizATXgY/bI7GtnsaPR3bte
         auZuJfOQH+zDCw62zu3G0JUyHzrEEyhatqk1mkOl2cHQYpp88WAVR2i8dbbOS/Jd73US
         uV6V7vNCspGcWQy/MRyRiAYWOt356GZggxH96/Alr/zSdasR5ADXzXAdc03ZXcmXCwVS
         Jgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294990; x=1744899790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1KzVOT+eZwRVkPvH/8cwKh4uQYPRiQGRGZVOEfjMOc=;
        b=UedfoSO/lzGbRmlk7AaFOUSvudc21g4pS3IJVs4FicfK5uE7IaPR861jogrbHZlqWu
         OKnH8n8FRHs7Io6COp+G2RzKRAD/RCVOjPT3Y1IGTaMV3UbRf9tTRZUIsUpb9rQUlAmE
         wcYlFeZogObOzxZaJsWpIp4Nt/qHSaFX5sjhVBKr14YXRuhIXkEJCklrRHdYA31JgNSY
         fLTcbd2BdbMPD/Ql43QyavH0hzjICxj68FTNuBXk5TttLmQn0KHyVoepOgj5tSfIMlQj
         +UdCetPhSymI2rkPwjZWHbJI9TSxRzsYIx3rIoFue8iBVyRjf70EbyTjEJaruutNA722
         GZNw==
X-Forwarded-Encrypted: i=1; AJvYcCXogvIflQAt5L/t6gbKLYe1x2uqw+ImercEdy0fMKMJ7mnJYdWg3NXIFL5pWdmNekifUbSiFvmq7F08zA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCXyTSNQ5bE4R1EmKr5QntHPWUSpTH/LWuJdiq4YbkJpMnWGaj
	XbPGjiqsZWJCKP8OIwc7D+3/PHdBxEr2Ef5P7JJBHdnILjPF+bAy
X-Gm-Gg: ASbGncuPBDiz37bYcCE+fw/nvBLqmPCrRLNMKWXUDD7qnfc4/ilsadb9aW/KCaSUDb3
	2MpF0YekizVlqG3bHxgLgCQ0hdm6oBCOW/Lyc+qD8AKIGxiDggVZ7HcdnsSMX32wnwKDOO/VwoA
	hEt5mPooDk5YhFoeOnNZN7p5+q3c8AFK3Ts9bhob5C3h2ziLJVzST6PuD7ly6gYNoct2hd9H7uW
	8Xsm9LrLxYvr/6Y33cOQeimpo5TQsrAcJrIA24oyhKK0FoAJLDvF/8+8deTXH40nELjjYzlfRRl
	DZFIXb4GFP96AiFQvKF/YblTJRQZ0zva+WShtLmLJW8A7TB+LyO72ovx82MdWl7jshdwZwdhfro
	UaHof/jBvwxst7f1RgkyruROGyY5IDoUEG9HGWw==
X-Google-Smtp-Source: AGHT+IHYvKz4BNpqFgjqtK4NeKugSkNVTSb75ZAm5QQA7B1M0d8K2TV39Qrya9RbCeBmRX2vLXlgMA==
X-Received: by 2002:a05:6a21:3298:b0:1f5:709d:e0cb with SMTP id adf61e73a8af0-20169603e52mr4577828637.39.1744294990477;
        Thu, 10 Apr 2025 07:23:10 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a331b481sm3042268a12.75.2025.04.10.07.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:23:10 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: pmladek@suse.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	john.ogness@linutronix.de,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	ryotkkr98@gmail.com,
	samuel.holland@sifive.com,
	stable@vger.kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v2] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Thu, 10 Apr 2025 23:23:03 +0900
Message-Id: <20250410142303.5978-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z_erp2nLRKzLXuwF@pathway.suse.cz>
References: <Z_erp2nLRKzLXuwF@pathway.suse.cz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_072311_592268_F473DA31 
X-CRM114-Status: UNSURE (   8.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 10 Apr 2025 13:29:43 +0200, Petr Mladek wrote:
>On Sat 2025-04-05 23:53:54, Ryo Takakura wrote:
>> startup()/shutdown() callbacks access SIFIVE_SERIAL_IE_OFFS.
>> The register is also accessed from write() callback.
>> 
>> If console were printing and startup()/shutdown() callback
>> gets called, its access to the register could be overwritten.
>> 
>> Add port->lock to startup()/shutdown() callbacks to make sure
>> their access to SIFIVE_SERIAL_IE_OFFS is synchronized against
>> write() callback.
>> 
>> Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
>> Signed-off-by: Ryo Takakura <ryotkkr98@gmail.com>
>> Cc: stable@vger.kernel.org
>
>I do not have the hardware around so I could not test it.
>But the change make sense. It fixes a real race.
>And the code looks reasonable:
>
>Reviewed-by: Petr Mladek <pmladek@suse.com>

Thanks for reviewing this one as well!
I'll send v3 with your Reviewed-by.

Sincerely,
Ryo Takakura

>Best Regards,
>Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
