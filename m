Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767DEC25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 15:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ujdbW3TA386wXZjttITEy+cMsxSS9qrvEqRTG2TLVP8=; b=jnjCiXwM91d/LYQJnPwYMhj/ih
	5BcLpWBnibdD6LPuVTDZTycRws0i6sf0wD1KCJTFwfMfrBoF/gqMmW2Nj+AwxDeWEAaAR5bUCBdKm
	QpVXEhWpZieIDv7iH0IYexmS8pjnXcNj+NpsuJpS7Ivs/+rvnFv4pT3DkC2H1I2JscpBI30eX/pHF
	T6USX54EfJMXB1D1bnFAiVIoOWFlx28CK0gyCVTGz6ui+Tpi+ty9TNs9dLb2vCVhvzgGG6l1BNT+T
	Ne/KVpVMNfdwdmSFculJBxJ62XCpz0JTFRF1KPXXDpeJgBxxBAEMdudtt4OQrwXcqouDyJ5gTeTh3
	kCP1i6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw2g4-00Epdd-11;
	Thu, 26 Oct 2023 15:53:44 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw2g1-00Epc0-2l
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 15:53:43 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-586ae6edf77so323706eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1698335617; x=1698940417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hynPC3scdZ40zr3lj72+b2FKOXBK+Y3Zgo5uOul25Y=;
        b=BW7X9abFkT/0WPw4exobKjMlkMDwGSpZe20vGF4R1aZaqY5zf+1eyBed8Av7wdK32x
         p4uFt0aWrk6ubyYoJspoF2b86grp4/pPGBVapI2PMJlt4o1vn5ZtgSqUCKVmHVUNmlAQ
         86B2gOrDb8rE0CtBgKpmVc7IlXVWdi+RtcIga3bWjBGukpPCcYKYfEmmwlmOcxbXCiBL
         AD2Hi/2/NF0ZxhzL0O/B/9pclQyKQyIYTsHXL8LeXoVOenjC9K+2rN7DoUUAEBwgY7sb
         QVxKjtBGAl+jUD5d/M02Er6ubFjr1axFDKj98lPNmSXk8Isc3L4EvFxplRwQOiU/2+6T
         blcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698335617; x=1698940417;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hynPC3scdZ40zr3lj72+b2FKOXBK+Y3Zgo5uOul25Y=;
        b=XxoLsq0c3dVEQwISFYj/1LgwQ1UEu8nFm2UKJUylMc8uP3clC1vIfTKFJcN6rl+GRo
         7NV2adzdfgjO1ZaljLg81uuV28natPvG/nRLYrhuGS0e9/PLFd4JZPOLoE46Exhsg+Wf
         v4mYuFougjplS1KYa0ZuEiBHZql5kcAjWLEC2jZUNGyEXSuic7xJNJxfoZXq6X1ocHNd
         uWrKguUFimsSQG9DhKUHBmNwVGXs/MnAg4C9ClGhaqC13ZsUREq8VeC6Be4782x/b3bK
         ncUMX6DRKbM9caBF6X2rQW5S+9gBqpXAqtzB8s8d4A9IqJ1xOuPIi+mR7m0FPyWvQHvE
         krpg==
X-Gm-Message-State: AOJu0Ywq1vceaHSq2yRDimt/jbKobZj+ADHFswI7SGzS7ttosaNSIUgX
	EbWXQnI7aN3f3NktLrwsSVONCR7sm2uccKs10TQ=
X-Google-Smtp-Source: AGHT+IEeyHg1dUDgFZE6ROA2MlEUvrjJFouNC+lSWthpjwRsuxTpjV+ibRRLmcvAGnBUWfF0nMVdlg==
X-Received: by 2002:a05:6870:2b15:b0:1e0:eb36:a7ed with SMTP id ld21-20020a0568702b1500b001e0eb36a7edmr22601245oab.29.1698335616806;
        Thu, 26 Oct 2023 08:53:36 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id dd4-20020a056871c80400b001ef459c9a72sm479351oac.29.2023.10.26.08.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 08:53:36 -0700 (PDT)
Date: Thu, 26 Oct 2023 08:53:36 -0700 (PDT)
X-Google-Original-Date: Thu, 26 Oct 2023 08:49:23 PDT (-0700)
Subject: Re: [PATCH 6/7] riscv: mm: Always flush a single MM context by ASID
In-Reply-To: <20230910-haggler-barrier-421cefb0cc79@spud>
CC: samuel@sholland.org, alexghiti@rivosinc.com, linux-riscv@lists.infradead.org,
  linux-mm@kvack.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-da5b8de5-35f0-4027-9a4a-fbdb9dc86773@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_085341_927485_27B93B15 
X-CRM114-Status: GOOD (  13.47  )
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

On Sun, 10 Sep 2023 12:46:38 PDT (-0700), Conor Dooley wrote:
> On Sat, Sep 09, 2023 at 03:16:34PM -0500, Samuel Holland wrote:
>> Even if ASIDs are not supported, using the single-ASID variant of the
>> sfence.vma instruction preserves TLB entries for global (kernel) pages.
>> So it is always most efficient to use the single-ASID code path.
>> 
>> Signed-off-by: Samuel Holland <samuel@sholland.org>
>
> On nommu:
> arch/riscv/include/asm/tlbflush.h:59:69: error: 'mm_context_t' has no member named 'id'
> arch/riscv/include/asm/tlbflush.h:61:9: error: implicit declaration of function 'local_flush_tlb_all_asid'; did you mean 'local_flush_tlb_all'? [-Werror=implicit-function-declaration]

I'm getting a few more build issues as well.  One's over here 
https://lore.kernel.org/r/20231026145516.25866-1-palmer@rivosinc.com , 
but I'm also getting 


In file included from /scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/pgalloc.h:11,
                 from /scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/efi.h:13,
                 from /scratch/merges/ko-linux-next/linux/arch/riscv/kernel/setup.c:40:
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/tlb.h: In function 'tlb_flush':
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/tlb.h:18:9: error: implicit declaration of function 'flush_tlb_mm'; did you mean 'flush_tlb_all'? [-Werror=implicit-function-declaration]
   18 |         flush_tlb_mm(tlb->mm);
      |         ^~~~~~~~~~~~
      |         flush_tlb_all
/scratch/merges/ko-linux-next/linux/arch/riscv/include/asm/tlb.h:18:25: error: invalid use of undefined type 'struct mmu_gather'
   18 |         flush_tlb_mm(tlb->mm);
      |                         ^~
cc1: some warnings being treated as errors

>
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
