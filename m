Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B33DD778B1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jan 2026 23:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUciQfL1oSqA7whRoLoOGAvg/BQxDQLvtGLpyQ40KqQ=; b=A09B6nHdA6tWze
	+SvbJjG09w8OT2UZ4lvD3KrKCAr4oHhY7ACzfAClZIWH5KXJpHmSJrW1XKJOUnzgeGdzF2irhdyzF
	J/gIp3NkbqZntpTMzWL/54s0MN+LoXiQow7D9iMwanb8f48GSsUj5QfjWj6MKq4obINBZfllxS1xA
	R6MHeqv2ZYMcUsXyeGKI7dqkmrS6tD3zEXKbyf3NIeO1aVpTS4mc3l0qb4JEj32DSK2MIF4F4C3ki
	+AesopY0lX4U3IiQLmqT9uGtiNsM/EKiStzcUtkR3sQoTRDpwaFmLqaWDPSaxP8lloSciJGw0KEWb
	SvCHNfsSQ5Yi/zMFYXPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjR2i-00000009axa-36fV;
	Fri, 23 Jan 2026 23:58:20 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjR2g-00000009axE-2gD5
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jan 2026 23:58:19 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 555AD341051;
	Fri, 23 Jan 2026 23:58:16 +0000 (UTC)
Date: Sat, 24 Jan 2026 07:58:11 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: add fixed regulators for
 OrangePi
Message-ID: <20260123235811-GYB71302@gentoo.org>
References: <20260119030251-GYD47382@gentoo.org>
 <20260123145015.1926865-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123145015.1926865-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_155818_703797_CD673351 
X-CRM114-Status: GOOD (  13.02  )
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

Hi Chunkun,

On 22:50 Fri 23 Jan     , Chukun Pan wrote:
> Hi,
> 
> > > +	pcie_vcc3v3: regulator-pcie-vcc3v3 {
> > can you follow the same name scheme with k1-bananapi-f3.dts?
> 
> Sorry, but I don't quite understand?
> 
> From fixed-regulator.yaml:
> properties:
>   $nodename:
>     anyOf:
>       - description: Preferred name is 'regulator-[0-9]v[0-9]'
>         pattern: '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
>       - description: Any name allowed
>         deprecated: true
> 
> Using 'regulator-' as a prefix is correct.
> There are also some commits that changed regulator nodenames. [1]
Ok, good to know, then I'm fine with the prefix

> 
> As for the regulator-name, it should be consistent with the name in
> the schematics so that people can look it up between the two.
> The BPI-F3 also seems to have some names [2] that need improvement:
> 
> vcc_4v     -> vcc4v0_sys
> USB30_HUB  -> vcc5v0_hub
> USB30_VBUS -> 5v_vbus
> vin-supply    vcc5v0_sys
I do not have strong preference to have label/node name *strictly* matched
with the schematics, IMO, keeping certain alignment is ok, you can still
make some adjustment as long as keep it clean and explicit..
also it's still helpful to give a high level abstract name in 'regulator-name'
for the end user to know what's the regulator connect to.. e.g. in
 /sys/kernel/debug/regulator/regulator_summary

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
