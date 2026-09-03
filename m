Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05E8C61DD6
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 01:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZ6kWlj975v+eLuwjUIPqM+kt2wGDJFRCtaSgii6RD8=; b=r7HgShalGcg6pBN0ENW3/QeMmO
	irF+PPyQdxzZJB6G4ZVg1HquDRtpDvZ0bOvNYWdp6c1lizNpQHRmV6ryiiKZ20Gmg7jBbjfzJ/R4E
	sftkVYKgXIOow8Gj+h8/25YN5jPljshajaCLMSikK7tAFNjOVVyyc4SzWdRpAO/lZd0h0JpG0wSHw
	GUzTH8n+t7pS4DBJJbFmv4duwvSp7vr+CpEg7esdMbOtq/FoFX+i+1CYueAMYpW26kG27Yt+qD3xK
	z4FFbwVrjG7KmfDGKKKGf4odMbvVXLCezfSm2YrgSJ9WznkXnK+sRn/IeTxeR7pDa9O3y84so9jCq
	V5tExhSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1vvO-0000000G9EQ-1lna;
	Thu, 03 Sep 2026 01:07:30 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1vvK-0000000G9D1-1ADz
	for linux-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 01:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788397598;
	bh=sn4Zqvuy3iv8MXIhtE8ntlyyLJ+J0+s0jH6g+E8SxjY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=A5k5NRBvPhC3tGJXsyYf7fc8LdYv7Vuxkx/RmhmEDP1YRrBswZjX99/MkSV9suFTc
	 QdM3Cvr2jl9mqvuSmqB9povPoTwKDjNEdKUqPctGTWLSuGls4LEq5Enpb5xHyN+tQS
	 NudzFTF8nwnPxqGUIb/8AmVmt3DENtCar8MEF/04=
X-QQ-mid: zesmtpgz6t1788397590t809805a0
X-QQ-Originating-IP: VhXi++IEq6mjKwdvVbXNY7Td/lOsJov/j5KV2ygThxU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 03 Sep 2026 09:06:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15480183741827357636
EX-QQ-RecipientCnt: 16
Mime-Version: 1.0
Date: Thu, 03 Sep 2026 09:06:25 +0800
Message-Id: <DL5A18T0GPB5.32JI7ECB3UCRX@linux.spacemit.com>
Subject: Re: [BUG] PCI: spacemit-k1: port C probe hard-hangs a CPU with one
 endpoint on Milk-V Jupiter
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Alex Elder" <elder@riscstar.com>, "Manivannan Sadhasivam"
 <mani@kernel.org>, <spacemit@lists.linux.dev>, "Bruno Banelli"
 <bbanelli@gmail.com>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Yixun
 Lan" <dlan@kernel.org>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Krzysztof Wilczynski" <kwilczynski@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Uwe Kleine-Koenig"
 <u.kleine-koenig@baylibre.com>, "Javier Martinez Canillas"
 <javierm@redhat.com>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260825052249.66921-1-bbanelli@gmail.com>
 <c24pt2ls62rxxg77xjbng7dmiflgdjlqd3mkoxehc2rvjgh7ai@dcxvmau3ykmt>
 <7a29717b-dc62-4421-b783-7b78e4375268@riscstar.com>
