Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DF7FCC9D6
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4S36ee1wEt7RXiDns6PNGQ+vU+PQONFQFPB8rPX5Wn4=; b=CpfnoCaOhqUcFb
	dYv6xSVutDHioRlAtlzOhKK2ur/XTLPv5Hu+AW/Q2GffDukkZpfS8ytg6iLVXA770Xps6OQFis26N
	g2NRy3W8XYEN3IjOKzfceJYLPT0MtauYGfxzU3SUSseIxAogh8eKl9oMjdWnIwxlbI6C/8NPJseIW
	j+zp+X9BnNbBY/KyRaEyiYIxgXQbiXacVzCCyDacgQA684EDRLtK+kWSaueJd1FOoWFzIey08/o0l
	/ylwEKvH4lWV61TT0FlLyTvuB7bfwalHcFYSUiJvC6MPKhDQRet3TXQfzGitVxB/YlJXLO861v7eX
	uYkBWvw04QHoyPCKU/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsIg-00000008vTw-2a9O;
	Tue, 10 Mar 2026 08:18:46 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsIe-00000008vTL-32Wj
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 08:18:45 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso9916859f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2026 01:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773130723; x=1773735523; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dycVTiQonYLmHwRlbFRJNUne42yx8K6NA3MzPE8Q6Fk=;
        b=YkaHWmHvyzcr9IDT5xQCNAKjdfmoYkrTm8eRPm4TsiQNvYkfiAyL3P/fJLgvlr5qU5
         JdrPINTQBojtm0A51Jd27aYNestShqEyxwdkStwBzxqrktKFQnkFqih1VoGsq4UK9Q1+
         wc24y4k0ePoXbAM90HtK0zxyt8VSXYgBT38nTg7ugkHMiJmR/XqCEgvRyEJBOvROrt+8
         KW+EZwymmR3dE9T7Y1vX2AY9L3AnDBbo2Xx3/sy7Cfg7seyAAAtDMZs9FTMZAWr6TYh6
         2VKcbVMLtOV5sNW21p8S9f2QP1cGrk9QXVqu3+hKl4u/l/CANVp9/iVuh2qvVF7wUMFy
         iYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130723; x=1773735523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dycVTiQonYLmHwRlbFRJNUne42yx8K6NA3MzPE8Q6Fk=;
        b=Oa4/UqLs3tOhZaVQOBODPFtbL+vNqg/NW3rtVdCOMnnfMDPIMCmjv1jDsEpfqmb5UT
         3Jw7wjUQfv4kdqP1mLez/FEExWf+vDP/9jL2Rxnr1QhaD3BjNKfKFT2NJcW6P8ozgQBF
         cB8PO+ZwCgLeKw87K1RJQDaCreBX9ruICEbCPv/HYvixZyTbKBVpMG022/KgBqq9x7Ll
         sNZC1o4CEjTHzhizZz2YQZ9nN9AQuUMjuTSeNVCijyb2tFevpPz+7Vp3U/e0PvjhzBHe
         HG+qvmfZRzbN+wbc48ZSs2xH/nTMHL76NbAy9wCGZa+nu92Uwk1L99YPlsYyS1iuqrSi
         /JnA==
X-Forwarded-Encrypted: i=1; AJvYcCUhtGDiV5Gnnv8K7NTJuipm6+TUS/fwGYCvF72CUOuVtv7kv6L6ndIepHqDbUuIK4ZiA+wzN9a88dczEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7TOu+jKVkNApe4m2ChkVDtx8BnB5vVUizcslrqMIeMX17m9X4
	4nbXprA4p2TXLptqZDLk24zEJWpWwtvrp8QqkmLKUx9Y/DuSvQjdTgeC
X-Gm-Gg: ATEYQzwdix4M7LSGzNTyEMP6wKaEatRNjpI2mG9cidyd5zk0py5u9xCmvu5NivG+dtj
	pbolVn+ZRhL3sgouOwQpgOevWYMybS/nJ0py8J8rWNxvDuIJk5r+qNw654+NQh5xS4sz9HfzfwA
	QeZxc4bgn0bLZnGUPuTzKxs0jY5S51Y5xSNBHSnNtohj+ko+tk1eeg8nnatRoFDgipnnRbHpsRm
	JLhaMLcxh9voYuaxOIIF7pD1orDChDLYCaM/dM801K8/bPNwO3ek/4Ya8cNg8OWaJLq8euA7LI5
	NKS/2MsjUybpPNBEpSehbxOuMkbUS0Kexs3s1YEvZ9GSXSQGPPunwYKoD3483Fo6zixvxctfxPL
	hsUQs+FUQ0E+uIN2DGZ5uPP6fU42RagCRn+1EU9X8Cx3rlf5xLFKBiBfqcyQ2bvG2kQKIGOwSw3
	CDHp9DydAUCtV5fx2o
X-Received: by 2002:a05:6000:2012:b0:439:ac6b:dd64 with SMTP id ffacd0b85a97d-439da892019mr25524607f8f.45.1773130722588;
        Tue, 10 Mar 2026 01:18:42 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8da01sm35110976f8f.1.2026.03.10.01.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:18:42 -0700 (PDT)
Date: Tue, 10 Mar 2026 11:18:39 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: thecharlesjenkins@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] selftests: riscv: Add definition of BIT() macro
Message-ID: <aa_T3_IySAj4_Xwo@curiosity>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
 <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_011844_787990_41DB6F2B 
X-CRM114-Status: GOOD (  13.53  )
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

On Mon, Mar 09, 2026 at 06:52:10PM -0700, Charlie Jenkins via B4 Relay wrote:
> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> The BIT() macros is used by the validate_v_ptrace() test case, but not
> defined. Include linux/bits.h to pull in this definition. To ensure that
> the header in the kernel source is used, add tools/include to the header
> search path.
> 
> Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
>  tools/testing/selftests/riscv/vector/Makefile            | 7 +++++--
>  tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)
 
Reviewed-and-Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

Thanks,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
