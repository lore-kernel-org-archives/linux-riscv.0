Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624DAC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 04:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	References:To:Cc:In-Reply-To:Date:Subject:Mime-Version:Message-Id:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8W0W1PVeSz8JP4wkJgWpumAZCcUzOQkCgqgFAxAnjY=; b=1xJHlf/3L/ebLzsyXOQi4dmhAV
	jRA0D5u7wdHZFkAN+xVNPQGy7Yb9OzIk9ckOq9ayfdOyNkEIpGe2QE1qvmFm+4PR46HJbDT/VY/06
	Sy+/Yw8V+BXJRobU735FIh6/if7XPPRUeWdryeaD9h2T5saTcCpBbkTob5TQteEbkBt7Uq8g9z/YY
	kBJ5QVG01sCF7XwWZ9zXRuzFu4SuR1XK8cMfSUqMMqgoyL6oNrxiri6zkqdYEiV9uC0lb/ztcBoqC
	cx7a1klCUarzjkrwkszMZjqJnwiZ6Nd2I1BYiToe/v7BbZUYYdbzOipTK3bzk8mWkD0O+k5usLDLS
	f3N4qf8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvrHy-00000004Yyj-2kFJ;
	Sun, 14 Apr 2024 04:16:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvrHu-00000004YxZ-12ba
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 04:16:21 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e5715a9ebdso16815015ad.2
        for <linux-riscv@lists.infradead.org>; Sat, 13 Apr 2024 21:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dilger-ca.20230601.gappssmtp.com; s=20230601; t=1713068171; x=1713672971; darn=lists.infradead.org;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xa9DN/TNLIPv3KV/MuIUgpNXPm0/AK0S91wCcTvt0UA=;
        b=VcAU7Q0yNyONVrbG38lNOyDnkweH6lO7ldD5QqUpUqYxeD9ag3kzMwLiW7jDUNUf6j
         uMH+b6w8oQFl7k+rT2pOFTeRoOH8w38/udB0QFwhUsrtUMxj17zXCh8JeiagxGgLbmZI
         KlhSCgu7QbsSP9yKGuTtHc70kYrOBHsSGDo06TDJk8f/2I+S3e8jZJjoG7eqCJpn/cas
         3MeD1grFINPK6fjCfRGfJ3EbaZ7Uk4ocfrI7H0HhIeofER6cxYNSnF69xwHnz/LbfL5T
         8y85neFRRCENv5GfML7JaiF5/wdb0kPhiSw2KBpNlTLnzn9Nqy9acLHoiILSkppJvq+L
         +oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713068171; x=1713672971;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xa9DN/TNLIPv3KV/MuIUgpNXPm0/AK0S91wCcTvt0UA=;
        b=Dkq9pMIuovitCA5rpeim3zb3Eov7wu2Gj9JtcK1MwpUGBL8pb5qoe/uNkgs0U3ArwP
         LYU6yWb8GzupYmNieZ4vMUm4tB6CZPTZ2llExWk/cmGwTnNxSeSHeMyA2P8Df/tmJ/wF
         VWuSAm6DllgXEln0GcFO9u3nCNoLD/3sfgR1LyYWd6Q+WHKz4fZpGlvOsq9wn3CO69Ai
         2yZzMFQNtQIXJlileBVc5tp2BUNzkLRH1iVfx9jvL0wfm+awpVkwfjFPyxR8ogHFqGaH
         3RpjGNVnvEwnAMkdDno5rxJDzfFrz+6rfTYQ3WGXGicrXMY1Y8l/z8hoaI7upLS1tEZM
         pxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuAMbWnYNrxIoc47Fdi1D9sVSMqVzN5DJpH2kKRc3h9epSxzdP3emkn+siTj3ujw5L9Zu1i0D32fcp1yWzRTFhS82M56/k/5433Xmm49ZL
X-Gm-Message-State: AOJu0YwLs5EyNxyVLh40eFRtoO5FGLYY8UexqnyijGCaDRqNByDFXGYB
	bf64v8PNiAkHijbAKVsXi2LT7RctEfLX67PYZaCbbBqY1JiRDOvuAEra8umbXW4=
X-Google-Smtp-Source: AGHT+IESpwxIKqGgQsFN0OkaHzqVmzmYT/UfrqvS9FukHYvTOuK5NnLjSpYm69kyVG8zhzuDe8GI8A==
X-Received: by 2002:a17:902:dac8:b0:1e4:ad9b:f770 with SMTP id q8-20020a170902dac800b001e4ad9bf770mr8118244plx.23.1713068171024;
        Sat, 13 Apr 2024 21:16:11 -0700 (PDT)
