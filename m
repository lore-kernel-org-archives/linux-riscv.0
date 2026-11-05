Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420BE606A332
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 10:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MopsPtsz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=TBry9vQL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BJCNgHHT9LdHBjhvYZuFsxbIscYn0hbPI4MSwHAnhdQ=; b=MopsPtszhWMyOEo0VPqtxnb8x/
	/cNSmZcbXw3vrMPY09yxikX2GikjIHDh8S3yU6OCLzIYfr9p6eptWHO3xf27L5ocWanf4CpVUK85I
	RQyoqaEG6vgzlaq82gRlV4h2PwfaGxtdigj0VS1cNRx053xf41KQ5wpDH9aa7cSfEb7HcSe1dYU65
	sa5Qs5efK55TTxKc1DPY7kLtjn/WJdlJ1X1afc0xNsaTDiM11qg0kSVkargKU0+WRqhzSx7uWfMMD
	zkVDdFR3JhwN/hVriTLeuOZrSW7E6BvmKunm368WY4cwirD2h6yDfVYBVPBwz2Yf00hI8/mgKNpI/
	5svjsLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuvi-00000008UMG-2fBA;
	Thu, 05 Nov 2026 10:42:50 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOuvg-00000008UL8-1ClQ
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 10:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793875341;
	bh=LY48cpV0y54qEv+ziTpWevRO8FRdZm6CABLVHzZZ+3I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TBry9vQLy9zXjlzdD3mWMp0vCGbmJRard8DI1NekNJ8v9IEzcDd2wRrQ+wtMkpzKI
	 bbON9/TC6zvv7ZF/nYCLXhF2kqdINuVz5NjU5+/3KhN+r3IL++BEWtXByMA961lr63
	 5HKtD+j2Y7AwQA0QwhTJLFt5tO2rv6yLjWUwDR3dp+Aat6+6tozWUCHMZSnMAIjRHg
	 S/YnpZt6mmDLqrQpq7ATUWePWVcD6+MhRHZWwNG6E0nHlI6qdslQJJjpy5dwSBA64S
	 CuFj2bN66jqxyxD2muvdE8NXC9W2m3TND81rZETFSF+LbK3DdtselDhJL79w6e8sgo
	 8nHiNed7bvZ0A==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 63687B22067C;
	Thu,  5 Nov 2026 11:42:19 +0100 (CET)
Message-ID: <0c4b79f0-383a-4884-8132-59dcb3487cd3@freeshell.de>
Date: Thu, 5 Nov 2026 02:42:11 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] riscv: defconfig: Enable AT24 EEPROM and ONIE TLV
 layout
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-4-138b39d74602@linux.spacemit.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-4-138b39d74602@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_024248_799074_929FD50B 
X-CRM114-Status: GOOD (  14.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 00:23, Troy Mitchell wrote:
> The OrangePi RV2 and R2S device trees take the Ethernet MAC address from
> the ONIE TLV data in an AT24 EEPROM, and the K3 CoM260 module stores its
> MAC address the same way. Without the EEPROM driver and the ONIE TLV
> layout, the MAC address lookup keeps returning -EPROBE_DEFER and the
> Ethernet controller never probes unless the bootloader passes a MAC
> address in the device tree.
> 
> Enable both drivers as built-in so the MAC address is available as soon
> as the Ethernet driver probes, including for network root file systems.

This does not make sense for platforms which have no use for EEPROM
driver in Linux userspace.

> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 04ae305d5511..a76f801d8eed 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -276,6 +276,8 @@ CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
>  CONFIG_PHY_STARFIVE_JH7110_PCIE=m
>  CONFIG_PHY_STARFIVE_JH7110_USB=m
>  CONFIG_LIBNVDIMM=y
> +CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
> +CONFIG_EEPROM_AT24=y

Enabled as module, please.

>  CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_EXT4_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> 

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
