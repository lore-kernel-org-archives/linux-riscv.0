Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA25C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 11:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1267206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 11:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XIb3udWz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfaqbCRX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1267206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWoQ+IzgJXxeA3snGqtBRbd4OzZk8sq+2k2Gv/QhMVg=; b=XIb3udWzfQXTLC
	ZvcG/T7XH28MfbgQffdTEmUMlOzPTf8danChwQ4urIxJ0EYue7sey/wFObdGVxP7qKb6GgQww7X8B
	rJcb2G+WwTHRdRHuhhXwOTgSyzLurs1iYt/jWcv8XI2ZwGBmLM2Jc0Bc6qPkFYCTVnGT6x25vBjX5
	gXSEFBGuP8zZVR6ZFWkDdUvY4qbcMqZgS4Qka457D+dC27L/GRq8ruwbfKMLfKDkDvsxx/8zCSE52
	5OYYco7ic7n4TolmkCYzo6GZ9w32ujtGGzfRR05ALxEhNi3OpZrJmOYpaM9kWSP6I/giMiYW2BvNS
	9wFydCmJFg+lkbccHY+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggpHM-0002Tl-Qs; Tue, 08 Jan 2019 11:10:40 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggpHK-0002TM-E9
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 11:10:40 +0000
Received: by mail-pg1-x544.google.com with SMTP id s198so1604511pgs.2
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 03:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=e42acyZkHQ/RKHvKonSuJ3oOeal/c3QK1to9X5ezg2w=;
 b=GfaqbCRX7YuAwQ+Z7dN10mQyOMgTNGrxqZMYP2e/ML2ox5YKNOeWIHoING54g7d59q
 fciJNMDjGtvCieSv6iXG/PWrhKzVI/TgIooLMqmE/jZrcEVdh2m69m/yUmf84ObFB76g
 ADRRQvO7FkHLYuKD/0etnhjbezunK5r6hHGQEiCv6zy/QeOIpPknhGMuwTrY4x4vy4xJ
 voN9DNA31lG1H4Ki1K78YskSkQ+Ff978y4mDswzrdPRcFfnO2TM1Wnlm+JuOCOLk+mRi
 sBloDMyM0AbXiWHa3uglT2gWpU3aF1ZRqIHX5UnVduT/Sua/quv/qPjzWz0caHdI8pRD
 tgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e42acyZkHQ/RKHvKonSuJ3oOeal/c3QK1to9X5ezg2w=;
 b=CO3PvucEiwgxaZzg7ld0mboegMvqjencX1uCOpq6ZwbmpjH5v5xgZUwmiMDn0AynNe
 S795LeLJfgk0uBL/7/GZzBbVgNQs2jJRjUKFZxtIqajGrj+apwYqA3rK+oSbFO2MHROt
 WZ7cGmMp4bTMM+D/RUUD0owwVE6ZQ6ZPPdrmWFYFMHKo+Xh4V3C5dFvXI0yCVq9GYHTL
 sePV+4cttT8o68LrZFcoFfR2beupQb3/ccQT2qWOxbLo1+tc7h7U2JyHAXy2NEBpxQZI
 vACbQjYqB1pZlYApivY2+bYUWAlsgD+M9uRIUZ/kmaOb79Aghcyb6X+2wZTL6iStbusf
 jm7w==
X-Gm-Message-State: AJcUukeKi8wRsqQXkqfoyrqImNUOO68sYpH608s5ysj/0kxDc0kgK/pc
 XDM7DULbkPR3RpveULSLSEc=
X-Google-Smtp-Source: ALg8bN4g0ngLUTYrVMvbcz8rLu60b4T3FH/JyovhOu7G8+fWZcmFLuoSPYg1ZGJDsMj8HNuz9A1WDQ==
X-Received: by 2002:a65:514c:: with SMTP id g12mr1107264pgq.169.1546945835031; 
 Tue, 08 Jan 2019 03:10:35 -0800 (PST)
Received: from localhost (g206.124-44-15.ppp.wakwak.ne.jp. [124.44.15.206])
 by smtp.gmail.com with ESMTPSA id b9sm98180662pfi.118.2019.01.08.03.10.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 08 Jan 2019 03:10:34 -0800 (PST)
Date: Tue, 8 Jan 2019 20:10:32 +0900
From: Stafford Horne <shorne@gmail.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] arch: unexport asm/shmparam.h for all architectures
Message-ID: <20190108111032.GP3235@lianli.shorne-pla.net>
References: <1546904307-11124-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1546904307-11124-1-git-send-email-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_031038_673003_C2F6E4F4 
X-CRM114-Status: GOOD (  20.66  )
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 linux-arch@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-hexagon@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Jonas Bonn <jonas@southpole.se>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Greentime Hu <green.hu@gmail.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
 Richard Kuo <rkuo@codeaurora.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Masahiro,

