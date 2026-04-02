Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A9BCC6B35
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XiHii9Ybck2uSvdavJ/g38l28V3gp1qvWw68SfOb/yA=; b=fd3XQPDOoYsiYW
	LGjRlvx3jNlsiReRIiDiXQI6+XFZwBqyJO+HHwDjajtp98VbLpJfbx5mSu4YRRGPhXaNebek1I6iX
	DExSLZ5l20IOrkOLc+UKLtV7pgLCHmUXqfvRfjAt1IJm004Q1CNlOYgIjoBFyzs4J5/++42Q1ARQu
	mNJg/iPLW0Ze3iU8GpabmUAq8OtDhAr8JG1+5Gb0nzhTaHI+IqPgOoqBIz8Zdtf0kA6zPA7Kk2qBE
	HmKJW4+32w+MKPj2w3tjTq94RhDflhuCH811g8F9e+k9M13YkRHMOkAXBJWM86Ate2xGfcdxiOeZI
	mXqGBJy29b9G6MV1kUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DsN-0000000HDU4-1HjG;
	Thu, 02 Apr 2026 08:58:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DsM-0000000HDTv-0jkE
	for linux-riscv@bombadil.infradead.org;
	Thu, 02 Apr 2026 08:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LnQTQFMkaspyfTBlP7NJBNzFuL146lWNPT7LvqeL2XU=; b=jfd3rcbb1Layc7/jXfyEGQflnB
	ACQ1z3fjDNjjwW03THjpdEXzhkg52mN7QQqaZNUjgfduqnSNC/UrkacFqJOtwxez7Ab96IhEohYjf
	B0BKH22uXtngd1boXxUwFHH9h3DyV+PasPjdrVfHsc2suIkrGz2QMfPMF7OA/8AuZPZo5/NHfg2aw
	UPaZIxfnxmG2iN+MoM/nW/tocV1PKMc6VPY9+PMT08hP606hQVF2RmD7FmmRQCHMo/8oYrHS4ruv9
	UXSH9qvNwvR038huDLKh7cHPxfEz87UZqJ0U448T0gxVDUQ1Vxfg/oPGw+LAxr1U4K8udSnyZLeB+
	flUYF0zA==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ds8-000000024V7-0qUA
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 08:58:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso5220095e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 01:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775120270; x=1775725070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnQTQFMkaspyfTBlP7NJBNzFuL146lWNPT7LvqeL2XU=;
        b=nc+iquM/NgxY2f2+whZGx2BqnoFNpCCgF4Z9oqFCaxoRX7m4RuafI685+rou8v7EO/
         Eiv7BcmfIjmTGmEQEyrWJsaEK2PDq8eGnR+WV+wOiDc2q4GG6GzeSNYDmSZHJPG7j437
         /+jMZGAWkAFoxAMmLyiK26oATqRqisfBHmPcsSbyn9TU9DX4Iup3IHX/0eJneIhY88Mo
         5sOUGvgQFKbizHjqVa/AKPWHKHwXynKOKR7qunxbSoq04XTrTJQuZ5qqKJLUPphHcxxC
         vDihPiLa8kLX/cNrk7JLwQv1bZPCJzEs/Bicx3NXQaZq2YZv98/ian4PcJ9JKu9Qe2oh
         TYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775120270; x=1775725070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LnQTQFMkaspyfTBlP7NJBNzFuL146lWNPT7LvqeL2XU=;
        b=KmmQ1cJttfcjtkecQNphmgMEXDq15jISSc3QnWoTMuwYOu1DtXANJpXf6Aac0iRFcQ
         ZcKMzJGH6MLPH3kmLSaAjHfOYATKfIOJ979+ISklbPAEZPsLvOutEHvpRZ2Uw6a7hOf7
         8ZJVotNqgOI8bxxBaFQUmsGoznUaTj/kRAgsHS2PVmR0sZqB7QVNk5SjXu9pLiTD9LQH
         ehgYRW8AI0DuM3lJtcSPiUhKoscXXi0XCKHOQTFJXF2vWGJZQPjGEQHESvuvcgzM9qg+
         GUH3SItuLtduoDDVr+o7f1H5WPVyKuuSIL0TWRIvY02q16jd0MRsq4WqFYiU9afNvmNx
         6aeg==
