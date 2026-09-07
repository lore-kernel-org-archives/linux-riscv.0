Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 963D2C79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVcqmJD9F/VSKbHVMTMe33VY/bNKneNBLeH6U55anZQ=; b=kOyu/OAm7AND1Rml/YBusX4ADZ
	N9vX31k7qbprVrV9ulZTWE+QiHVUpCCH64iaGxuD6SgsRESCFZKeSzsVFl7hZ27PKpvSqMD4AefBx
	R5BRdxJPMY9EPD/cc/RkTT7OI+61s910vUcOyjRh87S6iSWx3PZD0dK53HtotRoxGG05EHkyhVS2E
	MJEV74qBDEun7f+jFW9/pph8rPqnkjCIbS7qJZdKYPbY/sGLgK/GQQWyKbZoxnO6elvV4s0ahBSwr
	UQvLrUwg7KPF6fHEYyXwbhQS8TKBkY0aZ/glcZRFP0UCql8tRF94kxEmBsEQEJviz0NqaJReYtlU9
	Pjs7riCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZTB-00000006x0H-48Mg;
	Mon, 07 Sep 2026 13:33:09 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZT5-00000006wyg-3ZE0
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 13:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788787924;
	bh=ZEmTXG6leUP5+XNZaiVeMKV7GEDu10lUOnGjhlOkZ80=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=SDd0wAHbXV8gNpyxMGE2USz4dE8ae9k0VVi+xy+mBW+uOGNGu8Cg7UBLDkV0vKNAs
	 hH5sxzS2gPIgGjqHqtOH7w7VWVEP2gP6FqCbQu+drD/AQK6HQDn5BBBSysbXugB1Oo
	 olcJ3PmjZZk76S0ToRJTELFux/0GL58haU+a+4Gk=
X-QQ-mid: zesmtpgz6t1788787916t2f3c7b81
X-QQ-Originating-IP: DhRg0CY9j8rF7xBTdDpxxmzAqLri0Yhao2WsHTrpQ5o=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 07 Sep 2026 21:31:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6993455425184562689
EX-QQ-RecipientCnt: 15
Mime-Version: 1.0
Date: Mon, 07 Sep 2026 21:31:51 +0800
Message-Id: <DL94E69AG90Y.5UYVE3ZUKVM6@linux.spacemit.com>
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Drop guest properties from
 M-level IMSIC
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Junhui Liu" <junhui.liu@pigmoral.tech>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Guodong
 Xu" <guodong@riscstar.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
