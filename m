Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1CFC54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 02:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucFuwZvSSm80tdTQBIv0A2wAU/Pyyz1YFDtnZy4jQNY=; b=fUtN3IAwPGKNIvjS4Z2kbUQB7o
	LGiAslrbo7OyYVB15Yt0cb4iGccDEchJwqOnXRdW7+VR7VoH3ti0yMybXZO8JEebDGRi4WZFxHNk6
	lIafGbtjWflMDaCv0qmkUR/NYKE41Oo7AWjzYposC8b5LwS8Mu1JbJve//8dqewmjhL7pU1G2Mtot
	vSAd3ib39B3CQBdLWBZ1Gjb0is3cB1eJMULn2brFG3Wg/k2Y6YYEDpSOzZ87Psx+gVRFLKh3hK/lv
	YaP9kyqZEmmPpcsLHTeDiL/o6Ug8dxYJcxxPpgvw3sQk7HH+gU8WiwQ3vpqz5qyM0+4BKfVVGMTiz
	0SmhSZQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrvl-009RXr-O3; Thu, 26 Jan 2023 02:24:01 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrvi-009RUn-RL
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 02:24:00 +0000
Received: by mail-pl1-x644.google.com with SMTP id 5so723247plo.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 18:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YdzDiMhd5Z4Kbptw7LbpvnJl2K3L0BK+iFAqX7khznk=;
        b=cWKQ3LoRkq2yJUejFpLnrkED2LKr3msUYmGPeKxn1zz9oXsR2Q5y+uBNeQcluKW+Hb
         t3RYOIc3ExQTYLpI6hzcuYBj/SWWdUhatpoaAZ1lhjyniEeSuRQsANu6geJhcoezuexn
         2p4A6kFID76IX/8Y0c6UDG+PgC275wJuLtxBwwzp0N9TIvOMGwDZt1yO+zWAr6VRegI4
         Q+v50gsZDo6AJTpm1LmXUDfg/+diQibnpxpLW84XH+nCkK6Du1urF3rgBfcAwQdqN/aI
         3mBdOgOt2SPx8npCj1G242UNu68EiGAJQ5Ss3rfAVKGpu98B2MekgUQYevlSzX65x4h2
         M5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdzDiMhd5Z4Kbptw7LbpvnJl2K3L0BK+iFAqX7khznk=;
        b=Z8WDHaSCUw5M+rlhjZ4jGbifh02GxuaUXxNt+ToC3RAynl4Wt+pm9lTlBVBR5xEhy2
         F3YhDt0q+03+4/g4uJv4TN5hzrrnL5pxPoz6LVuDHYOzs0pF1uJtpRbnrzS162i4vfGq
         MmUlkY7W7mg/1GSqF+RJXmImVzZ3LYqP5bPHBqvD5OxQqFmmfsar6DrYjy4GFsd809Z0
         VA7/SNEwXGvbyFWBboO0VpIRNLHWX1czx+BDpiXzxJ1dPiIct+7yp7CpGY1t4otWtt5C
         mUeKdh6n9RhtyiFvABf7dSzsy6Y/++uoQblooY2N0ZyvC5v/AyXod5y8bkW1au9Q+D2L
         6CCA==
X-Gm-Message-State: AO0yUKVG8FLvishE3e/juaH3exdbfWsf5hQBLZptC6Li+EgKea50ggYM
	1551ELYDk7HEL7Nqdei9DE0=
X-Google-Smtp-Source: AK7set/14C5I2PLQlIMm8XzbOGKH6ITAlKjdzDv7CG3uI/+49audlvaBIR3PdKSPBKqLUtyOJ7TKlw==
X-Received: by 2002:a17:902:da92:b0:192:7c38:4842 with SMTP id j18-20020a170902da9200b001927c384842mr223082plx.53.1674699834271;
        Wed, 25 Jan 2023 18:23:54 -0800 (PST)
Received: from debian.me (subs02-180-214-232-79.three.co.id. [180.214.232.79])
        by smtp.gmail.com with ESMTPSA id bb4-20020a170902bc8400b00192a96f4916sm48527plb.259.2023.01.25.18.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 18:23:53 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 8EE9110544A; Thu, 26 Jan 2023 09:23:50 +0700 (WIB)
Date: Thu, 26 Jan 2023 09:23:50 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jules Maselbas <jmaselbas@kalray.eu>
Cc: Yann Sionneau <ysionneau@kalray.eu>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>,
	Eric Paris <eparis@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guillaume Thouvenin <gthouvenin@kalray.eu>,
	Clement Leger <clement@clement-leger.fr>,
	Vincent Chardon <vincent.chardon@elsys-design.com>,
	Marc =?utf-8?B?UG91bGhpw6hz?= <dkm@kataplop.net>,
	Julian Vetter <jvetter@kalray.eu>, Samuel Jones <sjones@kalray.eu>,
	Ashley Lesdalons <alesdalons@kalray.eu>,
	Thomas Costis <tcostis@kalray.eu>,
	Marius Gligor <mgligor@kalray.eu>,
	Jonathan Borne <jborne@kalray.eu>,
	Julien Villette <jvillette@kalray.eu>,
	Luc Michel <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>,
	Julien Hascoet <jhascoet@kalray.eu>,
	Jean-Christophe Pince <jcpince@gmail.com>,
	Guillaume Missonnier <gmissonnier@kalray.eu>,
	Alex Michon <amichon@kalray.eu>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>,
	Shaokun Zhang <zhangshaokun@hisilicon.com>,
	John Garry <john.garry@huawei.com>,
	Guangbin Huang <huangguangbin2@huawei.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Qi Liu <liuqi115@huawei.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Janosch Frank <frankja@linux.ibm.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Benjamin Mugnier <mugnier.benjamin@gmail.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-audit@redhat.com,
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/31] Documentation: kvx: Add basic documentation
Message-ID: <Y9HkNpD7iQG9WErv@debian.me>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
 <20230120141002.2442-2-ysionneau@kalray.eu>
 <Y8z7v53A/UDKFd7j@debian.me>
 <20230125182820.GD5952@tellis.lin.mbt.kalray.eu>
MIME-Version: 1.0
In-Reply-To: <20230125182820.GD5952@tellis.lin.mbt.kalray.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_182358_903994_B4C97151 
X-CRM114-Status: GOOD (  18.53  )
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
Content-Type: multipart/mixed; boundary="===============0375807195136132300=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0375807195136132300==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zOhV12uQumLCQ78f"
Content-Disposition: inline


--zOhV12uQumLCQ78f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2023 at 07:28:20PM +0100, Jules Maselbas wrote:
> Hi Bagas,
>=20
> Thanks for taking your time and effort to improve the documentation.
> We not only need to clean the documention syntax and wording but also
> its content. I am tempted to apply all your proposed changes first and
> then work on improving and correcting the documentation.
>=20
> However I am not very sure on how to integrate your changes and give
> proper contribution attributions. Any insights on this would be greatly
> appreciated.
>=20

Hi Jules,

The reword diff can be squashed into the doc patch (here, [01/31]).

For the attribution, since the reword is significant,

Co-developed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--zOhV12uQumLCQ78f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY9HkLwAKCRD2uYlJVVFO
ownGAQCyX0e5qWZ8KCgW6jQ0b0lEDmtwh+WnXNpCfwV6NxpnGgD+ISGQ0LnDB1sd
Rr3pPueL92j0yk6OhCDekI4gR23BOwo=
=1//R
-----END PGP SIGNATURE-----

--zOhV12uQumLCQ78f--


--===============0375807195136132300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0375807195136132300==--

