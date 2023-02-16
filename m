Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DCCC636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 01:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JfqGwlxSyA9W9JmQ5L4dIiaz+uBgYQPzxSMVZrmP7I=; b=MVt+QnkwuOW/WO
	DQOui2M+TrUU80eA0A6Cnh7oqBf7LHSzyWFCDh9FRG9V+XEZjqYvsId1GPrlTi0Cu4F3JMRhghUZu
	38cqcCIWehsXvjDcu7Gv0oTanR2SYAYA+H1EdJDXBiUyB2kNFd65zpON+g3vQxPUM8uX+fZ2QpKdk
	7bfFA9APur1c+7seyqH7LrJK0LJcore5lRBcy6Htq8r8/7MHU1JrV45vC9BgVubjxr8mGa60rEo6e
	0Dtf9LmGRMgSiK8d+Qu+Nc8xVwDg4/BiM6B/BP0a+VqSnFnqf1dOK40TRJLS8vnxKa7Z1dSOnNMa9
	ftYdAcrsIsgdC1V0bXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSSun-008BYo-Sk; Thu, 16 Feb 2023 01:18:25 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSSuj-008BXG-D7
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 01:18:23 +0000
Received: from mail02.huawei.com (unknown [172.30.67.153])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4PHHBW3P7Qz4f3jYl
	for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 09:18:11 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgDHd6tUhO1jysPPDg--.59609S2;
	Thu, 16 Feb 2023 09:18:13 +0800 (CST)
Message-ID: <8ca81321-8842-eb0a-35f1-46a2616d5fba@huaweicloud.com>
Date: Thu, 16 Feb 2023 09:18:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next v1 1/4] riscv: Extend patch_text for multiple
 instructions
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20230215135205.1411105-1-pulehui@huaweicloud.com>
 <20230215135205.1411105-2-pulehui@huaweicloud.com> <Y+1evzv1PkuETdVm@spud>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <Y+1evzv1PkuETdVm@spud>
X-CM-TRANSID: gCh0CgDHd6tUhO1jysPPDg--.59609S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYI7kC6x804xWl14x267AKxVW5JVWrJwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
	0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xv
	wVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4
	x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
	1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
	3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjxUFDGOUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_171821_633970_9F4BB0BD 
X-CRM114-Status: UNSURE (   7.53  )
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



On 2023/2/16 6:37, Conor Dooley wrote:
> On Wed, Feb 15, 2023 at 09:52:02PM +0800, Pu Lehui wrote:
>> From: Pu Lehui <pulehui@huawei.com>
>>
>> Extend patch_text for multiple instructions. This
>> is the preparaiton for multiple instructions text
>> patching in riscv bpf trampoline, and may be useful
>> for other scenario.
> 
> In the future, please use the full width for your commit message (or
> fix your editor if it thinks fifty-something chars is the full width).
> 

Thanks Conor, will try to fix it.

> Otherwise, looks grand...
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
