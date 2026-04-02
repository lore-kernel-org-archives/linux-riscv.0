Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6698AD3941D
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 13:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HufiQe2AWs94/fePWiDhmBMDJ7Ry2Hb1BWJmmChH2sM=; b=DpdkU8vmFcb1ab
	BuSgItSIYkBGHyBRUsFMEnr4fVJSFSkKA5t6nynPhtqMoggBkXZp6pC36SUqEcrdYTsm5BH0cPDG+
	jr50wJmJFWbaJPdSPJdFIgo1i0Aa4ZoDmTyb7nNWy/24WWqHbrMQy7Eg/OsLnV/4aaRYa5zfb5J7P
	5O4DuppATrzeBg/10rKTPYqheZUpuFYUncrx/YwWqCD1jVd6R20LMJ4B4KrpuXTRTPmPU3kQ1nJ80
	QssghHXwB3f1yM48wy0rYQ+UHldIS1hfsTnvdR+9PVq/HGj6fFGvO1/ag5vk5GfSUakRgF7fqTn7z
	tRi2Y8hrHMCSE/eRoLQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HmK-000000008oW-0doj;
	Thu, 02 Apr 2026 13:08:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HmI-000000008o2-1aTC
	for linux-riscv@bombadil.infradead.org;
	Thu, 02 Apr 2026 13:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KWxJTOWQkri5jmv5ZKMT+tNuIWsfKgbRVKTEMtbqloY=; b=CDwX3BtvLfxDq550vF7PnQT12C
	8h642zMmL+uqq4RaqFmnlYW9qZrNtVphWkD948VJSmV5LwVni9tgaFnwA1UTzlgSYqCmWY7WOH7nb
	HBWC39WipUQAm7WZ06Eg0reLpXlxPgM+mnca7uP/h/wYG2QxJkQ5IujS5asojkz8cYJrfhRMcVp3O
	kkl6A5uHm1Cv3jypQDoeQdKjgYtIAFxofWLCrw1ywSvf7vtlqpATJJZA+SJTO6Ta0yOuNq1ufVcVO
	W7+H8/NqUwzepa3qo4nA2mqS6dOD+m2N2p+sJwn3htOkD8H+SUFuIZBYNgfbwgVdamCE4oKJUg0+y
	mOyEpchQ==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8HmF-00000002V8G-2z4o
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 13:08:05 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so535038a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 06:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775135281; x=1775740081; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWxJTOWQkri5jmv5ZKMT+tNuIWsfKgbRVKTEMtbqloY=;
        b=KdCQxl3xZcTvwf/ge78doEjn+mHpzSrYGXSwfJo3ORUsvwJjXTg7UF94Jq1ZycwQnl
         tbCQFYLs0jjul5E35FODm8eIe4FQwXW/cHtDp7r1agwWcpRu/SPQXfpXcr4BaUUt4y80
         MrJo3kLtGHMobWTQiBA9z5n6gyhpMmGbWypdtyMhKxeX+XCK9oFG9wOFqyDCZiIl66b3
         ate5kJOfg21qhWLWENosvZK2Wh0NzXBeeNHLQQvJjZdqZfgA8HRjqjg7bVKd6st5XUEd
         HDKPa5+6VWJ965400bzTL4YaYGL52VMA0ss139/EUKryGu9pKB8gWK7xanP/fiJPYWaG
         SK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135281; x=1775740081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWxJTOWQkri5jmv5ZKMT+tNuIWsfKgbRVKTEMtbqloY=;
        b=q+fFFsx2vaKul7INuCNZqKZ6nuuWfCTcIuV/1Tn1e4JVZoAOrlyRLfYlBO3GrSWcOc
         Iq6rXFkZa/YklE2p2s0f7XH8JLxqH5w1JyEgfdKQi/+rvM08ZCZjAvvTSZ87Cv3DFaij
         Mg7Phkw8fwuJqlpKjOjaPVS2LtJZAwvccudjFg6N3BwLVdtVgGx3nvr7XOgiPwUEh1PT
         TUmzKakFCm9SQNNBxUwZvJrdH9aciBmw+LO6SudxSGlZfuMFP+PnKabATLjSVlFndH+1
         g4tYWlWXRZmBuV2lDgHGJfJKHdF+1HI4wQkJnzJ9zr8Ym3Mjtrmus2xvTl0A4DXODkV8
         EtZA==
