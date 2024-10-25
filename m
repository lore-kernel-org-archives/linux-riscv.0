Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58089D1038E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 02:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrQ6+Ln/C1hNRK7P0P/XuQE2cYF97TAvWC5Mj0HtUL8=; b=1czo8/IL22sNZs
	b7HuKg3yt9Q8QY+xl3OnfJUEK7DAA9YTTTcxg6u0/0p0PLJ+y5T/tCTJ+HQBhFMmCIXfpzyVXG2RM
	5isl9usw+LDIB0jdhwbSpiVHrcfzFv660xkwsim9FRcYLOd6f3vwdc/Z1ihXRezZNtWj8Fw+ie6rS
	dFjgyENm0q/0azNhYMEFkSJfVaGW0cy7drrixdNn6lpT6LBsHChKr2gZNkR9BnwxdwehNsTs9LmcB
	2qL5Zqa8eQikWkci550pXZ/TELUxfWipc90bF+1a3iFD6uqrFVdmG+51gCmU3CyfE5ptR+ZTklPVz
	qmS7PG0GnCurXruyRU5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t49kO-00000002G0I-1HpK;
	Fri, 25 Oct 2024 02:08:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t49kL-00000002Fzt-1qGc
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 02:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E3528A42A6D;
	Fri, 25 Oct 2024 02:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84F2C4CEC7;
	Fri, 25 Oct 2024 02:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729822092;
	bh=ky8/6r1K5IhNcd01jKs2ZL2ZKqMQimjDmX22tKU+6Rc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NgmQvLxhNsX0gcFaIr6Ua2kd3wAIeyXuU+3J96Igd9fQ9n8rtWaZ3+dRzeL34TQ4s
	 VOZgs82YspXIsdmv3OsXw7Wlv/EOTaGr8j02BdQ41rxW4YqH0oja6plnaP4R45e61W
	 afBBJlISqKn7QKSCyqnqeao6Zh2VUtkEFcJXpc6SEWwtpTZ/9Xt6eVK1FXBWxkY7u6
	 utd2L0lEp0+x8SwVuHQnNLItH+Rvtk3GMgeJbInvPjZrVd3SayWmflZAHwWZ1W2kqT
	 VeB4TEtwzaSf20P4NO9IeG7ogTBGX1kadsptcMWpDLEBitFNlK6fS+MKoQZr2eTJjZ
	 rjmMsChf6YApw==
Date: Thu, 24 Oct 2024 19:08:10 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] RISC-V: add vector crypto extension validation
 checks
Message-ID: <20241025020810.GA1781@sol.localdomain>
References: <20241024-fanning-enrage-bcc39f8ed47d@spud>
 <20241024-bunny-unexposed-196d8da36e7a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241024-bunny-unexposed-196d8da36e7a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_190813_559979_6C968666 
X-CRM114-Status: GOOD (  10.58  )
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

Thanks for working on this!

On Thu, Oct 24, 2024 at 01:34:29PM +0100, Conor Dooley wrote:
> @@ -308,12 +354,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
>  	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
>  	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
> -	__RISCV_ISA_EXT_SUPERSET(v, RISCV_ISA_EXT_v, riscv_v_exts),
> +	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),

This patch adds validation for not just the vector crypto extensions but also v,
zve32f, zve32x, zve64d, zve64f, and zve64x.  I think that should be split into a
separate patch or at least called out explicitly in the commit message.

> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zk, riscv_zk_bundled_exts, riscv_ext_vector_crypto_validate),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zkn, riscv_zkn_bundled_exts, riscv_ext_vector_crypto_validate),
>  	__RISCV_ISA_EXT_DATA(zknd, RISCV_ISA_EXT_ZKND),
>  	__RISCV_ISA_EXT_DATA(zkne, RISCV_ISA_EXT_ZKNE),
>  	__RISCV_ISA_EXT_DATA(zknh, RISCV_ISA_EXT_ZKNH),
>  	__RISCV_ISA_EXT_DATA(zkr, RISCV_ISA_EXT_ZKR),
> -	__RISCV_ISA_EXT_BUNDLE(zks, riscv_zks_bundled_exts),
> +	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zks, riscv_zks_bundled_exts, riscv_ext_vector_crypto_validate),

zk* are the scalar crypto extensions, which don't require vector.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
