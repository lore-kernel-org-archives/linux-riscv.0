Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD173D3A679
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 18:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nzgg8JW1hE0xDU44yT5tw1bXfmmwDW106i6K/MnOiLU=; b=bexTuq7eGRg2sL
	F9uT3upOjl9MCiD8F8POhDS4+KYOH6PSyf8yKrnWSwNx5o+1QSJPghhCkg7SupBMSDrQBASE/0e7r
	fWzKtYHNMHqCapk+GwELHzz9drYufA6lNFgzOEaNqSQ/KTLNLPVilwbDQ6Ln00DGuyZsWC+8fxJwT
	UAqxM5byZXH2JQRLtI3HHrV/cm7L/UmFTB1nSYzT61nYdmgGKozJCV5p1MGAOePMJNiQLigBIdPfz
	fmUK3j2nTMP8asahaF+ukCvtuwdsDPXz0zm0uTTjaGMrHAwxQ1Tq4WS8vx5/2wFyyxRwgo420xoC1
	VKJKeICAncg8w3p1xQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qZM-0000000FRSN-0De6;
	Tue, 29 Oct 2024 18:03:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qXf-0000000FRMR-1Its
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Oct 2024 18:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=BoW6s+rUCxUCpZyfIxwEwxTIMi7q9DopWXIdFHkjBrE=; b=bR6nDfxB1hhehU70dr4SUp3Zro
	sRaLn4/xTeXpSHwcharZsVCVR2CxxTwZqgJLRYRWgDhAZGNY/mUgrdqit+4SBRIhGa51+H5r94MwA
	OsAz044MjRSDvc6EIxAgl6hTpjALsqueIZ2acJAMMfFNPedtk9rE44A0gAtrkmbnX2bbV71Bq1tp8
	quNGHRc+9JjN/unVPv9dPj4BwsHJRay5B1ZEGH/Gio5LLEM1I102RwUhtrcgIlTb7HSxc1wgd2dSO
	4DWbmqXoalKYhPqUyXC1vb8kEyeCe5diMLBIeP1dOWP8nZhtncHEXS/D+e/TTjKs4X8ev6PXPYsWZ
	0PHwMBRg==;
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qXa-00000009yfE-2Pe9
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 18:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1730224912; bh=BoW6s+rUCxUCpZyfIxwEwxTIMi7q9DopWXIdFHkjBrE=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=IudIr2YdDAKQrPcMKAZX1dhHM6jIYdZrEYbi59eQvzUDK8gVxrcN7v2NTW4tczbk7
	 LlTg99jC5nkNHr51UAtEFw3EKlbyhMgxzvOz64P6xdHtFcxT4U0b9tGsApMvG92uxW
	 usrjBFE838vERdunUEPBxVR7tP9CT1AbZ1Rce8dk=
Received: from smtpclient.apple ([2408:8207:18a1:fd20:752a:71a:7814:8c66])
	by newxmesmtplogicsvrszc25-0.qq.com (NewEsmtp) with SMTP
	id 250884F; Wed, 30 Oct 2024 02:00:37 +0800
