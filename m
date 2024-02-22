Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EEBC48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 00:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HE5yVrasXhqv9LNhsOvRuWGLFDfTPo27+rdjuiWHLjA=; b=vxH4Anr7puQY8+9dKkr0MfkUqb
	ybT0eOMviQ4j8rkOtANPp603aLOREEordUmirugMh2glkDwlgdWtiozLMzU2/jZ83A4i/T1vAiso2
	s0nGHaXqhZYvJFcbCfVEbutmnFOF82DRmwF9a+FQlZC3GkyQGr6KkG0EQV6CPirmuCVKq4tnBjUwV
	9UVdeOsK8SvsmUN2mhYM5xyuZNxe+e3FvLCmRAmU4mhAU9402ddas3nP+aLwHxBRG9TUd4sQRi1a3
	7lB5eq+o0N8f+4tK6qVdKiepcE6buj3aDCD1icHpsB5lUqniI5RsNOkXYfsWv4s5IUTodekO9eR0V
	DJQ8MqnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcxFA-000000035Yp-01Zy;
	Thu, 22 Feb 2024 00:47:20 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcxF7-000000035Y5-1oN6
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 00:47:18 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3bbc649c275so717221b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 16:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708562836; x=1709167636; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PxnB8hIBaJHKU9GMJod5TzavYw729HDn9dbYWz/K8DM=;
        b=0VKvv5Kvx20pHOyt5LoxHS6CcV8/UOF8/D95DKNSQ1/++qrpmg3TUaVJwwjqYEw1q9
         mSmrvV2hpmT2FJnq3cry5l8Hv0jUVYeuurLIuXHS6neiB2jSlxqtbPn5Dd6VklTwNrr6
         tkO1oylwK9vJ93HvGnQyLIII5RRPAlTLboh1AFQnPvjfY6a0Vx7GaHKg4BeiOaD/I1kr
         uZ7efzXBcIPriV967e53L3Kfd5tpRdRUd17n0nh5m8VlmTouu9CX3TChY+Be6TRCm/Vk
         4Kbho5rev8HA1l8kMWiMB4ka2jJhFuObcUdrKy+i9EbJkCQY6r4Ezd3yrfl74R2UNnla
         MPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708562836; x=1709167636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxnB8hIBaJHKU9GMJod5TzavYw729HDn9dbYWz/K8DM=;
        b=pWD0/oEDk6V/IhfTirfbqGcFflbacageHf7WlqLUcZX3jvnEZy3OhksaAHknZoDHOp
         qNZM6Pg721TiXy1UAG3QfPWV/heas/lvxAkH+1B4TGq+zBLqv13oukGOtV746CYmkCoC
         p1tgtgkaz+aUMLnRuWEkB1HWKVRYSXDH1gMNYnXJGh56rqZWlMRjvAdsNQg5eISsYZzP
         GiOnRFhTzPbh2402TyraWLbSkC9JBJpHaZ0TNQRpo6yHJbHcAJJGNY7+05qI1kHvoox3
         kiThmWmNOZ2ai+pz4DQHIEDQvEQqwzVoIozyxQvXpC6BSjL1bOZ8ffXRtepR/yfp+v5y
         hrsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0lIPKUsWXkCpV4bAEQnr8oRi8EtG+DTaOSHBmOFTMleYWQWoUg81cHFEkRYT88piPGjsZTZ6x9loH31BqCVYv0RB566WQsRZDOIk+2uBc
X-Gm-Message-State: AOJu0YwXQXp2/KARYflWTW9yEgAQBTEG4VJTVxX5z39XHhMjHiWO8xuO
	/Z3rvWZ1kxH6JiU9+OYIYTPKtB+pkGQ+76yGVgG7Z0gAer4fdLRy6ileahXWa9s=
