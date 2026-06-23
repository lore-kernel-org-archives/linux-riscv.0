Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C677ECDB470
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 07:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVZPgKOe6zEqupB/sdCGCkCclLKPBnYL4TH5jZMphRQ=; b=UKCuN9e3YvXG9z
	v1egm7VCkXsjJp8AfmAFSon2U0LWy4Kh/rDiStlq0DkeOyPXbcNExqA0SUgF1PTHJPsoseyRlavx/
	tybz4WT1D57BT35e7CZDq2Wwsi1XuU/znJJF2Z+F5KIPlz7831ax7I8ceY7PRa5O2kF+p2+UHsGXP
	YbCcdMzA5JQa6Z/OAm0E0Hc0NO6BZZa/BkZropwIN3A8uutbZmwiV2YzaHDJYoFAZAtzu2QD0T/w0
	ebE0Mwuo96j7BAkDjbi5ftAB5Bz6ojAijEH7HChgtVk19lQJ4j6l1T3QBzBVoLCqUKJAQc0rr6wKN
	m06KelAChywJN38z29fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbv8F-00000005nOv-2PGt;
	Tue, 23 Jun 2026 07:01:15 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbv8C-00000005nOC-3drv
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 07:01:14 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-30c6040aa54so133051eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782198072; x=1782802872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6Ap3YJUEuoJTFxCbawQ11i/jSYqTs+DIopPqv2NeZw=;
        b=MhASbAvlY+n/3oI65P9fNY7EkQ/CdjDF/baW1akH7jO5Bt/VsCinI9luMZvE0ZHEVU
         dv947pCAMVNic9GyxpXIX4y+ofsPz6TBoZUnPGUbnErs7ayNjoNTkmnd3y527dGtEKrd
         CGyItepaZ+as19+yuP5G3DRyl3JlkkCD18C8R2W9y8kMCwvC37JccAOjvYit0z/BrXt0
         eLQx2DJ7T05lG2XKAftY0/3nfeVMZvNMbTJfnl1hr8NVSqpK+O/8TkecZlq5P0zDpb1+
         5uCFZOJOLUu+usz4rgx8PPrPseZCg31RSz1uQUQcCEhwLEEm44qdTI/oLNx/WsZg1mLc
         2+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782198072; x=1782802872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6Ap3YJUEuoJTFxCbawQ11i/jSYqTs+DIopPqv2NeZw=;
        b=E/XQ6mNKDi7880QC4J+iYHyn2eQmdVPnaDO03LLVR82FX+4VD4wtPY33HzSZRp/CRi
         4DgdPcrw4MyxsZBVeY2AltumjpZba2D5fBfiPOjiyMipyuqI7SdeyANlTEHKCGEa01r7
         fSOmkqHj6B7ZdEvJJ8u4+YhRg7W4krW5S7DOMUPw6yTtApJN7oRTxXA295TOAwPWuu0p
         azBegiAi9wc9e/hFORvCV9rE/EJp8gF10sMvmYu5fD95FzMEOHv6+bP65JPM0zqKmrbG
         TfB9X1beZaM4jFd9ljfxShUGloAI0UuHePEmdbFYrMSvSGs+IjeZklkQdnd57mjT/HOM
         th7A==
X-Forwarded-Encrypted: i=1; AHgh+Rp+WspEhelsqctzfH9BSqlB9vL8alOaSbenZKVHz14uzpmGuFW4+hpCvsYq5eITBXZw99Qxp81zfHsRVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXf7DCy6EOztgP1szHJ8yEtG5O4fW9tKydbnDZCWLRzDbE0cGd
	Ler6EIJ2cTfplhXjpPAJhk8A0KJoUZRXCNXkrpxWA1xSDktZVxuAn8TC
