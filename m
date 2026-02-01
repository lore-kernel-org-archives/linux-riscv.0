Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA0FE7C719
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Feb 2026 11:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+tTrBYWpj9QqqvjCyAKDE9R/0hzdmtV9hBB3dIy4OA=; b=4WG3M3On/LrSce
	35g3aR7YuNBnqVnu88CeLkeZUzDK9eVNruGmFL/pclmkl0UW2aw1CRUvEjWe7jAHnU3DmVT6qaxjX
	2RPWlRtR6J2IHzq/aPgmaD+YganNQLuHAn4f48t0y4mNPUTPqKgptqxfjUT7uqNs+NQLPaljb2HSv
	03LdP8aVdYC08dvRE4FGgXogeC8+So4afqbWMxhCZz9Alhjb4YH1jMvQX5+ImJJ0CkXICcDYOXZOn
	EAn3QwERqhWzhJMEjY0hSbLdqO288jUG0Q6M1iTmEc2FaaWxgeFx/oyiOBYTd161qtyLMJ3N3+edV
	5QpDqT+hzNFZGp3cYdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVbn-00000003SiA-22oK;
	Sun, 01 Feb 2026 11:27:15 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmVbk-00000003Shi-2kZs
	for linux-riscv@lists.infradead.org;
	Sun, 01 Feb 2026 11:27:14 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0F610341EB5;
	Sun, 01 Feb 2026 11:27:08 +0000 (UTC)
Date: Sun, 1 Feb 2026 19:26:58 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH 0/7] riscv: dts: spacemit: Add PMIC regulators usb pcie
Message-ID: <20260201112658-GYA109598@gentoo.org>
References: <cover.1769895215.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1769895215.git.gaohan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_032712_886942_E2BC3FD4 
X-CRM114-Status: UNSURE (   9.93  )
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

Hi Han,

On 05:38 Sun 01 Feb     , Han Gao wrote:
> This patch series enables the PMIC, voltage regulators, usb and pcie
> for the OrangePi rv2 board.
> 
It's obvious too late for v6.20, besides this series depend on P1 PMIC
patch which haven't settled down.. Guodong is working on v3, see

https://lore.kernel.org/all/CAH1PCMYmK=cenJAvhGdZuh68fwNu-c_JJFpyztZUXvcOTv0YSg@mail.gmail.com/

> Han Gao (7):
>   riscv: dts: spacemit: Enable i2c8 adapter for OrangePi RV2
>   riscv: dts: spacemit: Define fixed regulators for OrangePi RV2
>   riscv: dts: spacemit: Define the P1 PMIC regulators for OrangePi RV2
>   riscv: dts: spacemit: Enable USB3.0 on OrangePi RV2
>   riscv: dts: spacemit: Update PMIC supply properties for OrangePi RV2
>   riscv: dts: spacemit: Add a PCIe regulator for OrangePi RV2
>   riscv: dts: spacemit: PCIe and PHY-related updates for OrangePi RV2
> 
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 235 ++++++++++++++++++
>  1 file changed, 235 insertions(+)
> 
> 
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> prerequisite-patch-id: 32d6acfcb4801407e38510b391407943e9a8ec82
> prerequisite-patch-id: ae644485e1a8ead3fa7a087c8db9062c7acc14ff
> prerequisite-patch-id: 605d537aa0f8387b3523786a875c76b9edfbcbb4
> prerequisite-patch-id: faab9c820ac67de42c40f2c4578bb5b8753fcb71
> prerequisite-patch-id: f9c4643cc99e5b9f1acc9daf1e679b95f81cee73
> prerequisite-patch-id: 50138c8918218ea3b8650999bd558ed6350ed2f2
> prerequisite-patch-id: f8f91e32361cc99c531170c39ed54cd1b3c5997d
> prerequisite-patch-id: 475d1968c0c41895578809410c9bd8fe24997de4
> prerequisite-patch-id: c40f1562f712f04578ef58472840d257a19919fe
> prerequisite-patch-id: e9ef3af6c80187e6f05444704d13212d3beaf40a
> prerequisite-patch-id: 7076909bb4103588b4761d175eca40bce470230f
> prerequisite-patch-id: 0c859b4d131b3360875c795c6148c6176b55fb91
> prerequisite-patch-id: 2ed98dc1ab0f5ed923cc252415c345dc8caf6f17
> prerequisite-patch-id: 1be1a031763fac029076a768f012af31e455be66
> prerequisite-patch-id: 21bb8387c946e050910440e7a7622305d46d946d
> prerequisite-patch-id: f3bdc2c74b230663710086bd770a755d56cb8b9c
> prerequisite-patch-id: ba6a7df5c7a2fa9ce0b8a72a9177e42a4dcdab01
> prerequisite-patch-id: 33fd23112b55b5e6b1e276594826ee454afc1c7e
> prerequisite-patch-id: 009a5aaff0768d90d148eb9d5d999c5098fd6d93
> prerequisite-patch-id: 7e41df07cbce163a689f5dca246b98a0122d1610
> -- 
> 2.47.3
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
