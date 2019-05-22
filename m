Return-Path: <SRS0=gYOx=TW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824C1C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 21:13:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2614320881
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 May 2019 21:13:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LSM+Ts2Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VO1rXSad"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2614320881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1bRBWaB0OIqGfxxw8viMhV7sw76RJ6JwUaPq+gii5/4=; b=LSM+Ts2QFoSfN0
	5qCj0r4f5rmcgGLTgFwxrhg3lAxwciwXfq9HXsc42jeEav06Xh/Qfwu3Oyr1kAwCqcoIUS3tN2c7Z
	pZl38bUAQKhrQiWK6e11dLP7OTVjokGlNjB2QkucKlIRERf6To2kHHeaMsicUC7vm32uJ/d5BzhGs
	xPyIGrirEanBUHTJ6jZIjokgd73a6c9MiumN28bdUNHGaLeNvm70ruAVfAmLAosFU5dFZVrTf4cmq
	MTjk9fVMOkMYI7c6YaERiF2ji6q+Bcj6tXKGRD+OxKlSJLNCzlp+g05qfR/OcQijGqZreTGSdqFn9
	LoPhYC7VvmQZ2eWAPg8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTYYG-00035b-Ig; Wed, 22 May 2019 21:13:32 +0000
Received: from mail-it1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTYYD-00035J-JZ
 for linux-riscv@lists.infradead.org; Wed, 22 May 2019 21:13:30 +0000
Received: by mail-it1-x12e.google.com with SMTP id u186so5343297ith.0
 for <linux-riscv@lists.infradead.org>; Wed, 22 May 2019 14:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Ef6GdZoq/cRjiZ0wAoRhndJaficjudFMx2nkPHVFiao=;
 b=VO1rXSadyi3M/CY8ragK1Mz0b2wnVpck4HEO0Wwdvv/aoaKurfoTba75hNB9VlpxTi
 rBVh/9QMCQ70pRziqkq4AHUqZVOrTKtXr4f7Vo3X0hPeOaYOJ8T9AaRlvStmGeYeXLck
 LX34h6pjoYJ2jkKcgIfRIlKFWizUJI2/icV6fJKOVAXfk8NZLPITWPYCQaaYnWkbmPeg
 WZ9aTQPgSBc5E8pVOzYwNdwdZ2Y5rqB5tQAHRHP22ZdzTjmzd1LQ5fEqxm34aXRbiPvP
 v47/NRXPisCTSZnX9kif/pmo818OE5urpNwdCyqs0PT9ayG1GzNQCB8rswcIcimOY6uH
 8gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Ef6GdZoq/cRjiZ0wAoRhndJaficjudFMx2nkPHVFiao=;
 b=OiW1dPlx4o4L9TkILbajBt9vnsXVs41xb1RziCilklIhrgHIqtxSqGw3OpwYM4oENp
 qkqvteq1OhJF114Oyd8B0CkE8f+0ap7OEvaMBtpo+Hyl+ZEpTv6hMacEe0EE9zMDrV1L
 T/HUOfredqFMMq8H0x6ROmpcq1D/6E6JCpO7TqYmRIkQGuR/anilb9IM23CCoJIPJvdm
 9gMf8JluPOMgu10NwFNR6BvcWqW4wZojKRe9PstkH6RHq9aQ38cn4M/iJyRd7qkW4zsK
 DhhX9T+HlOx9V2taLjz1x3NsLjWKPxpjIMqVdADI0zY4qXQbxB4xSrSJtz6EWnnupDYz
 rRfQ==
X-Gm-Message-State: APjAAAVlJ3iQeEDq4caakUkXJRqAC8HvOUuq46PE8o3kqpEs9GL3Cwu9
 YuBE7moGRTFFjkLpv+Nxh2PuYQ==
X-Google-Smtp-Source: APXvYqxJnWHUOE6kkkW43/WVvqeYzG0JQxmdtzC31LSQOfK0+AbxzzE8R4xcSwcuDouanDCDgBq77Q==
X-Received: by 2002:a24:5dd4:: with SMTP id w203mr10698898ita.69.1558559608421; 
 Wed, 22 May 2019 14:13:28 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 d71sm3521675itc.18.2019.05.22.14.13.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 14:13:27 -0700 (PDT)
Date: Wed, 22 May 2019 14:13:26 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andreas Schwab <schwab@suse.de>
Subject: Re: 5.2-rc1 boot on Unleashed
In-Reply-To: <mvmtvdmhktt.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1905221359090.20842@viisi.sifive.com>
References: <5c1ffb76-b18a-dbae-d3ad-f3d2cd41ee44@wdc.com>
 <mvmtvdoi1re.fsf@suse.de> <636f53d9-1800-df14-896d-c95737203b2d@wdc.com>
 <mvmtvdmhktt.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_141329_705190_8684F3B8 
X-CRM114-Status: UNSURE (   7.96  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 22 May 2019, Andreas Schwab wrote:

> What does that mean?
> 
> [    9.538450] of_fixed_factor_clk: probe of soc:tlclk failed with error -17

Most likely the PRCI driver isn't probing.  In mainline v5.2-rc1, that 
driver supplies tlclk - assuming it's been compiled in, and the DT data is 
aligned.

Likely causes could be that the PRCI driver wasn't compiled into the 
kernel, or the compatible string for the PRCI DT data doesn't match what 
the PRCI driver has in its match table.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
