Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB28C004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 20:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mY0+rUvTKbJE1vmnvgWwyINkCgsfsrTkDJGt7jJ9Qk=; b=ZJ+LtVIRlh+4m1
	Ab51ALSpjOoHiS/3IvYYB3QKz9LZ5xoePUfE3MKxU2v6ws0AzZzCNMCj4c2/X5fTbQsSqn67SAo9e
	DcG5SJXMDm9bslprgRBg2n2OIX6A1l7w83SZocQE8BbDE7ViqpOFSrtAXRc8e959W+C9niSBqow3o
	2f4YTUjXpbmLUckZzfsRkHg4qOG5m5AC1xcWzWpJM2Vs12br7Ckxwr21ZFB/spUCtyEtflGONLjpR
	Iaj1EPpGfUzLdb3pMNDplrxpDZA3KCgVtZj/FQimCCDXKIoAsymH9t/RUF2zrrzZNZrgDmeLKoDzz
	tkmzPMpgd+H8ohSgM3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIbLC-0078nw-I5; Thu, 19 Jan 2023 20:16:54 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIbL8-0078mc-4t
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 20:16:52 +0000
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4NyYn33dDbz1s94n;
	Thu, 19 Jan 2023 21:16:38 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4NyYn25m5Vz1qqlR;
	Thu, 19 Jan 2023 21:16:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id wb-cqOhkGPAT; Thu, 19 Jan 2023 21:16:38 +0100 (CET)
X-Auth-Info: IXHkc3Ba7nNgiodK3CVF4LFJxdQQkphB72YBcJ8c0cF9qslj1MLi4prwWin+a8zU
Received: from igel.home (aftr-82-135-86-211.dynamic.mnet-online.de [82.135.86.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 19 Jan 2023 21:16:38 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 9E1DB2C13D8; Thu, 19 Jan 2023 21:16:37 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,  Alistair Francis
 <Alistair.Francis@wdc.com>,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: uapi: Lie about having futex()
References: <20230119193924.21186-1-palmer@rivosinc.com>
X-Yow: NOW, I'm supposed to SCRAMBLE two, and HOLD th' MAYO!!
Date: Thu, 19 Jan 2023 21:16:37 +0100
In-Reply-To: <20230119193924.21186-1-palmer@rivosinc.com> (Palmer Dabbelt's
	message of "Thu, 19 Jan 2023 11:39:24 -0800")
Message-ID: <87pmbai8ka.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_121650_377993_9EBEB100 
X-CRM114-Status: GOOD (  12.00  )
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

On Jan 19 2023, Palmer Dabbelt wrote:

> diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
> index 221630bdbd07..26116686690a 100644
> --- a/arch/riscv/include/asm/unistd.h
> +++ b/arch/riscv/include/asm/unistd.h
> @@ -24,3 +24,11 @@
>  #include <uapi/asm/unistd.h>
>  
>  #define NR_syscalls (__NR_syscalls)
> +
> +/*
> + * Userspace (at least libstdc++) has come to expect SYS_futex, but we only
> + * have SYS_futex_time64 on rv32.  So just lie.
> + */
> +#ifndef __LP64__
> +#define __NR_futex __NR_futex_time64
> +#endif

This is not a uapi file, so why does this have any influence on
libstdc++?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
