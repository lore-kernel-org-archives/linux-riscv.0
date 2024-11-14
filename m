Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CC8D41C3A
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Nov 2024 04:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4SWQ6r4OcfuimNEkHj5cyxa/V3hAS+OuvSFkohYgMJQ=; b=WZspWgyoMCUWLj
	COSwHZjydjAFpgPlqcVjcxOfC71uSEwuvMKH2uvCcleTmv3FDrBRVDQT86CqOBRErd1lJ3Z9upm0R
	beGIDKJ0G8GYWR81fX+qhQQdNSqBjzO2uz45P35AHB4NwsrOZ+tE1jF2UQ1yESdN7NyRRcBTIuD3C
	an8TmI2963nNHncmPWVMdoOgHsyAshsEHuV+ShUApPahQM6lZ+A/X1oICal5Bres30HpP+6fKjvhk
	XgOmLg6Y2yDWecySvoY1nbfZkAFyc1v6GZNlqpzzYgxi/s+eH8tr4KFCcoR23ANAINiAkhULwmY9R
	MZVmojDoXXD8We/BT72g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBRkL-00000008nLH-3tpH;
	Thu, 14 Nov 2024 04:46:21 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBRkI-00000008nKn-2W7a
	for linux-riscv@lists.infradead.org;
	Thu, 14 Nov 2024 04:46:20 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so115039b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Nov 2024 20:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1731559577; x=1732164377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ciPpdd8xZxgVXtxncNlZsl62adjxx/9Ixp3cayb9PO8=;
        b=c0PE89MsqZ93KW2grvoRykc+KgPYubxRCxo2TqrRjSPyVHUcazvwZWxQs47KBfkz5+
         4Ub5n1w0V7w0cbS4VNAV891cfgB3b9DpIcSKLQyu6ltFumTr9ncUD6cyK/RfM7H0nSzO
         sPEqRpRQBBN1Sh6UJLluQYilk2hpJMJpYR5VZuGuoKSCmyS6gVQnODPGZQBOwxG9Xz1B
         3VR0M9UpIq4wyQiRcAHz4YDQHC9LlmmAn4pzSqPwzprAdowrfdVihhpxvFGnC4ghkZ1c
         tLD1QujF9ZU9rKTGS2heJRs55m7t9cL/mvoY+weOc1CRBkpIb87h48j4Nx3gFXnOaWkF
         ZXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731559577; x=1732164377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciPpdd8xZxgVXtxncNlZsl62adjxx/9Ixp3cayb9PO8=;
        b=U5TCKIcJjMPo92emKlJ+HThUKvLXVWL7Mx5O2XFq2Cv8p2Mq1fZA0nvkk1hiEGVJYF
         ahUiq5Jd1KQkelTb/Cz665CFBTiy9eizsWnyE1PaWD8E3MksVj2ZUsSJe1wM4M2XVYxo
         DM0/TzaQjXTaSl1XvIZrSUF+3CZhJ4YeGWZJPV4/Rxj9Hmm1QcoPlnDxrTNDIi6RdCPU
         OW0xJyb1Km2uauhyceI+zYtJamwmA2fp78xumRR5hUN9RnI0u2HUK0lNZnDqL7FeJ1eJ
         Nzhf1EL2U0zgJxmA9YCVDBaGqgekz7J3a9vSA38wXuBEUmJYrYjaxEfWRq8LOp+SOXN+
         HgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN5/pJbJHxYQiDpb0xr5bBAYOfoVJBh7YmmUqqNLYq06nsih7atYhEpnm5FKCdpjwORVVPo6uUTS1HmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNW6ri0TL5GjXW/diC7Tq0tbMvGKWjnq8fM5qrPHPbzX7jZiLu
	iJ5bO3vdhOkZDyu+FHWIrojPs8zxPkAxC57Y7aVE7kVeFFpyepIq4+GNdrayMNc=
X-Google-Smtp-Source: AGHT+IHwmfiSpNRYwoKTDlPVlAYVWz1iKVKE6iuP2huEnhh9oY77ssSAXAPaqGmYjbMQgR+sM8uIAQ==
X-Received: by 2002:a17:90b:37cf:b0:2e5:8392:afe7 with SMTP id 98e67ed59e1d1-2e9b14dc341mr30805661a91.0.1731559576254;
        Wed, 13 Nov 2024 20:46:16 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06f1b17asm264488a91.15.2024.11.13.20.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 20:46:15 -0800 (PST)
Date: Wed, 13 Nov 2024 20:46:12 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 10/14] riscv: hwprobe: Add thead vendor extension
 probing
Message-ID: <ZzWAlJm1ShgsZr4m@ghost>
References: <20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com>
 <20241113-xtheadvector-v11-10-236c22791ef9@rivosinc.com>
 <tencent_5B500856E30E1FB920B6B68D6315EE70CC06@qq.com>
 <ZzVoQi6D0U30p9sg@ghost>
 <tencent_6A95637042401AD5F8BE05C7B4F11CAD7009@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_6A95637042401AD5F8BE05C7B4F11CAD7009@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_204618_934623_947DB80D 
