Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4665FC7EE2F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 15:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yje6mmIXUFQ8BsB3UCxl6FBm/WC0tu8N+Y/L55Tibbc=; b=iaNGWQ4PBqhB5Jx1j2wDtUQGTo
	VdCH3LlaO5/GpvhMW5hkAERpLtl58WC5g1/hSszAyjJ6VCYTtG3sYteYyC/7Fmo9ecKowXmXQgaeZ
	/bSfudNz4FffuAeq3MWbSMmFafkAPbZrtrGTK78/UEWEYiJjPV5giCoALh9LSePswCKU3mlu2Tn2D
	rsi6IRMfk0tDtrye+2k3npzPiuPptf76JFLN3H+syaEHLrNWA4VddqhgZKc5iK8YElYssLhOFpck7
	nrC2f86odmB939tlJgyx55h/t1jxvPCN4xjds5MvladMMeF7BRwf8tlFeeL4yDoQ+IgDLo8i41yQV
	xrBlvXMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prghK-004HSv-1v;
	Wed, 26 Apr 2023 15:04:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prghI-004HS9-05
	for linux-riscv@lists.infradead.org;
	Wed, 26 Apr 2023 15:04:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69FE56322F;
	Wed, 26 Apr 2023 15:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CBDC433D2;
	Wed, 26 Apr 2023 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682521482;
	bh=l4R5Zg5oFYykCQtoy7i4lQY6+CIFhUQQUsRB4MxViPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlNZ/XnShmQk6GjhTllSC+yOmn1dtbqtx2eFCEN583sxFFGsJkp1nC+E86+0WhrqK
	 BXKh+SLB43+lbVoXkomiFu+lgC1vBf2dtVxrHl2C2PJImPrRcSh2E93dG+/NNbsXyM
	 EetCovrwU0oMt1WEfOsrZlOHVhsfUIldCl98OhMWoh95VIuipPvS3b1dKEIvFeFLgX
	 J30dn5nNTN5BHTg5sy9xIgvqv5ZM5yVN8PjJEVvEyes28PNkvJDpxzjPXgQdiJzvef
	 FNN9YWf+OwnpcicjwlXFbgLutdVsyWim5Xaaf7I+4SxuDuQgL5m79tRE4zWNA+1i4g
	 o2kuMeb2hIsdA==
Date: Wed, 26 Apr 2023 16:04:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH 0/2] RISC-V: hwprobe: Couple fixes found on late review
Message-ID: <20230426-empirical-freebase-dc7f05aa1df6@spud>
References: <20230426141333.10063-1-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230426141333.10063-1-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_080444_098483_28D49DB2 
X-CRM114-Status: GOOD (  10.82  )
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
Content-Type: multipart/mixed; boundary="===============2406870450896402513=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2406870450896402513==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3NeO9VHf89drQJrb"
Content-Disposition: inline


--3NeO9VHf89drQJrb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 26, 2023 at 04:13:31PM +0200, Andrew Jones wrote:
> I didn't get a chance to take a close look at "[PATCH v6 0/6] RISC-V
> Hardware Probing User Interface" until now. I spotted a couple issues
> while looking and this series collects the fixes.

Both seem fair..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--3NeO9VHf89drQJrb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEk9hgAKCRB4tDGHoIJi
0h52AQCcuYhgYucsXQlVCJOstTMNqZvYqJkKkTw6GyJvlTq3JwD6AvIRWiXw9I89
e28p8ZRZO9sGHd43T78j/qIuAXz2kgQ=
=sOS/
-----END PGP SIGNATURE-----

--3NeO9VHf89drQJrb--


--===============2406870450896402513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2406870450896402513==--

