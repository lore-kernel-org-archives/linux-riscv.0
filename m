Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECE8606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 03:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MLGVeXTJ;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=pV8kv3ht
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8r7pGytIktPDSWqkLCnrseO/C7OHuRC3eRuzSb1CNo4=; b=MLGVeXTJUbOxpXB72P6Pdp9tgC
	12II46EIW782fxSJyhvqGmVMv3wriPS8OAakO921d1ErfGiNU8LqZ18bQZecRUOZrg9n4C6bMzbsS
	lYkwABmLRrKOoDaP6/HAlK8+k8DsNq5IVE0lV49rl1OORuyFc4pdxzAh7lk9rvIcbDBpyYKmfRTDC
	mWsumRoneoGJNJ1sqLNBFg3CZ+HvVMS8GndqjF/U/w27z20LSmpTyOamKA2j5q0ewasmaELf27ZlQ
	Au0wkpVGxEqf1DIB9IQTRYEHAb8keEtD2tJsaJSj7hbKLDufPn8oZLYTWo1qleAVPkTSo/wtEYq5b
	s2S9+4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOo1t-00000007fMH-2pDq;
	Thu, 05 Nov 2026 03:20:45 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOo1q-00000007fL6-2Tcm
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 03:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793848779;
	bh=eiCR7OQYpPnAB0LIBHCUmY4hczAoSVAJP7e9oOsC1mk=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=pV8kv3htuM3fk2xOqy8akoSfpO0rVJaNWJwk/eNAD/rSuP8bstO8xlJGT/G20cKM1
	 +5Xtsa54BgyV5lKkJ1MZ5E15A2fPmIhjgX/3yrA8PuMSTrnPKYv4w1mKxG457e8Q6p
	 6zSXFOVZsPQSWlC6CaF1mSTH//UatZ8dlaRWeckM=
X-QQ-mid: esmtpgz11t1793848777t99789d7c
X-QQ-Originating-IP: 7g3Wfm+iHmokJvzPZ9+1FSgY6SMSZ1RqJkpo1rJsV+c=
Received: from localhost ( [8.218.183.135])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 11:19:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3139450742990375673
EX-QQ-RecipientCnt: 18
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 05 Nov 2026 11:19:32 +0800
Message-Id: <DMMYBHEKT16W.33GZJ04KWEPY1@linux.spacemit.com>
Cc: "Rob Herring" <robh@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Ping-Ke Shih"
 <pkshih@realtek.com>, "Anirudh Srinivasan"
 <asrinivasan@oss.tenstorrent.com>, "Alex Elder" <elder@riscstar.com>,
 "Vladimir Oltean" <vladimir.oltean@nxp.com>,
 =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 "open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] PCI: spacemit: Ignore PERST# bit for controllers
