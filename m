Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C921AEFCE53
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 00:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLDrbgv88ZpoDJ8t5Z8n8IxXcakaeqOLusCXGUMhmc4=; b=uscdZPAvLCP2ds
	Sj7euSYR9+QojzQU4X7GWVNiqf3jryFzlyYKiMLteFw1nxkrObmp/mFVl7l+tfK0cJqaMSO128TfX
	HbA80PPbGs/yB2o4FTwI7iNXLcS+u0rwx1y73zx+pIDxlt3il3pD3QXuER4m+tpItDQJpqTy0USVw
	TsXEgHngx4lfrx/Zi7Y7ms1SidgcBoRmMMGwqBxWxOn8NLrhtaL2uHcCyF4G2o6OZLKTbeY+BB71s
	9wpvDHOK10/wU6EOga6ExCvDtQ/ynt6jqMClUZB8AJ3wQ1YGtCAVFnkln/31HThNovE69zJ1x6SaX
	FFbs4zokGpxwBXgKmBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxx2u-00000000ikd-0Fpk;
	Thu, 05 Mar 2026 00:58:32 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxx2r-00000000ijI-0Mqj
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 00:58:30 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-126ea4e9694so3573587c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 16:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772672308; x=1773277108; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V18G0dffShMU4z6G97+zCQkLAwnQ6V/WEvHOERsnHVY=;
        b=fvP1p8IASV5xNoUIOn1pbR0JjK5WpnVefjOxu4O1jS3/0itqAlu7Whw8xlrWsPa8X9
         scBlI7a6AzkwaYDUAXRZHdETgirlvDAbr+nZvK1BLU7NIaAsSmsPX3UEDhxn9Qknu+ZC
         UCOUL6tb0aByZ1d1oDzWO4kEyPg5FgDrVXD2d/GB+oeATP4KxNv4etyO38RAXyZp9kGs
         kZNfZQ4o1f0+3IvK2f6bz+iusPQ9odw4Ujt0PlOteXLvmY9oCSo0kqdDyT3G0EYXtKO8
         zRSb6xCYYDH8Js1rQ7ccu5A74uwYPwSw+CmuITDB40JXvC64x70p9lzpizi3xQFFHIbF
         sqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772672308; x=1773277108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V18G0dffShMU4z6G97+zCQkLAwnQ6V/WEvHOERsnHVY=;
        b=ICNL5ef5UJLDh7thWS0DsYYHR98CtdV5o7K9ZUWlFH+u1qlynpbRLwub/qtRx+4Jr+
         Tifhug3bBwrXYBEFt7MctZgtgrX2YGTLA1zSD7YL3hfGUTu4kRNbWhQyxOu+ZaF0iJ2N
         7txq1Xyh4IzONoK7DHNDeYO2CZeqipEAj150Fu4xt3i3ZAUMW07hrkVw5tGOSpemjsqP
         yr5/x0uUXEmDkVQ3aji8MJujXhc0x3BOiIwhsS8367U1AF03mbrAuCkl3kU0Qf6R9QSs
         ITpBorlYpU68fixp/z/apHU0rCY9jZu7vzRRzGVQp6+n7PSRw/ONqc/z+alH0hnuYmLu
         l7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Uq+ncX9wuioHJU0npIruagN6Y7T+kqJgCWgw9uB+Z8JNTWCIJ48vTHQl+m/BGbqQxpyKgj6N/jHbAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPD3sWNSHs0DtZT7rJsCs70WP+pvkLa83L16j235Jfuun/4WHo
	FPQyhaJt7NcIfeZDKMNU93uOzNXHDFUNa+wH3O/Qss6EGeet7eL+uUHn
X-Gm-Gg: ATEYQzxguCLIwZAvkZN60PCOSL19RWbuUTbCvhLT3izvMMuK2CSsejmWY/MMLuF07y+
	8NJ/MLejGOtD4eym1Rd6YdDQcqzUOMZMEdWG1XN2r3An1nZ+UHLi9rkMza1cBKHIzEi9l+oqnsb
	5/1Nv5G1qD+m/+yGP1bge3vbvaRwDMmcU/YhIDa+S3qioHlb6JMQH1B+r4NUOc7Kd434M93KCKJ
	jTgYjVMuXiOVhiGEZfz50gLNZHO6djNghWm7dVggqR3U2wUC6TVDNSqkP3e0fS+7XXmPrdBF/xk
	owqFmlS8XNEQZTC8l77GC5qxp0pIVsoB5oQW/ZJ611F7ek0aY/6dR8fsIEhYtEKq8Zk6iPms+50
	YjBe6H2TL4p4pBBIz1sdpqNOelOfH0hK3YK5Ki2EEFdixOPBt1fIBkC9y7+LUvUnPpZv2RJDFKb
	vTcMMygyzqfg31kv8w0hNU6/0=
