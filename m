Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2AEC433DB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 15:10:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E658064F78
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 15:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E658064F78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ibIPk4X89Q7cAhJP+xJxyb+TF+xHBVDlHNWTubFMTf0=; b=BsHfxRffARByeT+F7klZb/u88
	5xLvq85V8W5ks7+Tk1C2EZ/KVDJ0aa84pDTrN9rOohvYVa+XinI8lWnDmn5wdGoW4prqqnzlxUWG/
	dOqjC6HDaGUZvGnZ1r+FuY8QHbOqqCtrFknY/gTrEwIxUrmpmHvam1325XZKhhn1aw+uSiHRkr0kq
	5dDbT3+ughL8aCABqeI9xrY1TpOOIHLvswoU4uP3jYQjh60hEN4eZZtaEbScsxt5V+iw6X1GK/8m/
	RZE+HNO7iv0rkeQUHJFtjP2IShGlwL7dq/CXdTaL+PnnMGx++DyJvV7LvLk8EsmUl/nEsM5MsQCGY
	3hVAylOKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHpbl-00908e-B1; Thu, 04 Mar 2021 15:09:45 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHpbX-00906R-Lx; Thu, 04 Mar 2021 15:09:33 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07974AAC5;
 Thu,  4 Mar 2021 15:09:31 +0000 (UTC)
Message-ID: <827b317d7f5da6e048806922098291faacdb19f9.camel@suse.de>
Subject: Re: [PATCH stable v5.10 0/7] arm64: Default to 32-bit wide ZONE_DMA
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jing Xiangfeng <jingxiangfeng@huawei.com>, catalin.marinas@arm.com, 
 will@kernel.org, akpm@linux-foundation.org, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, rppt@kernel.org, 
 lorenzo.pieralisi@arm.com, guohanjun@huawei.com, sudeep.holla@arm.com, 
 rjw@rjwysocki.net, lenb@kernel.org, song.bao.hua@hisilicon.com,
 ardb@kernel.org,  anshuman.khandual@arm.com, bhelgaas@google.com,
 guro@fb.com, robh+dt@kernel.org,  stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  frowand.list@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 wangkefeng.wang@huawei.com
Date: Thu, 04 Mar 2021 16:09:28 +0100
In-Reply-To: <YEDr/lYZHew88/Ip@kroah.com>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
 <YEDkmj6cchMPAq2h@kroah.com>
 <9bc396116372de5b538d71d8f9ae9c3259f1002e.camel@suse.de>
 <YEDr/lYZHew88/Ip@kroah.com>
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
Content-Type: multipart/mixed; boundary="===============7158105532266649538=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7158105532266649538==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MTEftY67Mi99IToWhxLf"


--=-MTEftY67Mi99IToWhxLf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-03-04 at 15:17 +0100, Greg KH wrote:
> On Thu, Mar 04, 2021 at 03:05:32PM +0100, Nicolas Saenz Julienne wrote:
> > Hi Greg.
> >=20
> > On Thu, 2021-03-04 at 14:46 +0100, Greg KH wrote:
> > > On Wed, Mar 03, 2021 at 03:33:12PM +0800, Jing Xiangfeng wrote:
> > > > Using two distinct DMA zones turned out to be problematic. Here's a=
n
> > > > attempt go back to a saner default.
> > >=20
> > > What problem does this solve?  How does this fit into the stable kern=
el
> > > rules?
> >=20
> > We changed the way we setup memory zones in arm64 in order to cater for
> > Raspberry Pi 4's weird DMA constraints: ZONE_DMA spans the lower 1GB of=
 memory
> > and ZONE_DMA32 the rest of the 32bit address space. Since you can't all=
ocate
> > memory that crosses zone boundaries, this broke crashkernel allocations=
 on big
> > machines. This series fixes all this by parsing the HW description and =
checking
> > for DMA constrained buses. When not found, the unnecessary zone creatio=
n is
> > skipped.
>=20
> What kernel/commit caused this "breakage"?

1a8e1cef7603 arm64: use both ZONE_DMA and ZONE_DMA32

Regards,
Nicolas


--=-MTEftY67Mi99IToWhxLf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAmBA+CgACgkQlfZmHno8
x/5JVgf/eqHD1C2EmaD/V/HHrBczhUaM9DPc5otgTDC5gKnYF8FgdBOH4oJyh2Hb
l9M2tznHD8hHoxowOw0BcxY+WOGYwZXRx8R5pNPb/NKZqFDCQ3Dgw1eMt8uYNg+5
oPS7JE5ldh3siUgaLV32wueyIqbx3A8WbSLouwSPz0TVK2DqVKd+SkLAS68qwTc4
QO9ikKdB7rg7RXvm6YOaP2uzWMn/PJgAEX/LMwv/CjfU+DVUE3uyqyXdsRby8nE8
tzXJi5AvfsGaUXsqQShCqdAAGuuQ6raG/r0oKfvUfAypKd4d46JFfdGlJ5iT7w8s
NlfFKZ2ZWHdwif+tNt2Lipct8pelxw==
=RW7q
-----END PGP SIGNATURE-----

--=-MTEftY67Mi99IToWhxLf--



--===============7158105532266649538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7158105532266649538==--


