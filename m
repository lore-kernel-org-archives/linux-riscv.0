Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE9CC61DBC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Mime-Version:Cc:To:Message-Id:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LLOkwRs9Yss0Nv/GA58gXbs2vR/JY+9y2AQB27xsGac=; b=i4QLMnOTCFv5QemYdIROxLwQ9j
	xFa1OvcfEl0kmk0CSrNI1wOFJ4jjpjJLyNZ8r7lMzuT2tbh6xrdnDR0N3ZG3PunmhBhTZXTWxzyML
	ldip6XWJVdp8ytcfcbSVSjT7aKNH+OZHThUN/Uf8P2+Cxf8APaHS6KYL0RtHIanWPMDsJK3H+8wf0
	W+xdh3ve0SRjZvFb9MTXSb1t1tbximRm17MLfOY8yEBI5wxHLsk2XXxGVvBuc30jwMmzdW1iw+qq0
	9PNVhjSnJuYT8tjnef0SjtaeycxsLDmpEVm1sGDpWUhZrT106PQwi1eW4W0UNPFQly5fay/qGZk0W
	rSUnq/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyll0-00000000Iqr-0R4l;
	Tue, 25 Aug 2026 07:39:42 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylkx-00000000Iol-0e0n
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 07:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1787643568; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=q7zPMmqRJkJjVLdvMHDlbcmHxR9pKIRa+xbuMm1XbXc=;
 b=LveF5K9b1hGh4OWFzBviShR3pz1FCET6H4GG5WCdS9++xOvhR8MGmdBDaTbTeJf+CKi90V
 xCe8ECYapx742Q2qonQjIuSQHiGQ7Qavdj5ROPXIlyO6hXWMRNtGL+OsGjBlRBsWMCUUdy
 KWu6iW6eUHX1yxRJ54OXeAUwUb0Wu8C7OP0EbT0s3C4tI4F0qmvCeFpHZfDC2oSoc4rVI/
 25Gp5q5S4T+lIoHo/dJAWXixtlnt7pOlHBURqgT2m1TQwVB03wnlzekBtEUlTklwCm8bCl
 bobIy9IAnZphBUvPvC790M53Zk9BzZkJK3QU0sfFBFisOa9TQySTm3sEOUIYBg==
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Tue, 25 Aug 2026 15:39:23 +0800
Message-Id: <ab423d7d-4402-47c5-aa3f-bf2fe85322e7@picoheart.com>
Content-Language: en-US
To: "Paul Walmsley" <pjw@kernel.org>
Cc: <yang.yicong@picoheart.com>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>
Mime-Version: 1.0
In-Reply-To: <6108297c-73b7-a04b-67d9-2ef444eecb60@kernel.org>
References: <20260728094627.94975-1-yang.yicong@picoheart.com> <20260728094627.94975-3-yang.yicong@picoheart.com> <6108297c-73b7-a04b-67d9-2ef444eecb60@kernel.org>
X-Lms-Return-Path: <lba+26a8d46ae+43a7f8+lists.infradead.org+yang.yicong@picoheart.com>
Subject: Re: [PATCH v2 2/6] riscv: insn: Set sstatus.MXR when reading userspace instruction
User-Agent: Mozilla Thunderbird
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Received: from [100.86.213.231] ([61.141.241.116]) by smtp.feishu.cn with ESMTPS; Tue, 25 Aug 2026 15:39:25 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_003939_593096_7C7028DF 
X-CRM114-Status: UNSURE (   9.43  )
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

On 8/25/26 8:06 AM, Paul Walmsley wrote:
> Hi,
> 
> On Tue, 28 Jul 2026, Yicong Yang wrote:
> 
>> The __read_insn() uses get_user() to read userspace instructions.
>> Bo Gan noticed that get_user() is insufficient in this case since
>> it's possible for the instruction segment mapped as execute-only
>> and get_user() doesn't have permissions to load it. The architecture
>> provides sstatus.MXR for handling this so set MXR when reading
>> userspace instruction.
> 
> If this patch fixes a bug with the preceding patch, it would
> better just to roll the fix into the original patch.


sure, will squash into previous one.

I used to split the refactor (preceding) and fix (current)
to separate patches for better review.

thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
