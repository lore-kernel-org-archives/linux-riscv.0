Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFB2C43602
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 21:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOcNx6yTIT4w2QzqXUqRtarsznkZU90ZcjT3bLijKWM=; b=zKpvExiuEduLVt
	ONkiaknTYnAFHrBw5D5LFfbJwetH5dQJ04dzE232rolN4iazbqVqhCWU2mWcG3djRvs9Vn/b5RsnF
	pz95yn0g/GH2EHWdJGv3xM1zI9hKFhGp1FsdKTEv45wOobgTnlSl6J26oMoQMqU42qElbRCbGbdO/
	iCiGhJFKuSv47xrXQdgOnsg0iMNBmDVmcU4aDEgBwgGbu/36R1bmPnZwd4pT9Eu8Xag4yChTZd3H2
	A098eAnV0Yk176U9zwz9x7xfHNx1k9K8XS/lAAxUozHpsQ5nuNN+oOisRYzji3n+1CxEAcbvwl+XH
	Ddweh8N2GE5Xt3yEiJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJOs-0000000FVdt-0ptw;
	Mon, 29 Jun 2026 21:20:18 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJOp-0000000FVdY-250b
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 21:20:16 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-139aaba3522so2550117c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jun 2026 14:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782768014; x=1783372814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKCpvBw+RV7e30hMtzWTVtYjU2K+4YOPvBtrFzvbfCA=;
        b=s9EUu5gBrxvvnynsPna/l6x7Y2NBUkMxu/r/rSHbHfndD3I7kVpLf1FfYrwEa9ZJ8X
         E+RfUGsBThxvnYKywY0YaQRiXxA2TjcfBxRQMw+d107l7Z6sztemxplONrCV7b0FZrQA
         avNBkg1++b+feMjRawOdRzFoQTwBG6hyQX9IWV2ezLm/7lPbElFjurupWR1WcZ9mXw2w
         d21mbB3AufzhOOYBHHej8Po5ISD05Jv0DcKmbucspCOoWERIx68IRO6OSlZJO4pKJePC
         /YZZbNdtev4LmlxnlOjHlHFN5+4k78/DxDPD9LMAl2QJ8ER/u+A+rqqOUq1vHdQnRhqQ
         MMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782768014; x=1783372814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WKCpvBw+RV7e30hMtzWTVtYjU2K+4YOPvBtrFzvbfCA=;
        b=rNovaOUQ7FptCmQRsGclSuS/LkmmKRWGUIuCHrhMI1pcYNJ19yNhLOZ7dxcEXAfpuP
         ibsC7CVTnKMzXxGJiJr/1rjnemyxCPFJdoyYZzYMqOJ+zpTK9fdd5rviGVdbQqMRpCJy
         +EMxKnIHmLg4X81JRMT2maVYmNVB+eA+ZXhurDmarFjE4soAjJN+ZmUPG4wDvvWRr7CS
         t2eCJLVqkoKTrROJXWWvYjqIH29ETHN6TtAK6Eh9nbqB3sbr4jCcfWBcpQREG6ODM7K6
         ZiSK5wfQlkQCSUXTI/lVQHg9f9Wl0XtIRT8ti5Mib/af2hXXRUAW4SWkCYUzFsoyePkr
         gZcA==
X-Forwarded-Encrypted: i=1; AFNElJ8vH4P0Ooeo9Z/XNz9w4CkpsN1zCHN1ybtLQu2I+FlaZs24pWJfBfvnHbGUs/dQR02SKfzm0LNDYEHGkw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5mCTLf/6OS851dJoggBWMK7TECF7B+8oPHWFHn/aXw+BRWeQt
	TCsPWcIek1I/W53yISTvlWNZneGAQzR+14fJu7EAPS/ZXV3QXkIrjlt+
X-Gm-Gg: AfdE7cltIrWXe3sF0i4Evhh6PN3ioPukEFuuQrZEzskUHlJo4spuBNyRtHQZXZ2zuPk
	u5ed8ydzTh9YBX8Ypz1i6mGeK8hbBxw2h1+RYvZzLGKZMZ6iqJGY5hct5fjWyvaOAgLy0gMs+7T
	/wSCzGR30JfPPR6nDRXHSbRpwAS6HjBGACQ0m3AAaFrLo38crhWowCiTsePSo/e7YadiXbS3UgW
	WsuqUGkbgt4Q/ECMx6ipoz2OayGgaKgBDRbgJ0MVGj20oB3Hwt27JRxVfywoIpIKD91sGNFFZna
	ZhU+UNnfagDtrPaQ+cVnigm1lx9vl/ZKLK5+OvI+uN53PPAPTP6ai/RLPqLhUSuTuU1BfLzYhCS
	51ZpNW3Ah6CjG6KSb0AUEJ2/xBsXbdOY0jM4UxZ3ERZo6S37l7Qvuhif3mz4mbABP3AkaBYhF1Y
	p/1+sugtA/VLTeNZN8uvAe25ELNQ==
X-Received: by 2002:a05:7022:698d:b0:139:85c2:d7aa with SMTP id a92af1059eb24-13b2a52c9cfmr547955c88.18.1782768013877;
        Mon, 29 Jun 2026 14:20:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2aba8008sm855319c88.11.2026.06.29.14.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 14:20:13 -0700 (PDT)
Date: Mon, 29 Jun 2026 14:20:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Conor Dooley <conor@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Lars Randers <lranders@mail.dk>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v4] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
Message-ID: <5f9ff7eb-44d1-4f74-8368-b08298f67fc4@roeck-us.net>
References: <20260629-wriggle-headscarf-c85a4070dddb@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260629-wriggle-headscarf-c85a4070dddb@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_142015_538271_0429658F 
X-CRM114-Status: GOOD (  14.03  )
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

On Mon, Jun 29, 2026 at 10:30:59AM +0100, Conor Dooley wrote:
> From: Lars Randers <lranders@mail.dk>
> 
> Add a driver for the temperature and voltage sensors on PolarFire SoC.
> The temperature reports how hot the die is, and the voltages are the
> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
> 
> The hardware supports alarms in theory, but there is an erratum that
> prevents clearing them once triggered, so no support is added for them.
> 
> The hardware measures voltage with 16 bits, of which 1 is a sign bit and
> the remainder holds the voltage as a fixed point integer value. It's
> improbable that the hardware will work if the voltages are negative, so
> the driver ignores the sign bits.
> 
> There's no dt support etc here because this is the child of a simple-mfd
> syscon.
> 
> Signed-off-by: Lars Randers <lranders@mail.dk>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
