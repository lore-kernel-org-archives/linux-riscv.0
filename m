Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC69E7542B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 06:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7I7uzyMaqFeiTJYP0JoF95LnOzFrq28RV7ARpavaR7M=; b=uV5hYViuM6TH8R
	etAUtrOK2Mihg2OCmjfQQel372ei5lb3LrnVdWk8RSkKgIxys36frp8HI/BR42V7eg9N7a8pg6fiC
	FUhnmZ94DzUvAVv0AESVPmwnRT8wsINABup1c1ezqQMtfOFtVF5bM2ALQdLpVhjq8y2P76UH2Av7o
	kaS+zz1fivpfdirB5lpU/wtVhUIOf5dO/6Hr5V9edS0i3sCc1hOydpROga0iuWhxCPr4f84COcjer
	KTmT+gEMP3cwAlM6iJ/gNXtwIJ5dHA/+tdSxYkSNKRPf/uqGxuDr2S5Imw7BePE/hUSX6Vg2SnKy0
	6Yymy7WG0/ljFY6dr0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnZ6k-00Dw3w-1W;
	Tue, 03 Oct 2023 06:42:14 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnZ6g-00Dw3F-0U
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 06:42:12 +0000
X-QQ-mid: bizesmtp86t1696315173tuzddk6q
Received: from linux-lab-host.localdomain ( [119.123.130.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Oct 2023 14:39:31 +0800 (CST)
X-QQ-SSF: 01200000000000E0Y000000A0000000
X-QQ-FEAT: znfcQSa1hKYnB06FCUnyZ7Rpm5CmZWJqRfGTuJHxtl4meQaVBWI1H1PDt02dS
	pT2O0sXLVF6qVDbFKjPG9YyYphS+fIXm4VBKdAqG0PvktEfB58/biOUXz5SZz+KGERt1VaT
	619J4+whN/qouLxMO+CPBVRj3RufS4PmiNDowjcL5GiAqAZEsbd0JDAOIYmyoR7KpvizSkS
	TszFtsx8VZPjxSkJW246JxoaEP+vLyLq2KqFNfI5G+HbMbSQm2uka2LlDUWA97v1AOV3r+U
	cy8axGyvJAX6OYRKjFAP56NzuEkCzTsAO/E1L/4eMGi6qKfjdklQillvWazCsZvz0FGOo84
	qnu5ckVoLE40dEvY0pp1gyGdlj7HA==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3474633451399552696
From: Zhangjin Wu <falcon@tinylab.org>
To: palmer@rivosinc.com,
	arnd@arndb.de
Cc: aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	ebiederm@xmission.com,
	falcon@tinylab.org,
	guoren@kernel.org,
	keescook@chromium.org,
	linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com
Subject: Re: [RFC PATCH 1/1] riscv: add Kconfig.vdso
Date: Tue,  3 Oct 2023 14:39:31 +0800
Message-Id: <20231003063931.5394-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <95c2e86acbcaf8966251a471997b3f0cd3c64fbd.1684430522.git.falcon@tinylab.org>
References: <mhng-a1871255-29e2-4adc-b344-a753526cd392@palmer-ri-x1c9a>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_234210_533762_1D0C5273 
X-CRM114-Status: GOOD (  13.57  )
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

Hi, Palmer

Thanks very much for your review.

> On Thu, 18 May 2023 10:48:52 PDT (-0700), falcon@tinylab.org wrote:
> > Allow users to disable the vdso and compat vdso in Kconfig.
> >
> > Copied and adapted some code from arm and arm64.
> >
> > Size measured with a small rv64 config of v6.4-rc2:
> >
> >             Config | Size      | Shrink
> >     ---------------|-----------|--------
> >            default | 1588 KB   |
> >     no compat vdso | 1584 KB   | -4 KB
> >      (and) no vdso | 1576 KB   | -12 KB
> 
> Do the resulting kernels actually work?  As far as I can tell this 
> disables some syscalls that would break userspace (that time-related 
> stuff that would be turned off) and the lack of rt_sigreturn would need 
> an executable stack (which probably cancels out any benefits from the 
> smaller text size).
>

Yes, its working is limited in extremely small embedded systems (who
don't require such syscalls or their vdso speedup variants), the libc we
currently tested is NoLibc.

This is part of our work on kernel tinification for RISC-V, exactly, it
is derived from the in-progress DCE/DSE work [1].

The simple background logic here is if the target system don't require a target
syscall, no need to provide both the syscall and/or its vdso variants from
kernel side.  seems this logic is not specific to RISC-V, perhaps we should
rethink it under the whole DSE work (Arnd has given some suggestions), for
example, let the DSE 'framework' (based on user-space profiling) tell us which
vdso variants should be reserved and which one is not required, manual
selection is really not that friendly although ARM also currently provide the
same config option.

Thanks,
Zhangjin Wu
---
[1]: https://lore.kernel.org/lkml/cover.1695679700.git.falcon@tinylab.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
