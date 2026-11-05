Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA81D606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=luPwHN3p;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=m7vPwCDA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BAjAnAvqe5CudqlZE4Yy329PCGFQEGoMvQunGvIbJVw=; b=luPwHN3p+99YHKqNfO6trJ8kWH
	Ns2VWbLsn7rBsd9iWZN1Ljz5WbUgnDQDyklOyeZjVteHAIMCbN467sGvAymklUDqGdBU0MXOr2Wqv
	9hXTvzL0J3QsU+gC3CYsYzoTRj2Gsfli35F++2NgLsnuTvLbOkbja669i+LWmxSqbht8hg1RZcFzJ
	wwjcad+NZAsT5bAkdK4aLgCSv76seBkjXCGeoC/V2gU7KnuEYb040XAKLTom0Z7WUoYBR9t/Vb0Vq
	pctAw/1xjJ52P7sRPBaHzjdn3ddG9kRmgPBSPyX1esTZkPFX531kz3+MEvmjBXRtY7pAjyzq5RsJ+
	2cs3oYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyLi-00000009FmH-0Ytr;
	Thu, 05 Nov 2026 14:21:54 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyLe-00000009Flo-2yOd
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 14:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793888459;
	bh=Qj6ko1N3dgjOtQtUQnSyDi9DsI3Oyz7n8DZ/lHsW7LY=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=m7vPwCDAwm7TBtgTHcTYPUEdy0F7Tc2x+Kxs2Oim0F1g9VSw1c1Fwr2VenhW7x8kC
	 ZmNXel9gh6nuRDDhxEKfCi3qckWm+VrhErZEeCbzCtAKh9t0lB8rX4sfZh2L9KyfFV
	 EyGQmOW1rYg1EkiZrBwPfGVv+kXpJuue8gVJoEvE=
X-QQ-mid: esmtpgz15t1793888456td5594c5b
X-QQ-Originating-IP: yBFPL2ZTyWZz24PGoH1FCJQ1EtD4gvUo9iOr3+labVM=
Received: from = ( [183.48.245.66])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 22:20:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9366842104901777624
EX-QQ-RecipientCnt: 14
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Thu, 05 Nov 2026 14:20:52 +0000
Message-Id: <DMNCDUADFF3L.2ZLV0D2ZZ8CRB@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/5] riscv: defconfig: Enable AT24 EEPROM and ONIE TLV
 layout
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "E Shattow" <e@freeshell.de>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com> <20261105-k3-com260-module-sd-nor-mac-v1-4-138b39d74602@linux.spacemit.com> <0c4b79f0-383a-4884-8132-59dcb3487cd3@freeshell.de>
In-Reply-To: <0c4b79f0-383a-4884-8132-59dcb3487cd3@freeshell.de>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ni8FVWBWR2KXXlOgoP/5+403wqZLzweiHgXYv+0wxdZRQOALwriZKM+o
	E9HMDfRzbZCT4aBMAH/p8+ZRXrOGvfqfVxxe6HOqpBoTdftOm6cvRNU1XJo+MCZagn7Qf1C
	SHSUZ3XkzO2IsGSiuN08Ao/v3eByL7rr/tPjJZPstS9ZjrH1Q7+q4+vF11TvesmGA4daP+t
	w5AitYEeo0miHveTuQnHHpGCZTzFLxpgh6d/88SxAy6CTIJhspabYR57ksx79BsYj4maNZI
	HU3vLN+fnlUlEdqW44aFPiOhfQuAWkVxmnwWVTWO1Bn40MveNY3Ze7bLhdfdLtL7ly33oAC
	739iEJ0jhVIgA1Z0G7dJRj8LpdIn/1JQdPemdF8FLzwoFGzlBc5fBYSiOw14+Ikxwi+CLD2
	UqBuxT2B2RiGafmbZVtTEr3NfSfV5W7ivp7Q8SejdmEsAavlpEEriS36kK59MsTg6Xk39yb
	ZnTr8zbT8XrTBkCArt7KdVkxoen07OEsnl3P50Omo+9cYZMxzwf5YvtIw8qCRscqAn3LHwH
	H/PBmVjt1NvHzGXGUDeDneJ3Oh9JKKJYXeaqQesYWCeWhYeFD8ytG1uXkzOz33VgwlmJYMN
	CtoZMQZyQEAZ/CauvrtkgQhBziaNKwKd0dORtn03QE1HKRhbHEiopJLGUGQAGaSHppxsI+L
	u6JfFmoPU+zEtVjlb4EgdSCsRUFmUM5Tr/2vT899xe0gvd++yCwu/IAkWmQRDz4NlHslVkP
	CXisr46GnG3+wb2HcJ0w8Q/Fv7WWm0yhiLSSZJmppC1m+fZElc9c2lROHxig4CuHaj9X1MZ
	qu7wZnB9IXHywGLoZZ9hN0JNx935K4UpRDjAqtXwde02z7THLsZFP7wnOJ0t5yYbHNkeI8N
	PZgtcY+Qp1ok/35zvdBWOHm8KDBkO/A0K63xvDfDs4cKVL6CCO/5ARmba8MuxDw9KoqcXRn
	GNvIhm9GQtiFtYXHpS7WVfzqr9akjASfpSbXZ+0G9Nog1llmv+uyowOQXIpmbqjcbPc9SWX
	mXCRwUHuNPI+SgR7pOvyQ3D7Sr/oZcm6nTiPiGaFQiol/1OJ1hIODBGEJa/UuOK7GIf1BRJ
	jrHRp2y2psHbeZdaR3WURfTMckHlDeiZOMp9b5uiJ1jyGmxxoEQ5ODRovmeINoHBqQNs5V5
	nA7GB3+81u4pGFbXua3umCuM8g==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-SPAM: true
