Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00E0EB64DA
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 16:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3Is7THmkKuv1Y/6HMBysVUPrRM33/iIAHssXBsWmbc=; b=zqIZR6MWCCAkOKM8gAPJRe6NS4
	4/0jFZh3q9Xs2ysUn1DdrGHiZzDgp8l8ojxoIs01FgEQOHFCXu1Gg7/BWXNkJg1dYhD7+jSOEAzww
	Yka92moUw02fkKs9oVi7GN9fq1ktyNhBSeQTMl9TbY9vBN3p6P4abnUQcVk7iqPB3+yV+SPu4Jbzs
	0+ZsH+MuW2LbgG4THj4OO1Sx7eUUgjvqlc4HvmPR4/DMeH2FV0CIg6dZ5yX8zYjZ1zmBZg0ORwEzD
	cV5kae7LlzoVONqs5IpJ3lBBG+u2pdEJfCvMn70dAxOq6xjPCfxpgWATtjJNB8XAlEtouoUCrCbjS
	fa7njITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHo8H-005ABJ-2p;
	Fri, 07 Jul 2023 16:16:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHo8E-005AAm-3A
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 16:16:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B8C861A02;
	Fri,  7 Jul 2023 16:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710E5C433C7;
	Fri,  7 Jul 2023 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688746589;
	bh=pbnXRhVySf14G9UUJhkd+L9NaIu5G90Mbtsz7TnLfrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iA3khxCeCcZuXExNsjQj7UM6c3HCUDupcSUkpt2D2twVnz4wDXkMnQ+Y0++FfWZjh
	 GWRR5FNYbcAvnU+3kEwiOPl0AREYmsoCMaM+N0zjbQ7KSrcr5e5guLS221wxBEb1AQ
	 +zQmq+JVyPx/j29K4OEWY94RtVxNE6v9Qs8B7dPd7Z3EH8eDJZt/+IIkd+HItnMbdW
	 68QsH1vusOFYYhLEJbD2uyxsAJ+oBrBhBaEEOmqkisbp43qKwqt3sLDQIXPDXRGgi9
	 FAOoXXjOxVzMOOuJrhXsMzDWC6fZhtIpUUgC9cRMwtsizhclTj4ePX/92fC+Boae+r
	 j2joOl0sQkGag==
Date: Fri, 7 Jul 2023 17:16:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: firmware: Document ffitbl binding
Message-ID: <20230707-brigade-myth-86ee252b2e4a@spud>
References: <20230705114251.661-1-cuiyunhui@bytedance.com>
 <20230705114251.661-5-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20230705114251.661-5-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_091631_106837_51AAC9BD 
X-CRM114-Status: GOOD (  22.36  )
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
Cc: mark.rutland@arm.com, jdelvare@suse.com, aou@eecs.berkeley.edu, weidong.wd@bytedance.com, allen-kh.cheng@mediatek.com, rafael@kernel.org, geshijian@bytedance.com, lpieralisi@kernel.org, yc.hung@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org, rminnich@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, tinghan.shen@mediatek.com, linux-riscv@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-acpi@vger.kernel.org, ardb@kernel.org, lenb@kernel.org
Content-Type: multipart/mixed; boundary="===============7596935294887525914=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7596935294887525914==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MexQSwawafA3M9FW"
Content-Disposition: inline


--MexQSwawafA3M9FW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Jul 05, 2023 at 07:42:51PM +0800, Yunhui Cui wrote:
> Add the description for ffitbl subnode.
>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  .../devicetree/bindings/firmware/ffitbl.txt   | 27 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/ffitbl.txt
>=20
> diff --git a/Documentation/devicetree/bindings/firmware/ffitbl.txt b/Docu=
mentation/devicetree/bindings/firmware/ffitbl.txt
> new file mode 100644
> index 000000000000..c42368626199
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/firmware/ffitbl.txt
> @@ -0,0 +1,27 @@
> +FFI(FDT FIRMWARE INTERFACE) driver
> +
> +Required properties:
> + - entry		: acpi or smbios root pointer, u64
> + - reg			: acpi or smbios version, u32
> +
> +Some bootloaders, such as Coreboot do not support EFI,
> +only devicetree and some arches do not have a reserved
> +address segment. Add "ffitbl" subnode to obtain ACPI RSDP
> +and SMBIOS entry.

Since the conversation on this stuff all seems to be going absolutely
nowhere, the ACPI portion of this is intended for use on RISC-V in
violation of the RISC-V ACPI specs. It also goes against the
requirements of the platform spec. Quoting from [1]:

| > Just so we're all on the same page, I just now asked Mark Himelstein
| > of RISC-V International if there is anything in RISC-V standards that
| > requires UEFI, and the answer is a solid "no."
|=20
| Huh? Firstly, running off to invoke RVI is not productive - they don't
| maintain the various operating system kernels etc.
| Secondly, that does not seem to be true. The platform spec mandates UEFI
| for the OS-A server platform, alongside ACPI:
| https://github.com/riscv/riscv-platform-specs/blob/main/riscv-platform-sp=
ec.adoc#32-boot-process
| and the OS-A embedded platform needs to comply with EBBR & use DT:
| https://github.com/riscv/riscv-platform-specs/blob/main/riscv-platform-sp=
ec.adoc#32-boot-process
|=20
| EBBR does say that systems must not provide both ACPI and DT to the OS
| loader, but I am far from an expert on these kind of things & am not
| sure where something like this where the DT "contains" ACPI would stand.
|=20
| The RISC-V ACPI spec also says "UEFI firmware is mandatory to support
| ACPI":
| https://github.com/riscv-non-isa/riscv-acpi/blob/master/riscv-acpi-guidan=
ce.adoc

NAKed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

[1] - https://lore.kernel.org/linux-riscv/20230707-attach-conjuror-306d9673=
47ce@wendy/

--MexQSwawafA3M9FW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKg6VwAKCRB4tDGHoIJi
0tsPAP0bKjMWR0EO3MkRO8EwPjH447Grmd24cJV3uLKXhycVGQEAxlcHMYpTj38j
JvMPxFtO7OquXt3BnCppGSpNCHKakgQ=
=/Xfw
-----END PGP SIGNATURE-----

--MexQSwawafA3M9FW--


--===============7596935294887525914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7596935294887525914==--