X-Received: by 2002:a05:7022:525:b0:119:e56b:9590 with SMTP id a92af1059eb24-128b70d11bdmr2303907c88.21.1772672307447;
        Wed, 04 Mar 2026 16:58:27 -0800 (PST)
Received: from inky.localdomain ([2601:647:6700:64d0::5c10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be381d5ae9sm1164212eec.26.2026.03.04.16.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:58:26 -0800 (PST)
Date: Wed, 4 Mar 2026 16:58:24 -0800
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guodong Xu <guodong@riscstar.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 00/11] riscv: hwprobe: Introduce rva23u64 base
 behavior
Message-ID: <20260305005824.GA132269@inky.localdomain>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_165829_134686_331DD2A6 
X-CRM114-Status: GOOD (  23.89  )
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

On Thu, Feb 05, 2026 at 06:23:38PM -0600, Andrew Jones wrote:
> Users need a way determine that their harts conform to rva23u64 that
> isn't error-prone. While patches 2 and 6 make it possible to determine,
> it requires a bunch of probes and checks themselves (see patch9 for the
> recipe). This RFC proposes adding an RVA23U64 hwprobe base behavior
> (patch8) allowing easy determination. It also proposes adding the bases
> to /proc/cpuinfo (patches 10 and 11) -- but those two patches are probably
> even more RFCy than the hwprobe proposal...
> 
> The first three patches have been posted previously by their respective
> authors and are currently under active review (except patch2 which
> appears to have gotten lost in the shuffle). I've collected these
> patches into the series since they're necessary for the base and
> because I wanted to repost patch2 and patch3 with some changes. patch4
> and patch6 expose more extensions to userspace. patch9 adds a consistency
> test for the new hwprobe base behavior bit.

Great series! Thanks for pulling these all together, I like this
direction. We had dropped patch2 because we were using it for some
misaligned access optimizations but then realized that the extension
wasn't useful for that so then the patches got lost.

In Linux 7.0, patch 1 got applied along with CFI using the first flags of
the second key so there is some rebasing to do.

I think putting the compatibility info in /proc/cpuinfo is a good idea.
There is always hesitance around /proc/cpuinfo because some ill-advised
programs try to parse information from it, but it is nice to have an
easy way for users to see the compatility and since you also added the
hwprobe interface for it this seems reasonable.

- Charlie

> 
> Thanks,
> drew
> 
> 
> Andrew Jones (8):
>   riscv: Add B to hwcap
>   riscv: hwprobe.rst: Replace tabs with spaces
>   riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to hwprobe
>   riscv: Export have_user_pmlen* booleans
>   riscv: hwprobe: Introduce rva23u64 base behavior
>   riscv: selftests: hwprobe: Check rva23u64 consistency
>   riscv: /proc/cpuinfo: Add rva23 bases to output
>   riscv: /proc/cpuinfo: Also output rva20 and rva22 isa bases
> 
> Charlie Jenkins (1):
>   riscv: Standardize extension capitilization
> 
> Jesse Taube (1):
>   RISC-V: Add Zicclsm to cpufeature and hwprobe
> 
> Paul Walmsley (1):
>   riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1
> 
>  Documentation/arch/riscv/hwprobe.rst          |  42 ++-
>  arch/riscv/include/asm/cpufeature.h           |  14 +
>  arch/riscv/include/asm/hwcap.h                |  23 +-
>  arch/riscv/include/asm/hwprobe.h              |   3 +-
>  arch/riscv/include/asm/switch_to.h            |   4 +-
>  arch/riscv/include/uapi/asm/hwcap.h           |   1 +
>  arch/riscv/include/uapi/asm/hwprobe.h         |   9 +-
>  arch/riscv/kernel/cpu.c                       |  38 +++
>  arch/riscv/kernel/cpufeature.c                | 168 ++++++++++--
>  arch/riscv/kernel/process.c                   |  12 +-
>  arch/riscv/kernel/sys_hwprobe.c               | 249 +++++++++++++-----
>  arch/riscv/kvm/main.c                         |   2 +-
>  arch/riscv/kvm/vcpu_fp.c                      |  28 +-
>  arch/riscv/kvm/vcpu_onereg.c                  |  22 +-
>  arch/riscv/kvm/vcpu_vector.c                  |  14 +-
>  .../testing/selftests/riscv/hwprobe/hwprobe.c | 112 +++++++-
>  .../selftests/riscv/hwprobe/which-cpus.c      |  20 +-
>  17 files changed, 610 insertions(+), 151 deletions(-)
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
