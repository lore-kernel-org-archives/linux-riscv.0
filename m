Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401BE606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 02:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E7g113Za;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=pST1Bafh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pgeromA/qMUQgjpF9EGd8woGGg3WttHfHsfOW9sELXc=; b=E7g113Zanxf3zWsUHtmWzZWkTU
	9gP3VEA0hbZ7ICT0uTqx+6TlURp0fV41Y8is5SpjUpRx/L27noHeDWarY5zXNzODN0qsliMObB4+z
	0KkOIzjlHaugEBTYRKqaoSWF/qGh/VkbkuppZTnROBhC7lpVl5YTyh8h/W2EbYdFrUK7Y3qVEa1Uh
	v5Tx8TSms03TF7gexc29pE9YgbxK9L7GQsco6adu0Xuy9VPLpUtQSLc8O7Lh0KFZbh0BgiXt5qUOM
	JnZROtaGkorXq8Ssvl1Y2l43AtfV1NYwsrr5ysRq2uS2RrJLrKxcG1HFGMM44g9/wnDmU3TGoyqLU
	SmBh67EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbyW-0000000AeT9-045l;
	Fri, 30 Oct 2026 02:04:12 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbyR-0000000AeR2-36Ra
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 02:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793325834;
	bh=pumged/0aPi5xqnB+RarXs8Eh9+4eMDOVCGQ7bmfyDY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=pST1Bafh9YDZnRMH21BHCclv5V5LLeCK6ZGjg1da1GUVhXhgHyoBYRfABI/cSEHmf
	 zSm5d+DY2loPXq7ucezKX3N7gr81xHUMKmJ58kjGY8IaWxx6S5HJSDuO68Pls2ZNIl
	 WMxRR1SBnVewM/sRYSyCNWSZBiHI0Ve7bL+gTmnA=
X-QQ-mid: zesmtpgz5t1793325832tbc76324c
X-QQ-Originating-IP: 1BbxyIvlF3AOamn5bZyHYBEFlVP5ZviaER6ZNnc482Y=
Received: from = ( [58.254.69.131])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Oct 2026 10:03:50 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9133408313636271411
EX-QQ-RecipientCnt: 16
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 30 Oct 2026 10:03:47 +0800
Message-Id: <DMHSY8103ELL.1ZNKF2EH6PDSG@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: enable status of mimsic and
 maplic to okay
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "E Shattow" <e@freeshell.de>, "Anirudh Srinivasan"
 <asrinivasan@oss.tenstorrent.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Guodong Xu" <docular.xu@gmail.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261029162343.1896134-1-e@freeshell.de>
In-Reply-To: <20261029162343.1896134-1-e@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MRoXHVs8e1kF+8olKmi2bjyN+Iu7GOtZU0RQJmb2PbZGb6ZSNwGZaSrV
	jDGkx8jeXuJrF5Q0nT/DQjrXcIYy7Lb7/AolC0OFYBA+gIQOyaHYK3qCCUID9YbHElpAhrU
	yg56NlakCROQc1grP1XbNg7XWGmyMRK/X56Z9Ks8Dri9I+AlDaaTzVNSdkym025w+rjo0qg
	Sp5sg4I1Ne4PHuOeTaSHkpSv/+gRa6Ejm+5d1rlpFqUT3LeB6d+dtYwgjYQzNdrrpHQSdFs
	iVA/dIhB+aJZ4itgP9WOcnHfLDtL63lI2+Xqllsez3MlgwWIc2FDT7/pA12ziKD+SFZeYcl
	NncS3QRm+qi1W1g5ImO6uHCegqd58pT7bUtsOkhINSWEG36hRS82oWzusx/3fiPEu68Pv3R
	LgugnXvvl215eiBHvbgKgqY8dQAMC0NOX6qFIwyeK2Wjy+O1rilb4Hx9z3b5G8KRXF8VeO9
	WQbE4SaNiRY/WjNsN7UpUlTrFDZGkUpX8zE/+2cVe4Jit+HRnnZTVP5kPjVEY+aQvWhSQCp
	kErdeBNcrSkD7yz4XBbe2tel/6ngm/O67Vw6hCOKQ3a/vZBOa4TtZDl/qqDyfL8bNEyOBv2
	y6kv5mL+RULYuug5fez8TaOoxS/RX9WgdKtJlOFDyLqVUH6E44HnIcls+p9TkMDrYw3N6Yb
	xrFuxLGsZxBbRy6TtxstPuWSIJblyc4eOcQqw/ofNWe2+8S08cI2guT/7ukePDLa3ncQWq+
	pcX7Y7HbRnuXBvwt4s3ed87QcYRQNn0T5KbrgZhGMbECWHokpLKxqJir4wd9/Ws5cR6O4qI
	ZdWUIyF0HTZelN9WDA8V7+GhzoWq8Q++JNd7WlwlFrnp77uQvIow5pV3/iES8U7n8tCNaMb
	4QpO9DDAji0ecYZgsBo2FT2mi+AWPT5szPReBtZrIivhbNXT6ACjz0ugtvQdzi7WTZHxn4+
	76mKdtV+ZbJMr5e6m/HnimNDvllp6Z2hGbWpxa1OUo/z7uV5aBfN2ct9zhKlLPKhVS14XtE
	7zkwv4l1crAhtWEaNcXTZ+vTbFGd/dLEMf5i+9tQKy7a1lxVb5ZEtZDKym2XXAMexzQSFXD
	vVk30RYxdYCmuD1/v06DGwCXq70qKAk8clfjjGivBlu5ScKa0pUELY=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_190408_706855_D6C41677 
