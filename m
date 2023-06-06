Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B58C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 06:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ituKSj86yV03ZVBySjJHZ2OomR2si4dmorREb7c91No=; b=jG79NuaEamPyUe
	rBmk9HD71/x9Rd0MRSviBahv6otd9Bik7n13D56XvKt2NCJ6Sw7KQK0Q6nTYM3AxSJadMccrqyi2i
	BZUTaDfFHs6JC8bYGPJ4HGVdtxq6wG0ablo69CMN1d6KglJ/n388oYyVg7PMllWcYw9RNaeNI7ZiH
	+LiBeLRwJu+vmdIUdBF5AwxlrHlKgB65LRdM4htIqBbArhuRAPgpmbqkwoAsSVS7CjYBX38b7QNTE
	AmBFb5+9M6HPQsz+YqG0cnJglxOuh6M9ZMQtZ7ytdPtVwvzabccBOWYbV2WwshPh2OoZ69c9s4xLm
	nG7nu4NyxZcdSExqPB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QHL-000NwP-2m;
	Tue, 06 Jun 2023 06:34:51 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6QHI-000Ntn-0S
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 06:34:50 +0000
X-QQ-mid: bizesmtp68t1686033262tl7dkkqk
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 Jun 2023 14:34:21 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: /+iK7ZpVlLSPinLeQ9zsx66cqhGI6AjnH+oBn23Uhpa6VHM/NSh9KAGG0KU+3
	v7OGvDL7Trzyyqyu/XhqvEtxyVAXBYpoCrTvJk6T5vojDLz/svaeIkrwZmF05+KI0gKLUvu
	6XO0bkPxU0Yq30vmK/im5xjAfi8/vY+IdwTfn0aENDR4YPUbGTMu9ORdR6GUiszt3O1lZOI
	/YmZt7j8wUUDVHRjo+1DOHEf616JrEZwr7RcBZGSkLYcNjFpMu3L7G30luAcrcIRoJTmF07
	sbceNMhBIzm2RKjBeQ5wm9lkJZB2m5/LE4D3gucfe74XO88h9RmR4uskA4uyHD8TVF7k7Ra
	T/meyYMAs3/q2vIb4Xo6TF1f1oNpcirsRRTSjhEJclBGRTEXyI=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2133803625882830366
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu,
	arnd@arndb.de
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH v3 0/3] nolibc: add part2 of support for rv32
Date: Tue,  6 Jun 2023 14:34:21 +0800
Message-Id: <20230606063421.355411-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZH65QKQ1dlY+HsK7@1wt.eu>
References: <ZH65QKQ1dlY+HsK7@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_233448_495923_04FFD929 
X-CRM114-Status: GOOD (  23.40  )
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

Willy, Thomas, Arnd

> Hi Zhangjin,
> 
> On Tue, Jun 06, 2023 at 12:25:35PM +0800, Zhangjin Wu wrote:
> > The first two convert all compile failures to a return of -ENOSYS, if you do
> > like it, welcome your Reviewed-by. These two are required by the coming new
> > time64 syscalls for rv32, because they depends on how we cope with the
> > unsupported syscalls, returning -ENOSYS is really better than simply fail the
> > compiling.
> 
> I had a look now and I can sya that I like this. Initially the supported
> syscalls were so restricted that it was not even imaginable to accept to
> build without any of them, but now that we're completing the list, some
> of them are less critical and I don't see why we'd fail to build just
> because one is missing. So yeah, a big +1 for -ENOSYS.
>

Cool, I will prepare the new patchsets on them, welcome your new branch
with both of them, of course, still weclome Reviewed-by from Arnd and Thomas.

> > The third one is not that urgent, because some important syscalls are
> > still missing for rv32. It is added here only for compile test.
> 
> I personally have no opinion on this one. I can't judge whether it will
> make things easier or more complicated at this point. It seems to me
> that for now it's just avoiding one extra line at the expense of some
> $(if) on several lines. Maybe it could help add more such archs, or
> maybe it can make them more complicated to debug, I don't know. I'm
> interested in others' opinions as well.

As I explained why we did it in current way in this reply [1], Thomas had no
more questions on it, so I think Thomas was happy with it now and I got his
only left suggestion is that may be this patch should be applied after the
missing 64bit syscalls being added for there are several important test
failures currently, for me, it is ok before or after.

Thomas, welcome your Reviewed-by on the makefile patch itself If you are really
happy with it now, thanks very much ;-)

Willy, I will send the v2 syscalls helpers (also required by the coming 64bit
syscalls) and some other patches (mainly for test with faster kernel build)
about selftests/nolibc later, because we have not enough time for v6.5 test,
so, I suggest we can create new branch for v6.6 and my new patchsets will be
for v6.6.

Best regards,
Zhangjin

---

[1]: https://lore.kernel.org/linux-riscv/20230526092029.149351-1-falcon@tinylab.org/

> 
> Thanks,
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
