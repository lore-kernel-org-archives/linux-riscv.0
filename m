Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D449C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 17:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWf8BNxpptC1zFyRhCGXhwuP4v20S7eNHtPuHybMjH0=; b=gTwKnm3cjXuU9FspJ1BYJ6jLtT
	ymyrCXVdjnSyX+p7Up0HS6M7vnnN7yrKYwBzL5NYTx0e8I58f1Nhs81zXaqeLVau0lTQymh7famLk
	VepR0uVHdsFmTjcxtIypbYbsWMWxucfY3VS+WeGRLuJgCZZHhzS+WqBZp7gbCKkzBU7fXYj5kYaa4
	qnjAETNoRvpY636OEBO35cWbzKz916fxxcg9u+0nc0QZTyjNLktoi7PE5S5oPUC4n6w1z7pO30Es7
	Hdv6eWfVfw9OVUApRfEp2xqBlclrHUvH7SR25FTYyxC/JAfiP5ExriDjS99DIux2Kx8MH0ZoagZuI
	2WIXueeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppBu1-006539-17;
	Wed, 19 Apr 2023 17:47:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppBtx-00652d-36
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 17:47:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 779B564153;
	Wed, 19 Apr 2023 17:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC77C433EF;
	Wed, 19 Apr 2023 17:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681926448;
	bh=pWh482ug9z2sqnnRAVNa0CWvtOeNXthB5Oa4dpUf8qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMmN2j+aACy9B0E/Ue1a6PZkHU8A2yZS+0gPvkPupDu9QQDJyAGC88hSS/m648/R2
	 GrC7k6Fb9IUzJaW5n9403JAe+m23Ys2HJrvmivPjpKIyPu4CAL9F85FH+QFULb4RXx
	 /KS1owff7JcbEQQ4MC4D5vPbT6JTXCN4L9J0PdU1dXQW0CfYhjrBGRWCcvrtSABVW/
	 His9baU6XFrvJe5lsiQpyNu4qfncE6Q0A87qRN1zrLDlSLgqG8t77yQWEj/LUuAzE2
	 SXIy5boFrKgfCFXczjXPAwdTJFjbToB3lCC5mp1Nvmy+yZDYIU1j7wra8brKFT9GMJ
	 D/BJpMbGnkCdQ==
Date: Wed, 19 Apr 2023 18:47:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RESEND v2 4/6] soc: starfive: Extract JH7110 pmu private
 operations
Message-ID: <20230419-atypical-unbounded-99cbbff3091a@spud>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-5-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230419035646.43702-5-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_104730_038618_CCF221D1 
X-CRM114-Status: GOOD (  14.53  )
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
Content-Type: multipart/mixed; boundary="===============5280912605608670538=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5280912605608670538==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7GNjDzVc5Xp9dcL9"
Content-Disposition: inline


--7GNjDzVc5Xp9dcL9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 18, 2023 at 08:56:44PM -0700, Changhuang Liang wrote:
> Move JH7110 private operation into private data of compatible.
> Convenient to expand different compatible.

I prefer how the code looks in v2, thanks.
However, just as in the prior patch, "Convenient to expand different
compatible" isn't really a justification - specifically, supporting the
power domain controller serving the dphy is your motivation here. The
important difference being that it uses a regmap from a syscon and has
no interrupts nor the encourage features.

Although, given the only real similarity the code driving each of the
PMUs is the variable names, I guess you could argue that this driver
should be left alone and the "aon dphy" should be a different driver
altogether.

I don't have a strong opinion though & if it's fine with Walker and
noone else objects, it's fine with me...

--7GNjDzVc5Xp9dcL9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEApKwAKCRB4tDGHoIJi
0tYVAPwISZbXM40tjQmXEGDayikBInHUpr/oPqkALLx8vo+MDwD9ELD9t2yG84GK
wfCi0TDnkKmKRjeXnQ8LaIq5theaXws=
=YkVs
-----END PGP SIGNATURE-----

--7GNjDzVc5Xp9dcL9--


--===============5280912605608670538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5280912605608670538==--

