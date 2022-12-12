Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB88C4167B
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Dec 2022 08:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SipxU1CJD51+6cmA/j6APfsj3Ubiaety2Gb66+NEkIo=; b=s1DFGCoq6XpKD/
	uKwvladggQ0cLwuOW70THEwvlQ8SfIMBVb7zR9Jr/RZM9GP4DnULhFh+b9cwsJKjS+mSXQPhTB+OP
	PDAHy7U6GIDUJ4GZEx+FpOKMR/JQP6y3QBVbQU1HUX87wWue88Q/bMVzsL2wsv4SRF7ilg1veAW3V
	CGD2tOBfg8aM0ZIEjXHbqhZep61k1+Q0KKgtQBZD/OB3Bg5Rp+jKpKwOCmTkHTxyQbWbNOUTGPezr
	O0RF6kZr0m69Zh0fcAOe+BZi1gqmg5Nen5MbHrcPrVnYee9giFT8k8YMDTxOzbJQXjt7//da7XHSP
	Lcctsk9OejSXHYZ+zFYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dyc-009wlu-UR; Mon, 12 Dec 2022 08:15:55 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4dyY-009wbz-Nn
	for linux-riscv@lists.infradead.org; Mon, 12 Dec 2022 08:15:53 +0000
Received: from [198.18.0.1] (unknown [59.59.28.169])
	by APP-05 (Coremail) with SMTP id zQCowAAHD+8v45Zj8LGqBg--.59819S2;
	Mon, 12 Dec 2022 16:15:44 +0800 (CST)
Message-ID: <f605e23d-5f81-8ac0-eebd-b6885612308c@iscas.ac.cn>
Date: Mon, 12 Dec 2022 16:15:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH RESEND v10 0/3] riscv, mm: detect svnapot cpu support at
 runtime
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, jeff@riscv.org,
 xuyinan@ict.ac.cn, conor@kernel.org
References: <20221212075223.806705-1-panqinglin2020@iscas.ac.cn>
 <20221212080759.h6zfibqq4es2hijl@kamzik>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <20221212080759.h6zfibqq4es2hijl@kamzik>
X-CM-TRANSID: zQCowAAHD+8v45Zj8LGqBg--.59819S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrWUGr1xCrW5Aw1rCF1xZrb_yoW5Zr18pa
	yUGFn3CFZ8Ar93GF4SvrnF9r1rtw4rGFW2qw1fJ3srAwnxtFWUAw4DKF9Yk34kXFWfXr1I
	yF45ZFyj9a4DA37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9ab7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x0
	82IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGw
	Av7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0
	xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==
X-Originating-IP: [59.59.28.169]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCQISDGOWle-sngAAso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_001551_177979_19F346CC 
X-CRM114-Status: GOOD (  16.74  )
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



On 2022/12/12 16:07, Andrew Jones wrote:
> Hi Qinglin,
> 
> This is actually v11, not a v10 resend. And please don't send new versions
> minutes after sending previous versions. v10 is still under review and
> discussion.
> 
> Thanks,
> drew

Hi Andrew,

Thanks for the notification. I will send v11 after a few days.

Thanks,
Qinglin.

> 
> On Mon, Dec 12, 2022 at 03:52:20PM +0800, panqinglin2020@iscas.ac.cn wrote:
>> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>>
>> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
>> page. This patch set is for using Svnapot in hugetlb fs and huge vmap.
>>
>> This patchset adds a Kconfig item for using Svnapot in
>> "Platform type"->"SVNAPOT extension support". Its default value is on,
>> and people can set it off if they don't allow kernel to detect Svnapot
>> hardware support and leverage it.
>>
>> Tested on:
>>    - qemu rv64 with "Svnapot support" off and svnapot=true.
>>    - qemu rv64 with "Svnapot support" on and svnapot=true.
>>    - qemu rv64 with "Svnapot support" off and svnapot=false.
>>    - qemu rv64 with "Svnapot support" on and svnapot=false.
>>
>>
>> Changes in v2:
>>    - detect Svnapot hardware support at boot time.
>> Changes in v3:
>>    - do linear mapping again if has_svnapot
>> Changes in v4:
>>    - fix some errors/warns reported by checkpatch.pl, thanks @Conor
>> Changes in v5:
>>    - modify code according to @Conor and @Heiko
>> Changes in v6:
>>    - use static key insead of alternative errata
>> Changes in v7:
>>    - add napot_cont_order for possible more napot order in the future
>>    - remove linear mapping related code from this patchset to another patch
>>    - refactor hugetlb code for svnapot according to thanks @Andrew @Conor
>>    - use tools/testing/selftests/vm/map_hugetlb as hugetlb testing program
>>    - support svnapot in huge vmap on newer for-next branch
>> Changes in v8:
>>    - fix compilation errors in rv32_defconfig
>>    - insert some lines of whitespace according to @Conor's suggestion
>> Changes in v9:
>>    - use alternative to avoid using static branches inside heavily used
>>      inline functions
>>    - change napot_cont_mask definition
>>    - post test_vmalloc modification about testing vmalloc_huge
>> Changes in v10:
>>    - fix some nits caught by @Andrew
>>    - collect Reviewed-by/Acked-by
>>    - add memory leak warning in KConfig text
>>    - replace test_vmalloc patch link with the standard one
>>
>>
>> Qinglin Pan (3):
>>    riscv: mm: modify pte format for Svnapot
>>    riscv: mm: support Svnapot in hugetlb page
>>    riscv: mm: support Svnapot in huge vmap
>>
>>   arch/riscv/Kconfig                   |  21 +-
>>   arch/riscv/include/asm/errata_list.h |  15 +-
>>   arch/riscv/include/asm/hugetlb.h     |  34 ++-
>>   arch/riscv/include/asm/hwcap.h       |   2 +-
>>   arch/riscv/include/asm/page.h        |   5 -
>>   arch/riscv/include/asm/pgtable-64.h  |  34 +++
>>   arch/riscv/include/asm/pgtable.h     |  43 +++-
>>   arch/riscv/include/asm/vmalloc.h     |  61 +++++-
>>   arch/riscv/kernel/cpu.c              |   1 +
>>   arch/riscv/kernel/cpufeature.c       |  15 ++
>>   arch/riscv/mm/hugetlbpage.c          | 301 +++++++++++++++++++++++++++
>>   11 files changed, 519 insertions(+), 13 deletions(-)
>>
>> -- 
>> 2.37.4
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
