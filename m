Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85398606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 01:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iAdfymGl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=QlM6IKAC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dgnGALx5NmMMFEI3aUgLhEqdTqE60S9AQt0G16lwf9k=; b=iAdfymGl0ozKE7krmsKxePxqME
	NR2wPqv5/1T7bxB40OGzmeS6gbPy4bOS1iAA+TiqulL3FfZ8Lw/5v4Ef+gQ4Q8suP3g+GzGR7ME7J
	jQy5YM2wY587xKN7e1ICr2XFUEV5+ZE6ZeuH7490eDhSJb5ncKwSbtVZle8/ugIBnb5hahtMGVyB9
	k6iAXNbIBfg0e7q96LSzg4zMX6LSNAT+63fsDWHKxJxcvpm8sQwjz1FuVuvUVmam9tJCWXmAOFv4D
	BTd9rnBLiRrEJuhqY7N6MF55fUZmfKO0CPh25y5eiTlp21pwL+n0pUR+WFmzf6JIBXWx1e7IbptJl
	rlgTfR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVetp-00000005IGC-0yBh;
	Tue, 24 Nov 2026 01:00:45 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVetk-00000005IFl-2sCM
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 01:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1795482027;
	bh=Ggw7YcUYncqyVJG+//d0uJLUqpnx7zsMywIoX1umATo=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=QlM6IKAC38SvCbK00Pi9cTE69gcAUBd3lHR8uGTmD1Vaw+VGVYl67gpmUJJgPkkJz
	 9bKl+H4chJIAmv9DpE9a2lud3OUn7u1oM/yFw+f7TIstdNGNFWLnlSDuedEh2AZHHf
	 Udb0bdmtUIhsSgJYVvFhFZfYHDu2JXLoUbJwUlMk=
X-QQ-mid: esmtpsz16t1795482022ted70460e
X-QQ-Originating-IP: aaGmqngVMZGJB+SVmvOQbimTL7t13n7UZqIKKuEE44Y=
Received: from = ( [183.48.244.245])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Nov 2026 09:00:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2033590560538473759
EX-QQ-RecipientCnt: 17
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Tue, 24 Nov 2026 01:00:18 +0000
Message-Id: <DN3198CCQBG1.RZR764NVW5ZK@linux.spacemit.com>
Cc: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Zixian Zeng" <sycamoremoon376@gmail.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Yixun Lan" <dlan@kernel.org>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Aurelien
 Jarno" <aurelien@aurel32.net>, "Vivian Wang" <wangruikang@iscas.ac.cn>,
 "Junhui Liu" <junhui.liu@pigmoral.tech>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
In-Reply-To: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OGmpL5CFYt/YATdBNWYWGhBWqnqjud8jL7fKHkPClwCAn5dG/yjBkOKm
	VxABQ9X79QymsaamZV/E5YxIyDm8KoGFoTGKeFcVS9aqz3rMBe0EgilRrgZVKCMfnHnRGxN
	MIwysIvUN7NoGG95e9Qv4drW2pxXgD0HgO4sUnw5d9aWUWbqZDbIgsvV4t58C70e/r3Gm6q
	EJ4vc2deEMBEnfhtXgxxxsMTbWXMh5Wnpyns56CunymkkdreUHpQvpaOTij82HG656MJkLF
	xNDHBS0PNgIEoGkMdRx96XGqQ/Co9jhLQAxnvn4JEAoU6aGF3CjgjO3G1vkhTB1J+4JCRRx
	WhEFNWJOqpEqFXY5GxmWke/dsTyciptPB7iI0F7Gaz0pia8pddK1Cm6zRy6699aOpYYbOYZ
	QvqflRlJrtFNixOBQ3quI6LbZCnUzDVwGNCNAHTbrVKFGqGaM2wYMQaRU+R2lYbPlcGMy35
	EVLEwYYhBvCvGHuNsdmDjqzefZbiDFZ8Ii/yZp/beo6nrvQIhn4GAWedYM0qPgwGfB4QOC3
	DM7oxSdZRd7sEFCu4wRbWqmKjVh3Kt3gvWL4FGxxH3fKbDlj2QQAtTgpZlRD0a5tFQtTrqN
	g/YNJFs3EWmg/mWo7btM1bvTimd53UMpzHcYOBJW+5elLSJUf/K+wgjUh/WMcU2leehtH2b
	gwDjDBvho9UNG9F6aeU4pV26xd+NFlp32FB2t7Ht5Nh3rslk0zy3HxsFssVlLS3s7e5keoF
	GBP3bNFnHIUdb6QMtDWiCdy2bCW+bfBw9Ow1oRpBPfsLeLU6Nu+Wp9uRHXGCWisG36qAgmO
	dvGJ09VZO7HJcHqpFLqYEf1zSIy3pJMLLBSuIgUvXCglOm05dZ8bp4euKL3/pOoNC+6kLkj
	R6kcfDFOylj2TDjyYBR3fzMmRQ1vzsfi9wfncyH6qYi9LzXOzQaxE3GLp3RYA5DQv0KKMUY
	Q1rFk4gXwV1BW72/QLCtGdnQRmkQGjhHF7SsgUTU30eQztIgSgSDeT/xo9Q26DFRGxlpNGT
	qOWDLT7b8ugpX3Qyas7OV/pQ4pfi3MvtXcPz0IK33nfZFv8wcO8QZal7arZkVJMz4QxcnWz
	kx7CrH++MuRIM0xfTUM3aDJPKT6QtRm2IdICwpUGsQtx6B8aGsRzm/uZ/q57z9Q8jtd2abw
	XQA++sCEZ7pogNg=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_170041_547883_64096E61 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7111877325209241207=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7111877325209241207==
Content-Type: multipart/signed;
 boundary=717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 23, 2026 at 4:41 AM GMT, Zixian Zeng wrote:
> The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> 256 bytes with an 8-byte write page, which can be found in schematic[2].
> The device tree declares pagesize =3D <16>, which does not match the
> eeprom chip datasheet which declares pagesize 8 bytes.
> EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> together, based on the chip model shown in the schematic diagram.
>
> The TLV EEPROM on this board holds the base MAC address and the MAC count=
,
> so a corrupted write leaves both Ethernet ports without a MAC address,
> which is how this was found.
>
> Link: https://www.giantec-semi.com/uploads/20230414/GT24C02B.pdf [1]
> Link: https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/v=
iew?usp=3Dsharing [2]
> Link: https://pan.baidu.com/s/13UTY_qM4gGuVxsZ9U7_Xpw?pwd=3D8888 [3]
> Link: https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNboh=
nONSR?usp=3Dsharing [4]
> Fixes: bfce75e2345f ("riscv: dts: spacemit: add 24c02 eeprom on BPI-F3")
> Fixes: 46a8c01700ac ("riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO =
board")
> Fixes: ac436e6879f5 ("riscv: dts: spacemit: enable onboard eeprom for Ora=
ngePi")
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCawThoiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC+o+wD+OlEf5HFUNy7f
l7HTzclNxt5QfKGOcZ77dQoUSqNlL8EA/Riqjg+f1nUhCjJ/zfcW9Ig33/Ral0U7
tEVGQLgIa8QB
=DIuQ
-----END PGP SIGNATURE-----

--717a22241ebf390108ca063a911934bd69b0b5ad107928f9f178dc29d784--


--===============7111877325209241207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7111877325209241207==--