On Tue, Jan 08, 2019 at 08:38:27AM +0900, Masahiro Yamada wrote:
> Most architectures do not export shmparam.h to user-space.
> 
>   $ find arch -name shmparam.h  | sort
>   arch/alpha/include/asm/shmparam.h
>   arch/arc/include/asm/shmparam.h
>   arch/arm64/include/asm/shmparam.h
>   arch/arm/include/asm/shmparam.h
>   arch/csky/include/asm/shmparam.h
>   arch/ia64/include/asm/shmparam.h
>   arch/mips/include/asm/shmparam.h
>   arch/nds32/include/asm/shmparam.h
>   arch/nios2/include/asm/shmparam.h
>   arch/parisc/include/asm/shmparam.h
>   arch/powerpc/include/asm/shmparam.h
>   arch/s390/include/asm/shmparam.h
>   arch/sh/include/asm/shmparam.h
>   arch/sparc/include/asm/shmparam.h
>   arch/x86/include/asm/shmparam.h
>   arch/xtensa/include/asm/shmparam.h
> 
> Strangely, some users of the asm-generic wrapper export shmparam.h
> 
>   $ git grep 'generic-y += shmparam.h'
>   arch/c6x/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/h8300/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/hexagon/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/m68k/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/microblaze/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/openrisc/include/uapi/asm/Kbuild:generic-y += shmparam.h
>   arch/riscv/include/asm/Kbuild:generic-y += shmparam.h
>   arch/unicore32/include/uapi/asm/Kbuild:generic-y += shmparam.h
> 
> The newly added riscv correctly creates the asm-generic wrapper
> in the kernel space, but the others (c6x, h8300, hexagon, m68k,
> microblaze, openrisc, unicore32) create the one in the uapi directory.
> 
> Digging into the git history, now I guess fcc8487d477a ("uapi:
> export all headers under uapi directories") was the misconversion.
> Prior to that commit, no architecture exported to shmparam.h
> As its commit description said, that commit exported shmparam.h
> for c6x, h8300, hexagon, m68k, openrisc, unicore32.
> 
> 83f0124ad81e ("microblaze: remove asm-generic wrapper headers")
> accidentally exported shmparam.h for microblaze.
> 
> This commit unexports shmparam.h for those architectures.
> 
> There is no more reason to export include/uapi/asm-generic/shmparam.h,
> so it has been moved to include/asm-generic/shmparam.h
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  arch/c6x/include/asm/Kbuild               | 1 +
>  arch/c6x/include/uapi/asm/Kbuild          | 1 -
>  arch/h8300/include/asm/Kbuild             | 1 +
>  arch/h8300/include/uapi/asm/Kbuild        | 1 -
>  arch/hexagon/include/asm/Kbuild           | 1 +
>  arch/hexagon/include/uapi/asm/Kbuild      | 1 -
>  arch/m68k/include/asm/Kbuild              | 1 +
>  arch/m68k/include/uapi/asm/Kbuild         | 1 -
>  arch/microblaze/include/asm/Kbuild        | 1 +
>  arch/microblaze/include/uapi/asm/Kbuild   | 1 -
>  arch/openrisc/include/asm/Kbuild          | 1 +
>  arch/openrisc/include/uapi/asm/Kbuild     | 1 -
>  arch/unicore32/include/asm/Kbuild         | 1 +
>  arch/unicore32/include/uapi/asm/Kbuild    | 1 -
>  include/{uapi => }/asm-generic/shmparam.h | 0
>  15 files changed, 7 insertions(+), 7 deletions(-)
>  rename include/{uapi => }/asm-generic/shmparam.h (100%)
> 

[...]

> diff --git a/arch/openrisc/include/asm/Kbuild b/arch/openrisc/include/asm/Kbuild
> index eb87cd8..1f04844b 100644
> --- a/arch/openrisc/include/asm/Kbuild
> +++ b/arch/openrisc/include/asm/Kbuild
> @@ -34,6 +34,7 @@ generic-y += qrwlock_types.h
>  generic-y += qrwlock.h
>  generic-y += sections.h
>  generic-y += segment.h
> +generic-y += shmparam.h
>  generic-y += string.h
>  generic-y += switch_to.h
>  generic-y += topology.h
> diff --git a/arch/openrisc/include/uapi/asm/Kbuild b/arch/openrisc/include/uapi/asm/Kbuild
> index 6c6f630..0febf1a 100644
> --- a/arch/openrisc/include/uapi/asm/Kbuild
> +++ b/arch/openrisc/include/uapi/asm/Kbuild
> @@ -1,5 +1,4 @@
>  include include/uapi/asm-generic/Kbuild.asm
>  
>  generic-y += kvm_para.h
> -generic-y += shmparam.h
>  generic-y += ucontext.h

What is this patch based on?  I tried to apply it to 5.0-rc1 and am having an
issue with applying the arch/openrisc/include/uapi/asm/Kbuild part.

    $ ~/work/bin/am-incoming PATCH_arch_unexport_asm-shmparam.h_for_all_architectures.patch
    Applying: arch: unexport asm/shmparam.h for all architectures
    error: patch failed: arch/c6x/include/uapi/asm/Kbuild:1
    error: arch/c6x/include/uapi/asm/Kbuild: patch does not apply
    error: patch failed: arch/h8300/include/uapi/asm/Kbuild:1
    error: arch/h8300/include/uapi/asm/Kbuild: patch does not apply
    error: patch failed: arch/hexagon/include/uapi/asm/Kbuild:1
    error: arch/hexagon/include/uapi/asm/Kbuild: patch does not apply
    error: patch failed: arch/m68k/include/uapi/asm/Kbuild:2
    error: arch/m68k/include/uapi/asm/Kbuild: patch does not apply
    error: patch failed: arch/microblaze/include/uapi/asm/Kbuild:2
    error: arch/microblaze/include/uapi/asm/Kbuild: patch does not apply
    error: patch failed: arch/openrisc/include/uapi/asm/Kbuild:1
    error: arch/openrisc/include/uapi/asm/Kbuild: patch does not apply
    error: patch failed: arch/unicore32/include/uapi/asm/Kbuild:1
    error: arch/unicore32/include/uapi/asm/Kbuild: patch does not apply
    Patch failed at 0001 arch: unexport asm/shmparam.h for all architectures
    hint: Use 'git am --show-current-patch' to see the failed patch

It seems shmparam.h is not there. It was removed with the others in your
("d6e4b3e326d8") arch: remove redundant UAPI generic-y defines, commit a few
days ago.

Note, I can't compile 5.0-rc1 without the first part of this patch.  So please
get it merged asap :)

-Stafford

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