X-CRM114-Status: GOOD (  45.08  )
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

On Thu, Nov 14, 2024 at 11:26:47AM +0800, Yangyu Chen wrote:
> 
> 
> On 11/14/24 11:02, Charlie Jenkins wrote:
> > On Thu, Nov 14, 2024 at 10:44:37AM +0800, Yangyu Chen wrote:
> > > 
> > > 
> > > On 11/14/24 10:21, Charlie Jenkins wrote:
> > > > Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
> > > > allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
> > > > vendor extension.
> > > > 
> > > 
> > > Hi Charlie,
> > > 
> > > How about changing the name of the key from
> > > "RISCV_ISA_VENDOR_EXT_XTHEADVECTOR" to "RISCV_HWPROBE_KEY_VENDOR_EXT_0" and
> > > use marchid to identify what the vendor is, each vendor will have its own
> > > bit definition in this value. So we can avoid adding so many hwprobe keys
> > > for each vendor in the future.
> > > 
> > > I proposed a commit here: https://github.com/cyyself/linux/commit/36390645d85d1ac75dd71172f167719df4297f59
> > 
> > I actually originally had this in one of my first versions of this
> > series but was convinced by Conor to change it. The problem with it was
> > that tying vendor extensions to mvendorid means that it is enforced by
> > the kernel that vendors cannot share vendor extensions. It is possible
> > for vendor A to purchase IP that contains a vendor extension from vendor
> > B. This vendor extension should work on platforms created by vendor A
> > and vendor B. However, vendor A and vendor B have different mvendorids,
> > so the kernel can't support this if it is tied to mvendorid.  It could
> > be solved by duplicating every extension that vendors have, but then
> > userspace software would have to keep in mind the mvendorid they are
> > running on and check the different extensions for the different vendors
> > even though the implementation of the extension is the same.
> > 
> > The original conversation where Conor and I agreed that it was better to
> > have vendor extensions not rely on mvendorid:
> > 
> > https://lore.kernel.org/linux-riscv/20240416-husband-flavored-96c1dad58b6e@wendy/
> > 
> 
> Thanks for your explanation. I will strongly agree with Conor's opinion if
> the feature bitmask does not exist in RISC-V C-ABI.
> 
> However, as the feature mask defined in RISC-V C-ABI[1] uses the design
> depending on marchid currently, should we reconsider this key for its use
> case? The current target_clones and taget_version implemented in GCC[2] and
> LLVM[3] also use the bitmask defined in C-ABI. I think if we use this key
> depending on marchid, to make a key shared with all vendors will make this
> cleaner.

Changing this will break linux userspace API. It is a non-workable
solution for the kernel to associate extensions with marchid/mvendorid
for the reasons provided. I fail to see why this ABI would require the
kernel to behave in this manner. The ABI provides the marchid to be used
by function multi-versioning and applications are free to use the
marchid to change which function they want to compile. However, if they
want to know if an extension is supported, then they need to use
hwprobe. If they want to check if xtheadvector is supported, then they
call hwprobe with the xtheadvector key. This is true no matter what the
mvendorid of the system is. This does not add any complexity, "clean"
code can equally be written following this scheme or following a scheme
that relies on mvendorid. Ditching the reliance on mvendorid in the
kernel allows the kernel to be as generic as possible, and allow
whatever ABIs or hardware that exist to have a resiliant way of
communicating with the kernel.

- CHarlie

> 
> [1] https://github.com/riscv-non-isa/riscv-c-api-doc/blob/main/src/c-api.adoc#function-multi-version
> [2] https://github.com/gcc-mirror/gcc/blob/8564d0948c72df0a66d7eb47e15c6ab43e9b25ce/gcc/config/riscv/riscv.cc#L13016
> [3] https://github.com/llvm/llvm-project/blob/f407dff50cdcbcfee9dd92397d3792627c3ac708/clang/lib/CodeGen/CGBuiltin.cpp#L14627
> 
> > > 
> > > > This new key will allow userspace code to probe for which thead vendor
> > > > extensions are supported. This API is modeled to be consistent with
> > > > RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
> > > > corresponding to a supported thead vendor extension of the cpumask set.
> > > > Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
> > > > to determine all of the supported thead vendor extensions in one call.
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > Reviewed-by: Evan Green <evan@rivosinc.com>
> > > > ---
> > > >    arch/riscv/include/asm/hwprobe.h                   |  3 +-
> > > >    .../include/asm/vendor_extensions/thead_hwprobe.h  | 19 +++++++++++
> > > >    .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
> > > >    arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
> > > >    arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
> > > >    arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
> > > >    arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
> > > >    .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
> > > >    8 files changed, 88 insertions(+), 2 deletions(-)
> > > > 
> > > 
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
