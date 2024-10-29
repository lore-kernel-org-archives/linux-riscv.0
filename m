Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6256DD3A661
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkvsN+L0d4eE6JdDXOgTkrJCWATlWTvE9EP2wXd3K1s=; b=dxBCNnmjEfLnKW
	Alz5+YeX1CuwWZ129tEDHg6nLOWGW8+4zBQCadw4lnvKW7F2KsrNvaJf/w7sM8qv13s4SMuQE6en6
	X4mtjeB/yTJAiobpOY0cO1B9v1ZJoKSHkoz+4h7O4QuGs1CKHUCxd3PS7ia6O6COi6fdL1hxYY/tz
	Dit5obEHlhLflaxXPKPjG9RUwTVkx9Ac6TS1ocsD9eC61zu88ByLjImLvBi2gvvN5+QUsadiaN1n6
	sISB0m+B3FO8Yquw7Xqmpfki/hwhFGYGd3CNLz6QhF38EZ3Hwgk5HySC55wGl+lT5ST0QhR61cvKR
	HouOh6xzWFoex7xV3jNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oPo-0000000EyaH-1nVh;
	Tue, 29 Oct 2024 15:45:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o4v-0000000EuQ6-2FNf;
	Tue, 29 Oct 2024 15:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZkWZGKb51lNq5GXpAPgw2PWMYs1TWirtQYaIbVCFreI=; b=OvgoYV8cK3ra6eKTCWqJHV5Xq8
	kS99iaBOBu3ie1hQR2qDHItGpg19YzfYpzOU+PUREQJrIGGMELasA+hN3z/58BNuOyigpa419oWZ/
	SVTLEsji6oHjXOhIBX3gZ95KTmvEAmI5maN8VpbGsa+TwotPwYLXaaV0/bnhQ1I+QRTyv6VUnEO94
	Sv/h4Y0hukbwc6WSwS3pcqUeA1AjK0Q9IJNsVcVYRrwKVNJ5bpGavzLDFblzkpDtUZRO0vl9mwRAE
	JdI/1YeEoLYIl5s5sX1c//qMe33zKwrC4NOb4+GObNkmdgKF7L5bskmXeT0Ektu7/q1BGHNnd0t7m
	3RqTYaug==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5o4r-00000009vQN-16EO;
	Tue, 29 Oct 2024 15:24:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A19205C55E2;
	Tue, 29 Oct 2024 15:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C660FC4CECD;
	Tue, 29 Oct 2024 15:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730215448;
	bh=OnfPNjPFcprKl1sN97TkhOv/xNK+Q/zpiKD+oNhDMSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E31i4+n2VfP73VqUtiK+gGGwGyJPG/gqLdz1F/Xn8gtzgIte2GFbSrzS2tWamSxWl
	 9Zw0YDHmBYpciQUj3b95NnqAHMns0WZL/efHJoyMUe+TT5Av6j75+LIOn2d10jG2Sa
	 Y/wGc+s3uqYoxSChwozTI4vlkJhehj9XoxmAnsXi9m/WRyrUAexAyJpLI7kZGMq9cI
	 Jv7t9zvjRKrRJHu6S4D0XxbuREDxDww2gja2p+62K9u14TvqnkkJV5ZTCLzYcENc29
	 ekLAvwOCsdlxLy8apvJqWVnUINaro65w+MkYq8mkZm8f4/4hV8Vcja9W6w98QyEBGi
	 YG75XcuK7bCvw==
Date: Tue, 29 Oct 2024 10:24:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>, 
	Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Huisong Li <lihuisong@huawei.com>, Linus Walleij <linusw@kernel.org>, 
	Imre Kaloz <kaloz@openwrt.org>, Karol Gugala <kgugala@antmicro.com>, 
	Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Mark Brown <broonie@kernel.org>, David Wu <david.wu@rock-chips.com>, 
	Jianqun Xu <jay.xu@rock-chips.com>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Izhar Ameer Shaikh <izhar.ameer.shaikh@amd.com>, 
	Naman Trivedi Manojbhai <naman.trivedimanojbhai@amd.com>, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
Message-ID: <7iufjf4cnoofq63vtzrnlxneyjhmuhuaq2tqflzw6nc6xpixiu@dnyh4etii2vz>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_152413_698004_F6EE997C 
X-CRM114-Status: GOOD (  11.88  )
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

On Tue, Oct 29, 2024 at 08:48:58AM GMT, Uwe Kleine-K=F6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> =

> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> =

> On the way do a few whitespace changes to make indention consistent.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Acked-by: Bjorn Andersson <andersson@kernel.org> # qcom parts

Regards,
Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
