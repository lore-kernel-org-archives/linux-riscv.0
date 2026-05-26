Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9828BCD5BD0
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 09:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aOoHXoOCuHqViuFYwXMLYbp3MGjz6ARG6Md+YURVD4=; b=BjtzJn5ZBX5YJC
	FUiH2HIgJZkAgqtNcF0z587o7ktGIH/VsNo7DYP8xXBkOU+auhEVHSCP8Ev1DRQeKYWjFYJDRPZWZ
	zAplMUm02wUcdGj5Sl+xGh65yaEFJYQD1MN/sxD4LNDET3LMKfwHmltZxbOrit3goiJZymI434ZEH
	/9H07c2RcE5OugJWYMPTob+XXnJPH3AfTsqEZ4pyE+GWlSUHKqiocBjNmxNnKsTPEQ9IYKAVp4rZn
	xAYURumgoGbGoft32VvG9cJx8ATp1l0OGE09mSTApYiCB+aH+ULhMt0J/Fa14JaTuqpZEHMju8ZLO
	z1+og9atCHd5k9+ZWfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnwx-00000001UGi-1YSf;
	Tue, 26 May 2026 09:19:47 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnwt-00000001UFn-3mht
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 09:19:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779787168; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JIrEVqJ0TMbi0HtAi0k5V+51uQCyo2vmQ9PKNOfSQtrHNYPTeFAcAiBABel03mgbMQjwxoGoWikHE5yABgRVvfx7Ee12bPZ42+YHzsfbuu8r5bi7tROZptsKuCVlSFdMRiZKMPXFuMMp2pk3rC+XS8Pzq7n8niiYaZBpusJn3u0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779787168; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ywuraUoobG5iXyRju55nMkUCMQe8hLMWoiieILN/9+Y=; 
	b=l1lAVHamrrefVTmM0MHl6njbyTFyjb/1QunIro9rEijAosUxCVTf6l3GYIMvaEas/7cmEQmyx2mlptWfnhTSkEnoD67tjjnwPOTcCu1OMPVwkdwC5aaxTKQPIjEU7uueUjhLsEMusoVuZC03YwfZiX6tCrdNUDC+QO30bzXNZsw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779787168;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Cc:Cc:Subject:Subject:References:In-Reply-To:Reply-To;
	bh=ywuraUoobG5iXyRju55nMkUCMQe8hLMWoiieILN/9+Y=;
	b=MbXe9j8AZm5LEtY1vZiSmrOe/H/ptnBsC4rQ08l7O0GlUi4GTvGcVOlYDEhXSoDZ
	T3tjeBb+EbTjx9NPvuJaj+EklyunZR/ihV3Hc7JKe7T9Eoz50zv1kz0iD8lkjOf4Rhv
	loa7g/XsebwtQXeZ4KSEM3NnDCCrIrjqh9euFkUM=
Received: by mx.zohomail.com with SMTPS id 1779787165669872.6342516749677;
	Tue, 26 May 2026 02:19:25 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 26 May 2026 17:19:10 +0800
Message-Id: <DISHW1IU3XJB.2WPBE8JXZUO54@pigmoral.tech>
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Yixun Lan" <dlan@kernel.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Vivian Wang"
 <wangruikang@iscas.ac.cn>, "Paolo Abeni" <pabeni@redhat.com>, "Guodong Xu"
 <guodong@riscstar.com>, "Yangyu Chen" <cyy@cyyself.name>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: k1: Split gmac_clk_ref into
 independent pinctrl groups
X-Mailer: aerc 0.21.0
References: <20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech>
 <20260522-bpi-cm6-v1-2-707ef1917a30@pigmoral.tech>
 <20260526044808-GKA3727415@kernel.org>
In-Reply-To: <20260526044808-GKA3727415@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_021944_301387_93458730 
X-CRM114-Status: GOOD (  15.33  )
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

Hi Yixun,

On Tue May 26, 2026 at 12:48 PM CST, Yixun Lan wrote:
> Hi Junhui,
>
> On 18:01 Fri 22 May     , Junhui Liu wrote:
>> The gmac_clk_ref signal is optional for the GMAC controller and is not
>> strictly required for all hardware designs. In several already
>> upstreamed K1 boards, this signal remains unconnected or the
>> corresponding resistor is marked as NC.
>> 
> I've not checked all exist boards which already accepted by mainline,
> but just ask, to be sure, none of them actually used clk ref pin?
> otherwise we will result with a broken GMAC/Ethernet driver..

I've checked the schematics of the already mainlined boards where the
schematics are publicly available. All of them use on-board 25 MHz
crystals for the GMAC PHYs, and the GMAC clk ref pins are either left
unconnected or routed only through NC/0R option resistors.

I could not find the schematic for the OrangePi R2S. However, the
board picture [1] shows on-board 25 MHz crystals near the Ethernet
PHY area.

To avoid changing the existing pinmux behavior unnecessarily, I think
it is safer to keep referencing the gmac*_clk_ref_cfg groups on BPI-F3,
Jupiter and MusePi Pro. On these boards, the pins are physically routed
to the PHY through NC/0R option resistors and cannot be repurposed
for other functions anyway. Keeping this configuration preserves the
previous behavior and ensures the optional hardware path remains usable
if those option resistors are populated.

For OrangePi R2S, since I could not verify the schematic, I will also
keep the clk-ref groups to preserve the previous behavior. I will only
omit the clk-ref groups on OrangePi RV2 and BPI-CM6, where the pins are
not connected to the PHY refclk path and are used for other purposes.

I will update this in v2.

[1] http://www.orangepi.org/img/r2s/details/1.png

>
>> Furthermore, the pins for gmac0_clk_ref (GPIO 45) and gmac1_clk_ref
>> (GPIO 46) may be used as GPIOs for other functions even when the
>> Ethernet controller is active. Splitting these into independent groups
>> avoids pinmux conflicts and allows boards to use the reference clock
>> signal only when it is actually needed.
>> 
>
>> Fixes: 60775f28cfb7 ("riscv: dts: spacemit: Add Ethernet support for K1")
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