X-Forwarded-Encrypted: i=1; AJvYcCX3bzZG4pyUmLxfrx5P88s6A1C2CWsvhi2hKna48Qcp1mE/71zc1t5fRLe2zfKow4mmB3g6NeoZYOU4bA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZtKJyvoXVg+mzCkjLdxXc5SRnRXWNUyx063KndAytdvP4HTE/
	Vx88urOJLkw6c36Gjoind60oIvat+p2VoFmR+ZAUVVNVJI/mlf8TwwwF
X-Gm-Gg: ATEYQzyXWyWrPgpsxkVShv7rYAb1ja5S6yKfJK7ZxFIo00OzIAIlZVAWJ2DVBgdHMwm
	W1pcpoV1jwyfk4GMtyedu7X1zSh2hrqLOVhKBuMsBevrRwMqxok8yw9ta4O6vtP3VB1Bl42JCs1
	ikaLrj12j5IomRoOoJ1lXchnV4XyP5rMaxF4QQb9UkgxmJKuswlrj4o8P22l2adusbeWsfKstUX
	vsTadKxwL0oY5JKlzOntd7qHQy2EeLXemjpU9dAgjYH/ENegB5XznupQnrkAl6z6ZVdzxZdNcsv
	dvLlJhWZEyAj5GW8m86d50G6puBDSeOg3zLqHKXn8coR85VRAjhgx1lLuD0WHsKoZ/E/bHg3hoZ
	Vto4Xfs/+dVb+kA2KgXBy+oQZcFbZWu/Xv+ULcPXKUK504QxcTvtkaxI2L7sBjofilWVX9/g+pR
	g1rHfTMAtjtU7XvwRvslUU2cECmrU/LBRjiZVBrhUCr1kPMgQVqKlp+1n9gBlL
X-Received: by 2002:a05:600c:630f:b0:487:288:1198 with SMTP id 5b1f17b1804b1-4888359da58mr102555095e9.22.1775120270131;
        Thu, 02 Apr 2026 01:57:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e735532sm217845265e9.0.2026.04.02.01.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:57:49 -0700 (PDT)
Date: Thu, 2 Apr 2026 09:57:47 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner
 <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Brian Cain <bcain@kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Christophe
 Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max
 Filippov <jcmvbkbc@gmail.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, Jakub Kicinski
 <kuba@kernel.org>
Subject: Re: [PATCH] cmpxchg: allow const-qualified old value in cmpxchg()
Message-ID: <20260402095747.6efbd456@pumpkin>
In-Reply-To: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
References: <20260402-cmpxchg-v1-1-4561e2c05d2c@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_095758_815811_92EE4168 
X-CRM114-Status: GOOD (  17.11  )
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

On Thu, 02 Apr 2026 14:56:01 +0800
Hangbin Liu <liuhangbin@gmail.com> wrote:

> The old value passed to cmpxchg() is semantically read-only: it is
> only loaded into a register as a comparand and is never written back.
> However, the macro currently assigns it implicitly to a local variable
> of type __typeof__(*(ptr)), which triggers -Werror=discarded-qualifiers
> when old is a const-qualified pointer and ptr points to a non-const type.
> 
> To avoid this, let's add an explicit cast to __typeof__(*(ptr)) for the
> old local variable in the cmpxchg macros. This explicit cast suppresses
> the -Wdiscarded-qualifiers diagnostic.
> 
> The new value is intentionally left without a cast: new will be stored
> into *ptr, so silently accepting a const-qualified new would allow
> callers to store a pointer-to-const into a non-const location without
> any compiler warning.
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
...
> 
> diff --git a/arch/alpha/include/asm/cmpxchg.h b/arch/alpha/include/asm/cmpxchg.h
> index ae1b96479d0c..b4b8dac759c4 100644
> --- a/arch/alpha/include/asm/cmpxchg.h
> +++ b/arch/alpha/include/asm/cmpxchg.h
> @@ -234,7 +234,7 @@ ____cmpxchg(volatile void *ptr, unsigned long old, unsigned long new,
>  
>  #define arch_cmpxchg_local(ptr, o, n)					\
>  ({									\
> -	__typeof__(*(ptr)) _o_ = (o);					\
> +	__typeof__(*(ptr)) _o_ = (__typeof__(*(ptr)))(o);		\
>  	__typeof__(*(ptr)) _n_ = (n);					\
>  	(__typeof__(*(ptr))) ____cmpxchg((ptr), (unsigned long)_o_,	\
>  					  (unsigned long)_n_,		\

That looks like it loses the check that 'o' has the same type as '*ptr'.
Maybe this works?
	auto _o_ = 1 ? (o) : *(ptr);

  David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
