Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A73CAC5A7
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 02:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UN6ptEwhjRYgoUEupi6w0PjAAbAO9gGf3MtdhkgaPlA=; b=zLm4L3/Erg0SRT
	eWFDCjn0daRnXWBNib1X6XC5qI1AoutcFgvSRbgZyUex0EqlqMSYKjwiDxQL0kbeAzIENQ7A9U+5o
	aoiBsDT1sFyzJvVVYZd+gFd/xeaKDTq+LsFkmMMNtVQ9ktjYHbe9wZG6W5nSahRoSoz/u2D7M+yOC
	xtmeHPSeuD0w7yYqOjjvJDmkYeCcFIz1FpQVr0MBoUefwo1KPJwldGx9uqGW7JisBgZUO1l7oYEMh
	bjr8E3DneLnIumVd+Mr8ewrEqTpsvWc2KP9x4uETaqEdhCaIhLfesvTInwBSXiOI/FDus5nvS0SXL
	ncEm6YF6C6T//1IaS1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sM7-0000000C4zI-3jsf;
	Tue, 23 Sep 2025 02:02:11 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0sM5-0000000C4xz-0tkQ
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 02:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758592841;
	bh=MEAuKrwM6KdwR90xbDZhYiFbRD7stRJVqn5Ua3qlyBs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ivn9tQydLf/OpeMt8xGn3J6lK0YLp+iCelSjUPO0ApHZDndGNAV1JFapZyjCUKnoh
	 8H/o8PWE11M/y5W+SHKW7+s17ZufXuIYBH+nv4oC2eLvm6adVL+fwWkYG/+P6mvRk2
	 sVV5LRpBgO+RSlKwwLL0KaJxkKQFrZdIaaHXtT8A=
X-QQ-mid: zesmtpgz8t1758592839t273fee33
X-QQ-Originating-IP: GzXckMxXGTPsUWDBYYMmo0syLdSfJ5174o/VNKjj6ck=
Received: from = ( [14.123.255.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 10:00:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12168466649984093045
EX-QQ-RecipientCnt: 14
Date: Tue, 23 Sep 2025 10:00:38 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 2/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Message-ID: <6CF6078CFA2EB2F4+aNH_RmNkM_hnsAYu@LT-Guozexi>
References: <20250921210237.943370-1-aurelien@aurel32.net>
 <20250921210237.943370-3-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250921210237.943370-3-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OVFdYp27KdlJW5P1i9N85qCgmbbqSwGFn2kOiYlbrRc6HfxrE39J2U2j
	qp9TBzVCz7B988NSl83HMVD84Cmp+ZA8PT60tNyyMsRp6aACMN8Gdd58JlsvWLNccaAJ4MI
	WVbZB3oJ6NrpkeyqvLWu/CnWYPlJl75hSx99FlCRlkySqxLUzkRUuYq20qVGbj9pCz4vTa6
	v9NmAlmko30L9GGGHVzvtIrXNlBUgODm0NpS9w1E5G4aN0rg5QQ+Cj3ra891gSjziot6ed9
	uBzHxRXOz4sH6l09R9dnBsOXJ+JwLrDpAexYBDgTX1GlAUeX6pqLqPimjwiiVdH7f8eGhNF
	YU9AxZtbhsGPgJbqppW0NjrKYt6vW5CtZnyflJgd4x3PTOzftV94JQlel2deAeOYRbv1mQe
	6heyQaypxHXIsIm/vMg+rAAolPFDlHvo58NpYR4Q6RAtQKEPCqrKxCz7ngyh+XhiWviW8zr
	YRSZRU84VOnrd9T9HbDt7lQSNiSCOjUTp2Nqts4Ts1lvXxBn6gPwMiCetSZF4Agx3BVOu89
	yEEQ3kVNwMl6OS21ePconhJdiJKZEXFh+e5dpD2LV7ftZOQ76dpmqUbEr1h8Ll7bpBPVTuC
	p/C6JEroS2SUI1VyNyDvi16cUNxpQiNhwvXjyHC8nYAxmJgCvgS2k37N+rB8cfpzJ0gvyKo
	FhVknGxMyF9YHtbUgH4u4tvGEVeA1RtzZRpAdhAEGA+/a2JYOwtGzh+6h9MhR/X4s7TNn3R
	RlO4qwss0xROymYv+T5t16rqKATs9SFRsgugR3WvONK2oa8dqdiVPpxQ/DcCe15LworseRq
	5scYmYEw4aZZlzcBvXzxVaRnV+o6qb9OvgE9jUsFxTIfiFUmkqqTuZL2Dp6SC1+OMSvVFCA
	V21ed7r/xcZh46EP9L7N3VFkgM9ZZpOutGTHicfSIL0iAwjGBAwTM1Oj5r+APDg1XOT2Npq
	1M9BeLP1LNEhm/uqT2l2hCq6+DCxnb2pIkRrf+JMXQtj1RC9s6lZr4/LBQg+jA/ima2xJ3M
	05cpzFAE5n/mi6h3I6npcc9HYiBsQ2MWuhUE6+MhbXQVDbCLcFAIIXqY66je/8O1MEtJbFN
	eRJQKidzvTDzNaaGtd8rLJsiJbIg+Ag3mGk9P32n7eTiLoCrfvLudk=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_190209_744550_D3D44EFF 
X-CRM114-Status: GOOD (  17.74  )
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

On Sun, Sep 21, 2025 at 11:01:42PM +0200, Aurelien Jarno wrote:
> The BPI-F3 contains a 24c02 eeprom, that contains among other things the
> MAC addresses of the two network interfaces. For this reason, mark it as
> read-only.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 3b6e4f52e9aad..574d10fdf9b82 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -115,6 +115,15 @@ &i2c2 {
>  	pinctrl-0 = <&i2c2_0_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c02";
> +		reg = <0x50>;
> +		vcc-supply = <&vcc1v8_sys>;
> +		pagesize = <16>;
I'm not sure this is 16..
Could you double check it?

                - Troy
> +		read-only;
> +		size = <256>;
> +	};
>  };
>  
>  &i2c8 {
> @@ -143,7 +152,7 @@ buck2 {
>  				regulator-always-on;
>  			};
>  
> -			buck3 {
> +			vcc1v8_sys: buck3 {
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> -- 
> 2.47.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
