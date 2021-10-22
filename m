Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15C6C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 15:20:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B461E6112D
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 15:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B461E6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/YKHW+ldlHm/fw3Ykp382lf4Oi7AetMb53FAiWguQM=; b=s1JnCwWf8qcUtz
	HNJnx4ThoPbzjriv0Y+WifjMuGxXDJRi0P6QxMt9DJ8+3zCyYvhblChox4PtzQjvzcjt78yceyRwL
	25L0a4FrQNqtXRiDVn5vV9J1AZyb+k9eQTWRNk80GnCyHJFk0Zb7GdZKk9xNoRPuWoMHG54DCMHIF
	vykz/HWhh2YjpL59FoiVLmpACZQY648lhvmDgkwLJp5NDkvOaYKZ5CAR3HSPVTpIl0S52EkbeUHx5
	N8KlHS5L+gwJHzO6AdNTDFLxEbDq72WZXvxHQ9twxX6s9mS7JSzwsmJyjWnbSEPxiK29jHZya50yr
	AinMEKHB+cI2n905A8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdwKo-00BOvO-Gu; Fri, 22 Oct 2021 15:19:54 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdwKl-00BOuM-PJ
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 15:19:53 +0000
Received: by mail-io1-xd31.google.com with SMTP id p142so5903943iod.0
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=edUysRKGfaZOTuM3uYR99rq4ae03o5LqY877IUKK/u4=;
 b=OV9+U6++bii1LgELrCjulmFIWampisMJ86zIok+nNJ7XJXUfILrGKlaXTqwBgRyUTz
 +sxGL4FGIVlFzBSamuiZADhcODjGZ36A8Pwjub6rVMGCeZi0RufSJ2xoa2XpQcJvzEeY
 JpoKvpjMTyHfmCbel/hNNKU5kbM5rEWpLOr7OGYIX3EZccKxgFzm7YR7erBYUMBP/a+j
 FQqxIRh28Zf/ixoUZT/Ivj59Qp2DqfSkIsWUSUmYC157rAVTDfLvk0STBFuiesHFpGgY
 KEKtTn2LZ9o8Cyjvbyuvi7hnIDlVeo1SXRfIp1GbaO9gv81h6dU0Kyu3UVdSZd3u0ja3
 npgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=edUysRKGfaZOTuM3uYR99rq4ae03o5LqY877IUKK/u4=;
 b=Je/qtSS6n8TYaT9VhP/rY9kEXJ6Cr3qu33nmmHzn8BwHo6p7g9kZyDmvv51o3h7irO
 zEh4Q2dsAO1N+DGcLzZ0wTA7TomFHlCpa7HgGYhfNLC4Gs+ibChd2eH33q4CN0OWhu5j
 249NRNqR8qYaOzZmEnxY8qHrFXTtcVFV4Vqbg4T/anorlLxiZI1CrEmhCu2DEvuMffex
 Q+tiVuMnnD5/52PLwIw0clJ0aGvXY+UOAZ0cBddLpqH5GNNMWE37RhEBpN8djjAdx2E5
 m1kLTH5KCSaAqR+azMbf/IVXl+6f+ODmJSfFkplU0TgzUqeU0bMa6J9yNS9DD1v/TabX
 1qsQ==
X-Gm-Message-State: AOAM533Kj0UaEPfS4xM7g/p7TcTNmtcyPcoWAfshaPY3XP2zF8JfOqWp
 Vl6i3Vt34D3fnpY48HJlkgE=
X-Google-Smtp-Source: ABdhPJxSDypiYJInzx4XwEZ8NcgEsqzqv+UUXkXQDiglcxs6zTx7KjuYegOh3MB/AopBCcoAA7HNZA==
X-Received: by 2002:a6b:ea11:: with SMTP id m17mr131844ioc.139.1634915991219; 
 Fri, 22 Oct 2021 08:19:51 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com.
 [66.111.4.228])
 by smtp.gmail.com with ESMTPSA id x5sm4208612ioh.23.2021.10.22.08.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 08:19:50 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailauth.nyi.internal (Postfix) with ESMTP id C689827C005A;
 Fri, 22 Oct 2021 11:19:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 22 Oct 2021 11:19:47 -0400
