Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67583C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:34:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FFB0610C7
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FFB0610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzANhvjhvG7QML8GTePBmqS6RqebL1gHVKU5VGAm2ak=; b=y+XjgKU0kqKtgz
	nqKqkm4UtQgETmyNhEkYna3+vTPxP0zDGT2ZNs1PEXn6Ha5gqW2A81Pxc8JfBs04TXMX+wXSFwupU
	F2r5Uh1S51tCrcOFS81gICRpxFDrC0qJUb69braQnhlsORQAg8PW/TFbkdWlGl4GMiVgLYcuJEPkS
	QSRieyDFpmpIlkUGzGRhDGbwq0Rnzu9GgNGEy6XgdYH5wF0VsHb/KpgpXitlLyMW7Tfzl8K95l51q
	rMAu7ckHykkQLOV57JRbY+5I6ZxuazmTOyoDZn7tmbaEVlWYN9npzF5R/3OAtwgQ5sdEiDvFWXzg/
	nU0thxV6iu+rtwVwwTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg7QD-008PsP-IT; Thu, 28 Oct 2021 15:34:29 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg7QA-008Pq8-OJ
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 15:34:28 +0000
Received: by mail-pf1-x42e.google.com with SMTP id t184so6385227pfd.0
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ObU0mLn8cgLGt35bHM9Ve7PBUotjGGEWKnNtAqnV8Y0=;
 b=Dh2oRVWq7FNB4VxeeBx+DY+B7J6W36/D0YFmfA4JinPWULNj2JAyVIdGN5W95l+d90
 4Uu/ZwJdWUivmqUAxVTynE14t1JCgr4B8VIlvCnfQRBjV/9sZBN9FbtVQViBrcsIkfKk
 FKX6ULIrvBdeMPobrWIP7p55k83rg/EH2wU4GD4W9e2j7rIISQUbKASJH6T77kFM7m0Z
 Qtlmy8wjfeMDEMJrWpV2K5PFqGDN6VxYLPZtUxrtHEs4QyogxcvUebO7UVfiBHutG04k
 U0NkfKu6Je8Pt6shzy+xbyjZteg84KZAIk3v/fR91ZfKR/MAff+MA9k1aMrDIiCOqEqs
 s/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ObU0mLn8cgLGt35bHM9Ve7PBUotjGGEWKnNtAqnV8Y0=;
 b=21rXaHqLUOD0MxojpaQV32Fvxfd9/vQjLa5GsajKfkVALJNdYlS4/o6RrypEZMRqcg
 NqvjwRBe5fbKmvhW5qot6e9HSTLpvrooFTIgtlXXpgSLIEKNOaoyhwSZoyfjCFtfiEyu
 /fMFfMK7QAdpyXXcs505IkUEi364KIRflFaYpGdDANZXnQmSgptRvV+TrMpLH4iEbPiM
 FzTuBmOapk6hJ4C3CUQE1xax2ElnzCVOOZ8GSgtRvAIjWkLiAdbOxGMAsUpDf0BVvR1Q
 RN7L2Zy7fA3kexL9EQnaFpLss7LOHaV4NbprccJOt0/HTr37KVIICAfB2VrQm9lOSn7c
 E5oQ==
X-Gm-Message-State: AOAM530MDijonYGTFFlW1lkTj9RXmcl/JezWsz/aDzBMH7HT1FhMNqso
 HV2D7GAkTmVpbMm3xdEBKan1rg==
X-Google-Smtp-Source: ABdhPJz6jdrYVfnN/6E/mwaWkSEy+zhYc5xKvC8pKY4AVCJGv9Uh9d4/rKPGgqsum0tyEq6Ye9Z/qw==
X-Received: by 2002:aa7:9427:0:b0:47c:3b8e:5253 with SMTP id
 y7-20020aa79427000000b0047c3b8e5253mr5166508pfo.69.1635435265242; 
 Thu, 28 Oct 2021 08:34:25 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id p12sm4586055pfh.52.2021.10.28.08.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:34:24 -0700 (PDT)
Date: Thu, 28 Oct 2021 15:34:21 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Atish Patra <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
Subject: Re: [PATCH v2 21/43] KVM: VMX: Clean up PI pre/post-block WARNs
Message-ID: <YXrC/X6b+tgn6cJ9@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-22-seanjc@google.com>
 <6b2bdfad87e268e861b6cc331d25790dade8e27b.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b2bdfad87e268e861b6cc331d25790dade8e27b.camel@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_083426_826774_298EC9DD 
X-CRM114-Status: GOOD (  29.11  )
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

On Thu, Oct 28, 2021, Maxim Levitsky wrote:
> On Fri, 2021-10-08 at 19:12 -0700, Sean Christopherson wrote:
> > Move the WARN sanity checks out of the PI descriptor update loop so as
> > not to spam the kernel log if the condition is violated and the update
> > takes multiple attempts due to another writer.  This also eliminates a
> > few extra uops from the retry path.
> > 
> > Technically not checking every attempt could mean KVM will now fail to
> > WARN in a scenario that would have failed before, but any such failure
> > would be inherently racy as some other agent (CPU or device) would have
> > to concurrent modify the PI descriptor.

...

> Don't know for sure if this is desired. I'll would just use WARN_ON_ONCE instead
> if the warning spams the log.
> 
> If there is a race I would rather want to catch it even if rare.

Paolo had similar concerns[*].  I copied the most relevant part of the discussion
below, let me know if you object to the outcome.

Thanks for the reviews!

[*] https://lore.kernel.org/all/YXllGfrjPX1pVUx6@google.com/T/#u

On Wed, Oct 27, 2021 at 8:38 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 27/10/21 17:28, Sean Christopherson wrote:
> > On Wed, Oct 27, 2021, Paolo Bonzini wrote:
> > > On 27/10/21 16:41, Sean Christopherson wrote:
> > > > The other thing I don't like about having the WARN in the loop is that it suggests
> > > > that something other than the vCPU can modify the NDST and SN fields, which is
> > > > wrong and confusing (for me).
> > >
> > > Yeah, I can agree with that.  Can you add it in a comment above the cmpxchg
> > > loop, it can be as simple as
> > >
> > > 	/* The processor can set ON concurrently.  */
> > >
> > > when you respin patch 21 and the rest of the series?
> >
> > I can definitely add a comment, but I think that comment is incorrect.
>
> It's completely backwards indeed.  I first had "the hardware" and then
> shut down my brain for a second to replace it.
>
> > So something like this?
> >
> > 	/* ON can be set concurrently by a different vCPU or by hardware. */
>
> Yes, of course.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
