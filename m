Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C810CAC598
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 21:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDRYne1QqFECI0Y0WGS0Yeeq/sDzATTNpr7dyOy1sRc=; b=XfbmbqiPXYiTt7TmBEGoPVTzvI
	9WJpOuxUQ9bQfmEmr64a8n6uh1EjBNkqUm0ZrHUFe/ZZJ057mivLSGk6/MdGYBoQ2o4BTauO3BNkN
	6oRUORkaz2BnfUmvxIXLUD9oM5aDND2GeGkz7dvYv/0glX2L8Fji862A/H/PlxshcNxaLmQeqIqsQ
	ZS0YoU5UgOfkJXq7mZvRXIkAoAJd3qydTRSPzFyqVNNftetXz2/VcJjoYLtFN2umvi12uvRr3vRMT
	VVFsqaNi65TorkmU9KfFU+x/dDUiv2bYfHGCKo8vkRqSxrmRu0Mqj50iokcp0QqTIRABZI7atBJrq
	wrWatFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydg9-00000009Ixu-0gzr;
	Tue, 16 Sep 2025 21:57:37 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uydg6-00000009IxW-2ePB
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 21:57:35 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b4ee87cc81eso5321125a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 14:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1758059854; x=1758664654; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fSsNsg94xTPxgo7mtr0vhLneaLnV1NurRaDsg6aVKxA=;
        b=NRxoinjTfIYsiq1iPTeXobTIc/afdwOAoJkN12gVKaadnLnzNemeogGaww6NKHqes/
         i7+Z0bqWDYaNG4T6rvILBXmGpkwMnD8rz17ONukgCOnB7y4IBk5Sw0cxH4Snh7jK+UqM
         9K1tP/HcmJz9DBczjvKF6nLXb/f08BWiTJrZOdylP8kauCS/iA34pHBb0mEgkt8YEbUz
         ekfMfYadq+gvuHD6w9xidxDfy4pkZaEIPfvquxB+i3vPZec36FETknzER3GpzHA7QUjJ
         TEN7ATEjWHwjHx2IhkbAkD08YdJZjB/J7A56Pu/NIoIFRJvpNcy0HLpGRz1M3GlIY2wH
         N83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758059854; x=1758664654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSsNsg94xTPxgo7mtr0vhLneaLnV1NurRaDsg6aVKxA=;
        b=TMqXEcF+GDKGwSN+tNHP2A+Rn/S+4qc7qIIeKCWKwrrsGVwPxRAAMUXVjofiAd5sjB
         a0zzO2y9+veHPFKkmnE2DtLTF0DTCUwhc/L/zriJPYGp7BTIICPjHshrFBJsXYUXjteE
         4J9es3kYN4rjWjUcjGf+GI6i61MHVzRri4CFL/muAlQMttTXsx9Sz2gxtb39CecRiIbA
         PcZ/k0t/w0PKGbR1q2fRhDNH/OlVkzTt4w679OBylpT5DsVp3YdnrGc9uqnLphRY6JvY
         x4lsq8Pujqy0QiaSsot5L7NVjgYXizdCrMRDuR8ZMppEMr9vFvuloiOzkvglD2EheImL
         yezg==
X-Gm-Message-State: AOJu0Yy6hl48b7NlxKZgH/mE4P9NNW/ROX0wBwcDDHpz4b28/mRveV4H
	yfoY9AZo/R/4r/8rHQSBrMU8BHkvJ07RKFguwH9fxcpRH1mBQb9bgOHicLg870HtmBU=
