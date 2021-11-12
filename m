Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A01C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 01:33:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707696124C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 01:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 707696124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0eVPrqtJhzbWXCakaOeD/2MPN7Jn3WhHNpDI6hX5nc=; b=Qof0d00TSK49EE
	tZ2UKie1q+Q3G3POh5w5WNxF4S/SMXiUjfqh3oTRLTOak13ttteB38ttEVzyY2+NOiHKiMkGtGrEB
	qtbxy4o46GeYo7JBpzelWJCAvvXbG7Rs7e2Tr959IYhY97/4m2PkwIBHf4LeLnHbHgUPSOiqH6yHy
	WIF1sniZyS0HbKnti++l+EZHLd5NEbM/2TwxoueQufb3/1Ag8i2O3ykn0qv+wFon2phtJ426vxJvE
	lFXnUi4eV7FO6UlbcqnSWFu8FxFuiLFzA+yEzgc3ThaBqO2ZRSgTDmUDjLzXp3zv864dBbOWDQrNl
	aLYxgzaYakORBWvfE7ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlLQw-009BLQ-9w; Fri, 12 Nov 2021 01:32:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlLQt-009BKU-3H
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 01:32:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id p18so7116839plf.13
 for <linux-riscv@lists.infradead.org>; Thu, 11 Nov 2021 17:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AL90QSnlPxXv5tLufZ1zlq7KjJ0D5BExWrjps1t+29s=;
 b=bxpxOXkH1/gRoN3q2sIlqLWqnDgG6G2HCxNOF6DiM0eebPtdUrVaLZdwTKm30XXIKf
 pciYCCAraDj6+N5ub88aiEU9Sqc+gEEP0tH18UnSplfqeJqpp5zQ3lSTaSygRoGg4fg+
 tll+ejzFsotRKGLbtXHvALciCIt5yeW9ml8k89oDq6DTTLGsUACfArDWOsNIoY0iXp96
 kikQ0fngC+TPH3Kllv27OAwe5xRNf7EWJvcamUReZttXO7TYV+21eZVF7m1gQCC7oZ3B
 biwzTph5R1rTPbnijCWDmekT3qmBDk8AlH8GBjflmk5suuX4JZkxLi8aoALrZ9ZHJtW7
 R2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AL90QSnlPxXv5tLufZ1zlq7KjJ0D5BExWrjps1t+29s=;
 b=cxkrCoM5GvfLkCm3Fc4wx/MlCmGYBmu54VmdgkKo8VIF4n/tqdBVM1aMBrFJLvO0Pz
 NR9pAYP/50rRTeLHOpPrr3Dv6MZxug2L7kT5g94HDusveIoms6rRo7T1MhR6eY84DXCP
 vin3NhcdEW6x4YQzGkWbnqkx5ytc1KwpZHMbop8+nUcmkkCYbPsDQukQYO47Ffixlby0
 oY1UxJ+M3W896zyWY5CPyILHaBup93RjxI+iOoPYYm8Tp4fhQJRKsirmVNMkHbmIto7B
 Mm2zzrQjtQpf91VYHwfAymKbckvTQs0flEI5qxMFFw4EVWkx4wmC0yHwAV79HhNp9bRZ
 +2Og==
X-Gm-Message-State: AOAM533CT71Jpexj/b0a3ynxDcZbz1fLJW3JPa38U4OKP8WyGlbJE1pf
 e7YzQkM5wWbm6dtniiIaoqijiA==
X-Google-Smtp-Source: ABdhPJy7r4nQtcrRS0vLIHiQ7JwTdkVyJqAYi43992L2uT2O4NHn7Evm+9JHhEIz/lSq4u0UiWyh1A==
X-Received: by 2002:a17:90a:17a5:: with SMTP id
 q34mr31238939pja.122.1636680766291; 
 Thu, 11 Nov 2021 17:32:46 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id p23sm9227849pjg.55.2021.11.11.17.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 17:32:45 -0800 (PST)
Date: Fri, 12 Nov 2021 01:32:41 +0000
From: Sean Christopherson <seanjc@google.com>
To: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
Cc: James Morse <james.morse@arm.com>,
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
 Ben Gardon <bgardon@google.com>,
 Huacai Chen <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5.5 30/30] KVM: Dynamically allocate "new" memslots from
 the get-go
Message-ID: <YY3EOeHVvgOKHNnt@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-31-seanjc@google.com>
 <fee75f86-26b0-2dbe-770a-8ecf5cc9e178@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fee75f86-26b0-2dbe-770a-8ecf5cc9e178@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_173247_191857_CA08215F 
X-CRM114-Status: GOOD (  29.16  )
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

On Fri, Nov 12, 2021, Maciej S. Szmigiero wrote:
> On 04.11.2021 01:25, Sean Christopherson wrote:
> > Allocate the "new" memslot for !DELETE memslot updates straight away
> > instead of filling an intermediate on-stack object and forcing
> > kvm_set_memslot() to juggle the allocation and do weird things like reuse
> > the old memslot object in MOVE.
> > 
> > In the MOVE case, this results in an "extra" memslot allocation due to
> > allocating both the "new" slot and the "invalid" slot, but that's a
> > temporary and not-huge allocation, and MOVE is a relatively rare memslot
> > operation.
> > 
> > Regarding MOVE, drop the open-coded management of the gfn tree with a
> > call to kvm_replace_memslot(), which already handles the case where
> > new->base_gfn != old->base_gfn.  This is made possible by virtue of not
> > having to copy the "new" memslot data after erasing the old memslot from
> > the gfn tree.  Using kvm_replace_memslot(), and more specifically not
> > reusing the old memslot, means the MOVE case now does hva tree and hash
> > list updates, but that's a small price to pay for simplifying the code
> > and making MOVE align with all the other flavors of updates.  The "extra"
> > updates are firmly in the noise from a performance perspective, e.g. the
> > "move (in)active area" selfttests show a (very, very) slight improvement.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> 
> Reviewed-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
> 
> For a new patch set version when the "main" commit is rewritten anyway
> (I mean the one titled "Keep memslots in tree-based structures instead of
> array-based ones") it makes sense to integrate changes like these into
> such modified main commit.
> 
> This way a full algorithm / logic check for all the supported memslot
> operations needs to be done only once instead of having to be done
> multiple times for all these intermediate forms of the code (as this is
> a quite time-consuming job to do properly).
> 
> I think it only makes sense to separate non-functional changes (like
> renaming of variables, comment rewording, open-coding a helper, etc.)
> into their own patches for ease of reviewing.

I agree that validating intermediate stages is time-consuming and can be
frustrating, but that doesn't diminish the value of intermediate patches.  I do
tend to lean too far towards slicing and dicing, but I am quite confident that
I've come out ahead in terms of time spent validating smaller patches versus
time saved because bisection could pinpoint the exact problem.

E.g. in this patch, arch code can now see a NULL @new.  That's _supposed_ to be a
non-functional change, but it would be all too easy to have missed a path in the
prep work where an arch accesses @new without first checking it for NULL (or DELETE).
If such a bug were to escape review, then bisection would point at this patch, not
the mega patch that completely reworked the core memslots behavior.

And IIRC, I actually botched the prior "bitter end" patch and initially missed a
new.npages => npages conversion.  Again, no functional change _intended_, but one
of the main reasons for doing small(er) intermediate patches is precisely so that
any unintended behavior stands out and is easier to debug/triage.

> Or if the main commit was unchanged from the last reviewed version so
> actual changes in the new version will stand out.
> 
> Thanks,
> Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
