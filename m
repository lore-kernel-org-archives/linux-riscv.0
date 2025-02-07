Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17851C021A1
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 22:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xv5BM282/jJBE2s69oHSwFPb8nU0cxLoxToOU78eZeI=; b=x6r72gX0AK2eq3UEmmdFY2QsMj
	skUKz3zO26Gyn/E/lFW9yrhQUscFyjMtk3IjvEyER9h7VueTp4NV1SJZCMNC8/rJe/SVk2IQWw9Tx
	pHy5ptAsn60v8fOqWHac33rvAvix//0YUhnEP5NNER2f51Kee927IxoGzpvKbbbPUrBzZ/wLY4BpV
	X/7BFQyQiD1yTcCNsFkFdARe3+B+iAR4ttwfKAu6w1OCsQg9Wqg7JBEVJA9dFK6jp8DR/7C3XXSFr
	iVsga9+xmi9ExqwZARMzyBsNgX83ls/Cgv/3bD5K8AU3pMzli7wTbantuoDQw0vJjJc64GI9bo1jj
	H02SzwYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgXGt-0000000BSJc-2ClU;
	Fri, 07 Feb 2025 22:56:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgX5h-0000000BR1F-26P1
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 22:44:54 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-219f8263ae0so50731945ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 14:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738968292; x=1739573092; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aaVupd8VUc45i80fdS121DnyNihJxKhlS0yfklFXjf8=;
        b=vX/g6DHnOyEKNmx91VEQzQJsBi3XRyYCxeMXvqtjZzHEaUqnj8lV8jyMAxMtKSdv7N
         oRfNSPpmjQDbLJ64GQZxOa7NmBvy96TKuGJx3Ynl+40keU20MvJ2UmxE/sXZEQ5AVY+O
         D4SyEOsig4B+8lMcTVtP2hodlpKVMdcOkgYSHlxabXBvTY5p0q3j5m3FJp/hJxxihhHy
         7QuzepaHUBexCtpGjlkK0NNwINge0ekZykt17HuY5GtoCfIj9n3/uc06M0Y7gitx3K/3
         LGudj/MEVgFnSpmtnY22kSjCOEL8u1TOHDN+q6Efjxve6m6DOpNweZol204AWlzvOcCx
         efdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738968292; x=1739573092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaVupd8VUc45i80fdS121DnyNihJxKhlS0yfklFXjf8=;
        b=JSukGrOyyi+rp0SRchA3E439ivzsQyHaqSs/U6nXIFIe5Lp3HN8OiWlJc1VgRWoTBp
         8g6go8mH+5oKg9A554z8wJkENV3IUlkC2aRzme0Lq2Bvg3hg+g4mlGiGPRlegeu5+J2k
         xjfmqhHpgVVVqqBod4dvp6y3lDtJVratCZ0KMhTGpVCLLdM8mnaMRED8hrHA7RA2oT1n
         SW918TJCFrjW+xYwA8SYAKFuN+dVMlhiJR6VtCR/Qq0MhV2z+Rd2sqTy0UcJxj8yOk5G
         id+PmSGrvXlvLFR5Flw0HeBmIUA0Eto6rXA88fmOB/oiveOd5CpHuRce1FDxFbDeYqqp
         Hr7w==
X-Forwarded-Encrypted: i=1; AJvYcCXToLH2mdLtsxdfK7x/7ez1nqh0S6FmdXOB03cMbQ646rB1UrtT3cy1EfIV5eNUpDD42N0gLGMCyvDO4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEVjhSvO6xTeePIUMroYnJVljfdlbZYew/mcNjZ9ZKTXOaWSMO
	hbpHYyfFvTeZSTVOsSJIkvtqXk+JQESulxAzqB8F4YivQJU0J9nUkEAktbHU3vk=
X-Gm-Gg: ASbGnct9wVtEEQocI2u6fa4kw28XSvpdRXI2VLciUGHIo5RgfS+nsZTgpwIv6Motots
	Jq/kF9PRu6JW3IlBF4f4yZIC2D+Kej3EZAhVB/2HcB2nabSFOmUqMfsXs07L3ta/cOOKmGThERN
	lDmF8nrA4xPf28iIvqq1dA6O0gr5CfiULkfx9hj5fvxVYYG4IjObR1qxkY6tQRJbxgiYqxePZzR
	VibAWZxpAHFq+ewSJfMKNA0Fc2rFYybgGN7SomLImazjxma7JmQUJvBlJ91SIvXgF46YMfuZI2z
	sRILNZy7U9CLPJWtSsDSHGhZfQ==
X-Google-Smtp-Source: AGHT+IGTbu0BMzwMN01MWsrhsIOFLeTlIMVdLcXc0KHhDWapExjSRgm5VmEl2B4ZBoi8LJRoMaWbIQ==
X-Received: by 2002:a05:6a21:7a4a:b0:1ed:a578:127a with SMTP id adf61e73a8af0-1ee03b70c91mr10868884637.40.1738968292668;
        Fri, 07 Feb 2025 14:44:52 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aeb8d9bsm3508358a12.12.2025.02.07.14.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 14:44:52 -0800 (PST)
Date: Fri, 7 Feb 2025 14:44:48 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, rick.p.edgecombe@intel.com
Subject: Re: [PATCH v9 01/26] mm: helper `is_shadow_stack_vma` to check
 shadow stack vma
Message-ID: <Z6aM4NZyJSGLwIPr@debug.ba.rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
 <20250204-v5_user_cfi_series-v9-1-b37a49c5205c@rivosinc.com>
 <6543c6b6-da86-4c10-9b8c-e5fe6f6f7da9@suse.cz>
 <5708c19d-240a-466a-b17a-d51b26ab95e6@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5708c19d-240a-466a-b17a-d51b26ab95e6@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_144453_533884_8B220B57 
X-CRM114-Status: GOOD (  11.54  )
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

On Fri, Feb 07, 2025 at 08:06:59PM +0000, Mark Brown wrote:
>On Fri, Feb 07, 2025 at 10:27:10AM +0100, Vlastimil Babka wrote:
>> On 2/5/25 02:21, Deepak Gupta wrote:
>> > VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
>
>> I see that arm GCS uses VM_HIGH_ARCH_6.
>
>That'll be bitrot in the changelog, it was originally VM_HIGH_ARCH_5 on
>arm64 as well but we had to renumber due to the addition of
>VM_MTE_ALLOWED while the GCS series was on the list.  The changelog just
>shouldn't mention VM_HIGH_ARCH_x, it's not particularly relevant here.

Yeah noted. Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
