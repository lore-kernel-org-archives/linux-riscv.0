Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CC9C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 09:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7CiH4ksmz+kzVdjxzh80ofreeTCaCxP0s5ri/sUhaI=; b=cZ1PDisRxYTDG6
	A/Yd6d5WP6gVKetaE2JHOMeTHoYEOcwBU2HzA21o3k/bdxBvwj7lef56PACv5db/muXp1NT6yUIrc
	EJ2OLxh1qJjA6mZs4pLcffuqyxY5I8c8LCj535umDvnJUKYu+/uDaqy7BSUkohi/EGTzfI5Qrg+Cj
	RwMvwRHLX6L71m9B3F1WjYrUdrUDwOqOoku4Xt+isc3Ivt6H1s8GgspDtFq31hJgyFqIt4uorbFvS
	TMgxwOzvxYtDegEFbtMjzTyXDPONkY4pGBLuxNkhx29e1QJqlg5qxfeDB6bxUb+DRqoDv+kK4Qyox
	Sl8Wih5A3qVRJdUlWcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvD1B-0000000GNDC-2Cgv;
	Fri, 12 Apr 2024 09:16:21 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvD17-0000000GNAV-22dw;
	Fri, 12 Apr 2024 09:16:18 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso1049985a12.1;
        Fri, 12 Apr 2024 02:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712913374; x=1713518174; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P5rS5dDZ6bz9RnNGWXjXGeZ5LSFZB2izV8TdsSyfhY=;
        b=iua2wc2CT1Cu8Y3XWMhZj8TQVtSUz/uGq8ajTHU214yuifmrBFhvWwueTscz1T8s7y
         ed+Ed7ld9opoIkAb40+wU7YZbC5hNB4i8Qdpiop1lNnt4jsJb0sZ36fl0niyPrmaSr3n
         yF7vLu1P6mTbQurnMKGWAEQ8XVMjl9a5pXE7UHUqPT3sqBirCamVWfrsIuwaE3S+Yt3r
         qjWhrKBpfA4hZCL0SXQy7BoeBKCzCNSBqcK3DZdiu6cfVAqjtgMP1rxi+wKmwwCiHkvp
         RtUiiKT/X48sFkyfXDU8UxRm8WAxcMqTIKUdItlC6fbLc3uxoX6ugBtaN4R8w3AToF/x
         HOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712913374; x=1713518174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1P5rS5dDZ6bz9RnNGWXjXGeZ5LSFZB2izV8TdsSyfhY=;
        b=irYAdP7g9qAe+lkqelnUXKRIj3mvq5LZq6rX8Jkkvu+9mY8/QcymjiUXtHEUr0Du7v
         LKETd41JTAm+sU7Ym9auJSc9U85Nqi8/CqwuoGlF3sSqTkEeNmPULmf1/lfjwICWcOdW
         s11MQRS49+wWlldjtH/16ZDL6HM0V5xJxUrKqrttswu/6uiRIHQMJc8v9dvA9Khtmer1
         Rg9draMe1uNYcZzbCXOG3Iz5cGjnE95zM1VEeGt3rdaabvPC53KrdBsCBUaswvIzLa3I
         MBweZbHHnuJxZtJCC6kOu9j+KrbPOZmKkNlOyZ8HYKSY4fepyJ850Asbr03Us5TS2g/E
         FyQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWYRIhmoCY3P7IF/ossznr3KRhGSkqK9cDBdOyRVVeu6BxZ1cBp03FsRVElO+cctQ/vvcUqZtX6kuOpqJKc40dtj/1lcgtj7aaz/LTDCu+/y3IdSOSUfEZOAWHEqIMfvuqrFegm+iki0JbzqzQFs5Ke1eLm8I=
X-Gm-Message-State: AOJu0YwL1CmRn1DO+mT16jj/XM9sapyG28/YqNfkobjiHhi+xbc8qJDo
	BCqqX/bq5Na45JQmTP8Xx9MsrWnUAmtYXgUPBIVFrE4Pmm2v6PDx
X-Google-Smtp-Source: AGHT+IF2JLt070H6U+NVwXUCGShMgUTVG3TFLf6L4pd2nPVSBBMwXn0qR7EXkAPf+SwG43RHlRZl8g==
X-Received: by 2002:a50:f68d:0:b0:56e:4039:add5 with SMTP id d13-20020a50f68d000000b0056e4039add5mr1892328edn.22.1712913374186;
        Fri, 12 Apr 2024 02:16:14 -0700 (PDT)
Received: from gmail.com (1F2EF1A5.nat.pool.telekom.hu. [31.46.241.165])
        by smtp.gmail.com with ESMTPSA id el9-20020a056402360900b0056fe755f1e6sm1454709edb.91.2024.04.12.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:16:13 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:16:10 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 05/15] mm: introduce execmem_alloc() and execmem_free()
Message-ID: <Zhj72l6uN9OFilxA@gmail.com>
References: <20240411160051.2093261-1-rppt@kernel.org>
 <20240411160051.2093261-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-6-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_021617_553410_C73CAE8D 
X-CRM114-Status: GOOD (  13.63  )
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


* Mike Rapoport <rppt@kernel.org> wrote:

> +/**
> + * enum execmem_type - types of executable memory ranges
> + *
> + * There are several subsystems that allocate executable memory.
> + * Architectures define different restrictions on placement,
> + * permissions, alignment and other parameters for memory that can be used
> + * by these subsystems.
> + * Types in this enum identify subsystems that allocate executable memory
> + * and let architectures define parameters for ranges suitable for
> + * allocations by each subsystem.
> + *
> + * @EXECMEM_DEFAULT: default parameters that would be used for types that
> + * are not explcitly defined.
> + * @EXECMEM_MODULE_TEXT: parameters for module text sections
> + * @EXECMEM_KPROBES: parameters for kprobes
> + * @EXECMEM_FTRACE: parameters for ftrace
> + * @EXECMEM_BPF: parameters for BPF
> + * @EXECMEM_TYPE_MAX:
> + */
> +enum execmem_type {
> +	EXECMEM_DEFAULT,
> +	EXECMEM_MODULE_TEXT = EXECMEM_DEFAULT,
> +	EXECMEM_KPROBES,
> +	EXECMEM_FTRACE,
> +	EXECMEM_BPF,
> +	EXECMEM_TYPE_MAX,
> +};

s/explcitly
 /explicitly

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
