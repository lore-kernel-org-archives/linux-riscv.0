Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF02CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 17:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMQjFte1JhC+EHHId2ap2iYoF0LiKrNMRqXn2mkDaa4=; b=0QkEFQ4R+GDdOu
	88b47NitveK21rALXjB8qNHau12Rczo1+CJwifHf7PWoqH4AkryWKHdITD8BP+zsW7ZY0SCLEC/2n
	mEV87BHX+lBJLyQug+53U+phthAEPI7ObG+6vhpJYbm3Cyls3QyyXwFarkVLJPCnyJHI3S6EZQsBa
	ubaDDJVleGE9Ww5nTRWN/MqXu+eK+w6eOYh7CrsAUnMpzqib98yVoGTSpCvMe0fqDtgDkyjrKoeGx
	Nb5q+51WtaM9T4KDK2qX1S5s7sCN+qYcvvszV7aqFinKImdDrLF5rx+hwTsKJZlctQjRfqMxFplA8
	lqsGSHxbzPDg1mSWmDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbsS-00000004Dlh-1yvv;
	Tue, 29 Sep 2026 17:44:28 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbsP-00000004Dkx-2nng
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 17:44:27 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso24600945e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 10:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703864; x=1791308664; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=;
        b=oLXJSKDC4O6iHyT8nZl71L+iyIbQkaGxOdIFZe+mto/VuLLK64j5xF1uOfivQ0hSzH
         t0UNfktoSpVq8pKmzixgeUuNBebDSwTHrgeCJfnZ1Vv9c5In+MnQXbQ2AGicE3CbBz1U
         k+Q47zUbXnlytQSo2OJRZ0r+Ef6Au3dV+fWuTOmnMyiujvcJbvSY2vSDodWBah3uZCSe
         2gEVa31nXfe9R5kU0JEENzR/gaFB3amLik0OHRGl+5YIAF1SkHzGGAtaw4Wt5CVcCapf
         6RWg7KQU22GPBgs8WQBw0tEZPZ7byS+cXkd6xaryLaJCkjAJqa8qui+7I51OzZ0jWIRD
         VzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703864; x=1791308664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k31zVVbNicpwi9YDlhFvR6Wyco71XCVxmV3/xYq3pxI=;
        b=PjmjBNtdzw+7usUYTjZyzx7wKJauVfQGodawYx2rYyhxfTI0WAavxCUFoOK5zWaUoA
         DX0H8MN2cUyTeZaQ9rElDa+vCNDZJHTNfGHcR0I3lmdjjkyFwJ1Ugmti06Wy09BsuxN1
         VD9eYyU1lCcztiup6Lsd6f4BxpuvjJSkOxiHStJBZc7OxqTfYWa1QjtTFavWYVkczRVH
         zLrxaMCjUU3za6enm8JV239LE6DzEnthGS2gDddl1Qu/rdNuH5L+u8Ya2djmpz+AbL6k
         8aRgXrG78t27GsPukn89IUeCdrMyObideV2R9Qp3k72ySASHv5max5KmZ4wL/r6XCM4K
         X2OA==
X-Forwarded-Encrypted: i=1; AKwUvBwsFmLMu9Fa9HhgVV7JkYZCre/B24/ah5JudjvVS9Ll3EWxqSSI7DsAomDBKgcWFwP5r0PDjDKo0HCYhA==@lists.infradead.org
X-Gm-Message-State: AFuF++nVTDr2oF2mZlbk4jgyfME7OWsl7lw8CfeJXMokL1QQLPJ+OoeV
	LEIWvhyVmeIMVZVaHnNGrAugvVTqGSsnUMZ3qydgrqRbivFhJFEfUzks
X-Gm-Gg: AYBFou1PUBL9AD4Wm+ZFsvJ3JEVFT9mWBKQScp0Njjbl1AYJ70IXw0cTQh0qW61f+uU
	TmqfvIFVPGjzQdaKPCeXNV7N4prRd1/aSA068YXPC2A5y46N3K729k4m1a12Zw3OuHXZHu2tevO
	dbEO/sJPSbXEGL6V81faY4GNgp7RV97O2X1Px5NO7qg3cE33sxv94PwPMona0tf6yMQ+ks4ivza
	fEr2kM1jjWwYL2EQQfDMj4kjYCMZ58VlJd5/oZr+tQeD4FCy+hkm5CEBPU886+uoRgL0OjHsezI
	OFMu2MdKzB77NCR0UvK3sNI4xfVF3DEmArjeW24dwGw1sKkiMvzuIoTyzePJ/NerwMLpyZoviE7
	cpMrx+R6UaFTWGfM69KyC1ylf4RUP8Ej+ZGxC7NhfPFypFPXUicjJkYdtIcB0uKIpHUT4u+JocP
	4oVL4vo0RX4EyXbeAqa68cVv0l5E7CuVTu3h1qtVcWdBZlGNq/bwPB89DjUZ0kLsyvY2EYd9V4F
	IF9VIBbe9uGqERWuD1S4PzJxiuRr1YGxV4=
X-Received: by 2002:a05:600c:4e12:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fe66b6e0emr305056015e9.14.1790703863276;
        Tue, 29 Sep 2026 10:44:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfae123sm103285395e9.13.2026.09.29.10.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:44:22 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:44:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Andreas Schwab
 <schwab@linux-m68k.org>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
Message-ID: <20260929184415.1920fe91@pumpkin>
In-Reply-To: <20260929165939.GA1890629@ax162>
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
	<87zex4ic68.fsf@linux-m68k.org>
	<20260926121927.GA1486962@ax162>
	<are7cfMIHZZn6jLz@zx2c4.com>
	<20260927080225.37534e7c@pumpkin>
	<20260929165939.GA1890629@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_104425_725519_03544C7E 
X-CRM114-Status: GOOD (  21.78  )
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

On Tue, 29 Sep 2026 18:59:39 +0200
Nathan Chancellor <nathan@kernel.org> wrote:

> On Sun, Sep 27, 2026 at 08:02:25AM +0100, David Laight wrote:
> > On Sat, 26 Sep 2026 14:32:49 +0200
> > "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:  
> > > Do we even need to return a value at all? Might as well just make the
> > > function two lines:
> > > 
> > > +       for (char *d = dst; size--;)
> > > +               *d++ = value;  
> > 
> > Wouldn't it be better to add a barrier() or similar in there to
> > stop the compiler playing unwanted games>  
> 
> Wouldn't that just result in the same code generation issue that Jason
> pointed out on my v1?
> 
>   https://lore.kernel.org/aquyVkdYceiWdckX@zx2c4.com/

I missed that one going past....
You only get 'rep stosq' because the compiler first converts it to memset(). 

> Maybe that doesn't matter because modern compilers have better options?

A lot of cpu will run the 'rep stosq' very slowly (it has a big fixed cost).

At a guess the loop is 3 clocks (possibly 2; but that usually needs
you to use negative offsets from the end - and gcc doesn't like that).
That is comparable to a mispredicted branch (and you might get two of them).
It still might actually be faster than the 'rep stosq' version!

I suspect the fastest code is to unroll the loop.
	xor %eax, %eax
	movl %eax, 12(%rbx)
	movq %rax, 16(%rbx)
	movq %rax, 24(%rbx)
	movq %rax, 32(%rbx)
	movq %rax, 40(%rbx)
	movq %rax, 48(%rbx)
	movq %rax, 56(%rbx)
8 clocks on old cpu, 4 on newer ones.
But more likely to be limited be I-cache reads.

If you are going to use 'rep stos' then you might as well write
13 32bit words.

David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
