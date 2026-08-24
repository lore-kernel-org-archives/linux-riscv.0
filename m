Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D43C5DF81
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 08:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ieb5Ef3ZYVq25uo5+1BVjPlUSMppH2jGt1nh6dynpkM=; b=GGeacTetXv6val
	UvRhO1Cl2IuYTfqe1vW5lc0msdf7Vr5NDKRVUaR+spjfK8aPZOGo6RJ0P0Lz8qaL94Cc7gbN7glre
	j2ef5FmgWGk5hkvGKrmiwKUeD3D1S7RSO5PvIyawFO4A8GQTOUG+X5cdQ+8yGGgQL96nURG14QahN
	fHig5XaCTZ4zz56AWV8d9Rwgfe/MirmbOmulQAI5WxHhhdNvOIxAp1Qz0LgK4ZtPeyxuwtMpKLgaQ
	wuvNHTJpGZxbu1eBbyhFhQywYo7z/TgRE68KnmyfzKKIhOmdnTRYfMgy7Ojer/DpNXah/wNjbGnSv
	f+AWYd10PjfmrDJ1pfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPut-0000000GC2Z-44hc;
	Mon, 24 Aug 2026 08:20:27 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPur-0000000GC1u-0KxY
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 08:20:26 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hT3kR0LZJz58fc8;
	Mon, 24 Aug 2026 16:20:15 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl1.zte.com.cn with SMTP id 67O8KCrx069536;
	Mon, 24 Aug 2026 16:20:12 +0800 (+08)
	(envelope-from gao.rui@zte.com.cn)
Received: from mapi (szxlzmapp01[null])
	by mapi (Zmail) with MAPI id mid12;
	Mon, 24 Aug 2026 16:20:14 +0800 (CST)
X-Zmail-TransId: 2b036a8bfebe7ab-463b4
X-Mailer: Zmail v1.0
Message-ID: <20260824162014609hNCaG7r8tJEJFG5w1eUtF@zte.com.cn>
Date: Mon, 24 Aug 2026 16:20:14 +0800 (CST)
Mime-Version: 1.0
From: <gao.rui@zte.com.cn>
To: <aurelien@aurel32.net>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jiangfeng@kylinos.cn>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gcmlzY3Y6IGxpYjogRml4IGFkZHJlc3Mgb3ZlcmZsb3cgZHVlIHRvIGxhcmdlIGNvdW50IHZhbHVlcyBpbiBzdHJubGVuIFpCQiBwYXRo?=
X-MAIL: mse-fl1.zte.com.cn 67O8KCrx069536
X-TLS: YES
X-ENVELOPE-SENDER: gao.rui@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Mon, 24 Aug 2026 16:20:15 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A8BFEBF.000/4hT3kR0LZJz58fc8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_012025_290920_1D46B8B7 
X-CRM114-Status: GOOD (  10.59  )
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

Hi Aurelien,

>On 2026-08-19 16:18, gao.rui@zte.com.cn wrote:
>> Hi all,
>> 
>> This patch fixes an issue in the RISC-V ZBB optimized strnlen implementation.
>> 
>> Problem description: When using the ZBB optimized strnlen implementation, passing very large count values (such as SIZE_MAX) can cause address overflow and return incorrect results.
>> 
>> This issue was observed in device-mapper tests:
>> 
>> sh-5.2# dmsetup create testname9 --table "0 8 zero"
>> sh-5.2# cat /sys/block/dm-*/dm/name
>> testname
>> sh-5.2# dmsetup remove testname9
>> 
>> The overflow in strnlen caused failures in string handling during device-mapper operations.
>> 
>> Patch summary:
>> - Explicitly introduce the strnlen_generic label.
>> - Simplify the generic implementation loop.
>
>This part should be in a separate patch, separated from the bug fix, and 
>if possible with some benchmark.

I agree, I will split the generic implementation changes into a separate patch and provide benchmark results 
to show the performance impact.

>> - Add fallback logic in strnlen_zbb to redirect to the generic path when a0 + a1 overflows.
>> This ensures correct behavior for large count values and SIZE_MAX cases.
>
>Is there a way to instead to fix the strnlen_zbb to avoid the fallback?
>

It is possible to make strnlen_zbb work correctly without fallback, I will reconsider this point:  if the performance loss 
of the non-fallback version turns out to be small, then using the non-fallback code may be acceptable.

Regards,  
Rui

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
