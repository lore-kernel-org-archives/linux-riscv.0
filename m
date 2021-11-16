Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB416C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 13:11:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 955E6613AC
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 13:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 955E6613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W20LaS/EurDoDtck3sWTlSaaCL3UznQ0DVpItsVI4GQ=; b=ILZoqtz7XPG0gW
	JRYjbc6LazcdZtfVH7h3mGCozSE2abMlKNy16H4CQBt9TiDib7S2m49YxZjDmFjAKsEIFooOlPggG
	DO3okqusw5SCbH88kJue9068kB0YRZgOLGuvERRVYmnKluZhEbFusfl8hrAZHz1dGYzRWgpvzgnSH
	px4U+npGomglucm8pKxLD4BskY6dyYP6jgZ4PiZnM0LDsZKMcP7Qs6b1p25NlweaS9A1EolVn/Ies
	LJ1qLylTlvjzP74onQ4QzrjcgewBnDbZclmGpQ1O+GcrV0YwKuynNKTIvbzlBSmPHprTV9jZ8/K3N
	AvKPBqOGcSCQz6imoNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmyEn-001mDE-Qv; Tue, 16 Nov 2021 13:11:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmyEh-001mC9-JO
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 13:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637068251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JTeqDrAw5OSlo519nYzgdogJNVBSL/XQjztENai/vE=;
 b=MxvaevUL3p6SjtbZZunLWF1sWZGKyF3i2npGgH7BHwZFlvG7HJEmtU71cGl3G021+zaG/9
 DWudAd4APtGSTYvsCPfV3mNMTicp1I98eafAM0DivzRc/lqVhsrIF4p/ju6snzF/LTmu3k
 57vTrkvU3LcwIQBXBvLerM7/Tr8d/Vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-FLoWqczMO0y4Kw475UVk_Q-1; Tue, 16 Nov 2021 08:10:45 -0500
X-MC-Unique: FLoWqczMO0y4Kw475UVk_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C82A8804140;
 Tue, 16 Nov 2021 13:10:43 +0000 (UTC)
Received: from [10.39.192.245] (unknown [10.39.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6640310016F5;
 Tue, 16 Nov 2021 13:10:41 +0000 (UTC)
Message-ID: <4e6df304-a5a5-fd33-1b6a-59eec905101f@redhat.com>
Date: Tue, 16 Nov 2021 14:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] riscv: kvm: fix non-kernel-doc comment block
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20211107034706.30672-1-rdunlap@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211107034706.30672-1-rdunlap@infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_051055_749051_BD265678 
X-CRM114-Status: GOOD (  15.38  )
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

On 11/7/21 04:47, Randy Dunlap wrote:
> Don't use "/**" to begin a comment block for a non-kernel-doc comment.
> 
> Prevents this docs build warning:
> 
> vcpu_sbi.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> 
> Fixes: dea8ee31a039 ("RISC-V: KVM: Add SBI v0.1 support")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: kvm@vger.kernel.org
> Cc: kvm-riscv@lists.infradead.org
> Cc: linux-riscv@lists.infradead.org
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> ---
>   arch/riscv/kvm/vcpu_sbi.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20211106.orig/arch/riscv/kvm/vcpu_sbi.c
> +++ linux-next-20211106/arch/riscv/kvm/vcpu_sbi.c
> @@ -1,5 +1,5 @@
>   // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>    * Copyright (c) 2019 Western Digital Corporation or its affiliates.
>    *
>    * Authors:
> 

Queued, thanks.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
