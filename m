Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540B6C27C43
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 23:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzRLzkvgx4Nvn4Ke86KGZ5m6GgeWQVPne9w0q4iEYpM=; b=hJuAabvT9qNsz1
	Q+kcIXIJ4KBSWac84APBkLGPkh6QIUd628glpTAIGxpw7ILtUM8bBNqU9pYiQxYfxUttleVTKeMvn
	83lakPkWk/qV29p4M0vPg4ud8cvWwdDBiTV2nwnDxLFLxI5uNkfGyjQnqyAKbwq7A12VaICFSIbb4
	IVfxF+0aCmxHIGmi79vWaaEXqVVuj0Tz0LwZ2d2wcPVeQpsqQWc09y4qrcbnbdu8c8qGV6Ky+l3nI
	NWU7jt+a+LI8iqwGffisFZMdU9iEhqp1vQv5mWFR0BnlgZbW6Y7ttVAlTFKDFF7JOsmDoF0SzDpv/
	dtjaP3DbC4Y81EPixMXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC6eH-00000002LxU-3evj;
	Tue, 28 May 2024 23:54:33 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC6eD-00000002Lvm-1huy
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 23:54:31 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-57a034697fbso241025a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 16:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716940466; x=1717545266; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e000vksGZKxcpTxpZnBmsIz0xFc2hPH9avlD+baB/tQ=;
        b=GdTJbwSe6JBLO9nnEQDDt88mR/2glFfBfqSnpifb0TPojYsYyxqnqbzWqOiWRhzVZc
         CqqYTzO4qGBG2XTFOUCwi48ML5bIoEzmB/p6N3R57w2koWLfD039BgHTSOkFuriEAPNO
         OzjXeht5dSwFmur8kh2kgJVqPz9nCFjspkJbgwg385+OX0GuuHGUtaL1rTW05pywimJg
         2Qj0r+fiTJDcUM9NrREJLZQw9NOUx3T6fCrwC91hTqygCisi8OH0bCgu2lVhO9Uts3SR
         oQh5nIWR2LCxEEoc/VnDtVP0BU7/j6eptLR+tyiPTjOW7KE2VzWfb/JMERaSaXYk5eC8
         yGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716940466; x=1717545266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e000vksGZKxcpTxpZnBmsIz0xFc2hPH9avlD+baB/tQ=;
        b=TJza+BFDNpgfLCxAuU0vZbZoUa+bHhPJ0JMULpm9Vh8Jy+8sYO13U0JrkNgx08Dzhk
         N5bsiA1TIeZOTOOKQnhkNnZOovKFgKtuPuPS0/qALHZKcDS+YKeU/+110DZ7U5m/tnH2
         /5qNHaVGos2DBz984nQqlNclN6qyuOSpY6izEi0e5MH0c62QhgRg16OxkBAlc7jG6ySg
         GNMRg/BbvsT+DPWSiyNXbFNxxtDK/xHT/D9EGI/FlZMwKi/oPIv2EOWpCUMfp2syLn3F
         NTeOZ1Nq7BGMWhAE1hMRZdJvWBOFG8PuYEufM54dkRLrK4bMOISjY/kahvKnh3Vv7Bx3
         U7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQ0C5M8UP5o6uuX7/bxx2uLJJK4qLqr/LZRLdCjS8xvLvxJW3WbcpdaifhxJguDpDfR3LHPZC8zjGQWlkuG535BMwNS1Lq4/qjkie2LsHy
X-Gm-Message-State: AOJu0YziiK5B/l1W9vt3exnCUS4BkCsh7ZILtxI3tHjp8wi8Nm+yplMV
	xKP4IDQzsO1fkWxeHFZMJclEsZRJqueGAV6cnFBxOxBznbGQvRIr
X-Google-Smtp-Source: AGHT+IHsWsOkBOksuCIUt51kqHsxAps4Tg6mOyc5noJl3q1Tf55mM9iZjLhMWu87KAeA5fz6kMcg+w==
X-Received: by 2002:a50:9b12:0:b0:572:67d9:3400 with SMTP id 4fb4d7f45d1cf-578519ba232mr8723411a12.39.1716940466319;
        Tue, 28 May 2024 16:54:26 -0700 (PDT)
Received: from andrea ([151.76.32.59])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57852339fc4sm7658198a12.15.2024.05.28.16.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 16:54:25 -0700 (PDT)
Date: Wed, 29 May 2024 01:54:21 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 2/7] riscv: Implement cmpxchg8/16() using Zabha
Message-ID: <ZlZurXUUUfXHZJaX@andrea>
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240528151052.313031-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_165429_487742_B8EE4F6C 
X-CRM114-Status: UNSURE (   7.67  )
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

> +zabha:									\
> +	__asm__ __volatile__ (						\
> +		prepend							\
> +		"	amocas" cas_sfx " %0, %z2, %1\n"		\
> +		append							\
> +		: "+&r" (r), "+A" (*(p))				\
> +		: "rJ" (n)						\
> +		: "memory");						\

Couldn't a platform have Zabha but not have Zacas?  I don't see how this
asm goto could work in such case, what am I missing?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
