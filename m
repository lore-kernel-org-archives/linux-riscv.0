Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F62C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 21:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/75ytcGUaQ2e88TsxBcGLGrzrdcWIsPxSkrtG8x+gdg=; b=pGQI9NITE3TeVUW/0e7s2Vr89v
	xbhfwhypRp6bkiASV0Lb1vj0HR+TTH/RdHn/0wypKvnGJGJwiRDbrCBsio3UAmK3vqzK271iLzd0b
	YDzFIRH3A0sAoQv8TnNEEJVCn6ubeidoI0sR4Fmf8BzngWAkn9IYyB3INKKURWdwnnx6Zbi5fZesI
	OUpsJibT1tnfi+Wur4h3psGtthllx4RNbXs/LHBPF+6lnh+2EovLU19goLtxcOaBukGYKFO1jxkts
	qacfaeAmUTWPbsfipGNnfAwpbQQQR+QsW63dMTnvZBt/ivDl4PCNUrsClXgHT/gmY7vZj3tPkYRL/
	moNn1Meg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVsH-0000000BCZ5-3JKx;
	Fri, 07 Feb 2025 21:26:57 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgVsF-0000000BCYR-1aff
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 21:26:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f55fbb72bso19855365ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 13:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738963614; x=1739568414; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HVmE+Tt35mu4vWqHOKjrmfxx5g5d6DsZZLA0kmOgFzY=;
        b=d53W0ypaVJnE7Xi8TITALxLmdeKboyS7I6ds1It/901O7txy1PrhbMMs52aLwvkLpZ
         Sklxn9v6R75uQRp91eOHQ76zVeVqB0VsCK3OUPB8VwdLLyqGjc280t/lh+iF/Te6aFql
         PEJtlq3WjtFUvnxq/otOgQXHKg7HWEQad3EeKo8DKBYfvlNabHOlKc7q6i6F73C2L3AZ
         EQ/xwR7AVsY5E1sjTC/ZmaazerBpuB1uPKiSB4o2qma0T+HWxcTi823z559xDCL4o+pu
         W0Uz06ZOSZZspuMqgoWhs2s6y86Q9JYDhm8XZpYcukVNJgQcv1u8w0zIfJwJnjFO9HKF
         dj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963614; x=1739568414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HVmE+Tt35mu4vWqHOKjrmfxx5g5d6DsZZLA0kmOgFzY=;
        b=X0AM98Ycd0ewyrW80Qe25MVuRnNHQLRIUlD1GIpN6M4gwfAavRXBGuCGDhFkQse7L8
         njQ8BJ6d6EK3LThS9q0P/MAxTRM/gDLIX8SbF7U1CujYiM98HcN7xsyVOGU9NEx/JBSi
         9OkJkianhfuP+6dESit7wWyIEBtferMZRSjafLVEyrkObBhLvZ5C+0gWxavYcQYjDiNJ
         dsW9IEhxsRbU5kI8A7ycoWg58kprspo2q9zjd4gZcCpMCPjl8sHFcMDk3WH05dkWkro5
         EGD9bOBj385ouOvQAgVh0U61OClOzBVMCE7rdVP/nphMs1E4cGu6Rf+FJoFMudXY3Suv
         GPfA==
X-Forwarded-Encrypted: i=1; AJvYcCVJAQNJpjDKKCOIRY+ApopvNibSlQOGOEiPhRShCEi/ja1QxRJEucv85QFP7dbASogzicYXCus8OHL+mA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwF1xSpEwr+w+hJEO2huhgybIgZIWEblFigulSIyvCh3+tVPgJX
	TiuP+v1bxj4vI9M+q+vuWf4+y9OQXoyPPkeZJWe0d313Xk+B2e6G2FrMJxr/AFw=
X-Gm-Gg: ASbGncsTO8mWSzzVn7if6hcdJcwxPALHRDxynTa8lTluBzR4H4a8HfkERNQFVJSu5F5
	4eVS7CInda+DV7lSAgmKxiwnc4k0X8rVaJuG8fgu5ihKR6ndZ8RpCxa3L/Bk8w6Ds7UKHk6Ljti
	xpLWpRtUyU6L8zpyZTYz8ab8bMaZlbgFTZ5215q4aaGI8a7jeI4Tob63H8pQr4pLJtkTc7gZyHP
	ytYNJV28n4oyl0P24WMFNXcQ7RogN7oA2M/N+VJUsjVO5aFX4rt1fF05kwKrAAFajrereNCtGFw
	MyQHrB5Oq/g652bX6+vs3UoIbA==
X-Google-Smtp-Source: AGHT+IE9Oev0Y7C5Xmqtwl/B+JiwmKuI48iGekPbKSdtVdA99oMBiZeUkT8jvrSGxyy3gXBYBBsXzA==
X-Received: by 2002:a17:902:d4cc:b0:21f:6a36:7bf3 with SMTP id d9443c01a7336-21f6a369009mr6855425ad.12.1738963614537;
        Fri, 07 Feb 2025 13:26:54 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d551sm35131205ad.110.2025.02.07.13.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:26:54 -0800 (PST)
Date: Fri, 7 Feb 2025 13:26:50 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 14/26] riscv/traps: Introduce software check exception
Message-ID: <Z6Z6mhiQ3DmsNZe9@debug.ba.rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-14-b37a49c5205c@rivosinc.com>
 <fec3b7be-4259-4eef-87f9-b2cee5718cae@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fec3b7be-4259-4eef-87f9-b2cee5718cae@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_132655_605972_0490AF2B 
X-CRM114-Status: GOOD (  11.22  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Clement,

Thanks for looking at it. Inline
On Thu, Feb 06, 2025 at 02:49:09PM +0100, Cl=E9ment L=E9ger wrote:
>
>
>On 05/02/2025 02:22, Deepak Gupta wrote:
>> zicfiss / zicfilp introduces a new exception to priv isa `software check
>> exception` with cause code =3D 18. This patch implements software check
>> exception.
>
>Hey Deepak,
>
>While not directly related to this patch, is the exception 18 delegation
>documented in the SBI doc ? I mean, should we specify that it is always
>delegated when implementing FWFT LANDING_PAD/SHADOW_STACK ?

I don't think it's document in SBI spec anywhere. Should it be ?


In code, opensbi delegates the exception (SW_CHECK)
https://github.com/riscv-software-src/opensbi/commit/110524441a827e026db354=
7ed03c5723b9c9e211

>
>Thanks,
>
>Cl=E9ment
>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
