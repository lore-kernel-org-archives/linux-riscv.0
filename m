Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE38EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqrDcXLAOFdls3vTGJTivINCnbr+1idjG3xBZjbkRyM=; b=XqSfp63vnM27bfOSbQyd/g83hg
	lY6F1uRYXQXkpNTRJpIMXGFixX0//wtHdocRCBIs+Wxte3OjL7XtYilxI+PD1ylVXxthr5DRstcy5
	wXXaBT8zUk7yMuO5WH2er6ja8g5y3C2uQPbzZVsJaH0IOyue32VV9mB56RW707JVQqy697ObvH5fk
	IZVa1pFFSqOGUmwtj7QIsE1gnGdqKhclWd74I71wpxgDoxsiF7glBgFICiX4sev01BJoNdnI6wAy0
	Qxupcbkc+TTK0lBOC2xQSj/+tayL5ku1zXjGYfnQd8twZkvuRHVF1kiW1siLoiqOpBh8ATGoXZthE
	X6u3XNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3rG-00GD34-14;
	Wed, 05 Jul 2023 14:51:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH3rD-00GD1v-0t;
	Wed, 05 Jul 2023 14:51:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 906B2612B1;
	Wed,  5 Jul 2023 14:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A9FC433C9;
	Wed,  5 Jul 2023 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688568710;
	bh=xH3lyctIueZw4PQfaohnlvwl58gEmyuFjcz953X1GNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJWRW3aaJHyl/yYeSXazp4YCkgA1+ygkYkSUg7Tr6/uT3J0CQ+Xmc0VR2dsctzqYU
	 aHFLdUkCuXumO3F1yX6Syl6v8FpeUd56393GqISXaD+qq6e/G/wxEqaKIOAmoQXsz9
	 Lw6PqVht7IBC2eACsGvZjAHdVUuaPlM5JUDkkPMpqUZOjf/VsgvXjtDbYQA2+cQCy8
	 3FX/FBiDVocwnR45Bdl7yqXruIMs2Kv195Tcm1x9yBQVBx160xkYMEcynVhJQTd+1i
	 pjZLt6L6rmiCxKJpi11vc+xBFeIp4E82PVRHLlICbAn5zro5wAoT/s75OVwQQPu4bC
	 mN2qmynznVpYQ==
Date: Wed, 5 Jul 2023 15:51:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Alexandre Ghiti <alex@ghiti.fr>, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, anup@brainfault.org,
	atishp@atishpatra.org
Subject: Re: [PATCH] RISC-V: KVM: provide UAPI for host SATP mode
Message-ID: <20230705-bogged-remindful-b2ccef9be2ac@spud>
References: <20230705091535.237765-1-dbarboza@ventanamicro.com>
 <994ae720-b3a1-1e67-ca9c-ca00e6525488@ghiti.fr>
 <029b87e1-d4bc-9deb-316b-b93c5bd2a37f@ventanamicro.com>
 <20230705-602410a4b627f419f8f9936c@orel>
 <20230705-fondue-bagginess-66c25f1a4135@spud>
MIME-Version: 1.0
In-Reply-To: <20230705-fondue-bagginess-66c25f1a4135@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_075151_369956_89A6B653 
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
Content-Type: multipart/mixed; boundary="===============3041523738680042780=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3041523738680042780==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jHe0oA0IsObFFmge"
Content-Disposition: inline


--jHe0oA0IsObFFmge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 05, 2023 at 03:44:02PM +0100, Conor Dooley wrote:

> (@Drew, I remember why now that the property is optional - nommu exists)

Wait, no that makes no sense - there's "riscv,none" for that.

--jHe0oA0IsObFFmge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKWDgQAKCRB4tDGHoIJi
0vxrAP90gWO0dKip3YD/2jmXnN51P9sS9XD2AI0cd5feduqkKgD6AgI6B7JrOQGJ
IoMLFctxzEz4TX5aDaRdjyZwERAu0wM=
=j/Rn
-----END PGP SIGNATURE-----

--jHe0oA0IsObFFmge--


--===============3041523738680042780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3041523738680042780==--

