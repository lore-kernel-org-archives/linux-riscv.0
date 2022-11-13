Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F205BC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 00:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1EerDXaHDsV1gIoHC2YVX++tZaZ5kATA/1V53L8fjw=; b=d8ZIfiWgGvkVKY
	zk6yrRn1L9C1tBJ+ObT0PcfVIQN86q42BlWwhrFq3QemdpEOGXDjxno2NQRF3tboD9+k/gnSd9QVw
	+g+VgjxmXCAIDIUov02udQu95OBRhcIMVnc5T3sPjVBkHeHrk1fZHP6ASs9esOVXPfTFwrPnePl9w
	liZ2y6xZN3IjRC3upu90YycjDVACWKgqF/dzXQkxs7rL4NX2Pk21unO6teMBei26MQDX8G+m5najT
	0BWZEfMuQz1dsNjXyNwqhrrHCD69kb84xO3nuytgfvot8Ouda0NXAA4jaCiwAW0ovFgz3hYKuhePc
	cgTNwaUE9muWD74wAP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ou0dF-008Wz9-Kb; Sun, 13 Nov 2022 00:13:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ou0dD-008WyL-Lp
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 00:13:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9BAB9B80B8E;
	Sun, 13 Nov 2022 00:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD44C433D6;
	Sun, 13 Nov 2022 00:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668298425;
	bh=AYKKSk+NIzy1pXYiJWh3WgsPRSax5Zh0r58tPDd7JT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvkR3HZthwx5ePtGifqfxyEv01o6VqM6J4nlSVLn9hR2iQB7LNIXAMldT28UJNyPJ
	 +ZMurj53ypsyPph0FjgnVaFEtk9verpMLJ7PesL5ZeUN4Ae71QKIo5nKN9y64qyl53
	 W6tGwTYYecE4+mqEpoLFp0ld/UXA7Io7nvy48fVAn6vA4j2EitBMg8O2qnw4oepoDg
	 qp8THvwtisVsDKjdqkmortY/JbWMRgthsBdAtf9SSSsZ8ln5gWVzGAURVQxcsm5OmC
	 eJJtRMwnvdPYwqeIf9+stzEmG/phD3uKwEA4Rw4QELpGvD0pFqhvIWakW+AusBmZmR
	 IvDB7YanULmxg==
Date: Sun, 13 Nov 2022 00:13:40 +0000
From: Conor Dooley <conor@kernel.org>
To: debug@rivosinc.com
Cc: palmer@dabbelt.com, jan.kiszka@siemens.com, kbingham@kernel.org,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux@rivosinc.com
Subject: Re: [PATCH] gdb-script: updated lx_current for riscv
Message-ID: <Y3A2tPFbqcf1DPr5@spud>
References: <20221111195938.1499148-1-debug@rivosinc.com>
 <20221111195938.1499148-2-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111195938.1499148-2-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_161351_871697_20935DF3 
X-CRM114-Status: GOOD (  16.61  )
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

On Fri, Nov 11, 2022 at 11:59:38AM -0800, debug@rivosinc.com wrote:
> From: Deepak Gupta <debug@rivosinc.com>
> 
> lx_current python gdb command defined in scripts/gdb/cpus.py updated
> to support riscv architecture.

The commit which added support for arm64 gave an explanation of why
SP_EL0 needed to be checked. Would be nice if you could do the same here
for RISC-V. See 526940e39626 ("scripts/gdb: add lx_current support for
arm64") for what I mean.

While you're at it, "scripts/gdb: add support for RISC-V" would appear
to be a more standard $subject for this file.

Thanks,
Conor.

> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  scripts/gdb/linux/cpus.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
> index 15fc4626d236..ce6703f1e35a 100644
> --- a/scripts/gdb/linux/cpus.py
> +++ b/scripts/gdb/linux/cpus.py
> @@ -173,6 +173,14 @@ def get_current_task(cpu):
>           else:
>               raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
>                                  "while running in userspace(EL0)")
> +    elif utils.is_target_arch("riscv"):
> +         current_task_addr = gdb.parse_and_eval("$tp")
> +         if((current_task_addr.cast(utils.get_long_type()) >> 63) != 0):
> +             current_task = current_task_addr.cast(task_ptr_type)
> +             return current_task.dereference()
> +         else:
> +             raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
> +                                "while running in userspace")
>      else:
>          raise gdb.GdbError("Sorry, obtaining the current task is not yet "
>                             "supported with this arch")
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
