Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBB1C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 14:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clxFg97erGk5kL/z9kvI32ixyIOJHv17/NUFtW6XukA=; b=CzCOMtrtq8qX/F
	gltoQuXCCWYfUOZ0F5tvuOh1GVTF5SXucp+ZMvnBNFufKhk6h/c+dPxG9OqizWZsOv0Pb9WOXAqvL
	Pr/jikA02xuhlwhbmCDP6VEokpXbPacFQy4DORXdfUsprIjDQyB+dTziKSLKir1+ToKK1XqkQ6D8o
	Pzzq1ZRFtRhJpwsoeHSsJFwb3DOOrctw/EE9N5Vmr8lOrorJ5g9ypO4UXCgXA/LvWPWEGlj52JWTw
	UmoYIA/Yigl7BiRsldRtK4YCsFZK/FEukpJPNA4YOt20r7pM+Al3cceVtIBnAI84DsiKgih9P2SHW
	3jHuz0bQ3nnMCw6mS8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fH5-005zsM-3k; Tue, 21 Jun 2022 14:54:39 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fGr-005zmU-FE
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 14:54:27 +0000
Received: by mail-pj1-x1036.google.com with SMTP id g10-20020a17090a708a00b001ea8aadd42bso13682381pjk.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 07:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ePpQR91B1wy0uIyvmn3lmteXD4y16fGYbzlfAq99TJo=;
        b=coFv7I5Y78JhXoxS37XR9c+mZYbk7SXPwuO7aREgBr4Q4xY/8nD/BF5WkQBHENLFnR
         M2swZ0YHKkbeZ6TusTYTCyinn24BoObIO+T5wnAXl9f2sGVIP8rG2F0nAbxkmCVGoPfH
         dAA8jbBGQ+fJqAoZJEhloFcXw4ggDv8whrRonPLp5/G9ruQkcs3nglSNUwAkZ1SThAWs
         1rcmQq3sdA0WobCN3wZET42yLYirfqnABm0YdtxHceX3EHLEBkMtv0LKHMPI3jgadxxF
         dsa+Azc2y1bTS9+0PGwluDhQy+WUsYOcrTtvwmmyLjgGWHBJwb4h86H6/giVMU3D/eNI
         BJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ePpQR91B1wy0uIyvmn3lmteXD4y16fGYbzlfAq99TJo=;
        b=IHEziZfIJtZW/fk6ifIW6f/LgCJshqKwxu4BwrEM0kZJGKk+TvcYmClANX0CyYZfim
         gVNq3LqFkq+wjwuUcyaVbPsCIZGcoDSviTrvKcwPVcIR5p55VHHiaFEudzsyea8+fw1b
         4SeCj5WjE8fbWoZ74XLEPz5ZBD99h8unwSZvAlHdpkDUIn9eujEi84rwgGK5NcK2JiXv
         GdFAYNgwfxE3UYGgGQQ9EkbRK5jlefDD2x84LzNVt603dr2AavCoqSkHbLM7s4VgsHNt
         a6iEMCUO5BOY7OsEzZ4JLvp7WKoykBjrsB2qkpZII0FbKeSJtdOJjiJWrSw3X00zpUQP
         MilA==
X-Gm-Message-State: AJIora83hv8xdUaYmZt+hQVDvOGEg3tWbv96FWE86A/itGs2Jmp2vukq
	ZZqRi6dZeakJki35GdgBy+15hQ==
X-Google-Smtp-Source: AGRyM1vbuWPmzs8GSCKmhq+oi4jC8RW6CP9GBVkjErftz4qJu7wc14nAXYcvbe2B5lTWXF3n/kUg1Q==
X-Received: by 2002:a17:90b:4a82:b0:1ec:bb6b:38d0 with SMTP id lp2-20020a17090b4a8200b001ecbb6b38d0mr7523665pjb.213.1655823262366;
        Tue, 21 Jun 2022 07:54:22 -0700 (PDT)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id b21-20020aa78115000000b00518764d09cdsm11307136pfi.164.2022.06.21.07.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 07:54:21 -0700 (PDT)
Date: Tue, 21 Jun 2022 14:54:18 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Colton Lewis <coltonlewis@google.com>,
	Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH 0/3] KVM: selftests: Consolidate ucall code
Message-ID: <YrHbml1HAfDtvMfn@google.com>
References: <20220618001618.1840806-1-seanjc@google.com>
 <19bba1a0-8fb7-2aae-a65a-1111e29b92d3@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19bba1a0-8fb7-2aae-a65a-1111e29b92d3@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_075425_574487_6E867FA7 
X-CRM114-Status: GOOD (  13.72  )
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

On Mon, Jun 20, 2022, Paolo Bonzini wrote:
> On 6/18/22 02:16, Sean Christopherson wrote:
> > Consolidate the code for making and getting ucalls.  All architectures pass
> > the ucall struct via memory, so filling and copying the struct is 100%
> > generic.  The only per-arch code is sending and receiving the address of
> > said struct.
> > 
> > Tested on x86 and arm, compile tested on s390 and RISC-V.
> 
> I'm not sure about doing this yet.  The SEV tests added multiple
> implementations of the ucalls in one architecture.  I have rebased those
> recently (not the SEV part) to get more familiar with the new kvm_vcpu API
> for selftests, and was going to look at your old review next...

I had forgotten about that code.  My idea of a per-VM list[*] would fit nicely on
top, though maybe drop the last patch from this series.

[*] https://lore.kernel.org/all/Yc4gcJdhxthBKUUd@google.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
