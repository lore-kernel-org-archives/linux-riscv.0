Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1CCCF8541
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzmseByPOPGn445MO7pi4222iHUqch2uzmt72uxDWCQ=; b=GMo4DOTh/OFm1j
	AAsu6Fv4V2Q2rNEpqwMVI0WnK2QfwEaIbpxTwxrKmzZSdKJzpC/jgCKj6adFUJgyehUcPcmXDRfdt
	e7V7gjXUgDBQrhTDyGqlZvJLrmz/9CVpLI9zg42t8Aoe+YXsb4lRtuJYmmwBq+gHTAUcKjs0TDh1P
	4mf03mdR9jlJwPvDG6jQ5Son2vkdQfoPJbT1nE4CzvTkBI4K4T77ZUE83cFNavLkR7yKJ3VB0ZuXN
	0plid6WVthu7vI4QwH/U+REVaLzqqMst4XvVcf+EX+JxFa3u26aNLghdATxF31ShNj+XuqtGXtvHY
	XZ47CGsuGbsvSDaW5Vjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw6VY-00000007Suw-0bkl;
	Wed, 02 Oct 2024 21:03:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw6VV-00000007Stv-2md0
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 21:03:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B00555C410D;
	Wed,  2 Oct 2024 21:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A9FC4CEC2;
	Wed,  2 Oct 2024 21:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727903016;
	bh=T/J+bsNsUgw22rlBrYHJdcx0PE1m7ec1tmy77h9yuls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jmwllp6jzRETuClzX6i3XersBeu6pr5GCmFLlKZUoLVMVYp98nR8I1WBsoziE1zwv
	 EqLtCFWqPGJSD96kzZpm58e3IsTbFS7WDAX/QDivj9IgWJB8G+loz3oUm+b3k+Vvfg
	 5fJ5j6eLgua8KQ7IIkJDZ4frWJ2mmOyEdrVzJL3Mhhg2OGLV7RgIUBMO+k0lqmw0wT
	 nTitMwjJNI14VX3a/mC5weH5VNLpjfvsCpIjvdGAv1Jt3ysB1issay1HQfQxnI0rFp
	 2tniOP6L1zeIj89TM5ZmkNI70CjZOSWSGmwzAhNH9ZgcYj++UnNtpYvJbDk2jxE51K
	 ILXa6mUOgiYBA==
Date: Wed, 2 Oct 2024 16:03:35 -0500
From: Rob Herring <robh@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH 07/33] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
Message-ID: <20241002210335.GA1307114-robh@kernel.org>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
 <20241001-v5_user_cfi_series-v1-7-3ba65b6e550f@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241001-v5_user_cfi_series-v1-7-3ba65b6e550f@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_140337_821382_01B73847 
X-CRM114-Status: GOOD (  16.53  )
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

On Tue, Oct 01, 2024 at 09:06:12AM -0700, Deepak Gupta wrote:
> Make an entry for cfi extensions in extensions.yaml.

Run "git log --oneline" on the file/subsystem and follow the subject 
prefix pattern.

> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 2cf2026cff57..356c60fd6cc8 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -368,6 +368,20 @@ properties:
>              The standard Zicboz extension for cache-block zeroing as ratified
>              in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
>  
> +        - const: zicfilp
> +          description: |
> +            The standard Zicfilp extension for enforcing forward edge
> +            control-flow integrity as ratified in commit 3f8e450 ("merge
> +            pull request #227 from ved-rivos/0709") of riscv-cfi
> +            github repo.
> +
> +        - const: zicfiss
> +          description: |
> +            The standard Zicfiss extension for enforcing backward edge
> +            control-flow integrity as ratified in commit 3f8e450 ("merge
> +            pull request #227 from ved-rivos/0709") of riscv-cfi
> +            github repo.
> +
>          - const: zicntr
>            description:
>              The standard Zicntr extension for base counters and timers, as
> 
> -- 
> 2.45.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
