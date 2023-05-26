Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E85DC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 10:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDmAx4OCKGM6DK8BY5PFjDQAySmoSyjUpvL2QdkXqIo=; b=4P6m+aKuUzAmAD
	eUXSspWxr+ZSdiRj6/uJhtBzGW99XTEFTdj9l+a6699Ob48/kjiFJ012sPcvVgv2F8gzZL9mWnwg6
	nKZFDuzvR8A+8QznOXhtUytp96rJ8BHmdAfVnWrSosFQCPSK3agNmebFr94c9fVsHS4Q/K6nT2uu1
	UhYTHfWyf7XHUJE+J7RdD/RupjcWVGRBqkBhXpuSHfSTXAG0almLlcBGaDU/6Vdlm03AqBGqU9XGB
	m0M2WRgHVujk0WRbbb3XdGSbLhRVqisb3davdmd3JUFgwFjTYqdGYfmP3UeF6q3zhp4Fv58ELTqzH
	28iKHU0OhiKSu3ZKvm4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udw-0020y0-0W;
	Fri, 26 May 2023 10:25:56 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Udr-0020qC-10
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 10:25:53 +0000
X-QQ-mid: bizesmtp85t1685096719te1p3ayz
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 May 2023 18:25:18 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: +ynUkgUhZJk/BOqp0oA9cBg1YsH89tL5W5qI5R9skNk3ZDlWFZ9Rn3nuDLHs6
	r+jdJjJ6RsVhmT4f02tw/MUiR95J8ZHDs3wLyf7AK1WOAA4EIeTLghnosNldvidGC0l67Gg
	2wYkd1Z5Tp0KBw74IMW4oY64DEXTsLZTXdoOMnfzfQfg3GspMKUW0w+aX/PB1XNeHKCJ7ki
	rKwLr5llWwScHgLl/T/iRZLUbfPOilCzMWy+UioDCh9PuWaWLKFbQ7RhzPSDtCYJ0tJYlnv
	QcwgLYeEKtu0tr1zpA4GKs/VRufTXnJiYTkUJXcC2xgJq1V6qzS/+WgbkejKpVxpTvwS0AE
	pTyFJWz+eWpelE0SrSj+8C6mQRZa5VcSQVR8AnV0Hdew0584nkZshTSqBqhgn8mgsYKynPR
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12828852806642903950
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	w@1wt.eu
Subject: Re: [PATCH 06/13] selftests/nolibc: allow specify a bios for qemu
Date: Fri, 26 May 2023 18:25:18 +0800
Message-Id: <20230526102518.150058-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2ab94136-d341-4a26-964e-6d6c32e66c9b@t-8ch.de>
References: <2ab94136-d341-4a26-964e-6d6c32e66c9b@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_032551_883328_311DD146 
X-CRM114-Status: GOOD (  17.96  )
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

Hi, Thomas

> On 2023-05-25 01:52:29+0800, Zhangjin Wu wrote:
> > riscv qemu has a builtin bios (opensbi), but it may not match the latest
> > kernel and some old versions may hang during boot, let's allow user pass
> > a newer version to qemu via the -bios option.
> 
> Nitpick:
> 
> This seems very specific and hopefully only necessary temporarily.
>

RISC-V is such a new ISA and the Spec (especially the SBI) changes very
frequently ;-)

> Instead it could be changed to some generic mechanim like
> "QEMU_ARGS_EXTRA"?
>

Good point, will apply it.

Thanks,
Zhangjin

> > we can use it like this:
> > 
> >     $ make run BIOS=/path/to/new-bios ...
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/testing/selftests/nolibc/Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
> > index 9adc8944dd80..9213763ab3b6 100644
> > --- a/tools/testing/selftests/nolibc/Makefile
> > +++ b/tools/testing/selftests/nolibc/Makefile
> > @@ -70,7 +70,8 @@ QEMU_ARGS_mips       = -M malta -append "panic=-1 $(TEST:%=NOLIBC_TEST=%)"
> >  QEMU_ARGS_riscv      = -M virt -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
> >  QEMU_ARGS_s390       = -M s390-ccw-virtio -m 1G -append "console=ttyS0 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
> >  QEMU_ARGS_loongarch  = -M virt -append "console=ttyS0,115200 panic=-1 $(TEST:%=NOLIBC_TEST=%)"
> > -QEMU_ARGS            = $(QEMU_ARGS_$(ARCH))
> > +QEMU_ARGS_BIOS       = $(if $(BIOS),-bios $(BIOS))
> > +QEMU_ARGS            = $(QEMU_ARGS_$(ARCH)) $(QEMU_ARGS_BIOS)
> >  
> >  # OUTPUT is only set when run from the main makefile, otherwise
> >  # it defaults to this nolibc directory.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
