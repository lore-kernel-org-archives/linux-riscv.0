Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D79C52D6D
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 08:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG1UWTfXxf/T76J/4f06rNYAfeFUpS6kk2IzkwAoh0k=; b=cYPkaqkMcRqzQU
	dr+3vaEvsejhvFor1bfSje4z24EnQnhNJJIrp76cvuXSAK8KrMeZc1BDb9rWN8ImTDpb7xsoEaXzj
	xH/toH3NdvLUE/N24tEVTEM2y8YJVg0w1AUapgCZeO/57aVA8JUbLl57IvYC945NK1wmISAEbbY0I
	wIGmcgxHffv7G79OBeIgaa8CoviBH+RCuKoWv3YS//ZRNIfG2q0VhdRsckuraxhOx3qsl65Lcerg5
	rzfjZAIoUMiJw6StpSQn+jr4DHsNFpzaf+0KP8NetZTrx5/I1gdvh4+YnSeqB8ZnlcabtHbL0gQtd
	YQv/g4H7B70plG7UZpTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbFVk-00000000vg4-3BCk;
	Tue, 06 Aug 2024 08:25:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbFVT-00000000vaK-148V
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 08:25:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-428f5c0833bso11530875e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 01:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722932721; x=1723537521; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mJJmve+UBZqWHPzqvXAkYx9wHC1+4s/jebXaeWpKSm4=;
        b=Id1ZnMCfyFF0C2xp4T54G3LI+Bls9A6oAK0+Z+1sWTu4Qzsd93iohYKsCahQTvqySp
         aoeE43HJu0TGUy0DuG+OGJHDqHzHMvw4NszIHiIhgFQsyJcAX92Pyu8yu/duZAuruwR6
         BO7C/L/cT3IKTyFzPIzYllILAJIQ9lXWCPnVGU3qmKYGxpX7EC6Bu+nnO3Ap0FLxEra0
         rKM8kVMaZ5o4Wx57phlfVKlulWb98OodHhqBSKrmwuhTuH7Y/NEG3TjBnL2c2S1sOVk5
         a4QGflJB51IdBfQkqe5GCFS92YV0OKu80TSr9CjAUPdfKJNAEKmlri7u117VpyDId3w2
         /UIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722932721; x=1723537521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJJmve+UBZqWHPzqvXAkYx9wHC1+4s/jebXaeWpKSm4=;
        b=v0iMM+DqN1pObSL9iTdxO5Bq0OSJ4gzAHeGl0o8FKTDhRWTzU/t5NJ/Yl5OPcauk9C
         SzdRMXyjLSrnO/xwqR8Ksbdc1UH84fNaZ7ay/qsJ9RiTZxtiXoPj6KE9Yqg1GAs0JIBn
         TTbOTtXRaVBPAvcbSWtC6mqa/71dEI5DO01ye56nUV7uZQEl9dc+NgKSsvHKDjozu3Cj
         NV557u09L82QA0jotNl0S+nIuRZLIyqsXn74i820ONaomhxu8y0lzU8hr1teFyee6sGf
         vj59gBKP9mt1gu2wt+u/MupyurXcrJnEnTOIEqXJUdKWkpDe60ohq7wbwsu1HGDN680r
         V0+g==
X-Forwarded-Encrypted: i=1; AJvYcCXil+wZ7IQDDo22ivhEFKximYZaVce/lzIUtU2CFrFW9FqtiYyixRY8WoHR67BzZDSvZ/2HwKHutf0VlDR04ybHc51ogstVTRaqQAnFFnV5
X-Gm-Message-State: AOJu0YyvSO4lZBwvOV02PFznrqQAKCctqaIFFX6UxTD+1TZzdDbE6qd7
	tPeLyCqIeeMOJYC0NSURQWypKri9W+py6JukRs6DO8SWYvH8Ho7/kItHdzfX1K+6EqqDGmRqdvv
	8uk6/lax8TQh/u+0UlWd6API/p9f8yxDTgtMW
X-Google-Smtp-Source: AGHT+IEuJVBQVgvvzdKoA/IljQMVSQQCy4ILUfIi4PfR2IcPP3crNOUdNiIGa90I2U+SlhluocGZ2/3ZifLac4nEAJY=
X-Received: by 2002:a05:6000:1151:b0:362:2af4:43cc with SMTP id
 ffacd0b85a97d-36bbbe5be99mr9354068f8f.19.1722932721184; Tue, 06 Aug 2024
 01:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev>
In-Reply-To: <ZrFfgzRbiqT-Zi2O@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 6 Aug 2024 09:24:43 +0100
Message-ID: <CA+EHjTxZwDOeC94Y1otxcp-mcwUZA=TpQp4pav-E8Xvb2MA64Q@mail.gmail.com>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_012523_352788_CCEF751A 
X-CRM114-Status: GOOD (  24.20  )
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

Hi Oliver,

On Tue, 6 Aug 2024 at 00:26, Oliver Upton <oliver.upton@linux.dev> wrote:
>
> [+cc Fuad]
>
> Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
> the page as dirty out of the critical section") that restructuring
> around the MMU lock was helpful for reuse (presumably for pKVM), but I
> lack the context there.

That was for some refactoring I'd done later on for mem_aborts in
pKVM. That said, I didn't know at the time that there might be a race
with some filesystems. I'll keep this in mind for the pKVM code we
have for now, and when upstreaming.

Thanks,
/fuad

> On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> > Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> > page/folio dirty after it has been written back can make some filesystems
> > unhappy (backing KVM guests will such filesystem files is uncommon, and
>
> typo: s/will/with/
>
> > the race is minuscule, hence the lack of complaints).  See the link below
> > for details.
> >
> > This will also allow converting arm64 to kvm_release_faultin_page(), which
> > requires that mmu_lock be held (for the aforementioned reason).
> >
> > Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/arm64/kvm/mmu.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 22ee37360c4e..ce13c3d884d5 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1685,15 +1685,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >       }
> >
> >  out_unlock:
> > +     if (writable && !ret)
> > +             kvm_set_pfn_dirty(pfn);
>
> I'm guessing you meant kvm_release_pfn_dirty() here, because this leaks
> a reference.
>
> > +     else
> > +             kvm_release_pfn_clean(pfn);
> > +
> >       read_unlock(&kvm->mmu_lock);
> >
> >       /* Mark the page dirty only if the fault is handled successfully */
> > -     if (writable && !ret) {
> > -             kvm_set_pfn_dirty(pfn);
> > +     if (writable && !ret)
> >               mark_page_dirty_in_slot(kvm, memslot, gfn);
> > -     }
> >
> > -     kvm_release_pfn_clean(pfn);
> >       return ret != -EAGAIN ? ret : 0;
> >  }
> >
> > --
> > 2.46.0.rc1.232.g9752f9e123-goog
> >
>
> --
> Thanks,
> Oliver
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