Received: from cabot.adilger.int (S01068c763f81ca4b.cg.shawcable.net. [70.77.200.158])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902c64300b001d8edfec673sm5342477pls.214.2024.04.13.21.16.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Apr 2024 21:16:10 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <887E261B-3C76-4CD9-867B-5D087051D004@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Date: Sat, 13 Apr 2024 22:16:07 -0600
In-Reply-To: <20240414021555.GQ2118490@ZenIV>
Cc: Nam Cao <namcao@linutronix.de>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org,
 Theodore Ts'o <tytso@mit.edu>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Conor Dooley <conor@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240413164318.7260c5ef@namcao>
 <22E65CA5-A2C0-44A3-AB01-7514916A18FC@dilger.ca>
 <20240414021555.GQ2118490@ZenIV>
X-Mailer: Apple Mail (2.3273)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_211618_599527_8CBA0B6D 
X-CRM114-Status: GOOD (  15.04  )
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
Content-Type: multipart/mixed; boundary="===============2300476770471955781=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2300476770471955781==
Content-Type: multipart/signed;
 boundary="Apple-Mail=_3417505C-A477-4CF5-8245-C5D2C05FBA72";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_3417505C-A477-4CF5-8245-C5D2C05FBA72
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

On Apr 13, 2024, at 8:15 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>=20
> On Sat, Apr 13, 2024 at 07:46:03PM -0600, Andreas Dilger wrote:
>=20
>> As to whether the 0xfffff000 address itself is valid for riscv32 is
>> outside my realm, but given that RAM is cheap it doesn't seem =
unlikely
>> to have 4GB+ of RAM and want to use it all.  The riscv32 might =
consider
>> reserving this page address from allocation to avoid similar issues =
in
>> other parts of the code, as is done with the NULL/0 page address.
>=20
> Not a chance.  *Any* page mapped there is a serious bug on any 32bit
> box.  Recall what ERR_PTR() is...
>=20
> On any architecture the virtual addresses in range (unsigned =
long)-512..
> (unsigned long)-1 must never resolve to valid kernel objects.
> In other words, any kind of wraparound here is asking for an oops on
> attempts to access the elements of buffer - kernel dereference of
> (char *)0xfffff000 on a 32bit box is already a bug.
>=20
> It might be getting an invalid pointer, but arithmetical overflows
> are irrelevant.

The original bug report stated that search_buf =3D 0xfffff000 on entry,
and I'd quoted that at the start of my email:

On Apr 12, 2024, at 8:57 AM, Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> =
wrote:
> What I see in ext4_search_dir() is that search_buf is 0xfffff000, and =
at
> some point the address wraps to zero, and boom. I doubt that =
0xfffff000
> is a sane address.

Now that you mention ERR_PTR() it definitely makes sense that this last
page HAS to be excluded.

So some other bug is passing the bad pointer to this code before this
error, or the arch is not correctly excluding this page from allocation.

Cheers, Andreas






--Apple-Mail=_3417505C-A477-4CF5-8245-C5D2C05FBA72
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAmYbWIcACgkQcqXauRfM
H+BZJg//dKG4ukz8K7Y4yBljOWxkY67dgXd7uaHxDtenGyHe/wDSByka2SfF7t2e
/JzZzOv8+cz+CzbgSu/Rtn9SetSmMlTTuOSf1CKvBGECQsDS5leR6fYJvuwou/Kq
14MuYBJUuqyBJ66XEKshi8J1Xr+ABf5dD53iKU+jlMaIRQDyk7dEgZRH9nKgOjLd
YwGGonfkTr2RrqGlvXzr+gSmMwF0RZZ3G+n/i4LAJ1hEGDlfJQczuHwV9lCKnw/S
pzRrd6v3KuA3DnRXa024dQxog1S1tyQSzM+xRtJm3YvU94q+BOt7prfjR7wSxE0U
6GzGSDnvRC5ou1c8BK/TJnzP6NMwCE5pQpXOKPpDmpvdfh7DF22dBCxqewWWCBoO
g4qxPp8Rs1pTCpAnsRteQTJL0QFgBck0H+y4pRIrt+INS8M52InzAHmQuuckXjDF
5pXQDQd8G4CRwDQIziB4H/IfaRNywB6LAZyzvtDAeOzMidUVFg6KQgmEVWxxgIa2
70yZXJH2WCLLi+d9a1sO3Kcyuyl7FVxOYKFgdKDLBzDaMYLU3iaADFN25MG3DLxF
83Y/WWYYQfRwAFAAVsqEVl67iCyGOiQUxiFgOQCDj/qz/l3S2RIPIdNSxQOdFem+
5r+gP1MuGAfM4dsnOhBF844Oh8e9Ot5Bd/ngImDLMcrohjsXB2s=
=rxuh
-----END PGP SIGNATURE-----

--Apple-Mail=_3417505C-A477-4CF5-8245-C5D2C05FBA72--


--===============2300476770471955781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2300476770471955781==--

