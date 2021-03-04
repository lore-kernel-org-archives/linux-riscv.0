Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35370C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 14:06:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6BDD64F39
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 14:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6BDD64F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Lj6eiKQRtFnFHpfEo5v73EkzFxibWw6OjjvPpOPulc=; b=Q8AnZjqWYnTxwVJxrjC0i59C+
	UFARfnqk7iyUB+PQAnQC8BcIhefqY64ilY1ZeJgSKE4ugjM4Xoj4DH7r1sJQLxldFD6iLNahJdme2
	QgALomkAJymb4yhihDTQNBaHbSNkKyXsf4bcvOhnWe1s5XwflXVCO1Am6WV2CA40L+HgXVmX+trOw
	kVE+GdwDsUg4qXTX56eZoB5wTYaHJMLx8oJXi7xezl2pR7FAsvui7E13F0eaEEjLLiI2fjeXzavp5
	2/lfmZfcAWPWnVwzzRPVANjF9+EklUcJ3xK6N/oyT0s5+XU+Afu8Zh7BtxMXqj8wgCQPcunEyr61e
	ngmAqVuww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHoc1-008qBd-Rl; Thu, 04 Mar 2021 14:05:57 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHobg-008q74-Dn; Thu, 04 Mar 2021 14:05:38 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1DFBAAC5;
 Thu,  4 Mar 2021 14:05:34 +0000 (UTC)
Message-ID: <9bc396116372de5b538d71d8f9ae9c3259f1002e.camel@suse.de>
Subject: Re: [PATCH stable v5.10 0/7] arm64: Default to 32-bit wide ZONE_DMA
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Greg KH <gregkh@linuxfoundation.org>, Jing Xiangfeng
 <jingxiangfeng@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, 
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 rppt@kernel.org, lorenzo.pieralisi@arm.com, guohanjun@huawei.com, 
 sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org, 
 song.bao.hua@hisilicon.com, ardb@kernel.org, anshuman.khandual@arm.com, 
 bhelgaas@google.com, guro@fb.com, robh+dt@kernel.org,
 stable@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 frowand.list@gmail.com,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 linux-riscv@lists.infradead.org, wangkefeng.wang@huawei.com
Date: Thu, 04 Mar 2021 15:05:32 +0100
In-Reply-To: <YEDkmj6cchMPAq2h@kroah.com>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
 <YEDkmj6cchMPAq2h@kroah.com>
User-Agent: Evolution 3.38.4 
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============6633569338641400034=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6633569338641400034==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ahu+lDeVyw/D0YYfX8dU"


--=-ahu+lDeVyw/D0YYfX8dU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg.

On Thu, 2021-03-04 at 14:46 +0100, Greg KH wrote:
> On Wed, Mar 03, 2021 at 03:33:12PM +0800, Jing Xiangfeng wrote:
> > Using two distinct DMA zones turned out to be problematic. Here's an
> > attempt go back to a saner default.
>=20
> What problem does this solve?  How does this fit into the stable kernel
> rules?

We changed the way we setup memory zones in arm64 in order to cater for
Raspberry Pi 4's weird DMA constraints: ZONE_DMA spans the lower 1GB of mem=
ory
and ZONE_DMA32 the rest of the 32bit address space. Since you can't allocat=
e
memory that crosses zone boundaries, this broke crashkernel allocations on =
big
machines. This series fixes all this by parsing the HW description and chec=
king
for DMA constrained buses. When not found, the unnecessary zone creation is
skipped.

That said, I have no clue whether this falls or not into the stable kernel
rules.

Regards,
Nicolas


--=-ahu+lDeVyw/D0YYfX8dU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmBA6SwACgkQlfZmHno8
x/63Hwf/dPKsaiMfp4bHs98aLzm1BcfLltFqLOj2tjBqOYX6mUdfSKOkKZYGvyTs
zZo2tT5ezbzEvU69CHgGmb6u3y4Q6PxDKqoL94xC+7RGwDrw4g4o0TZp67pcA/9d
fUjl00sLvQUl6YYcajb6s0Ev97pb3XAyvAozXb3hfz36j/30mKbizfnxhn9gTZD0
lJ6Kp8Bmm0/weVW4Kj/SOnBk0J2WF7IwSxbJMKRz8k2ejAytoILh4PZ24V9c58Jw
qhATgehwhDXk7hyZYQAKCr3pQD9fjWVVjU4/vbWXqBFvUhdmDSkCRAfYwZLJA1Cw
lRRAL3P3GOOnCmGp7VZpexw14txF9Q==
=1f1V
-----END PGP SIGNATURE-----

--=-ahu+lDeVyw/D0YYfX8dU--



--===============6633569338641400034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6633569338641400034==--


