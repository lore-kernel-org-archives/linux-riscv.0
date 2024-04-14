Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6F8C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 01:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:Cc:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhRwASL6E0VnhYRqrZmngiQ/8rsvLpLxO+UKVGoCW+s=; b=0tyRzZLIiiQzcBc99gkszItfxm
	KQAh+/H8BNFuHeoqmkS8CUlBNZZ3HpjzhT4YN+Mc0IhFgwPN15p0XL0trou0YWULUt12IRn88fZxN
	G8A27B6l+pbS5RPBeDdVzjp2JReXIFb1Zqi42nF6mkPFidCAggLVr4okTZ6opWCOmk+lw7omyrb+E
	dQiMBJFBd/No3v1XeEqHM1J94zvfV0L3N1f6Ib8e9Te4OuO3L1deASr5rWy2cgvgKkFJ4E70yCY5u
	rUtFz31aJHo5vt4Opg/lznqOI+OCJ5YRxuY1/tYSiupU/EzDc0hhDaAyayjgkGMD4FggChK0Fei7Q
	vFGWcwnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvowf-00000004M90-0Ilt;
	Sun, 14 Apr 2024 01:46:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvowa-00000004M8V-1iM5
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 01:46:11 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e5715a9ebdso16631535ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 13 Apr 2024 18:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20230601.gappssmtp.com; s=20230601; t=1713059166; x=1713663966; darn=lists.infradead.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jK3qiz2r/OxwhMERN3JhjvI7Srg7jJofsmQrWbh37ew=;
        b=IAhVmXDnatnYR4BqNV40rAAr9u4WQYevtC2pjsdQQXTY/pUBukJs9DeTp5hkhVCUU5
         MOPTn9Yp0Adv1vsriYvEJ9Q7yB7ZLOcJnUTa5//zcg4OEGQK+Z0uMD1LpBNehS+qaDQN
         arxULbp7UleC3b8ntlUNqBGVCJ/+5yenE9ok2RHTwOlKUvW4THSUPuaAgWR83SyLz7nF
         0bPXLCAEYix5h7daHj9Lfq0jhM3V2EHY4aVA0KyzlV8ub4NAfgTyHwZZWZ5V0bmGCRae
         s7GbYdmtxXsQ6N425SpJ6m+hEwg8/R2iTvx7Y0AngAhu0AQlAVDEJGchcS+je/5ZE1gw
         fvdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713059166; x=1713663966;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jK3qiz2r/OxwhMERN3JhjvI7Srg7jJofsmQrWbh37ew=;
        b=YOJ1WQyWgzlcNneFmNpNff09fYWYl/GIy65twsPWZkzLzfpIEnCQEEplUBD85MUARt
         OY7duZ8pTJdTwr3GRzIl4vzY2LXNGYn00C+MxDomDd+wMcTuCcIiRzbJuHvTGYQ611TO
         yGAhBJvcRIqnAAhRWbOWo6KEojm9YZlT81hoMDF1UlCH1KO/7kS7NrKm4O+tNSxURJsJ
         JmqVaHFFnSY+SAVm3PsuFXkKzSzFNUlZQx/PKKM7O/5fHGqxJEYTx6JO3ft5UzXhR7eq
         B/tTs9YwTMQn4oU1qCp141RMVFvHgEOkumnZ87QYfdJYCTiXaYM2C3HZqu3adNKkB7eP
         B1sg==
X-Forwarded-Encrypted: i=1; AJvYcCXndN1ihVIXN/KLnfhsWHWz6IicY3QSJZwgzCTFDikOcF5tvImCQeKYbD+7Oi11GWxv+SXI6T1Si3GerQNRkKIUOFdotO19WBSVxfNYkN3/
X-Gm-Message-State: AOJu0YyGk8BX4q4AWskDwZzdiE/RH4nRmngSoRzUpTAgMLpSeHHSkdgH
	UHX3AIKdj9aErIxR+nw5TX3R4VZcoxvzB+7BzHONP3xMB4vxNALSELcg8Ei9pLQ=
X-Google-Smtp-Source: AGHT+IHdW/LfRd0o4v+xgM9KCMXsKzpKd3isC0kgIw4+5k0gu/O6pWkbnzReWjH33pfl4aYHZExlRw==
X-Received: by 2002:a17:903:2c7:b0:1e3:e295:3f47 with SMTP id s7-20020a17090302c700b001e3e2953f47mr7106397plk.69.1713059166307;
        Sat, 13 Apr 2024 18:46:06 -0700 (PDT)
Received: from cabot.adilger.int (S01068c763f81ca4b.cg.shawcable.net. [70.77.200.158])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903244500b001e5d0e3b049sm2624548pls.225.2024.04.13.18.46.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Apr 2024 18:46:05 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <22E65CA5-A2C0-44A3-AB01-7514916A18FC@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Date: Sat, 13 Apr 2024 19:46:03 -0600
In-Reply-To: <20240413164318.7260c5ef@namcao>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org,
 Theodore Ts'o <tytso@mit.edu>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Conor Dooley <conor@kernel.org>
To: Nam Cao <namcao@linutronix.de>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240413164318.7260c5ef@namcao>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_184608_586420_E6078B2A 
X-CRM114-Status: GOOD (  27.16  )
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
Content-Type: multipart/mixed; boundary="===============1088687051291294843=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1088687051291294843==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_7C671C3E-4468-48AE-8BCA-0F78F2D6442B";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_7C671C3E-4468-48AE-8BCA-0F78F2D6442B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

