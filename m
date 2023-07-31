Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BCAC001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZBE2TFYEc/7bsAtBz0mS/nUmi2NyAnZRFm0oOHZJTc=; b=IHv7PQUJH1+FHF
	aGkiaGzm2blTnuRF/xQ45CK1+Ik2UCEQvUNhWj5EndqG/Bd7E1f+gFtRrwqypjwFltpZmSJRqu5jJ
	GsfyjesA5nu2zELYQG/xNsU0vo3iIuyDdktf2CS77MlCDiP8EZnVWb0e1ii4BXHZJ8T2GIxFjGpX4
	MSXzucCLIdBQpsXRQxV2X4wGxyzV04zPk8HcJncOsRVy7LiclMAZeVZgdrS/sm8OmBcanTTFjXwHQ
	D1gLCU/UBAR3cHLFD+hr5zV+mFGDsAyaxCVb7mDA6l4HxdCWWbxE/l56p+LKPAgi8f40ibXMjFDbz
	jODbfq6DUNkdVefYyzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPo0-00ExYr-1J;
	Mon, 31 Jul 2023 10:07:12 +0000
Received: from [14.137.139.154] (helo=frasgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPnx-00ExXX-02
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 10:07:10 +0000
Received: from mail02.huawei.com (unknown [172.18.147.229])
	by frasgout12.his.huawei.com (SkyGuard) with ESMTP id 4RDtq05J48z9xFbh
	for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 17:53:32 +0800 (CST)
Received: from [10.81.219.160] (unknown [10.81.219.160])
	by APP2 (Coremail) with SMTP id GxC2BwAnJu62h8dkLd4OAA--.410S2;
	Mon, 31 Jul 2023 11:06:51 +0100 (CET)
Message-ID: <3b9860b2-2acf-7332-13d6-447e3fa6dd5a@huaweicloud.com>
Date: Mon, 31 Jul 2023 12:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: How to deal with openSBI reserved regions?
Content-Language: en-US
To: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
References: <76ff0f51-d6c1-580d-f943-061e93073306@huaweicloud.com>
 <fc8bf20a-487c-c097-ce81-097095327a4f@ghiti.fr>
From: Petr Tesarik <petrtesarik@huaweicloud.com>
Cc: Li Zhengyu <lizhengyu3@huawei.com>
In-Reply-To: <fc8bf20a-487c-c097-ce81-097095327a4f@ghiti.fr>
X-CM-TRANSID: GxC2BwAnJu62h8dkLd4OAA--.410S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW8tr4DZF1fJw1rJr4UCFg_yoW8ZFyrpF
	WrGay8GF4kGr1Ikws2ya18Wa4rC3WSkFW5Kr4kXr9YkrnxuryfZrWa9Fya9F9ruF1rK3W2
	vrWqkFy3Z3WDZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0E
	wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
	k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_030709_344411_63F3C857 
X-CRM114-Status: GOOD (  16.86  )
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

Hi Alexandre,

On 7/28/2023 12:36 PM, Alexandre Ghiti wrote:
> Hi Petr,
> 
> 
> On 28/07/2023 12:02, Petr Tesarik wrote:
>> Hi all,
>>
>> I have recently looked into enabling crash kernel and kdump on riscv64.
>> I can start a new kernel after crash, but I ran into an issue when
>> reading /proc/vmcore there.
>>
>> I am testing this inside a QEMU VM and I boot my system in S-Mode using
>> U-Boot with mbedded openSBI firmware. The problem here is that openSBI
>> occupies the first 128 pages of RAM, but they are shown as "System RAM"
>> in /proc/iomem. The kexec_file_load(2) system call uses
>> walk_system_ram_res() to build a memory map of the currently running
>> kernel. This is then passed to the crash kernel through ELF core headers
>> as a LOAD segment. When reading the corresponding part of /proc/iomem,
>> the crash kernel tries to map these pages, but they can be accessed only
>> from M-Mode. Any attempt to access them from the Linux kernel fails with
>> a PMP violation. Consequently, -EFAULT is returned to user space.
>>
>> Now, the openSBI area is represented in the Device Tree with a
>> reserved-memory node () which overlaps a memory node. Technically, the
>> firmware region is indeed RAM, but how should it be excluded from
>> /proc/iomem?
>>
>> Should this be fixed in the kernel?
>>
>> Or, is the provided DTB incorrect?
>> Should the memory node exclude the firmware area?
> 
> 
> Which version of openSBI are you using? We fixed something similar in
> 1.3 by reintroducing the "nomap" property to the regions occupied by
> openSBI, I'd say it should be enough, let me know if it's not!

It took me some time to find out which version of OpenSBI was actually
used, and it was OpenSBI 1.2, built from a copy in the QEMU 8.0.3 source
tree.

I rebuilt openSBI from git sources, and I can confirm that commit
8153b2622b08 fixes the issue for me. It allows me to read the complete
/proc/vmcore from a crash kernel environment. In short, the "no-map"
attribute is also sufficient here.

Thanks for the advice!

Petr T


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
