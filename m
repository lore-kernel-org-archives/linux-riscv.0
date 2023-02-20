Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A14FC636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 10:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sArDoW9vXLjVLGIInlqIXoNpGcOLxyYh8elTkY3Eo2A=; b=SQqAnRup8KgC8Y
	m0Ed50ELr6yBKc4YEO9YyTfmquijX0W799eUUuy29uiN5qh7D3H5sSJNKvo7z0b07ZahZ3pI1Sl4S
	j8qZXj41q4+BKN1cFIHRifgTjcu4nncaq9LDKX+TEb5HRvteMlPrQWmdN/e5ega77Lxpf+3wA3M0T
	kIH1aFT31X6MRdWzR/GrrU44Qne0Zvaf+ufHQvkqkjgnp+E6YBGOZWpb2zRa5jD3S2pyDuIIG1UdV
	tRB43fZs3v6FQ12LE5fwfpgifPzHn8aa3ERtu3z4Y2u/53u29Qhs6Uld0AKQC4IiC1X1AdsjtwCeu
	gBq4ljbLYcNnuCe7f67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU3XM-003fiz-BH; Mon, 20 Feb 2023 10:36:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU3Wo-003fau-I2
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 10:36:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C64415BF;
	Mon, 20 Feb 2023 02:36:53 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.15.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE29C3F703;
	Mon, 20 Feb 2023 02:36:08 -0800 (PST)
Date: Mon, 20 Feb 2023 10:35:57 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Guo Ren <guoren@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	"liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, conor.dooley@microchip.com,
	penberg@kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
Message-ID: <Y/NNDXlXth2HgSUf@FVFF77S0Q05N>
References: <20230126161559.1467374-1-guoren@kernel.org>
 <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us>
 <Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
 <CAJF2gTRgze_owuWvJjnrPpBNs8+GY-km7wvHU4EuJzarQc+BPQ@mail.gmail.com>
 <Y9juYX8Bt1Z55lv0@FVFF77S0Q05N>
 <20230217002351.112635f4fb35f84002666d29@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230217002351.112635f4fb35f84002666d29@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_023614_768405_C54DB6EF 
X-CRM114-Status: GOOD (  16.99  )
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

On Fri, Feb 17, 2023 at 12:23:51AM +0900, Masami Hiramatsu wrote:
> On Tue, 31 Jan 2023 10:33:05 +0000
> Mark Rutland <mark.rutland@arm.com> wrote:
> 
> > On Tue, Jan 31, 2023 at 09:48:29AM +0800, Guo Ren wrote:
> > > On Mon, Jan 30, 2023 at 11:49 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > Masami, Steve, and I had a chat at the tracing summit late last year (which
> > unfortunately, was not recorded), and what we'd like to do is get each
> > architecture to have FPROBE (and FTRACE_WITH_ARGS), at which point OPTPROBE
> > and KRETPROBE become redundant and could be removed.
> 
> No, the fprobe will replace the KRETPROBE but not OPTPROBE. The OPTPROBE
> is completely different one. Fprobe is used only for function entry, but
> optprobe is applied to the function body.

Sorry, I had OPTPROBE and KPROBE_ON_FTRACE confused in my head, and was
thinking that FPROBE would supersede KPROBE_ON_FTRACE and KRETPROBE.

> > i.e. we'd keep KPROBES as a "you can trace any instruction" feature, but in the
> > few cases where OPTPROBES can make things fater by using FTRACE, you should
> > just use that directly via FPROBE.
> 
> I think what you are saying is KPROBE_ON_FTRACE, and that will be replaced by
> FPROBES.

Yes, sorry for the confusion.

Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
