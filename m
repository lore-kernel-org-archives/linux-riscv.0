Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8674EC0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 10:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rp5YJanU7L1U7m83PpNOwV3NmtHrfWhpf8AiJ3hUssc=; b=BLfFzoUcfumfZX
	ZkLFShA+CVuqkIjWv7ibFNJaMgxVdG+FtnITqzQjD5ljK9AoWUbtCkdsrbY9A9xKd8ON48cKuVBIK
	p2aIP9N7+0ga0mo0ViH6S2jJd0aZDRJqpAqgDzMs+wO+oC4FLyWdm0p6sAoCSa3xhbBcrK/D8Pa/X
	peORb0sXcXWAkErJMsOZh6gmkWzB9Oj0/tMQsu8vSQUEz5+gTzjbLVVN4qz/5e5FzsG78pvrXISvo
	E9kQCjcKUYEKJXz5ECw7t1prOIo8nxWM0oYeeY5xMdrUMqSUz1ZoAjdrtCqdhkq7tzTNJJZqWlm/d
	b1JJM9ld5U34ESfYKvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKJY-002l3E-2L;
	Fri, 28 Jul 2023 10:03:16 +0000
Received: from [14.137.139.23] (helo=frasgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPKJV-002kyv-0t
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 10:03:14 +0000
Received: from mail02.huawei.com (unknown [172.18.147.228])
	by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4RC2wG00Cvz9xGh4
	for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 17:51:41 +0800 (CST)
Received: from [10.81.203.237] (unknown [10.81.203.237])
	by APP1 (Coremail) with SMTP id LxC2BwDXWwdPksNkBKEqBQ--.38278S2;
	Fri, 28 Jul 2023 11:02:59 +0100 (CET)
Message-ID: <76ff0f51-d6c1-580d-f943-061e93073306@huaweicloud.com>
Date: Fri, 28 Jul 2023 12:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: linux-riscv@lists.infradead.org
Content-Language: en-US
From: Petr Tesarik <petrtesarik@huaweicloud.com>
Subject: How to deal with openSBI reserved regions?
X-CM-TRANSID: LxC2BwDXWwdPksNkBKEqBQ--.38278S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Jw4DKFWfJFWDGr45Gw4fGrg_yoW8Jr1rpF
	4rJry0yFWkCF92k340yF48CFyrC3WftFWYg34kCr95Cr15Wry8ZrySvFy2vF17GF1vk3Wa
	vFWDtry7C3Z8ZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jr0_JrylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_030313_450766_7C71E191 
X-CRM114-Status: UNSURE (   6.93  )
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

Hi all,

I have recently looked into enabling crash kernel and kdump on riscv64.
I can start a new kernel after crash, but I ran into an issue when
reading /proc/vmcore there.

I am testing this inside a QEMU VM and I boot my system in S-Mode using
U-Boot with mbedded openSBI firmware. The problem here is that openSBI
occupies the first 128 pages of RAM, but they are shown as "System RAM"
in /proc/iomem. The kexec_file_load(2) system call uses
walk_system_ram_res() to build a memory map of the currently running
kernel. This is then passed to the crash kernel through ELF core headers
as a LOAD segment. When reading the corresponding part of /proc/iomem,
the crash kernel tries to map these pages, but they can be accessed only
from M-Mode. Any attempt to access them from the Linux kernel fails with
a PMP violation. Consequently, -EFAULT is returned to user space.

Now, the openSBI area is represented in the Device Tree with a
reserved-memory node () which overlaps a memory node. Technically, the
firmware region is indeed RAM, but how should it be excluded from
/proc/iomem?

Should this be fixed in the kernel?

Or, is the provided DTB incorrect?
Should the memory node exclude the firmware area?

Petr T


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
