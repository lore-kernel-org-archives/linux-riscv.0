Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A81CCA470
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 23:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/INmlb+L1f42lujqMn3ml0yOwmyjbxWG7w2awthjOc=; b=TS+D/qmTdJ7jwu+n2NAIrHMq+L
	oXeiENT6/FVsWpTlryiufiZI8NNcNlW+v8M8cQdW1iCg49BTmPZ4wC4FvqNbAeBOpc3nDGi0m5LK1
	thhPohVmVZ682P0Fb/ZqSZUZgwxT6mOpVJfigczKn98+cGYhGDsUR3H+ibo/2GxJAQt2qZuT3tiVn
	lFCQweYkqDe/NxjKH9KNsgvbF62oadm9L3qAA/+ay44vm3mltLa+ngYu2d5oTxikoMmtNwkCe3hLY
	KNWZLKFuaJ62hHctsGJcd4LcFSx7Ked1Bf5GqUABODhzQXsQ6RQe0zY86fl3gCAjuCc01/iEJixm2
	oQ8Osrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3k5R-00000006Ns7-0Mix;
	Tue, 30 Sep 2025 23:48:49 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3k5O-00000006NrS-21Tm
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 23:48:47 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-78af743c232so84202b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 16:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1759276125; x=1759880925; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4bm7dBKTe7VHUpax5O4A5sblWjBcLkrJbyIa/W7uP1A=;
        b=IF7TuetXh4Jx1t0AcBnfa6K41QBd8URRM4xZ4caIvmVh3lYS8B6QG+0W8p7zkXuA3U
         b2+cTkWhhcxu1Zgi5KVnX92nUJ4XIFQdTaGfgUtjX9kgg/0FUZr9obtgCxDM8JRUR4kr
         Hi1UGB0jbUEPAWdJytUgpto8fYNbYyvFIZVtkLVKJMfHR50R+E6hW276rFwT4xLE6jiZ
         wct32K587aMrEYNUTnt1cME81shrcOs1OCwNWIrLMDOmrdvgagEm0idV44UNV9RopQQk
         UNU6q75/cntZkCVPwBRGKWVSCGsmTHELGxM+EGGSbc6/sgyTdT2iKfKTkCeg7BfT+W04
         SDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759276125; x=1759880925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bm7dBKTe7VHUpax5O4A5sblWjBcLkrJbyIa/W7uP1A=;
        b=w9yZHEwjlJda4ENqC9giKtWI7dojps0R66/Q7kgfwNxXRiJVrhCTfs09E4hambIuNE
         jkbwR4H6716CxAlulWwLwBnqihy/BRq8XGQ6rg/kjzuubGanensVEP3CxTYW/WUf8yJt
         TBogNQP5mMGpI1YDUYgSYCt5vUsWs6qjPNOiX/KJ298mI043hQNnrUiOoxzL2+AV2ufm
         5LWcPkp7oGeTs/d1GCZR1f4WbgD/ArzVCDnMk0+gqKd5vMYkvwPWw8ybd1LESXDesn3Y
         3AYc7ccCYBlq3vDvb9DJYckJfNtiDlrOmbUOUbJEyHCCTz6ZWdl1gNi2TCL2ttwjO8oq
         tjFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXg3ZPijmvAb8Llc/36xhnds+7/ruY+fVgkf8BekUgt4V6LZGbGZJ86xB9ytvJ/pqnt/sCXg3voTUg/NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YysujF7AzA1N1sr8ReiW2boCDD+izHz1Ox7qNW42GoE+Wso6Lcr
	0BhJ3R5Ns5Wq4qjU7W3jjDvOKNqWnX9qjCoSNmdSYgLCpDX96jVB1psOYE9uJ6wwmsk=
X-Gm-Gg: ASbGncsJOVFuKwaLRNrT6r4WifdxWYanqu/P4WLrO6GOmHdx4DIYHuzmw48TsU9ARYc
	f/3m9tFG76xpjihmJx+3LCbySrzvcaTtbszR76nv/rGOSe+183IWPeG2cC7Bs2jM6DufzW7Lgvq
	997DO8O2kEw/JhuVGVXO+B5cLFPOvi1cob0nzkD459OfqYok4YpGce14y8veAmV66i8NtnZS4DI
	ggaXOq3YX/h+SRmBwPzu9U0yhG2E34zkX/wpFcZRoxZG4mEmV5MWaFV6zsceqWG/iND7Hgsy/eV
	M/xdVWcIMfWtaBahrDv+ToPge8wmQ/1DhKyVTIAER1ILzmcqKXQPgKFb5RzgnaREQO+pcs0aH4v
	HCcL8JPmbkBShnpdgkuJVYQlKK4hBxA0eY00Kpr8haCHtjujrnUD6Q142
