Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A1FC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 15:29:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA6C60E0B
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 15:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DEA6C60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a97ylkDKd2MgG+Y87m4QVtX93j7bzQTblB60jbUrosA=; b=SmU6LLEAUU3dbV
	RzFJDw/BxpHWO9AEgMVPx9VldDunDGlZyfAoYyxod63HFLoBNTy4d/NsGXQZRkhXHp6H9V5fYsyT0
	6w996cCnReIey7ArOV6/+qm6Nls7mMTn5qJycqUVoknBn+5LdWbJSOu0R+TE23UEe8hQ0OiZ27TjU
	iU2IhYl2Yu5j3ExsFAhOaTM23IeCyuFIHYhicJBjprWWtdUeZgCFRB3F0SWA0xajepnmiqF1OPsXS
	f8rHxuSY5jRkrLF9CbtXtCYGHOH09h2QhWZ4CkjRcgxSbYM4DlZbZkE3svERLm5XURZR9OMbWmU9q
	2PkkDG+kt1Z+ve2ZTqfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfkrD-005JcZ-2C; Wed, 27 Oct 2021 15:28:51 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfkr0-005JZh-EA
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 15:28:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id f5so3225163pgc.12
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 08:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jluBW5yA9LvugmQi8oyfDy8/cabbakiUXPqo4utsaB8=;
 b=IXIkAF60iwH8Ca28unKtkkjCxMxH4jsRE7rdlyRpHRKxqRH5DKvzKzXeE1xZpeP67E
 xwOJxCxtNAW/vuRZ9/cA++xLC0bu82EJesdjjIouYVg3x2VESqFJeksK7bKKBVif038n
 GNlri9Hc+F1u7CW4lPLn9JPRn52da4aBC4xsr93HTbSLq1yGzKbznkaiM+WfpWPTb1nX
 8Hjyo7QQx66GQF0REMEMDncs7WF5cqEgNENljeKIdAyawTn2njGp/q6Q7uPOzyYDFpEX
 mqf5isD4pvLAp694w88H9zUwbgY74QXFwiejeE2dZlhZt757K0HlOnfUIVAivKet6eGr
 4Dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jluBW5yA9LvugmQi8oyfDy8/cabbakiUXPqo4utsaB8=;
 b=e5+iydfoOLbYHBpLgxGObTl+QwX3/u9rKmW5PGUgWuMHWgzD+688kwaLOwDJw7XbN6
 Wc5bI8NjU5/Dz6XFhkKgIjNTwT1Q67/2IR8iCVeXEH894aS+bF2jAFo4TQbOfEwrxfoa
 rpXhtit7+grW7T96Eln75cpqftBKQlEsJWPqEwXeASWES+XXVrMuCGk36SSgzAcE/U9X
 CxtumWpcGk6EpCh1qMWLKEv6I5Ka/F/VDKu5lV+Jl05X1oCuhVTe0N0p6IIN0/5djpTD
 f/PrHfVI++hIx+9/g76NbWkzBMNIStauIUcHP5bf7cePH9GLgDTONxK+ZGOm7iP7CLZD
 lKgw==
X-Gm-Message-State: AOAM531M1zSOtbA3iEDHRFZT94Ax7Ppq21D2NnZyFVP41DzP/rCiQHlj
 xDklq2Qy45aaqZUX2mVTUjlixQ==
X-Google-Smtp-Source: ABdhPJxibfpJFn220g32tVsxXXYwD2JThHpi8b5HJLrZMbbjn5Hu0UDQk4ZV4kEcRQbC7q9gao3DeQ==
X-Received: by 2002:a05:6a00:2405:b0:44c:1ec3:8dbe with SMTP id
 z5-20020a056a00240500b0044c1ec38dbemr33619608pfh.33.1635348515143; 
 Wed, 27 Oct 2021 08:28:35 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id y19sm340714pfn.23.2021.10.27.08.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 08:28:34 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:28:31 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
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
Subject: Re: [PATCH v2 00/43] KVM: Halt-polling and x86 APICv overhaul
Message-ID: <YXlwH2vWILFS9QOG@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <614858dd-106c-64cc-04bc-f1887b2054d1@redhat.com>
 <YXllGfrjPX1pVUx6@google.com>
 <ecec4d7d-13dd-c992-6648-3624d7c14c24@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ecec4d7d-13dd-c992-6648-3624d7c14c24@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_082838_517112_F2D64046 
X-CRM114-Status: GOOD (  14.26  )
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

On Wed, Oct 27, 2021, Paolo Bonzini wrote:
> On 27/10/21 16:41, Sean Christopherson wrote:
> > The other thing I don't like about having the WARN in the loop is that it suggests
> > that something other than the vCPU can modify the NDST and SN fields, which is
> > wrong and confusing (for me).
> 
> Yeah, I can agree with that.  Can you add it in a comment above the cmpxchg
> loop, it can be as simple as
> 
> 	/* The processor can set ON concurrently.  */
> 
> when you respin patch 21 and the rest of the series?

I can definitely add a comment, but I think that comment is incorrect.  AIUI,
the CPU is the one thing in the system that _doesn't_ set ON, at least not without
IPI virtualization (haven't read that spec yet).  KVM (software) sets it when
emulating IPIs, and the IOMMU (hardware) sets it for "real" posted interrupts,
but the CPU (sans IPI virtualization) only clears ON when processing an IRQ on
the notification vector.

So something like this?

	/* ON can be set concurrently by a different vCPU or by hardware. */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