X-QQ-mid: xmsmtpt1730224837t1sqy8vre
Message-ID: <tencent_B953631642161A5BF9B004D1B4931C2D7109@qq.com>
X-QQ-XMAILINFO: M3cUO7vMX4chu1q7adTHRfrbAh6OiaqnsY91xlCkkq6QmsjwEojYKsEQB+6Ory
	 FWqX+3YSQqfTF1NE6Dr3UxffZuUlExaE/jTqRIUSVh6b834awdrxZAlCBkWN9WmSLfo85eoDPNua
	 xSvN1Uc71y6MIwlLQUDdJechzgXcBLF4SpehjEbgSTSG/nv2jk3fgjEJUBBt6RPxkO9UulvQ9d23
	 hTP53I6auLoCc2J3gNvOhGksS9+IScNYIVuZQJMwe9tnxssqE1YUnLh2KiHfYDzFmTPxzRijTQeX
	 7q4AHZsaYZD1q0Kt+4b2VmHNY8yQRx9SEXWGBce2Klqs77m3p6A7oCUPFZbUfHJD87shOsE5orhV
	 dVkdufvv61ZK5lfmAGSgUG/p2uogr4xDySgMZGh/41qVzAwVgyGE7Smu0OkG6z8NGWOM6JgrK4dd
	 TM7YU78HSogBmdMvRFG1TIrIl17UE090SMQHwJZPpHDfWbc3qCupVcZ8HTZoc6N281DTA2FuTeII
	 /gWijiIp6mx+K1RrOnvOD3SqYu8gYXq1u4BmYLbHAzEfc2Otr+fls8bEzHbWPavqtDIl+v2uv7eP
	 PI/f7zbvnpEmy7FRARb0V72PC+F+jLxInhkjZwU3/JgZfOAlbYFrZxXRQniZZ6yAdDBhI11KMGy6
	 Tk8ayl6U9z5Sfk8aGp/IbVobm9SifxFnDa56qS5sOc2VCUxjgCSpe2S89rpQSjiG90IHzhZPqnry
	 AjWdVwSHgF2qIk7gzdvxs1ed2rGxBRG5Lm63ZEYOzCVMrJYfqiIrSOkLnK9iuoneWJoyufZ7riHs
	 fL6U4QK/0fPv9ktofUkzKYumo2Lzp99bzKcQV1GxnIKfQSxBSlk3uuxZXTZlgcNZ0Y2r/Gg8bPkJ
	 PMZYvfA8k1bQFneDMIIEKAvKOzfpSfRY3o4XVYK5U80dWRB6pgyMkTNoDfkCgY06mp6wY8QT7Bx+
	 /zQCC9fVTmJKwelKTpUGELPaQx2xqGrJ+rXuSN0+43GyOTYOFtQj0JtmbO+kohwxdxe6BCFSRKrx
	 PzIKir29jqrNXU7ZfA
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v10 10/14] riscv: hwprobe: Add thead vendor extension
 probing
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240911-xtheadvector-v10-10-8d3930091246@rivosinc.com>
Date: Wed, 30 Oct 2024 02:00:26 +0800
Cc: linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
X-OQ-MSGID: <F7EC0D4B-419A-400B-BB28-CB0CC709DB6C@cyyself.name>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
 <20240911-xtheadvector-v10-10-8d3930091246@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
 Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Evan Green <evan@rivosinc.com>,
 Andy Chiu <andy.chiu@sifive.com>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_180203_309349_7ED9FA3C 
X-CRM114-Status: GOOD (  28.31  )
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


On 9/12/24 13:55, Charlie Jenkins wrote:
> Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
> allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
> vendor extension.

I believe it's more advantageous to use RISCV_HWPROBE_KEY_VENDOR_EXT_0
to ensure that this key is shared with all vendors. Subsequently,
mhartid can select the specific vendor. Each vendor can allocate
its own extension space within the bitmask.

Therefore, we won't require the addition of a new hardware probe
key for a new vendor in the future.

RISC-V C-API chooses a similar design.

Link: https://github.com/riscv-non-isa/riscv-c-api-doc/blob/main/src/c-api.adoc#extension-bitmask