X-Gm-Gg: AfdE7cmA7HdpUxNtTpsKVafQ2x6BECF1VQrL+WXqpsaYp53gaxB7wIonmM/0O/gkM5h
	uMTBgh/wJ7BZSUFH5xoLp96QXlQDAagNihGg5dcWZ5ejUFijY10/CKTznmpws4Xw4BzGzieM1bw
	q3MOjTsKC0cI61z/yfFCs18vIUD9PHNbXI/iy22/YHJBQCyuL0gMlwsXmqpH9AL0D0PXQAmxYNw
	u8y6NYj/UEPcbhl6fC6/F1FJbAIe0ic5LZjy/+Qw75YEvlmLUzk6nZ8Z7zauuTKOht7XMkvRmOO
	KCufsPBHUtW5aV3UVlimimReH3Y2PUwkmqA07031COGbXV0o/ZTIubAgYsZ1NJD4GJmaYFwinY+
	V6bG2BGRY5JAO2z0GqGNw3SNeRFlzyTn9fzkEqaHfNs5kT0m6o2e+MmDD2AYLc/Q0Qfe9dlb3LT
	A6
X-Received: by 2002:a05:7301:3f09:b0:30a:e52f:9bcf with SMTP id 5a478bee46e88-30c06e2e675mr12844078eec.10.1782198071896;
        Tue, 23 Jun 2026 00:01:11 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bdffa83sm18003870eec.23.2026.06.23.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:01:11 -0700 (PDT)
Date: Tue, 23 Jun 2026 00:01:08 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Charles Mirabile <cmirabil@redhat.com>
Subject: Re: [PATCH v4 5/8] riscv/runtime-const: Introduce
 runtime_const_mask_32()
Message-ID: <ajovNDH2uo6V4NJx@blinky>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
 <20260430094730.31624-6-kprateek.nayak@amd.com>
 <178219229643.10927.7189200920480581019.b4-review@b4>
 <ff9678fb-4cca-4849-8ffb-7cb76db60e1a@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff9678fb-4cca-4849-8ffb-7cb76db60e1a@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_000112_935621_176C0AAE 
X-CRM114-Status: GOOD (  29.60  )
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

On Tue, Jun 23, 2026 at 11:43:39AM +0530, K Prateek Nayak wrote:
> Hello Charlie,
> 
> On 6/23/2026 10:54 AM, Charlie Jenkins wrote:
> > On Thu, 30 Apr 2026 09:47:27 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> >> Futex hash computation requires a mask operation with read-only after
> >> init data that will be converted to a runtime constant in the subsequent
> >> commit.
> >>
> >> Introduce runtime_const_mask_32 to further optimize the mask operation
> >> in the futex hash computation hot path. GCC generates a:
> >>
> >>   lui   a0, 0x12346       # upper; +0x800 then >>12 for correct rounding
> >>   addi  a0, a0, 0x678     # lower 12 bits
> >>   and   a1, a1, a0        # a1 = a1 & a0
> >>
> >> pattern to tackle arbitrary 32-bit masks and the same was also suggested
> >> by Claude which is implemented here. The final (__ret & val) operation
> >> is intentionally placed outside of asm block to allow compilers to
> >> further optimize it if possible.
> > 
> > If the mask fits in 12 bits, we can nop the lui and the addi and just
> > patch an "andi" instruction with the 12 bits of the mask. We already do
> > this with the lui+addi block and nop the lui if val fits in 12 bits. I
> > would be happy to help draft that optimization.
> > 
> > But I think the better solution would be to take the power of 2
> > assumption since that will also benefit arm. We should still only emit
> > an andi if val fits in 12 bits, but if it doesn't we can patch in
> > shifts:
> > 
> > slli    a0,a0,x
> > srli    a0,a0,x
> > 
> > Where x is the constant (arch_size - _futex_shift - 1)
> 
> I can do that for the next version and use ubfx for ARM. I can just put
> in a BUG_ON() at the arch/ specific __runtime_fixup_mask() and if a
> new use case arises which hits that, we can perhaps move on the dynamic
> nop patching scheme that you mentioned earlier.
> 
> Let me know if that works and I can pivot to that scheme in v5 and send
> it out post -rc1 after some testing.

That sounds like a great plan :)

- Charlie

> 
> -- 
> Thanks and Regards,
> Prateek
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
