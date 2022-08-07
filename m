Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B01C19F2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Aug 2022 19:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IoUR/MZSEBSLnaHD8NNRxrW7XDI2lEI1bKtzTKnHzGY=; b=t5ZEVqohOkGKj8
	H/y/xrCVih6qdYfTM2mXZkLS46v78v1TlnR3ivu3tyyZxsOrIPmywvtrIm4z+2P1Ot5F56H57a1vz
	p8kuLnPT6guLEIi2KGFbRvzTrpS9XFlI+ogvL1ObCrIKTSmJH47Spgbolr8x8sj6u85Lju/CQogAo
	q0HOpOTDfvp9rQ0/NqYWAGzN+Lr6L+QikvxIxvJMBUSZutcEXJBrRH//zQcNavDSFxmObZ62ubPjz
	DnPFIIq8rJXB1zuRcwrNxQyFFhkLYVDGFgBlcBAJObvcVqqZlswoZNX6pYOyeaAxK5cf9CvPoOg3u
	w2eLjgIYL/9srt7EqSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKmDx-001sda-Gi; Sun, 07 Aug 2022 19:46:09 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKmDu-001sXu-Bn
	for linux-riscv@lists.infradead.org; Sun, 07 Aug 2022 19:46:07 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MqbDs-1nYXAh1ffc-00mYnL for <linux-riscv@lists.infradead.org>; Sun, 07 Aug
 2022 21:40:59 +0200
Received: by mail-wr1-f49.google.com with SMTP id bv3so8723543wrb.5
        for <linux-riscv@lists.infradead.org>; Sun, 07 Aug 2022 12:40:56 -0700 (PDT)
X-Gm-Message-State: ACgBeo1UzK2J29C/FKkEKPuGA5sxa8FC24U2iKS1kIdbqIiryklfJNAy
	hdHw06xy8GcWeX6Nzy/BuTCt/YmyMGn3hj8uAfE=
X-Google-Smtp-Source: AA6agR6hxd+c6uxIaU58pn/ju2/Kpl1hrPDOtejwBjDN9MsDwixXKlT0pf81lWjwhwXW39QULBi5Dg6hl/EgSri8ztI=
X-Received: by 2002:a05:6000:18a2:b0:221:7d32:e6a5 with SMTP id
 b2-20020a05600018a200b002217d32e6a5mr5774325wri.278.1659901256671; Sun, 07
 Aug 2022 12:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220807172839.12359-1-rdunlap@infradead.org>
In-Reply-To: <20220807172839.12359-1-rdunlap@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 7 Aug 2022 21:40:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0s0y9jbw4EFsLM2-unSNuHfqoVcuq_NuO9fTsjN4cWiQ@mail.gmail.com>
Message-ID: <CAK8P3a0s0y9jbw4EFsLM2-unSNuHfqoVcuq_NuO9fTsjN4cWiQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: compat: make __ARCH_WANT_COMPAT_FADVISE64_64 conditional
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
X-Provags-ID: V03:K1:ibc+Tkl8vJhyJ5XY+4ME5BX7/xfsb3v+lKlu1zCE7p1ZOzcoeTW
 KadU27qecfTdOpnjNBApsWdt9NqFW+HGiPg+hKqD8TEuyeVlKzqJezv3seck7K3Zov4fwTa
 A46vdmE7u80Dz89qrFVzubIbO3wgfxJ7AfsNyNP4aGlC5aJtjx1YDLydXqxTANLWbSRivkp
 U59MlBWh071pt84GOBeAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j/tCUiN2ghk=:EGtun8yNf425RYQ9jBzcHW
 Ju6ES9rEkmy8kSgcOijLCEiSjpgmJ8zk7TKopRbqTzaFn2zh5ks0P68HVcM3RKZJ7ir9no7w+
 1XK7nIkL4b4JhkJQ/GogGDTtLe8VQ4MhlDAhud6EWG1PRt8tkEZHSs1r/mlR1GgYw5MpgTkW9
 RMsxpUIkEcEw1WiMacH0WF/+3kDbBTsXfoE2Mt1RL7Ns4Qu7/tls2sFNhdYvqGTr4kCns8TkE
 Jg6gf3XZ4tMb6l36zqLf5+F654/cAA4UDj8q7LYQ3xiRqqT/B27zx3RXP6BY/GCEuRitEYJzM
 Lcq03jcX+YE5fQf+KzzamBY/CtWSIIAK0fGqxKoN0UsXlGiRsfR6p9+bgSOsLZx7CfIlJpi9D
 1uJPUjms98TWB5OFnQyQAbcyPC+O2ZHIB4YbkdY4tMQQjPHuDcqAWx6rHs/9oXe2d1Vp0D8b6
 zgvPaYxOqpI0ity0mtb0HBMLoISYe6B8m6/btFRasW3+wcBWU90O1WNzBW5XoI6AdG9Hr6H+y
 5pF5W6Y6tW9U3q/rKTk+kgz3ju2V4OpbvsLedF280ek7sioofyiNjureq7e0+KGD8WCEiQbXQ
 8yDyzoq9upal1zaCIdYyfp1YYQ7oauz1zcZOsc5erVdjEjGT9dGOvP4rAuka5BKHfXxqTDeUE
 FSysoc5/Bx18Slbg2lO8SkqAXO3LOJxgU7x7uoOzXJ9Gcka9sesaUkOmtjvr8yG592L4NTECd
 MjiNAGEUd6WJd4uqtlt74pHqhCyDj1pzx6GOTA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_124606_751313_804383E0 
X-CRM114-Status: GOOD (  14.87  )
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

On Sun, Aug 7, 2022 at 7:28 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> When CONFIG_ADVISE_SYSCALLS is not set/enabled and CONFIG_COMPAT is
> set/enabled, the riscv compat_syscall_table references
> 'compat_sys_fadvise64_64', which is not defined:
>
> riscv64-linux-ld: arch/riscv/kernel/compat_syscall_table.o:(.rodata+0x6f8):
> undefined reference to `compat_sys_fadvise64_64'
>
> Only set __ARCH_WANT_COMPAT_FADVISE64_64 when CONFIG_ADVISE_SYSCALLS
> is set.
>
> Fixes: 59c10c52f573 ("riscv: compat: syscall: Add compat_sys_call_table implementation")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/include/asm/unistd.h |    2 ++
>  1 file changed, 2 insertions(+)
>
> --- a/arch/riscv/include/asm/unistd.h
> +++ b/arch/riscv/include/asm/unistd.h
> @@ -18,8 +18,10 @@
>  #define __ARCH_WANT_COMPAT_PWRITE64
>  #define __ARCH_WANT_COMPAT_SYNC_FILE_RANGE
>  #define __ARCH_WANT_COMPAT_READAHEAD
> +#ifdef CONFIG_ADVISE_SYSCALLS
>  #define __ARCH_WANT_COMPAT_FADVISE64_64
>  #endif
> +#endif

I think it's better to add this to kernel/sys_ni.c next to
COND_SYSCALL(fadvise64_64), to make it more consistent
with the other conditionally enabled syscalls.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