X-Google-Smtp-Source: AGHT+IFSLTMc3hCuIYilhHI07UG+3jHSb+dOia9uI0EVHy8hIHGEMNdRSjhvd4xYo+3moab7FJoglQ==
X-Received: by 2002:a05:6808:170f:b0:3c1:5440:d2c5 with SMTP id bc15-20020a056808170f00b003c15440d2c5mr11757138oib.38.1708562836074;
        Wed, 21 Feb 2024 16:47:16 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f10-20020a056a000b0a00b006dddf2ed8f0sm9533333pfu.154.2024.02.21.16.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 16:47:15 -0800 (PST)
Date: Wed, 21 Feb 2024 16:47:11 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Mark Brown <broonie@kernel.org>
Cc: rick.p.edgecombe@intel.com, Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, conor.dooley@microchip.com, cleger@rivosinc.com,
	atishp@atishpatra.org, alex@ghiti.fr, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, corbet@lwn.net, aou@eecs.berkeley.edu,
	oleg@redhat.com, akpm@linux-foundation.org, arnd@arndb.de,
	ebiederm@xmission.com, shuah@kernel.org, brauner@kernel.org,
	guoren@kernel.org, samitolvanen@google.com, evan@rivosinc.com,
	xiao.w.wang@intel.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, waylingii@gmail.com,
	greentime.hu@sifive.com, heiko@sntech.de, jszhang@kernel.org,
	shikemeng@huaweicloud.com, david@redhat.com, charlie@rivosinc.com,
	panqinglin2020@iscas.ac.cn, willy@infradead.org,
	vincent.chen@sifive.com, andy.chiu@sifive.com, gerg@kernel.org,
	jeeheng.sia@starfivetech.com, mason.huo@starfivetech.com,
	ancientmodern4@gmail.com, mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com, bhe@redhat.com, chenjiahao16@huawei.com,
	ruscur@russell.cc, bgray@linux.ibm.com, alx@kernel.org,
	baruch@tkos.co.il, zhangqing@loongson.cn, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, joey.gouly@arm.com,
	shr@devkernel.io, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v1 15/28] riscv/mm: Implement map_shadow_stack()
 syscall
Message-ID: <ZdaZj0pqaVJiNOUg@debug.ba.rivosinc.com>
References: <20240125062739.1339782-1-debug@rivosinc.com>
 <20240125062739.1339782-16-debug@rivosinc.com>
 <ZcJX2IJb0hOM5RF5@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZcJX2IJb0hOM5RF5@finisterre.sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_164717_497191_C22024D0 
X-CRM114-Status: GOOD (  16.20  )
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

On Tue, Feb 06, 2024 at 04:01:28PM +0000, Mark Brown wrote:
>On Wed, Jan 24, 2024 at 10:21:40PM -0800, debug@rivosinc.com wrote:
>
>> As discussed extensively in the changelog for the addition of this
>> syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
>> existing mmap() and madvise() syscalls do not map entirely well onto the
>> security requirements for guarded control stacks since they lead to
>> windows where memory is allocated but not yet protected or stacks which
>> are not properly and safely initialised. Instead a new syscall
>> map_shadow_stack() has been defined which allocates and initialises a
>> shadow stack page.
>
>While I agree that this is very well written you probably want to update
>the references to guarded control stacks to whatever the RISC-V term is :P

Noted. I'll do that in next patchset.

>
>> --- a/include/uapi/asm-generic/mman.h
>> +++ b/include/uapi/asm-generic/mman.h
>> @@ -19,4 +19,5 @@
>>  #define MCL_FUTURE	2		/* lock all future mappings */
>>  #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
>>
>> +#define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token in the shadow stack */
>>  #endif /* __ASM_GENERIC_MMAN_H */
>
>For arm64 I also added a SHADOW_STACK_SET_MARKER for adding a top of
>stack marker, did you have any thoughts on that for RISC-V?  I think x86
>were considering adding it too, it'd be good if we could get things
>consistent.

Please correct me on this. A token at the top which can't be consumed to restore
but *just* purely as marker, right?
It's a good design basic with not a lot of cost.

I think risc-v should be able to converge on that.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
