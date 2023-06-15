Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7665DEB64DB
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIDS3cQ6dlPjOUc1eptnOAnGJpUB9GBC2jXROJm5GCw=; b=VNDdjuUYVsPlp8
	NHj3v3ICWbQCm1Q8VZ9tLuyOd81T8WEosGkkP/xfRFtkprU2ogiZLvhboQi7/QCpJ0HPoDnp2wEgX
	I0UWAmDxk6nNVlIT2dMO02YjOtkJum2u4mAr7XMNYILcK5breU3rz6C40XLmHI/Jj8cPQXUzzsIgR
	sgVijrzmkfy1O0Bi0Sa4YJXr5LjsMxbLi5P6btoWs4TqOXnQOGylGxpXWue+ErdkuyvvAe1Z4KgQl
	XpuWv2CN2eaIyRaCJTMgyabj91yTr5lkZ/hVixJp+EFwUwdloWaJvHZlGI7cyF1czMLCSM805VFGZ
	yxDMr51E5VDH/npCa/NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ow8-00FIxw-2b;
	Thu, 15 Jun 2023 15:31:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ow7-00FIxZ-2y
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Jun 2023 15:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=IjsASemYXe70MuG/jFDHUGpgy+oTPQPMzVD6s8GufOQ=; b=j51nMy24ZkeC38dgGJ5DVYtjpP
	5KiAJwMr3yJ1cQz/UJcR0kzUFWz5pKETfc9/NzEef7YqnJtYWK8PzVI/ny2pWTPyPdXmyyjR38mMR
	4C5R1iJ0kbtexIXNRx9LSRGQe980NxGJDLApjwjulkDgj7cM67a88mkASc0brnLH74F8M732GlHRQ
	SizmwxB/uQwgu6Awz8HfIfQBwwaURMeDFnGM9EWn/be/ARHCrZA/klKKjVTtg63P2xnZgSfRWoF3c
	vAV1SaUEFRAKioUgpnV6HV7DMN0p00rA40CnXeQEeLt7weBpmrv+OjR6UFP818gnNGnNNMiMr22Ht
	2+fyqsdw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q9ow1-007nSQ-4M
	for linux-riscv@lists.infradead.org; Thu, 15 Jun 2023 15:30:56 +0000
Received: from loongson.cn (unknown [111.18.159.104])
	by gateway (Coremail) with SMTP id _____8BxrOqdLotkX5oFAA--.11847S3;
	Thu, 15 Jun 2023 23:30:37 +0800 (CST)
Received: from [192.168.68.106] (unknown [111.18.159.104])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTMqbLotkfCscAA--.5583S3;
	Thu, 15 Jun 2023 23:30:36 +0800 (CST)
Message-ID: <901a6a33-7b1f-449e-7089-00aa50329d07@loongson.cn>
Date: Thu, 15 Jun 2023 23:30:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: guoren@kernel.org
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, loongson-kernel@lists.loongnix.cn,
 palmer@dabbelt.com, paul.walmsley@sifive.com, yangtiezhu@loongson.cn
References: <CAJF2gTRqdP-RVSMshwzJuAcm1bBeg1-wZU_k_Oo409=O4QZR-w@mail.gmail.com>
Subject: Re: [PATCH] riscv: uprobes: Restore thread.bad_cause
Content-Language: en-US
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <CAJF2gTRqdP-RVSMshwzJuAcm1bBeg1-wZU_k_Oo409=O4QZR-w@mail.gmail.com>
X-CM-TRANSID: AQAAf8BxTMqbLotkfCscAA--.5583S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E
	5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtV
	W8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY
	1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
	0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU
	7_MaUUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_163053_799023_06C22418 
X-CRM114-Status: UNSURE (   3.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ping, what is the status of this patch which has been received Acked-by
and Reviewed-by:

https://lore.kernel.org/linux-riscv/1682214146-3756-1-git-send-email-yangtiezhu@loongson.cn/

Thanks,
Tiezhu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
