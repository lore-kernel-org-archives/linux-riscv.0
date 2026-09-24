Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1F2C98304
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 02:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Subject:Cc:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6L66gV003DRj2ZONlG50z2MfnCJrECPAC8dgs8KvVHI=; b=3eX6k+MjkzqiOJVucZgg5DNTC7
	dpnWcCs4HdwwvxLVr98RhCsMcQbtToTto5HQ3K7epbcMk17jRtLfJvZOHrz6tlRvHMH+oeaSA1o5N
	38slwVwkxBMO1WgL3UiksMsmVd2UD8rnAQQ0u9dGFtXUsuFd5R4/PwfqdYhLoxJAfJO4dcFbssJ/n
	hrN5AZIhF6X83Xs1Mb03HJnKVH+9tWi2vMjdhxsV+9y0UV/DIkWkPEz6Y/OTYkrtETH/iImuhDked
	BNfg6NNvHxhDNvUF5ZZajAixldGVOSj9cRuZQq9QK458nhrc/3YwT2mhap7yFaFgQpksxx9omLeO3
	7mwm7klQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Z8S-00000009rM1-3cqG;
	Thu, 24 Sep 2026 02:24:32 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Z8P-00000009rKd-3K7a
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 02:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1790216634;
	bh=m1/plKS76wHa8P1yN4wrEUPS7ccVDolVN5V3LZrJIP0=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=XK/bUJSDNnA37io2rYQqr+WQ+f00Hgp10CDdB/RQmECtCAq7SOwn3TP8koqC0Ef9z
	 mdgRle6siCLiu+QsKq32KAFqxGFmkbVaEmgpNCo/cDIx2XlNl9oUKduwQ+ZjRdeKH4
	 tyMp9b5zaqB9jxGIWzom0/SecjudOagRxoO8jGB4=
X-QQ-mid: esmtpsz16t1790216627tb4707d8f
X-QQ-Originating-IP: gSZvk6BWSQYXl8jnfSQaWrx+BEE40A51kr/HVCALHkM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 24 Sep 2026 10:23:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15881123494600933762
EX-QQ-RecipientCnt: 12
Mime-Version: 1.0
Date: Thu, 24 Sep 2026 10:23:43 +0800
Message-Id: <DLN6TV32A766.2BWYLKQW9ZYG5@linux.spacemit.com>
To: "Encrow Thorne" <encrow.thorne@linux.spacemit.com>, "Lorenzo Pieralisi"
 <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Yixun
 Lan" <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: spacemit: Ignore link partner PERST on K1
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com>
In-Reply-To: <20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MK2msS8Oy7OGPOIcZfmTKoEmcz4DDDj3fPmJ5vzepI528Bqp9BvDFnPo
	mNlOw/L8neB+NhxPgMmTD34K/8RCnGJB+qbhnPeYRCkXbVjYwWkueycpUzlv3pnjgo0eklH
	AVydfJszJQTU+haljcVX9KHJJRYHDckgFFxxQIkDQv4Qp+JUD4TCfttx6xAbifb9xZ+R2rO
	7vHJwJH8PUwgZFc97oRMkjQ0ySgKzDqRHqClqAlEs9VZiHSIk6HlMJx8bokyBiZTdXgqGvw
	0Orjwo2aJuk/T3gp1FOW4nD8VOdvtu9Qi398fftN1cxEfhftQPJ/YGXQsIxj90ahSkHTPal
	3alCDULUG9Lm4/KrTJv0dQs1mznztHa7HmeQTO7jR0AdkTpyggef1WU7rMm1uJtg40uzdZi
	fJSubaGdDjbTb/uVPwgNEKyy7/+W38KO9y5hoMjpAH9HnTkp7vZLfON33NQ6QYd8iSM9gU7
	4ZuyyX+Iku17wMzNrS9zRdOb3R/dGBpqEU9n0PR8O/QnIboqLCJ+17ZcyB77+g0aWKMMKuH
	5fXj2ufj25dvaiFsXLih8NcR4sfEACV76N23m72WyrOEq86mIXWVsaTaMtzshdAmFFF2d2v
	61Kv8r5EiYd5dvMJ9TStBK5hOpVLnBsXKZNimBdMw5yljxoVF++LuT0D/itXAcaIag22P5O
	WvmkBLunK2E7NgwPbsOgSsn/JMyVQUJpMEemrp+ol53sM2DIubFFeRj3eOX2X083fYDc3FW
	kPaY1gDYwyzHgRQSlQLTF2YJhW1EidUgm9vIKVWYTtbVDwV6qEHSGix1pFGMn2gzhV3HUCe
	k4nPljh5FuAD75OasppHjaa+ZxKSb+rpf4gMb2N+/LTDOD1gHILMeKEvSJLIH3faPJgWE3G
	/CJRrOCFe36RvcHEah6yLvfh+jcYHu2iZUTwswa9pakNdMZTAF8n+Jg1R3yIgCisM0tYdI2
	ggyOIzt2pkB5ippTk5onMfwOAG3h/8mdVsWaAxI2dp1E0v1rRBiDdyHmF1eN0qrbTLulq/g
	oMGqgbX+LASELK7JlVRrUYyvT6+QFnUjKlWG3IF8kzCrg8qyi6XrmNnAoR8gk/tbTnZv8et
	KniHPSvWeZEzEGhwe1DtJftO9zztSw6uHyVXZnmv3kyPdAQTFcbNIiIXw0W/6G1ZurE9dJU
	Ee+/u9rirfE5Yfc=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_192430_283664_26898710 
X-CRM114-Status: UNSURE (   7.12  )
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
Content-Type: multipart/mixed; boundary="===============5483369323511917879=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5483369323511917879==
Content-Type: multipart/signed;
 boundary=e16cacdaf47fb589a7d08498647ea7242f3bdecc260bc848fe7b9de12411;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--e16cacdaf47fb589a7d08498647ea7242f3bdecc260bc848fe7b9de12411
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Sep 24, 2026 at 10:04 AM +08, Encrow Thorne wrote:
> The K1 PCIe controller and PHY are affected by the PERST signal from
> the link partner during initialization. With some devices connected,
> this can prevent host initialization from progressing and cause the
> system to hang while probing the PCIe controller.
>
> Set PCIE_IGNORE_PERSTN before accessing the DBI registers. When set,
> this bit makes both the PCIe controller and PHY ignore the PERST
> signal from the link partner.
>
> This allows host initialization to complete without being affected by
> the link partner's PERST state.
>
> Signed-off-by: Encrow Thorne <encrow.thorne@linux.spacemit.com>
Fix tag and reported-by tag [1]?

Link: https://lore.kernel.org/all/20260825052249.66921-1-bbanelli@gmail.com=
/ [1]

--=20
Troy Mitchell


--e16cacdaf47fb589a7d08498647ea7242f3bdecc260bc848fe7b9de12411
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCarSJrw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv9l4A/jDq4Lfxvd/vk+CYfDPCZ6wh4sIWYoSApbpwTzsH
T9olAP448MnJVizefhN0woHdp/2Vuq3AEAYcA8zv9Vo4gnM2BA==
=RgJC
-----END PGP SIGNATURE-----

--e16cacdaf47fb589a7d08498647ea7242f3bdecc260bc848fe7b9de12411--


--===============5483369323511917879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5483369323511917879==--