In-Reply-To: <7a29717b-dc62-4421-b783-7b78e4375268@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Nj+N5zFEdFN5ecwz1dKKsurGbo40lil/pAtYzExiD4CbPnsFd6P0Yf3U
	BmoAOPWMMwfzkRy86Pa9g/Ff+G2KHWmscKrzo9ToPkGk2Scp2MtxPvbJqWARlUQVWWmzOqQ
	WiX3e/sxkUPtKHWaKCoHgE2sIpi5ikh4JhZu4ITX8+EqqBsZYnEWhVvPfq+dZZC+G5k6ycL
	a1wW03EPUxUAsD1yL+kBE2NB3v5y2lZi4gY9jfqOasX9TNZZKyLhA0xNAVAFTrSYanCKRgL
	evxutO3ujhh9KMWuf0m1/0puqSXtOi1vQS3CcVTqCssbSxb4sD3dZZQMDaRkEba13X9wPL9
	qKVhOrPpDZcxe61I0UvENwWb8OVOAKf1692Rqq0oQER5nIFyfPb22gqPCHf60NOmaZbG+mm
	KWmplHFmg2kAiZDCyu8byB1rgOrIY2s5HGrj6xf3lscXDR8x2DA+9rLORexHhHK2tlYu0zA
	uiJR49fU/fxH7zFInMDcilIhsnH9msQppH8npuNe6Lfjq4b1nPRhr2+MDCK3c6STDOFjkzd
	mFxdWr8DcYX33WUIbR6QkGL6652GyzCS2AdCqdBqTK0VpQZ4mqVIDPZiKFpDVhNpyrb9LBh
	3IhTa+GoKuuzdvWmf6D89rsZq+mjCoFExBEEMknK0MAF5su53VNopKDnHMvS8XRxl1PQdY0
	4S6axfg6jst67SUXpCYWtKV4tWWkYfRUKc0vxH3jyALJ3X0mXFXNbniQzW24KZoBIxMrYA4
	EVdD9TcCM/7wFOARHbcNy9tMR464eiFVnbh3HNGsdRMOGrREmfkWek6RXbgd9cywGQFfoik
	/Z6oFqGoVRn9cCl1fM/ka1hhuHNJXL2F5NJhmuB8v7OS/47gdbTQTskUKErgoZau0tXjSRY
	oTMrxIYiepBRHLWENdxk96ipjsBldLzzHswZyAGZo8sFlLnZlI5naZlPXld2dOlkEmsMZJj
	EXf5Lk8HAGKq3j10PANcYMRoL9LS3NecESVCrVfVA0XzNlvy1wKL7tvsKZo/HohRA/4U24X
	Sn+MRylOL2dEeKV6tN1Z8rlvmafOq/G2GgPnUsHiHipE/NElgLiWhecHnZRMQzwOxzxefAb
	i2HQeCGj9PyTBeMf+HjsyBx6O05IdGmiaA/yGBO8s0O
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_180727_245162_C30AFB49 
X-CRM114-Status: GOOD (  14.76  )
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
Content-Type: multipart/mixed; boundary="===============3165887725231524269=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3165887725231524269==
Content-Type: multipart/signed;
 boundary=5aa6fa5638c6e4ef04b289541629de5e53ccc8327148dde49673ae679c24;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--5aa6fa5638c6e4ef04b289541629de5e53ccc8327148dde49673ae679c24
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 2, 2026 at 9:56 PM +08, Alex Elder wrote:
> On 9/2/26 8:42 AM, Manivannan Sadhasivam wrote:
>> On Tue, Aug 25, 2026 at 07:22:49AM +0200, Bruno Banelli wrote:
>>> Hi,
>>>
>>> On a Milk-V Jupiter, probing the PCIe controller at ca800000 (port C, t=
he
>>> card slot) permanently wedges the CPU that runs the probe when one
>>> particular add-in card is installed.  The CPU stops responding to NMI, =
and
>>> because the probe is asynchronous, kernel_init() then blocks forever in
>>> async_synchronize_full() and the machine never finishes booting.
>>>
>>> The same card, in the same slot, on the same board, does *not* hang the
>>> vendor 6.6 kernel -- it reports "Phy link never came up" and boots norm=
ally.
>>> Six other cards do not hang mainline either.  So whatever the electrica=
l
>>> cause, this looks like a robustness problem in pcie-spacemit-k1: an end=
point
>>> should not be able to hang a host-side DBI register access.
>>>
>>>
>>> HARDWARE
>>> --------
>>>    Milk-V Jupiter v1.1, SpacemiT M1 (socinfo: CPU[M1-8571] REV[C] DRO[1=
30]),
>>>    16 GiB LPDDR4X.
>>>    Firmware: stock vendor U-Boot 2022.10 (k1-bl-v2.2.9), unmodified.
>>>    Port B (ca400000, M.2) has a Samsung PM9B1 NVMe and works throughout=
.
>>>    Port C (ca800000) is the card slot -- an x8-length connector, silksc=
reened
>>>    PCIE_X2, wired x2.
>>>
>>>
>>> REPRODUCED ON
>>> -------------
>>>    v7.1 and v7.2, riscv defconfig (plus PHY_SPACEMIT_K1_USB2, USB_DWC3,
>>>    SPACEMIT_K1_TSENSOR, IGB, IGC, NVMe/ext4 built in).
>>>    gcc 13.3.0 (cross) and gcc 16.2.0 (native, Debian sid).
>>>    Identical failure in all combinations.  Not a regression -- port C h=
as
>>>    never worked with this card on mainline.
>>>
>>> Command line:
>>>    console=3DttyS0,115200 earlycon root=3D/dev/nvme0n1p2 rootwait rw
>>>    swiotlb=3D65536 clk_ignore_unused pd_ignore_unused
>>>
>>>
>>> SYMPTOM
>>> -------
>>> Port C prints its address ranges and then never speaks again.  (Log bel=
ow is
>>> from a run with port B disabled in DT, so nothing is interleaved.)
>>>
>>>    [ 1.290074] spacemit-k1-pcie ca800000.pcie: host bridge /soc/pcie-bu=
s/pcie@ca800000 ranges:
>>>    [ 1.297283] spacemit-k1-pcie ca800000.pcie:       IO 0x00b7002000..0=
x00b7101fff -> 0x0000000000
>>>    [ 1.312783] spacemit-k1-pcie ca800000.pcie:      MEM 0x00a0000000..0=
x00afffffff -> 0x00a0000000
>>>    [ 1.326753] spacemit-k1-pcie ca800000.pcie:      MEM 0x00b0000000..0=
x00b6ffffff -> 0x00b0000000
>>>    [22.348490] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
>>>    [22.351764] rcu:     4-...0: (12 GPs behind) idle=3D051c/1/0x4000000=
000000000 softirq=3D43/43 fqs=3D1908
>>>    [22.367040] Sending NMI from CPU 2 to CPUs 4:
>>>    [32.367049] After 10 seconds, these CPUS still haven't responded to =
the NMI: 4
>>>
>>> The CPU ignoring an NMI for ten seconds is why I read this as an MMIO a=
ccess
>>> that never receives a completion rather than a spin or a deadlock.
>>>
>>>
>>> LOCALISATION
>>> ------------
>>> I added a dev_info() before each step of k1_pcie_init() (patch at the e=
nd of
>>> this mail).  The last marker port C prints is the one immediately befor=
e the
>>> first DBI access:
>>>
>>>    [1.347050] spacemit-k1-pcie ca800000.pcie: K1DBG 1 toggle_soft_reset
>>>    [1.362635] spacemit-k1-pcie ca800000.pcie: K1DBG 2 enable_resources
>>>    [1.370918] spacemit-k1-pcie ca800000.pcie: K1DBG 3 first DBI write (=
vendor/device ID)
>>>    <nothing further>
>>=20
>> Sounds weird that an endpoint is causing DBI write hang.
>>=20
>> Can Alex or someone from Spacemit look into this issue?
>
> I think Yixun Lan or maybe Troy Mitchell should investigate.
>
> I have not done anything on the Milk-V Jupiter and have no
> access to any board of that type.
This seems to be device-specific. Some of our team members are already look=
ing into it.

--=20
Troy Mitchell


--5aa6fa5638c6e4ef04b289541629de5e53ccc8327148dde49673ae679c24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapjIEQ0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv/3sA/3cB2V5ShRbpFKlrOGG/ak5AYZnPZSI4Cj9mD/S8
v+bfAP9TR48gN2ZQ6yxgPavM/EQxD9OF1y6BdJfsu6pnp6BtAA==
=unDq
-----END PGP SIGNATURE-----

--5aa6fa5638c6e4ef04b289541629de5e53ccc8327148dde49673ae679c24--


--===============3165887725231524269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3165887725231524269==--

