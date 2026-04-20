Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C6AF55812
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jsVAU1nJVB/nqwRfNErmlUOe3P2HbYOutDcR81KGl34=; b=TKbqUzEgCpDtrC
	l9vKBs2h9h2WOKC1P4Q/JrFnIE9OiHWrGFzUhbW/OhUzrFDZWW1fB22N0hQ0Vo4y/FaySbwzG5A2V
	1OygpmaQn1ATkhqV8L68hKOye6x5K2/RhH5hkOtXgLb5NOgGNbOUDYg3f5taJ1PgDMfbCWYFAyLNd
	zAOjgzxFOZwdnb+JdtXIOD0XddwolkZ7v0DDc7qDqphHGqAfba9t10kQWMdDYa0aDSmztqLt9wC4d
	wdRTiBEBXuy5JfVy6xkfiyeI3w1rzX8Q76hfoN7cv8hqd0HumoXZSW3/1/7VdvxVF1WSqOf1mVN0u
	AUsM3Z1Kv08jPbFy7EUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmbK-00000006mUx-0EdY;
	Mon, 20 Apr 2026 11:15:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmbG-00000006mSf-2kKg
	for linux-riscv@bombadil.infradead.org;
	Mon, 20 Apr 2026 11:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PsqSInb5ZtkBog/nTpH6cnjxDXqD+H4tAhoRrz+V3Lw=; b=BKjArLy6qNb4XZGdnVKOqhEBnk
	K+RxsWDw9xZpaXDh16XPNtSKA6T8JGCYf4T76lvwF4PydI0uct4yehOkRodhR4J846zI4uAkMJTHA
	NaqT8Rz062tm8UCi0Nolk9lfyqphI04t/e5ZVo4T1uD9gKRcgRrLWyo642MIPAtRz0iKPLScQwgaJ
	COoJdRA9HyhhdjIKsJ3l9zmEJ5HIlQlWbzd9kzUvPjxv00K7OvFAaZihmY1tTkyPqBcmgFl0KlxwO
	MNLEpvnn2mHmKMsQRI0kDxQWEKZZQq+7fDIuBMTtENCdm4n5jB4NLw3nSjiWW7sSyL/lPNmjUr/WB
	xSEYZmrQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEmbB-00000007oYZ-3Ufo
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 11:15:33 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cx4erHCuZpbBUCAA--.8036S3;
	Mon, 20 Apr 2026 19:15:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxLMLFCuZp00RxAA--.17475S2;
	Mon, 20 Apr 2026 19:15:18 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC bpf-next 0/2] selftests/bpf: Add support for get_preempt_count()
Date: Mon, 20 Apr 2026 19:15:14 +0800
Message-ID: <20260420111516.19982-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CM-TRANSID: qMiowJBxLMLFCuZp00RxAA--.17475S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtFy3CFy5Zw4UAFWkAF15KFX_yoWfWwb_uF
	Z7Ca4DGFW8CF90yFZ2q3W5ZayDJr4Iq3yrtFWUWr92q348Gr47Wa1xGF92y34fZ345GrZx
	taykJFyfCw42qosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_121530_538286_AD11EFE3 
X-CRM114-Status: UNSURE (   7.65  )
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

This series is based on the latest bpf-next tree.

I can not test the patch #1 on riscv due to no riscv machine, I only
tested the patch #2 with the same change on LoongArch based on the RFC
"LoongArch: Implement CONFIG_THREAD_INFO_IN_TASK" [1], it works well.

I think the patch #1 is right for riscv in theory, because it supports
CONFIG_THREAD_INFO_IN_TASK and there is member preempt_count in struct
thread_info. I hope someone from riscv side can help test this patch.
If no, I will try to test. Thanks in advance.

[1] https://lore.kernel.org/loongarch/20260420102907.4617-1-yangtiezhu@loongson.cn/

Tiezhu Yang (2):
  selftests/bpf: Add riscv support for get_preempt_count()
  selftests/bpf: Add LoongArch support for get_preempt_count()

 tools/testing/selftests/bpf/bpf_experimental.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
