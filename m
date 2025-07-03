Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497D1C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 10:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiPI6ZamK6TWs9W78j+h3PlfhQ1tu3v9KC1HmLauiug=; b=o4ELCJXfx5vgkA
	3Uv6WLneadAuqKEpUnAf59YGXX8KJILpssXMcTOzgNnCk1i6zeLELpBFeGk0LZU8dSv27kZkmoBUC
	HKrZxld9b3l8aGZgAicft+x6S797tGXITrNWkQ1yvcqazlR+WM+nawDni/MmgQAbTKl5rWtiIXWWH
	r7Q1rPvpsHi7fkXd4xeBN792AXh+8lF2fkcOFqIdUvYNzGm8la2RuLHqqasi2I+70My7wSDuUXgvn
	fdb4sTIH4WlyoaznbSZc+gyXR+o+gbpsSckir1EC2VxkM22LmgiwtIyB8l0AMLpU5O+YcrkfVVQRL
	nvtxdZD11oZUqBizj1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHJD-0000000B1M6-2bTT;
	Thu, 03 Jul 2025 10:36:51 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH8F-0000000AygV-0qYv
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 10:25:33 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73c17c770a7so6640035b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538330; x=1752143130; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dXUjD7MfImAQZU8+JU7QOVIdG7kZgmgU1R+Tfu+SNUU=;
        b=YHsn1q/NRrFbMkcJ41tx6NQ24At7hf0ZID69g0BuOuJtab4vmSpD+NMQyVsbYCRSxO
         z1KeEPjQKxglEG2QXI0qZ+NnFLj0Z/zl8z488G54O8+z1Xvl3p/Cq7zVxw6Obmz7Txsq
         LlMKuhKN9fYJnjtNOjQRZWjP+yOLNasjZKPmFZzHQI27XwcxCkv1CgyjOL7Ae9PFufeB
         d25W9HrMZ+L+MT2LRw+ei+q+WlCuxkFMPviBI1O/SfuZY/jRyANYcag0X/CDFf4EuAtS
         iuz0sbC/CoJ6OF3W5H05ul3Ckcb/Er61WnSo2C+WWkm007P92oDy0ULHWZQpHTTvbMSq
         ERHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538330; x=1752143130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXUjD7MfImAQZU8+JU7QOVIdG7kZgmgU1R+Tfu+SNUU=;
        b=aYfmXU6F0EAu+eiDQa1m3yAPVHPzrPH7Wjqx3ujqsJUi2EYYI2zp33V9MxrMiY1J0T
         pR019c2JjIw+ocDpedfFcGBFjXQxOInTCw2gqd9WNE1Nd0dX6Y39i2Z58HbagjTLCKCH
         yx1aP5pCWUdGNOIOSRuxqRdqWVV9n0WroBnfDNf1VnA4xLeEEweIu2edlC2BYpCLc44A
         W0qRSUtWVKCND6s/jqbIC8Q0GKTkj1wvhf2VjKr1nepq2tt+zZFSveUBaldVcWZKANE0
         wAO/rOqpzxLge4pQ7HwmTTbpCDTlfskj8Juz75UZoXvwDM5J/tn9J9STIv5damVAxsOL
         uoFA==
X-Forwarded-Encrypted: i=1; AJvYcCWD5pXLOIt7pnOmPo9NZdH0Eefp1KJk98X/I94kmZK89oa6uGOx8zJqo+vNW09FKtZRDdLQqT1pSKeQqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCmMNbXT05wfg8ewXFLYsBvDbhApM5I72F9iof2r7LIXBgGSpy
	nUO+l7oo128KFkcLce1W6j0M2GiE0Bz5+YQtQ5o4uF91Zmb2TUOH7QLt
X-Gm-Gg: ASbGnctIDyk+4LICxsbty2UV+yvxbS1H87TArtr2lePPP/UMAkMLiJDIhpj9aqDlyrp
	+vD5gEz2wLb2eZKH4CwmJidJ/E3jkhUyTCFWGOik1BEMxTS72N3MW49lsL0yyGhraOtEpmaT+8P
	tei5r0eYRWElZaDU2QqbsbfRqHKLjz02QHDt2aFkujP4v20KIrhCdUi1Ca2TnhMeuD4QgaELzJH
	G5i6B0Gxlz5ERpCrnhulvNgT8aGtKy529gnj7Ve2tReOYNWga+XomRbDVOzlNEsuGQY+W2C8/Ow
	0hKbyC35kKeaFu6L3n59wlTk0/ArcMBPhlEaRBZZemVMNvZJdlC/Y8NjOSSHy9+ZXZDALa3t
X-Google-Smtp-Source: AGHT+IHzz3RRYRWu26js5qfVZF7wwD2MorMUcc2Nqsg/oVzDHjgNVbsweN57uB23YZEzDzkG8THccA==
X-Received: by 2002:a05:6a00:3c89:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-74b5131899cmr8373208b3a.7.1751538330427;
        Thu, 03 Jul 2025 03:25:30 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af558914dsm17503280b3a.78.2025.07.03.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:25:30 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:25:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Yuntao Dai <d1581209858@live.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: Question for CV1800 mailbox users series SoC
Message-ID: <pfe2tzvujcfogxnj6uvnjaicktl5ifcj3rhw6d5nyq77cyhzlc@uonejrloi66h>
References: <iq36z2mqetrdhxe24w455quvqixcy25ovuxjz3rgelpgln4j3f@kjxn5z7yb6bz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <iq36z2mqetrdhxe24w455quvqixcy25ovuxjz3rgelpgln4j3f@kjxn5z7yb6bz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_032531_253201_F133263C 
X-CRM114-Status: UNSURE (   9.05  )
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

On Thu, Jul 03, 2025 at 06:21:38PM +0800, Inochi Amaoto wrote:
> As I have seen you take the mailbox driver for CV1800, I wonder
> if you have developed the driver for the 8051 core on the CV1800
> system? 
> 
> Regards,
> Inochi

Please ignore this, I have forgot to remove peoples when replying.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
