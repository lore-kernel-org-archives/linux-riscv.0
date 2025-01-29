Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36ECC02192
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 08:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4thdwtvEVFHKwFuhXTCBVu7vXKeR/cnLvUamawd+1SE=; b=w9yKiy5HUrgkpqhy755GnfEwJA
	72WBG0AZOIdDdQa9uAprd2+VwXgtXQO06eTsExFbTRudNkSPrAwnnpMGe8ChbZVbfiz7mpEKeOpxw
	9F3HcKhK88nO4ygAuUl0VH86/HO8ZBz1UePSmh38IfIV2GCkwLdUfUw9jCrBIaMWuM0lp8A3EubIC
	1laLPS50iYUGrdQmGn+oJPyhOImk+xZ1h+vUEMcSldhoXrYDDrr6vwMvZAGbrcA5ZHN5hXtyVy5j4
	KtmYNqwNQe1CZWbEViHXg14QUIKi/zmmc+pV5ZkqDv4PLlkO1lff1HGKwUy93xU2o0IT6/USY8lw5
	sudNz5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td3By-00000006X0g-0mks;
	Wed, 29 Jan 2025 08:12:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td3Bv-00000006X0L-0tLN
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 08:12:57 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2167141dfa1so7792485ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jan 2025 00:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738138374; x=1738743174; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lONUrJ6bY6rW44DopvDuoOtVc+vwMWPYLl3whw4FG6A=;
        b=eemyvBNP2k0UvfdNl46BmKjkF6GR3dTYmYic+DraURanZxO6ZhW6z/Zyv9kEoB7+3z
         h38i4YnKxSg0igsG14jOo7LF95cv+NAzYe8jkKMiwQrCSsfce+S+CODLGk66Gk1X3paL
         mtPmv4/HY9AP/hQTDyL/jLSH76VMoa1ITlxSKfjYPb/O8hW/AafulKsXWgW+5wz9M0TM
         EyD+NqGH56xpdXvHZY4JozbZYpfwyS1hADICJ6PlEuFUvNdJUEB39DTwHPGYNXTdyA65
         YK8d+j00BEemQudkIGwrahwR9F/95kFA0fHw4A11p/iqVsaqt73kjUMLGAbCXZhddOPl
         24pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138374; x=1738743174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lONUrJ6bY6rW44DopvDuoOtVc+vwMWPYLl3whw4FG6A=;
        b=j/zZg0I0boYGfJhWUcSwZH6JXYFEfNCnInzBwTid/AJpCaS3He5ejZijpcmEy398l2
         HUiqUJdCppnz/r1JR01IGpJ5ynuoKp/b5eKN6F9ak/bpco7SJPo+avP6NCAIaYuGU9EX
         6RjCPJssQe+F4DD+Lyxo0uMDUV0nctU8s6hgzq+Jg1BxW2oJEr1EythlLCWnmZNC7Soo
         v/vSQIuyD8dgbRTYy62eYkDrseHN0ENZgktnb9vfnNIomo+pa1jlkZ8xQyWxPBiGkBzA
         U6XFbnjtr+V68P8E8ih1cmQdUBiHAQp/IiVRMwKFN7slTW1VRbsFmV7EWTBmHLi+UzR0
         YeEA==
X-Forwarded-Encrypted: i=1; AJvYcCWgcHVNWOt0dd2bKgQAs9eOyG1iyez3YUHky/CvR7cgP0HXBaYfGatERRoVRt9VTKK1Bikd5f3iDNry2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxH7JDDFm4U3pQsiG1h4xxpBeYV9oaP5tXIqDfFzsaaUhGJgKuK
	LL/UsXOVj0tbf4hCY9MysrAaETcgnYT+p6OPzqQhrFbEMxibKNPAbS3Jitaep60=
X-Gm-Gg: ASbGnctA59bIAGlAyV0/ShPB0ISCx3Fojmc+3ffqI6/FC3rUbhsm/kylQp7cK/MOA49
	czQGl6bHa2lFjzD3jOCC2vihykE/18+cGoNSnTMV+FYGkWSL1Eb0wcjZc97RJPH6UB9axc7dUbJ
	W5xRev4jsUEmrzqJ/Z3ay8k0zn6DW4Z0Xn/DrXfQKiHRapOZw9Uy1+7tY2gk2xnPTvYnpEQEuag
	XF1NNH4P2wwjS6nkWeA+AgpiQwmHwpFGJuxpmNBUj+KgoO6EFlQE3XtJCPuoZpM2MpDlmJCYIiu
	Szoh3K8i3NOMqMPMOzKYxoo6vg==