X-Forwarded-Encrypted: i=1; AJvYcCWuCOUIBNkhjFdZsYiiPTKbAOiI1ECt3NpPzhOl8CKxBXbMbIh8ft0HwlLVlgvVS1+j9lGSzO1G0djDIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhawFz6UETVxRV4Fh9KRM0kO0ueQksaEXH5kyRgd8ADL3uDc2w
	PNzUbAZcYl/gYS5hd8KcYw1MTIBbeXWQ8FCJGJNICnBL+bnBN3YhnVs5
X-Gm-Gg: AeBDiesMjqNSb7mVFz3GWLmtc2TYe87BRVp60Xm73+F+6vfeMvlVncoxVRg+SyYarFd
	cEzH70AkyghQKnILFV7DWtLTabGdIhO3xuuHF6Zuh+PeXLuC6PaZBTtLb29ZSluSbxpvOauXBqO
	7XM5KvihE7QM2mxh/2jcWEm/6Rc1h/DyqiceMrB1gi4Fsn4VyqWwPpnizQ4c19TznU8b6/Szvoe
	gCk98E74HpW/Mib24zUaFbMZr5I6w5sF+uQ+ap1bY6h8hVrwLVYyml4ANYe3cnVsxen9b2xr0OP
	sg95q5ppftQy9PfXv04j1xozkvvsPGzX+s1sUaJTj2yCM4j+z37Eexhiw+Tl/kqdcQtOzlu2aIr
	QqgbL6qC+foSwpfyEAr/usODYQ0jtqm3fq+BRkHv2UL4DjZKN44onchLEon4OofMQkTJcdzBLdK
	CKs7YyeYEKkBaGOZ64WFW7DNqrK2U=
X-Received: by 2002:a17:90b:4d81:b0:35d:a412:3c79 with SMTP id 98e67ed59e1d1-35dc7079cb6mr6805318a91.30.1775135280985;
        Thu, 02 Apr 2026 06:08:00 -0700 (PDT)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe41b11fsm7822915a91.0.2026.04.02.06.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 06:08:00 -0700 (PDT)
Date: Thu, 2 Apr 2026 13:07:45 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Brian Cain <bcain@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH] cmpxchg: allow const-qualified old value in cmpxchg()
Message-ID: <ac5qIUS5azbWAc9q@fedora>
References: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
 <20260402095747.6efbd456@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260402095747.6efbd456@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_140803_794889_736127FF 
X-CRM114-Status: GOOD (  13.83  )
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

On Thu, Apr 02, 2026 at 09:57:47AM +0100, David Laight wrote:
> > diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
> > index ae1b96479d0c..b4b8dac759c4 100644
> > --- a/arch/alpha/include/asm/cmpxchg.h
> > +++ b/arch/alpha/include/asm/cmpxchg.h
> > @@ -234,7 +234,7 @@ ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
> >  
> >  #define arch_cmpxchg_local(ptr, o, n)					\
> >  ({									\
> > -	__typeof__(*(ptr)) _o_ = (o);					\
> > +	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
> >  	__typeof__(*(ptr)) _n_ = (n);					\
> >  	(__typeof__(*(ptr))) ____cmpxchg((ptr), (unsigned long)_o_,	\
> >  					  (unsigned long)_n_,		\
> 
> That looks like it loses the check that 'o' has the same type as '*ptr'.
> Maybe this works?
> 	auto _o_ = 1 ? (o) : *(ptr);
> 
Oh, I didn't notice this. Thanks for the comment!

Best Regards
Hangbin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
