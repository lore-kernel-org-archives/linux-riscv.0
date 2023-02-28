Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E149C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 21:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eah1BpX9DtzLM8haNsp62speBFWo4B5oJ3o1dGTU1kM=; b=B7/gJ2EWKzJ6hLYNEBtaY0FZX9
	OvppNfFBrt5yernGCzt/Eqgvz3ss/7q62INdfY+qLE3bRhQp/Qaaz7XC3C3s+Mjn+tEgI9Qfz6ZBX
	rGextZCUbg443nvzsefzPn7osR8ZZ3uxtMMB8cDxUa0VeHDlnQBN5Oyl/tuNr9XZ1DBug+Ic1hFhs
	aVYqpxEaAdLuhg5V5+Qap4o/nwdqCdS9kdX8ma31lc36DvcN0IEBHMiGNFtPS6F5OYxU5iJfcqefU
	oC3TrDXccHp90V6N2lUrBz1dIUm6WwGCmhBYVhg+HmKyBh9fyhrsjLCEL3K8usOV0tO4eHlaubTzA
	GIosQkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7u1-00EOCJ-MY; Tue, 28 Feb 2023 21:52:53 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX7ty-00EOAu-3Z
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 21:52:52 +0000
Received: by mail-pj1-x102d.google.com with SMTP id kb15so11314925pjb.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 13:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677621166;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+zwAHBnS5+TovEmhkYJhNFoHDMUmuJ8ck612nZS1t8=;
        b=omA2S4LjqCtvzyGP293QcxTJ7Lo75f7JjOAJP3W5yp4CiKRAVuH5MtWpvo7ryDtMFz
         i4jDGzLy7aG5c07lAXorf7etqeUG4ti2THkpl4Pl5N4VjhCaAQvBh+zuvqBpue/ChW5q
         GPkiN80WRdLr/ITBQd4kPSb2Wp7rH42C3abAIZzxPmPdVZMnjCxDg7rbUbaOeiom2pjP
         BhZ8vn+XysK7S+6EWyghBcLpbo20XZl3pKYBT+y+773NB05P05laLT6RGZyuV0IwgejA
         cn3a/8Rb6R9Gl3jRiEUDxW+b9Ut/C2i9kNS1PvV+OEaP/Hp7CL/b+0dweVERR7XEfGGO
         ocxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677621166;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+zwAHBnS5+TovEmhkYJhNFoHDMUmuJ8ck612nZS1t8=;
        b=R+PoD9l1MzdG/Kct7vKmjPYlPtRqY7rybv8zr81PuJVeQDtvhNFGrL1WoM7Ui7fJT0
         n06LoSO8Gyotum32mLn4NdLfjaGIcBbdyaPAOKk4JVWPKZaVKVmVwcmK0ql8qKuE0JLS
         sMWaKPpb3t7jLHO0eNtxjXd/7E6KGfFBoxbU0Qpj0oO3ZjEovD4HYVA88/2j7Ky9mdma
         njM1Ek5XGPaOzjEG+uUp/AFi3yyR+uU+tilvgsqZq4Lsoo2Pt27ZCeuapy9aWiyBSOH6
         e6y2av38YsbolC2uAF90AUvkj7KZXcXpbdDdqQMbM7VjC9blNk4l4FLoHjzPrqg2BlfD
         Exfg==
X-Gm-Message-State: AO0yUKVJECU5l/vx1yWiVzWU0Qtl/PhZnByPopRc/qnbp2A28D1o8XK0
	liur9AeRCvDVR82Z1aBE7r+K0tdTISu4ntZclnQ=
X-Google-Smtp-Source: AK7set/juip8p0MiLlYoPEIxqV9PMajgZBFayKyd5KvUfxhWs1VFVopVgOhH6LHgXjliJBQQwUAyQA==
X-Received: by 2002:a17:902:e851:b0:19a:839f:435 with SMTP id t17-20020a170902e85100b0019a839f0435mr13658248plg.3.1677621166383;
        Tue, 28 Feb 2023 13:52:46 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jj13-20020a170903048d00b001967692d6f5sm6945909plb.227.2023.02.28.13.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 13:52:45 -0800 (PST)
Date: Tue, 28 Feb 2023 13:52:45 -0800 (PST)
X-Google-Original-Date: Tue, 28 Feb 2023 13:51:58 PST (-0800)
Subject: Re: [PATCH 0/2] riscv: support ELF format binaries in nommu mode
In-Reply-To: <20230228135126.1686427-1-gerg@kernel.org>
CC: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
  linux-kernel@vger.kernel.org, gerg@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: gerg@kernel.org, damien.lemoal@opensource.wdc.com
Message-ID: <mhng-20faeb04-8ed4-4759-8f13-aef3d2446d15@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_135250_384232_EF9DBB41 
X-CRM114-Status: GOOD (  26.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 28 Feb 2023 05:51:24 PST (-0800), gerg@kernel.org wrote:
> The following changes add the ability to run ELF format binaries when
> running RISC-V in nommu mode. That support is actually part of the
> ELF-FDPIC loader, so these changes are all about making that work on
> RISC-V.
>
> The first issue to deal with is making the ELF-FDPIC loader capable of
> handling 64-bit ELF files. As coded right now it only supports 32-bit
> ELF files.
>
> Secondly some changes are required to enable and compile the ELF-FDPIC
> loader on RISC-V and to pass the ELF-FDPIC mapping addresses through to
> user space when execing the new program.
>
> These changes have not been used to run actual ELF-FDPIC binaries.
> It is used to load and run normal ELF - compiled -pie format. Though the
> underlying changes are expected to work with full ELF-FDPIC binaries if
> or when that is supported on RISC-V in gcc.
>
> To avoid needing changes to the C-library (tested with uClibc-ng
> currently) there is a simple runtime dynamic loader (interpreter)
> available to do the final relocations, https://github.com/gregungerer/uldso.
> The nice thing about doing it this way is that the same program
> binary can also be loaded with the usual ELF loader in MMU linux.
>
> The motivation here is to provide an easy to use alternative to the
> flat format binaries normally used for RISC-V nommu based systems.
>
> Signed-off-by: Greg Ungerer <gerg@kernel.org>
> ---
>
>  arch/riscv/include/asm/elf.h         |   11 +++++++++-
>  arch/riscv/include/asm/mmu.h         |    4 +++
>  arch/riscv/include/uapi/asm/ptrace.h |    5 ++++
>  fs/Kconfig.binfmt                    |    2 -
>  fs/binfmt_elf_fdpic.c                |   38 +++++++++++++++++------------------
>  include/linux/elf-fdpic.h            |   14 +++++++++++-
>  include/uapi/linux/elf-fdpic.h       |   15 +++++++++++++
>  7 files changed, 67 insertions(+), 22 deletions(-)

Adding Damien, as IIRC he's had some hacked up userspace bits for the 
K210.  I'm yet to get anything running, but it'd be great if we get this 
to a point where I can actually boot test this on QEMU (I'm just doing 
builds now).

Given that it's the second week of the merge window and this is a bunch 
of new uABI it seems best to hold off until the next cycle.  I poked 
around and don't see anything wrong, but I'll try and take a more 
detailed look after the merge window.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
