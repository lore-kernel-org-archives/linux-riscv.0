Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D777BC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8zasqHe2cUNX7BnSrKOq+OIF8Vt61GuxbshE23LtEpE=; b=czI
	rkhQC1LJFz+Z9H55Mccld687470po+p9qMyv8AcRMicTig0UjfItXC3MXSbPXeLN+Qy3C6a4F5fQY
	BHj0/mtWOhzXISd/Y7cWE+GaRjV0QZAoDJI2T35f4BztssfZ7k0n21HtFDa8LH4E59OizZmdffIuz
	ZIqjcFAIMu1E+5Ego3FjplVRAjIQE/VoimbWGAevPRAK1/4GQ2ZkQup/3Esae/o8XOvl4MJ3RWici
	rvZknX3om1VKa34oBnnvBh5KK8iyVts8erImGEcW6gcBNRuZeUIiX5t6L3C9sLi0WFlPxcjK5ZPAG
	eQel7zQ4oxqjIfir12kppMqFGVeUcZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paILu-00AxiK-CQ; Thu, 09 Mar 2023 15:38:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paI2a-00AqTH-Nz
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 15:18:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id i10so2308155plr.9
        for <linux-riscv@lists.infradead.org>; Thu, 09 Mar 2023 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375125;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqJLOSE1AAWFH/dYd/PFJcdLvUyhLLNn5Gbfhxknyzk=;
        b=KNTZ2dpNN0U4k7I0+qb7N5ZO0h7PGBNWPdniys3GW/BHKd0g4407XxWFCa7rLC9OcD
         llBGVnLdJK4zN6ImU6v8By3Ie/9nsYiUJlNKMs1hPxIxX2FHvVnqDyrEtwL2b5QJPS3d
         kzrD7v3wNmwK4FtV8zoDqinQOplYqT3GKhyrJSQUIFz9rKSnuM4W0qa886v5dsnyr4uD
         A0dTdA5hOK63izJNizw+/8jB5PmlVSFqDpz2QGcxLEdyFoLZT//k0PxToJWJ4+m/2UNT
         DXQhP0QJ1vfoRugM84vXTRqq2dIhVVXacw0cc8jmn/p247E07mDGs1+cOF+GCf+0f5zK
         x/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375125;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqJLOSE1AAWFH/dYd/PFJcdLvUyhLLNn5Gbfhxknyzk=;
        b=vlpn0M/B6SOZAGilR3y77LCyjft3++6JKQyzBASjP8Nxd6gWk3kIezFpzTBheqVXBB
         wJvrdB2OV4nxXZcHucnHFsKLn49d/NCZ5ITbFxf17Tc7deFyJI6qznIC49UhcpHNfpz/
         5Hapevt6CZSZmwK0PEoxEdjQEjd8TCC/jD8vi83GsyumvoPmCdaygIK7USL0PdqCa0ab
         d+VbS2HE0lVA/DIGaHCVeZdWwdOcFSOcDmhZloniGhvGIQnjZAbDKgGe5irge6jm2zN7
         hBaeyi/7U2guVpiSj9EnanUQa5ULBzpMz3BpLpxOuxOT05lAqtF6hG2dzYUhmU1u46e2
         2TRw==
X-Gm-Message-State: AO0yUKWlxMkl9Svq0bu9p+BgX26vDjyvWv4ZcU9167wq0u8KY8IsxZNl
	JUSy5FcaVdFGfrcEAQxyYzy2icKoWa/6OQ==
X-Google-Smtp-Source: AK7set9FIXEaBG5mPDiKEXXZiXtbi4uFRwykL+OE+f1+s5Sq1+vdbn6VnxnKVyxPcl0gKQ+J7UCYCg==
X-Received: by 2002:a17:902:bc42:b0:19e:6a4c:9fa0 with SMTP id t2-20020a170902bc4200b0019e6a4c9fa0mr19533392plz.49.1678375124769;
        Thu, 09 Mar 2023 07:18:44 -0800 (PST)
Received: from debian ([47.242.94.15])
        by smtp.gmail.com with ESMTPSA id q15-20020a170902f78f00b001948ff5cc32sm11679286pln.215.2023.03.09.07.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:18:44 -0800 (PST)
