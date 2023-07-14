Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A40EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 15:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBrRa2+PU4+JPiMJCOTx7MkRweDa/vvQU60qVjqUxBc=; b=TP6aXLqlSyvMxu
	03jE8n16A9Wg1/otnpW9nL4JaODXLnsWLK+xuTDm+xI7N4nFiCjYBaaEp81hUsvpGLa4PmJf4IoUG
	xFwzV+IUy5YUK4dXSAdRhN4xJy88M7jE6kJuHAmMHIaeLepSLlddBm6VlculWp9ruPYVAjGuMgacJ
	YrqMNm4jyV2P+RADZluzkLROexFSiC1Gv6AdlwZ2+K/qyss6rTd6jrIT0eNetvcCzta+zSld3djua
	f1q+bp0qa5EisaN6sHT5VZ6XmulOj6f9N/4sDKYcLN/gk6jX+9fGg2BYglThTDJKBJL+rHmXZzQMi
	mGeUvFb0SPK9JWA7Fcvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKL9-006TCt-2k;
	Fri, 14 Jul 2023 15:04:15 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKL7-006TC1-01;
	Fri, 14 Jul 2023 15:04:13 +0000
Message-ID: <ccf1e027-1f36-3dfb-af65-c7eea27c89cb@infradead.org>
Date: Fri, 14 Jul 2023 08:04:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] MAINTAINERS: soc: reference maintainer profile
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Nishanth Menon <nm@ti.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
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



On 7/14/23 01:47, Krzysztof Kozlowski wrote:
> Mention the SoC maintainer profile in P: entry.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Yes, please.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f646ba70a01b..b61289fa7891 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1558,6 +1558,7 @@ M:	Olof Johansson <olof@lixom.net>
>  M:	soc@kernel.org
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> +P:	Documentation/process/maintainer-soc.rst
>  C:	irc://irc.libera.chat/armlinux
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
>  F:	Documentation/process/maintainer-soc.rst

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
