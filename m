Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D55C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 16:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1r7cnDhN7KxCOgwDzF0tFxwes0jQeuC7Ilm4g5LfwWM=; b=tKWvWHITGXKB0C
	EE2I665L5K0L6GNPIl1TrzyGoXjBujxv0LQdNb3cYLiRenlOwSMMgpc/8DPiuAEZjrQAZ/HCoioMB
	oH+99lkbF6FnFtu/T6lP9T+3ZZ7iZFit8CDRX6LDpIqV/bbNo73OGduFtYRVtqp+kYpF7hDV5dCfP
	uGXCHLTuUpG0XP1zET9EaWhqhFm8AQo4RQ7/pWm0ebFkicWamH5wCDajS9bj1/3i6rMUFeIQ4qn0y
	nEtBFbqViOGK9+ZN8DvN/olL/BNyf3MZZjc+eLLmNwJQBZc/MIPEG4sHmzzgcURgt6XSfQM9W8rUm
	GP9V82IhQWLb5msH9uYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAWc-0000000DZ4V-3ClT;
	Thu, 22 Aug 2024 16:19:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shAV1-0000000DYZN-1foG;
	Thu, 22 Aug 2024 16:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0683AA40B24;
	Thu, 22 Aug 2024 16:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A5ABC32782;
	Thu, 22 Aug 2024 16:17:16 +0000 (UTC)
Date: Thu, 22 Aug 2024 17:17:14 +0100
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
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 21/39] arm64/gcs: Ensure that new threads have a GCS
Message-ID: <ZsdkikRi2wgBlODX@arm.com>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-21-41b81947ecb5@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822-arm64-gcs-v11-21-41b81947ecb5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_091723_520044_7C3F1DC6 
X-CRM114-Status: GOOD (  13.54  )
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

On Thu, Aug 22, 2024 at 02:15:24AM +0100, Mark Brown wrote:
> @@ -512,10 +538,16 @@ static void gcs_thread_switch(struct task_struct *next)
>  		gcs_set_el0_mode(next);
>  
>  	/*
> -	 * Ensure that GCS changes are observable by/from other PEs in
> -	 * case of migration.
> +	 * Ensure that GCS memory effects of the 'prev' thread are
> +	 * ordered before other memory accesses with release semantics
> +	 * (or preceded by a DMB) on the current PE. In addition, any
> +	 * memory accesses with acquire semantics (or succeeded by a
> +	 * DMB) are ordered before GCS memory effects of the 'next'
> +	 * thread. This will ensure that the GCS memory effects are
> +	 * visible to other PEs in case of migration.
>  	 */
> -	gcsb_dsync();
> +	if (task_gcs_el0_enabled(current) || task_gcs_el0_enabled(next))
> +		gcsb_dsync();
>  }

Ah, the comment turned up in this patch. It looks fine.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
