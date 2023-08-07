Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FADC001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 23:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=VLgwD4aSemimpU7uC4187vLaZ4MDsc68AstvIkKrsok=; b=StB
	i7jZ9sMR8WxqHfut0VGmRKXa3EEbzXL900EqpPwYEd12JtSZGFOJD568e0F8YEfp9UgtFBITQhEY/
	AcR8yXYYKd1WsUy/RtpqcanbEslb4njkn31oi1agdgo2qoamnDYP3NM+b0/2cMSC1JTTHRPCRmtVr
	SZGY7gPhwiBPu8poie946k20hU5hGsI/WV2FAGg/XfK8NPC3mkTlNlql8HzHa3KGyckJu+kneRXSe
	mAcAwlX59F1mTdat7MdLXIoexJyQnqW1CYOqjeFHz6Sz/Z+Ct3a12ggTRvgQ1oxX0bEUCyXw86JcP
	SFHPWSmGOcIYHGBNB6/qYLLF+HtbPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT9WO-001Buy-1b;
	Mon, 07 Aug 2023 23:20:20 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT9WL-001Bt5-1y
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 23:20:18 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5868992ddd4so58933757b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 16:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691450416; x=1692055216;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Ut/hDJ+qFMS0sDMssVLi/Qh1tossNoTViyk+Sv5I6I=;
        b=OnbGVA8IPnrsdTREsUm581mRdehgXJT0uL+ALPcn3gfxErJrXCtKmSomsOKaQATGMh
         f0VvgjqMIW5HLukSt/TZqta9FHSpbW8xuPg/WJY9Y8dBtzBXk68FxKvGTf0SBMt/xuPE
         yb72/yaLEWHxd2i86q/oL/iyLDDk998ORMSoUHaZduqRHpQmcSBeRXdyojnyjv3Pm4Gp
         0hyU2N4jgt9pJV3/SHK5m7Gafo6teeA6CAaXNJJ1Z5NngK3Yas1VVpJwsDY8b342oTWb
         +N+E2aHGEdoYFXjyTrvdzsHzrQ8RpCJH9Ba/1//rKN61ZJdF3SLJ42ybI7Ydk3RiGWfT
         qyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691450416; x=1692055216;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ut/hDJ+qFMS0sDMssVLi/Qh1tossNoTViyk+Sv5I6I=;
        b=U03WsCsr0FMTuS3pkim5nDyd78z6iZCSGE/csLQUmguJf2ViE7uFzpeuFk+M0rM8/Q
         prg9W6ypnf/rhm8PuUjUfujHaa+3Wka3QAECUPrl4bnUmPaaiZTDi3qNxEsZtMSEHGtu
         UHEgR2/XAyVi8YaT8I6SzEJxOjV1W3bwZXM2NVja2CtXxZmf9MJBtTKcZen/cssAaohd
         P8IEr4WySg7FJ1no36t2ugvMLfa8v9MpV5h1sOtdjqE/pcp6Bty4EXQfge2BdW/Rra1m
         Me7vbVaXuGnSlxd0RzLZdHm3Q/rWWF3x7LhiMFixIqGorOUfETKgH9mcHXzcUlDS+peo
         za1Q==
X-Gm-Message-State: AOJu0YyqWbbc9nunRq56qQGR6tG8YbggRRKyCANwbfmdPmMPvLb7G3I+
	DS0qcFohUVC3QLBPo8TxHd7UHeDZvx2KLvfYpg==
X-Google-Smtp-Source: AGHT+IGdVk9oJYWbSpXuFj0KYecexGvmGzQrsUIUE7DdG+7VjOx16xy0jF3toasrtnWqbigopnLRYvJP03sO+CW+ag==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a81:af45:0:b0:581:7b58:5e70 with SMTP
 id x5-20020a81af45000000b005817b585e70mr85942ywj.5.1691450416406; Mon, 07 Aug
 2023 16:20:16 -0700 (PDT)
Date: Mon, 07 Aug 2023 23:20:15 +0000
In-Reply-To: <20230718234512.1690985-29-seanjc@google.com> (message from Sean
 Christopherson on Tue, 18 Jul 2023 16:45:11 -0700)
Mime-Version: 1.0
Message-ID: <diqzo7ji30eo.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, maz@kernel.org, oliver.upton@linux.dev, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, willy@infradead.org, akpm@linux-foundation.org, 
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chao.p.peng@linux.intel.com, tabba@google.com, jarkko@kernel.org, 
	yu.c.zhang@linux.intel.com, vannapurve@google.com, mail@maciej.szmigiero.name, 
	vbabka@suse.cz, david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_162017_650572_50AAEA5B 
X-CRM114-Status: UNSURE (   9.87  )
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

Sean Christopherson <seanjc@google.com> writes:

> Add a selftest to verify the basic functionality of guest_memfd():
>
> + file descriptor created with the guest_memfd() ioctl does not allow
>   read/write/mmap operations
> + file size and block size as returned from fstat are as expected
> + fallocate on the fd checks that offset/length on
>   fallocate(FALLOC_FL_PUNCH_HOLE) should be page aligned
>

> <snip>

> +
> +static void test_fallocate(int fd, size_t page_size, size_t total_size)
> +{
> +	int ret;
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, 0, total_size);
> +	TEST_ASSERT(!ret, "fallocate with aligned offset and size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			page_size - 1, page_size);
> +	TEST_ASSERT(ret, "fallocate with unaligned offset should fail");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size, page_size);
> +	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, total_size + page_size, page_size);
> +	TEST_ASSERT(ret, "fallocate beginning at total_size should fail");

This should be

TEST_ASSERT(ret, "fallocate beginning after total_size should fail");

> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			total_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) at total_size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			total_size + page_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) after total_size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			page_size, page_size - 1);
> +	TEST_ASSERT(ret, "fallocate with unaligned size should fail");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE,
> +			page_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate(PUNCH_HOLE) with aligned offset and size should succeed");
> +
> +	ret = fallocate(fd, FALLOC_FL_KEEP_SIZE, page_size, page_size);
> +	TEST_ASSERT(!ret, "fallocate to restore punched hole should succeed");
> +}

> <snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