X-CRM114-Status: GOOD (  14.67  )
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
Content-Type: multipart/mixed; boundary="===============7070911036922358078=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7070911036922358078==
Content-Type: multipart/signed;
 boundary=d3a7c47642dadbe68b345e1aa39039756e5537a343a8d6d35518f7cdf663;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--d3a7c47642dadbe68b345e1aa39039756e5537a343a8d6d35518f7cdf663
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi E,

On Thu Oct 29, 2026 at 9:23 AM -0700, E Shattow wrote:
> Change the "reserved" status of mimsic and maplic to "okay". There is
> an mainline OpenSBI user of this and setting status okay resolves the
> stall of Linux when probing peripherals at boot.

Thanks for bringing this here. I still think status =3D "reserved" in
k3.dtsi is the right description.

(To clarify the Acked-by I gave on the U-Boot thread: it was for
carrying the override in spacemit-k3-u-boot.dtsi, not for changing
the kernel DT)

> @@ -1452,7 +1452,7 @@ mimsic: interrupt-controller@f1000000 {
>  			msi-controller;
>  			riscv,hart-index-bits =3D <4>;
>  			riscv,num-ids =3D <511>;
> -			status =3D "reserved";
> +			status =3D "okay";
>  		};
> =20
>  		maplic: interrupt-controller@f1800000 {
> @@ -1464,7 +1464,7 @@ maplic: interrupt-controller@f1800000 {
>  			riscv,children =3D <&saplic>;
>  			riscv,delegation =3D <&saplic 1 512>;
>  			riscv,num-sources =3D <512>;
> -			status =3D "reserved";
> +			status =3D "okay";
>  		};
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 So=
C")
I don't think this is a bug in the kernel DT either.

This was also discussed when k3.dtsi was reviewed [1]. The DTB built
from the kernel tree is often loaded directly by the bootloader (e.g.
from /boot) instead of the FDT that OpenSBI has already fixed up. With
"okay" there, Linux would probe the M-level IMSIC/APLIC and take an
access fault. The compromise back then was to keep them out of the
kernel's view in k3.dtsi ("disabled" at first, "reserved" since v5)
and enable them for the firmware build in -u-boot.dtsi, which is
exactly what your U-Boot patch does.

(Also replacing Guodong's address with his current one in Cc.)

[1] https://lore.kernel.org/all/77f9a001-7f0a-4c29-abcb-501e875da117@sifive=
.com/

--=20
Troy Mitchell

--d3a7c47642dadbe68b345e1aa39039756e5537a343a8d6d35518f7cdf663
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC4WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauP7AxAcdHJveUBrZXJu
ZWwub3JnAAoJEJgJ74D5MzQv7O4A/0OMejfxLYWKCiyBxXllnt6RD3VnWHq2NL5z
/dd3+uI/AP990NcnV/KPEsOBMIQFQt2/RvfPFEHzG8uLFdZpTMS7CQ==
=6CKn
-----END PGP SIGNATURE-----

--d3a7c47642dadbe68b345e1aa39039756e5537a343a8d6d35518f7cdf663--


--===============7070911036922358078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7070911036922358078==--

