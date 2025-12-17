Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824EAD66BA2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 20:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1LV+O3w1QSjtE/4xp8fv+4PglEZrHC0cwNNirSbmFKU=; b=nAtMlxqa9k4Kg2
	g1utZIQl91aT36KS95df6+jQoOvVDCfhXXpQH0rf1ojZY9LBnWY5fFRzpTXTD7B8Xm3QFX/KhlHTr
	rGh1m8mMoe1P4wihCPE7WzUBG4Q7j8xWiEJ3iFoYEGNXH2zTpsoK5+/FFjHz6LSq1/X7kwGJzZ4UV
	wZ7mxPR7gt9EUZcNLxt+JclZLzaFBwakLRQDE4Q8+o0w9IzfgT4s0aLnjhqnzveC316Vl/pvhWNxE
	wV46dlQOuNPX2TP9cug0TRnkq3uIxfNn6FZr36XIcSJykMM8ljdGcPyXA5ZSjNR/GErqXxV2MZ9oD
	rapBdIcQt7qe+IIKChvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVy5S-00000007NDM-1lwE;
	Wed, 17 Dec 2025 20:25:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVy5O-00000007NCF-0ZWx
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 20:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766003122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e4zb0T3CSvaS+O2fwv8L86wyH0tUQatLYZyrY/ySYrc=;
	b=YwQRfOYPICORo6U2szd7C2NsbC9B2/OU7EYd/NKIOHUZ6jAI6w0PvPr7VvHNRpDaLDW5ld
	ao8rC9ZGe8eN//LYPIx1nfgQTxqCrRM2H4oK3kehoxqNGsKgEKCR1p5ioIqvuOawL3YevF
	so/ozXJ/3IRi++DCV/U84OvjdtZUeyE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-AjP0bGfCNYe6ghzywRFtKw-1; Wed, 17 Dec 2025 15:25:18 -0500
X-MC-Unique: AjP0bGfCNYe6ghzywRFtKw-1
X-Mimecast-MFC-AGG-ID: AjP0bGfCNYe6ghzywRFtKw_1766003117
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47799717212so51586775e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 17 Dec 2025 12:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003117; x=1766607917;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4zb0T3CSvaS+O2fwv8L86wyH0tUQatLYZyrY/ySYrc=;
        b=VrTcMv8McSapyqqHHSsIfD/SrHKNR1FLQUDqgfWBs67jJgcaKX7a2Kh57nMZ+mxU8Q
         VdAVRmJZxYZVXg+4Z1fnQbHmlZbYBtqTS73gbvKV/wQjC8IOYkZVEZbjg2rbsIbMdoSS
         DMDf96tgJ/KxNeYteDK5QhOWF/uvq3PpVffMDMiKK9n0+drHZ3miDOg3PaUI7krjX8yP
         sENqTF5xTZSPDi7x36RC51zSpY8ZrQltXCWtWcvMYjPQss/Xu4ksZpEJKNbeckfmD7Sv
         3f6hvJoT1h6VQ3TlC4SZ7tjJ2thed6TZy+Nr74AWIqgCSg5hSwX/yOmjtUJxBIDUvvrC
         TdWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBy0kCZ/W7HchpdKbLtmFvtcWKYIQ7J8IEdrWZHzyA3JnSll+HVNGOP1rKXeeNUl7Y8e1sbVYxOSFaWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYRLZbEyJDNBeIl4u7KbouE0Nw07gXHxzfMqTFR5NjaxrAp7y7
	05K2D4FKF2D26kEAMyy326qzuEFtCgINEb23sCSRgCOW1vovS5I1Xg41zhGesrEzOXrMngEsdfj
	r2ATkKrSRETx18tm4llRAXNiGdSKouE5hCPxnFbvLPoWyN/wIwsZB/7rtBdwP9QfJlgrwjA==
X-Gm-Gg: AY/fxX7/GsTzlUst9wfnf2TR32D2ikXu2PIgmtLOIowIMxgzqBCYR/AWpqsQPAlY0l9
	sgapiw0aPnSpe4oeAQBKo0uo+wW5H1G0ledw++CyluVQ/5r4his1uhSjFDDPydzKKtdsCTRyVY4
	h6Ty8FDBGhARjN6M0TKLQAmm4YJ6Bfeh4dIBUdIEGhemdUfQC3liihCV59VW8I141E3qPmNOukM
	UpBys8yXlChVtxgOmpO3WDChtgYhGbE62G7gysFcKdoYgXkVnLofDnPwklxE0hiWfyliI0xJZlu
	/dzrxf5q+u0oP0LUoAVTdsJ9wIEce8Lq4erGY4m4q41GW/nXnbqOymHaNp0fwVgJYlN1SrWOZpi
	itafymMA9rIIwuQN05LkeCB1Sj9dgoH9RX6T6YBfsqBV+rbAd0hm3n7B2wK1r94wi8h8r
X-Received: by 2002:a05:600c:4449:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-47a8f8c03e4mr184840275e9.9.1766003117120;
        Wed, 17 Dec 2025 12:25:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7mLfMCMEvY/d0ceJuMuGVm+p7i/RHEDp+58KhImUnarFbsKr3g+tGnz9jJLfG/gK9xplmqQ==
X-Received: by 2002:a05:600c:4449:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-47a8f8c03e4mr184840155e9.9.1766003116735;
        Wed, 17 Dec 2025 12:25:16 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43244934d6esm814631f8f.6.2025.12.17.12.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:25:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Michael Opdenacker
 <michael.opdenacker@rootcommit.com>
Cc: Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Binbin Zhou <zhoubinbin@loongson.cn>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
In-Reply-To: <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie>
 <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie>
 <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
Date: Wed, 17 Dec 2025 21:25:13 +0100
Message-ID: <87v7i4c0uu.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hUL8OWue2LmDMx_CsMHsTaC3qPAOzf73ZWseCY0mXXU_1766003117
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_122526_274252_0E020445 
X-CRM114-Status: GOOD (  15.93  )
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

Iker Pedrosa <ikerpedrosam@gmail.com> writes:

Hello Iker,

> Hi Michael,
>
> Based on the discussion and Javier's feedback, to make the SD card
> work properly, we need to patch the driver to implement the following:
>

Just one correction: it was Yao who gave that feedback, not me.

> Define a separate compatible string: the eMMC slot has a PHY, while
> SD/SDIO slots do not. We need to differentiate them to apply the
> correct reset logic (skipping PHY init for SD).
> Extend the pinctrl driver: support is needed for switching the SD
> voltage pins from 3.3V to 1.8V.
> Add tuning logic: this is required at least for SDR modes.
>

I think you are correct with all of these.

> If you don't mind, I'll start working on point #1. Feel free to choose
> any other task.
>
> I'll post a patch once I have it working.
>

As Micheal said, that would be great. Please let me know if I can help in
any way since I also have a board to test (Milk-V Jupiter with a MMC slot).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
