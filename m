Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D846AC7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 23:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u+p7coUjnqy5Ieg3Bu04t0roFuO1eU7rLV+4tVMenTg=; b=ixznc760MD3H9H
	rpRSz0PPvcbtgxL+U9ebVEIt0N6Pe+cAb4FWF3XxcSSiiwjS4NE2JMNRfyM5jaGNqzJXWBaCvZMUr
	5KO3BtuUQdJVs6zbLdW35hEAgazTnCK4hW/AbSuCt742/S1qWIzs245uaK1r1WaWjztlO4N4BEyZQ
	J26OKDZrKgaLn4Zc1KuQaDIXOl78BhtH8YuDFdYfOmZYkd9kn1qK0ZMVrnOsMec3m61Q7/gQWRpG+
	iHcIEPxXxnGXhHdT8MdU8QQWm47EyvNUwAuzizE/dAKE2HcHhwwqxixraW2m71oHIlzyARFvfmlF1
	MeC1HFOLkjUbvtpraFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1proU7-0051tc-1N;
	Wed, 26 Apr 2023 23:23:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1proU4-0051t4-36
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 23:23:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16E6D61D1D;
	Wed, 26 Apr 2023 23:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A4CC4339B;
	Wed, 26 Apr 2023 23:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682551413;
	bh=ljfhtZUXSaQHweOFdXEqbHy6V/WG7H3gj8DTqCSLU4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7ysqy1cyC5qk+5uCIMUWE4azLykmQqFV/eT3GtTTFLLHrGb2LGy2Cw1aSYvgGsiU
	 jC4bTHSc4HZBA12fBSlPObnA++Kr+Y0C8JZ2y0Mkc7DW2vj+pymGJRh5vh27NRt9sQ
	 X3zYYFbvGBwpmqA6SV7V/vJj5f2LucE8QPlWw3M1z9rrNZX9wKyepUbxQb4YOi9OlX
	 FIZDy1mFIyqkDRVUK59+RfzdjIjDJoZMBEVi+76sBwdUeYw/e+F0hjD3/4sw8vxXpU
	 GiT1+6oB8BDn+qMZEBqaEBlW5vgD44v8CzHLdhVcTOIklj9ZdV/ZwjDD4oDNfDyiEZ
	 i8+WC/yAE9uvQ==
Date: Wed, 26 Apr 2023 16:23:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu
Subject: Re: [PATCH v4 0/4] Implement GCM ghash using Zbc and Zbkb extensions
Message-ID: <20230426232331.GB65659@sol.localdomain>
References: <20230329140642.2186644-1-heiko.stuebner@vrull.eu>
 <20230426225550.GA65659@sol.localdomain>
 <7664296.GXAFRqVoOG@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7664296.GXAFRqVoOG@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_162337_038677_FD2ACC39 
X-CRM114-Status: UNSURE (   8.67  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 27, 2023 at 01:20:31AM +0200, Heiko St=FCbner wrote:
> But for me, this small bit of scalar crypto is also sort of a stepping
> stone :-). Previous versions [0] already included patches using the
> vector crypto extensions too, I just split that into a separate thing,
> as _this_ series actually uses ratified extensions :-)
> =

> =

> Heiko
> =

> =

> =

> [0] https://lore.kernel.org/lkml/20230313191302.580787-12-heiko.stuebner@=
vrull.eu/T/

That patchset wasn't sent to linux-crypto.  Can you make sure to include
linux-crypto@vger.kernel.org on any subsequent patchsets?  Thanks!

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
