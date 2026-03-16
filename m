Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7E6F506D7
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BvlvxpS73KTAjnyXP0xcinX2RA/hFkbJWZ9vTylfO8=; b=L83n/GFglYjzdh
	j/8eFbFTD0AiJRbL52Gi6pK7lmruL2/p8lr3p2zNSNEQ4I4dxUFkqvs0vZxxob1A8tQ8kLFkI+iog
	IUGmf9gwWSdh0NmVcxpZ2QGZRnnJny5H26UpZrjYTT+RdIMVBPOYGTdTcCjpv1kFB4m25hpHUDjjH
	SMlxVyFpb8I4y+VH+kJ+NFJJRhsAQHfe2u7iS0vaQv+l7Zy2vOEawsaZENhTqoeL+02alI0kee4Aq
	JPvSFv6gnSeHnyZW499Ojw+0JQ4ut+2F/vFbSa2OoTUCoLPcF/I8Do6CsuF4wvC/ji5DvZ4Bv5Gt+
	ho6dS8k2JkDCsSx/vFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28jf-000000049Ry-3UiS;
	Mon, 16 Mar 2026 14:16:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28jb-000000049RM-0NBf;
	Mon, 16 Mar 2026 14:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:Subject:Cc
	:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vrjx49qS1c4VRbEHROrOEzLDXMzMiH0SqTrCzD4Zhw0=; b=MEYE97DbcJDOXYLNNmP5O3y/JI
	GokCfs0YMsf2oOMRXAM0vMLcFcjJXWmPqmhqc3Dzhozk57akv+YYCTBw55htU7vCsdANb7d7jr6IM
	MjcpgT/i/hmCesfjvFvQOb53lZV63I79XSXnHHpHfGmubvWUzBCrfQUTTRFa5v30NlkKZ9bF8unV8
	T1lvpkKn11Q0cKhguIsjNcoqgq09W5go7L8k3TtmRiN8cXbqYjk+9luReXq/sf6o/fGeYg816wMHw
	Jx29SNqx7l++HYqHgy8MjLvRKdCHQuy1kItZ567tn4NXmwz82o12cAJDV0ckjYMkxhx/MnCixrzvx
	TnKJwCQw==;
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28jW-00000006vOt-1ubH;
	Mon, 16 Mar 2026 14:15:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773670541; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CoBposcMqazqFd1+xMKyvabTT8wgg0/mlnXpFVjUProCvzagZdnllfpSmovVInbeJJJPgZx3OLWkaaYT9LIske/e9av0zIReMrC8m7a1Pl01EbbEJkz88c1rYRbBfF7wJ8qKvaJtjNISZPXkXupV5DwJB2am0O3ga1z3qyk/NDA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773670541; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vrjx49qS1c4VRbEHROrOEzLDXMzMiH0SqTrCzD4Zhw0=; 
	b=Oi/oEkm15wuQuZmm1ZHgVO7d8npgjXXcRoloMg/ThozqN3AbERkVaykq5kPmpqum4TAi4aEZnpCUWKMZjs9+W7ogjU8M1avJ/s8QAww+A5Q2tEgChIl1lq4Rw7ppsD6FWd2JujBuulREiuBHHK1bjobXHF+8ojtuFVc4GmVMbr0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773670541;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:To:To:Cc:Cc:Subject:Subject:From:From:References:In-Reply-To:Reply-To;
	bh=vrjx49qS1c4VRbEHROrOEzLDXMzMiH0SqTrCzD4Zhw0=;
	b=oN0fzVNyApkUcWujXlHnfXDoJF2oqa/uKBB8YldIBrkm5ewDuyaa1btCyia3hbxn
	1vVV6CAR+IzFMgIusZzZJD5mBd6YydyXfZ9c1q7F84ZC2S6EqtTmhOPGt6+GcXWB57t
	CiBwgz5wqSz9b/KJia0JLu9LVE597/O9Ia/xxFF4=
Received: by mx.zohomail.com with SMTPS id 1773670539523525.2968412046828;
	Mon, 16 Mar 2026 07:15:39 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 16 Mar 2026 22:15:27 +0800
Message-Id: <DH49Q7OQSIYM.1RD7H0L809JQV@pigmoral.tech>
To: "Jiayu Du" <jiayu.riscv@isrc.iscas.ac.cn>, <krzk@kernel.org>,
 <ulf.hansson@linaro.org>, <adrian.hunter@intel.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <gaohan@iscas.ac.cn>, <me@ziyao.cc>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: canaan: Add mmc nodes for K230
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260315054426.18383-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260315054426.18383-4-jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20260315054426.18383-4-jiayu.riscv@isrc.iscas.ac.cn>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_141551_471073_76492E4E 
X-CRM114-Status: UNSURE (   9.79  )
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

Hi Jiayu,
Thanks for the new version. Just a friendly reminder.

On Sun Mar 15, 2026 at 1:44 PM CST, Jiayu Du wrote:
> Add MMC nodes to K230, including eMMC and SDIO. Enable HS200 eMMC
> on the SoM and SDIO high-speed on the board.
>
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  .../boot/dts/canaan/k230-canmv-dshanpi.dts    | 56 +++++++++++++++++++
>  .../dts/canaan/k230-canmv-module-dshanpi.dtsi |  7 +++
>  arch/riscv/boot/dts/canaan/k230.dtsi          | 28 ++++++++++
>  3 files changed, 91 insertions(+)

[...]

> +
> +&sdio {
> +	bus-width = <4>;
> +	max-frequency = <50000000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc1_pins>;
> +	vmmc-supply = <&vdd_3v3>;
> +	vqmmc-supply = <&vdd_3v3>;
> +	cap-sd-highspeed;
> +	no-1-8-v;
> +	status = "okay";
>  };
>  

It seems the broken-cd property we discussed in the previous version is
not added, and also my Tested-by tag (for the whole series). Was this
intentional or just an oversight?

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
