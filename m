Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79535C5B574
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 08:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1pGPygZvFymjQcjAjrT/oXitQ6rHSERd5+EJHKPr/0=; b=xgmVJAEwtZxQrs
	d91gHO0hXH551xDwm6RrCjcUCluo7tJGdMg0jvA2J2XVTFlN3a0bwoYhh2c3+cZ1Al/jBB1RXtLo6
	VDJg8pdAQql6Iaf3PN0djig6UinYbDz/DYMbcFAdVGXYIWeYzJRUngjErmdlU5xorkPYQmCC5oZhv
	z7a69b2lo0kaYiCh0b86K2yIXTf+vwZ8dDxm6141eoTYL7Pr3IX9BzdX3/hYmdC0OdEGFqoZql0Yf
	8X61QjoNX8pg55im+gSj4TQYYmiWMTOKII+4i1VYpWdfVwAF465zA5NJSf6gBNmHQAFHon53vDtlC
	1bIH4SRdkFqz5AupIHww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthvu-0000000DcAC-1uxL;
	Tue, 11 Aug 2026 08:34:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wthvs-0000000Dc9v-3Mxg
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 08:34:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42854600AD;
	Tue, 11 Aug 2026 08:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61F41F000E9;
	Tue, 11 Aug 2026 08:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786437239;
	bh=lrDqlEwSMhcC4vXVXzfkcEzvcaD78VvoCFKvgZhCaEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebFJcjIbwbQxRzIlNCTZvrO3L9nPoxtPiS3N1n9jF1x29aWnv9VykxjQG33XxLHAM
	 1vY5/FBM0MR5r53YYNKpqnQReZbi1FDD0Offnb3ADgm0jVH1Ykp3x1fATlCl9bzM5a
	 Hzb1AdJDdHC3ivKZl0uId+tXyYnh7lcvD2HHpNs2jNniQifD1NDfICsb54Pj2Lw6mj
	 COVX93oZwlhzbqy9I/jSsDm44+JHxFKsx82YjvPo0oA6vx3gZvj/YHJTHpTFGzHvS6
	 LDNVoG5+WQsGpVjSlbNLYncR1LraAT6jsUrSOsaPp9o1sgzum0XOKXOVX6PPW7nuFJ
	 dz1cxah/rNmzQ==
Date: Tue, 11 Aug 2026 10:33:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
	Alex Ousherovitch <aousherovitch@rambus.com>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	Joel Wittenauer <Joel.Wittenauer@cryptography.com>, linux-api@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Thi Nguyen <thin@rambus.com>
Subject: Re: [PATCH v3 03/19] crypto: cmh - add key provisioning and
 management
Message-ID: <20260811-belligerent-analytic-sheep-3fce16@quoll>
References: <20260806195519.2703224-1-skrishnamoorthy@rambus.com>
 <20260806195519.2703224-4-skrishnamoorthy@rambus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260806195519.2703224-4-skrishnamoorthy@rambus.com>
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

On Thu, Aug 06, 2026 at 12:55:02PM -0700, Saravanakrishnan Krishnamoorthy wrote:
> From: Alex Ousherovitch <aousherovitch@rambus.com>
> 
> Add the CMH key management subsystem:
> 
> - Key provisioning: create, import, derive, and destroy hardware keys
>   stored in the CMH datastore
> - System object management: allocate and free CMH system objects
> - Management ioctl interface (/dev/cmh_mgmt): ioctl commands
>   covering key lifecycle, KIC key derivation, PKE operations (RSA,
>   ECDSA, ECDH, EdDSA), PQC operations (ML-KEM, ML-DSA, SLH-DSA),
>   SM2, EAC, and DRBG reseeding
> - SM2 ioctl handlers: SM2 encrypt, decrypt, sign, and key exchange
>   -- operations that require multi-step protocol flows not
>   expressible through the standard crypto API sig interface
> - UAPI header: cmh_mgmt_ioctl.h (ioctl definitions and structures)

And we need custom IOCTL interface because existing kernel interfaces are ... ?

Say something useful in commit msg, e.g. WHY you are doing this, not
what you are doing.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
