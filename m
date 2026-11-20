Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D319606A69C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 23:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=onS/lbQB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i0ktJ/Vw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2LXoFPQmp4kk9amap8rYoaS1M4O0z9ZKtqplxZA8ziM=; b=onS/lbQBAz7HDFCQdkpO93drOk
	Ck3gqbaWvTB3p2fzP91wgym/90+V6gnHbA+ez6crFjIEGyxLUFZxC4GHznVOqtNp9bvvr3JZsp4e7
	40F+YnHGItuEc15rtEMgjKHgK9/+aDyfU2Ov9p3UmeDsAPpbbs7X1CZbzN43y8JwvAcGj9y8wBIQy
	wqTD6C8QjBKaIuMPZoSzdsrWeXoesHyzKZ/AFENqFwPolxxeTV6EHkDxrJk3crLTtJjB2XdwAV5sq
	oDHP2jBJ6hJFewOWBTcn0oFBsGgIUuoIVKnEfgzZ5ZNTCe4AHg1KDF846NCV19++DPS4J2Hb+Uf/a
	8f3e4r6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYQD-0000000GSKz-22f8;
	Fri, 20 Nov 2026 23:53:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYQ9-0000000GSKn-0atO
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 23:53:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E12861126;
	Fri, 20 Nov 2026 23:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642B51F000C6;
	Fri, 20 Nov 2026 23:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795218811;
	bh=GtYIm+rWOI2WR3mNBXOj58UxSxdzyvXp4UZh6Gfd/i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i0ktJ/Vwel/HRt+z7HIvQtAFgN47Ptjdc8ml1p450ILd372E5nWUqjKOfydgYqOES
	 rbjvLR1JS5+v1MJvWqf85KkjpEMzqmFKEto0Wj3uueyhM0Pr1ACfYxGTHqSrBFdM5D
	 ysQ2hPLdU0Fcsr8cjOBnMr7KPMCKJPVMYnhh2EpOMsZl4scMWWCGMoUZlDDTMZ3Xvf
	 Qo0qOYyctZp9JVuUG9cr/WNgd9pk0X8ctQtvMJ8W56byRwulu42OktYA6kdWjMkc4X
	 lVtzQsX3FpxheFSS1r80E3IPribh4poKqCBncqIYBskgvZZx11iPdmro6cO1C4xE8c
	 cCRzp0+Ink/ZA==
Date: Fri, 20 Nov 2026 15:53:30 -0800
From: Drew Fustini <fustini@kernel.org>
To: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: disable read tx power for
 BeagleV-Ahead
Message-ID: <awDdetFNaeuxKkbp@x1>
References: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
 <20261020132604.90708-2-thomas.gerner@muenchen-mail.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020132604.90708-2-thomas.gerner@muenchen-mail.de>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 03:26:03PM +0200, Thomas Gerner wrote:
> The bluetooth module of the Ampak AP6203BM is identified by the btbcm
> driver as BCM4362A2.
> 
> The firmware of the bluetooth module on the BeagleV-Ahead reports a
> capability of reading LE tx power. However reading fails. To get
> bluetooth working it is necessary to disable reading of LE tx power on
> the BeagleV-Ahead board. The disable is implemented in a similar way as
> for several Apple boards but uses the board compatible identification
> from the DTB as there is no DMI.

Thanks for sending this patch. Do you know if this is a problem on any
other boards with the AP6203BM?

Also, is there an error message for the failed read?

> 
> Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
> ---
> No changes in v2
> 
>  drivers/bluetooth/btbcm.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
> index 463d59890bef..2d02cc1863d0 100644
> --- a/drivers/bluetooth/btbcm.c
> +++ b/drivers/bluetooth/btbcm.c
[..]
> -static const char *btbcm_get_board_name(struct device *dev)
> +static const char *btbcm_get_board_name(struct hci_dev *hdev)
>  {
>  #ifdef CONFIG_OF
>  	struct device_node *root __free(device_node) = of_find_node_by_path("/");
>  	char *board_type;
>  	const char *tmp;
> +	const char **s;
>  
>  	if (!root)
>  		return NULL;
> @@ -550,8 +556,15 @@ static const char *btbcm_get_board_name(struct device *dev)
>  	if (of_property_read_string_index(root, "compatible", 0, &tmp))
>  		return NULL;
>  
> +	/* disable broken Read LE Min/Max Tx Power on first board found in list */
> +	for (s = board_broken_read_transmit_power; *s; s++)
> +		if (!strcmp(tmp, *s)) {
> +			hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER);
> +			break;
> +		}

It seems that btbcm_get_board_name() only looks up the board name for
the firmware file so I think it could be unexpected to set a quirk here.
Maybe this would work better?

  static const char * const board_broken_read_transmit_power[] = {
          "beagle,beaglev-ahead",
          NULL
  };
 
  [..]

  if (dmi_first_match(disable_broken_read_transmit_power))
          hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER);

  if (of_machine_compatible_match(board_broken_read_transmit_power))
          hci_set_quirk(hdev, HCI_QUIRK_BROKEN_READ_TRANSMIT_POWER);


However, I am not very familiar with Bluetooth drivers so I am hoping
Marcel or Luiz can comment too.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
