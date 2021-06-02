Return-Path: <SRS0=2RK3=K4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49189C47083
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 08:35:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6AB6613D2
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jun 2021 08:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6AB6613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=email.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpOFjADLy6SbZ1Vjnsa5/6z+I6d3/6X+aBllMaCt7k8=; b=A2eAO7jRBxTurS/VDEQxkRZeyZ
	gNv59yQbE8SkrP6T8lTHcBoKBXrhdQqC3FTLjqn8ptSR9N8+3L7tDQAhx3IBBXKeLeoekGqEQRAq2
	zuL754PvjU328Nt4H/j92MnsENAuKE3kShKmI1/CLsukuJMwXQWCJN23xZ42frDxLTolKWa05RM/5
	aWIJntAPp6+9eG4yEYQIcte09OVAoNGk6NGn6vDktRB9lLzQ1cpFtWsMd3VMF6BqhPyjZvS6wnDxc
	HvNdbLIxqJozcXCzI8Dg7XvXwkwiqWPlwMFwz9LJPbTgO7ZiNLgZ81OSP/kRuJf8gjwIWjL/unEUt
	Z6bVIafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loMLg-002h8I-6G; Wed, 02 Jun 2021 08:35:36 +0000
Received: from [43.250.32.171] (helo=email.cn)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loLuG-002UtI-Uv
 for linux-riscv@lists.infradead.org; Wed, 02 Jun 2021 08:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
 s=dkim; h=Date:From:To; bh=Qe7DVUGWTLR45yFMoXN0MFJz0EI9ND9xibka/
 59j2QM=; b=lX67xDTAcfiQTAo+isRbL8s5zw1jmb02KQXgo+Rzp5zSQj3vUGGNM
 F0iLPCld+SYC3mJ4CrU7O4l7Ux7tJC1tkH/zkxNWLVIOaInf+zoauNmJYEbyNqj1
 Ae9NknTg60jReBDtn1W2pvHl46hKAoiP4NeYYEl/bYAFfrSkpsGVl0=
Received: from bobwxc.top (unknown [120.238.248.220])
 by v_coremail2-frontend-1 (Coremail) with SMTP id
 LCKnCgDXnUD6O7dgvSdUAA--.8870S2; 
 Wed, 02 Jun 2021 16:06:21 +0800 (CST)
Date: Wed, 2 Jun 2021 16:06:18 +0800
From: "Wu X.C." <bobwxc@email.cn>
To: Jiabing Wan <wanjiabing@vivo.com>
Cc: teng sterling <sterlingteng@gmail.com>, Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bernard Zhao <bernard@vivo.com>, Fangrui Song <maskray@google.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
Subject: Re: Re: [PATCH] docs/zh_CN: add translations in zh_CN/dev-tools/kasan
Message-ID: <20210602080618.GA13557@bobwxc.top>
References: <CAMU9jJqwEvzp9T=A2dd-dMwTB69H==3G_ba0wnAw_pTenwdjvQ@mail.gmail.com>
 <AJsAIwDhDrLmLTPKOHKvbark.3.1622615414473.Hmail.wanjiabing@vivo.com>
MIME-Version: 1.0
In-Reply-To: <AJsAIwDhDrLmLTPKOHKvbark.3.1622615414473.Hmail.wanjiabing@vivo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDXnUD6O7dgvSdUAA--.8870S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr4DJFW7AFy5GF1kXFWrZrb_yoWxurX_X3
 yUA3W2kw1qgFyDAa9aqw4fAFZ3Kay2gFnYqFs5JwnxJa97XFs7Xas2vFnayF95Xrs8X3sx
 WFs8X34avw15ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbzxYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
 s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
 8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
 87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
 CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI4
 02YVCY1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4U
 Jr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
 xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
 jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
 0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
 67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRRJPEDUUUUU==
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_010717_464353_8C1EAB2E 
X-CRM114-Status: GOOD (  11.34  )
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
Content-Type: multipart/mixed; boundary="===============2052588917465851719=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2052588917465851719==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 02:30:14PM +0800, Jiabing Wan wrote:
> =20
> >> +
> >> +=E8=BD=AF=E4=BB=B6 KASAN =E6=A8=A1=E5=BC=8F=EF=BC=88#1 =E5=92=8C #2=
=EF=BC=89=E4=BD=BF=E7=94=A8=E7=BC=96=E8=AF=91=E6=97=B6=E5=B7=A5=E5=85=B7=E5=
=9C=A8=E6=AF=8F=E6=AC=A1=E5=86=85=E5=AD=98=E8=AE=BF=E9=97=AE=E4=B9=8B=E5=89=
=8D=E6=8F=92=E5=85=A5=E6=9C=89=E6=95=88=E6=80=A7=E6=A3=80=E6=9F=A5=EF=BC=8C
> >Delete the spaces before and after KASAN, these spaces don't look good
> >inside the html.
>=20
> I'll fix them,thank you.
> BTW, how about other English words, like "SLUB", "free"?
> It seems most english word in this document are surround with spaces...
>=20

Now we don't add spaces between Chinese and English.
It is easy to add spaces, but hard to remove someday ;)
I think the "space" should be resolved by format control like CSS or
xeCJK (yes, latex's xeCJK will control such space).

Thanks,
Wu X.C.

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmC3O/MACgkQtlsoEiKC
sIVg9wwAuX8z8mM7cHYe/Wv0KjdN3jDlR089Cuq1f2ASG32BKLDMDzrqjN1cDIL8
QYnqTyph/Rjmx6Tmc7aUPxSy+k2K0XnKGn73FIeqI2aFp9l20Ixj01P7WqrwZJjV
f6kBI83DA3dq4x5cSxgw1S1n4T/hi7DI4FIcCPXIWXJ8oBcyZrtL0mm2W7bipKYP
15cw60hhhvzTlIvKTrdX1Tp9oORraCAdFms59pWGsVxqSYkv1AAzHsmktjiJRuiR
N2LzN+hSFmfpSUpsvEUG5Jwnp8pQBBtwdwP51rhjbgmbCCYLRTcluY7tDBTbXtNW
8HYFyGhQQ5v0IQgmqqWwBp19V23MeYMqcmF65d36CYDt9W+7sjvaV4fE0S0fceRp
gIVK2D1jn1WdSyawFqkrdIwilvy0W2kf3DTF65jm3kyeQyWBre6/Rn1FnbwK66Sp
hddbOrJknXjEiSWwSe52dczRf2xXc+75SqJuqN3x+AEOZeEthGS80rP/+uTFe7kL
4ACod2EB
=WKFE
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--



--===============2052588917465851719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2052588917465851719==--


