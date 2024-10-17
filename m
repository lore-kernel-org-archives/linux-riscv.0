Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4A4D2F7EC
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 05:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0nVewDm6cy1gsHrTfG/AAODyndFfWC0iY8ShwWChsg=; b=jJMqgmBdMTYJkd
	FLY2Ng6vFCyRwk9edIBipzn9QINiGccPTWc6+DQ5t6t0fVku75S8rthIKfacoH50qKe2Mk2HCgySy
	N+GL0kPjHIntxHUr7BLlaBxEBEfhvSY7F/+ZfUNq5IQVEiaKsXsYR8T85cGNpTc7Oeu7VeuXZVHFN
	gFS7jLlz29QTuHyOkoIdGEVKAPdYsmPnmoT41DJnkg1Or3ZGZbJB50mVklgnIKjSuAAZeO81Sk+Sv
	5f1IhQmwdpugqXGJxlR3a7PVkIxqWQdywDpLJeyABHmA8vGSJFWgVUI6ggbilKghItoICrqNWgXmT
	NwYPFe7xVddfnTtFH/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1JHN-0000000DncT-3brC;
	Thu, 17 Oct 2024 05:42:33 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1JHI-0000000DnbB-2Stl
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 05:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=RaHIq55a6LBnXV+LFWzeAoe5CFUFd3OQ+yom3QaYLeE=; b=Vm3ZbYyti3LQ+4nHe4w2Uw33rz
	W4fx4Q+BywNaLd/qtX41BGm4xv/QS1icXKnvcFQEYm5EDMfR+7S5/VS9vnseyw424NG/qTuwFOciE
	rLVW2po83O0dSK0t+qOQzwcc9qopsxQ5FEBf7LkWn9IUupx/R9p4UHzELkou+XJC192pix2xX6SM2
	912fiBzS/jYm9rmLMRtpLrZFOR/RAUVUSzGIzSpTcV+MPnPTk0KnKbu/78xNo3i0aXmwSVHbP5r5r
	iYdijfPyhhBVFPflvuASPBLoZ6ifehVPvv49qVHQikJnPbT3WAF8RzIxjwWNrE1R2S/QrUnnZfwSb
	46kv3WkQ==;
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::2] helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1t1JH4-0076ml-2m;
	Thu, 17 Oct 2024 07:42:14 +0200
Date: Thu, 17 Oct 2024 07:42:12 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: starfive: disable unused csi/camss nodes
Message-ID: <ZxCjtK5rE0SZuFvf@aurel32.net>
Mail-Followup-To: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241016-moonscape-tremor-8d41e6f741ff@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241016-moonscape-tremor-8d41e6f741ff@spud>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_224229_093757_F6B1186D 
X-CRM114-Status: GOOD (  15.79  )
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

Hi,

On 2024-10-16 21:11, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Aurelien reported probe failures due to the csi node being enabled
> without having a camera attached to it. A camera was in the initial
> submissions, but was removed from the dts, as it had not actually been
> present on the board, but was from an addon board used by the
> developer of the relevant drivers. The non-camera pipeline nodes were
> not disabled when this happened and the probe failures are problematic
> for Debian. Disable them.
> 
> CC: stable@vger.kernel.org
> Fixes: 28ecaaa5af192 ("riscv: dts: starfive: jh7110: Add camera subsystem nodes")
> Closes: https://lore.kernel.org/all/Zw1-vcN4CoVkfLjU@aurel32.net/
> Reported-by: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Emil Renner Berthing <kernel@esmil.dk>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: Changhuang Liang <changhuang.liang@starfivetech.com>
> CC: devicetree@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)

Thanks for picking up that issue. I confirm this fix the "problem".

To give some more details, the problem for Debian is that it appears as
an error, with the line in red in dmesg or journalctl. However we would
like to be able to provide a kernel with such drivers enabled so that
users with a camera can just use an overlay or patch their device tree.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

Regards
Aurelien
 

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
