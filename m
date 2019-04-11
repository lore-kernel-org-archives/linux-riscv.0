Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B361DC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:54:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876D3204EC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m+7CrUcm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nC+AT8Fx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 876D3204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qm8x/nO3xd6TpzrCp2RXLUa8NSBvCGYDptfELzaUH9A=; b=m+7CrUcm4dMaR1
	LCfldmE41eItItbEwEP8jh7lD3z6k74LBgHgg7cPkHVdv2YKQ68DIBZ8kvKNZH3WgFMCUbuacUXuI
	zL3ek+inqPmUbBQQ3eJonq7QHUmz+hddgdmMTKLpcI9DZZdj1f4ZROhM2wWSoWRYJv1ppI3D5sx/s
	8bMLmdrmb7kwvkyJI/cSnL07Orcfk5m50cYKLVW5jPf1nqhHZV5SPACXH9oNQiG4fBo3IUtidpDqN
	Oc4tRIs88C+uUzX/+kaN6tH9qGuNKXGh+LuBb30wEkSyXfB7c8svMnNm5kBd1EgALQmCARpxgFGt8
	i07ROcmYO/GNrWn7KpFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVTG-0006Rx-9y; Thu, 11 Apr 2019 08:54:10 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVTD-0006RX-7b
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 08:54:08 +0000
Received: by mail-pg1-x543.google.com with SMTP id q1so3181291pgv.13
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 01:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=lM+7ijBmcENwcoBLSsPq4JRUUBqamx38sGKH2ENl6NY=;
 b=nC+AT8FxR6Go47Pfpqe5BS4kmTeYhlkkc8zqEnU13SweRx2Xm3AifctiNnzm/GNKIY
 pfUChsm8/Od6QQRgcteTuojPMARCgxf8zvTwwIpY/tpXfoc9AtZWXrPUxLvFhZ94YdoL
 /gpmkREvdUAOYMiPo43QO6GF+nhuhlgJEZbH2eM3sM1FfgVoT2DkfK/iD5vopYKDf3bR
 tDbYjGI8LvC3/P5zIf9x2lf+5Phd0XvL5559GbXr4TW8H6wadhkMpQhhMI2AV/hhab9F
 DjEbp4ayQAee+Gd/9qyRywpmTOseMlIaWk3OL9695DwzBLAtqB5fGwbpDvTS/01bl7SJ
 J2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=lM+7ijBmcENwcoBLSsPq4JRUUBqamx38sGKH2ENl6NY=;
 b=NFqp5UMWXHILOQTC7pwqTXaqLbsd+O3AZG+YcQ9/0nAxcDiC6L4FCoqdOv18KXwDZC
 0cLKeDjGjsslRLE0JAcwmmkzSsDOHUkMiqRUMsc60zi1rY86WdRV2KObWBzfKROeSKPR
 O5lOvYZEv35cz01Ry/0A1+7rPapUTxNQ/mh5aY9+DexHw3/tvV2ceX0vKFD/rwNjyIzM
 WexqLp7h1sswolTDI1PR2avDVk80jCPrrw4opesmvC1r/+A/vnJ/YFH13k7YJA4D8wD6
 U8Uo1qgykM4Yo+v6Nw1XfNUDjhv/aAR1hezP2xhBpYqcGph3sp8tT0E+CZ/R5ICq3E8x
 fzSQ==
X-Gm-Message-State: APjAAAWVKpxIkBGJWAO3EBcbN69+IF2QuDMhMj2asVNPoCRiOLRcMl7I
 4PKQ50vw1hRYjkLryb6YcYbenA==
X-Google-Smtp-Source: APXvYqw3TS0JoMsPi14KZqAaAAf6wEEZ7R25khR/kqFc2ttzp8CNzulQGjJ55DvlUciFoLtHER7iqQ==
X-Received: by 2002:a62:6402:: with SMTP id y2mr47617836pfb.194.1554972846514; 
 Thu, 11 Apr 2019 01:54:06 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id e193sm8358501pgc.53.2019.04.11.01.54.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Apr 2019 01:54:05 -0700 (PDT)
Date: Thu, 11 Apr 2019 01:54:05 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH v3 0/2] tty: serial: add DT bindings and serial driver
 for the SiFive FU540 UART
In-Reply-To: <mvmr2bkxntv.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1904110151030.5868@viisi.sifive.com>
References: <20181020101045.15991-1-paul.walmsley@sifive.com>
 <mvmr2bkxntv.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_015407_285968_57AC0AF0 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 Wesley Terpstra <wesley@sifive.com>, Jiri Slaby <jslaby@suse.com>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 6 Mar 2019, Andreas Schwab wrote:

> Trying to log in on the serial console causes the system to freeze.  The
> last message is:
> 
> [  115.597858] sifive-serial 10010000.serial: BRKINT/PARMRK flag not supported

Have not seen that problem.

If you're still seeing this, could you follow up with me off-list so we 
can synchronize configurations, both with the kernel and with non-kernel 
boot & M-mode components?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
