Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F16C54731
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 19:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUGR86DW+dWzbpe3m1YqQ4L2AbnQtQ99khCek1RL4lI=; b=0cbPviNrH2EIib
	S9ccsE+kQACL+ryyHJ6hZGy3NCdMgA/wYwgsMGSlahINsLWiH01+8P5ni6nyLcs5M8txgcFKg4oSo
	IuY6AJhEUclYhGF42FIhYND2kURA7LFwFhVHMSnDi3vDpzhcB85x3yfzGqYrjGqJJn4Ci4MbAlRZv
	PrJeMFKY8Bqeux2HIAFOnrTO8T3CMS+rz99ReMD3fYlcxGJHUne8Yjl6w1EKB3j61DVThl5jMhOPA
	tse8XXJPKv7AagkkKueK5yfGzeC+DC69xHceiFv9kl1C6wfj2NcpLDbOuwCQ/2XZ3WieQT8mjp2P0
	9EcVgjGP9itkrwdtiOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj1yo-0000000CePY-2Yjm;
	Tue, 27 Aug 2024 19:35:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj1yk-0000000CeO6-1a1P
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 19:35:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20219a0fe4dso58822045ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 12:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724787345; x=1725392145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rFPAN19RA1hvKHrQkmp/NKYMnPJaVA3/YimxO7ZXHeE=;
        b=1w0QsyubM5av2jPhcBIvMPF0Atigae+unSFiu2R6YGBKtkfbLMamugDjiP0Rq4zXXr
         s+TyeG5gMIKG6EPJ5dXtO9Aoes5iuBnF/HHzem+X3wf0kQwXcHi5ojvsxSxi1hDjgQf5
         u28LD7BzIs0LvO1+dJu1Jj780+00mOoQPeiRT1gaim3iLdtF5KU0PxXuGYpz/GdunFI/
         q8ZJfKXXUReOJuKsQtfClkUkfpNM17F+osIWHwopuiaUbc2ud4GLvHfNpCT6XEYF4uhW
         pDIbCQjAZ/7HrSUGMKsvcfLVpANdpRva+tqPzU0U1RPdMjl1ZMXRac1Gip/kPsfCu5vX
         FMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724787345; x=1725392145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFPAN19RA1hvKHrQkmp/NKYMnPJaVA3/YimxO7ZXHeE=;
        b=joAf+R2f8xT0S2W4eJnaJNTRsAZousdvYnAKO+AZzU7lDaC0UAzf0004e0xe8ZsN9h
         h5sEW+Wrol68WWjeBaUfzeRDasNBxhn777zKy9jaAM0X5U4A00IIKhPZ/eSgOimqvo+e
         4166UCxKCF+Gh+bOR5PdBY7Mr4OaE+gWdC1zFWYdTIrVmBRzRQhVaXLv04dkikhm+5Ga
         D/rebHgHW7bqN06DKzIjDddbelrvriNTwtURDNePxNgiem/0T/MevktHh1de7OAf66vl
         VmhIaLm/7lQp3jyRzSnJhgIKVe/vtvsN7f7mGpdN35snwjsr7EAzzeQUOBU/pDWj+X3Q
         g+Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXjbzbLTrx45cnMs4Kx/wtbMTBNcZPEoH/ihiZxcWNbuHlV/77qswrHSznFclYgyr0XPfmkzip+O6FsVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw84b+B+S5wXVcF26ygfXf+jp89cb+MjY17zsq25JlAL0nh+PIT
	83kaHZWrQ53tiEjyVgo9kBnl/27PC85t3t4bVg3B3euMgT7gFLSrD138vUa1gLs=
X-Google-Smtp-Source: AGHT+IGCXPfghiRA1yNRvhmr+OG3R75Wa/zdLSP/YBTbifITsP8BB2EzUmqixr8vg7m1QBie0YNejQ==
X-Received: by 2002:a17:903:22cb:b0:203:a034:c2e with SMTP id d9443c01a7336-203a0340c9cmr162046725ad.21.1724787344884;
        Tue, 27 Aug 2024 12:35:44 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385581165sm87277375ad.88.2024.08.27.12.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 12:35:44 -0700 (PDT)
Date: Tue, 27 Aug 2024 12:35:41 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>,
	Levi Zim <rsworktech@outlook.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>, linux-doc@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/3] RISC-V: mm: do not treat hint addr on mmap as the
 upper bound to search
Message-ID: <Zs4qjejI2PzLrI5M@ghost>
References: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
 <mhng-a7dcdfb5-0232-4ffb-8a20-13e564904da1@palmer-ri-x1c9a>
 <Zs4BhmB4xOF4LOH9@ghost>
 <tencent_595F628A43601A53F8E00461B5FB1CEB7009@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_595F628A43601A53F8E00461B5FB1CEB7009@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_123546_694531_2AF93C2F 
X-CRM114-Status: GOOD (  48.39  )
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