X-Google-Smtp-Source: AGHT+IHuRRsekWNjgE7yCPLG9pq3eS/GOyyUhj/f2Q9rAEjbYAirvs/e72q2qhgNkEK8PrNvRevQ9g==
X-Received: by 2002:a17:903:3d06:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-28e7f291db3mr15309515ad.14.1759276125338;
        Tue, 30 Sep 2025 16:48:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6882133sm171972415ad.89.2025.09.30.16.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 16:48:44 -0700 (PDT)
Date: Tue, 30 Sep 2025 16:48:41 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Florian Weimer <fweimer@redhat.com>
Cc: Charles Mirabile <cmirabil@redhat.com>, pjw@kernel.org,
	Liam.Howlett@oracle.com, a.hindborg@kernel.org,
	akpm@linux-foundation.org, alex.gaynor@gmail.com,
	alexghiti@rivosinc.com, aliceryhl@google.com,
	alistair.francis@wdc.com, andybnac@gmail.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, atishp@rivosinc.com, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, bp@alien8.de, brauner@kernel.org,
	broonie@kernel.org, charlie@rivosinc.com, cleger@rivosinc.com,
	conor+dt@kernel.org, conor@kernel.org, corbet@lwn.net,
	dave.hansen@linux.intel.com, david@redhat.com,
	devicetree@vger.kernel.org, ebiederm@xmission.com,
	evan@rivosinc.com, gary@garyguo.net, hpa@zytor.com,
	jannh@google.com, jim.shu@sifive.com, kees@kernel.org,
	kito.cheng@sifive.com, krzk+dt@kernel.org,
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
	lossin@kernel.org, mingo@redhat.com, ojeda@kernel.org,
	oleg@redhat.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
	peterz@infradead.org, richard.henderson@linaro.org,
	rick.p.edgecombe@intel.com, robh@kernel.org,
	rust-for-linux@vger.kernel.org, samitolvanen@google.com,
	shuah@kernel.org, tglx@linutronix.de, tmgross@umich.edu,
	vbabka@suse.cz, x86@kernel.org, zong.li@sifive.com
Subject: Re: [PATCH v19 00/27] riscv control-flow integrity for usermode
Message-ID: <aNxsWYYnj22G5xuX@debug.ba.rivosinc.com>
References: <f953ee7b-91b3-f6f5-6955-b4a138f16dbc@kernel.org>
 <20250926192919.349578-1-cmirabil@redhat.com>
 <aNbwNN_st4bxwdwx@debug.ba.rivosinc.com>
 <CABe3_aE4+06Um2x3e1D=M6Z1uX4wX8OjdcT48FueXRp+=KD=-w@mail.gmail.com>
 <aNcAela5tln5KTUI@debug.ba.rivosinc.com>
 <lhu3484i9en.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <lhu3484i9en.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_164846_708583_094C64D3 
X-CRM114-Status: GOOD (  10.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 30, 2025 at 11:20:32AM +0200, Florian Weimer wrote:
>* Deepak Gupta:
>
>> In case of shadow stack, it similar situation. If enabled compiler
>> decides to insert sspush and sspopchk. They necessarily won't be
>> prologue or epilogue but somewhere in function body as deemed fit by
>> compiler, thus increasing the complexity of runtime patching.
>>
>> More so, here are wishing for kernel to do this patching for usermode
>> vDSO when there is no guarantee of such of rest of usermode (which if
>> was compiled with shadow stack would have faulted before vDSO's
>> sspush/sspopchk if ran on pre-zimop hardware)
>
>I think this capability is desirable so that you can use a distribution
>kernel during CFI userspace bringup.

I didn't get it, can you elaborate more.

Why having kernel carry two vDSO (one with shadow stack and one without) would
be required to for CFI userspace bringup?

If Distro is compiling for RVA23 CONFIG_RISCV_USERCFI has to be selected yes,
kernel can have vDSO with shadow stack. Distro can light this option only when
its compiling entire distro for RVA23.

If distro is not compiling for RVA23, then anyways CONFIG_RISCV_USERCFI is by
default "N". This would simply build vDSO without shadow stack.

>
>Thanks,
>Florian
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
