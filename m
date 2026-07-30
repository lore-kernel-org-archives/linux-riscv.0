Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59672C54FDF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxo190SPhd24x5rM77m7UI8BTHEulJDx+/ZFQTIo/RA=; b=fJRvp16WmexlU0
	vzyOiUyrpNESFELyLFVy0xtdf20XukPtwn8pb5U7bWYY38MIh/Fbs5AoFz9s7Hb/J3F7WrqEeRhm1
	JKQS0zKAdh2/ZAK0H8dEuW9KUKn1/uQNiVKx3YP/xoDwFMe7I8YsCkHUvG+dkQi/ht6eTep/szVun
	xdkuKNjY5fGHUFS1awXJIjBv71/dD8qxmtxRtfYowAeB3rfniB+p4ZnovdFTkD/CYLu4O8XNaZFEz
	wBGE9JzYrY8usBqJ2RNxrGeA443UuI54slvv4WGvTm6Kn6pCsvFIpoqMRNFAwe8mOk1a1oMBKt070
	ilzi7ewWrtwWAEy3HfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNlr-0000000A9sy-1noa;
	Thu, 30 Jul 2026 10:13:47 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpNlp-0000000A9rx-0Jft
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 10:13:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=dWQdDtWejUihFsUBZUvRz7z1CPw3WKWc0VH0sn0ICaA=; b=B7OBgiAc7Xus328CRgIwveVb5z
	/UKeuH9iTvEj22RSqfOMvUJIPTijQKYLEdUklJSNN743n3Dece/9iF2FEjH/5Aju7EFF62vVigDmt
	LoI9fEARdIZzqSDz4v2ExEntOS1X/K/8moBG8I162i4sHRfSWAxPWPnOYEHk4NNSFejGlW6+m3fw+
	WGNU9eHgtv7Vw9866p8EDt8bK8+yIARuqRY+YNDHlkpuaMhM4mwvO/X7Aw5NGVH+Pceulqa/aHJm+
	uqDVd7JjuPvRrb9Sa4xAIChnMKKINfg9gk5mpwA+43q012GrLUwl2ZYeA3SS7Sk3IVEwMOxyhgbcM
	YI7mFZRA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wpNlm-00000003zvy-3Usl;
	Thu, 30 Jul 2026 12:13:42 +0200
Date: Thu, 30 Jul 2026 12:13:38 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: Add Milk-V Jupiter board
 (M1)
Message-ID: <amsj0kK6LtnxRT_J@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
 <20260729160749.1621415-5-aurelien@aurel32.net>
 <20260730085424-GKK76518@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260730085424-GKK76518@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_031345_616128_CBDA2460 
X-CRM114-Status: GOOD (  15.86  )
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

On 2026-07-30 08:54, Yixun Lan wrote:
> Hi Aurelien, 
> 
> 
> On 18:00 Wed 29 Jul     , Aurelien Jarno wrote:
> > Add support for the Milk-V Jupiter board with the M1 CPU. The M1 differs
> > from the K1 only by its package, which provides improved cooling
> > performance and allows it to run at up to 1.8 GHz instead of 1.6 GHz.
> > 
> > Add m1-opp.dtsi to define the 1.8 GHz operating point and the
> > corresponding core voltage, based on the upstream kernel. Include it
> > from m1-milkv-jupiter.dts. Raise the maximum buck1 voltage to 1.116V to
> > match the new operating point.
> > 
> While checking the schematics, the buck1,2 provide power supply both
> for cpu core and AVDD09 domain - check schematics page 9/25 [1]
> 
> the R81 is NC, so buck1,2 is actually all power supply, raise voltage will
> result high risk to damage the chip (overvoltage of AVDD09 domain), so

Yes, both buck1 and buck2 supply the CPU core. I only raised buck1 here, 
because it's the only one controlled by the cpu scaling, but in practice 
I believe that configuring the PMIC as Dual-Phase Mode couple the two 
regulator at the hardware level and only the first one need to be set. 
See my analysis there:
https://lore.kernel.org/spacemit/178402025712.1568061.9223355686030414906.b4-ty@b4/T/#m828e80aaf454606baafbd43e3795089ba397145f

But I can indeed raise both values for consistency.

> a safe strategy would to test if M1 able to run at 1.8G without voltage 
> change (still at 1.05v)?

I'll try that, but my guess is that given the vendor kernel raises the 
voltage to 1.116V, it is actually needed.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
