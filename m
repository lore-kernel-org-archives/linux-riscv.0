Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB476C54FDF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 07:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbEhWk7GwfMnD2y7S0IpP+eIMTeJ9IZoecDCJ48GkVQ=; b=wxKQrElKxI4H1F
	cuQXnY0NAKtb3oywPk+Mrp/N1Esgi3Nicv3izqaCGhDNX+5Hvq5NkaBPUTmOB9LRJ0vjZU8sbePNx
	fBTHu/KQsjUa460va8+nAFPxN9T54t+wfdOCYYRRHDQ9MMhtuPya8zd/HWYo7qwvWICptgVt8aN0t
	FycGWN57oWQrX48Ku5l9jvxUp5eHmVF27mHyDdPUqRJ4wjdc5Lz/aorwzykJhn+/dTGr3ZoJGs2xp
	hUWMtIJc7vTOxY+WPiVfXMuQEFaDUakqpEuOP8Z/4nUoviBBfAvmKC3wrw2la9lybyI6LiEZ9FxdI
	hvm6Y/NqjhEbVd+n9A1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLDq-00000009kVM-0DLg;
	Thu, 30 Jul 2026 07:30:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLDo-00000009kV4-2l2T
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 07:30:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EEA83600AB;
	Thu, 30 Jul 2026 07:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FC61F000E9;
	Thu, 30 Jul 2026 07:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785396627;
	bh=ZTPrixUmtwgr78qH2RJ4wLaoGsLv7kGn8Js7Z2QIfGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VaFXP1Ck0V9BdeHJv8G5rOD483F68DwzBQkmWXUNLVFSQ45m6AOHuvklV/G+jMBrR
	 r6V6YYaqvTVzx0P8IAa2fmEWIhtMBV4Oct8sWX50dz2Swe/7qLVoE/rjoMWwOId68T
	 Xj96osaVn/qhn4l+HUunpelyPm/PFrB7FMUz2RIB90tZD28mUV44S9v1Z2xdWVX7TX
	 poT0T1gWkRXlcP1rqxnJrSp81QHSdIRXqw28Uykob9xbNjfLNa38/LWBQxfb2Mwmmn
	 ineMN+D+nEmK00UC4qVUnCHzo57lvs+vB17SBiE3KG1MZIu/zlD1Y1JNCAqpgImiN4
	 UrwNoMltTql3w==
Date: Thu, 30 Jul 2026 09:30:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	samuel.holland@sifive.com, dlan@kernel.org, guodong@riscstar.com, 
	dfustini@oss.tenstorrent.com, michal.simek@amd.com, junhui.liu@pigmoral.tech, 
	darshan.prajapati@einfochips.com, akpm@linux-foundation.org, zhangchunyan@iscas.ac.cn, 
	luxu.kernel@bytedance.com, pincheng.plct@isrc.iscas.ac.cn, nick.hu@sifive.com, 
	jim.shu@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com, 
	robin.randhawa@sifive.com, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, anup@brainfault.org, pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH v2 2/3] dt-bindings: riscv: Add Worlds per-hart properties
Message-ID: <20260730-glossy-pompous-quokka-c05c60@quoll>
References: <20260729163908.249838-1-peter.lin@sifive.com>
 <20260729163908.249838-3-peter.lin@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729163908.249838-3-peter.lin@sifive.com>
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

On Thu, Jul 30, 2026 at 12:39:07AM +0800, Yu-Chien Peter Lin wrote:
> +  riscv,pmlwidlist:
> +    $ref: /schemas/types.yaml#/definitions/uint64
> +    description:
> +      Optional bitmask of WIDs available for S-mode and U-mode use on this hart; each
> +      set bit N indicates WID N is available. Firmware may read this to select platform
> +      authorized WIDs for lower-privilege modes.
>    # RISC-V has multiple properties for cache op block sizes as the sizes
>    # differ between individual CBO extensions
>    cache-op-block-size: false
> diff --git a/Documentation/devicetree/bindings/riscv/worlds.yaml b/Documentation/devicetree/bindings/riscv/worlds.yaml
> new file mode 100644
> index 000000000000..cc8b3747591e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/worlds.yaml

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/worlds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Worlds Extension
> +
> +maintainers:
> +  - Yu-Chien Peter Lin <peter.lin@sifive.com>
> +
> +description: |
> +  The RISC-V Worlds ISA extension, as described in the RISC-V Privileged
> +  Specification, adds World ID tagging for context isolation.
> +
> +  This binding describes the system-wide Worlds configuration for the /cpus node
> +  and is used alongside per-hart Worlds-related properties such as riscv,pmwid in
> +  the RISC-V CPU binding and Worlds-related ISA extensions enumerated via
> +  riscv,isa-extensions.
> +
> +select:
> +  properties:
> +    $nodename:
> +      pattern: "^cpus$"
> +
> +properties:
> +  riscv,nworlds:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Number of World IDs (WIDs) supported by the platform. This is a system-wide
> +      property that describes the total number of isolation contexts available.
> +      Hardware components such as the WorldGuard Checker use this to determine
> +      the valid range of WID values.

Does not look like property of CPUs, but the "WorldGuard Checker" device
node.

Anyway, SoC compatible defines this. Don't add redundant properties.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
