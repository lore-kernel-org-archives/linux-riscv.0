Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C74CFA464
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 01:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DvRiETFnYccWhoTH9lkjfdbnmP+1xhSj/ABXqOroeDs=; b=l3ZU9hneoSB6Z5
	wmJuddWsX3LtSvAWs1qEorSgQApYR345CTbKXjtcBOG0Ve0+xzSXQhgHU4WOa7htP48gKs6lg+9hW
	3EFct9lpGwoEglSw+0uUBx7QhuglvhvmvQi6BSlt+3PQAEoDQ96gKJGMsmCfKRV15GD9Qt2UZ+2YY
	eRRxNJ0ORvlElCAZb9+mGUs/DR5HIfC/CncX0GN1Dmct8MXZGm+mFAyN8MvB25NzG/jEB0G+Bc71U
	fncKYw5Ba9mYI3Z24+XLPFyxJ33pSttpKUNM3021Eh8ohx8gQbvOpF2PbbzmS7NuXppVITqpIJEVj
	0HLvqF8s11Haez1F0bHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMFoB-00000007dye-33tT;
	Fri, 21 Nov 2025 01:19:31 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMFo6-00000007dxQ-3y6e
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 01:19:29 +0000
Received: from [100.79.9.218] (unknown [110.53.160.106])
	by APP-01 (Coremail) with SMTP id qwCowABX7MsWvh9pRdZwAQ--.15200S2;
	Fri, 21 Nov 2025 09:19:20 +0800 (CST)
Message-ID: <ca507aa5-670e-405a-a1dc-3316f96cef3b@isrc.iscas.ac.cn>
Date: Fri, 21 Nov 2025 09:19:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Add Zilsd/Zclsd support in hwprobe and KVM
To: pjw@kernel.org
Cc: linux-riscv@lists.infradead.org
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn>
From: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
In-Reply-To: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn>
X-CM-TRANSID: qwCowABX7MsWvh9pRdZwAQ--.15200S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyfXF43KFW7XF4UCry3urg_yoW8CF1fpF
	s5GFn0kr1kWw13CryfAr48ur4rAws5Wws8J3sxtw1UG3y3ZFyrArZay3ZIqr1UWFZa9r18
	uF1YkwnF9w1xA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUyjb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
	s4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
	1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
	JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUv
	cSsGvfC2KfnxnUUI43ZEXa7IU8P5r7UUUUU==
X-Originating-IP: [110.53.160.106]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_171927_356645_AB3922B6 
X-CRM114-Status: GOOD (  14.64  )
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

On 2025/8/27 00:29, Pincheng Wang wrote:

> This is v2 of a short series that adds kernel support for the ratified
> Zilsd (Load/Store pair) and Zclsd (Compressed Load/Store pair) RISC-V
> ISA extensions. The series enables kernel-side exposure so user-space
> (for example glibc) can detect and use these extensions via hwprobe and
> runtime checks.
> 
> Thanks,
> Pincheng Wang
> 
> Pincheng Wang (5):
>    dt-bindings: riscv: add Zilsd and Zclsd extension descriptions
>    riscv: add ISA extension parsing for Zilsd and Zclsd
>    riscv: hwprobe: export Zilsd and Zclsd ISA extensions
>    riscv: KVM: allow Zilsd and Zclsd extensions for Guest/VM
>    KVM: riscv: selftests: add Zilsd and Zclsd extension to get-reg-list
>      test
> 
>   Documentation/arch/riscv/hwprobe.rst          |  8 +++++
>   .../devicetree/bindings/riscv/extensions.yaml | 36 +++++++++++++++++++
>   arch/riscv/include/asm/hwcap.h                |  2 ++
>   arch/riscv/include/uapi/asm/hwprobe.h         |  2 ++
>   arch/riscv/include/uapi/asm/kvm.h             |  2 ++
>   arch/riscv/kernel/cpufeature.c                | 24 +++++++++++++
>   arch/riscv/kernel/sys_hwprobe.c               |  2 ++
>   arch/riscv/kvm/vcpu_onereg.c                  |  2 ++
>   .../selftests/kvm/riscv/get-reg-list.c        |  6 ++++
>   9 files changed, 84 insertions(+)
> 

Hi Paul,

I noticed that this patch has remained in the testing branch for some 
time, while the other patches in the same batch have already moved into 
the experimental/merged and for-next branch.

When testing locally by merging the current testing branch onto the 
latest for-next, I observed merge conflicts in the related areas. I 
would be glad to rebase the patch onto the current tree and send a new 
version if that would help resolve the conflicts.

Please let me know whether you would prefer me to prepare a rebased v3, 
or if the merge will be handled on your side.

Happy to rebase and resend if that would help.

Best regards,
Pincheng Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
