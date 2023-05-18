Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8F1C77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02f1xe2G/bG73LS725LbPdEH5q+XZgqzKEZdYiHeQps=; b=LjGv+nVDhTmKu/
	lo/5eKVjNv8jRTbd+kct3WyH2ZgoGyxvFDQedNsbmspNmUtzVBBpbuSWGWPCvjBdtDZ2gL05KlxLQ
	YK/y4YVxmSLebtgdFQFQLtoPS9srtwVg4p5Idjtkg28IVw9C7GknuWNl73xbtEHvcLy+AuJTliwVJ
	9iQGcwQfHcnvtmqjorr3pzKlGl7fKOQDft8RDragS9wh+V1TT1ZkmfUlPpY2Ze/qVj+a48XHOt3MN
	DWzi2sWU1QDILG5PO+TJ2dGuC71L8qCTTQBbIzUJnOlDPiv2OcFdFyUDzzJKi6VXE9VqTOC96cPH3
	JCwBgfABbaRR79Xzi3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzY8E-00CDbJ-2D;
	Thu, 18 May 2023 07:33:02 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzY8C-00CDaA-0J
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 07:33:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-307a8386946so1115952f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 00:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684395176; x=1686987176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nr3DCNB0Ixq72umVN8Ju8XfUzmslSWPo/26RuL/v64=;
        b=lgWrWFUqwIldB1/V3hLGpdkSWhVDPycAmU8Mb4DgAs8Kdp50VYkKtRMkBE/iO7HR6K
         YG22U7m0sQNRC4eEWVXiAuLVpZu37bDV9Stsuo+uvxVhf3HszKROh7xNWvhlcT5VzGmn
         Ltw6vxOCDiTdALmS//YmL9KOGZmOkdGpQJDxWxy5ocrzN2eZlhLShQtKcTUT/432p8qT
         MU2XTtGY1N/K2fdCulWo4u/0/4v3T37U+TdX5fvFeYpldD1wtaumhvjDzTjiSPZEZ/in
         Ac0nQnbghlggU1O6LnzFQ33nJ94VD5brGYVGvSgEpxvfBA6LvcKWlJx2fhXAWhEOlsAj
         Bu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684395176; x=1686987176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Nr3DCNB0Ixq72umVN8Ju8XfUzmslSWPo/26RuL/v64=;
        b=KjuD4ca8irfr+uy9EUReMQ/jrnkz+J/Ip1NObBs+Fwf1xvN7wgfZC86S9mBuEswTU8
         8tiVIbijhb37pnWAdLth+6VQ+A5KSuUUiN2zGJPSRxyqPEbTM0b/2eSuPT+xn6BHfr5n
         d/ebcNVfdbqukJRH+4g5bt+kCYlvD3zYLau/sWEEUmcCsSANLicQrUGjOtrk9D5qzsjx
         S5gQvFbE/4CsXYwVxlf/qFKo/Mz5IowHmXZ/Xb4QAJhtmYKylHTH1pfgSmP1Ji/IdqHC
         Dhgrj93q0mJIpe53SNJFbDYR7DpA5SvJ1ziYVTTa6NKTdjQzqTJsKjs5RbiZ5HUqbNRv
         sAVA==
X-Gm-Message-State: AC+VfDw3BxIYItwmnoU7qnuC1b1foTLh9J7zflaY1mG3HljK+iRJ66le
	IdZp060vKLFRJajlcfnhXocaaA==
X-Google-Smtp-Source: ACHHUZ7xPFCjfZgnxJjwQ1q3sKhEpq9jWYbgE8XVf82gwX/CzK1u2s1hoM6OrcuqCwZHD2o13qE15g==
X-Received: by 2002:a5d:4fce:0:b0:307:86fb:dada with SMTP id h14-20020a5d4fce000000b0030786fbdadamr818073wrw.36.1684395176400;
        Thu, 18 May 2023 00:32:56 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id g8-20020adfe408000000b002f9e04459desm1160629wrm.109.2023.05.18.00.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 00:32:56 -0700 (PDT)
Date: Thu, 18 May 2023 09:32:55 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 2/2] KVM: selftests: Add riscv get-reg-list test
Message-ID: <20230518-60da3b82641bdaccec589b8b@orel>
References: <cover.1683791148.git.haibo1.xu@intel.com>
 <751a84a9691c86df0e65cdb02abf1e073892d1ca.1683791148.git.haibo1.xu@intel.com>
 <20230511-28ec368a8168342c68ca2187@orel>
 <CAJve8okVFr-m6go6dCg7Cf=Uq3Yt9Xmxi0Z3B2vbWvahvx4GgA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8okVFr-m6go6dCg7Cf=Uq3Yt9Xmxi0Z3B2vbWvahvx4GgA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_003300_145188_0AD2B6A8 
X-CRM114-Status: GOOD (  21.69  )
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

On Thu, May 18, 2023 at 12:17:18PM +0800, Haibo Xu wrote:
...
> > The idea of these *to_str functions is to dump output that can be
> > copy+pasted into a reg array (hence the trailing commas in print_reg
> > lines). So we can't just print random lines here or return '##UNKOWN##',
> > as that won't compile. Instead, the default should return
> >
> >   str_with_index("KVM_REG_RISCV_CONFIG_REG(##)", reg_off)
> >
> 
> Thanks for sharing the detailed idea, will fix it in next version!

I guess we could also return a string like,

"KVM_REG_RISCV_CONFIG_REG(##) /* UNKNOWN */"

as that would still compile and also convey the message that this
register doesn't have a name because the test doesn't know it yet.

...
> > We should share all the code above, except print_reg(), with aarch64.
> > I'll send a patch series that splits the arch-neutral code out of
> > the aarch64 test that you can base this test on.
> >
> 
> Good idea! I will rebase the patch based on your work.
>

Ok, I've pushed patches to [1]. This series introduces two things to KVM
selftests. Primarily it splits the aarch64/get-reg-list test into a
cross-arch get-reg-list test and an $ARCH_DIR/get-reg-list.o object file,
which the cross-arch test depends on. To do that, it also introduces the
concept of a "split test", a test that has a cross-arch part which depends
on an arch-specific part. Using a split test is cleaner than the
#ifdeffery we usually do for cross-arch tests.

I've added kvmarm@lists.linux.dev, Marc, Oliver, and Sean to the CC of
this message. You'll want to add them when you post v2 as well.

[1] https://github.com/jones-drew/linux/commits/arm64/kself/get-reg-list

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
