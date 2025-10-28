Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1418CCF9E0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMNFXi+GNETjm8FEOleKMTOH3iOsvLPHCyInboEcMcA=; b=e5p2mmTQ6sWSqZ
	plQYBc89hPEYuIPNGOhCAb/0vRrktGOzeyywM5+UjmF5nnyXBl2zmSYpKBX3380XJJw6vg0MfmvMA
	glbbADxkEN/oEGKHkeSEs2Rx8ddrEQPTBbG2euxPniXK3znnZZJEU1qUfRprNUQTWlAALsIIf2q1A
	wMhW3goCSXrahJu83d0oY4Yzjol3c1WpkT1cAyGtGKoDZ/4NsEK8UK47MZrxCiGHAAJEakmsnlVgL
	5BeyeQrLLLAXSFk73REVio9x/DjvxMYdcal5RQ4qMcntJ0ShtKxrAK+3XAEGQsA4CjD6uwDqN6yhG
	MWj4IjZrKcT/nmvF9/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmKe-0000000GI3D-1lAt;
	Tue, 28 Oct 2025 16:14:00 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmKa-0000000GI0s-17Yd
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 16:13:57 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b5c18993b73so1071688866b.0
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 09:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761668034; x=1762272834; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/7vxW2qYHkfek8BcuNGNfNSQ19bugBoHjwa49fBWcYE=;
        b=MRrXja3yB4nFMA8kZ0lYWfCn7jRG+slqoJOrx5LMNdYEvcIrN+cAcb+1GDzMIieMgv
         Ao/1zdL3idDUzzSeNz9rWm3rS+XJp0HU9bg9jugysnq3nIDbWZRbvfITHhRaOJfpmVGG
         w9eDWwRnX76LLz/JyoIlN9ixg92BSIbAdYCSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761668034; x=1762272834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7vxW2qYHkfek8BcuNGNfNSQ19bugBoHjwa49fBWcYE=;
        b=Aw2IxzXK40D6KTXQixebeOXBIWex06GgoYIMAmry/KOKN5IkcYcphNkcCtb8wG5tek
         JeKcWAHZRH+/cPv7e4+FyfVuH5shRflrMohV14WpeOO0816lSP/tbV6MBIMzo39MnxxA
         A6Gc2Bq4tqzwGuJjSqfEAVEY1kPTutFVE5yrBnyTSqxfxltnd3geuDP716YNzKokWU3X
         escjxgTGUbeEz34GiMfovBUl1fiVFWwIENdufeZcMze1hROmJE5UiS3lwf5kvgeGVrcg
         9gtInKIMMnJFA+JgtahaDf69CnXfmdJLmNo3TKjQKqLuBKtLNJuGHmvi5US/BAeE5VyK
         F36g==
X-Forwarded-Encrypted: i=1; AJvYcCWFNpjWWlY0RQ2Ywpx4PezjtT6xdZPAwI8ssRmfP89BBCUJGTi7s1Sld6lbbBM3M8pXkV1OY3O6Wk6sEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSSA61kr41lShL+3WDFBSu0JU2uU5+RX6L/0Uld457oFLVrSR4
	OHw1u0R0OAMMxRdvU0dwZagfNyrCe/JhFHPQLQlifGla4c0bwusQdnaIkQqUdFvv7dCvaeOHHHW
	SSnxXpa8=
X-Gm-Gg: ASbGnctBQ2gUjrJV16a8iqHbOpaCy8POdhu3g+T5Fyn+ByUnBGTAXknXrzObKvDbU1L
	UpZ5GQmdz3bnBhmeVHmxjgmkXSE57mY7kJiNNvJt7xtuP6fN+/WsQ5NrYgo7Yz8M9YjFuYS23re
	4gTyD+VyoKgkD27TwJVbf7ZPBFrxqJ4YxWYHDdEo5Z7DT96Ymlwz57F0hXcPB+vMsuoVp1I88Z2
	SGKi3i3NWnlsZE1XNtdggvwqM+9gOuH/Pc7wgrNojI82jKRPdwo4AArZ20vQg0O9wpt5gbjdEhY
	Gh/mAJE5jh2RXxCwi1q7vYX96pZ44BCEP1Md4XOHaY3G1nfWDDEChqf2Vvmo03WF7AiqiWHgrrp
	8e6Ijxv8iGPlDwaoBnO5oMEG839NpA0HAIuVheZyipsdR/uJgM+b1TUFotWeS/RO4BaSNB2QVkK
	Ti8Ef0Cp5Xauc556QcNjsroR4C3XKXDbFEFgaG51MneM9Ly8VRvQ==
X-Google-Smtp-Source: AGHT+IHv+Rf8uNd1ATU9kVZX/i/4k06drU4L0tPn3RNNS0Qd4SKUTWpSGy+HxerGrsblCmogbVIUSg==
X-Received: by 2002:a17:907:980e:b0:b55:e023:5e79 with SMTP id a640c23a62f3a-b6dba5e02bcmr404907566b.51.1761668033652;
        Tue, 28 Oct 2025 09:13:53 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853eeea7sm1140694566b.47.2025.10.28.09.13.53
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 09:13:53 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so11642581a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 09:13:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrZtZ50W1NoKK0UFPY7lnTtN4Gzq518EBFH/7TfK/YBvJBgl4PrzXqAjnU6P6Y38BY4hkyGtAy0/Nfxg==@lists.infradead.org
X-Received: by 2002:a05:6402:358a:b0:63c:4d42:993f with SMTP id
 4fb4d7f45d1cf-63ed826ace7mr3748960a12.3.1761668033009; Tue, 28 Oct 2025
 09:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251027083700.573016505@linutronix.de> <20251027083745.736737934@linutronix.de>
 <0c979fe0-ee55-48be-bd0f-9bff71b88a1d@efficios.com> <87frb3uijw.ffs@tglx>
In-Reply-To: <87frb3uijw.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 28 Oct 2025 09:13:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjZ39CSZwN3W6n5kSAqL-OhJghygh3-dRsrJKpOa9nTwg@mail.gmail.com>
X-Gm-Features: AWmQ_bkZ4DVtg-fqS9oPLAcmx2bmXbpg5s6Qki9Q4422mgDG3jAT_1tXHLLXals
Message-ID: <CAHk-=wjZ39CSZwN3W6n5kSAqL-OhJghygh3-dRsrJKpOa9nTwg@mail.gmail.com>
Subject: Re: [patch V5 10/12] futex: Convert to get/put_user_inline()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Heiko Carstens <hca@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_091356_347540_BBDBC296 
X-CRM114-Status: GOOD (  13.42  )
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

On Tue, 28 Oct 2025 at 08:56, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> There was not justification for the open coded inline either and
> converting it to get/put must be a completely seperate change.

Actually, there's some justification in the original: see commit
43a43faf5376 ("futex: improve user space accesses") which talks about
the original impetus for it all: avoiding the very expensive barrier
in __get_user(), and how __get_user() itself couldn't be fixed.

So then it was converted to the modern user access helpers - including
address masking - and the inlining was mostly incidental to that, but
the commit message does point out that it actually makes the address
generation a bit cleaner in addition to avoiding the function call.

But I doubt that the extra instructions are all that noticeable.

That said - this code *is* in a very hot path on some loads, so it is
entirely possible that the inlining here is noticeable. I$ patterns in
particular can be a real thing.

(There was an additional issue of just making those user accesses -
get, put and cmpxchg - look a bit more similar)

           Linus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
