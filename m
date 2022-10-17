Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BB8C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 12:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AoNF7T5Cs8iCT0FdKzywIlf7BUkC1eb0IP+IyTT9cE8=; b=iGvDQ1a7DzyAfr
	8kE1JViLVaGmKGMTZVDvmgVevrgAPYB3GBmhqwF1yIgtG5FCjrgUXhO3RADWNLIvFbPyl6G7DJ6m6
	7w2x44vrD4Ak6W15XB/d4fOnoQmKeVSzzNnJdk2YF14aOM6ke4cnggPi/49iVj+g0jijDcyDrZy1X
	itQ1uzDbRvLWYuTvzYxp5KDLWAZPam+IUtTWO9HVZ1H6K5bXwDgKVfHmjgbOvp8G5RoZSazZhq3BM
	UfqCbx9/4bZtY1X1ZBF5fxEqs+G0P1VXOLdmwOZTKqFYjW9K9TnBISiJ6+byp2pQIoBQm7lZwm+p/
	nnVXzD0gUVGJ9R6bqTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okPCP-00BXK5-78; Mon, 17 Oct 2022 12:26:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okPB3-00BWSp-ME
	for linux-riscv@bombadil.infradead.org; Mon, 17 Oct 2022 12:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NZqlweCS7ELJY1wKNFHXKg0mIBlu2ZNbUFr8upeVYWQ=; b=oRoNnK0FxAYt/WytCWlbhttmk5
	Eel5nhDYIjwe2BC85lwoZDzey6iurKAxNDDijDOEKBowaAi2gxpcCtBEFpAdIv5yg4b5PWCjmKLGN
	1sPiPeifiiKalTbsI/AeOel6q+6D4vPf+mQTZkXHPL7ydCje+1WgrdnB+iG/wTF9kd4WFH1TGMye0
	3NtkJIsy7jFbisN7IyQPIMfWegoVR3mAShNb8Gkd37EbHoLs0hcFqAm1c5QE5027Hy1x9o8cGkOv6
	qr2y+NtSWhkCguFr9kG/ZFNv7mtUIklkFaQLapyBsseo/NfSlHHDCa5hKq5gvpggiVGVVKXHMcj5M
	uP1x2JYQ==;
Received: from [179.97.37.151] (helo=quaco.ghostprotocols.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okPB6-009pvC-AY; Mon, 17 Oct 2022 12:25:08 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 6C82B403B6; Mon, 17 Oct 2022 09:24:59 -0300 (-03)
Date: Mon, 17 Oct 2022 09:24:59 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: acme@redhat.com, linux@yadro.com, anup@brainfault.org,
	n.shubin@yadro.com, aou@eecs.berkeley.edu,
	alexander.shishkin@linux.intel.com, mingo@redhat.com,
	jolsa@kernel.org, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	mark.rutland@arm.com, namhyung@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, peterz@infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v6 0/3] RISC-V: Create unique identification for SoC PMU
Message-ID: <Y01Jm6PHA1m7B1Vl@kernel.org>
References: <20220815132251.25702-1-nikita.shubin@maquefel.me>
 <mhng-a8eaa55b-16b0-4b17-b202-881e75a65eaf@palmer-ri-x1c9>
 <20221017091948.1961294e@redslave.neermore.group>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017091948.1961294e@redslave.neermore.group>
X-Url: http://acmel.wordpress.com
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

Em Mon, Oct 17, 2022 at 09:19:48AM +0300, Nikita Shubin escreveu:
> On Mon, 03 Oct 2022 19:54:40 -0700 (PDT)
> Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > On Mon, 15 Aug 2022 06:22:37 PDT (-0700), nikita.shubin@maquefel.me wrote:
> > > From: Nikita Shubin <n.shubin@yadro.com>

> > > This series aims to provide matching vendor SoC with corresponded
> > > JSON bindings.
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
 
> > not sure if you're looking for this via the RISC-V tree, it looks
> > like usually these get merged via a perf tree?  That's OK with me,
> > but I'm also OK taking them through the RISC-V tree.  Note that
> > cpuinfo dependency seems to be triggering kasan failures, so we'll at
> > least need to sort that out.

> As i remember correctly you were willing to take these patches into 6.0
> =).

> Well they are acked by Palmer and [2] series, which my series depends
> on, also have been accepted.

> I can resend if it helps you.

I picked it from this Message-ID with b4, applied cleanly, but yesterday
the merge window closed for v6.1, I applied it to my perf/core branch,
for v6.2.

Thanks,

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
