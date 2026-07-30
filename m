Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6C5C54FD2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkNOF8LCbFAhGPmch8Foq/ovoFGer6Z2jPWNMJs867g=; b=XHge9pUd5Be+mu
	Vv61hdW7+14rvPxYygXPKe8NDT5ingbVEP7Vne4lTN6wXWhmRxv3NINjdfOeddrvTKFIgm6wHVoDQ
	08/tzvJv1ETzgAJKmLonGrtOhJsI6X/KfPILgF+shV9CbulZwT+6XQO7y/Or56RSFqmWqcEYX49Nl
	Cyj3YFhRU3LmGo+lIuIJ2SAm4t7TMRqAGOv+rkBPltsT6KmRaWMGVh9VYxGOgt/esh6VuGynhvfZF
	3Otz2U9q0On++/FiBJSIGBg1uIHPU0mRDsaYZvKX7aQIeyeNYWq+xD2vJICVFHo5pIaTfsjrUS9la
	L0I8gFmv629pWZeKx1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMX8-00000009vkL-2IHV;
	Thu, 30 Jul 2026 08:54:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMX7-00000009vjp-0I8S
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 08:54:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B9C5600BC;
	Thu, 30 Jul 2026 08:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6B71F00AC4;
	Thu, 30 Jul 2026 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785401668;
	bh=ZByW0d9Cdpsyjv8QIk+DNR+PKdVmMUnUkPl8Y2F6nP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EzNks7DHt0sEASAszaGXmT0VsGZKL3x5FCQbWEV+Dg4vmb4IC2LkJGw1PicQkXFox
	 3ADlbxyiHOFRGb2OZl7/o/gXfwfcRx7ce0EgpTAAcca0i/RaHbd92gmPnLDi4+ojAj
	 uaGH305BQgoOzZYM5gXb+ecbC40W7uGJFjdrD1lujBQRnSK0xRGw7eDfIMVagEfFON
	 52cRH5yBlEmPtwdCSc7s53d/bYW8d/0+sw4vBXx3OqPncSqwlzh1JeqZ02hl7xVXrP
	 rmwj7e0bpcGg+jtOkEVwSbaMTlh2x6xdvSxTT4Yz5qoQUAibSe7Tm2AI20IfdSUHXz
	 5XKnkCiGNdECQ==
Date: Thu, 30 Jul 2026 08:54:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
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
Message-ID: <20260730085424-GKK76518@kernel.org>
References: <20260729160749.1621415-1-aurelien@aurel32.net>
 <20260729160749.1621415-5-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729160749.1621415-5-aurelien@aurel32.net>
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

Hi Aurelien, 


On 18:00 Wed 29 Jul     , Aurelien Jarno wrote:
> Add support for the Milk-V Jupiter board with the M1 CPU. The M1 differs
> from the K1 only by its package, which provides improved cooling
> performance and allows it to run at up to 1.8 GHz instead of 1.6 GHz.
> 
> Add m1-opp.dtsi to define the 1.8 GHz operating point and the
> corresponding core voltage, based on the upstream kernel. Include it
> from m1-milkv-jupiter.dts. Raise the maximum buck1 voltage to 1.116V to
> match the new operating point.
> 
While checking the schematics, the buck1,2 provide power supply both
for cpu core and AVDD09 domain - check schematics page 9/25 [1]

the R81 is NC, so buck1,2 is actually all power supply, raise voltage will
result high risk to damage the chip (overvoltage of AVDD09 domain), so
a safe strategy would to test if M1 able to run at 1.8G without voltage 
change (still at 1.05v)?

Link: https://github.com/milkv-jupiter/jupiter-files/blob/main/hardware/v1_0/jupiter-sch-v1_0.pdf [1]

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
