Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB03C79FA1
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 04:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0GAMMcQHMEHd5RBWguVnFpvIjUaN1NHYf+IKqj3WnE=; b=qxagyKFwXlK2bW
	Ec1SzMchZBPdtvkmnc2nmgH2QQrewU8kchHQj0j36tLUezwXO1p6cjeVNoEQrzkoKI3sLT89coHGF
	jgXHMd9QobzlkOGx+z1DP7R/zPlCd1GInqtwsXW4RZiG1Yi5T2t/SulTrroGgxSdIbsbyFofMX2fr
	xwzwn3Ks/KTao48EIWDGJq6OMmWhoGTbibKm80jl+zEPr7sHngpeIvnRW7LJAF83dB198M1NY5x/e
	yGpFfG5/rm3rBJ4dY76GSTUK63MBwVZHXhHX/NuBWyZfB3Bq96zC025lXwLLSgLqPXeLcez2APCfM
	zZ6GXEh7IpIYoyMt2DCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4sw0-0000000Fof3-2FpC;
	Fri, 11 Sep 2026 04:32:20 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4svw-0000000Foe4-2S9G
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 04:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=YKpfvW0m7fMGPwroikXgrjlEkqn9S1O/EG9PiSNdpjs=; 
	b=f4AKmI0SRdE8F+kpVQXiub5fRB7v/nIJ2L3G5tkE0IFsgd3K5CaDIQI3l0p6UZbJ2mO3DjrYlbi
	mwMOSsi1YjJvikFFyKFw84u7aOz8+H3rMWlPaKAxz6HCbmXt6Ks7qZfJyo/9beOxaupITxz4wWd54
	j2YL0NVc9k8WR4GaxdmtC9sUVr/uqoFmjw63bokCWOsuCmOTimCzaqm6zyJFLcH1qWw9BprNSOn41
	XtLLUsVM8HzahjPISNGoNcffLAgI4iKEBcI61DQnEo3QcG9qnDnm5rG7I0BmJ7ej8pNVX5IXlAWyJ
	qIwseeWShWs2Q0+zzrLpuBeXusz+FN1H6SPQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1x4svP-0000000CtQw-0BeT;
	Fri, 11 Sep 2026 12:31:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 11 Sep 2026 14:31:43 +1000
Date: Fri, 11 Sep 2026 14:31:43 +1000
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
Subject: Re: [PATCH v4 04/19] crypto: cmh - add SHA-2/SHA-3/SHAKE ahash
Message-ID: <aqOEL-YUVFuThcmf@gondor.apana.org.au>
References: <20260825221539.255951-1-aousherovitch@rambus.com>
 <20260825221539.255951-5-aousherovitch@rambus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260825221539.255951-5-aousherovitch@rambus.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_213217_427506_0E5DD26E 
X-CRM114-Status: UNSURE (   8.74  )
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

On Tue, Aug 25, 2026 at 03:15:23PM -0700, Alex Ousherovitch wrote:
>
> +/*
> + * .update -- buffer incoming data, submit full blocks to HW.

Please drop block buffering in new drivers.  The Crypto API handles
this for you.  Take a look at the aspeed driver for an example.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
