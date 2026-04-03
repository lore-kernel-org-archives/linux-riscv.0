Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D484E7E378
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 11:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTIt81fcHF4kNnsL9a2w5v7UYyCfhXXzSXNngxUQvnc=; b=H65lGm3iXqG9Wp
	vvHBQA8CM4JFIfVklQbuBKFP2pwz4U+vEWcxHpFAvMVLUi85dBHCUMvS69jhx4oMUdmUIYC2K9q5G
	05E5NHZw1puAv+pbluT9hAbkNoMxMo7vxEK6EJ1TXFpBA5iqPSV8b2aFoowfbc1zTb/RERdMxl8+U
	H4it7EfuEX1W6W0zJu3bob2v0Rq/v1hgACCRRHbOkkKA5Ve5XR/1wO5QgIE+Dwp7umVhxDmM/33ij
	bGJj7+PwiZRHsfyusSVTsLpLRmTKdSe/Y/5vWSNSlCImFrgD/JV1c1/3iyqNuajsE/Vcnw4iqRsRa
	JYKFoojFw21JdnfA13pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8co8-00000001xmH-00H7;
	Fri, 03 Apr 2026 11:35:24 +0000
Received: from bg1.exmail.qq.com ([114.132.64.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8co4-00000001xlq-1iHH
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 11:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775216067;
	bh=qTZo8nQRqyXJC45xEJKxaXlFAAHI9lvwc+YRV5C2fcI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=OmgRxCDOZuybVe+yuWg4CLqpJ2lFRryLeSI4QTNZBh7+vSM7Oawjf//7p3XGfGazV
	 LJuX3dR5bElgAMTPidDDKxebO2wSx181AD/f7y1/4v3i5C/dMmLZ9qE9HOBPu7/wmY
	 IGe5JXEJiM4RmiYuv3GvQYfaoNIDeiBsYTW6fPc0=
X-QQ-mid: zesmtpsz8t1775216064t10693d8c
X-QQ-Originating-IP: 7rXuvyvFl5r48MADo60XkrDDRRv3xNc7tT1AJ8HW8O4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 03 Apr 2026 19:34:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14934306479577583087
EX-QQ-RecipientCnt: 16
Date: Fri, 3 Apr 2026 19:34:22 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v6 1/3] riscv: dts: spacemit: Enable i2c8 adapter for
 OrangePi RV2
Message-ID: <5007945F00CD8DE5+ac-lvrEHGuGIZC3b@kernel.org>
References: <cover.1775214644.git.gaohan@iscas.ac.cn>
 <894c94e9d087c6a924146bda9a5649c424de320b.1775214644.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <894c94e9d087c6a924146bda9a5649c424de320b.1775214644.git.gaohan@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MYha8DeKTomkgkF5q/roRvIi6azlJnj7rfN+H/f59LsiYRGdfhftKfxV
	qdelfEltC411uoT59+VBofgKv1GScTZvcSVV3ECMwklKV/AmlyAgzUKohSKp688yNRHtUqi
	tw/gaUmhJGIdByevKk0G2vG/tbkiGg6SFSVvQJaOdOKFSvi86Tnj6WKrl6yT4AP6D+GhF4h
	Y36/QQxpJH60mU8BvZ1w8KJBnhgPYpj57em12RTww64oQkDEbsvaLsFnA7u3YvdI7MAMkG+
	PTHW4jbSGeQjoWgo20Tlvvl8vh1pXdSKegmquwBomxjyEBqVrPgzLQbDDyb/sOidc+vTPX9
	yFfY+RuX4tiPFZQa/Wy1HzkvD5g7Wnnh4J7z64aN3wZ1wxsmUt9nzWXqDBwdWcrK53F9/C3
	RxWzyXNdMbZoePEeKdeINbPQsVs6Io0TpmF0PF2dkLYP4ONRoO661pKcNghJ70T9464KDId
	TXKYFUjH8GF8IDsN7zxpoaDaN1JdE4N4vqFqnUmB6OdlpDkn0K/lUYqcJ0xgr+jEyrameZo
	T3CALx6ZJ8Gm+KOkxzBb1+wzu/xLG76NY2QPcah7RaRKyH3HSH9BuKyQ7p+oIuyLopL3Taa
	KsL/hz1wo4krXclEq8DaUmrvpsQmsquqBYoLlAGnTjMgUgMgpR6tbnklol+UwoOvI4/8WB6
	Vyj02YjxL3YETCoSS90UgDzGDvIttdUNNkwExKhAJnc3ntwGmHYlhRP46ZFC7s76AblAArE
	hVILT+bQS8kNV9xgLw/9DYq5KHKkppHHz0YJNIc8sLQP+H2VhfEfdnYAK7968eb+uJp4gz2
	Me/yZieAlaOls7vAbwO3UwTK72wveQhmOUTjq/cmGq2HXdkK2SrAEhlqvDMwotJv5V7YPyQ
	2V6jPv86b1djvcrlNTlfBkaOgNFDdlLogKHxVCsrx5+uY4A5LKClzMOCIhA8VfUdQ4TtWSE
	5J56srmrDLvnTLZljdqghdzRd3lm774lqSdf44bYJcXzwyx//vH9MOShHylhGof3wQ05d6K
	8TnGr26qkTZ908eEyHWuxZtti8woDLqikkaF5v40s+TvEnMbw595ybB7zmfHA=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_043521_088036_29C06EBB 
X-CRM114-Status: GOOD (  11.74  )
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

On Fri, Apr 03, 2026 at 19:18:21 CST, Han Gao wrote:
> The adapter is used to access the SpacemiT P1 PMIC present in this board.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7b7331cb3c72..93880ba7bdfe 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -87,6 +87,12 @@ &pdma {
>  	status = "okay";
>  };
>  
> +&i2c8 {
> +	pinctrl-0 = <&i2c8_cfg>;
> +	pinctrl-names = "default";
Please keep pinctrl-names before pinctrl-0 to maintain consistency with the rest of the file.

                                              - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
