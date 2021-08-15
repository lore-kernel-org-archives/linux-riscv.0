Return-Path: <SRS0=ocBP=NG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6D6C4338F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Aug 2021 06:52:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25DE160F11
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Aug 2021 06:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25DE160F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpmWIqPZpb53RnOHb+F5xXe30rrOlVbhgDvQaeYV6wQ=; b=lOExzRy/HY6OQa
	3qjgGMQb0c/GYJM0MVcNrXhHaR5KuKWzlAwKVGMVeYV5v4Jy42X6tMvTc1nyOMmieBHRg/NEkiI07
	U/nOrLsT+PZz1NG7T8Em/U9m/dV/fpu9duXYKU3+TsjACsC5jLlf1gmzAFAdy5vFtBymcQG/rfTpb
	0PGKY7zqsNNsNB0M+Y4+qnkMaI/JcTMj/zW88Ujf6rSsB5aj/GTDV/EMOIXZk2QRmG3I5HeHF/yqX
	7FORR9So4gAlMq3oMrPuXKBXqjsbJTRcK2ZHlTEFhQU9QyHfmTirWr6S+fUU/rKAaIPDHvsxM0vgq
	+EXx/nE+8ZR/+Vn5zSrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mF9zj-00ExXs-Eg; Sun, 15 Aug 2021 06:51:43 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mF9zT-00ExXV-1G
 for linux-riscv@lists.infradead.org; Sun, 15 Aug 2021 06:51:29 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4GnScm1Dk2z1qwGb;
 Sun, 15 Aug 2021 08:51:20 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4GnScl6phrz1qqkg;
 Sun, 15 Aug 2021 08:51:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id hHSQV9_8Ah4W; Sun, 15 Aug 2021 08:51:18 +0200 (CEST)
X-Auth-Info: GWNgGf1u5wZ3SJAJGg4o0/Ef+Whqz2y6LrK66NNI+d1HWkCmWlUNECf3gZjZXuRE
Received: from tiger.home (ppp-46-244-191-201.dynamic.mnet-online.de
 [46.244.191.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 15 Aug 2021 08:51:18 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
 id 286DA5153E; Sun, 15 Aug 2021 08:51:18 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Guenter Roeck <linux@roeck-us.net>,  Geert
 Uytterhoeven <geert@linux-m68k.org>,  Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
 Albert Ou <aou@eecs.berkeley.edu>,  linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] riscv: __asm_copy_to-from_user: Improve using word
 copy if size < 9*SZREG
References: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
 <e3e9fb3a-40b1-50f3-23cc-50bfa53baa8d@gmail.com>
X-Yow: ..Am I in a SOAP OPERA??
Date: Sun, 15 Aug 2021 08:51:18 +0200
In-Reply-To: <e3e9fb3a-40b1-50f3-23cc-50bfa53baa8d@gmail.com> (Akira
 Tsukamoto's message of "Fri, 30 Jul 2021 22:52:44 +0900")
Message-ID: <87bl5z42vt.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210814_235127_272503_4504DE73 
X-CRM114-Status: GOOD (  11.25  )
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

On Jul 30 2021, Akira Tsukamoto wrote:

>  .Lword_copy:
> -        /*
> -	 * Both src and dst are aligned, unrolled word copy
> +	/*
> +	 * Both src and dst are aligned
> +	 * None unrolled word copy with every 1*SZREG iteration
> +	 *
> +	 * a0 - start of aligned dst
> +	 * a1 - start of aligned src
> +	 * t0 - end of aligned dst
> +	 */
> +	bgeu	a0, t0, .Lbyte_copy_tail /* check if end of copy */
> +	addi	t0, t0, -(SZREG) /* not to over run */
> +1:
> +	REG_L	a5, 0(a1)
> +	addi	a1, a1, SZREG
> +	REG_S	a5, 0(a0)
> +	addi	a0, a0, SZREG
> +	bltu	a0, t0, 1b

This is missing fixups.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
