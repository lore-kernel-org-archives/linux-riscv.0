Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864A9E88D72
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 23:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SUrzV7QsRVvKXNRFVp9k5YRkepK0JQC6jj/6pNPdPwc=; b=LJ0+kZYZeZyk6zveu+uY3UglcJ
	0Eg6lcCkxsSNWEmFAEJW7VwPGho+Jyk+zM6LOfJhc6RbcYMx57XQcw48ZQkqPrTkH42DiIsPP04fa
	rjuhGcYbnQ1dLhecawx9PicXgWWPYe+znFCgdfc5cxGOOE0+b6p2zlD7BKSkqVClFpfgzspFpfU3m
	cASXCCXP9nPCgvBaUHxaoNMvdQUzyaF6HXMiD7tjYsXtAQ6NxSfUFwAsTnwiHzIuTIu1MeBf7/3kI
	h9EHp8LK5cIcyJQHRzOpBQ2OxCbBi8061EwcJeYJU/cXzhz/mPCVPNP6YDSXALIygX0kcw/89pNso
	mbWJ1iOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ngZ-00000002iSh-3XuO;
	Fri, 03 Apr 2026 23:12:20 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ngW-00000002iRE-3VoE
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 23:12:18 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82c6929bd26so3070620b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 Apr 2026 16:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775257935; x=1775862735; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qdgYiNCpCVITKt4WdfY63SIPUYiDMIfHM1afvBz0ai8=;
        b=Q43SF2jTYFnmbALfIiw1+Tl/g5ggoL8TyGgqYV5w/muG/y3GzsY7lhMYSYddCnOsAA
         0fFHlTMJ7Sj2622mcM7D3S8mv4p0aT3cX1pmBjbTvG7WKf0v1342oqbL/P6XFJ3dnCMu
         l/UnZSdzT+YVlYLazICJKfI1bJX1TUk9+rSlgKXuPzqhF8301PSV0442ynQZQZnyCBcD
         HRrlPPUYccNSIwRUpHO6JWusBTUVCdlD0zCwjLXQcaz20P0K7PfjHcqY1jx+iXJwi+qF
         go+j1zcjIqCYPo1KA8HlbSpOijMZDyWQ5OJAdErqBkDUV198zMkzlkRbZmqjuhdyYF71
         IU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775257935; x=1775862735;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdgYiNCpCVITKt4WdfY63SIPUYiDMIfHM1afvBz0ai8=;
        b=Q2+2fLq5BQS59pemBEnj1qN4nU3noCbyafTi2Qn5aO3PoyMlyQK88Rgz3BzNFs/93h
         SjmpG8dLo7SbJfYBYjdRrtMNEA9a+dKVX8PXdetm4xQSE9PN+y+cwrLBQEI9AYwWzgo6
         nsFLb96ztIMqOuBLr6dQQIsMgriV3FP6POIVdrHLxegWBHmIrHvgW5JcP8MikOKRzBLS
         09PKwYf7TXJ0OMybhbxcfTtf1f/58Av/8r7VFvt6If10T2XUFMpc4HSBQohcppYnNPV+
         1zIRkYlHY9lIkIKsSqgp0Mb/ElbMXe2EpyFIW/UaXVsJIxcWAoaMSjH9I7Cih++tStYo
         PZSA==
X-Forwarded-Encrypted: i=1; AJvYcCVCWSgTHy3fZFPN+KGDXXhKIVMVtHfosmFNBHQxyrCKyyTyrdWRik98ZA0Jeh/slT3hfDZpBHTL0SuPoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLgaQWMFXYdbU8kkiPBPVK+71eWINjZa3Owgt5nG/8QZ/E38O3
	nwVo+GlGZgH9A7GENQcae4QlX6TknCEHauovsVn7L/u8eqbTAzBuEpY69R6OyzCq5oKUpO23hgZ
	s9bOfxw==
X-Received: from pfmu23.prod.google.com ([2002:aa7:8397:0:b0:829:7ce4:7fcc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac82:b0:82c:daa4:ce2b
 with SMTP id d2e1a72fcca58-82d0dbcfa01mr4616677b3a.49.1775257934902; Fri, 03
 Apr 2026 16:12:14 -0700 (PDT)
Date: Fri, 3 Apr 2026 16:12:13 -0700
In-Reply-To: <66e78b59-f96c-4277-b7d7-473b68ed413f@linux.alibaba.com>
Mime-Version: 1.0
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <545847c132da5d957cfc74ab19e849b16127aa8f.1773890510.git.baolin.wang@linux.alibaba.com>
 <67c670e2-c98f-490b-bbb9-2960f8175b5a@lucifer.local> <66e78b59-f96c-4277-b7d7-473b68ed413f@linux.alibaba.com>
Message-ID: <adBJTXeE6G2vQNKX@google.com>
Subject: Re: [PATCH 6/6] mm: change to return bool for the MMU notifier's
 young flag check
From: Sean Christopherson <seanjc@google.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, akpm@linux-foundation.org, david@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_161216_870355_5BC80299 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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

On Fri, Mar 20, 2026, Baolin Wang wrote:
> > > -static __always_inline int kvm_age_hva_range(struct mmu_notifier *mn,
> > > -						unsigned long start,
> > > -						unsigned long end,
> > > -						gfn_handler_t handler,
> > > -						bool flush_on_ret)
> > > +static __always_inline bool kvm_age_hva_range(struct mmu_notifier *mn,
> > > +					      unsigned long start,
> > > +					      unsigned long end,
> > > +					      gfn_handler_t handler,
> > > +					      bool flush_on_ret)
> > 
> > Can we please fix this terrrible indentation while we're here :)?
> > 
> > static __always_inline bool kvm_age_hva_range(struct mmu_notifier *mn,
> > 		unsigned long start, unsigned long end, gfn_handler_t handler,
> > 		bool flush_on_ret)
> > 
> > Would be nicer, thanks!

No, please keep this as-is.  KVM's preferred style is exactly this (and I personally
find mm's style much harder to parse).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