On Wed, Aug 28, 2024 at 02:04:29AM +0800, Yangyu Chen wrote:
> 
> 
> > On Aug 28, 2024, at 00:40, Charlie Jenkins <charlie@rivosinc.com> wrote:
> > 
> > On Tue, Aug 27, 2024 at 09:33:11AM -0700, Palmer Dabbelt wrote:
> >> On Tue, 27 Aug 2024 01:05:15 PDT (-0700), cyy@cyyself.name wrote:
> >>> Previous patch series[1][2] changes a mmap behavior that treats the hint
> >>> address as the upper bound of the mmap address range. The motivation of the
> >>> previous patch series is that some user space software may assume 48-bit
> >>> address space and use higher bits to encode some information, which may
> >>> collide with large virtual address space mmap may return. However, to make
> >>> sv48 by default, we don't need to change the meaning of the hint address on
> >>> mmap as the upper bound of the mmap address range. This behavior breaks
> >>> some user space software like Chromium that gets ENOMEM error when the hint
> >>> address + size is not big enough, as specified in [3].
> >>> 
> >>> Other ISAs with larger than 48-bit virtual address space like x86, arm64,
> >>> and powerpc do not have this special mmap behavior on hint address. They
> >>> all just make 48-bit / 47-bit virtual address space by default, and if a
> >>> user space software wants to large virtual address space, it only need to
> >>> specify a hint address larger than 48-bit / 47-bit.
> >>> 
> >>> Thus, this patch series change mmap to use sv48 by default but does not
> >>> treat the hint address as the upper bound of the mmap address range. After
> >>> this patch, the behavior of mmap will align with existing behavior on other
> >>> ISAs with larger than 48-bit virtual address space like x86, arm64, and
> >>> powerpc. The user space software will no longer need to rewrite their code
> >>> to fit with this special mmap behavior only on RISC-V.
> >> 
> >> So it actually looks like we just screwed up the original version of this:
> >> the reason we went with the more complicated address splits were than we
> >> actually started with a defacto 39-bit page table uABI (ie 38-bit user VAs),
> >> and moving to even 48-bit page tables (ie, 47-bit user VAs) broke users
> >> (here's an ASAN bug, for example:
> >> https://github.com/google/android-riscv64/issues/64).
> >> 
> >> Unless I'm missing something, though, the code doesn't actually do that.  I
> >> remember having that discussion at some point, but I must have forgotten to
> >> make sure it worked.  As far as I can tell we've just moved to the 48-bit
> >> VAs by default, which breaks the whole point of doing the compatibilty
> >> stuff.  Probably a good sign I need to pay more attention to this stuff.
> >> 
> >> So I'm not really sure what to do here: we can just copy the arm64 behavior
> >> at tell the other users that's just how things work, but then we're just
> >> pushing around breakages.  At a certain point all we can really do with this
> >> hint stuff is push around problems, though, and at least if we copy arm64
> >> then most of those problems get reported as bugs for us.
> > 
> > Relying on the hint address in any capacity will push around breakages
> > is my perspective as well. I messed this up from the start. I believe
> > the only way to have consistent behavior is to mark mmap relying on the
> > hint address as a bug, and only rely on the hint address if a flag
> > defines the behavior.
> > 
> 
> I agree with this. However, since we already have this behavior on
> x86 and aarch64 for quite a long time, to prevent breaking userspace,
> I think we can use this patch and then add a flag like MAP_VA_FULL
> to enable full va address in the future.

Since riscv is not x86 or aarch64, we should be able to make decisions
that are best for riscv regardless of if it is identical to how it is
implemented in x86 or aarch64.

- Charlie

> 
> Thanks,
> Yangyu Chen
> 
> > There is an awkward window of releases that will have this "buggy"
> > behavior. However, since the mmap changes introduced a variety of
> > userspace bugs it seems acceptable to revert to the previous behavior
> > and to create a consistent path forward.
> > 
> > - Charlie
> > 
> >> 
> >>> Note: Charlie also created another series [4] to completely remove the
> >>> arch_get_mmap_end and arch_get_mmap_base behavior based on the hint address
> >>> and size. However, this will cause programs like Go and Java, which need to
> >>> store information in the higher bits of the pointer, to fail on Sv57
> >>> machines.
> >>> 
> >>> Changes in v3:
> >>> - Rebase to newest master
> >>> - Changes some information in cover letter after patchset [2]
> >>> - Use patch [5] to patch selftests
> >>> - Link to v2: https://lore.kernel.org/linux-riscv/tencent_B2D0435BC011135736262764B511994F4805@qq.com/
> >>> 
> >>> Changes in v2:
> >>> - correct arch_get_mmap_end and arch_get_mmap_base
> >>> - Add description in documentation about mmap behavior on kernel v6.6-6.7.
> >>> - Improve commit message and cover letter
> >>> - Rebase to newest riscv/for-next branch
> >>> - Link to v1: https://lore.kernel.org/linux-riscv/tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com/
> >>> 
> >>> [1] https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/
> >>> [2] https://lore.kernel.org/linux-riscv/20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com/
> >>> [3] https://lore.kernel.org/linux-riscv/MEYP282MB2312A08FF95D44014AB78411C68D2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM/
> >>> [4] https://lore.kernel.org/linux-riscv/20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com/
> >>> [5] https://lore.kernel.org/linux-riscv/20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com/
> >>> 
> >>> Charlie Jenkins (1):
> >>>  riscv: selftests: Remove mmap hint address checks
> >>> 
> >>> Yangyu Chen (2):
> >>>  RISC-V: mm: not use hint addr as upper bound
> >>>  Documentation: riscv: correct sv57 kernel behavior
> >>> 
> >>> Documentation/arch/riscv/vm-layout.rst        | 43 ++++++++----
> >>> arch/riscv/include/asm/processor.h            | 20 ++----
> >>> .../selftests/riscv/mm/mmap_bottomup.c        |  2 -
> >>> .../testing/selftests/riscv/mm/mmap_default.c |  2 -
> >>> tools/testing/selftests/riscv/mm/mmap_test.h  | 67 -------------------
> >>> 5 files changed, 36 insertions(+), 98 deletions(-)
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
