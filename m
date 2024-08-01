Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636DCC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xk8BXCfqjW3PAplapzXjLG4ZW4lbVXV4qallwd5bIQ4=; b=KfcuPmWNtSikvi
	n67JvYfB0W7BrlQo8gIOZtMkEm8VfqNqkQFsMYlCZ0IqKzv3eN+OskbeFYAl1ELwft9POQdFG7G8o
	6YHuDjgiVXMSAT/pR9KHjybGBcYlxPBq12omYLe/Z6aVj0qFjLx7mTPxWFRXC5j+a9pkmCrq/pm5C
	fOXNRO2E1BjxUJJqdzwe1By6Gt3iW6kkTnvyuNzbKBwb20I7zXJifQHTTatR1zOpVimHoY+atBvKE
	ea1DCXqzIFwp1mEsHAdlTTrhqt5L6kLvmrmyY0kWOEBSqIzKfQnTwgsWquwPEG7KQA5tleA66icyF
	E/YECSYqITzKqz7V2yUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSq0-00000004iUg-1eb9;
	Thu, 01 Aug 2024 10:15:12 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSpx-00000004iTu-4BCE
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 10:15:11 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso609549266b.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 03:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722507308; x=1723112108; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWBquabnZ6kcEWp0IKOcbEM+16+nIy0kpShVIFZJXnM=;
        b=SkTotlepEaeSw3kkz0z+5/RDOwy6X4IpWaPnDUsSr83qavv4JjPlIC9rhXPfNPxxUk
         MclgsV8rvI2OId77IsUXAIz2wlXZTeR+ZRTq02aNp/6jjvgd43vPBGHi37gjNwmf2s8a
         1gbgstenuvDHkWRdKBHHW2M1eT+eJ9JDfJkmV5B2R+P23NWmN4lbiAIaaZP2awLHd5Lq
         nYjULb60kajkpD8WwZpX+BrSCp03QlVIbeUAo6KQY5IZeC19Y0kN1C8t5zFza+nPBbT3
         2ci+ehJLfaOuqrcMW0onpbdEKkh/U07XpQH51r9nhB0hvjGB3/osGSpIHuKwIkC2ssRS
         /5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722507308; x=1723112108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWBquabnZ6kcEWp0IKOcbEM+16+nIy0kpShVIFZJXnM=;
        b=XQNHIntbzJO/UddwZa4zEC8tSHEM9nCNbLMBDhOeamfSwSheGmnqRlkz08q5MOwme1
         V8i4OKWNyxMrXxIvs3ZiswBvipTyfH25g1WVonwHuT10xe85HCLi+Xv3Sg2xsAQX247d
         JhZsgUyHfN4GWmHaGg7Zb4oIk2NHr7dS5dUpNnJIqR47BuCWSTGI7noFoyzfmid1fTH0
         cS+z8M/90UTnRs7ROb9nsBsyUTpgJ+1IdCZu5LXgpw9HKwZ9yW0A1FCdTrNfHaepdnOb
         t1m/rZ1IcpD7PmgSs9PRswtJRn/ayev30l30VoLlCMDv0X3/BmnHhqhGoZuMaHiz0cyS
         vEeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUfXLNUMxhbQ8Kgxvne5RPrBeoBoRKKeAVnI5B1Q7mP/YPLKnh251waZV7ZLWqzUM3jPj9ePuolCniRY+n+g4Uyk5clj9NhLbUChv31gn2
X-Gm-Message-State: AOJu0YxovyxfW27wjpeC4KWWYkgGyrmXFFkLN2FcnoPgD3MAoSfY3KUM
	+nqa2d8ufVXF1LKdUzhaqDcJCdvCm+BRCvNZXgZ+t17bZl6UXepeUaGwmMXfusw=
X-Google-Smtp-Source: AGHT+IEeTCuavVhswNVgEm2olLofx/pt8cE9Bumon3z0afUonWZ842xMiwTVqZcy8FZzQmEJxlyJMw==
X-Received: by 2002:a17:907:7da0:b0:a7a:8876:4429 with SMTP id a640c23a62f3a-a7daf65d495mr148745866b.45.1722507307311;
        Thu, 01 Aug 2024 03:15:07 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad4348bsm875471766b.118.2024.08.01.03.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 03:15:06 -0700 (PDT)
Date: Thu, 1 Aug 2024 12:15:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 13/13] riscv: Add qspinlock support
Message-ID: <20240801-e773d3752fe8b5484405d404@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-14-alexghiti@rivosinc.com>
 <20240731-ce25dcdc5ce9ccc6c82912c0@orel>
 <CAHVXubhQefQ6i3Vow_p-uSACQyPcMJNC2UwB99xt_=jDtRUDFw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubhQefQ6i3Vow_p-uSACQyPcMJNC2UwB99xt_=jDtRUDFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_031510_065302_445FB252 
X-CRM114-Status: GOOD (  19.72  )
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

On Thu, Aug 01, 2024 at 10:43:03AM GMT, Alexandre Ghiti wrote:
...
> > > diff --git a/include/asm-generic/qspinlock.h b/include/asm-generic/qspinlock.h
> > > index 0655aa5b57b2..bf47cca2c375 100644
> > > --- a/include/asm-generic/qspinlock.h
> > > +++ b/include/asm-generic/qspinlock.h
> > > @@ -136,6 +136,7 @@ static __always_inline bool virt_spin_lock(struct qspinlock *lock)
> > >  }
> > >  #endif
> > >
> > > +#ifndef __no_arch_spinlock_redefine
> >
> > I'm not sure what's better/worse, but instead of inventing this
> > __no_arch_spinlock_redefine thing we could just name all the functions
> > something like __arch_spin* and then add defines for both to asm/spinlock.h,
> > i.e.
> >
> > #define queued_spin_lock(l) __arch_spin_lock(l)
> > ...
> >
> > #define ticket_spin_lock(l) __arch_spin_lock(l)
> > ...
> 
> __arch_spin_lock() would use queued_spin_lock() so that would make an
> "infinite recursive definition" right? And that would override the
> "real" queued_spin_lock() implementation too.
> 
> But maybe I missed something!
>

It depends on where the definition is done. It should work if the
preprocessor expands the implementation of __arch_spin_* before
evaluating the #define of queued_spin_*. IOW, we just need to put
the defines after the static inline constructions.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
