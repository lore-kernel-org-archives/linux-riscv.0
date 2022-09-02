Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52272ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 06:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3quCa3ZUZ5kfwqLKKn2Hyx9l+ycraSRHUUTXw0u/oNE=; b=PXCQNW6sFElpDx
	xhf5fALvq92JoNzEau20yy8RuNHk80QQ8MV9d6hb097d6JGvZHiQH3vdUqfnYI0oB5thNL5TSNNWK
	Q+d8pSck/8qqvSUN8W37/PPPxodITTX0HVDQvF9tVb9T4mqFdIkDUtcseFiFnQhBq29oJAiiVxUsA
	kjzHhpOYXzquctZfCcOQm4mcBUqpaL4EXODAXV/kGM04/9V+s0wVEuB0FY49BLJdbcSfFiME8IneD
	rbwj2G7ygG+3dTzGTe3DESuE2bK1yKIqhEHVRvIWLQV9yXpbEqWGRr0079TnCzipELte5p8af89cE
	kfJyp8bFPi8Ul5v42V/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0Ku-000vjP-KD; Fri, 02 Sep 2022 06:39:28 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0Kr-000vf0-B8
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 06:39:27 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4MJpD54Jttz1r15N;
	Fri,  2 Sep 2022 08:39:17 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4MJpD53GS6z1qqkC;
	Fri,  2 Sep 2022 08:39:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id Sef0ko3gxhRw; Fri,  2 Sep 2022 08:39:16 +0200 (CEST)
X-Auth-Info: oqfMksGozr0Ew85y9l0IJ8Pp8UXk4RhvS2YX8qqobOSQ2HiH0cyiSs7jXXM0ZiS8
Received: from tiger.home (ppp-46-244-171-115.dynamic.mnet-online.de [46.244.171.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri,  2 Sep 2022 08:39:16 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
	id D553D1158EF; Fri,  2 Sep 2022 08:39:15 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Add support for Ztso
References: <20220902034352.8825-1-palmer@rivosinc.com>
X-Yow: It's strange, but I'm only TRULY ALIVE when I'm covered in POLKA DOTS
 and TACO SAUCE...
Date: Fri, 02 Sep 2022 08:39:15 +0200
In-Reply-To: <20220902034352.8825-1-palmer@rivosinc.com> (Palmer Dabbelt's
	message of "Thu, 1 Sep 2022 20:43:52 -0700")
Message-ID: <87ler21drg.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_233925_569183_70993363 
X-CRM114-Status: GOOD (  14.82  )
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

On Sep 01 2022, Palmer Dabbelt wrote:

> @@ -31,10 +32,23 @@
>  #define ELF_DATA	ELFDATA2LSB
>  
>  /*
> - * This is used to ensure we don't load something for the wrong architecture.
> + * Binaries that assume TSO cannot be correctly run on non-TSO systems, so
> + * prevent them from even being loaded.
> + */
> +#define EF_RISCV_TSO	0x0010

That should probably be defined in <asm/elf.h>.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
