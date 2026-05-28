Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3C0CD5BD1
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PufWK0ipiJCn5bv1/cZ7IRKIGdPv75+AWkRhos8AvNU=; b=JHIz6+ibMpXVSn
	ikgmrpNSb/wTrustBTsUj9nbxCse9p+jWhSdAj7AmDvCgbNG18jNnJ7S//nTwgOClCkslL5pK0TDs
	qXDyrO6zUV8blO2zQfCO+pTApZe7vQnLssJZBe6aRf1XGCDvRINHTURRP+VTG3CGOv8TVnBx2y/W5
	gZKlYtFxFNIfhP/LQFQuY0+w5tmt1UJ4erxKI35XIKWiRZiKkPjY7+NDgDWi9sb6mSG+YGopi/PdH
	hUj+GD38l/lbcLIQimmAL5FX4RLd4khQz6SQTE/+oKbUaoQvaPnqv3O03as+RAHt6IkS4avV7tJXv
	Rt5HpyuUpt6YmNddZ+MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVlm-00000005LLk-0Aon;
	Thu, 28 May 2026 08:07:10 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVli-00000005LKn-3pEI
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 08:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=FoUxCkKBdADj2aDYfSaoRwAqvpwzfHdXt
	ZH3pXr3tG0=; b=Y/iTIwEyd/whgM5uhPL7/A/PSG+WA3uyCfxenNh9s26n4fr4S
	o17aiL1hHqrwms35HWffQ7ylrZifdH0CK0lAp3gXWtDiHtt7puvKAcI48RFlLAln
	BAw6fzgzIGk7BxoxzwgnmCsfH2GqPsuqtt14u1X5LP85jVDh5J8s42YhyM=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYUJ29xdqvacGAA--.7897S2;
	Thu, 28 May 2026 16:06:14 +0800 (CST)
MIME-Version: 1.0
Subject: Re: [PATCH 9/9] riscv: defconfig: enable ARCH_ULTRARISC
From: Jia Wang <wangjia@ultrarisc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <1b822b1e-cf1c-45c7-8109-3e0330911419@kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-9-bf559589ea8a@ultrarisc.com>
 <1b822b1e-cf1c-45c7-8109-3e0330911419@kernel.org>
Date: Thu, 28 May 2026 16:05:34 +0800
Message-Id: <177995553472.929162.16657480414876825285.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779955535; l=1137;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=XHsLZcdZtih4mQtALM8/DVTTkdZOmCds4Otw5twNvrY=;
 b=7ByGYqTxEraRbA1xL39Z4UzpQyCTeaT4ylhZFTaOEFUdMEj35h8UhsolQswAo029UVzaRsKdi
 o3MfNG/JQhOAIMaz4jPgDS8IrRJZA72ul8dG8MvOsYMj1fwOspLJmuG
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID: AQAAfwAnYUJ29xdqvacGAA--.7897S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1fCFWUurW7Cr4Dtr17Awb_yoWkGFg_Gr
	W8C34xurWxArWxuFn7XanakrsFk3WFq343Wr1xZry7W3y2gFnFvw4ktF1rJ3Z8Xr48Jrs7
	Z3yvya4qkrn0qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbT8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRRBT5DUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgAOsI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_010707_555189_8545D23B 
X-CRM114-Status: GOOD (  14.06  )
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

On 2026-05-21 22:57 +0200, Krzysztof Kozlowski wrote:
> On 15/05/2026 03:18, Jia Wang via B4 Relay wrote:
> > From: Jia Wang <wangjia@ultrarisc.com>
> > 
> > Enable `ARCH_ULTRARISC` in the default RISC-V defconfig.
> > 
> > Link: https://lore.kernel.org/lkml/20260427-ultrarisc-pcie-v4-1-98935f6cdfb5@ultrarisc.com/
> 
> Drop link, not relevant here.
>

Will drop the link, thanks.
 
> > 
> > Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> > ---
> >  arch/riscv/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index c2c37327b987..9fdc4d1831ed 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -32,6 +32,7 @@ CONFIG_SOC_STARFIVE=y
> >  CONFIG_ARCH_SUNXI=y
> >  CONFIG_ARCH_TENSTORRENT=y
> >  CONFIG_ARCH_THEAD=y
> > +CONFIG_ARCH_ULTRARISC=y
> 
> This patch should be sent with with the patch adding that config option.
>

Ack, will include it in the same series as the config option patch.
 
> 
> 
> Best regards,
> Krzysztof
>

Best regards,
Jia Wang 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
