Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7968C53219
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 10:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBnNW0DSO3gKvsf3NDPi+82SjflBr+zzxUazyI8YLIM=; b=jyGZ/ofMOSayGT
	s2CfGn7NTpWcHtddIqCVIW9sfwnugZwisQtCwWdD//eq5aXs75vmwIrYZOyUq1EIN8P4zGGFyG2YI
	S21j61WkKFLjXMvtb+V8QX6eeC1VvphonnIf6sQstzDymVxilM2zFKDIE4uWi40PBNreOVWbh2hb/
	UVU0pNdVY+IWg/fHp+0+kDU2XCtYrsTwkoHEzGhhS/km4drLhGVkl2jzl5LTg2/D/hFObKBSaVfNW
	t++wmBfX4MOyjhImVLbedSSJiIW8vp+oy8vR1fT8dCw38fUcilVHtK6/HH1z1po4dpm8tAg0hCZEX
	Tia3rC2p8+VOgSSBfnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woILF-00000002S3B-28Ia;
	Mon, 27 Jul 2026 10:13:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woILE-00000002S35-1oqY
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 10:13:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D962260A6D;
	Mon, 27 Jul 2026 10:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C6D1F000E9;
	Mon, 27 Jul 2026 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147227;
	bh=woRPzSTKoA0odkTUKY/2dKCO4O2CXSKgHWIUqmfe7i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j8sB76QshQgP0t1qFZyR6uVoVuZ1zDdfJ9ancaxDqxbD3VHIDck96hXIiWYIueOEM
	 oNnThK93QZJwHeE8mD3oeUu61Tf+W6DM3jKPjJV7s9X8CL+ackQ7kU5P1mM67Rfqg2
	 bOhSt6zu2RpPQw4bDZ4iKFjZ5CFRFu1tbWrzP5hyVom5P65ed6UNLmw1A2NN/FZrVU
	 AlNviDgtwwuAcpeupAcvqPXMRWgqLPqdvq/FsL+agqC7K6spdiMc0h5sQn91o3AuXM
	 ARKDIet8y2+QtkMuG6PysotfTlpBbIdMJc4JygWRBiRTLX+gaB89mPn95tIxVHJAEd
	 nRiYn3nIuJUXw==
Date: Mon, 27 Jul 2026 10:13:44 +0000
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k3: add USB controller and
 USB phy support
Message-ID: <20260727101344-GKB76518@kernel.org>
References: <20260727094726.890179-1-inochiama@gmail.com>
 <20260727094726.890179-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260727094726.890179-2-inochiama@gmail.com>
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

Hi Inochi,

On 17:47 Mon 27 Jul     , Inochi Amaoto wrote:
> Add all USB device node to the Spacemit K3.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 13 ++++++
>  arch/riscv/boot/dts/spacemit/k3.dtsi         | 42 ++++++++++++++++++++
>  2 files changed, 55 insertions(+)
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