X-Google-Smtp-Source: AGHT+IHOFOqJqaMxE3ADC0JCeH82o6gIoKQpwmMpDhJUTNFG6NWH0EKs8mqdVa0m8D3IMcQ55Fo/2A==
X-Received: by 2002:a17:902:cf09:b0:215:758c:52ea with SMTP id d9443c01a7336-21dd77571admr39887575ad.9.1738138373863;
        Wed, 29 Jan 2025 00:12:53 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9d98esm93882395ad.36.2025.01.29.00.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:12:53 -0800 (PST)
Date: Wed, 29 Jan 2025 00:12:51 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V5 0/3] riscv: mm: Add soft-dirty and uffd-wp support
Message-ID: <Z5njA9SLWxlRYgow@debug.ba.rivosinc.com>
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_001255_517199_6458904E 
X-CRM114-Status: GOOD (  20.47  )
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

On Wed, Nov 13, 2024 at 05:58:30PM +0800, Chunyan Zhang wrote:
>This patchset adds soft dirty and userfaultfd write protect tracking
>support for RISC-V.
>
>As described in the patches, we are trying to utilize only one free PTE
>bit(9) to support three kernel features (devmap, soft-dirty, uffd-wp).
>Users cannot have them supported at the same time (have to select
>one when building the kernel).

Why do we expect a user won't be using all these three kernel features
(devmap, soft-dirty and uffd-wp). I do understand the part that their
interaction with each other is mutually exclusive but their usage (from
an user's perspective) is not mutually exclusive. So forcing this choice
on user at kernel build time is way too restrictive. Additionally this
forces distros to carry 3 different builds (they dont know which user is
expecting to use which kernel build).

As an example if I were running microVMs to host something like serverless
(lambda), I could be taking live snapshots and that would require me to
enable uffd-wp. At the same time I could be using criu to snapshot some
task.

Locking in at the kernel build time takes that choice away.

IMHO, this should be done in a way which doesn't take away the choice
from user. And if there is no choice left from sw workaround perspective,
then right approach would be to ask RISC-V to cough-up more RSW bits.

>
>This patchset has been tested with:
>1) The kselftest mm suite in which soft-dirty, madv_populate,
>test_unmerge_uffd_wp, and uffd-unit-tests run and pass, and no regressions
>are observed in any of the other tests.
>
>2) CRIU:
>- 'criu check --feature mem_dirty_track' returns supported;
>- incremental_dumps[1] and simple_loop [2] dump and restores work fine;
>- zdtm test suite can run under host mode.
>
>This patchset applies on top of v6.12-rc7.
>
>V5:
>- Fixed typos and corrected some words in Kconfig and commit message;
>- Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste error;
>- Added Alex's Reviewed-by tag in patch 2.
>
>V4:
>- Added bit(4) descriptions into "Format of swap PTE".
>
>V3:
>- Fixed the issue reported by kernel test irobot <lkp@intel.com>.
>
>V1 -> V2:
>- Add uffd-wp supported;
>- Make soft-dirty uffd-wp and devmap mutually exclusive which all use the same PTE bit;
>- Add test results of CRIU in the cover-letter.
>
>[1] https://www.criu.org/Incremental_dumps
>[2] https://asciinema.org/a/232445
>
>Chunyan Zhang (3):
>  riscv: mm: Prepare for reusing PTE RSW bit(9)
>  riscv: mm: Add soft-dirty page tracking support
>  riscv: mm: Add uffd write-protect support
>
> arch/riscv/Kconfig                    |  34 ++++++-
> arch/riscv/include/asm/pgtable-64.h   |   2 +-
> arch/riscv/include/asm/pgtable-bits.h |  31 ++++++
> arch/riscv/include/asm/pgtable.h      | 133 +++++++++++++++++++++++++-
> 4 files changed, 197 insertions(+), 3 deletions(-)
>
>-- 
>2.34.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
