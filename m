Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A07CC982EA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 05:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YeAfs7aYLTAer/dO0hST1/GDiW7s6GvIKKkEoIfQ7F0=; b=G6ZvdTG6fMC9EP
	n7se2jQjhZo5sjjqWho71TARe2OKlNTfamDgWOg5gl8rEbc+wSrHPhL3xJ3VThWtRnmFXcTK7IBdY
	sETMqpC8s+RREj+ZRmpW9zyXIVfhZ8qatUBaaLr1WuehOrvJJwAvecPWmFtjpf3Pgj0xck3AAhBZr
	kIXHeXGzhq+xNq3Jyc/KodFRAlfuzCA6vk+K0LFeTrxZMs15702EfI64IdR7cbaYgM0dU9a53OKlA
	RFMgzVibnlFPJg6bEvWWW7Rh3eTTGK9Oq9aQNhvhYGF9IGELqi7dFTI5qha7her+sBBuje/ZGGv8n
	Tm95x4B5aNR4IRbCEcqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fps-00000007CQB-3lmV;
	Wed, 23 Sep 2026 05:48:04 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Fpp-00000007CPT-3Mm2
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 05:48:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=vjVcIyF3kkMlZyzd56bm3scXTaq3Opyr7xmaB4B2Hds=; 
	b=fQjpyr+BmwmCnb2wn8FgspFTB/fV2AOUx20SW/K0WXbOBgwzSIj6itpncVmckPhInMgMVrr7M2Y
	idhFzE1gbqvR4s0K1kfiHjNxejXYmpWDMTDjp2guUwP0AswDMavepSRkC0kKniYvmFiHbfqQYXjYZ
	zysKaGXEUQeDeEcqMZLbV+XDYX759yDIymCal4GriDKMmbSNGKTVbA5UPkmw0SbHRNKnOjtdoSSQn
	WYU6T/U0IRE7+l2AttIExnjPqqcXbBh0gTcqg4a1xnbj/eq1kQSBxy0QW6x24hezQRi7P9z/fRoZA
	GqxrBxZ2vh7BTJHu51gD5fDTHNg5Alc/omkA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x9FpV-0000000Gupv-0dgl;
	Wed, 23 Sep 2026 13:47:42 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Sep 2026 15:47:41 +1000
Date: Wed, 23 Sep 2026 15:47:41 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alex Ousherovitch <aousherovitch@rambus.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravanakrishnan Krishnamoorthy <skrishnamoorthy@rambus.com>,
	Shuah Khan <shuah@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	Joel Wittenauer <Joel.Wittenauer@cryptography.com>,
	linux-api@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thi Nguyen <thin@rambus.com>
Subject: Re: [PATCH v5 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash
Message-ID: <arNn_fjy4jamSitO@gondor.apana.org.au>
References: <20260917225929.2494111-1-aousherovitch@rambus.com>
 <20260917225929.2494111-5-aousherovitch@rambus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260917225929.2494111-5-aousherovitch@rambus.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_224801_840499_E4642DEB 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

On Thu, Sep 17, 2026 at 03:59:13PM -0700, Alex Ousherovitch wrote:
>
> +		alg->halg.base.cra_flags       = CRYPTO_ALG_KERN_DRIVER_ONLY |
> +						 CRYPTO_ALG_NO_FALLBACK |
> +						 CRYPTO_ALG_ASYNC |
> +						 CRYPTO_AHASH_ALG_BLOCK_ONLY;

Why did you set the NO_FALLBACK flag? This is only meant to be used
by very specific cases such as s390.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
