Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633BFD2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 14:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5KmCKBB75h5trHTpi9ZyB6sAk1CMInWMjbBhrj/fHDc=; b=GiYcDPKLiliece
	sVCxtwkldzLgOkcRSoKSI7Id9l5W1sgdmINAomuB7NLe61ZFU1FeIpCnHMIXMTYFnJGz9kYa3Yfju
	y1aJ7u5/1ruC4w6OGkaUkPo1AFM/lrpdnXeOFHL6bWTG3eR+hhSIQg8/iO/+Tm1vAPLQgmoSjzBPr
	HdDsxekxx8whbnenGho/Ar7577WoRo88mWWmoJ/bB+J39Np5OAK2P0ZjS1gpX35u+lKPF6feNczMJ
	cEg5yylm62UyI0N1castpnYKS66z0kwnxw0Sj4lpExgPIc9JklZCE/TLtSLFX7sBzBeHQFtBNOPUD
	c10hBNLk2sMF8YPc45ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCdX-00000003yKd-2MGB;
	Tue, 20 Jan 2026 14:23:15 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCdQ-00000003yHc-02ax;
	Tue, 20 Jan 2026 14:23:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1768918982; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=XjFJwiZwKYWRxhHb7L7H6Uqg4/HCRCOm2ZcJ0CPggm0=;
	b=w+hWjyy0ZeAhnzf5VYtWUGdB/Hc/GhvH+GD+xTKdGBZmvC47GmYim5U961FuEATcTpG07zyuhVJTo1LrdQsY8TqC/Kc3++NVyaslRLbF26F5d5EEyqhOhTf7hpgegwYef0YGFQemv1YsIRUvLyCJCkzrD8PHRQovLrd1lezpui8=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WxUghn7_1768918976 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 20 Jan 2026 22:22:58 +0800
From: fangyu.yu@linux.alibaba.com
To: radim.krcmar@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	corbet@lwn.net,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org,
	rkrcmar@ventanamicro.com
Subject: Re: Re: [PATCH v2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Date: Tue, 20 Jan 2026 22:22:56 +0800
Message-Id: <20260120142256.9968-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <DFSM9IHXY24S.3W4T39VHEH420@oss.qualcomm.com>
References: <DFSM9IHXY24S.3W4T39VHEH420@oss.qualcomm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_062308_292181_82B0B495 
X-CRM114-Status: GOOD (  13.58  )
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

>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>
>> This capability allows userspace to explicitly select the HGATP mode
>> for the VM. The selected mode must be less than or equal to the max
>> HGATP mode supported by the hardware. This capability must be enabled
>> before creating any vCPUs, and can only be set once per VM.
>>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
>> @@ -212,12 +219,27 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>  
>>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>>  {
>> +	if (cap->flags)
>> +		return -EINVAL;
>>  	switch (cap->cap) {
>> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
>> +#ifdef CONFIG_64BIT
>> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
>> +			cap->args[0] > kvm_riscv_gstage_max_mode)
>> +			return -EINVAL;
>> +		if (kvm->arch.gstage_mode_initialized)
>> +			return 0;
>
>"must be enabled before creating any vCPUs" check is missing.

Agreed, I'll add the missing "must be enabled before creating any vCPUs" check by
rejecting the capability once kvm->created_vcpus is non-zero.

>
>> +		kvm->arch.gstage_mode_initialized = true;
>> +		kvm->arch.kvm_riscv_gstage_mode = cap->args[0];
>> +		kvm->arch.kvm_riscv_gstage_pgd_levels = 3 +
>> +		    kvm->arch.kvm_riscv_gstage_mode - HGATP_MODE_SV39X4;
>
>Even before creating VCPUs, I don't see enough protections to make this
>work.
>
>Userspace can only provide a hint about the physical address space size
>before any other KVM code could have acted on the information.
>It would be a serious issue if some code would operate on hgatp as if it
>were X and others as Y.
>
>The simplest solution would be to ensure that the CAP_SET VM ioctl can
>only be executed before any other IOCTL, but a change in generic code to
>achieve it would be frowned upon...
>I would recommend looking at kvm_are_all_memslots_empty() first, as it's
>quite likely that it could be sufficient for the purposes of changing
>hgatp.

Using kvm_are_all_memslots_empty might be a good idea, and I will add a
check for this function in the v2.

>
>Thanks.

Thanks,
Fangyu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