On Apr 13, 2024, at 8:43 AM, Nam Cao <namcao@linutronix.de> wrote:
>=20
> On 2024-04-12 Bj=C3=B6rn T=C3=B6pel wrote:
>>=20
>> What I see in ext4_search_dir() is that search_buf is 0xfffff000, and =
at
>> some point the address wraps to zero, and boom. I doubt that =
0xfffff000
>> is a sane address.
>=20
> I have zero knowledge about file system, but I think it's an integer
> overflow problem. The calculation of "dlimit" overflow and dlimit =
wraps
> around, this leads to wrong comparison later on.
>=20
> I guess that explains why your bisect and Conor's bisect results are
> strange: the bug has been here for quite some time, but it only =
appears
> when "dlimit" happens to overflow.
>=20
> It can be fixed by re-arrange the comparisons a bit. Can you give the
> below patch a try?
>=20
> Best regards,
> Nam
>=20
> diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> index 05b647e6bc19..71b88b33b676 100644
> --- a/fs/ext4/namei.c
> +++ b/fs/ext4/namei.c
> @@ -1532,15 +1532,13 @@ int ext4_search_dir(struct buffer_head *bh, =
char *search_buf, int buf_size,
> 		    unsigned int offset, struct ext4_dir_entry_2 =
**res_dir)
> {
> 	struct ext4_dir_entry_2 * de;
> -	char * dlimit;
> 	int de_len;
>=20
> 	de =3D (struct ext4_dir_entry_2 *)search_buf;
> -	dlimit =3D search_buf + buf_size;
> -	while ((char *) de < dlimit - EXT4_BASE_DIR_LEN) {
> +	while ((char *) de - search_buf < buf_size - EXT4_BASE_DIR_LEN) =
{
> 		/* this code is executed quadratically often */
> 		/* do minimal checking `by hand' */
> -		if (de->name + de->name_len <=3D dlimit &&
> +		if (de->name + de->name_len - search_buf <=3D buf_size =
&&
> 		    ext4_match(dir, fname, de)) {
> 			/* found a match - just to be sure, do
> 			 * a full check */

This looks like a straight-forward mathematical substitution of "dlimit"
with "search_buf + buf_size" and rearranging of the terms to make the
while loop offset "zero based" rather than "address based" and would
avoid overflow if "search_buf" was within one 4kB block of overflow:

   dlimit =3D search_buf + buf_size =3D 0xfffff000 + 0x1000 =3D =
0x00000000

If (char *)de is signed then this loop would run for a long time.

It doesn't look like it would have any issues with *underflow* (since
"de =3D=3D search_buf" at the start and is only incremented, and there =
is
no valid filesystem where "buf_size < EXT4_BASE_DIR_LEN".

As such, I think this change would likely address the issue.

As to whether the 0xfffff000 address itself is valid for riscv32 is
outside my realm, but given that RAM is cheap it doesn't seem unlikely
to have 4GB+ of RAM and want to use it all.  The riscv32 might consider
reserving this page address from allocation to avoid similar issues in
other parts of the code, as is done with the NULL/0 page address.

If you submit this as a proper patch you could add my:

Reviewed-by: Andreas Dilger <adilger@dilger.ca>

Cheers, Andreas






--Apple-Mail=_7C671C3E-4468-48AE-8BCA-0F78F2D6442B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAmYbNVsACgkQcqXauRfM
H+AK5Q//QbC+ePTcnzq7IXWpTH8Xglce/mu5s1AdjdqqeMB2rmYxAKkK5a4ngScC
AH4bFT8nPG34bNT95oZu0R0BOrsVj+K40JulHjHaOePH+qlRAlq4RvHFFRJ4BY4I
P+Ec5I587w72rrWaPTyBfyq/O5ylBH4V8sXJBXJvuCDbgOJRBxQG35f8plmWOPxn
vOX86TRauoBf30k2vg2f/U/zz0FhzAdrFB8R+/KVHcfj6Ch5HzDbXGF8vQhl4t1P
xlgJYOJrVPdeTPgB3b41Y3rFwFNI/ZLSPBkIBCPi7ytY57XxyB/ddQHg7q45AkRm
zxuug2hE16TvA7aNcaMqlEElmrIrU6wnuQ8WGOPxEPZwfklDJbmPTHkBI2dN6KBi
xxMaxPNB6xVWEsDtwXSTgTROfxLLElNWyXLKMRKMNwwdB+FrsOMRmBhOeKz0Kkef
ScAswy7giDHK3hs0cFuXdCxAHB7f9OoxrC5SITPwbvMqkmOMvhwhF6BjdlF8qpt9
XPciHAtUa5H1hf5KZ1EuwS/wdyoyjPf97VprjZSfGhupS4DO+uVdR5cMl0LMm45U
Ba1lpxXOLUDHAG7NI/i6R9WmLInKPkENBXj69PeRTi8HsT6fidACJ6iVPqoy4te4
KKTy+EV0NI87Z6Exu5nqamdHpsoP+NAeZWAtH57AcSIDm0AWPcE=
=gGOA
-----END PGP SIGNATURE-----

--Apple-Mail=_7C671C3E-4468-48AE-8BCA-0F78F2D6442B--


--===============1088687051291294843==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1088687051291294843==--

