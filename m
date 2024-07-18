Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA12EC3DA63
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeOyQbGS7FSavNkh0NFx9zgAKBH6X00qf6yB+VXyWbk=; b=yzuNUyg+Ja0mNN
	5luqSpfLvcZsul2C7WH0kpEPdZCNaj6Xbwy8o6jVvASDzPKPXZ++KyggBkIonkFHi6pKQeV0ztEkp
	kZfjEGskivUlwtR/fWB3+ajPIuBZ9nk+qIqxA7H2jrB2+FNVOXil6EtB6Gc+NrTSUz1mp4ecpaK0J
	4VHvCJR9FhlskZPIbPdZcbMsu9Sj0ec0kwC6N5nYnq9MLpE03f0LDRr4ntygFJv4GuTIa8o5Pki4l
	+u6MtPmUo6q1bCfIU/DypJnxiq/GIYZeK4Q0UNI1jmYYGcno1cy4ofR53NLqZjdy0WLYGRjupB/tM
	uhM3JNqdcNVLwInbvVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUTe4-0000000HXKm-0NVV;
	Thu, 18 Jul 2024 16:06:16 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUTe0-0000000HXJu-1x6d
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 16:06:14 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-808a8c90f5bso30099739f.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 09:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721318770; x=1721923570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=viUABkBmfTgkqCa/7vhlbq4p5oq9ftTQ0S5SnBOY0Nk=;
        b=WDmKDGsKfPk+7wOrLL3ZP0j3UdmGkckl0Bfhj6yykgPHWg0Jdz2XPrWVsPYUIBMaV/
         YosEZTGce0qP4Ko8Xq6dY5BXCvT3me183alQEd6lnlSLV4GIkirZJe/HngMGq8/k+Kz3
         tAKSd/MfnD4cBIfcqf954xVdFpZtL/vNavpD5KjsvbPTBx7yNY0xaB7+U8Z1YJdL2/py
         9WBS4nGud2jLTnpIXMrSe+OMWcgKYPK04ICGCBtvYifbibjOniw96S3969gd8c2nmPy6
         eZjEavY2x6V5n4d24DfnwxGbf5MCSeey3KTkx18VHbB9lmey9mVwSwzENnHneq0Um4Bw
         4rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721318770; x=1721923570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viUABkBmfTgkqCa/7vhlbq4p5oq9ftTQ0S5SnBOY0Nk=;
        b=OhPW2MMa527woXNRpKDmQbNU6zsI7y5y164JPXeCnaAAfUuUArnahS10kWmRi/hSGP
         nKTX9Q4xlAxnk7pku9mjz+uj0fszFWW0BtFa68Bn27fXAcAoa0mN1zGWhpLRLIV7ZtP4
         7QEYG8zGyH7x4+FLne4nDqk8wjH6iQNLNcwBNjWGCNPKEIFi+Rxmk6ftM3oeKQQJ14dO
         Y/RHU6FXNEjqrMr2l7PN6OdeXPfoQ0bZ52m/bhozDGJM3Z+CEfwlQzguYXwzP3uNx+hd
         xDjQ2RRYs8NeFlMM3UQpREeetEnecxBvkBhjRIxOf3EfcHUY3ArE/0JZooVRRrypSuOh
         mREA==
X-Forwarded-Encrypted: i=1; AJvYcCVbZgzwDOqFZGoiE86j/M8tQpwBwjfA6vxHsPXgvKqtAqJ17/Foj2XQvnZX/D/CuobxyYgEVlFTCFh+TZXpoCuBhSK++5fOufuDYg6Sxw4j
X-Gm-Message-State: AOJu0YwAo5J1qk7VVl6FxpWP4maqig748WgbYcLMXe1u8HqM/3HtUN3Q
	u1eA41i9xAFpEPZh1RF+4590/By4UMrf4sxzA9HMsz1gDxWnn5/Y+aeRZzb24t4=
X-Google-Smtp-Source: AGHT+IFm1MwbtKKQ42pdLPFRWB3QURVJC7xbjJO/hmp2xPNIG+w6wDszyBZqmIMxtUybkHCFqiqGvQ==
X-Received: by 2002:a05:6e02:1e0e:b0:376:4049:69d2 with SMTP id e9e14a558f8ab-3955542a2f1mr76353275ab.6.1721318769739;
        Thu, 18 Jul 2024 09:06:09 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3950b6ad778sm17393005ab.40.2024.07.18.09.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 09:06:08 -0700 (PDT)
Date: Thu, 18 Jul 2024 11:06:06 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 03/11] riscv: Implement cmpxchg8/16() using Zabha
Message-ID: <20240718-d583846f09bc103b7eab6b4e@orel>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-4-alexghiti@rivosinc.com>
 <20240717-e7104dac172d9f2cbc25d9c6@orel>
 <fb03939b-502b-410a-85f5-2785b2bd0676@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fb03939b-502b-410a-85f5-2785b2bd0676@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_090612_529569_EDDF49C0 
X-CRM114-Status: GOOD (  10.28  )
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

On Thu, Jul 18, 2024 at 02:50:28PM GMT, Alexandre Ghiti wrote:
...
> > > +									\
> > > +		__asm__ __volatile__ (					\
> > > +			prepend						\
> > > +			"	amocas" cas_sfx " %0, %z2, %1\n"	\
> > > +			append						\
> > > +			: "+&r" (r), "+A" (*(p))			\
> > > +			: "rJ" (n)					\
> > > +			: "memory");					\
> > > +		goto end;						\
> > > +	}								\
> > > +									\
> > > +no_zabha_zacas:;							\
> > unnecessary ;
> 
> 
> Actually it is, it fixes a warning encountered on llvm:
> https://lore.kernel.org/linux-riscv/20240528193110.GA2196855@thelio-3990X/

I'm not complaining about the 'end:' label. That one we need ';' because
there's no following statement and labels must be followed by a statement.
But no_zabha_zacas always has following statements.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
