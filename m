Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DADBCD6E4A
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 06:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbjeUFTqbyoAfl+ehp07nE40ehNiKk0dp7M9abqJUfg=; b=Oeww8Zo3xaXO8q
	QrTfc8s3V3xZrlxtdj6gG0/J30C1/VN4rwx/E0/x5gYNsqbQrLp2VtfxKNRA343QNuzhcHizLXNgn
	XLFPXDmnadF7hB7FdFh9usBnJCxFM3ITvV2wzqX4oWkbaT8jmeTS87ALUX/GuTmz//EIwJtxyAv9Y
	z7uibgGNg6h4m9ZugNIZqd5DR34DYo8RG2l2k6jd56OxQaEcWcSr9jj6y4IJG/VqFHiPtnr658nHF
	rVpfN0tBK0qwVDQnFk4kmqtbqG0lm6y3dSOe9ahH9kzztluCMC4GONMkuAPHLmKIgvy46KRxv6zVn
	jbNdhV6tknnlyuP0GsiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIRX-0000000CNUb-2uFb;
	Tue, 02 Jun 2026 06:17:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUIRV-0000000CNTs-1iN9
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 06:17:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D07CD445AD;
	Tue,  2 Jun 2026 06:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6082C1F00898;
	Tue,  2 Jun 2026 06:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780381056;
	bh=1jN+H2Z0mlbgHjg8etd2+1gBs27Oz5beSO0czG79fUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LzF6m1Vd3isa6eEBj+SiWZl0ljK9y5YGOAMdWP6WZpBAAhVH0x3cSQeAKADQNlmfE
	 IrcTh053yTlcPfKihsfQd3DoZlGoVmaTR0oUi9BWG3GmqPODjkBber1fJl2siZuIkp
	 a39KoNpcp9JJehN0IRuv64lD1S4l9l7bplUGtEtqRy8M9oUYlV+VDjzPfhKe1+npK2
	 rQhMYfjljEbetDUliY5zZTyq8/0WhnvzRhlqe33vmKUzKpc2lFLOzsasmlVpfvu4za
	 l2mytWbsew22qsncwowKV4NYMtcYjf/r8fkduluVg9S2mfKjP99sNEdgQwjK/QZPpU
	 hRxo5OufHWavQ==
Date: Tue, 2 Jun 2026 06:17:34 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH] MAINTAINERS: add entry for SpacemiT reset controller
 driver
Message-ID: <20260602061734-GKD3815935@kernel.org>
References: <20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260601-b4-spacemit-reset-maintainers-v1-1-1ab3014e9a35@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_231737_488503_B18489D0 
X-CRM114-Status: GOOD (  21.14  )
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

Hi Guodong,

I appreciate someone help on this, only few comments.

On 21:35 Mon 01 Jun     , Guodong Xu wrote:
> The SpacemiT reset controller driver under drivers/reset/spacemit/
> (common code plus the K1 and K3 SoC instances) and its reset-ID header
> have no dedicated MAINTAINERS entry; today they fall only under the
> broad drivers/reset/ entry of the reset subsystem and the N:/K:
> catch-all of the RISC-V SpacemiT SoC umbrella.
> 
It make sense to just fall back to SpacemiT SoC without MAITAINERS
entry, the whole point of adding a didicated entry means someone
willing to put effort in future maintenance, to help review/refactor/fix
you can emphasis on this, and I just want to make sure we algined on
this..

> Add a dedicated entry and list myself as maintainer. I introduced the
> drivers/reset/spacemit/ subdirectory, moved and refactored the existing
> K1 reset support (originally written by Alex Elder) into it, and wrote
> the K3 reset driver. The series that created this directory and these
> files is archived at [1].
> 
This paragraph provide addtional information of the history (which already 
done), I'd personally prefer not puting them into commit message, but put
them below "---" as background introduction if you still want..

> [1] https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
for the convention, suggest to use more formal format like 
Link: https://.. [1]

> 
also no blank line above

> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> I contributed this driver as Guodong Xu <guodong@riscstar.com>;
> docular.xu@gmail.com is my current address. A matching .mailmap update
> has been submitted at
> https://lore.kernel.org/all/20260601-b4-mailmap-guodong-xu-v1-1-ee9eff1e57ba@gmail.com/
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9ec290e38b44a..c9d87244c1715 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25119,6 +25119,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>  F:	drivers/i2c/busses/i2c-k1.c
>  
> +SPACEMIT RESET CONTROLLER DRIVER
> +M:	Guodong Xu <docular.xu@gmail.com>
> +L:	linux-riscv@lists.infradead.org
and I'd still sugest to add spacemit mailing list explicitly

> +S:	Maintained
> +F:	drivers/reset/spacemit/
> +F:	include/dt-bindings/reset/spacemit,k3-resets.h
> +
>  SPANISH DOCUMENTATION
>  M:	Carlos Bilbao <carlos.bilbao@kernel.org>
>  R:	Avadhut Naik <avadhut.naik@amd.com>
> 
> ---
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> change-id: 20260601-b4-spacemit-reset-maintainers-4b5a91599585
> 
> Best regards,
> --  
> Guodong Xu <docular.xu@gmail.com>
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
