Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34087C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 12:21:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E858261A89
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 12:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E858261A89
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCtVLWwo8rvOBhc1nJ5T9a+NoTtrSWdq2hxR7xPDm5s=; b=wkQQsr/dKegg7F
	oCOTZZOTWYRTZbENQj+kyIuWfADBa3O+ypoEnBCeAoXeONwZSb+xH3YHzMD22ChbtVqHNCg7kwRSL
	O9M2TLR7yOr95yaXAY8i4KVSkOsJdxxbEF75zVY0VHWNXa+iqjSVpPK6HySGyfYgvNtSXUSsv3ZTV
	ihRhpK0EUf9UicbFBR12UcOVSgF22rhj9Tpip6aNO2zd/12pACxM59m1yCNEwY5K8HmDXKX7oYrKY
	0CJAhaM8xFusq7DA2ILXTHAZuqQtXVAbUknbeEYj+JZqj7u6EF9lzzhBIHiINCfBxtYztt2paeB0G
	JMST6jixQ2Ks3kJdfoYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo2tH-00AN7Q-4f; Fri, 19 Nov 2021 12:21:15 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo2tD-00AN65-Rj
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 12:21:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u1so17814001wru.13
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 04:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ij7er2470Y2wPBGgkUoSGjBv9MApKpAoPSAbl3vcFGM=;
 b=JiC1txByfspEffoX8zfmeVfIBE3jhZB/PZ7F1nQhhz92MRm9YRHfoBGSDJGiQTIpOo
 jVaBi+Bw46dyRupANHaLOawHjD3Wn+t0zHAQh1QQfh+/47uRjDQCgvLuwKlf8jV46Rc4
 6jXA2isUv3fxDFTbjHzl1QySpWmSzD0fdCdun4lLxz7kI/YGr81zF+wV7+C0weYrtLjz
 WWBuZoiAaWCGdK9QFghF9gvtPce1anQ5oos66FK+0eVDq63Rs03vdjESnkn8jdiFmxNS
 kdbgCM9EWxfBP7LOefkd02EyRq2q1BMkATbyKXdfw/I9J5sKjQ3z42IC8KfTApRmAmcJ
 GLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ij7er2470Y2wPBGgkUoSGjBv9MApKpAoPSAbl3vcFGM=;
 b=Zl6zFyfzV9i+DZI1DwFcuAY5URYIdx6+BKhHfFWTQmdWvoWhxz8R5BXYNt8S4YLj/1
 T9ovyIhV3qpMyqwpuPXVIXkAQBX7fKa/8lHNoU4U804KbgytdohV2bbWE7N8JYZ5E/ME
 VC7QGkep4Ogm/JPHz/mTXGTtDaar2ps2nk92ul1qN6PMm3/2T1I93isRgranKMQBZSKN
 83b9E09KuGOPk8BQftqakvVrmbgCooHbj8/tYAfd0tciuTAasGcKSdDYo89jbYfrkET8
 NaJDSTlHodWS89tD8HZc63/m7yeydA3yZBpZ9aG+uEufZb5P8C4tvZFpBiCXd4k/QYEp
 AvIw==
X-Gm-Message-State: AOAM5334q2XrX1bHYubQehYaIHZ1bRMJKssxnxXaOGX9MPLZB3wkLUR9
 5rYJ8P6D8MU7xAYIGTd6YHwtOmibKvZt4OxFTc53Ig==
X-Google-Smtp-Source: ABdhPJwpDih1Nz/ks8ZhQSJ1ATWfx3j/ZKzyQDFL08MT6G9WVQEczM3Z4uSFbhMCXYw9f5AP4oVpWgv71qyALRREcfA=
X-Received: by 2002:a05:6000:1a45:: with SMTP id
 t5mr6835921wry.306.1637324469654; 
 Fri, 19 Nov 2021 04:21:09 -0800 (PST)
MIME-Version: 1.0
References: <20211117060241.611391-1-anup.patel@wdc.com>
 <CAOnJCU+KZn2JnZg-FZcJ7PXRpGo5SyOmdUYFeJgBenPO9xxE1w@mail.gmail.com>
In-Reply-To: <CAOnJCU+KZn2JnZg-FZcJ7PXRpGo5SyOmdUYFeJgBenPO9xxE1w@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 19 Nov 2021 17:50:58 +0530
Message-ID: <CAAhSdy0jaPPBNkXkt5-jj+LWCm+XiC0G2udK2C7n1f2TqBPCmg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix incorrect KVM_MAX_VCPUS value
To: Atish Patra <atishp@atishpatra.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_042111_993418_3BFF8CE5 
X-CRM114-Status: GOOD (  17.60  )
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

On Thu, Nov 18, 2021 at 1:23 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Tue, Nov 16, 2021 at 10:03 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The KVM_MAX_VCPUS value is supposed to be aligned with number of
> > VMID bits in the hgatp CSR but the current KVM_MAX_VCPUS value
> > is aligned with number of ASID bits in the satp CSR.
> >
> > Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  arch/riscv/include/asm/kvm_host.h | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 25ba21f98504..2639b9ee48f9 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -12,14 +12,12 @@
> >  #include <linux/types.h>
> >  #include <linux/kvm.h>
> >  #include <linux/kvm_types.h>
> > +#include <asm/csr.h>
> >  #include <asm/kvm_vcpu_fp.h>
> >  #include <asm/kvm_vcpu_timer.h>
> >
> > -#ifdef CONFIG_64BIT
> > -#define KVM_MAX_VCPUS                  (1U << 16)
> > -#else
> > -#define KVM_MAX_VCPUS                  (1U << 9)
> > -#endif
> > +#define KVM_MAX_VCPUS                  \
> > +       ((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) + 1)
> >
> >  #define KVM_HALT_POLL_NS_DEFAULT       500000
> >
> > --
> > 2.25.1
> >
>
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

I have queued this patch for fixes.

Thanks,
Anup

>
> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
