Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E993C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 15:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbpE7Ap+qCosAWtaDElUXyvEXwXYiM6Hr9KeZR8v0Fw=; b=xdegAa1o+UgeRE
	Srh4vcyfBKvWPs+D1bS7/84fGsG0GRN0hWYe6aQT9n0Bth7r4rhdf9v643SI19A4HmnzBd76DlXQV
	svZ4AUrkl5qNsI+7WxLKr3jtijrcmzYuCsm+Ar0hYhagS31/ojxcQ+VXAGA74LU0w7W1mebEIIOYd
	1bAtPZqFoe+5qA4o71ZSgHqviw00ltY/Qsyz9sKXOtLswjoIC1V886Vjp7yVOQGMJs9/Bj+WI4sk0
	ZmimF5cah1i8jD8ZhwhVI+6Z+CriLgUWVpi3jugjWgsJu34GuZwzXx+0hm6P1P6hFropjE0P0l9OE
	rqQq7uGCkOzNhStcU3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngq3I-004ma0-Mh; Tue, 19 Apr 2022 15:46:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngq3E-004mVu-OH
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 15:46:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id h1so1059029pfv.12
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 08:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hcC70nEaEjCrZOBwR+bHJFoY8sXKM5tdaihGvVikeUA=;
 b=nllDsrmMLB7AAvdsCYhHwzGAwZygD09xcbijCyvxam19T71okMswczeidyoTR5SpG0
 rh2btGFKQ8mFqLW0jb05ZgH7OBBqFC3qd+RSoYqhjbcOEfsOApUER19sCRfFMfoBIpEI
 yKTQvKsy4m5GlAWzFu8NEv3LhxslcTTwe6M8afBDFsE8xE+g+gSVzSH2Y6X7wQTu3bZ0
 kdi4zB98HqqFf25muMksptD1m9ilqCPvrI6q21hqYsF4bYqxNptCkUe1YhNdH7I5dLV1
 d2lkK/LTT2KCvd4gEIWUsK4t0WNBMIpaja6VIf/jz4mIVCTT2/Ja8zo91SL4YY1Ex4Nu
 siWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hcC70nEaEjCrZOBwR+bHJFoY8sXKM5tdaihGvVikeUA=;
 b=tIKvO458ekki40hmCLUqsy2hdCa4IE2Xj/xe4m0N8MZ/fDeHfjkkvVNEQy2/Hm6yWA
 qUYh0LlJeFxGFne052/DyEOsY3ios3h0elf6GFKgj5p3ubjsXVodZ6tb0d1vwEPFQNlP
 wsmNZYIqBKm+RXqSRlZyFGGrUw7lDnnf+7YF+38a82mIjOyDhNfaocS7AB8zRuCrwuwJ
 Awgoz18QUa54T8lz/VbYNnNP6up4LEqPkkWieE0Ts8aNSa9I0bokMzupIVchgUd01H9k
 hLMp2c3Md4VvgzAt0WypxNti1Z2exmitxcfxhlWK02rsrPo90sICrhxhgW1DQpCogWkQ
 gxFQ==
X-Gm-Message-State: AOAM530OotAGyeZU9oIOWdurfHLKA7/m0oRCwtsWI8GmOmR9r2LCL7RH
 OtzPibwEEC6AwEWFt4dmP45c3Q==
X-Google-Smtp-Source: ABdhPJxyLXIANNTGiAZfsu1/QG9UANwG5wKin3TjbnrIzeNo7+Th34xV36A6olC5ZeEiVQzlg55+OQ==
X-Received: by 2002:a05:6a00:b4d:b0:509:1ed1:570e with SMTP id
 p13-20020a056a000b4d00b005091ed1570emr18500672pfo.19.1650383157493; 
 Tue, 19 Apr 2022 08:45:57 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 z4-20020a17090a66c400b001d0e448810asm13613064pjl.36.2022.04.19.08.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 08:45:56 -0700 (PDT)
Date: Tue, 19 Apr 2022 15:45:52 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] KVM: Add helpers to wrap vcpu->srcu_idx and yell if
 it's abused
Message-ID: <Yl7ZMJ/takmHh7tY@google.com>
References: <20220415004343.2203171-1-seanjc@google.com>
 <20220415004343.2203171-4-seanjc@google.com>
 <5b561bf1a0bbf140ea09d516f946a4e8fee8dd2d.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b561bf1a0bbf140ea09d516f946a4e8fee8dd2d.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_084600_852909_D3C3ADF2 
X-CRM114-Status: GOOD (  18.81  )
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

On Tue, Apr 19, 2022, Maxim Levitsky wrote:
> On Fri, 2022-04-15 at 00:43 +0000, Sean Christopherson wrote:
> > Add wrappers to acquire/release KVM's SRCU lock when stashing the index
> > in vcpu->src_idx, along with rudimentary detection of illegal usage,
> > e.g. re-acquiring SRCU and thus overwriting vcpu->src_idx.  Because the
> > SRCU index is (currently) either 0 or 1, illegal nesting bugs can go
> > unnoticed for quite some time and only cause problems when the nested
> > lock happens to get a different index.
> > 
> > Wrap the WARNs in PROVE_RCU=y, and make them ONCE, otherwise KVM will
> > likely yell so loudly that it will bring the kernel to its knees.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---

...

> Looks good to me overall.
> 
> Note that there are still places that acquire the lock and store the idx into
> a local variable, for example kvm_xen_vcpu_set_attr and such.
> I didn't check yet if these should be converted as well.

Using a local variable is ok, even desirable.  Nested/multiple readers is not an
issue, the bug fixed by patch 1 is purely that kvm_vcpu.srcu_idx gets corrupted.

In an ideal world, KVM would _only_ track the SRCU index in local variables, but
that would require plumbing the local variable down into vcpu_enter_guest() and
kvm_vcpu_block() so that SRCU can be unlocked prior to entering the guest or
scheduling out the vCPU.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
