Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBF5C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkssLcTosqgPngeTvDQta7eiJEEwgPVKZ26VoxSf6ag=; b=HlXXNMYPPB7dOB
	DdFWO5qIX5qiGslF3BaxYdPwTUqTeB23xnHDURaNVbhiz3HSO+gc75cubeP/2fMjS/T1h8W5a5LhQ
	0ROWfjn/Sq9Z1UKiD6LaXaICJYYaKUjxqRTBtnS7hQf+5lsSF6sZ2+ZKOKcYwFwIA6QWqDSXUUZ2Q
	6DMdz2RERBGj3uifcRpwoQ54aanjUL+WIk/ZNcT5MpnluhW7EmRfYgtvD8buOniyUBAzLTTdTkda6
	Vv1fcVGTc2gV8Vtoz5VgXlcz0OuICw6yrv+NxWePSHDTvho5hIkhZawGl/IJ/LzrL8sWHB/ErgB4F
	3Ew9DC/hm/6NLobh15lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMpqF-007stb-2F; Tue, 31 Jan 2023 12:34:27 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMpqA-007ss8-PV
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 12:34:25 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id c124so17803431ybb.13
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 04:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lqhu7Hk+UNTFHzvYJyWe2Ndz9V/GBcG2ePRKmQszGf8=;
        b=V0sMxhP16KEvIXXzY7pdlOOlnk+2oN3a3A3u0xtReGz/HDV9INbUMbNK+4/B8jIUc/
         9qHFppixcW3T2nBYh0xic1Uxe/rs3JvNrjNELV+FsIqkQDqduNHuMA/4j/P1OwyJJsZh
         KZ6cIJw0y1f/P/2Ztgui7cm82d0A0+/oDjGl00pQs9j4LuPBTsKOnjMGkI6tKNSOfUdj
         L0BEeqfH7wJ6ZWTtDn7hhOnw2WOqy1PqQASHB1B0eF4uIKxN7RSSRSoYJZ7YLg2tdl8H
         5U17SsuBifcT0/MmM7KVzFge4alC3ZCvLT8QT9wRdRdu8di1BTugZi7l146AR7xwMU3X
         m5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqhu7Hk+UNTFHzvYJyWe2Ndz9V/GBcG2ePRKmQszGf8=;
        b=4/tyahHtBAgWIKofILg+pFttNkrjEClBk0COy8vpfavOv+8bamwHPSKFpPuuKDb2GH
         7CZA7bhOZ+AYveWZXZqwQ3FFrPHeJWJlJ2ntaUavwuJlejibQaOGpdaV1SllosVrADPZ
         ZmJDQuIFl+93aSVJMfspjEoX/ZOCJDVuSKy6FLbhiruRloB4CyXrGW2FcSxjzp1puGqv
         g7/ayQpbb5fV5Llia33TbWVDUmQZBrRRCaU+VuClTgoraIUjspWkiMn/4nQGjsBOtQ+R
         I9Xh4pfLbYaQmXGDIWrK9HHCbOVc4nexLGPv7chhcMOx/H+KIkpHbZDg1360y8cdYIkj
         Fr7g==
X-Gm-Message-State: AO0yUKXcYG0SCELPIHxDLE+id5Dl+UwDMFA38UxaoH5CSnVw8+dw7iGN
	utNpJZUAMIMw50da+AaGlSggo33JXqNOP+p/6Qv3dw==
X-Google-Smtp-Source: AK7set+SsjzVzMKV0mDDXrbeQGwZgSq6PsL8UvHR8BqGD2um1NQTdB/Syzn6pI+UaGShMerrkFnfmzIVlHkSJydJpeQ=
X-Received: by 2002:a25:8388:0:b0:80b:79e1:bdad with SMTP id
 t8-20020a258388000000b0080b79e1bdadmr3423465ybk.196.1675168460174; Tue, 31
 Jan 2023 04:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-16-andy.chiu@sifive.com>
 <Y9Q0h88UL0BRaF8d@spud>
In-Reply-To: <Y9Q0h88UL0BRaF8d@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 31 Jan 2023 20:34:00 +0800
Message-ID: <CABgGipW5Ba7wc8K1QXY=aiT0xGMSiTo4LdhsxpNn7pr58jiekw@mail.gmail.com>
Subject: Re: [PATCH -next v13 15/19] riscv: Fix a kernel panic issue if $s2 is
 set to a specific value before entering Linux
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	ShihPo Hung <shihpo.hung@sifive.com>, Vincent Chen <vincent.chen@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Guo Ren <guoren@kernel.org>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
	Myrtle Shah <gatecat@ds0.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_043422_911164_B1051A0B 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

On Sat, Jan 28, 2023 at 4:31 AM Conor Dooley <conor@kernel.org> wrote:
> grepping for code that does this (with your series applied), you are
> the only one who is using PT_SIZE rather than PT_SIZE_ON_STACK:
Yes, you are right. It should be PT_SIZE_ON_STACK, which considers
alignment of the stack top. The task_pt_regs() counter parts, which is
the macro that operates on it, also aligns to STACK_ALIGN. So , we
should use PT_SIZE_ON_STACK instead of PT_SIZE here.
#define task_pt_regs(tsk)                                               \
        ((struct pt_regs *)(task_stack_page(tsk) + THREAD_SIZE          \
                            - ALIGN(sizeof(struct pt_regs), STACK_ALIGN)))

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