> This new key will allow userspace code to probe for which thead vendor
> extensions are supported. This API is modeled to be consistent with
> RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
> corresponding to a supported thead vendor extension of the cpumask set.
> Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
> to determine all of the supported thead vendor extensions in one call.
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwprobe.h                   |  3 +-
>  .../include/asm/vendor_extensions/thead_hwprobe.h  | 19 +++++++++++
>  .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
>  arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
>  arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
>  arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
>  .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
>  8 files changed, 88 insertions(+), 2 deletions(-)
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index ef01c182af2b..6148e1eab64c 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * Copyright 2023 Rivos, Inc
> + * Copyright 2023-2024 Rivos, Inc
>   */
>    #ifndef _ASM_HWPROBE_H
> @@ -21,6 +21,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
>  	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
>  	case RISCV_HWPROBE_KEY_IMA_EXT_0:
>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
> +	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
>  		return true;
>  	}
>  diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> new file mode 100644
> index 000000000000..65a9c5612466
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +
> +#include <linux/cpumask.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +
> +#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
> +#else
> +static inline void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair,
> +						  const struct cpumask *cpus)
> +{
> +	pair->value = 0;
> +}
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> new file mode 100644
> index 000000000000..6b9293e984a9
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2024 Rivos, Inc
> + */
> +
> +#ifndef _ASM_RISCV_SYS_HWPROBE_H
> +#define _ASM_RISCV_SYS_HWPROBE_H
> +
> +#include <asm/cpufeature.h>
> +
> +#define VENDOR_EXT_KEY(ext)								\
> +	do {										\
> +		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_VENDOR_EXT_##ext)) \
> +			pair->value |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
> +		else									\
> +			missing |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
> +	} while (false)
> +
> +/*
> + * Loop through and record extensions that 1) anyone has, and 2) anyone
> + * doesn't have.
> + *
> + * _extension_checks is an arbitrary C block to set the values of pair->value
> + * and missing. It should be filled with VENDOR_EXT_KEY expressions.
> + */
> +#define VENDOR_EXTENSION_SUPPORTED(pair, cpus, per_hart_vendor_bitmap, _extension_checks)	\
> +	do {											\
> +		int cpu;									\
> +		u64 missing = 0;								\
> +		for_each_cpu(cpu, (cpus)) {							\
> +			struct riscv_isavendorinfo *isainfo = &(per_hart_vendor_bitmap)[cpu];	\
> +			_extension_checks							\
> +		}										\
> +		(pair)->value &= ~missing;							\
> +	} while (false)										\
> +
> +#endif /* _ASM_RISCV_SYS_HWPROBE_H */
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index b706c8e47b02..452d0b84f17f 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * Copyright 2023 Rivos, Inc
> + * Copyright 2023-2024 Rivos, Inc
>   */
>    #ifndef _UAPI_ASM_HWPROBE_H
> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>  #define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
>  #define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
> +#define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	9
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>    /* Flags */
> diff --git a/arch/riscv/include/uapi/asm/vendor/thead.h b/arch/riscv/include/uapi/asm/vendor/thead.h
> new file mode 100644
> index 000000000000..43790ebe5faf
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/vendor/thead.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +#define		RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 8d1b5c35d2a7..5a3dc8e66c85 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -15,6 +15,7 @@
>  #include <asm/uaccess.h>
>  #include <asm/unistd.h>
>  #include <asm/vector.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
>  #include <vdso/vsyscall.h>
>    @@ -241,6 +242,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		pair->value = riscv_timebase;
>  		break;
>  +	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
> +		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> +		break;
> +
>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
>  	 * call, but get their element key set to -1 and value set to 0
> diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
> index 353522cb3bf0..866414c81a9f 100644
> --- a/arch/riscv/kernel/vendor_extensions/Makefile
> +++ b/arch/riscv/kernel/vendor_extensions/Makefile
> @@ -2,3 +2,4 @@
>    obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
> +obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
> diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> new file mode 100644
> index 000000000000..2eba34011786
> --- /dev/null
> +++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <asm/vendor_extensions/thead.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
> +#include <asm/vendor_extensions/vendor_hwprobe.h>
> +
> +#include <linux/cpumask.h>
> +#include <linux/types.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +#include <uapi/asm/vendor/thead.h>
> +
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
> +{
> +	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
> +				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
> +		VENDOR_EXT_KEY(XTHEADVECTOR);
> +	});
> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
