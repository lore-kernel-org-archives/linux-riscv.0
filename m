Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDA5C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:41:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3017A60F9B
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 14:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3017A60F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sml+2SApV6bcT3DNQTxdxuL/z9oXbzF0HSvBkOnVo8g=; b=DjhPHDzmqTP6HL
	ClOU9cbiBr7pLczboObJag0A2BlM6ZHcbKPQLiIKya44SbnTeUzJZJDNqoRZWRhokWwC2S07wwEB2
	mFGnGhATNB2WxGnaaSDCKckPW+S1yBQcIYfO6mMRGKk671G+Qa0faVKHBOesIoOpc9CmYfb2I++Td
	0rxWwH6mN0cEuphkvj6NF+1NXd19M2u+A+8Y1TdBOpx744sX1IhjuCEJGwRTzWtb4fp+srscBCYpS
	1SVo1Cb8vlIFlHIHKWFI+5NM8VMOge8hNFRBNmxI2/uIQCDvJoHavuhC9QFjJaQTQIOmsvPp5n+3a
	o0I1iGPlIuecX01dtCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfk7h-0059rf-Gf; Wed, 27 Oct 2021 14:41:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfk7T-0059nz-DT
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 14:41:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id y1so2134920plk.10
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6OXSnlnR0rRr4zd42xResiJ3HjI4vG4520z7JUuMyYs=;
 b=BjRC0MDFBU5q9E3Xn8qZmMldFXyvZ//eySha9xAzB0jmoDoGvnBh5rZJNDCpSwdREy
 9EoAYcD7qkeaNtvcOM9mdpbf0o5Zx8GfPrl52oPVsVupbvte1MAYXeh2gVgPvsjmKTcr
 OvG3N8s6IdOwoiORDWmu79MSfTC8tCdjVwsKVWNIZ01jMG+JmYVN7Tn36JxeYZuyLkmP
 l/68I6qwCJelKOJxW8ZO7A5e+myyHTZHJETfMvox2BFMDLmdkBWjqGYYnYuVXEvP/t+D
 dTunWvGIgVZuDjHHD1Ty/XEe2DuBSz3CLrLeXdA9pKLBh6KsJK0Pre9s46e4k0Dr+ooy
 7X+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6OXSnlnR0rRr4zd42xResiJ3HjI4vG4520z7JUuMyYs=;
 b=a7MUAhaqD9hpodenEA/hPeWllA2JCaZ/ziYBRivf4FHzfJyIHe6xDLy+aULUg/i5U6
 wGTR3OzLaB8+hPTTYlYDTyKpGnuHujcIRGLK5EXEESjb8xSUGZMILfzabPXeqLHe05W4
 hr/vJ2p7zWEXVbY3Rf4MQsaj+biDgS9ovTgwdeVCLjp4UOnh/xnxnqf/cegriXNTOBfd
 kxrohz1kDJt7yZbGk4kgJFg6464356cYj6P11v0MKbcBjLkFnnCmmyHZbYsSeXMEkUaK
 xUuF8eLQOsyXGEXDgb23EAFdjtLMSicvUkYcSLTb1z3fBpx7Q5l+Ioj7cPXpxJjBHNDg
 a97g==
X-Gm-Message-State: AOAM533Nm8ztCJ4FT3sryVV6OKYOqca1tZJe4Wodzg39dtfdLpgWPIlN
 Nx0S12wn+ef/KtLudA2QgGrKBw==
X-Google-Smtp-Source: ABdhPJwpvrRMvTZfA8g36IWigq/Ddl2lTxPKT07H9cOHEBI6XhDgd4CVWZEorIKgU9/kACcZuDTlgw==
X-Received: by 2002:a17:902:e812:b0:13f:3be8:b15a with SMTP id
 u18-20020a170902e81200b0013f3be8b15amr27601253plg.49.1635345693861; 
 Wed, 27 Oct 2021 07:41:33 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id e9sm203521pfv.189.2021.10.27.07.41.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 07:41:33 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:41:29 +0000
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
Message-ID: <YXllGfrjPX1pVUx6@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <614858dd-106c-64cc-04bc-f1887b2054d1@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <614858dd-106c-64cc-04bc-f1887b2054d1@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_074135_505609_FF504095 
X-CRM114-Status: GOOD (  14.87  )
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

On Mon, Oct 25, 2021, Paolo Bonzini wrote:
> On 09/10/21 04:11, Sean Christopherson wrote:
> Queued 1-20 and 22-28.  Initially I skipped 21 because I didn't receive it,
> but I have to think more about whether I agree with it.

https://lkml.kernel.org/r/20211009021236.4122790-22-seanjc@google.com

> In reality the CMPXCHG loops can really fail just once, because they only
> race with the processor setting ON=1.  But if the warnings were to trigger
> at all, it would mean that something iffy is happening in the
> pi_desc->control state machine, and having the check on every iteration is
> (very marginally) more effective.

Yeah, the "very marginally" caveat is essentially my argument.  The WARNs are
really there to ensure that the vCPU itself did the correct setup/clean before
and after blocking.  Because IRQs are disabled, a failure on iteration>0 but not
iteration=0 would mean that a different CPU or a device modified the PI descriptor.
If that happens, (a) something is wildly wrong and (b) as you noted, the odds of
the WARN firing in the tiny window between iteration=0 and iteration=1 are really,
really low.

The other thing I don't like about having the WARN in the loop is that it suggests
that something other than the vCPU can modify the NDST and SN fields, which is
wrong and confusing (for me).  The WARNs in the loops made more sense when the
loops ran with IRQs enabled prior to commit 8b306e2f3c41 ("KVM: VMX: avoid
double list add with VT-d posted interrupts").  Then it would be at least plausible
that a vCPU could mess up its own descriptor while being scheduled out/in.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
