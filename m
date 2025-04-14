Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322ACC369AE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 07:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKECF/7kx7qaeTOnpME+E0gAyxNc6X19MK0huq4ePGk=; b=Va0NyyBy/RtG1e
	UdWYG6dDwDnvMzBiKXeMpvvualX5TUQ8UxZPA6Qe318V6zgJ28WRbAQK+9v6WA30TdhulQTAVCYH+
	ekbjV4QuLDel6cYAxKsER3zfPgwAUL0+vBmEr3eqwK7gj++ifLa0YaX2CPQTtBxxjU36KQOYp0Z6O
	FaQaaeSPRHrvL8+K/0vZAK2DXC9LD4LesZyR7Mkzl4hLbjpGzTGbunJr95qAV/OojbnFTqYDxrvFE
	EjycZxO626zzuvD6CSmAoDtn93e1nSdoP3/pIUkv0/zRz+NpyWyyTvdWCngXZj+SFkAROfxfWUQhQ
	P65oE/ozsmMAStk0wi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EFH-00000000vbe-0p99;
	Mon, 14 Apr 2025 07:28:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EEN-00000000vWI-28lx
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 07:27:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 440A060007;
	Mon, 14 Apr 2025 07:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0610C4CEE2;
	Mon, 14 Apr 2025 07:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615666;
	bh=6t46hUDT3sRy0Y1X6ouDrUUHbzkpk+wzcw4qHxwvP4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSC4JuZgAwwn7OOZRWoFg9NutKwcwC3CKPZ+jd+afI88+aurFCl4GMgoUP/gtGKQB
	 3KvR69xcLmbGUl48GAZuH2vMci3aKnPGeMQDfI8HueQ/LUPMcqBQsWaVXE3uYKG82G
	 llnrJEMzhTUmkWzHTDY6M15cp0Act5sm2AGZiZVZ0NhpJiJ88ZOwCvo88t/NoGT+IL
	 QevSlAOdp3R/ZIzgxKTd2MdcPHWbyX7MdmAU1yZnnzXUgq05wnObPp25tfIsxyy3NL
	 jV23ZQpUCbMfGEMbOmcZOiGMhTNYID3IQadTucL3ybHa5JbGe7IH+Kw2ugKIqaO+Yq
	 Z/rFXHJt9vKvg==
Date: Mon, 14 Apr 2025 09:27:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: i2c: dw: merge duplicate
 compatible entry.
Message-ID: <20250414-strange-oxpecker-of-strength-dd6ef5@shite>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250413223507.46480-2-inochiama@gmail.com>
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

On Mon, Apr 14, 2025 at 06:34:55AM GMT, Inochi Amaoto wrote:
> Each vendor have an items entry of its own compatible, It is needless
> and some can be merged as it share the same base "snps,designware-i2c"
> compatible.
> 
> Merge the duplicate compatible entry into one item entry.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
