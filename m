Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADD1C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Mar 2022 23:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SpX2ejK30TvHGYaNu0lHDTOa2cLv1L9wPO3ySVQ7oPM=; b=D3hxIaFZ2UcdoR
	j4y263XUETvcB12SpqyC832IX5adrhCSJxGdcLs1WhBh+YctRZ53Ua6ngujcfWScKSO2M+496kkSF
	hyck7gv58KBSnsd9Zgb/IbDIu0AKigCD0ANoXuWuTvRc4+U/fDLf++RSkvdBkG5AI1Gml8Wmumkbf
	yyncgdISyJ9e2lT9PaYzFeJ3Mf3J4V169PipjhDtf6UJd81xCDfoObjf+6EDeSOQgP+IBsVToI+67
	MmAHZfSg3q95P0st7DCCEKAsWhAXP4enpjtfcDz3YgwzPGmeyzTucAgoLvNZYRlIQkS6gT5zKgwWI
	QYHYh/MU6c7maBKlkznw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTBVl-0020sG-1J; Sat, 12 Mar 2022 23:51:01 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTBVY-0020qd-ON; Sat, 12 Mar 2022 23:50:50 +0000
Received: by mail-ed1-x529.google.com with SMTP id m12so15193627edc.12;
 Sat, 12 Mar 2022 15:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=52W9q0/ypkx4S9+DIODk0Uq0ox54c7w4kVL7674dQ6U=;
 b=V6u6FSysyXrFpEqLaS8USZ0d/6G6QTFgYmseRClD8M7pB4z7u2bTEjBFF7673m3PKA
 vFq4sC0Rl6wiomxzhicwIOF3OFpVENCGcc+1eEabZ14b7QzRkJqG/WqGvLH43owEOZEp
 fRDGH3qH+O1YVDblzXIVwNwikIzwQBnKKHR1ZKwtFRiF0p6wwsG6CCbF1oRKNxObB+cp
 cQJX75CZgowmTQWq9fVLe2i6F0wYMcKlHbNBaLywjFbTF/V5Dg6wobxDZeQIm7Jx4LNV
 ZmNg2MfRrz4QWcRDLzUMDVJfVnhW8LZZhyXQ7TpPKN0vmMDd6IkHdKK773rXrZn6Unlg
 rK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=52W9q0/ypkx4S9+DIODk0Uq0ox54c7w4kVL7674dQ6U=;
 b=EM5qd3ypmcqjpjqSRD6hI4Dsv6Kn7S40QDGe3O+rv/LvnaGWZdv/evm7ICCCir4PUI
 UccdChvzNPLCmDFu+AsBmhHQvFOd/PStJkL13NOni2/pjenxFPRqnJ6zFyZqkgd3h/t0
 JpjBWCJgDzj/XRShJfk2G5r4IZHguSiVRurwykxb2qplayc2/ryXYKVWir8usnWhRbVK
 zO33v1yh8bwoT1izHvA65PA+5UsrBl0/vundNcsYMGWW3REt5Cbp05wbXiWrg74qqkyD
 FA+DVzIguy5cOd/IGhW8e8x3YADJ8Wa8Y2l+R9Efx89DJnq/7hsfziUhXYh7s0fgEnKi
 T1zQ==
X-Gm-Message-State: AOAM530FrU8yJzHa9+HlWJwbetRIZ1CLugOdyo5oJCPqwdV03LVTzjmt
 8dAUXppa/6QGc132YamIZ3mmq412wHb3fNBnxIM=
X-Google-Smtp-Source: ABdhPJzWFW75ZT9zrVaq52nEEfpfte20y2VtuaHjFpAHAVPPTUl/51VT3OJA32F9aRT8vuV2SaNwBB4CjE8UDcnkFZQ=
X-Received: by 2002:a05:6402:5143:b0:416:1327:4f95 with SMTP id
 n3-20020a056402514300b0041613274f95mr14260634edd.56.1647129046482; Sat, 12
 Mar 2022 15:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20220312155603.1752193-1-guoren@kernel.org>
In-Reply-To: <20220312155603.1752193-1-guoren@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sat, 12 Mar 2022 15:50:35 -0800
Message-ID: <CAMo8Bf+p1-DqeqHV45GcZEsp+BEd+iMfeHP+i0P+KO7nv8W7Ow@mail.gmail.com>
Subject: Re: [RFC PATCH] arch: patch_text: Fixup last cpu should be master
To: Guo Ren <guoren@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220312_155048_845510_18AB5719 
X-CRM114-Status: GOOD (  15.27  )
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

Hi Guo Ren,

On Sat, Mar 12, 2022 at 7:56 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> These patch_text implementations are using stop_machine_cpuslocked
> infrastructure with atomic cpu_count. The origin idea is that when

The original

> the master CPU patch_text, others should wait for it. But current
> implementation is using the first CPU as master, which couldn't
> guarantee continue CPUs are waiting. This patch changes the last

guarantee that remaining CPUs are waiting.

> CPU as the master to solve the potaintial risk.

potential

>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Peter Zijlstra <peterz@infradead.org
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/kernel/patching.c      | 4 ++--
>  arch/csky/kernel/probes/kprobes.c | 2 +-
>  arch/riscv/kernel/patch.c         | 2 +-
>  arch/xtensa/kernel/jump_label.c   | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

I'm curious, is there a specific issue that prompted this patch?

-- 
Thanks.
-- Max

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