From: "Encrow Thorne" <encrow.thorne@linux.spacemit.com>
To: "Ali Tariq" <alitariq45892@gmail.com>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, <linux-pci@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261104140750.761330-1-alitariq45892@gmail.com>
In-Reply-To: <20261104140750.761330-1-alitariq45892@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Oe3CFHOZR6DzuKIN8uHjvMBUlgk1xGkGdFZqmpgKu3g0u37UFzc0TIbT
	Y8xq9vGlcQq711GJSoeEdDuALZKuJBFadfBD0r36QoOEiyzhUp3fRmEMHaHEXmyReqqo0/A
	M9uiJK/MdUGO6tM5iJWFTVkyByeTLUwEX83UEiLuK3sce14WXZswrOKVZLcUH5a3ufY/cEm
	upYkUv7hUH2cxyQ0DEF7cnAK/U3+viZqxO6HqHqUB+XMmLklGrCEqWMu1SPGx1QG4uRj7HY
	afr64LaJXbTXcV7VYcoKgQdfrBiYtJaVOiCfx1BjI6t90PHJVPP4vIq72kNgja976fCi3ge
	9IF4RA8sNJphO9MNUKbs18TmEHshcArAgJwEIuTny7qFFSyVV6a8MvxcBjU7IcNVaKv5mtl
	GfDBKRNDTeWFf5mLOL7PU5QmTrLZAyW+CA2qo0hRDvBw1mSXKzNlwWPWLBfP881MBSqOEkZ
	3b0Wk5L2vqlSXMMQ7161Cuvf/mXX7Hbw8gVB+gkof0BjqJfSe19Y1js9RoS5lntIfTdmPfP
	5ix2QPczldSjrrwB1LSICnHq7aPmUwyB6uKEFSqvX+upMff+DZoaQoEqmUkXUq2ZMGTw1T4
	lAC/GHr7+2myJV1xWMyoNZCOPfXEtH+1e4Y1ML6Hdn0JoV12K3lKE8AgDxx0RBgECcdLEe4
	4tzORUrW//kfDfjoFkb9DPLV3ftwgZlfMl9PQxB1GaPGq2ByrUMyTBELaq0qIvTRgpppMbG
	zVz4+h/40TZV9EJwC2mgaPMzAFoeTX8wURiDJPSgQTPfJJJ1Wgf+ebxgkZfwhD9/Ff0cNGU
	ZLxjKBeF3uaIUuppDvHS0sx8w1HZLPM/mwfH8bbWMOl2/hsd/RrJSXG6gfFjMwFBL0fgn8E
	Dug7QPyGFMW/yaN93ILzICTaBbmK+ttblsceFHQ80KDOuS5j3W6mE0dviuYrQ0Ntsb7mWy3
	vbVqnNDV+VOy67STvnpO4FK1teoeSOO7YqPE6TW8cc81rQEZr/dSgPi7hq0WsHGoSIkpdIa
	+vxBnsEkCCHdORoaezMaBJM2ZU2tE0vV3JGxEmrAcgvLKXQb1QLzLGvUt9vvU4UXy0ce+rM
	0NO+KlaL9UDj33hVKhpGE2I0StSNBGF9b6wb8y0iIQT94smKZD+8/M=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_192043_446282_AFB9F6A4 
X-CRM114-Status: GOOD (  16.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed Nov 4, 2026 at 10:07 PM CST, Ali Tariq wrote:

Hi Ali,
> The k1_pcie_init() does not set PCIE_IGNORE_PERSTN bit of the
> control logic register, which causes controller to reset itself once
> PERST# signal is asserted even when acting as host.
> On Orange Pi RV2 (SpacemiT K1), this resets the controller and wipes
> the IDs. k1_pcie_deinit() leaves PERST# asserted, so when k1_pcie_init()
> runs again, its first DBI access hangs the CPU.
>
> Set PCIE_IGNORE_PERSTN bit of the control logic register of APMU
> in k1_pcie_init() before enabling resources so controllers
> dont end up resetting themselves when PERST# signal is asserted.
>
> Fixes: ff64e078e45f ("PCI: spacemit: Add SpacemiT PCIe host driver")
> Signed-off-by: Ali Tariq <alitariq45892@gmail.com>
> ---
> Hang log: https://kernelci.cloud-v.co/scheduler/job/420
> Fixed Log: https://kernelci.cloud-v.co/scheduler/job/430
> ---
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index 92a71ea90ac3..af6028e8825a 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -47,6 +47,7 @@
>  
>  #define PCIE_CONTROL_LOGIC			0x0004
>  #define PCIE_SOFT_RESET			BIT(0)
> +#define PCIE_IGNORE_PERSTN		BIT(2)	/* 1: ignore PERST# */
>  
>  struct k1_pcie {
>  	struct dw_pcie pci;
> @@ -131,11 +132,19 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  	struct k1_pcie *k1 = to_k1_pcie(pci);
>  	u32 reset_ctrl;
> +	u32 ctrl_logic;
>  	u32 val;
>  	int ret;
>  
>  	k1_pcie_toggle_soft_reset(k1);
>  
> +	/*
> +	 * Ignore the PERST# signal so the controller does not reset
> +	 * itself when it pulls PERST# low.
> +	 */
> +	ctrl_logic = k1->pmu_off + PCIE_CONTROL_LOGIC;
> +	regmap_set_bits(k1->pmu, ctrl_logic, PCIE_IGNORE_PERSTN);
> +
>  	ret = k1_pcie_enable_resources(k1);
>  	if (ret)
>  		return ret;

Thanks for investigating this and submitting a fix.

Our testing also confirms that setting PCIE_IGNORE_PERSTN prevents
PERST# from resetting the local RC and resolves the DBI hang.

I will send a v2 of my earlier patch with an updated explanation
and the test results.

Regards,
Encrow Thorne

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
