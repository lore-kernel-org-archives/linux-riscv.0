Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE33EED606
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rGr40TAIUXExRxT4ker2qk937tzP6t0LxcojyOp22Xc=; b=ry3b42QLIT0+zDRVNHeFPT1aKn
	5p3FNHEJmb0u1NrWH7RZC01+3HSFv0nsak494bF1ZT9GTlN+CtDDxSvQRw481/nLUf9q71HTLekF1
	SDxaHfOVCZ2uWo+Yva7ft3rVPqS6zKihyFwTEHHXLYzcCBBQao/2ovLMub4lRwMvhZJFA0LyhyTs7
	WMI6fABwJNUhMDSavP52vAveXSBS9QPFHmMPrbSv1j1TG8v1QhiCpAYvvXA+Nko29e97hu11ac4wW
	F1hirBbqiTaAc95DF5ztGKf36YCF+Rp5+r7/nxOEE3DQCw79XFWEYBUFQjAGyHubQhBGCts6izl7P
	Nrun8WsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokR3-0000000DIMg-3lVy;
	Thu, 12 Sep 2024 14:04:37 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokQK-0000000DID7-2GEj
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 14:04:02 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6b8d96aa5ebso24012537b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 07:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726149830; x=1726754630; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WJF8OdeeEbgD1lB1UBEPz4l4GIXf0/aw8YXbCeOR8js=;
        b=GnZoqaNcIivk94eOuvVoXReZbEGkXOYGhjty/IVjdl0qV9bBPkGGieg8d3JNEHzpS4
         QQR3XLrZP5VIoePE6uTzFherLA5yxutHuXO6WxdiBwjF++iq01M+iknPXqFaW4ULPxc1
         J4dZpE+tMJXhtHeuJFOGHhl6cdQSmSvSgUWkkUXRBmLS5cKKKtQlcWhCZVQxR4k1D9zK
         rgTPqCjEWQ7WcW43HLkoh7wJgDJ1iTO3mSvEGEl3fZ2NxFhi3dfZkU2M/a2O0Xw7fqnO
         vZsLauZOD1Y72nWTKBmKRTrwYtMXZNmskOHm76chu6YtDAQgxNOXAvJYQOJjJfWVP22d
         3O9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726149830; x=1726754630;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJF8OdeeEbgD1lB1UBEPz4l4GIXf0/aw8YXbCeOR8js=;
        b=hz1EcSUxiryhkEJeJEuWNZ0LshHcAuyI2Lz4tka5a+9cz4F42254UY0ypUyPaH69wN
         Xai9QzGM5pwsngQGDHfGfbWr9QFzLBk37iOhA1cONfr+prkxBWckdjRVC57IJpjXUlAr
         qkZa33dh9hmbcS33eULwg95PnEQvRlORBQuWCAqF6IR+XUG3kMhWvHP8PdBTVm//fLNQ
         9D17q6aeBE2fXSb4aoo6aElI/4CIgTvX7Hct2N1FvMGKYMKtsNHXVur9xAY9KY11EgLP
         P11BIRmqCnwGzVDusIHq8f/NP1bJhEJjGbLCls8xEtFEhWzQtoDHSDx+OmmQEbsRcCey
         xGaA==
X-Forwarded-Encrypted: i=1; AJvYcCURoS/lLmwOZkay0iNqRT5outHmtImDHLhYN39tGpA2MVHj02QWNXWg1t+el1ZRD8mFjqLdc2df9zWxSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiK3yMvtK0odFwcJI49R3n5PPc1Ms9is5j43pZVJghmipkYlWl
	gnB5gq7rXFHKsAKgVqDjwlCZsh5/2AmJs5hP1rBIAtTq5TmlhlBVSHGL77XNcRxT2DF3HEt2sfy
	L0Q==
X-Google-Smtp-Source: AGHT+IG9MDMwcr2ud0GqvqLu65vyfg3SEL0UKjpaqJLZjzXIU9brTD+du2LqNfe439QMw4Yu0UCoNCtm5zw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:209d:b0:64a:d1b0:4f24 with SMTP id
 00721157ae682-6dbb6bb7dc7mr477817b3.7.1726149830238; Thu, 12 Sep 2024
 07:03:50 -0700 (PDT)
Date: Thu, 12 Sep 2024 07:03:48 -0700
In-Reply-To: <20240912-757a952b867ea1136cb260cf@orel>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com> <20240912-757a952b867ea1136cb260cf@orel>
Message-ID: <ZuL0xEIB1ol5epEE@google.com>
Subject: Re: [PATCH v2 00/13] KVM: selftests: Morph max_guest_mem to mmu_stress
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_070352_625972_87BF5960 
X-CRM114-Status: GOOD (  15.69  )
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

On Thu, Sep 12, 2024, Andrew Jones wrote:
> I gave this test a try on riscv, but it appears to hang in
> rendezvous_with_vcpus(). My platform is QEMU, so maybe I was just too
> impatient.

Try running with " -m 1 -s 1", which tells the test to use only 1GiB of memory.
That should run quite quickly, even in an emulator.

> Anyway, I haven't read the test yet, so I don't even know what it's doing.
> It's possibly it's trying to do something not yet supported on riscv. I'll
> add investigating that to my TODO, but I'm not sure when I'll get to it.
> 
> As for this series, another patch (or a sneaky change to one
> of the patches...) should add 
> 
>  #include "ucall_common.h"
> 
> to mmu_stress_test.c since it's not there yet despite using get_ucall().
> Building riscv faild because of that.

Roger that.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
