Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783CBC761A6
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 18:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbELYBkTKtSVo0RCwTuZn4pIL++uvEFRdJkyOfOv6E0=; b=d5NqDhKpqeJo/GHYVAfRru9rYm
	BhMUnnVY3SJ+yhyQPhjP2n1jkqqMeljZDgIvSQhhiEq89q5BoTtLt8e0Z+//h/i0ULbtAhfEd+c/C
	8lRFl+zLjyGATrcUGvldZ9c46iv/WnrgIu94CrWnlxyc4IOASuAbsUT/C8Q2PPIiRWcw1j/OBZoqc
	u9nIqcccY2MqpHNQJ0+um4e8eePLwj0cQkt1KaI1f4i8vkVAsvmRj7jFoxh+xJfgQ+t/JYNDbMm9Q
	WSVqeT+7ofvffDnCP2WF1sJGbub7J/7PwGUG0TfHhBJogssmKxW9gFe+/UzceEOA8grh3bl5Axe6e
	krCRH38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piJH5-008Pkk-0x;
	Fri, 31 Mar 2023 18:14:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piJH2-008PkO-0a
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 18:14:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82AA562B20;
	Fri, 31 Mar 2023 18:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD67C433D2;
	Fri, 31 Mar 2023 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680286490;
	bh=7zKHrajfr7gy6oyR1bURpy4CGEFaBjYjosorDn9FQvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmhVzS+vqvjXPY+U3xFrEWUwpmXdJg6jp6Zn8/eONV1bGUPeeYwH3qu8uRYdDbPEN
	 3T/tMc4nXpDKtIgkfdZYSXyT5rBEmTzEl1k/9oLx9+X3aUJFuwePamPduoAPayuQIp
	 Dc1DkAXLzSQwhMmxrgB/tHOyVKFU0k5lyjr407jhmLc8+ZvGlPrnKAAYOiCiN9EMDS
	 lkhfdO7q6qAYVYzW26VNe2TJyb1dTYNKrLD3meECdtm6y6oRhhfdAXHOVnlUSDkvS/
	 j2yXG4u+hvECZZ39t50N/OZ6m0BTdSk2yzpg8vlwSXIRkWlH5qPk7UzhXTQDoagSm6
	 PMQ7mnCGKKFdw==
Date: Fri, 31 Mar 2023 19:14:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: Re: mailbox,soc: mpfs: add support for fallible services (was [PATCH
 v3 0/8] Hey Jassi, all,)
Message-ID: <e8cfa8d8-cb73-4074-9041-ce37ce782630@spud>
References: <20230307202257.1762151-1-conor@kernel.org>
 <d7c3ec51-8493-444a-bdec-2a30b0a15bdc@spud>
 <09cdec20-c3c8-4eb1-9a74-87f429543d3c@spud>
 <CABb+yY0ocpdB5RWyxncM7VJzJde6G-WscTKbT2=GMt3uJAccVA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABb+yY0ocpdB5RWyxncM7VJzJde6G-WscTKbT2=GMt3uJAccVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_111452_264285_DD75C084 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============2710289165142725750=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2710289165142725750==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yCL3c8eMFvjAz1bT"
Content-Disposition: inline


--yCL3c8eMFvjAz1bT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 31, 2023 at 10:03:08AM -0500, Jassi Brar wrote:

> I am okay. Acked-by: Jassi Brar <jaswinder.singh@linaro.org>

Great, thanks Jassi!

--yCL3c8eMFvjAz1bT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCcjFwAKCRB4tDGHoIJi
0qg/AQDuSvlQrNZ8rvZajl11EJrl7aid8BAibS7rnLR45V8HYAD/cqjXzSjLJabN
acDicLE0LimgxE2yNOD/oF4R+9sgtAg=
=OzIv
-----END PGP SIGNATURE-----

--yCL3c8eMFvjAz1bT--


--===============2710289165142725750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2710289165142725750==--

