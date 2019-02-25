Return-Path: <SRS0=l2EX=RA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5C8C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Feb 2019 08:34:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D18220989
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Feb 2019 08:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PM7OZgOB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D18220989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Uq07m5tYqMUBdRAT1MgheaAyNKDdYhmz5k9eOf/Im4=; b=PM7OZgOBXgzahV
	z01YdEKGptzhU8arfCysZJRT8h9DYEXgwvgztg+WwhSn0Sp8RdKxB6TFLlEAFNl6FeAN7tnnyQK0p
	LzSeWUbFgMmmEU5fE4Wk2SDtmBtNm7GZT73fHVsQlHHXPME7olChZJ0OROalXdf1TQIG7bDzjGhOn
	Zd0Ifpm3/c48NWXM5FDyr+P5rVRom8D2uGtqFYVZ54gPX/Ng76T0V9IiJ4TWtOCFOsukAglNJAcXr
	H0FlEZiWDOi6pZWSdRX1QPbUZynbPHSZn63nNVOkDCkDC7NAzsz8hchOA+az6BTCKUNKnw14Wg8qQ
	ppM4q+1stGAIOL8K2dEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gyBiq-0004xm-EY; Mon, 25 Feb 2019 08:34:48 +0000
Received: from mail-lf1-f65.google.com ([209.85.167.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyBin-0004xP-TF
 for linux-riscv@lists.infradead.org; Mon, 25 Feb 2019 08:34:47 +0000
Received: by mail-lf1-f65.google.com with SMTP id m11so6190816lfc.6
 for <linux-riscv@lists.infradead.org>; Mon, 25 Feb 2019 00:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R8/jrsgZy37rcm9d0JexY38x/Q69aQEf6gbO5bG0DkY=;
 b=BWsdRmcYesa5UDuOz0UQZOzUgphhTaX0SVq+kYwih49qwfgPrGRkgO2/3aSnRTNu61
 jzGTC61MeTKF/7+wpWUMKwKQWWqeAGNypCL7LPKG7j2gk1aycL29LFfhBxoMaQaOKeTE
 5BCSlKNmYLwmfLy/ujUhCPigHR0lgs5PCsradyRdjRy/fDkin+ZS4Y7gCMnL3gbYfcyW
 GJgf+3hOz7JAZw08W9n12CcnPsLacwUzSUJuLEUZQlhSAFvwRWzPqsyPUTdixCv0hnp5
 eT9keqQ51NWOKKwOBDhxsSdaebB3A0hwREIc1F3YxoRdRLdkKZMIucaHB+vWEGdvAC5A
 +Q5g==
X-Gm-Message-State: AHQUAuY+NYvbZtXD3c9siuvAcsEC+OBDZz4WPRb6VhbJYZbvOKsYnPZ9
 93eifEanKqoGoH1Lm9ujc68=
X-Google-Smtp-Source: AHgI3IbpVAcNvJ/RI/ODmtkNTc4XSW4F/rMbpCk7xXnQjot2+iILsr3VwMBpiZYPBoE97/QaUQZBIw==
X-Received: by 2002:a19:7613:: with SMTP id c19mr9383947lff.103.1551083683383; 
 Mon, 25 Feb 2019 00:34:43 -0800 (PST)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.190.116])
 by smtp.gmail.com with ESMTPSA id j12sm2765584lfb.90.2019.02.25.00.34.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Feb 2019 00:34:42 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.91)
 (envelope-from <johan@kernel.org>)
 id 1gyBih-0000Hq-TZ; Mon, 25 Feb 2019 09:34:39 +0100
Date: Mon, 25 Feb 2019 09:34:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [v6 PATCH 6/6] RISC-V: Assign hwcap as per comman capabilities.
Message-ID: <20190225083439.GA4747@localhost>
References: <1550864500-13652-1-git-send-email-atish.patra@wdc.com>
 <1550864500-13652-7-git-send-email-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1550864500-13652-7-git-send-email-atish.patra@wdc.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190225_003445_945373_B3439FDB 
X-CRM114-Status: UNSURE (   7.78  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 22, 2019 at 11:41:40AM -0800, Atish Patra wrote:
> Currently, we set hwcap based on first valid hart from DT. This may not
> be correct always as that hart might not be current booting cpu or may
> have a different capability.
> 
> Set hwcap as the capabilities supported by all possible harts with "okay"
> status.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Johan Hovold <johan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
