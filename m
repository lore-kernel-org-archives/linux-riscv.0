Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665F3C25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L517z3B9GBgeoHVQQyrFURr6Zix4ulQuDqZasUY6rOc=; b=3QVLSKpSKD1R/5
	2J3kESio7Q/t8LMiJEvPsEhmHBt1l1n8I2Qo94i1X7uqDPzvCKKa1T+egbChxKybltN/7Fkv0gS2d
	DW1HM/S+zwO2+IGZ/UibDIL6fvdm73kVIjz3D3BjgOIzz34oFBgsEArVwVUK3Nr15irsvQjXZdgGk
	Va2e+TqinhzFIAqUWvz9ZSq9aB4a8YGsH0BiLj9xsh7CD7guJ9MOiDfHpQXa33/5bBnxfJfE3F1g+
	c1Y5P/pbAdacPTsQsuVQb3aHMqNGeURWizPoFd/oAt3RZ3fJmNcaweZe1dXs2PocAebJVQGMCrU/n
	gdYesDGKFQcLcrrw+qRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNy1M-003eRD-Pc; Tue, 16 Aug 2022 14:58:20 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNy1J-003ePL-Aw
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 14:58:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d16so9424394pll.11
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 07:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=RKkVQQa3amY2lgr/u/066H4flgIqnke/0DATAAB4uGQ=;
        b=q2D0zAzw8qBxg6o80vt2TOQNxN0SzQs8J72Tt9Rqdqj103b5tin+CN8a/S+d2xomJb
         U7aBN1pXW5YC22wMX3WRwLy8iunPIlJWfTh6n7RyaZtt3JmiAX4NCA7QRS+CzZyjaVUj
         Jjq7Q2Qex+evh+q/wcCf4/4lUt3Loyxp/2D1KrE9etgAVx1syImYEIElaMhg1CGEhPAS
         XTGm62p0ulrGbvz7YBzqAaDuqLeeRgQvCnC80ydIVfk+SPeLI6YG04KgA1fQ42hAc7M5
         4Bt7RIfb1t8wKeCtpeKyLH0NXnsZDpTsL0zRNGDDX9RAQOXZ+Sntc1L3wWZOrAM+IiUF
         gluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=RKkVQQa3amY2lgr/u/066H4flgIqnke/0DATAAB4uGQ=;
        b=eOCyOy/T94S5aWF0A1kRIGqE5Kd6FdBAfiPYokyR7cCmZHcoUcIOzaVAkrvy3ejiBJ
         CadNzVrcu2MKiwXvp/JAhBoscAo69pX50FmdvoSYORuGjDZLxfbDrumMHu8PsdDAP/JE
         ABJNxhmEXOii3CaDkYU64EZU/SasgJobp1ToHo54FMpq+PMRl+w75wywWF183113/aU9
         8+H8yGbmKnU6gIR3hZiwuZDSPvjngIMdR55xoBQUsJUNnekpo0bY53SX+wIJWaRrbUAi
         ekQ25oipRk2ekqB2k6EgA1e9BLlxfXGv/blrZxfSbh7d49N66b5n2nAo435jdw4T29E4
         /IFQ==
X-Gm-Message-State: ACgBeo3vh7Msd4bfJ1/YJsoGkgkFzhlJMDx7MSlBLHA4onDnFFZjVGA1
	GvYsEZfaM8PxhbxBPENBG2Vh5vAsuwPeWjfPfUxuN4yQbug=
X-Google-Smtp-Source: AA6agR5AMjZnGfEnfzYYcdGv20Z/XKAg5WCg0klAQ8MKrhp9YCb9C3eMUi3U8uk7T037JgJVdprWTbr+PP5lyd/TlXM=
X-Received: by 2002:a17:902:bc49:b0:16d:ac99:f96f with SMTP id
 t9-20020a170902bc4900b0016dac99f96fmr22130696plz.130.1660661895055; Tue, 16
 Aug 2022 07:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <728ecbd5-975a-168e-efab-3c0030be21d5@w6rz.net>
