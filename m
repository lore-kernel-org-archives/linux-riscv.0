Return-Path: <SRS0=3so1=5D=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA0BC4332B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2020 22:33:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D02622076F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2020 22:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KO0IRLIz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="lK+CL3UM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D02622076F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=F5zebNP9kTqHIu/0Terc4yamaRvQ0W93SS8xYmU0vGU=; b=KO0IRLIzd8h1NA
	193OFJJ5nJn0Lo/KAzimHaNoqXkgtEsb/KkTEamDBFmx04q7n5zo6PhkdE9Li+R2eIpXgpe/K4aLw
	GXmJWCjG2bhG9Hqdi7RIGCPR3nUJZMnh+y2aN3Ry7zNDx01Onr2zvgYbTrayp/1QbH7hJ1/f/ZKDR
	9jMTk3SB1dVUFX0Xf4iYHSAndcgtKzlUtYU7AfXbO+1rd2rOEkE9Xb1dQF6G+OVHg0c3sn75A/+pQ
	zERDr0onxNyIpnbdsMtnkXw+CTMNKMmTPzZ06KbexLxms6T/pF3czexy8Z7IhR1I21Ayk7Lx2F0ZG
	f4ySeZaVdC+eNk33VMJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEhFG-0002aY-RY; Wed, 18 Mar 2020 22:33:02 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEhFD-0002a7-Ic
 for linux-riscv@lists.infradead.org; Wed, 18 Mar 2020 22:33:00 +0000
Received: by mail-pj1-x1044.google.com with SMTP id hg10so72652pjb.1
 for <linux-riscv@lists.infradead.org>; Wed, 18 Mar 2020 15:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=F5zebNP9kTqHIu/0Terc4yamaRvQ0W93SS8xYmU0vGU=;
 b=lK+CL3UMEg9Nj6fYZoXjOccvy17j5ePETx27dMGk7jtZRQuMIt1MrHbrMNiH72BFHO
 C4bzNetijMUpQY81CIQBUdQaXgmlvE+wVQk/Ed+WAwW2NtDRlRxJzr+mgE1VownacnPX
 I8JQojzwyAzSJ7PCi4D/N8sgeVwoQV4aE7VKDO9e2t1i1/d2tMjdweX4GvqIcoDyx7Up
 4V2ZnjezjKojb5MBqJoWH4+AFM3INI/Bh1op1V9TNFzn8es9EDz0zTB38uVGg/HzWBc4
 RELsJr2b91rkh4dsCN4x3bEJJuKAkA6H7nxTYCYydrQo0pBGSqSLWIpO+5uBjIxK1ICj
 fE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=F5zebNP9kTqHIu/0Terc4yamaRvQ0W93SS8xYmU0vGU=;
 b=j6MLQiuFzxp0L1HvG9WOcxV2iVS9hc0szsRD1qsLmiqTEqtYtuDKeUiC2d71w8EzK4
 5eOudjNfJ+QtC03YaFv/+PdJf8aYLtZx/F8T6v+wnmUuzghlZDwN/tlpi5KOj3y8J30v
 f0UYcHV/uD010BQMHY1GWvXM9vbXMM6ILFGjqw/cRa4HZONZ8WRe4UEdwfB5eF7J0lo6
 de88rxNklLZCZhYd6riE797Ag8N8/RacMh/4JOSM0qOfDGQDtmgHUtebD+qAVzj69k+B
 13zIvWJ75RhLZx7SIoeCKa9VIdGXPr09f8GY2kMnjAi3AFC++7uYLsDVxeTy/c2casU9
 OnbA==
X-Gm-Message-State: ANhLgQ2FsPznebO60LqDvMLNNfJBPffWhibiZOEA5q4qeYGE8yMsJ+LD
 Z+LFjMCxGJ3oMRfHafoNkZfxJQ==
X-Google-Smtp-Source: ADFU+vuXNcqO13b4qD3+8ed57nTKePtaZRWge/fKjR7FH7Sy9JiGzOTqiPMbv6ZJiNFsR3Q+puDIpQ==
X-Received: by 2002:a17:902:8647:: with SMTP id
 y7mr450799plt.224.1584570778342; 
 Wed, 18 Mar 2020 15:32:58 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id o29sm55211pfp.208.2020.03.18.15.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 15:32:57 -0700 (PDT)
Date: Wed, 18 Mar 2020 15:32:57 -0700 (PDT)
X-Google-Original-Date: Wed, 18 Mar 2020 15:31:03 PDT (-0700)
Subject: Re: [PATCH 3/5] kgdb: enable arch to handle more query packets
In-Reply-To: <1583225263-26245-1-git-send-email-vincent.chen@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-7036b146-b12d-4a59-8289-a65c50e1112c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_153259_615623_97FC7CC5 
X-CRM114-Status: GOOD (  17.21  )
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
Cc: daniel.thompson@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
 dianders@chromium.org, vincent.chen@sifive.com, jason.wessel@windriver.com,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 03 Mar 2020 00:47:43 PST (-0800), vincent.chen@sifive.com wrote:
> KGDB only supports parts of GDB query packets. Add
> kgdb_arch_cmd_query() hook function to enable arch to handle
> more query packets such as the qSupported packet.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  include/linux/kgdb.h   | 10 ++++++++++
>  kernel/debug/gdbstub.c |  6 ++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb1fd78..bbb35557f76d 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -177,6 +177,16 @@ kgdb_arch_handle_exception(int vector, int signo, int err_code,
>  			   struct pt_regs *regs);
>
>  /**
> + *	kgdb_arch_handle_exception - Handle architecture specific query packet.
> + *	@remcom_in_buffer: The buffer of the packet we have read.
> + *	@remcom_out_buffer: The buffer of %BUFMAX bytes to write a packet into.
> + */
> +
> +extern void
> +kgdb_arch_cmd_query(char *remcom_in_buffer,
> +		    char *remcom_out_buffer);
> +
> +/**
>   *	kgdb_call_nmi_hook - Call kgdb_nmicallback() on the current CPU
>   *	@ignored: This parameter is only here to match the prototype.
>   *
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index 4b280fc7dd67..2b2e7b99edcc 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -694,6 +694,9 @@ static int gdb_cmd_reboot(struct kgdb_state *ks)
>  	return 0;
>  }
>
> +void __weak kgdb_arch_cmd_query(char *remcom_in_buffer,
> +				char *remcom_out_buffer);
> +
>  /* Handle the 'q' query packets */
>  static void gdb_cmd_query(struct kgdb_state *ks)
>  {
> @@ -792,6 +795,9 @@ static void gdb_cmd_query(struct kgdb_state *ks)
>  		}
>  		break;
>  #endif
> +	default:
> +		kgdb_arch_cmd_query(remcom_in_buffer, remcom_out_buffer);
> +
>  	}
>  }

Won't this blow up on architectures that don't implement kgdb_arch_cmd_query()?
IIRC undefined weak functions have the absolute address 0.  It's probably
better to avoid the __weak entirely and introduce something along the lines of
CONFIG_ARCH_HAS_CMD_QUERY.

One better: I don't think qSupported is a good example of an arch-specific
packet -- it's probably cleaner to have the arch indicate which extra features
it supports (presumably via Kconfig) rather than just punting on the whole
packet.  The XML stuff is a good example: rather than putting all that in the
RISC-V port, we could just have something like CONFIG_ACRH_SUPPORTS_GDB_XML
which indicates XML descriptions are supported and expects a function to fill
out the XML response.

