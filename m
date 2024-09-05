Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F488CD4F59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 08:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PipeH/mzWuXKaFm4ZLS0U3MqfJqov7wNhXZ2TKFi0M=; b=gSRvQQCeIkR1Of
	DBs3PGMUqESvhrvkW4fQJLlth6B+ShpijOdsnc6Pvtf19A5vvyi+e1EohFYSlqsf6hyuGEUNE8IpE
	TBxqBHvAbPHY6JvTtBFB0KU5ZqXp8VsJfTuzGu81mQSJPlJY6znTCKdN45JMHTaeBBAJxjHMmyUvr
	0qECjoDMa91bdnNKihliuT4zXcnerauUvHgvoZsL3Ih86BPkbDdhAciP+8jloD+kVc5hJMxKwUpWi
	kX1K+c5k82wSzMY4DIZUj3dZTsDWnUgHGOEv4KDI5yQuchaU+RjVjRXfqsG2arTycxV0OK8yi4WXP
	Tfz3+D/DXtXqvh+7Lz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7ya-00000007btT-3DcE;
	Thu, 05 Sep 2024 08:36:24 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm7yW-00000007bra-2XTd
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 08:36:23 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Wzt400nXyz4f3jkL
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:36:00 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 716D01A172F
	for <linux-riscv@lists.infradead.org>; Thu,  5 Sep 2024 16:36:10 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP4 (Coremail) with SMTP id gCh0CgDXDMl2bdlm2BnOAQ--.51109S2;
	Thu, 05 Sep 2024 16:36:07 +0800 (CST)
Message-ID: <cdd31b81-8171-4dd0-b336-5229559ba50f@huaweicloud.com>
Date: Thu, 5 Sep 2024 16:36:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 03/10] selftests/bpf: Disable feature-llvm for
 vmtest
To: Eduard Zingerman <eddyz87@gmail.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20240904141951.1139090-1-pulehui@huaweicloud.com>
 <20240904141951.1139090-4-pulehui@huaweicloud.com>
 <fc9a03f1809cfdd80a9a8cb7b513e32302be5a43.camel@gmail.com>
 <1bd4056c2b311aca03b7707b077f7555db4e55d6.camel@gmail.com>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <1bd4056c2b311aca03b7707b077f7555db4e55d6.camel@gmail.com>
X-CM-TRANSID: gCh0CgDXDMl2bdlm2BnOAQ--.51109S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4fCw1UGw4UKFW3Gr4xXrb_yoW8Ww48pa
	yrJ3ZIkF48XFyktFsrKa48W3W5K395t3WUX34Uur1DZFn0kFnYgFZ3Kryj9a4kX39rWF43
	Zw12gasrXr1UZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8
	JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_013621_284683_434BC5CB 
X-CRM114-Status: GOOD (  12.57  )
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



On 2024/9/5 7:08, Eduard Zingerman wrote:
> On Wed, 2024-09-04 at 12:37 -0700, Eduard Zingerman wrote:
>> On Wed, 2024-09-04 at 14:19 +0000, Pu Lehui wrote:
>>> From: Pu Lehui <pulehui@huawei.com>
>>>
>>> After commit b991fc520700 ("selftests/bpf: utility function to get
>>> program disassembly after jit"), Makefile will link libLLVM* related
>>> libraries to the user binary execution file when detecting that
>>> feature-llvm is enabled, which will cause the local vmtest to appear as
>>> follows mistake:
>>>
>>>    ./test_progs: error while loading shared libraries: libLLVM-17.so.1:
>>>      cannot open shared object file: No such file or directory
>>>
>>> Considering that the get_jited_program_text() function is a useful tool
>>> for user debugging and will not be relied upon by the entire bpf
>>> selftests, let's turn it off in local vmtest.
>>>
>>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>>> ---
>>
>> I actually don't agree.
>> The __jited tag is supposed to be used by selftests
>> (granted, used by a single selftest for now).
>> Maybe add an option to forgo LLVM linkage when test_progs are compiled?
>> Regarding base image lacking libLLVM -- I need to fix this.
>>
> 
> Please consider using my commit [1] instead of this patch, it forces
> static linking form LLVM libraries, thus avoiding issues with rootfs.
> (This was suggested by Andrii off list).
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/ez/bpf-next.git/commit/?h=selftest-llvm-static-linking&id=263bacf2f20fbc17204fd912609e26bdf6ac5a13

Happy to see this modification only on llvm lib. I test it works good 
and have picked this in next version. Thanks


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