In-Reply-To: <728ecbd5-975a-168e-efab-3c0030be21d5@w6rz.net>
From: Dao Lu <daolu@rivosinc.com>
Date: Tue, 16 Aug 2022 07:58:04 -0700
Message-ID: <CAKh7v-QYC7rhc3043OL6EqdjFV7uGivU7REjnTi6JsYQAnnc+A@mail.gmail.com>
Subject: Re: Regression on Linux 6.0-rc1
To: Ron Economos <re@w6rz.net>
Cc: "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, conor.dooley@microchip.com, 
	Palmer Dabbelt <palmer@rivosinc.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_075817_634807_2FAA8E53 
X-CRM114-Status: UNSURE (   9.18  )
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

I will take a look at it, sorry about that.

Thanks,
Dao

On Tue, Aug 16, 2022 at 5:58 AM Ron Economos <re@w6rz.net> wrote:
>
> The following Oops occurs on Linux 6.0-rc1 on the HiFive Unmatched. This
> is with gcc 11.2.0 and binutils 2.38 (from
> https://github.com/riscv-collab/riscv-gnu-toolchain).
>
> Begin: Loading essential drivers ... [   14.774748] Unable to handle
> kernel paging request at virtual address ffffffff813cdc90
> [   14.781976] Oops [#1]
> [   14.784163] Modules linked in: raid6_pq(+) libcrc32c raid1 raid0
> multipath linear da9063_regulator
> [   14.800763] CPU: 1 PID: 248 Comm: modprobe Not tainted 6.0.0-rc1 #1
> [   14.806747] Hardware name: SiFive HiFive Unmatched A00 (DT)
> [   14.812307] epc : jump_label_module_notify+0x1bc/0x270
> [   14.817430]  ra : jump_label_module_notify+0x19a/0x270
> [   14.822555] epc : ffffffff801b804c ra : ffffffff801b802a sp :
> ffffffc80424bc0
> [   14.829766]  gp : ffffffff81a2d7b8 tp : ffffffd895ae1980 t0 :
> ffffffd88067e20
> [   14.836975]  t1 : 6f1d98585898183f t2 : ffffffdbfed19e58 s0 :
> ffffffc80424bc0
> [   14.844185]  s1 : ffffffff813cdc88 a0 : 0000000000000000 a1 :
> 000000000000000
> [   14.851394]  a2 : 0000000000000000 a3 : ffffffff01c77000 a4 :
> 000000000000000
> [   14.858602]  a5 : 0000000000000000 a6 : 0000000000ff0000 a7 :
> 000000000000021
> [   14.865812]  s2 : ffffffff01c73000 s3 : ffffffff01c740c0 s4 :
> ffffffd88067e80
> [   14.873021]  s5 : ffffffff01c73010 s6 : 0000000000000dc0 s7 :
> ffffffff813cdf0
> [   14.880230]  s8 : ffffffd88067e282 s9 : ffffffff01c73008 s10:
> 000000000000002
> [   14.887439]  s11: ffffffc80424bd50 t3 : e26cb9592a0e8a69 t4 :
> 000000800000000
> [   14.894649]  t5 : 000000ff00000000 t6 : ffffffd8819ac4a0
> [   14.899945] status: 0000000200000120 badaddr: ffffffff813cdc90 cause:
> 000000f
> [   14.907853] [<ffffffff8004055a>]
> blocking_notifier_call_chain_robust+0x72/0x8
> [   14.915061] [<ffffffff800a1dfc>] load_module+0x17bc/0x1e98
> [   14.920531] [<ffffffff800a2718>] __do_sys_finit_module+0x98/0x100
> [   14.926611] [<ffffffff800a27a4>] sys_finit_module+0x24/0x30
> [   14.932170] [<ffffffff80003ca6>] ret_from_syscall+0x0/0x2
> [   14.937680] ---[ end trace 0000000000000000 ]---
> Segmentation fault
>
> Manually bisected to this commit:
>
> arch/riscv: add Zihintpause support
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8eb060e10185cfc97ef0200d197ec246ba0f9f8c
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