In-Reply-To: <20260729-k3-mimsic-fix-v1-1-368c0aec04b9@pigmoral.tech>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MQYXLRAkMyae3pVoiCdb0fzUjtNonytBusSUVbGa3KtvMbgahI9KN3Cb
	/wzfNSJJHgKZ6sjTZcS7C6gzmBOXBgP/UqYOA2/O9+lANzlylMU14Om8aN670g/ffxXzxRO
	yQ68XdGZJfbuBLdSBucq00IX5pUCVURfrCK7C+EJTlrNix0GtmgCsIVX3hZzjREi8fULxtv
	H0JD1azVO4sFIXnAq3j8CBICTKjLSsO/1Ys1gNxCVdo5O3KSPcVj6lSvqi0UQZ/GWLjuiR8
	eUKjhAzU5hFUf/PevgCVMxjpJf6irjpA/2jk1KPulQnu/cC7TEfY8/d2ij/D40B5szm0OPJ
	Oigzh1xnTWO7wNr2Q2rlAOpJDbVlg1xFdjsuE41nxT9hGl6mYeF7quRnbHmPFBG/PK5dXxh
	p++ww0tMDBkrowlsrO5WPyzQtwcQds3asYrDXomlrMPjGdvYQiEVoUvmJhYRAACMB02CgN2
	8vgAuZEFbd8DkwW2eSOZbCQU7ocJGVpvnH9ZGOYRNDYVVZGutMzu80uOdSqDvi6vQlFqCYY
	/BLZaafrl/h/rV0/jmMvvBqMiiOX0LdCvkBfveo+Tz0jQJObJ0ZdnixNuOOgH/dZFiGDQ84
	/mf8broAcBEZoAGpaNSgnTD2iH7lVXbmlL8i96hXbSnqh2TOrkHZQLZ9cgFHpq70WIMaDj4
	e8DmjfgVgSz6yUdZhsEzrPF2aseHkoeq/lc7HeCpUwuMDnSeBFTIacy1aJaH5NPN4uPCfn7
	GGy3Uwkt3hMVMSYaSQtRImIXMaVljBlU1Y26e0YzDUW8FsiGtx70NVKffw4JdJMoXQA67VP
	QjlMAG33Ees2OvRD2bhXvApWW8PdzajTirqINrGmcj2aYy5NhLEx/Z+0aTJ97tHNZBLZe/3
	XwPfww3Pix4B2HnGMznLB63Bkr4f61Iq/KHCTO+jZ/beBZSox4qZNUzBiQi9WcOyVR8Zwde
	LYskDz0lPz7rW4iC0jYD7WkmUqMb8oQFIZlIvpo742a0Zo0ExnfURP9IAt2jVbMcEWtwez2
	CosBKe/LdNaBvlhVQ2GenlW1BPJJTzQmzX9/D7McDN6BxkmCke3VrRKnUZgMARNnfHCwPhn
	O2X6HBgD/7zf6eATG5M2UdnnY4aIxPgICA0KFlnIRRvy2eRemJNNwijjYb7rulHE3Hh70yN
	fSuf7U+7DI36c+wpC3lXPcGRyMT3r9jhT7G8
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_063304_745181_CECCCAD1 
X-CRM114-Status: GOOD (  10.93  )
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
Content-Type: multipart/mixed; boundary="===============7454044503703537119=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7454044503703537119==
Content-Type: multipart/signed;
 boundary=0df6a61c8d280515c2d06d561c7b93a1a3918a190afb8b3df4ba229d5f70;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--0df6a61c8d280515c2d06d561c7b93a1a3918a190afb8b3df4ba229d5f70
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 29, 2026 at 12:40 AM +08, Junhui Liu wrote:
> The mimsic node describes the machine-level IMSIC, whose MMIO region is
> 0x10000 (64 KiB) for all 8 harts. However, the node also specifies
> riscv,guest-index-bits =3D <6>, and per the AIA specification the
> per-hart stride is 2^(guest-index-bits + 12) bytes when guest interrupt
> files exist, i.e. 2^(6 + 12) =3D 256 KiB per hart and 2 MiB for all 8
> harts. The described region cannot hold even a single hart's files, so
> the node contradicts itself. OpenSBI enforces exactly this constraint in
> imsic_data_check() and rejects the node with -EINVAL, preventing the
> M-level IMSIC from initializing:
>
>   fdt_driver_init_by_offset: interrupt-controller@f1000000 (riscv,imsics)=
 init failed: -3
>   init_coldboot: irqchip init failed (error -3)
>
> Moreover, guest interrupt files exist to act as the supervisor-level
> interrupt files of virtual harts; there is no machine-level counterpart.
> riscv,num-guest-ids is equally meaningless for the machine-level IMSIC.
>
> Drop both "riscv,guest-index-bits" and "riscv,num-guest-ids" properties
> from the mimsic node so the node matches the actual hardware layout.
>
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 So=
C")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--0df6a61c8d280515c2d06d561c7b93a1a3918a190afb8b3df4ba229d5f70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap68xw0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvldUBAJ6M7+KX40iCUzFCv5w47J6P/N3znLSudDzUSWro
+szzAQCKafnfOzZlrLTMIbBAaDUGndm9JQ6yL6H0DXT5m2mFDg==
=Saha
-----END PGP SIGNATURE-----

--0df6a61c8d280515c2d06d561c7b93a1a3918a190afb8b3df4ba229d5f70--


--===============7454044503703537119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7454044503703537119==--

