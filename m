Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD583C369AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Apr 2025 11:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UjUDNjp08HAbD2zu58OI4Ps6Xww1R30cbP/brTdoGIw=; b=G9YyCDC+BDubzf
	wumzF/Dl5VEAgVnUzWmrFFt2jGYxJw3JiYsiOeOxB9fschRjLeFEZR8CRU/YICwP0hAe03/MY9v51
	8cZDE4yC1PhqrO7+q91Fa7daLZehMz4J8Lms0/N8xzdI8uCaqhB/tKbUAR8w8iuGFmxqQYf3KJxq6
	UBNLBPzHyhhSylPBdDgh2m22elgOSFsqD0UD3VCHrA+NZ/7Kytnkp9SgHIiNBOR/zeloHdrzFJc0L
	E/hMWY6xGfKBKr6PsO1DySNFQSz/87PBMdllxgQaX62p7dHG4/DeBg+MaQBLO+AddIEJuWCE9fVXw
	n4qligR9Tusr1f7oxBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eUM-00000005Y14-3Xu2;
	Tue, 15 Apr 2025 11:30:02 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dmq-00000005O1G-2bcY
	for linux-riscv@lists.infradead.org;
	Tue, 15 Apr 2025 10:45:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-227c7e57da2so46773215ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Apr 2025 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744713903; x=1745318703; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzAtTYxauZXqLEN7iyAxb1gJsZE7OLBERKWDjqBjIAk=;
        b=hJsJFRDGHm56yjcPCXcvD3lpISsXZT6v3cavy5H5VRz9vtkZcpeHeNUyS9flGpX98E
         7b2IGA4ALq8f9sR0ORcZNaHLG4//BaFQypqSDBdzlH5ntxgw9xzfUfSkUZg9whXigIvG
         /PWSL2Mi956VDMIVbxvOCn4xQIxNyKNZziSREEA+dzGHwvb7Ml7OnoCKnW72yRCL2Wx9
         fLI/iWiSMhHfiIEghXLNooqyJobQrg5N0VJ71c+2q25FYIM6EmiJDw+jeyasUV8a3I+r
         6qD1CJxfitM6Up4sm0Y9D/3spR5/eTYp3M9nliLtH/pxX+PFVIDwkGeZBYtOlqBphHOh
         bWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713903; x=1745318703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzAtTYxauZXqLEN7iyAxb1gJsZE7OLBERKWDjqBjIAk=;
        b=dIfFksBZSRlrdOXpE1pgttdV0e/Y/uum1PCQ1YYD3IqrJsiST/BOE53bxiSBMh0TY8
         QGQMz5Hi3pnQsjj4PR/xMJ/pTIapFn2goXm3/AsUMi3RHvxN4HiD0B1M+7CgPGSXfgIB
         pEuFX2VX8hZzxnhCqvhEmQt3tN9QQ/WeGu49FxwWrhnLwdBEaeNhHFTTJ3m/qz79nixG
         kWUFryX32+Em0ujc4og4AWCMVcnzZTBENJ+ip6fAiq/4wDS/fosKf6EwC69UCC09WemH
         aJqDlVyMK07Zu+K+tzg82llqK/IXQD9UJMFgqmhgroFKwQsP/7lQn3u1JS1J59OoZEeO
         5uBg==
X-Forwarded-Encrypted: i=1; AJvYcCXoo5yQR07n1UQQO4IY9gV6q9fYfk4sS31gB8wX0VQ/VbvQNUyV9TfjcXt59W/AnWu45bK1U9Se7w6YqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtSVBuJby8Nz54PPr3MOS2p91ADBlkbv4paJceDSVLeWAUk+gm
	C7pczT9unpB/cluMacVQl6ubk1LeqNyj3+iBrYPXo4RWaVzEeJ1H
X-Gm-Gg: ASbGncsRt32zg2kB5Z2cl+Ti1PjoYCp0ubfeqrOjfzJ3UurfvgmiJzpltMTEo8OALK2
	EH9+HYIYAgMWinUT949kaVJOBoNmp8/FAN9THYtgsZ4oBXXXXV94gaw3fj3QCpFJqLRLAG2ukWA
	d5H0G7ZUbMEB+Ro9bPZwarlYURamHnzqypFbqbZE08gvz68LCYr37y0ZSQ8PmydS9gT+QAXjd7/
	i8iUc8UqcT5yfFZZk7rLea8NFiwbQQNYjHAoXVZDEaA308qziX8zXJanlBn+7UddSkGtzD0MJWm
	5OgD9v1v9RRAtjPE8N/LoAduyzZ1jxgpI9OQtODrefikvB3hWOLLQY4lyO3n0L5HGOyBbDFDriI
	dAQtv0EyRIjRcp4nr4j+G+JA1OJgWOK0O1xHiXQ==
X-Google-Smtp-Source: AGHT+IGbuiseGe6dO8ZaeyUMP0vE98HRa1rGWFspkK+5ZgKdbKp7kpHE7FLGo9TmBf7+WV4dwGP3pw==
X-Received: by 2002:a17:903:144f:b0:220:f151:b668 with SMTP id d9443c01a7336-22bea4b3d11mr202305075ad.20.1744713903453;
        Tue, 15 Apr 2025 03:45:03 -0700 (PDT)
Received: from DESKTOP-NBGHJ1C.flets-east.jp (p12284229-ipxg45101marunouchi.tokyo.ocn.ne.jp. [60.39.60.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e305sm8461509b3a.140.2025.04.15.03.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:45:03 -0700 (PDT)
From: Ryo Takakura <ryotkkr98@gmail.com>
To: john.ogness@linutronix.de
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bigeasy@linutronix.de,
	conor.dooley@microchip.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pmladek@suse.com,
	ryotkkr98@gmail.com,
	samuel.holland@sifive.com,
	stable@vger.kernel.org,
	u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v3] serial: sifive: lock port in startup()/shutdown() callbacks
Date: Tue, 15 Apr 2025 19:44:53 +0900
Message-Id: <20250415104453.3690-1-ryotkkr98@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <84r01tooq9.fsf@jogness.linutronix.de>
References: <84r01tooq9.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_034504_656679_1B2BA523 
X-CRM114-Status: UNSURE (   6.57  )
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

On Tue, 15 Apr 2025 09:48:06 +0206, John Ogness wrote:
>On 2025-04-12, Ryo Takakura <ryotkkr98@gmail.com> wrote:
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
>> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
>Reviewed-by: John Ogness <john.ogness@linutronix.de>

I'll add for v4, Thank you John!

Sincerely,
Ryo Takakura

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
