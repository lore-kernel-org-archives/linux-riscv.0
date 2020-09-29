Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F510C4727C
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 18:52:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48EAB2075E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 18:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v+/Aib2c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.b="LYrI13lQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48EAB2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aurel32.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4O/ZmIR3/6wNYcDcYTDhIpHj4uxiy1CRVqyIgQZK8FY=; b=v+/Aib2c3PZBavzUVjpeKk53J
	zk/4+dhynaZhcBsWxOqm2NqsjQXsmH+DSoDZLQIheFQra/vdw5X8oJiezK/Rv93tzcXdU4H/l2dvZ
	/T6GqihCzZp2g2kZ22liJJdNXC62pVMJ+NMoYxej/gGJWa4/SLaWBZHB9Qfdr3e9YtWzgmoAlqVT6
	fwbF8rC8HLK54KXPChQweQ5T5X5YmO6dmCOImxSujfmy+H/uQsRUp8idXA0vRhMQqZnUC+y/O9xtA
	dbHTP7q4GErwoF7T01zVklVKjh2kuScT9VA/U5bFcqkSGOftxt5VSyjK6STGDRm1z/CflYAWM5cXG
	uzSIBzj5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNKjD-0008SB-Tr; Tue, 29 Sep 2020 18:51:55 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNKjC-0008QU-GP
 for linux-riscv@lists.infradead.org; Tue, 29 Sep 2020 18:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=4oPHUpydHQHVg7N/DiTg/2k5w4HoApzrMoMKz556bOk=; b=LYrI13lQzAkLkQtkFjsnhoaIto
 +1o1p738YrPZINi8UpfLvfRYPfu9YXt/TWANnemzsu/WSbVsODTgNC/ARyLKp/gLoIW2mMZcjbv3h
 xuq8plU4wHnSGvLKW7Na6oePETtve74DhVmSH1azo2sOAD20v1lKUPSjlfwiZTCV4h428O7imIpgq
 Snj2dEUyADwX3v8TK2TE3RW9aKAlgwp0u6u7LrqL0g3WUhu28JHW/wN0OwOFJb3Vw1LrEIoySZeWm
 pL3Vh556nV4bXwDnWg55LQ2iKoMUCR+NdXDfzufhACNgLNiyB5lv78YOlT6Ir/QgO5WLarIidRO86
 Tg+BbfCw==;
Received: from [2a01:e35:2fdd:a4e1:fe91:fc89:bc43:b814] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <aurelien@aurel32.net>)
 id 1kNKio-0004jI-HC; Tue, 29 Sep 2020 20:51:30 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.94)
 (envelope-from <aurelien@aurel32.net>)
 id 1kNKil-000oKY-UZ; Tue, 29 Sep 2020 20:51:27 +0200
Date: Tue, 29 Sep 2020 20:51:27 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH V2 1/3] riscv: Fixup static_obj() fail
Message-ID: <20200929185127.GC2705@aurel32.net>
Mail-Followup-To: Guo Ren <guoren@kernel.org>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Tycho Andersen <tycho@tycho.ws>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
References: <1593266228-61125-1-git-send-email-guoren@kernel.org>
 <1593266228-61125-2-git-send-email-guoren@kernel.org>
 <20200911204512.GA2705@aurel32.net>
 <CAJF2gTQiLV8sDE5cnvP=aBog4zaiMvMeieg_JtXwRODky1u3Hg@mail.gmail.com>
 <20200914103836.GB2705@aurel32.net> <87lfgzeidk.fsf@igel.home>
 <CAJF2gTQ8ONde3GRhQgx2Nqvb5X20nTmW8jZEemZKhezRDzP3aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQ8ONde3GRhQgx2Nqvb5X20nTmW8jZEemZKhezRDzP3aQ@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_145154_553153_195F066B 
X-CRM114-Status: GOOD (  15.05  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Tycho Andersen <tycho@tycho.ws>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Andreas Schwab <schwab@linux-m68k.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On 2020-09-25 00:19, Guo Ren wrote:
> How about this, revert the commit and don't free INIT_DATA_SECTION. I
> think the solution is safe enough, but wast a little memory.
> 
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index f3586e3..34d00d9 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -22,13 +22,11 @@ SECTIONS
>         /* Beginning of code and text segment */
>         . = LOAD_OFFSET;
>         _start = .;
> -       _stext = .;
>         HEAD_TEXT_SECTION
>         . = ALIGN(PAGE_SIZE);
> 
>         __init_begin = .;
>         INIT_TEXT_SECTION(PAGE_SIZE)
> -       INIT_DATA_SECTION(16)
>         . = ALIGN(8);
>         __soc_early_init_table : {
>                 __soc_early_init_table_start = .;
> @@ -55,6 +53,7 @@ SECTIONS
>         . = ALIGN(SECTION_ALIGN);
>         .text : {
>                 _text = .;
> +               _stext = .;
>                 TEXT_TEXT
>                 SCHED_TEXT
>                 CPUIDLE_TEXT
> @@ -67,6 +66,8 @@ SECTIONS
>                 _etext = .;
>         }
> 
> +       INIT_DATA_SECTION(16)
> +
>         /* Start of data section */
>         _sdata = .;
>         RO_DATA(SECTION_ALIGN)
> 

This patch doesn't apply, as tabs have been converted to space
somewhere. After fixing that, the patch applies and I confirm that it
fixes the problem.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks,
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
