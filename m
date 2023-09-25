Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0062CE7A94
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlwiyHsQKqL8S9lc8vW0pTfY819QE18FwOqnA/+29Ys=; b=IkfB0ER0JZVqYR
	yYiywRYFRL7SAjzpxZhUVaPXvO4ytwWDtkBuyKpEqC5IndoKQrNrWJeTWQaaO0ra7pTb3J06I4laK
	0n8DMKhmObSDGE3+EDOd8uXuIy1og+Tb9mv/Ph/gg7DwE7jt+t4YLfZZGLGtm0rDbr4nCysCIbbSk
	XTvD8QlKC+e3iL/Krqg1Du9TexgejsQIBSfkFpKD3qerMGHvCp3LN4J4h+0RFxKv/adKbeW9AY9eT
	IMES5YWUH5o/iS4LE6cYcCNihmta3N92aMDpEPccU4ALhv4QGDEvvO2FMOTuYQdHGzBmks4OJ7ukH
	uw3WMxH4SQQREgOUE2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiwN-00Dz6m-2p;
	Mon, 25 Sep 2023 10:35:47 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkiwL-00Dz6K-1o
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 10:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695638145; x=1727174145;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NGy5Y6K22tAMvFW2W8adwaIoI8/17ieV64EtLSlFNBU=;
  b=RSDoBB5kVlkjTMEBnJyI1dxtufjK/ySn8YKopORRK3pYuWxo2bUpn23X
   ug3to7trM1X9ILZ9J/RDXVrZSJ39EE83RACnZV5LCGxVTQ7jTKLAiCWME
   iB2NiAINpEcTnSCNwH1ThTulGnujdEiwEislm0mqWCHlTU6iu7i0rUpRh
   wiBYoxz+CLQzM73rmCjrlVBHKfJUrzYUPsvtjQwq4z0Bg417V95mv7ok4
   nLHPiB3GkeSuASXAEKvQ9r+ar/JIeGGAm8eMEOwqvMW3ztHlWCEwBxLsf
   rxxcQgvF0Ls2tDeFGRtlNnombXSIciNMf8eeJvD29Fwpg2xdqmk9x5cFE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385049411"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="385049411"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 03:35:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="697929670"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="697929670"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.252.50.180])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 03:35:39 -0700
Message-ID: <a420c2e5-db23-4b61-a110-476f8fb8636a@intel.com>
Date: Mon, 25 Sep 2023 13:35:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] mmc: sdhci-of-dwcmshc: Add support for T-Head TH1520
Content-Language: en-US
To: Drew Fustini <dfustini@baylibre.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
 <20230921-th1520-mmc-v1-3-49f76c274fb3@baylibre.com>
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20230921-th1520-mmc-v1-3-49f76c274fb3@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_033545_645056_FDE75AAC 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 22/09/23 04:49, Drew Fustini wrote:
> Add support for the mmc controller in the T-Head TH1520 with the new
> compatible "thead,th1520-dwcmshc". Implement custom sdhci_ops for
> set_uhs_signaling, reset, voltage_switch, and platform_execute_tuning.
> 
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  drivers/mmc/host/sdhci-of-dwcmshc.c | 456 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 456 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
> index 3a3bae6948a8..7294bf1afb7d 100644
> --- a/drivers/mmc/host/sdhci-of-dwcmshc.c
> +++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
> @@ -35,6 +35,26 @@
>  #define DWCMSHC_CARD_IS_EMMC		BIT(0)
>  #define DWCMSHC_ENHANCED_STROBE		BIT(8)
>  #define DWCMSHC_EMMC_ATCTRL		0x40
> +/* Tuning and auto-tuning fields in AT_CTRL_R control register */
> +#define AT_CTRL_AT_EN			0x1 /* autotuning is enabled */
> +#define AT_CTRL_CI_SEL_SHIFT		0x1 /* bit 1 */
> +#define AT_CTRL_CI_SEL			0x1 /* interval to drive center phase select */
> +#define AT_CTRL_SWIN_TH_EN_SHIFT	0x2 /* bit 2 */
> +#define AT_CTRL_SWIN_TH_EN		0x1 /* sampling window threshold enable */
> +#define AT_CTRL_RPT_TUNE_ERR_SHIFT	0x3 /* bit 3 */
> +#define AT_CTRL_RPT_TUNE_ERR		0x1 /* enable reporting framing errors */
> +#define AT_CTRL_SW_TUNE_EN_SHIFT	0x4 /* bit 4 */
> +#define AT_CTRL_SW_TUNE_EN		0x1 /* enable software managed tuning */
> +#define AT_CTRL_WIN_EDGE_SEL_SHIFT	0x8 /* bits [11:8] */
> +#define AT_CTRL_WIN_EDGE_SEL		0xf /* sampling window edge select */
> +#define AT_CTRL_TUNE_CLK_STOP_EN_SHIFT	0x10 /* bit 16 */
> +#define AT_CTRL_TUNE_CLK_STOP_EN	0x1  /* clocks stopped during phase code change */
> +#define AT_CTRL_PRE_CHANGE_DLY_SHIFT	0x11 /* bits [18:17] */
> +#define AT_CTRL_PRE_CHANGE_DLY		0x1  /* 2-cycle latency */
> +#define AT_CTRL_POST_CHANGE_DLY_SHIFT	0x13 /* bits [20:19] */
> +#define AT_CTRL_POST_CHANGE_DLY		0x3  /* 4-cycle latency */
> +#define AT_CTRL_SWIN_TH_VAL_SHIFT	0x18 /* bits [31:24] */
> +#define AT_CTRL_SWIN_TH_VAL		0x9  /* sampling window threshold */

Here and elsewhere, please try to make use of BIT(), GENMASK(),
FIELD_PREP(), FIELD_GET()


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
