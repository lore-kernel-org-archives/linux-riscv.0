Return-Path: <SRS0=QS6p=P7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46029C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 01:05:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 065D0610A5
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Nov 2021 01:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 065D0610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhrA7iMwtE017E0OUVYICIemTyBIASTvKPOH+bY08U8=; b=h8HovvI9WDU0/B
	Bt9MmDb/+eHcZ9UCRA1JdFi591Pu7IASR+tD+wN1tv34v0w2HZ6WZdLT2KZt1xOlWAcCPyEqqP8k2
	NT6hBNLXfx08WkWhZG3N/KFPhT97qeZJqdlIl35ER/aIgxKIxv9ONeuox5C9tXgzI7aQH/XkhaLzo
	sgtxFtk5VkRTG58jkxWwB/ptGH56tp7+Bkma1yErEgdpH+ehn3dFIYbvJu259ODnY6pVpDookbGmk
	B9kFSE3bgaWwjbX0V05He6DkH9XZWFY7eCAu3dIhbfW/QCQF4sM26tCu6VG00nzi5k6QnLHae9NyH
	S3EaGYayzsRFky4UrPFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlL0l-0097bW-K5; Fri, 12 Nov 2021 01:05:47 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlL0W-0097X8-U4
 for linux-riscv@lists.infradead.org; Fri, 12 Nov 2021 01:05:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id x64so7075379pfd.6
 for <linux-riscv@lists.infradead.org>; Thu, 11 Nov 2021 17:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qIP3115D8X5svI1diQgiEcs//yqAqweVaUHfcv0HJnk=;
 b=gf554YHamci0DjUeVoZGJM9DOyXF+0SyUupZIF5IPY2cI9p2DatJ2USEjqu0xXifqV
 edjai3eTEtZQ8kQGbZs7d7Z7C15ddHZCGcYL3l3HeGlZRfffhdcwYAuRyJSd5gETgxWT
 yLNteK8tM4CfxpX7aPSWrcYkn7XhezHyrLOvS/D7LuUOUaU64FC3UuIcMReDTB79mTES
 QgRrs4WD82tMKsnnw7WDZ1CrEmW96jd/E14dYVs3INUpTy+GkkmVW2cT4+YCL5cjsCPL
 +tIV730AkW1ZKhOoB0H06e8044D6Lc1J08cwloc48Jw1uNWmresmiA1nxkB4w8of5HB5
 mVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qIP3115D8X5svI1diQgiEcs//yqAqweVaUHfcv0HJnk=;
 b=nXkwXqDVA4HwZ+J/UN+/o0evrjpBAJMLt1H1j6agnSOdm7JMSza/4cUz3QWTmUKb7n
 kEANU+PyoP+UIChTHyTx42vhUgG4NPchpmlZlLBuv9fVOQ6TTAr+wJLhBMvIwAeJLobI
 881zOn9qVn60YLebjinxPmtspkloS6c44W2Q6KyZ34ci2xw/2+0VAV/E12c5lUYTVlA+
 XZCTLS6Dc3Ox0ZxzI4nJS0e7dP/aLcp3aMAPuKNQzi4aVREg5l3gt1JsL4wm3EoT6jp9
 q0j8fjYIIGD3FBG74lYdvviNoNaTn7V3PKt8lfkOroOt5CSrIgOR5kFzp/F3hqXy8/14
 CxYw==
X-Gm-Message-State: AOAM533QPZQA80iBmGmBqmgslUifzsLBVE0mQ427EzlUsKkpqFqeTBiI
 Q2cPllc2m4lIQW51mzbJL7lmsg==
X-Google-Smtp-Source: ABdhPJx45D4HU2DqXINd3JCy7/gtFEnfRNSJTdzRC106LwgioqW5s9+ZH9bnEHC0LBIDe1RslUxzZw==
X-Received: by 2002:a63:8048:: with SMTP id j69mr7469829pgd.111.1636679131571; 
 Thu, 11 Nov 2021 17:05:31 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id b9sm3251946pgf.15.2021.11.11.17.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 17:05:30 -0800 (PST)
Date: Fri, 12 Nov 2021 01:05:27 +0000
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
 Ben Gardon <bgardon@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5.5 24/30] KVM: Use interval tree to do fast hva lookup
 in memslots
Message-ID: <YY2919Td8f+F4EDr@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
 <20211104002531.1176691-25-seanjc@google.com>
 <d76707b5-8710-b1a6-0cc6-defdaf9e37b7@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d76707b5-8710-b1a6-0cc6-defdaf9e37b7@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_170532_996173_FDCACA76 
X-CRM114-Status: GOOD (  17.12  )
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
> > @@ -1262,22 +1274,32 @@ static void kvm_replace_memslot(struct kvm_memslots *slots,
> >   				struct kvm_memory_slot *new)
> >   {
> >   	/*
> > -	 * Remove the old memslot from the hash list, copying the node data
> > -	 * would corrupt the list.
> > +	 * Remove the old memslot from the hash list and interval tree, copying
> > +	 * the node data would corrupt the structures.
> >   	 */
> >   	if (old) {
> >   		hash_del(&old->id_node);
> > +		interval_tree_remove(&old->hva_node, &slots->hva_tree);
> >   		if (!new)
> >   			return;
> >   	}
> > -	/* Copy the source *data*, not the pointer, to the destination. */
> > -	if (old)
> > +	/*
> > +	 * Copy the source *data*, not the pointer, to the destination.  If
> > +	 * @old is NULL, initialize @new's hva range.
> > +	 */
> > +	if (old) {
> >   		*new = *old;
> > +	} else if (new) {
> 
> Unnecessary check - if "new" is NULL then the code will crash anyway
> accessing this pointer unconditionally...
> 
> > +		new->hva_node.start = new->userspace_addr;
> > +		new->hva_node.last = new->userspace_addr +
> > +				     (new->npages << PAGE_SHIFT) - 1;
> > +	}
> >   	/* (Re)Add the new memslot. */
> >   	hash_add(slots->id_hash, &new->id_node, new->id);
> > +	interval_tree_insert(&new->hva_node, &slots->hva_tree);
> 
> ...in these two lines above.

Yep, definitely worthless.  I think this was another "plan for the future" idea
that didn't actually add value.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
