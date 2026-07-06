Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D4BC43458
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 07:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38i2XUjOVX3sIOCF+rbD7nPhRclIwxBYQQAKhmGzsc8=; b=TpZKiAO5kMI3ii
	nWVl8BWnPO6OgSHV20Yoe6f3dhEn9rDY4nM+NFOkh/bvlMYvfcSICP7rdxLdEpZvEehAY1RDwJzx3
	8d16Xw/ESk79WtOiN/JdzxfLq1GTUXgqq4Y4k+aSD7OPnNeJmJgc22ZiyJiDPiqMo7LxOhftCKHKq
	kuqtBoCkr4QlzfvAg/miH4oCL1Vx3ed4EADWDzZVG5FV+lBaBsxqEJTIuva22XAllgCdR/yPGQ2UX
	7d/tfIe6zoiVvUA6pgAzDCays3TFiFKiIgOFnnAk9qNBetkHsCEN34MnPFlIIVnzguudHEYBTHus1
	n6u9OUQZ3LiOmbyZeO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdgO-0000000BixA-1p1H;
	Mon, 06 Jul 2026 07:24:00 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdgM-0000000BiwF-1Qid
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 07:24:00 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gtwnx5rVQzYQtFR
	for <linux-riscv@lists.infradead.org>; Mon,  6 Jul 2026 15:23:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 0FA8A40592
	for <linux-riscv@lists.infradead.org>; Mon,  6 Jul 2026 15:23:51 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgB3qVoGWEtqqtDzAA--.50057S2;
	Mon, 06 Jul 2026 15:23:50 +0800 (CST)
Message-ID: <bf647816-d292-419c-b79f-fc048122aebc@huaweicloud.com>
Date: Mon, 6 Jul 2026 15:23:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v4 6/6] selftests/bpf: Remove tailcalls tests
 from DENYLIST.riscv64
Content-Language: en-US
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: bjorn@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com,
 martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
References: <20260629140048.733346-7-pulehui@huaweicloud.com>
 <0c8408eb97828eb59c171d971793a92654f8018ada812d6ac1703330ec4059fb@mail.kernel.org>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <0c8408eb97828eb59c171d971793a92654f8018ada812d6ac1703330ec4059fb@mail.kernel.org>
X-CM-TRANSID: gCh0CgB3qVoGWEtqqtDzAA--.50057S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF43KF4ruw18Aw17AF4kCrg_yoWDJwb_WF
	4Iyr93W3y8Jay7WF48Ca1UXrnxuan7ua4UAw15Jry3WrnFkrs5uF9rXrs0vryUWa9xWr9r
	ZayrJ3y5Kw4UGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	7PEDUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_002358_563556_A9113790 
X-CRM114-Status: UNSURE (   7.67  )
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



On 2026/6/30 0:19, bot+bpf-ci@kernel.org wrote:
>> selftests/bpf: Remove tailcalls tests from DENYLIST.riscv64
>>
>> Remove tailcalls tests from DENYLIST.riscv64.
>>
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> 
> This isn't a bug, but the changelog restates the subject and the diff
> without saying why the entry can be dropped now.
> 
> The deny-list line being removed documented that the JIT could not mix
> bpf2bpf and tailcalls, and the preceding commit "riscv, bpf: Mixing
> bpf2bpf and tailcalls" adds that support.
> 
> Could the changelog note that the RV64 JIT now supports mixing bpf2bpf
> and tailcalls, rather than restating the diff?

alright, will add more detail to commit msg.

> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/28384109028


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
