Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F38E9DE42
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 07:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+zaUlo9XL+AJ29j2mCGdoZd1RutEDByc6LdlX8iaV0=; b=bWKObwFZedEMEW
	M91znHgQwaiClw1vIbeGYU+7XTMRcyyrWxZnThX/Z4XJ0g89q9MF3BZah4ZifXkdYtxB2OCfKhSbK
	QyV0wiiEqzClMYOyjdV+4qxbBbLzEfDIUXUqHTkQ4YPFaPLOtajCIZb9Onf1zn2VvqsjKVTTNWHM2
	EotDkDXjJjgTWknPW7eUFUde+fL2SrUn9skj+lQ4b/B1gtBId0HlctFtxKhiJ/E3HwEUtdDOaeePP
	XlNg8yVbKgXYunHEkPOV3IgeN7PQ3MYuJtWs7/51c5/N/FvPDVLsfeWOumBIejdWnGqY6tsseGyYH
	Df18mutFGtCz0icfGJ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjen-00000009paa-2cAb;
	Thu, 09 Apr 2026 07:18:29 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjek-00000009pUq-1kPP
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 07:18:28 +0000
X-QQ-mid: zesmtpgz7t1775719054tbf8afb00
X-QQ-Originating-IP: 6bD4fn6zlzoRNsyvWerVgSjVIcx6UZ4MsVvp6bysC1Q=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Apr 2026 15:17:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6790880675297523126
X-QQ-CSender: troy.mitchell@linux.spacemit.com
Mime-Version: 1.0
Date: Thu, 09 Apr 2026 15:17:32 +0800
Message-Id: <DHOFVAYOFU7X.3J8VHC8FFYXD9@linux.dev>
Subject: Re: [PATCH v6 5/9] riscv: dts: spacemit: k1: add SD card controller
 and pinctrl support
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Iker Pedrosa" <ikerpedrosam@gmail.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Adrian Hunter" <adrian.hunter@intel.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>
Cc: "Troy Mitchell" <troy.mitchell@linux.dev>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Javier Martinez Canillas"
 <javierm@redhat.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Anand Moon"
 <linux.amoon@gmail.com>, "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
 <20260407-orangepi-sd-card-uhs-v6-5-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-5-b5b8a1b2bfc8@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NhdiEwnVOUqEtK9rx+pHVF8kFsreCVp/RwxLRClWLSneN9acdashbOyA
	KwEvA1AH7fxFCwvYhmMogt9mXaolPQMHBNkbBzGuUq3jj8Va6/ZmcAJhjTLI1Gj8HPjU2Io
	UImhl6D11VOZkP221TQk/r4aZIsoukUftWCjMvLMzDNbwvPzsZHV9NdCsEBnOzVc5JH8VUS
	2dKoiWiC9Mf6TAxB0L5DAS0sDvjPICRD20eGCYAwQFmg+RbPfQFAgNV3FUGsFm2XSVLozCt
	J1/JfRPQGk/Hfcm+DtNj2n07Xk2gcLWJGCzO7T4qVUsGlvzVWhgde90ZUaEyngak/XLNxL8
	RwHI+3l1ek68SLPbob8j3gnkMKmBGjv0fKCRS/JWuqRFx1JkQuLtZoOGRQ59kNqm+f8dWjt
	8gpdNH2I+NYQe1syMrdgdok8BFyyt3qi8RZ/jMLGaq3Kcyz4aHzuUgyi6LVqDNSP78GmFAf
	eRXii+mF1OPFh0y12M43Z+c9zF7IZROPdKQIx7hvkwqCg50fO8hOWd8f2UgUPVZ7fdsy4gm
	RgpuUJsMG9P+W+q1owS6hQSsbTiklDIbKWSzwKnNS/QRyvdV1Vq7hACSLgn7Odz5WNac0k2
	kqU92aU01CkzBF22meT86vemIjOY2wXnv1lUkqvzZbU3p/yY5AoIMfA63zp6Fd3lMDJzcCB
	AFpbV2VCutkXoa7FlmbMGdOfnCG4QRY4ZoRXRwiJUxoWUsX2dYsstnNxG2tGiOLaXQLv115
	u9S6yCh6SODHQEqAUN5o6idaNga/JOBqEPomgDxsMi0agBicte8llCMQCFTGSzEf9mhk1i5
	szxwcyXqJRDxlrfwUMWnu8yfwMShbm838kchrQccpLaA3Z2wG1iSrWzwdEk9Xu+XN4Y4Tg4
	hzVOYfa0RcHihCc5FlNEOatVaJ23+ot9XdQWJhaISOXch/nSpW32vtCD2OVWOulawK992w0
	ZtEEqrVZTXCiLbNum+Emw59vHgjjgxcb3Km9xfMCgwceO704MBCF1rs3J4dHDVCAunEkbk7
	0dSiuzejC9VYAb9CZiTKmBuWrvmqrUIKb4LfO5oA==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_001827_017977_005D4133 
X-CRM114-Status: UNSURE (   4.99  )
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

On Tue Apr 7, 2026 at 4:25 PM CST, Iker Pedrosa wrote:
> Add SD card controller infrastructure for SpacemiT K1 SoC with complete
> pinctrl support for both standard and UHS modes.
>
> - Add sdhci0 controller definition with clocks, resets and interrupts
> - Add mmc1_cfg pinctrl for 3.3V standard SD operation
> - Add mmc1_uhs_cfg pinctrl for 1.8V UHS high-speed operation
> - Configure appropriate drive strength and power-source properties
>
> This provides complete SD card infrastructure that K1-based boards can
> enable.
>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
