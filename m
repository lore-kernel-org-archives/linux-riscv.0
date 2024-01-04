Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7774C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RK//i/K/3XzSF9ci3cabArByBVmUeim2OjXa/vnUto=; b=F64shmJKcM7vXW
	eUQ5hqZowrP9V2m1RwUCm6+xCNdc/jgfJDYPumcpWa5Zb6phlZGvM9gEULqUAZ2rZwPU0Lct59Xjg
	HCnGlaL6Gv0vx0Xau+B7y8vQsteyy7skOdTFT1FiyN6puE2jXJbHzkpSLCt46LPyRFZacvk8OkXhM
	vEk4Rgj0OvNFRkjhaejG42OU+ItqVS9/21SQ/4ypx+HP6Sp4F8S2iZzvW5vLLnVXacS2s+TLf2S1V
	ywZmRrQYrBbaF+/eAWdpZHUfeslbnI/oWVWn7spaYwd/v+U0s3e9X5MdPhGiKw8acmuujI7QVvIda
	iHyFJ5siRr9hXrGXi/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLGsY-00CwtR-23;
	Thu, 04 Jan 2024 06:06:54 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rLGsX-00Cwt8-0b;
	Thu, 04 Jan 2024 06:06:53 +0000
Message-ID: <1ab4ff24-4e67-43d7-90b7-0131182b7e1f@infradead.org>
Date: Wed, 3 Jan 2024 22:06:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jan 2 (riscv & KVM problem)
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 KVM list <kvm@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>
References: <20240102165725.6d18cc50@canb.auug.org.au>
 <44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org>
 <20240103-d2201c92e97755a4bb438bc3@orel>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240103-d2201c92e97755a4bb438bc3@orel>
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



On 1/3/24 07:18, Andrew Jones wrote:
> On Tue, Jan 02, 2024 at 10:07:21AM -0800, Randy Dunlap wrote:
>>
>>
>> On 1/1/24 21:57, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20231222:
>>>
>>
>> It is possible for a riscv randconfig to create a .config file with
>> CONFIG_KVM enabled but CONFIG_HAVE_KVM is not set.
>> Is that expected?
>>
>> CONFIG_HAVE_KVM_IRQCHIP=y
>> CONFIG_HAVE_KVM_IRQ_ROUTING=y
>> CONFIG_KVM_MMIO=y
>> CONFIG_HAVE_KVM_MSI=y
>> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
>> CONFIG_HAVE_KVM_VCPU_ASYNC_IOCTL=y
>> CONFIG_KVM_XFER_TO_GUEST_WORK=y
>> CONFIG_KVM_GENERIC_HARDWARE_ENABLING=y
>> CONFIG_KVM_GENERIC_MMU_NOTIFIER=y
>> CONFIG_VIRTUALIZATION=y
>> CONFIG_KVM=m
>>
>> Should arch/riscv/kvm/Kconfig: "config KVM" select HAVE_KVM
>> along with the other selects there or should that "config KVM"
>> depend on HAVE_KVM?
> 
> We probably should add a patch which makes RISCV select HAVE_KVM and
> KVM depend on HAVE_KVM in order for riscv kvm to be consistent with
> the other KVM supporting architectures.
> 

Yes, I agree.

>>
>>
>> The problem .config file causes build errors because EVENTFD
>> is not set:
>>
>> ../arch/riscv/kvm/../../../virt/kvm/eventfd.c: In function 'kvm_irqfd_assign':
>> ../arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:19: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Werror=implicit-function-declaration]
>>   335 |         eventfd = eventfd_ctx_fileget(f.file);
>>       |                   ^~~~~~~~~~~~~~~~~~~
>>       |                   eventfd_ctx_fdget
>> ../arch/riscv/kvm/../../../virt/kvm/eventfd.c:335:17: warning: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>   335 |         eventfd = eventfd_ctx_fileget(f.file);
>>       |                 ^
>>
> 
> Hmm. riscv kvm selects HAVE_KVM_EVENTFD, which selects EVENTFD. I'm
> not sure how the lack of HAVE_KVM is leading to this.

The "select HAVE_KVM_EVENTFD" is gone in linux-next.

-- 
#Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
