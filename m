Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B7606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=buwFEYan;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=F8t3kHBv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LcrtbY2DGNjU3voZoyqIBBKYz0uk3iLUy0C5+it+Udc=; b=buwFEYancM90BVZxFNQj6nPCiU
	nulgqQKPmw9drnh/3UE6Dz1F9plrKdLi8RIMJdPyqoaAd5ErVyZKimT92DD2HOomnzBu8ffaj4wHY
	8zkwGmfWEa1276SnmVYkHddV1ZrgTIpwdsachN55qIi7BWp72u2PqeN7qSLCR5usYe9hwYsX6aBxz
	3zZN5t71nB3vRbSEN524Bng8jEt20f1F3wz7i6WtQoZL0nQF4q+x6HHvImzlMZTKgq7Mtbndkaiwu
	TDYsOBK6XZVOLG/5PQRd5xkth+Nu3qD8j043BWFR6MhVfL49kcHrVLM7VqURYov34TyMn+2Uo8oBY
	2JuRS8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvIN-00000002Feg-3UTl;
	Mon, 16 Nov 2026 11:54:47 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvIL-00000002FeO-197Z
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 11:54:46 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 16D3F202929;
	Mon, 16 Nov 2026 12:54:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794830083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlKdAuKU6/zlzy78gLmAnVvUOZiQT/RfQGf8vqVj9/4=;
	b=F8t3kHBvYsxFxiojpYcaaEO8yZNbDqfUZERwscJ7clfA3vc3UGoWxoRKgurki2oUASVnY6
	4SC5dgmiGXD7TOOfjHuNJ98HnET3RbY3UtrAOZF+KVeEehyJbpyJg5XqmyOiK83XJLqsuU
	/klh/bDYmypg0l/SKOD8t+kLXBSgI2XuyyiEgfFz6CQyubqXy3t6YxYVf2MoVrdZobf75Y
	lt7+0p+kcBN2hW+XaoduqZ5qQ1kcdzZKb1wAYo011YqngA8G1QHWUj5n00uktU5b+1Wifj
	XPtqMI8sympbe6++lo7ilkgxWQGF2UDqOXORjcn/BSihErC7bnnipPqzrurBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794830083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlKdAuKU6/zlzy78gLmAnVvUOZiQT/RfQGf8vqVj9/4=;
	b=E189z2N24A32vezLb2jV8FGurUV6OKE3Jroj3WDbY2h+i5w4TfbruF0Nn2Diw+mDDGzqG0
	9TjxwuRQt6BX6dv3IZaXORTHz6BT0+k5xJb2J58b8psu3zKCaj38pFeR4d4Z+rBgNg1Q3x
	4iM7ctQEdFbxCY+yKX18b7sK6AhNTdyfoWsIfZLZqJl8EJtj5M29UJuozqPpVkuJhEbR6W
	Uh4ZW6qkLcn63fbi40ZuNnyTY1jhXzs83+PNAMwShOSenhSk4iRkhvUuIDxszYmqMqsRnO
	75fUFWC2qTTrE7BkOqSiGtLWHA/4WmiFVJh4J6Ae//0fTh28h47ilCTRyhbdRA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794830083; a=rsa-sha256;
	cv=none;
	b=Y6aaFE3qrHdo3IorAfip8dGqpTrhQTAmWbv/iKn1Kqt2bCXFlO8PW+mhk2zY46GJ/9sSzb
	ABLtgqW4cCza/WSHEg1olQ7Hzm4fzpyPDgmEgc7tpE93qUU66gff1CrGavGxtj4Em/mWbw
	w90x+26TSghd/X0jX07lLyzut+14FjeOt0YJdb2eqV1zFl1M412HjqvqbJsDLIYrWU76GZ
	l1GnutQv+I98I66jd/VWhhIAMlz3s/zQdpk5/bV4HPtrBk6X9/JZXe1sTbp/XwWJctbcNj
	PTmSdXuEnXA+IdpZ9B4aXztLlCsJA8xGbqdl7MPSgARBcKa45jDHdSndUzQ3Cw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <65f843b0a46f14df575d998acceb40b68fe64a62.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jiayu Du <duge1256@gmail.com>, srini@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dlan@kernel.org, 	troy.mitchell@linux.spacemit.com, me@ziyao.cc,
 aurelien@aurel32.net, 	pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, 	devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 12:54:42 +0100
In-Reply-To: <20261116075423.1519438-3-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
	 <20261116075423.1519438-3-duge1256@gmail.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_035445_492408_D45FFEED 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mo, 2026-11-16 at 15:54 +0800, Jiayu Du wrote:
> Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> controller. These banks contain temperature calibration parameters and
> other configuration data.
> 
> Keep the root key and SSK registers outside the exposed bank ranges.
> 
> FUSE_READY reports completion of a software-triggered reload. Trigger a
> reload through GEU_CONFIG bit 22 with a 1 us reset pulse, then poll
> FUSE_READY at a 1 us interval with a 10 ms timeout before taking the
> snapshot. Fail probe if the reload times out.
> 
> Snapshot the shadow registers with aligned 32-bit reads and expose the
> data in little-endian order at controller-relative offsets. Serve reads
> from the snapshot and use keepouts for the remaining register ranges.
> 
> Enable the AES_WTM clock only while accessing the hardware. Leave its
> shared reset deasserted on teardown because WTM_RST resets the entire GEU.

I don't understand this, possibly because I don't know what GEU is.

What is this reset shared with, and why exactly does the reset need to
stay deasserted?

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
