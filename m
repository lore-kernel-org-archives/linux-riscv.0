Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8DDC32771
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Sep 2022 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Faf9wcrd4L0Pi7RKa51npuX5xeHQOalFNKrJ6FyDA3A=; b=h2KUNwQDNw3NqU
	5PyaHAmXlRbPrhx5DoAPjC8KUI4VlGnfw6asB1y3wLBh+OZ7UCmNdWz+ZUx5OC5f5A5JdvoLkvkhw
	yqvYJe+nKE45PP2WzyZ5qYHe0Lw5AuNPsF8FqsXzLnMeyC/rHHZT+rED0ke7USM/K6Evh7waO/vs+
	7xhiyy1VB+8oCFlMgc/E4jvrdYPbs/XmwxbdkDYHlC6a/TFpQnbS2KP+CxEfzOzNk7Ta0mjn5Sqkr
	RBLUJbBWQCqQMeV+PqSl5vQ48SlrHLh2Qd1ZsLdv2QjjXbUA02bgwELdamaG8IWtIOGruUeu7TWwI
	wibOSwMVaCr1i2sUIl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc210-006rQp-Nk; Sat, 24 Sep 2022 10:04:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oc20x-006rQL-On
	for linux-riscv@lists.infradead.org; Sat, 24 Sep 2022 10:04:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BFC9AB80D66;
	Sat, 24 Sep 2022 10:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1B1C433C1;
	Sat, 24 Sep 2022 10:03:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GAcezBHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1664013836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a9JKvNfMZC+9JMsrSUN2BczD7g/dtJVoQc+v0cTKcIE=;
	b=GAcezBHdWzjukX1/2mV8/lDIG4AKv15O36FaFqFU4bSMiTMXw6dxTk5nCFGrEG1EVi2738
	mvEw8AZwG9u15qiWkTJnQ4mkYpAxCrcpJaG5pBxSjQYmaK88p4MP3HB2K+hYpjqK7v9snz
	3AVd7gXKR0vQwEsqhjPiKCCRh1wHBdc=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fe516d92 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sat, 24 Sep 2022 10:03:55 +0000 (UTC)
Date: Sat, 24 Sep 2022 12:03:52 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com, geert@linux-mk68.org,
	heiko@sntech.de, kernel@esmil.dk, arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [RFC 20/27] wireguard: selftests: swap SOC_VIRT for ARCH_VIRT on
 riscv
Message-ID: <Yy7WCIG6oLY6FGfR@zx2c4.com>
References: <20220923185605.1900083-1-conor@kernel.org>
 <20220923185605.1900083-21-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220923185605.1900083-21-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220924_030404_375316_3C402DDE 
X-CRM114-Status: GOOD (  10.64  )
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

On Fri, Sep 23, 2022 at 07:55:59PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> At LPC we decided to convert all of the SOC_ symbols in arch/riscv to
> ARCH_ for consistency between "incumbent" vendors and those with a
> legacy from other architectures. To that end, swap SOC_VIRT for
> ARCH_VIRT.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