Date: Thu, 9 Mar 2023 23:18:41 +0800
From: Bo YU <tsu.yubo@gmail.com>
To: tsu.yubo@gmail.com, linux-riscv@lists.infradead.org
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Subject: potential riscv special bug maybe found
Message-ID: <20230309151841.bomov6hq3ybyp42a@debian>
X-PGP-Key: https://github.com/yuzibo/yuzibo.github.io/blob/master/_includes/subkey-signing-06-18-143E4BAF-pub.asc
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_071848_810511_5723B6E2 
X-CRM114-Status: GOOD (  12.42  )
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
Content-Type: multipart/mixed; boundary="===============6806415062950164363=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6806415062950164363==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="frx7ljsjjhoz2qzn"
Content-Disposition: inline


--frx7ljsjjhoz2qzn
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I am sorry if this is noise.

Some days ago I noticed strace 6.2 was built failed on riscv64 due to
test cases[0]. There is one program from strace can reproduce it:

```
=2E/tests/read-write=20
```

It will be hang.

In fact, the issue has existed since 5.18. I `git bisect` and finally
found out the issue was introduced by the commit[1]:

commit 631f871f071746789e9242e514ab0f49067fa97a
Author: Andreas Gruenbacher <agruenba@redhat.com>
Date:   Tue Nov 9 12:56:06 2021 +0100

     fs/iomap: Fix buffered write page prefaulting

I do not think there is a problem with this commit, because it does not
affect others arch expect riscv and after I reverted it, it will pass
all test cases from strace(There is still one case failed on qemu, but
this is another store).=20

I try to debug something but failed.
Would be appreciated it any help.

PS:
This is `cat /proc/${read-write-pid}/stack` when hang:
[<0>] generic_perform_write+0x12e/0x1ec
[<0>] ext4_buffered_write_iter+0x5e/0xe6
[<0>] ext4_file_write_iter+0xb4/0x67c
[<0>] vfs_write+0x1d2/0x308
[<0>] ksys_write+0x56/0xc6
[<0>] sys_write+0xe/0x16
[<0>] check_syscall_nr+0x3c/0x3c

[0]: https://github.com/strace/strace/issues/242
[1]: https://lkml.org/lkml/2021/11/23/641

--=20
Regards,
--
   Bo YU


--frx7ljsjjhoz2qzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcmhjYVTlmab0tjp+RVP3hQ+S68FAmQJ+MwACgkQ+RVP3hQ+
S69DOw/+LX88uLg1FSW57Ucfgp6jeXC86mqGLxvEfJIhuv3A0aYpoyk8oiBCoevc
UPEC/81Fa7Jx0rX0i8w+nS962BGE1Db9r1wXMOw1N+UR5e9PlFetSNH5/o0rsoog
1TiuzHC+apK9DYrEsfykLO+6fXQdpKoYrxsN5mnh6oypyoKQaFqA/KCS88TfBIIO
JzbwFUJFSaWJUEqB7Xm7PhcxHwEkJrveQKLf4RvqRHxw9DGZKD9ACAZsaKl3lLwb
FpTU60PALmoS8py4IwpkeBqssCTA2Zl8lO8qf02G42UXNeqUq2DtTTpp52QJDsXH
KDWjeTkE8FQ8ovuAYK3oD8FD6bk7eUw+YD1H9jFldq6ZgyW7tYMiqAMc4/vXxoPZ
AEyWLlOL04YBMlNYVOcycWFVq/Jgk1UmkrjVIpAP2k3Q6FE/tJ+UzdXN+QdLs4KC
yJ40zw+7GYBTnzbqqLbSnexqLgQ6uJtSTCx7QpX05ykYWgfpLbKxsAPRH3T26UKi
4T/pFVGqBEXJ0aE7IUSphK3ybwwyx0NprfTKrcywAKP4bNBdpNx1SgRgS3d1/2NN
v4RmAZoM0xoYUj95fjqSzBndbDq7LCe17eYE81AOfiTlPR5f3kXvJAyPNu7i7dJw
1xrXweUaMMB626wMHMvJETyUcLEhfzYNTXtIj6xPNc7h/4PF2Hs=
=5ldL
-----END PGP SIGNATURE-----

--frx7ljsjjhoz2qzn--


--===============6806415062950164363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6806415062950164363==--

