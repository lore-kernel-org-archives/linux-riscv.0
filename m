Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCD0C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 04:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWENVJVR0YfW8YwgStEBn4tXFRHV2CWPrq/UfwR6I54=; b=uCFKDmFXMhhGOR
	FHPcvP+XpqHUFPDThTUXHjgK0mjUcpjKeTkGJP311Dj/rKdrtkiGGfnaak8MnoJWtqGnK30DP/HYx
	/uVhC9QBDDR21Vl1Crtut1Xsv2ecBjID2ohyx2rpzcL30QpYxW39U/vTddspNEMOydyPEZaRM8M4R
	OCJtR/ZgUSdntGl8zf8q8Th+s/gCykr0RgR0A5K8tQGoD+zX86jcGDKH/kzbQdFSMzUR0EJQH+R0S
	By9rqjofMatu2vUS8NXb5PHav2BFUn4GzdF1aejqSP6ZYyTNiqH2QhWvBqWE7y0pgQhP3k8PuUPfB
	mLvsXLx9QQcV9LKp9eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6OGc-0007n8-2i;
	Tue, 06 Jun 2023 04:25:58 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6OGZ-0007lU-0N
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 04:25:57 +0000
X-QQ-mid: bizesmtp83t1686025537tyl56hli
Received: from linux-lab-host.localdomain ( [61.141.77.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 06 Jun 2023 12:25:35 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: hoArX50alxEfEPP/uYMrq9xoC2wjjN8NM6dsaYFofGz7MxMU8eJ/Ut1Ckk7Di
	WlXkQq7puxHc6ZLmSXJMLKIQYMO/W7J9KnheGdVjjgOOYD4n1oDW/goqJjYxJ2UxV7z15Nh
	sCKUj5ATFdShH0fZ3Z76met6sziLiFUlLHNrDf2YbO96hOP5V/3r3Bw1lAjYrzzwZ09RQyb
	PZ7e9XDqR/mkBpOF/7WmOOKygOJ0m4AI38D/6F5KbHU1N+PPporQlCwQaJfHlnrTXLcpoC4
	fvWcXRF5lPdUzBbzJ4U5Y8l2Xuhs4UtFZA3RUVASk1v+gFSdAoFKzWx0G8yxlDHY4QjwIw5
	9c8aGuBN3AIVEJDhjG+BNN3gftyjVB7MLKLWUhyCZv0uHPHoBM=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15960807705076664772
From: Zhangjin Wu <falcon@tinylab.org>
To: falcon@tinylab.org
Cc: arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de,
	w@1wt.eu
Subject: [PATCH v3 0/3] nolibc: add part2 of support for rv32
Date: Tue,  6 Jun 2023 12:25:35 +0800
Message-Id: <20230606042535.354118-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685780412.git.falcon@tinylab.org>
References: <cover.1685780412.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_212555_475489_76D193A5 
X-CRM114-Status: GOOD (  28.09  )
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

Hi, Arnd

Because this patchset is a 'big' change derived from the idea of suggestion
from you [3], I do very welcome your feedback about this change, just like
Thomas suggested, this requires more discussion before Willy plan to determine
merge it or not.

The first two convert all compile failures to a return of -ENOSYS, if you do
like it, welcome your Reviewed-by. These two are required by the coming new
time64 syscalls for rv32, because they depends on how we cope with the
unsupported syscalls, returning -ENOSYS is really better than simply fail the
compiling.

Hi, Thomas, If you are happy with them, welcome your Reviewed-by too, thanks.
If the first two are ok, then, I can focus on preparing the left time64
patchsets.

The third one is not that urgent, because some important syscalls are
still missing for rv32. It is added here only for compile test.

Thanks,
Zhangjin

> Hi, Willy
> 
> This is the v3 part2 of support for rv32, differs from the v2 part2 [1],
> we only fix up compile issues in this patchset.
> 
> With the v3 generic part1 [2] and this patchset, we can compile nolibc
> for rv32 now.
> 
> This is based on the idea of suggestions from Arnd [3], instead of
> '#error' on the unsupported syscall on a target platform, a 'return
> -ENOSYS' allow us to compile it at first and then allow we fix up the
> test failures reported by nolibc-test one by one.
> 
> The first two patches fix up all of the compile failures with '-ENOSYS'
> (and '#ifdef' if required):
> 
>   tools/nolibc: fix up #error compile failures with -ENOSYS
>   tools/nolibc: fix up undeclared syscall macros with #ifdef and -ENOSYS
> 
> The last one enables rv32 compile support:
>   
>   selftests/nolibc: riscv: customize makefile for rv32
> 
> The above compile support patch here is only for test currently, as
> Thomas suggested, for a full rv32 support, it should wait for the left
> parts.
> 
> Welcome your feedbacks, will wait for enough discussion on this patchset
> and then send the left parts one by one to fix up the test failures
> about waitid, llseek and time64 syscalls: ppoll_time64, clock_gettime64,
> pselect6_time64.
> 
> So, I do recommend to apply this patchset, it allows us to send the left
> parts independently, otherwise, all of them should be sent out for
> review together. with this patchset, the rv32 users may be able to use
> nolibc although some syscalls still missing :-)
> 
> Or at least we apply the first two, so, I can manually cherry-pick the
> compile support patch to do my local test, and the other platform
> developer may also benefit from them.
> 
> I'm cleaning up the left parts, but still require some time, I plan to
> split them to such parts:
> 
>   * part3: waitid, prepared, will send out later
>   * part4: llseek, prepared, will send out later
>   * part5: time64 syscalls, ppoll_time64 ok, will finish them next week
>            (It is a little hard to split them)
> 
> Best regards,
> Zhangjin
> ---
> 
> [1]: https://lore.kernel.org/linux-riscv/cover.1685387484.git.falcon@tinylab.org/T/#t
> [2]: https://lore.kernel.org/linux-riscv/cover.1685777982.git.falcon@tinylab.org/T/#t
> [3]: https://lore.kernel.org/linux-riscv/5e7d2adf-e96f-41ca-a4c6-5c87a25d4c9c@app.fastmail.com/
> 
> Zhangjin Wu (3):
>   tools/nolibc: fix up #error compile failures with -ENOSYS
>   tools/nolibc: fix up undeclared syscall macros with #ifdef and -ENOSYS
>   selftests/nolibc: riscv: customize makefile for rv32
> 
>  tools/include/nolibc/sys.h              | 38 ++++++++++++++++---------
>  tools/testing/selftests/nolibc/Makefile | 11 +++++--
>  2 files changed, 34 insertions(+), 15 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
