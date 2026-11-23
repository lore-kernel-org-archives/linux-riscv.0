Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AAC606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 19:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vkhZ2sP8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bGGL9QIY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JKhnC4YMPWm7nj+9q4OBRFXtP6Z4UrkJqwYioPjVrsc=; b=vkhZ2sP8nLz1U5yzqTZwTfNMa6
	AcVrw88aHv+2drC6Q3Y+hYKmVps/OgsjQysUMsNL0MJmROwEnEr6eERo32fZai0Wjqz+s9KKDC7Zo
	1y291BFzi3sOxKCLd8u7uP5LLTBQwK7G3HORbhoORAj+tZjndBOZSNC3bQpAGaOfiaAD1lg70hgOw
	Mwe20yIuqIdBvqxwd+LrPxTDKnrqQcrwzQm/D6rjxRQ+AuBJAN6vdX7FBoUMRbeUURrkqB2cnCoQP
	meGMWnDWUlrXZDwL+20PuObPoEBdfLlt1MaPpROgD65r8OhFa9TKDkoqNSlsOq/7q87wQ0xwa5R9E
	Ay95cs7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZd8-00000004eKA-21ZF;
	Mon, 23 Nov 2026 19:23:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZd7-00000004eK4-0IWA
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 19:23:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 19E2861D2E;
	Mon, 23 Nov 2026 19:23:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B841F000C6;
	Mon, 23 Nov 2026 19:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795461787;
	bh=vmh/iP7xHvN6/jWDIjahoAwDiP8FDETBvYgddurQgVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bGGL9QIYbDXP+cP6gglzrRn109jATBGaVQPv0nF49vQOUrIrHfTxcEbBomCB5OTbS
	 obUbpDZkwNGJPgJF55OPRASami7Sal8Ygsb0u2RVQLhScYTBsVzXz9jS7SG63mq/AC
	 i/Z7vTUcyKegahKgAExNQEDfkAY4OpV7Ekh9Zx88n3f8PuKjt1sGREQSN19FIQee7l
	 LSX7Mjy2FH8RKiMu/bU0XqIs7f9AHWQsykNsayOop9j/WIUnwu/mxVxf1I0weYBEcw
	 kCR9PuPdkcZp6fKlBGrSKOiRr7VuLi/4L/gf/hucZVIZbKuDTsapjwqx6aNloiKuhG
	 vOsLWuhB4jn8A==
Date: Mon, 23 Nov 2026 11:23:06 -0800
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
Message-ID: <awSSmjbjkoGNe-zm@thelio>
References: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
 <20261020132604.90708-2-thomas.gerner@muenchen-mail.de>
 <awDdetFNaeuxKkbp@x1>
 <fbaa1ed3-6e59-430f-9ce5-26020591bceb@muenchen-mail.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbaa1ed3-6e59-430f-9ce5-26020591bceb@muenchen-mail.de>
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

On Sat, Nov 21, 2026 at 11:50:31AM +0100, Thomas Gerner wrote:
> Am 21.11.26 um 00:53 schrieb Drew Fustini:
> > On Tue, Oct 20, 2026 at 03:26:03PM +0200, Thomas Gerner wrote:
> > > The bluetooth module of the Ampak AP6203BM is identified by the btbcm
> > > driver as BCM4362A2.
> > > 
> > > The firmware of the bluetooth module on the BeagleV-Ahead reports a
> > > capability of reading LE tx power. However reading fails. To get
> > > bluetooth working it is necessary to disable reading of LE tx power on
> > > the BeagleV-Ahead board. The disable is implemented in a similar way as
> > > for several Apple boards but uses the board compatible identification
> > > from the DTB as there is no DMI.
> > Thanks for sending this patch. Do you know if this is a problem on any
> > other boards with the AP6203BM?
> 
> Unfortunately I don't know of other boards with the AP6203BM.
> 
> > Also, is there an error message for the failed read?
> 
> 
> Without the quirk I get this message:
> 
> Bluetooth: hci0: unexpected cc 0x204b length: 1 < 3
> Bluetooth: hci0: Opcode 0x204b failed: -38
> 
> As a result the hci driver stops initializing and Bluetooth is not working.

I think it would be helpful to add those two lines to the commit
message.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
