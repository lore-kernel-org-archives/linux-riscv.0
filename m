Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FFCC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Uu1qNZSv26XGU56LAfr1CKmidojImXwQUrZzfg4+I8=; b=4JPPxy7H1J0sngZqJ4L1r9KpYh
	7GyBon/whcrKl2v0q+TPo8X/0gQrrURKHwukr575cf0CLTEuWBrJYvjq+1RXZZXsDscEMZBdfuB3x
	FSXAwoHE+hqjItRYu8hrmQIA8wI91PjLM6HzquRYrnOBv1dOQNtIlYCCjg7TX4HvWCgA/EnJCOmxO
	8LoQQq3VwRF28hlCql0fNBaP3aDeNz3/r+s+V+k7/XEhDuWNwObyU+0VkV9+2+BiRuMHgqe8P1XWe
	MT1GdxounAW28OH/AgwVMm8cOGK+Yc6Bw6RrUcQEXig0vcHJfyHWCFQkLV7/Lli7oa+xlnSuE5DPW
	ndA0Drlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBY8F-00FG9N-03;
	Fri, 08 Dec 2023 10:30:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBY8B-00FG7u-2z
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 10:30:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9127FB82413;
	Fri,  8 Dec 2023 10:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89A9C433C7;
	Fri,  8 Dec 2023 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702031449;
	bh=FfltjaJi2+BieqE4CIh0XJv2dzvZ1vd9wCo4Z9ia5sw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=admXh1CGnFPD0M35Zxc9R5HKFPgrTM8vn6dy1dC0aNCX5V6pFYRU+8Y50Z9+FQFHZ
	 90WnJHrL9wuyLIq5eaQMn6p/ASCRKvelZioSv/h57qeT/CfpfIK4Mi7vZg6czKM6dF
	 zeVrf9NqRO+7L0ChgKVMmeZJ+ktc/izPmaGrLsWTBZVwi6Yotb3FEqtRvsVHC6PK8S
	 7KnBkCuAPv27JJJa2dhSrqaZp27IfW92T5XmDHjK5uP6RFD/4ArfzPeXUu5ieAiglV
	 oMF8jV9yLMclCKJg0uI/aLJ98+DGQzUWqyyYGOTPUgStTMYVwtzwOwSxri+3TTECva
	 Gu8LusU2UFLgQ==
Date: Fri, 8 Dec 2023 10:30:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
	chao.wei@sophgo.com, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, richardcochran@gmail.com,
	robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com, guoren@kernel.org, jszhang@kernel.org,
	inochiama@outlook.com, samuel.holland@sifive.com
Subject: Re: [PATCH v6 0/4] riscv: sophgo: add clock support for sg2042
Message-ID: <20231208-item-rubbing-e32503c6cdcf@spud>
References: <cover.1701997033.git.unicorn_wang@outlook.com>
 <MA0P287MB0332EEB2858B8B39F151CECAFE8AA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB0332EEB2858B8B39F151CECAFE8AA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_023052_104922_430F821C 
X-CRM114-Status: GOOD (  14.54  )
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
Content-Type: multipart/mixed; boundary="===============5901414402473038671=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5901414402473038671==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FOIXGebSdyFCZivi"
Content-Disposition: inline


--FOIXGebSdyFCZivi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 08, 2023 at 06:11:10PM +0800, Chen Wang wrote:
> On 2023/12/8 9:13, Chen Wang wrote:
> > From: Chen Wang <unicorn_wang@outlook.com>
> >=20
> > This series adds clock controller support for sophgo sg2042.
> >=20
> > Thanks,
> > Chen
> >=20
> > ---
>=20
> Hi=EF=BC=8CConor=EF=BC=8C
>=20
> Can you please have a review of this patch?

Chief, you sent this patch only the other day, please give people some
time. I, at least, have an MMO addiction to feed in my spare time
alongside reviewing patches.

> And I'm not sure if you are ok to pick up this patch so it can be merged
> into the next v6.8?

Stephen is the maintainer for clock drivers. I do pick things up and
send them to him as PRs when it makes life easier, but usually that's
after other people have reviewed the clock driver itself.

Thanks,
Conor.


--FOIXGebSdyFCZivi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXLwUwAKCRB4tDGHoIJi
0u3nAP9Rokitj/wed1daTNpVLWtV36eyiRYsx6oI80J6OThGUQEA4exOUcph7uDB
lcTp1MOSck2qJMA3zfVvmMSiBj9WRQM=
=B3l3
-----END PGP SIGNATURE-----

--FOIXGebSdyFCZivi--


--===============5901414402473038671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5901414402473038671==--

