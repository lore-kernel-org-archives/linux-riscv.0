Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC56D3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 10:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bh/OdeuPq8+9P8EQcWgKBOwCoPuD/u8UCzp4XL4MCUY=; b=mhAuoaE1L5bB4q
	XuGjancMZaX7+LJEHMdiepra/aSaAWrWty1LpJPcSSDqcZzfTGUEyXQSrasgJWKf75joLWcrinS5A
	HzTPDUGLKpqzBeokR5rVVWqRAyGUSJYI6ZRmCOpWteJ8Nb6/UbcL9V1Qbcvk+0OUhUgKg/26D1Fqk
	/D2KwPinSQ0LgflaWLo4qQSj0TMMRDFOLNl2c1hkxp90+8886+R07g5PfWsPxpRYzW71yGeZm90bm
	xHZlWDO2jtKLtRXawCer63NBodQ87ZPVO/oqtajfUcQ/WBDfeWuo0jlnR7GUiJehKUmIfAEasqJtv
	Dvv5UaJqhPV8JOmgeDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaASu-00000003ZXB-3QgE;
	Mon, 29 Dec 2025 10:27:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaASr-00000003ZWZ-3wX3
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 10:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767004021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+gTURj67hUtoANoYmcW+tjm4QyZ/4RAo5MqihnzdnVQ=;
	b=XOHIt+zyQBDt27gFd+IidW0IyDY4uTwiv2nDPSqmih0KL9YUR3eTUt75VL8SgunSBJ5Yhr
	IRoipEEE/00gcXPKQ4LelYrk3QDDMCSMIITgos8rTAczGOALanUwhsSiVCnl93b07+4iTn
	BgwybS8Cq+ysv4s2eJm5/ZDuQHKU8l8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-_0fmJgEaNrGom8wl840rYw-1; Mon, 29 Dec 2025 05:26:59 -0500
X-MC-Unique: _0fmJgEaNrGom8wl840rYw-1
X-Mimecast-MFC-AGG-ID: _0fmJgEaNrGom8wl840rYw_1767004018
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso27698705e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 02:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767004018; x=1767608818;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gTURj67hUtoANoYmcW+tjm4QyZ/4RAo5MqihnzdnVQ=;
        b=ICvUe2ELEXx8DzQzQMQOp64+WZbQSTON09x05GdIepFEPrlrl4fJSv4hf4o1GouPxi
         zQ2u2uXNwwu6SCwfNoBMoxx61KJHCtl4L0/vlv6roF4mkQiKk9bgVZhE3eELpzvX1jgg
         8xBQQ1MO+VNoGZ1YvazeGxoBy5KT+Y/cFYYsXMeUnDv91CRWqGT0O7k7S+Hjyy+vJvg9
         x2FOnRP0E/oqmVAyia5zWZUKQpH/6XHmOkBOsLr/wK1ac+9AqplA0w3Q/ftT/d0jcLt5
         ilcfjQzGWy5EfLRiLxV/kz6L5BxUiEr2fZl35P7UJyQStmEcVMJSzAiT1PbEK1d8e6uk
         OMuA==
X-Forwarded-Encrypted: i=1; AJvYcCWalJvH0lodGUAZMgR9KxCImtIPgQZWyVMKIOieP8uon2DW1TiOe1lHd5OxpoqpnyoKMrvFuVV6CCJ9eQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDRiv+WTeqZcHxGMS6Q6cNhyGruwWbB05lEG4UHBol/PXbdEEg
	3yzH+iShBqThwzJEddGdXJcTd3AOXJiA/XSxzN2Jc9GKZ5bKsyOe9np4dXHBSYrOEld7gV/BNjX
	37g6R7YL1fj2ot9CPM0U6eBwD2zuGKRvXb9Pg3M1Wuq0NQG3KSq5Td/fI6HTLQdaCDdanyg==
X-Gm-Gg: AY/fxX7UbAoBcz6NcrV6Xo/jpL0HVmg8T5KSh0Ra70sIx2rXkMI2TV+k+w7ggxmXtpJ
	ZeohkCRzlc8b6MH2FuLY5jaqMKefvVqHTJ4oGHiFKSxmRve9dirMZAPW9qfS2NFhoLMMamq+yRa
	cLYW86pIrUkOznqs1lNOrc5QWc1KtpKso7ZqtZ2x41Nuuwj7XYaiijQ31SsWVpDFFeKby7tu6bf
	AbbSqjEb79t4ee4Ki01xBFGqQDD7156eIHa05mApWIqFLi9GFPDCuPpDhGoC6MpmmNOyC44Ccrv
	LE9kk4KGw2LCGLf5IExjaApBjukMyfzSu2OTLKMtYzYUeAAX9Tw5n5Vgjat7QJqNeWOpOaOSzYA
	lzKblFR6V1hW9EHC6vTYuGfMONaIk8kCOWJacjdJ1mamJpRX/1BzUMrDgVh/c2amRDKUM
X-Received: by 2002:a05:600c:1d0b:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47d1954a5f7mr342815035e9.11.1767004018146;
        Mon, 29 Dec 2025 02:26:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCLr8RQ/kQaLCzAKU4XinX/5NPXh7J4eFNQbJHL+v0sAPDycbmoLCRLQ+zzlU/e+HX1KBdsg==
X-Received: by 2002:a05:600c:1d0b:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47d1954a5f7mr342814785e9.11.1767004017733;
        Mon, 29 Dec 2025 02:26:57 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d28bede16sm170253275e9.20.2025.12.29.02.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:26:56 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Alex Elder <elder@riscstar.com>, vkoul@kernel.org,
 neil.armstrong@linaro.org
Cc: dlan@gentoo.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, guodong@riscstar.com,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
In-Reply-To: <20251226173228.2020411-1-elder@riscstar.com>
References: <20251226173228.2020411-1-elder@riscstar.com>
Date: Mon, 29 Dec 2025 11:26:55 +0100
Message-ID: <87wm25fus0.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BsCYakkQiUY9b2baYJxZKifeV72NSWUcJv2peCvWB98_1767004018
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_022702_042899_E3A91701 
X-CRM114-Status: UNSURE (   7.92  )
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

Alex Elder <elder@riscstar.com> writes:

Hello Alex,

> The SpacemiT PCIe PHY driver depends on the common clock framework.
> Not specifying that led to a failure when doing a COMPILE_TEST build
> for the SPARC architecture.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
