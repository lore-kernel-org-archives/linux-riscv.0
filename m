Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F07CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 08:59:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51BD56137C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 08:59:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51BD56137C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+eQbLx7EHX6aZY21ktqn5eYVTr2uu1Ntd1yHX89VUI=; b=gOWgocNGsv3p2Z
	UqiRnUDtOO0TqznmqJQbYJJho0Wh19ECWeKnIwhz5GOaWcTLtKa1urfXcm0u8B1sATDavtFBWBtVl
	KmRbOu2NlPDKZmaTdq+7GFLcl0oNmYRLUWe8KEKO4X4qNL82jqckMj/hRwgRC3QEVT7pYhWcRECk1
	s5RFfU0ALTEGtqnr6ufd7VcEExIbc7JRawLTy6+Gz2Wn6hGP5hAmo13CQu92JFs1XVBqKfzSISv4R
	JY1vxUdUZc4aGFWY1IbnFjWLP5ujXSrpm/GVFTD2HsTmpvYQq9Q6s4EE5V2VYZiyDtbpjQttjdwbp
	qRBXyDoP0Av8qcbJ+iWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXJnz-005hXq-PW; Mon, 04 Oct 2021 08:58:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXJnx-005hXC-07
 for linux-riscv@lists.infradead.org; Mon, 04 Oct 2021 08:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633337916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x988Ui+c+vfAAmLIqziJI6EexnnYwYLQ/x9zWNbOLdg=;
 b=OqN99/9G4x3X0BMHjf5OcG2O+GrLtWrwKK58eLoDQwOyugG6Yh0EVPyjbxq1VmaTh10hkn
 b2C8rabn3CBf+7j7HM7k/iBCKbM4UJ0BVP750ygPaijf+Tp89CvhJEp9vISwnWBUkUknwo
 K51FU6r5MpFwEL2b/LNJ7IBecQBiwZc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-0EjquABDNWiU79eJIszmsg-1; Mon, 04 Oct 2021 04:58:31 -0400
X-MC-Unique: 0EjquABDNWiU79eJIszmsg-1
Received: by mail-ed1-f69.google.com with SMTP id
 k2-20020a50ce42000000b003dadf140b15so4813631edj.19
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 01:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x988Ui+c+vfAAmLIqziJI6EexnnYwYLQ/x9zWNbOLdg=;
 b=1sGzsfnJKAr255vdAoXPvObHVGZN2VdsleEdTYkrpT2gY2QpWcvLzEWl/CJcQRiGr/
 MGkvYvZSCinkQQaNZuo9dCqKotRWMvyDnfEPe9sTbtblGQHIZvfqvTgVImgWfCE6lSiG
 CcypsYPhdoY7nll5onsFf8Je1HdqWyFyCdZGknsl7Us1FR3BXvuErg3swIQFPIk6kTx+
 Hr/CIZgauhtiW6jlWJMJJvrrVBOX3BinqU5KMmaolbpT3HMT4+9mHGtcPwE9niAjjiss
 PbghqvGA8O8PTxhIWAPOzjmsvtSQ3vROehyqSGILaWFtZmIoaDLYeLyCveKbmDmLRfeY
 RH1w==
X-Gm-Message-State: AOAM531+STf3Se5M6tV7UoDOAuuFuNHQe+CvlfjvMy1cdbCPPBqBdnP0
 JVGOoZmGJWaS9Ig1x1qTTdsfVbOsmE4BnPRsVA5us06cdaFnwOe7VERpBTdt7UlDqtHpkn4yRlu
 vHtQ62+qzZYu6yPUTaMDTc0w09TVJ
X-Received: by 2002:a50:ff14:: with SMTP id a20mr16824394edu.81.1633337910619; 
 Mon, 04 Oct 2021 01:58:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3qfHpLJuyjpb6MtwvFvqa3LKkfmelPlkrd/kMPhmqTdP8vX0VHFbEmy8mw+EaIFZUIu92UA==
X-Received: by 2002:a50:ff14:: with SMTP id a20mr16824362edu.81.1633337910414; 
 Mon, 04 Oct 2021 01:58:30 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id s3sm6209175eja.87.2021.10.04.01.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:58:30 -0700 (PDT)
Message-ID: <5cadb0b3-5e8f-110b-c6ed-4adaea033e58@redhat.com>
Date: Mon, 4 Oct 2021 10:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v20 00/17] KVM RISC-V Support
To: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210927114016.1089328-1-anup.patel@wdc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210927114016.1089328-1-anup.patel@wdc.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_015837_133277_71AFA4DB 
X-CRM114-Status: GOOD (  12.46  )
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

On 27/09/21 13:39, Anup Patel wrote:
> This series adds initial KVM RISC-V support. Currently, we are able to boot
> Linux on RV64/RV32 Guest with multiple VCPUs.
> 
> Key aspects of KVM RISC-V added by this series are:
> 1. No RISC-V specific KVM IOCTL
> 2. Loadable KVM RISC-V module supported
> 3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> 4. Both RV64 and RV32 host supported
> 5. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> 6. KVM ONE_REG interface for VCPU register access from user-space
> 7. PLIC emulation is done in user-space
> 8. Timer and IPI emuation is done in-kernel
> 9. Both Sv39x4 and Sv48x4 supported for RV64 host
> 10. MMU notifiers supported
> 11. Generic dirtylog supported
> 12. FP lazy save/restore supported
> 13. SBI v0.1 emulation for KVM Guest available
> 14. Forward unhandled SBI calls to KVM userspace
> 15. Hugepage support for Guest/VM
> 16. IOEVENTFD support for Vhost
> 
> Here's a brief TODO list which we will work upon after this series:
> 1. KVM unit test support
> 2. KVM selftest support
> 3. SBI v0.3 emulation in-kernel
> 4. In-kernel PMU virtualization
> 5. In-kernel AIA irqchip support
> 6. Nested virtualizaiton
> 7. ..... and more .....

Looks good, I prepared a tag "for-riscv" at 
https://git.kernel.org/pub/scm/virt/kvm/kvm.git.  Palmer can pull it and 
you can use it to send me a pull request.

I look forward to the test support. :)  Would be nice to have selftest 
support already in 5.16, since there are a few arch-independent 
selftests that cover the hairy parts of the MMU.

Paolo


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
