Return-Path: <SRS0=Z6yX=OZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B34C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 04:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF5961184
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Oct 2021 04:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADF5961184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiiZ3bfJCQCKk4elVCqdjdllsE6pcTc2+Yt0YhE8yOs=; b=3/dbJ271QveF/t
	ADmFEbO7R8qQhJ/G788f3LBe3HplZfn0UoFyZJujsybZ9SERwF2BMY78joT5vy2JZKe5AOm2m6KzU
	H5JQFrxsHMC7JKrns4qycZ2geozQw79sOhrnQ+r/k6A4nlg7mhpFnBRXDTkakKk22qxO7hiNL5Zzr
	EYFmCsUF/AWLKS3DPPcRGSwW7/5T3gIVkxDYj7MW7/99+cn8iqmDqdf8doP62TxSLz/EnxMa2xmBr
	+V5rWxkcfjJCWVdmg8nrwlhmm4u5IHwuEG041yAZiaPnirysDoHjfPGoBjZLQEAWMtq503E1cpWu6
	oUmfMkUygOCNgO4VDepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXbtz-008rCs-8f; Tue, 05 Oct 2021 04:18:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXbtw-008rBO-79
 for linux-riscv@lists.infradead.org; Tue, 05 Oct 2021 04:18:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso1804376wms.3
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 21:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ldiVl+t8mgo2eZZ+0dm/iKZs4c1YMS7niH0Ehzbu8P8=;
 b=mX/8MC1Z3q3+b/sqPIhdbqw5uqfmCrcEs76Vjy7QBZIqM4i8XiMoDonzMYsjNwBqRt
 MGCYZ+fOYXV0G2moWo6M81hLOqmdevrjwPTpPyw+lK/Rh34oGoJJ9IegpWjjKulNDfHb
 WxuRkFNzvP2V/gkY44cMNb3kUdQ7YbSURd0WyE3zqiFfVXRrD+5Bc3xRH/MLglpHdXaz
 TvDRVp+86tw3nVv7ORBVioPtWWrLnhnOsDSFK8bOlI1oPoMOPr8E1a5/YqUQFKkuFDxr
 pGiEvKmc/WdqOUrqd09M198BYxvYOQQ8uAOdp/tG7x2ffa1USwtXa6mp2UGGs8tI1ubN
 /e7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ldiVl+t8mgo2eZZ+0dm/iKZs4c1YMS7niH0Ehzbu8P8=;
 b=jI9JUNbrmCL+8NqFTHtsWzW4l77kmXE7A9wEK1De5aw+zGsaBoCImCCjQRL0MYxKpj
 NJB7dZ2y6AHvcDKMix4AcVoNldmC5wTpLebAfC+PmIdqHcu5tQQjEQcJKuA4//ut/J+L
 YRbZG0W7J8bkpHTybOuIlQ7wbZUpOkd7G34rcs3o97TM/+v1hsRw7orsckSiCHQvqwDV
 HMJzMWFrYwDgDVvuXn34GDfU3+vDv6yUwKCRMvy1xYKHyEn5Isbtd/EHnqmEYHS8IvA6
 zGDf6Y63cPv2OChU/w97qaclpyl8DiMJfKxfDhdMTnSBfU4Em3WdSvKMRIXntNMxzdzp
 Os1g==
X-Gm-Message-State: AOAM531tyYJ5T3B7wdHPTdEFaZd8CNSF6u5+GqlKbG5jS4DbqE13xF8j
 7XAn8guvofPW6oJXwR0mPtcSwfmXfq0xFtaEHQJKTQ==
X-Google-Smtp-Source: ABdhPJxkt8JmT/tN0OuEY7Eksq2Rbz+Wp8NmhOJfBsAYhp7hTnL8enb3dC/AOksH5NkA9S8xaMNtWDScMwV5ajpKJeA=
X-Received: by 2002:a7b:cb04:: with SMTP id u4mr986462wmj.176.1633407477436;
 Mon, 04 Oct 2021 21:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210927114016.1089328-1-anup.patel@wdc.com>
 <5cadb0b3-5e8f-110b-c6ed-4adaea033e58@redhat.com>
In-Reply-To: <5cadb0b3-5e8f-110b-c6ed-4adaea033e58@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Oct 2021 09:47:46 +0530
Message-ID: <CAAhSdy2b-xHSQYhypo9=87mrf82B3Faficc6utW6E6XcYqV=JQ@mail.gmail.com>
Subject: Re: [PATCH v20 00/17] KVM RISC-V Support
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Graf <graf@amazon.com>, 
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, KVM General <kvm@vger.kernel.org>, 
 kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_211800_338619_859A5798 
X-CRM114-Status: GOOD (  17.52  )
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

On Mon, Oct 4, 2021 at 2:28 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 27/09/21 13:39, Anup Patel wrote:
> > This series adds initial KVM RISC-V support. Currently, we are able to boot
> > Linux on RV64/RV32 Guest with multiple VCPUs.
> >
> > Key aspects of KVM RISC-V added by this series are:
> > 1. No RISC-V specific KVM IOCTL
> > 2. Loadable KVM RISC-V module supported
> > 3. Minimal possible KVM world-switch which touches only GPRs and few CSRs
> > 4. Both RV64 and RV32 host supported
> > 5. Full Guest/VM switch is done via vcpu_get/vcpu_put infrastructure
> > 6. KVM ONE_REG interface for VCPU register access from user-space
> > 7. PLIC emulation is done in user-space
> > 8. Timer and IPI emuation is done in-kernel
> > 9. Both Sv39x4 and Sv48x4 supported for RV64 host
> > 10. MMU notifiers supported
> > 11. Generic dirtylog supported
> > 12. FP lazy save/restore supported
> > 13. SBI v0.1 emulation for KVM Guest available
> > 14. Forward unhandled SBI calls to KVM userspace
> > 15. Hugepage support for Guest/VM
> > 16. IOEVENTFD support for Vhost
> >
> > Here's a brief TODO list which we will work upon after this series:
> > 1. KVM unit test support
> > 2. KVM selftest support
> > 3. SBI v0.3 emulation in-kernel
> > 4. In-kernel PMU virtualization
> > 5. In-kernel AIA irqchip support
> > 6. Nested virtualizaiton
> > 7. ..... and more .....
>
> Looks good, I prepared a tag "for-riscv" at
> https://git.kernel.org/pub/scm/virt/kvm/kvm.git.  Palmer can pull it and
> you can use it to send me a pull request.

Sure, I have prepared PR for the remaining 16 patches based on the
PATCH1 commit in the KVM tree.

I will send PR today or tomorrow.

>
> I look forward to the test support. :)  Would be nice to have selftest
> support already in 5.16, since there are a few arch-independent
> selftests that cover the hairy parts of the MMU.

I will try my best to send basic kvm-selftest support sooner (preferably
for 5.16).

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
