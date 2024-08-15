Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C149C3DA7F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 17:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qyj704btkSqdm/TpDRloM9k/mnxswWAAe6rcEBlkUYA=; b=Ok4KHKYlTygDKq
	dBcJ3ho9jEBo8GQQDNwNTlvkpzZs+wKBuFnmo+ljW3mULjML45jsR42xljMWzW+5alNVuxdo2ndxi
	K+EMSORqSHWcPdvEajsevTasoY3qmZ+1sTnzZmS4ICIeCkTagdvCtb4Unxnjz0ri40Wl39HS8YOAR
	YyuBYCeuVN7CesC1oHqVSHUjaof80Rq4YIZSdGZtXUVGVCuq4OPxYfGTPES3ClBf0o+xIcjH7tE+6
	hiOIR6h1ZHDEtJIJCyKe+lp9bbPlqNdZoHDcDpmpfYJ6Vp+8iY1RSmuDmOlC+49nql5N2cRiGUBDg
	y6AGHr24yJHFoJWqDXvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sedqQ-0000000AaMn-1pmd;
	Thu, 15 Aug 2024 17:01:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1secfo-0000000AQNC-0kza;
	Thu, 15 Aug 2024 15:46:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45AB661E65;
	Thu, 15 Aug 2024 15:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74432C4AF09;
	Thu, 15 Aug 2024 15:45:53 +0000 (UTC)
Date: Thu, 15 Aug 2024 16:45:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 03/40] mman: Add map_shadow_stack() flags
Message-ID: <Zr4ir5YUxPdwqdkp@arm.com>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-3-699e2bd2190b@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801-arm64-gcs-v10-3-699e2bd2190b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_084600_316006_21A688C9 
X-CRM114-Status: GOOD (  13.24  )
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

On Thu, Aug 01, 2024 at 01:06:30PM +0100, Mark Brown wrote:
> In preparation for adding arm64 GCS support make the map_shadow_stack()
> SHADOW_STACK_SET_TOKEN flag generic and add _SET_MARKER. The existing
> flag indicats that a token usable for stack switch should be added to

Nit: indicates

> diff --git a/include/uapi/asm-generic/mman.h b/include/uapi/asm-generic/mman.h
> index 57e8195d0b53..d6a282687af5 100644
> --- a/include/uapi/asm-generic/mman.h
> +++ b/include/uapi/asm-generic/mman.h
> @@ -19,4 +19,8 @@
>  #define MCL_FUTURE	2		/* lock all future mappings */
>  #define MCL_ONFAULT	4		/* lock all pages that are faulted in */
>  
> +#define SHADOW_STACK_SET_TOKEN (1ULL << 0)     /* Set up a restore token in the shadow stack */
> +#define SHADOW_STACK_SET_MARKER (1ULL << 1)     /* Set up a top of stack merker in the shadow stack */

s/merker/marker/

Otherwise:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