X-QQ-RECHKSPAM: 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_062151_529327_436F6BDF 
X-CRM114-Status: GOOD (  13.86  )
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
Content-Type: multipart/mixed; boundary="===============4866248745723971142=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4866248745723971142==
Content-Type: multipart/signed;
 boundary=dda49a7eb14547398a92cd8d13a7d78afa9d0d5b3d65ebe7063bbb21050d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--dda49a7eb14547398a92cd8d13a7d78afa9d0d5b3d65ebe7063bbb21050d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Nov 5, 2026 at 10:42 AM GMT, E Shattow wrote:
> On 11/5/26 00:23, Troy Mitchell wrote:
>> The OrangePi RV2 and R2S device trees take the Ethernet MAC address from
>> the ONIE TLV data in an AT24 EEPROM, and the K3 CoM260 module stores its
>> MAC address the same way. Without the EEPROM driver and the ONIE TLV
>> layout, the MAC address lookup keeps returning -EPROBE_DEFER and the
>> Ethernet controller never probes unless the bootloader passes a MAC
>> address in the device tree.
>>=20
>> Enable both drivers as built-in so the MAC address is available as soon
>> as the Ethernet driver probes, including for network root file systems.
>
> This does not make sense for platforms which have no use for EEPROM
> driver in Linux userspace.
>
>>=20
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>>  arch/riscv/configs/defconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>> index 04ae305d5511..a76f801d8eed 100644
>> --- a/arch/riscv/configs/defconfig
>> +++ b/arch/riscv/configs/defconfig
>> @@ -276,6 +276,8 @@ CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=3Dm
>>  CONFIG_PHY_STARFIVE_JH7110_PCIE=3Dm
>>  CONFIG_PHY_STARFIVE_JH7110_USB=3Dm
>>  CONFIG_LIBNVDIMM=3Dy
>> +CONFIG_NVMEM_LAYOUT_ONIE_TLV=3Dy
>> +CONFIG_EEPROM_AT24=3Dy
>
> Enabled as module, please.
Yes, you are right. Will be module in the next version.

--=20
Troy Mitchell


--dda49a7eb14547398a92cd8d13a7d78afa9d0d5b3d65ebe7063bbb21050d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCauyQxCEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9ZSwD6AxJbBe8W18yH
nr4KCfjIsJCOqNmdf0vzp8XWweapmi4A/1NGR2u7q/A/7Ho7/TlsOtBYjUmXNKZ4
lwAjGYrg+mAL
=AhUC
-----END PGP SIGNATURE-----

--dda49a7eb14547398a92cd8d13a7d78afa9d0d5b3d65ebe7063bbb21050d--


--===============4866248745723971142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4866248745723971142==--