X-ME-Sender: <xms:ktZyYbo-0xCgktB-G4PseuSbdB9Jt05Z02dF1bg-T14I5YJtc5dPtg>
 <xme:ktZyYVrtulvtNFpxyCy8dPYInOg33GzwqWwpawhv3APnYQ0kJ7fXGAwrA79GATjFO
 T-NQQJrElfJ2mLcOQ>
X-ME-Received: <xmr:ktZyYYNDLtLpl1TuebIf7Qy1jUYxqTn5sUBFe2uZsnZrcscd-oBaDRqJGhaIzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvkedgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepvdelieegudfggeevjefhjeevueevieetjeeikedvgfejfeduheefhffggedv
 geejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
 hoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieeg
 qddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigi
 hmvgdrnhgrmhgv
X-ME-Proxy: <xmx:ktZyYe7cASrg4U0TiKXQ2rge3q3yecqGfi3TysEBZCfj5c-7Wqs94g>
 <xmx:ktZyYa6p9Nrgrcu8gycciaBtDEY3NH6MbMazqxPWS4wM29oD6xuqmQ>
 <xmx:ktZyYWgv7duMbyE0XSyCRF3iOV3Mkymt1G8cC7xw8_rPhUuV5kJVwA>
 <xmx:k9ZyYawABAAee3hR_-tz10XhH4UNTnbP7VaExlTqmEEn6SKe38sCaK1AzFo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Oct 2021 11:19:45 -0400 (EDT)
Date: Fri, 22 Oct 2021 23:19:17 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH] locking: Generic ticket lock
Message-ID: <YXLWdVGl4NP2HBCO@boqun-archlinux>
References: <YXFli3mzMishRpEq@hirez.programming.kicks-ass.net>
 <4de96b16-a146-f82a-a7f2-706dba4f901f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4de96b16-a146-f82a-a7f2-706dba4f901f@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_081951_852528_6ADE0010 
X-CRM114-Status: GOOD (  14.40  )
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

On Thu, Oct 21, 2021 at 02:04:55PM -0400, Waiman Long wrote:
[...]
> > +static __always_inline int ticket_is_contended(arch_spinlock_t *lock)
> > +{
> > +	u32 val = atomic_read(lock);
> > +
> > +	return (__ticket(val) - __owner(val)) > 1;
> Nit: The left side is unsigned, but the right is signed. I think you are
> relying on the implicit signed to unsigned conversion. It may be a bit
> clearer if you use 1U instead.
> > +}
> > +
> > +static __always_inline int ticket_is_locked(arch_spinlock_t *lock)
> > +{
> > +	return __ticket_is_locked(atomic_read(lock));
> > +}
> > +
> > +static __always_inline int ticket_value_unlocked(arch_spinlock_t lock)
> > +{
> > +	return !__ticket_is_locked(lock.counter);
> > +}
> > +
> > +#undef __owner
> > +#undef __ticket
> > +#undef ONE_TICKET
> > +
> > +#define arch_spin_lock(l)		ticket_lock(l)
> > +#define arch_spin_trylock(l)		ticket_trylock(l)
> > +#define arch_spin_unlock(l)		ticket_unlock(l)
> > +#define arch_spin_is_locked(l)		ticket_is_locked(l)
> > +#define arch_spin_is_contended(l)	ticket_is_contended(l)
> > +#define arch_spin_value_unlocked(l)	ticket_value_unlocked(l)
> > +
> > +#endif /* __ASM_GENERIC_TICKET_LOCK_H */
> 
> Other than the nit above, the patch looks good to me.
> 
> Reviewed-by: Waiman Long <longman@redhat.com>
> 

Same here ;-)

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
