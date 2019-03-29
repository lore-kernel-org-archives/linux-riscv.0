Return-Path: <SRS0=QLKY=SA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A785C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 19:45:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2EE42184C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2019 19:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j1rZCB8e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Fxx72nOl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2EE42184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HP5FQ25arq7y3J6UwNd7Ey9cTyX6bSHJVbmKmPmKl9Q=; b=j1rZCB8ekYkKIp
	bA0aXFmyEp4aHQAAiFHsLpxpqcJ9ftYDlCPQSA6nHtqKLsylE1udE/opSeCjiksXMudG9phBb1XN0
	9O/iD1egVMsU2B0h7Rzy1lpydRExAHD4jFKjRN0BqM445ZXgZrF595uljnuwRzYtHOkySm4wbb1e2
	mmRyGLrbCpVA8ZbBsC8ibVnIUxOMvGLccGHGHohauUYtViO2wyuKQNC+/X41dL+/aRHXI/l+u7tX8
	2Z9ga0Qh1Eu9o8qcO20Ta/n38CC4ebDuhuO+R3bllEqsjXc99PK3ua1nLYgeaxtnlHKSbJzU8FVaS
	XNB3nY2f88PJLkZwi1Rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9xRZ-0006oj-NZ; Fri, 29 Mar 2019 19:45:37 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9xRX-0006oQ-KY
 for linux-riscv@lists.infradead.org; Fri, 29 Mar 2019 19:45:37 +0000
Received: by mail-pl1-x641.google.com with SMTP id ck15so287544plb.3
 for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2019 12:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Rt/XZbu6kOM9x2vXlY6ECOlA0Nw9mNr4Yr37/Rjkef8=;
 b=Fxx72nOlnCAIug1xADInmbAg4WzR+IlSYnQj++SbTxe7bP9V6FsgoKAHGOjjHjoHKU
 v8Nj3VW9QoQTj4GF52Y1hy6PoICg4SskuDdHoCxxQjka+vA7au8T6nxja3l/l6HNcJdB
 mj6K7Y26kHMfik5cE8XmBaRiDrG1eMYC5Ndi95sF3AyyEIIocA8LSeM5SQOH5FVlntaP
 SMB8SDFywmDHYlWF5edtU27zZ2iqBSSkhm51HSGzUWCFzOhGBSwpf6tVE0hoqndEbBvS
 /T/kWNFVsyfAkSmaQy3E0b0ABiEolW+vC/9cF5HIt+Yt0GZlXBOJB1USD9lkYa1x9DHQ
 lMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Rt/XZbu6kOM9x2vXlY6ECOlA0Nw9mNr4Yr37/Rjkef8=;
 b=Q8knDgUFs0mPCYIreqpmvq3UXHWIIRPIHaYTHUpjL/hD6fRXPcnJtzbmUqzpzVDST/
 IRlFRXjxGyFFdyKfvXocb12qSeG3wZPlvWVXk04rEp1b89fL/CvzWzXxAp0VAsgaYOnu
 C1cfI4hRFtFOHTXS4rcG9nGzfYgiYiDmF+AWvXIKvbJ81NsNRKoz+L13vF1tyY2WH0Md
 xRwLPorWoprjYlMszULyJS0C6joN7x8YBByS31mtRvu5OWn6XTG+auzWh4ALZgKzMxvQ
 P8fqLrN006SerpXhz3NS63ftuGEpYXBPAWznx618XVWPGOfkI6hj/1rEVFPQDFEcOvSo
 yhkA==
X-Gm-Message-State: APjAAAV770bvuY/IzNbDOR63fy+JLx1u1prtI/PhArw4Tkn+oVTw4piv
 8l5PIRl9Z/pZvuBx64BBUP50Rw==
X-Google-Smtp-Source: APXvYqzES+9scXQSzH0kx6SYjNeXxv8Dp6tjcPCTNsdRGukpMT77edqnvIumCu6NUJtWNLXl86tZzw==
X-Received: by 2002:a17:902:20eb:: with SMTP id
 v40mr50560241plg.20.1553888734728; 
 Fri, 29 Mar 2019 12:45:34 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s5sm3781713pfm.184.2019.03.29.12.45.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 12:45:33 -0700 (PDT)
Date: Fri, 29 Mar 2019 12:45:33 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-edac@vger.kernel.org
Subject: Re: [PATCH 2/2] edac: sifive: Add EDAC driver for SiFive FU540-C000
 chip
In-Reply-To: <1553082728-9232-3-git-send-email-yash.shah@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1903291236060.6637@viisi.sifive.com>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
 <1553082728-9232-3-git-send-email-yash.shah@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_124535_705564_D42A3D65 
X-CRM114-Status: UNSURE (   9.80  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, james.morse@arm.com,
 paul.walmsley@sifive.com, bp@alien8.de, linux-riscv@lists.infradead.org,
 mchehab@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 20 Mar 2019, Yash Shah wrote:

> This EDAC driver supports:
> - Initial configuration reporting on bootup via debug logs
> - ECC event monitoring and reporting through the EDAC framework
> - ECC event injection
> 
> This driver is partially based on pnd2_edac.c and altera_edac.c
> 
> Initially L2 Cache controller is added as a subcomponent to
> this EDAC driver.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Based on the discussion with Borislav, we're going to move the L2 driver 
elsewhere in the tree.  We'll look into creating a platform-specific EDAC 
driver on top of that.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
