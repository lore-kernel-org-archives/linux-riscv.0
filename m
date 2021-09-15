Return-Path: <SRS0=puBH=OF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F41C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 14:20:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3815B6113E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Sep 2021 14:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3815B6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1tOJwg2SgLAkBv9LcQhVVzpFOd36cgskl150ZxsZgl4=; b=Djo56iyuECHrWM
	KHF5+LPZSn/+Z46yYp/aTSm+G20+5eoyFGQikqex0qYFz/K8AjR9t0wTeVemD4TUhDORf5jvpGid9
	cEWQ1Jrr5kT5xkx6dZLaO3KEu1e8d9/yp/cL1N9iX5lW2mvMRo6sZ+lYSJwu2Mnn+2fixffC18KL4
	M2Sjm55ZRCKpAXYZbfGiKGizWzcOmmCiOxUPv+TFIP78089Qud3MJtzTIzcnApYK8GtEO0wx+iEvg
	UgE3Rxs3Yant+Ga7dK3jSEiq8Xm1lVWUAUObIjgFsMVlWeI3kLC1JKMlwQghakCrqXrWYhrazGSlw
	3AEl1GNAYfJfJ9U97Rzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQVm5-009JBP-BL; Wed, 15 Sep 2021 14:20:33 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQVm2-009JA5-Ld
 for linux-riscv@lists.infradead.org; Wed, 15 Sep 2021 14:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=lGE+Rv+IpTCKApNbwPrHsSYQLyTZJbmNPD
 mn7uJtvN8=; b=Qex+ZoxP/boeVGDclKNl06N/cZRKrAeUDHarEsIvo49PgzvPAF
 5yy24cBmA8Yw/LHbyNI+7ShC38DqXw5BJ53QpfOdifnc11Cy1PtJT+n82aSYP64A
 pjbQKglgMj+lWW+22R7Y1a6xDPnli7Orm08bNP62tUoddTaFUgpZ0yGho=
Received: from xhacker (unknown [101.86.20.138])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygDnIqojAUJh8LsBAA--.986S2; 
 Wed, 15 Sep 2021 22:20:19 +0800 (CST)
Date: Wed, 15 Sep 2021 22:13:52 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Chen Huang <chenhuang5@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [SPAM] [PATCH 0/2] riscv: improve unaligned memory accesses
Message-ID: <20210915221353.634c6a78@xhacker>
In-Reply-To: <20210913121956.1776656-1-chenhuang5@huawei.com>
References: <20210913121956.1776656-1-chenhuang5@huawei.com>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygDnIqojAUJh8LsBAA--.986S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFyDtrWfKrykZr47Xr4UCFg_yoW3XFbEkr
 97A34kW3y8ta18AasFqr4furyagFW8CFyYkFnFvr13JF17ZF1xG3ZYy34jqr18Ja1IvFn7
 J3s3Jw1SyryftjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbFxYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
 1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
 JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
 WUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
 Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j189NUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_072031_184350_620DD5A3 
X-CRM114-Status: UNSURE (   6.76  )
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

On Mon, 13 Sep 2021 12:19:54 +0000
Chen Huang <chenhuang5@huawei.com> wrote:

> The RISCV ISA can support unaligned memory accesses, so the patchset
> selects HAVE_EFFICIENT_UNALIGNED_ACCESS and supports DCACHE_WORD_ACCESS

NO, per the spec, "Even when misaligned loads and stores complete
successfully, these accesses might run extremely slowly depending on the
implementation". it's far away from "efficient"

> to improve the efficiency of unaligned memory accesses.
> 
> Chen Huang (2):
>   riscv: Kconfig: select HAVE_EFFICIENT_UNALIGNED_ACCESS
>   riscv: Support DCACHE_WORD_ACCESS
> 
>  arch/riscv/Kconfig                      |  2 ++
>  arch/riscv/include/asm/word-at-a-time.h | 36 +++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
