Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59820C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  7 May 2022 00:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5s6YBIhxNmJay1k0H5LG8xjVmuqgOrFd0ZlRTAeMSg=; b=IVALF8ysKxub4RBBSTPo/pEQ+5
	pyUnKItDPDAOPcWWQkLITJPdFuTt3L8rPtdyNHiqjKrGgl934f+5rxQdv7Xgq6jlcQc+mFc+EDoAu
	KwxRncItMmH1eWK8CH1rZEMcQ6K3JUc1XMz6MZbc+ohSVuuCuNsXNiSPcNiv+0tDzTAn11TfL1SZ/
	2J+Su7xO2Vu4k38rJuUypDTzXy0fPrnIrVW8VgETu6hI+f/lfcV8DnB+Sh5CiocrVN90h5CWhXAL4
	iYrnLObKbrsx88rYoJW+YT5Si9dO1zmKAVcOvVDIOnF3wddG9cuhhvidBJsCsmdL4ZzO2fF568zqA
	hv1MtlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn8f6-005VqR-Ew; Sat, 07 May 2022 00:51:08 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn8f3-005VoT-UU
 for linux-riscv@lists.infradead.org; Sat, 07 May 2022 00:51:07 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Kw81W5kmDzGpLg;
 Sat,  7 May 2022 08:48:15 +0800 (CST)
Received: from dggpemm500019.china.huawei.com (7.185.36.180) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 08:51:00 +0800
Received: from [10.67.109.184] (10.67.109.184) by
 dggpemm500019.china.huawei.com (7.185.36.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 7 May 2022 08:51:00 +0800
Subject: Re: [PATCH bpf-next v2 1/2] bpf: Unify data extension operation of
 jited_ksyms and jited_linfo
To: John Fastabend <john.fastabend@gmail.com>, <bpf@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Martin KaFai Lau
 <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
 KP Singh <kpsingh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20220429014240.3434866-1-pulehui@huawei.com>
 <20220429014240.3434866-2-pulehui@huawei.com>
 <62758a83b512a_18fd5208b5@john.notmuch>
From: Pu Lehui <pulehui@huawei.com>
Message-ID: <7e1ef7a3-582b-7443-8018-69126efdc587@huawei.com>
Date: Sat, 7 May 2022 08:51:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <62758a83b512a_18fd5208b5@john.notmuch>
Content-Language: en-US
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500019.china.huawei.com (7.185.36.180)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_175106_357470_8D5E30DC 
X-CRM114-Status: GOOD (  16.59  )
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



On 2022/5/7 4:52, John Fastabend wrote:
> Pu Lehui wrote:
>> We found that 32-bit environment can not print bpf line info due
>> to data inconsistency between jited_ksyms[0] and jited_linfo[0].
>>
>> For example:
>> jited_kyms[0] = 0xb800067c, jited_linfo[0] = 0xffffffffb800067c
>>
>> We know that both of them store bpf func address, but due to the
>> different data extension operations when extended to u64, they may
>> not be the same. We need to unify the data extension operations of
>> them.
>>
>> Signed-off-by: Pu Lehui <pulehui@huawei.com>
>> ---
>>   kernel/bpf/syscall.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
>> index e9e3e49c0eb7..18137ea5190d 100644
>> --- a/kernel/bpf/syscall.c
>> +++ b/kernel/bpf/syscall.c
>> @@ -3871,13 +3871,16 @@ static int bpf_prog_get_info_by_fd(struct file *file,
>>   		info.nr_jited_line_info = 0;
>>   	if (info.nr_jited_line_info && ulen) {
>>   		if (bpf_dump_raw_ok(file->f_cred)) {
>> +			unsigned long jited_linfo_addr;
>>   			__u64 __user *user_linfo;
>>   			u32 i;
>>   
>>   			user_linfo = u64_to_user_ptr(info.jited_line_info);
>>   			ulen = min_t(u32, info.nr_jited_line_info, ulen);
>>   			for (i = 0; i < ulen; i++) {
>> -				if (put_user((__u64)(long)prog->aux->jited_linfo[i],
>> +				jited_linfo_addr = (unsigned long)
>> +					prog->aux->jited_linfo[i];
>> +				if (put_user((__u64) jited_linfo_addr,
>>   					     &user_linfo[i]))
> 
> the logic is fine but i'm going to nitpick a bit this 4 lines is ugly
> just make it slightly longer than 80chars or use a shoarter name? For
> example,
> 
> 			for (i = 0; i < ulen; i++) {
> 				unsigned long l;
> 
> 				l = (unsigned long) prog->aux->jited_linfo[i];
> 				if (put_user((__u64) l, &user_linfo[i]))
> 
> is much nicer -- no reason to smash single assignment across multiple
> lines. My $.02.
> 

Okay, It sounds good. I will make change in next version. Thanks.

> Thanks,
> John
> .
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