X-Gm-Gg: ASbGncvoP5ZXNS0vamHOBCeqwKumfPexl8fKBVtPgMfKF8e2HKzLTYxqcaxiWy5AEX2
	wbGFgwxowx4td0nuVj1NKjN1n//SOwIiR7ehyrADz12lbT46FrJPSzPcK2kNCCIn+9mHjdgF9r3
	M9tJsOET4uiCPsIamCEwDCr74Ov4r5Dg+lrMKbOV9glNS47FKDOvKK883Q0VCXsFJMPasWsYe6g
	vtWHYWLY0lyvUL3Gc6dq3lhnVVtk4ZPQl9+SFSM9S+/L3t7yfgk2ReOYAKgkreBRgxArJNVzcL4
	Dz9epuSpaPIB4IPqIWomcLP5ARldVhvuqlrjMwWFNBrraB6TCo6iPVi8bm7pkMSRDB+Ha2uODqJ
	NpNnnZbwWnJ3ZxymkjH7a5ydxk3LZJhNI
X-Google-Smtp-Source: AGHT+IHdEe5K+YDWPhJLhlZn7IU67ePHwIpfI8vI3XiMDhr12ZwDMD7hxV3qH6hUc2/5B/bKZQSVwg==
X-Received: by 2002:a17:902:ebc9:b0:24b:4a9a:703a with SMTP id d9443c01a7336-25d24da7536mr278813885ad.17.1758059853851;
        Tue, 16 Sep 2025 14:57:33 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ea3c72dacsm1636848a91.4.2025.09.16.14.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 14:57:33 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:57:31 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V12 3/5] riscv: Add RISC-V Svrsw60t59b extension support
Message-ID: <aMndS8F6tr1ZvILt@debug.ba.rivosinc.com>
References: <20250915101343.1449546-1-zhangchunyan@iscas.ac.cn>
 <20250915101343.1449546-4-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915101343.1449546-4-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_145734_675110_FB2E336E 
X-CRM114-Status: GOOD (  12.60  )
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

On Mon, Sep 15, 2025 at 06:13:41PM +0800, Chunyan Zhang wrote:
>The Svrsw60t59b extension allows to free the PTE reserved bits 60
>and 59 for software to use.
>
>Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>

Same comment as Conor for dt-bindings.
Other than that

Reviewed-by: Deepak Gupta <debug@rivosinc.com>
>---
> arch/riscv/Kconfig             | 14 ++++++++++++++
> arch/riscv/include/asm/hwcap.h |  1 +
> arch/riscv/kernel/cpufeature.c |  1 +
> 3 files changed, 16 insertions(+)
>
>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>index 51dcd8eaa243..e1b6a95952c4 100644
>--- a/arch/riscv/Kconfig
>+++ b/arch/riscv/Kconfig
>@@ -862,6 +862,20 @@ config RISCV_ISA_ZICBOP
>
> 	  If you don't know what to do here, say Y.
>
>+config RISCV_ISA_SVRSW60T59B
>+	bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
>+	depends on MMU && 64BIT
>+	depends on RISCV_ALTERNATIVE
>+	default y
>+	help
>+	  Adds support to dynamically detect the presence of the Svrsw60t59b
>+	  extension and enable its usage.
>+
>+	  The Svrsw60t59b extension allows to free the PTE reserved bits 60
>+	  and 59 for software to use.
>+
>+	  If you don't know what to do here, say Y.
>+
> config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
> 	def_bool y
> 	# https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=aed44286efa8ae8717a77d94b51ac3614e2ca6dc
>diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>index affd63e11b0a..f98fcb5c17d5 100644
>--- a/arch/riscv/include/asm/hwcap.h
>+++ b/arch/riscv/include/asm/hwcap.h
>@@ -106,6 +106,7 @@
> #define RISCV_ISA_EXT_ZAAMO		97
> #define RISCV_ISA_EXT_ZALRSC		98
> #define RISCV_ISA_EXT_ZICBOP		99
>+#define RISCV_ISA_EXT_SVRSW60T59B	100
>
> #define RISCV_ISA_EXT_XLINUXENVCFG	127
>
>diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>index 743d53415572..2ba71d2d3fa3 100644
>--- a/arch/riscv/kernel/cpufeature.c
>+++ b/arch/riscv/kernel/cpufeature.c
>@@ -539,6 +539,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
> 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
> 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>+	__RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),
> 	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
> };
>
>-- 
>2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
