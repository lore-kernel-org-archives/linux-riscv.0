Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ED7C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 17:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mLgn+1IpBhlAvrskqOJGYqOXBfYX/tF090lVRR1B3No=; b=1Ji3tU5ZDbZjOw
	QuglJogKOwr+twzVCHAmEMPKJnhQu/iOJOsWb2V51ZXc3bM5VkRuiWB7/Kc8WbxbWtoIAkH845bpR
	JWaPqgJ2k9TibqqbfFurnUpCOCqYC+7d/jMPs3J/jbrVcCE4id7ErJk1TXLTSiBv2yT+z0sXHTowD
	lJmzX+F3EUNgs3TfZSpIkoszx8s0zjNwtqNInPlQmL+jKTKQPS0yIgmm2Xe46RkXJ9SRk52F3GJ/G
	+h1OZsVTB/Vlrb3uB628yzyn00mLF3hPAYWlR+rotYs+zWDmye0UFn1f6Jb68S0n8SXa4AyVZG1Ri
	IDcSLNgBhQdZWV2lkWLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3hd5-00A6z4-3Q; Fri, 09 Dec 2022 17:57:47 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3hd3-00A6wU-4I
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 17:57:46 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3b10392c064so62465427b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Dec 2022 09:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bMZ9vaUyXosUBjlo9WUDdUBep5JMYYDWXkYuJRTyBRc=;
        b=PNNz0qgco2CC6vK8iX8A8CdQ9XYG/eiYEJI0PFBFwEDrAJkafbZh+wNNez+eyMKsNW
         dyYIVM2JUEXFIo3AsWaRZNjWiZwyFaVdNR0pQpuSKF0S76DLKWQFl1oZGEBDU5afM86c
         4MHyLC00G+IV14UOCOsjUR6HTn+tapMh3yj6v/QPIYSR6ep3HNH6Adic+iJisjvPkwA/
         hLPuSxDfDTXFbxYKTocYksmV9tgslNTPcnfgAPbkxh/jMNo9/8AxKFzwYVG9ZAJJI+XR
         ZLWDlt7dnT+fbIaDz/1md454IG3J2J19ANvQ4CvzY4M0DlboF2jrnlXjyCT1tHR69aMt
         lUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMZ9vaUyXosUBjlo9WUDdUBep5JMYYDWXkYuJRTyBRc=;
        b=qFyVPj5wd4bcoKUGifxUzk32Ru0Lbz/Xg+jQ8zc4cXANxebxw92HMI1c4KXmpCvmiL
         4OpOutiaD3g4R5+0XBK9z2vj5xcd0vS8YWzYsaT1k+kjiTdL5W8S8Hx30/8vKu/E7MLo
         ig8vE/khB9Fj3TsKvoDMRMvAefpgoE2jP8YimlL6tJyEIanLSYG4TPGZ7DSQhrmzGmd0
         h5QSt/GwDn+O7L2XZFCY8FGSwDoYScklNC0xVXVn0U3nMQDx6a9W//0i0AUufx5OmN7g
         8OJqkbjVt9hUsqRX4dVDLd6bgcAw2Qlnna4X1a+Fe0f9t+KEBLPdfhkTe83vHyQkeCdV
         B9sg==
X-Gm-Message-State: ANoB5plI4TVeRHm92AW1CRaHSEOASvtesMgXwMZ/yGxtKN3NBEK4liIf
	md/Rc1gmHAEPX+KNeXtnZPqF8gZ6h50zN2oIt/oeRw==
X-Google-Smtp-Source: AA0mqf7ZLFzH7tn8G3mgBGvDrhVn7KNrvvpffIzBOW371A0vYuDJaiDqvxR+ZPRcFAJZ2LX4aVuYJ3WS6sGEmfbkAcg=
X-Received: by 2002:a81:148d:0:b0:36a:75b3:fdda with SMTP id
 135-20020a81148d000000b0036a75b3fddamr7388556ywu.168.1670608661842; Fri, 09
 Dec 2022 09:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com> <20221208193857.4090582-24-dmatlack@google.com>
 <Y5NxCYz9XV3hgGYX@google.com>
In-Reply-To: <Y5NxCYz9XV3hgGYX@google.com>
From: David Matlack <dmatlack@google.com>
Date: Fri, 9 Dec 2022 09:57:15 -0800
Message-ID: <CALzav=f-qDqJcvPEo1ZxxVizAE77crMFsbKUVif5B-mNgGEHyQ@mail.gmail.com>
Subject: Re: [RFC PATCH 23/37] KVM: MMU: Move VM-level TDP MMU state to struct kvm
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Nadav Amit <namit@vmware.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_095745_179995_AD74FA0E 
X-CRM114-Status: GOOD (  12.80  )
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

On Fri, Dec 9, 2022 at 9:32 AM Oliver Upton <oliver.upton@linux.dev> wrote:
>
> Hey David,
>
> On Thu, Dec 08, 2022 at 11:38:43AM -0800, David Matlack wrote:
> > Move VM-level TDP MMU state to struct kvm so it can be accessed by
> > common code in a future commit.
> >
> > No functional change intended.
>
> Could you instead introduce a structure to hold all of the MMU state and
> stick that in struct kvm? If the goal is to eventually supersede all
> uses of the arm64 pgtable library we are going to need the ability to
> operate outside of a KVM VM context.

This patch does introduce a tdp_mmu struct to hold all of the TDP MMU
state. Did you have something else in mind?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
