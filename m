Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AD5CDB46E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 13:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdPMya53h4Vi0PRH8XIsLqQ5ms9yyUcnjO4dYG5i7qk=; b=S0lJRRbUhrDtBk
	TUv9bks8x503v7q/I07xKkZcvpE/ghF1XLlYWfFqS2jWlQ4LxOSX0iDWXF7VGzKp5nRPY4vKeFhle
	6oHWPgDhdUD75AOYCbNGDqysVdGNlQW/XyUM69pYSyaVQuJ9f/2JfkYW9j2uQMUiuocjNCsQo65ot
	3raSJ4BBHflBSBnhrnWs/cIYLMJyFy+a5n7pIAZ0A9YwTKYBHn7Wzk3qFgfTkC8DiC3lw8jr1xomI
	YSVKppQk6zSh7GNoLeoAEDYfdfUp/wrjvlDVq+i8xntx7+rHEXHV2QEJ3cPBSFtKbqONE7WysiUgz
	wxF02dqzO9v09dkQJ5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvro-0015wO-1Q;
	Thu, 12 Oct 2023 13:36:44 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvri-0015vW-0T
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 13:36:41 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9b974955474so151067466b.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Oct 2023 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697117792; x=1697722592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WRWK/gfI7nwbM/H5T2HMcdnPmksCN/8bcmPIiMJ0TP8=;
        b=IdNsCSDHijwagHLz/B3nRSARt/ig1Yfre0PcUOMAvOWNdCKjJmbjGXyCI+WeMktbdh
         td6qrfHimTKQNRtNRPevwHFOgGtLlDTR2LopToPXfpas7I01xrE4Jx8hlUwFvghASDP3
         bRrKn9JquiWfN1XV3ldvY2IHXmIEnWHfS7WPKCG6aTW9f6JegBqGVttUisQJjrP4QXVR
         R5en7VvvwzWMjysqWayqkp4v2kfqFw6MUeTeJRyBNASiH5LX6ii4O78EXilVKPEgeiXH
         JUDnX59JNsuiktM8tj56fzVFIH/i6j75qUlhde0OSxjiQ/jiVTayzxop3+0Zyz+sDjHF
         aOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697117792; x=1697722592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRWK/gfI7nwbM/H5T2HMcdnPmksCN/8bcmPIiMJ0TP8=;
        b=TeQJgGhMhB7Oc2eIYMA7KiyiLVGCH7L9X9b6strU0fVGQn2ZWLCcBxu8Y0xuuTjHJg
         rVViuQcXWn+n/Bu8dVyE0a5766sbnwjNEyglVpGps8nOltwdHyOetcNnxkR8Indi/P1n
         eNsCyU9tz6H9vHfd+lfRwMxT6th5IOkSVtpR/aLOEsfA6dqd4egnKpOM9WNW+51n5q5t
         lOP50J7q5qEDN3nwD6tkyLzmkJQ9XszgXN58NrNEQKvBCJUBfLINSCtbpt6wKIE076jG
         ZW9BVgdpwWDeEXLlYtNJ3+MdX4eyslS6ojoqUCW2O91mKz+/cYAk3Jh2AxRen/6tTqGK
         HFCA==
X-Gm-Message-State: AOJu0YxGUx88/EPnlnSgitrz4EvmgKe5E655dHiRXJNYdsHxTm+f0+of
	XOTXYMfv6SB1e9mdPSJ8y3cAOg==
X-Google-Smtp-Source: AGHT+IFnpMQWCPkkth/Zsh4WAiojzUju8RqjaAPreJsNrEUPmYjm0IMb1HR1bPRCCQ/+p8sjn6tbog==
X-Received: by 2002:a17:906:8a64:b0:9a1:d29c:6aa9 with SMTP id hy4-20020a1709068a6400b009a1d29c6aa9mr20645375ejc.11.1697117792439;
        Thu, 12 Oct 2023 06:36:32 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id m14-20020a1709066d0e00b00991d54db2acsm11047739ejr.44.2023.10.12.06.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 06:36:31 -0700 (PDT)
Date: Thu, 12 Oct 2023 15:36:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	jeeheng.sia@starfivetech.com, conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH v1 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <20231012-391361fca6fa17b44fefd033@orel>
References: <20231012072148.7010-3-ajones@ventanamicro.com>
 <20231012072148.7010-4-ajones@ventanamicro.com>
 <20231012-powdery-demeanor-4d8dde576f24@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231012-powdery-demeanor-4d8dde576f24@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_063638_229204_B6C0278D 
X-CRM114-Status: GOOD (  17.84  )
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

On Thu, Oct 12, 2023 at 02:30:02PM +0100, Conor Dooley wrote:
> Yo,
> 
> On Thu, Oct 12, 2023 at 09:21:50AM +0200, Andrew Jones wrote:
> > When the SUSP SBI extension is present it implies that the standard
> > "suspend to RAM" type is available. Wire it up to the generic
> > platform suspend support, also applying the already present support
> > for non-retentive CPU suspend. When the kernel is built with
> > CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> > Resumption will occur when a platform-specific wake-up event arrives.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> > +static int __init sbi_system_suspend_init(void)
> > +{
> > +	if (!sbi_spec_is_0_1() && sbi_probe_extension(SBI_EXT_SUSP) > 0) {
> 
> Random thought I had reading this, was that it'll be possible to have a
> firmware that implements SBI < 2.0 that provides the SUSP extension.
> FWIW, I don't think that that is problematic, but maybe I am missing
> something that would make it so.

Right, it shouldn't matter for SUSP. In fact, I sort of wish SBI was
extension probing only (no version checks), but Anup tells me that PMU
requires also checking the version to know which functions are available.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
