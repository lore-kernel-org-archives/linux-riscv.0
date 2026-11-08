Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6F5606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IzuZt9F0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kgulhBo4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GWtx1A73ZvNPNLCg0P2Ycfi1hoJoCM7CcRWlKqorwqQ=; b=IzuZt9F0Rs+p5VzUIFZTL271rO
	Omq/EAIrHWgcdrJpihuCwpMujUpk6NBC8iwSInY1VHvPTZ+zrurd0N4rEKjfYmf/K1kflTQfSpjTf
	7k03mwZZsbDFOfUhnOFdj4r3NXVro4IFecrw5aBzFcMIdIvAid3j4Jt2buZwP1cENUs1nZyRzJdfu
	dlsWYcGy+Q96XZ8IaPd0HNUrj4F7AbILaG9hvGZiC6GCZwccsE+YRty37YtwNyTTA8WBgXzXD9eMP
	HvpMtp5Wvsd3I8sjGZnwhe1uACrTiBmZX6eBFdu7omx/o/mueB6q63JzjCGJOFdsRM7j+5JHkJoSi
	KOxzk6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyPF-0000000FrSd-1oPP;
	Sun, 08 Nov 2026 08:37:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyPC-0000000FrSB-41Bn
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 08:37:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so1474825e9.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 00:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794127056; x=1794731856; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9Ut5Tx0R51AH+pmP3Heuh8Ql+5ThEQrrnH7J3z+HIk=;
        b=kgulhBo45FtdP5GAD3E3XIYnpRGgOFOSaU3C8kVRNRJG1MWs9l2mZ4NnWLwP07yBb5
         E96uEsaLhcVPU7EraiNA+tElOofHXd5cxvRY7k3tjW82LYDR1qj0eYlu3FSHCNhqTY80
         yFMkaD2eQtewPcWRu27/5+6KWNmHcqOi4MmYbobS6gG9R4p18McGOEMqO2KW/eBwFvDJ
         qezDUJQhQC0UAKHyI8XNzAEA0jd6NzfxbUBK/zH2xbxb1v58bk+phEXvcZ31k6iMDW7H
         vBRE/crFMrPyZ+eqjsG5VAP5Awxao4/0L/Z7ZVQRpNuZ1+u2qB3ypzqFyVDsX0uyPw1f
         q9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127056; x=1794731856;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9Ut5Tx0R51AH+pmP3Heuh8Ql+5ThEQrrnH7J3z+HIk=;
        b=ALZ/AQCDogWVTQL6cRncu778vpZR/jmhLT3+M4qeEPVeibVjG/96Pe5iTX966tU1ql
         nozKn20v8xIzA4VyeVJ4E+dahq+N62WQjukQRHNZcIzZYjevKMSVsjg8jGT/KJnzZn1h
         hmScW/YGrOTG0tdCWIwcwuaH/nRBstP/dcN5Dlq0wimbI/gx3IRqk9Ynz4nxhPTbSIRm
         EGb3RPrB1QERfSrHFniBiKOJ8gKxJ1uJZbpaBy2amUj2Nqv/cIiSI2V+WRD33y2N8Mwe
         dYMq1pJW4MqbElNCw7tWXQYi3AU3AasmOOWsWD3ysgn98iJA0yKc0PIB5veRx92uMMVD
         HFLQ==
X-Forwarded-Encrypted: i=1; AL+hErFSnXJMKNXdtY4N5kI95sjeOeaAQd9i+ymsdWbld/jYgek5vQk5qmroAIXPL2gLrAk3WrPY7C9pM65wVQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8W674L39+dPm9etzC8ML7URUj/1sNhniIMtJwEG+bnrSfpk4x/
	K5ryveP4UrpMsyTLBhczS6W9YuaplZiBRqpfafwf5msOzloNBpSTXZyUfbj9U+ICV3E=
X-Gm-Gg: AYBFou2ytyVk/hN47U0QLNzNxC2HkSs3V4pB24aoiHL8SAzG+m8fi7BZJzgMV4UCIzF
	qn26Pbki7uD0UOw/M5R8dXUu3o+nD+gUMAOASk2ORnJgDD42nt/D8DhqzVoviTMpiGGrP0rSFxV
	+OW6HnabdGWzILCmGNhHpENgsApxGaU6ekw6XgpHCLQvRfHZCxI2MRC2H92uDK74tD0+ijRmwm4
	qQSo4t8bqTUFzpYVepljPwnyvJQ8KYxGH8WQpFe+rw/LLEBFsf40d2UmcZH8iQ7g2z91LRMQJgL
	tbG970tZXgAqsQ2XDGbP+0vAW3wDL96P9Yt+R2nlB1YJT06UpDbNxKGoTIP5oCPf9CR57tmzwgt
	zX7gOAuaENs+xVbgROPD18/D09Emc2I7bUbLTqR3zn0Ibiu5e7TeG0daD87qMblOfB/3qs0OzlM
	zJDsPlQWlvKVBM1tm5CN0THT4m57moQz+d99Q8lO8EIqdoyZD1wXwtxut9mHqfOyH3qYp3o6mku
	jEcKG06p1Pn3q/9+4jY4mj3cvIQ1e1HlWadER1uUhiyZGFG8NK3Ig20bnjMfHTIJqQlg0xpb0P0
	Om4LKItPgS7qEB59zw0/k7taSN4xUbNS
X-Received: by 2002:a05:600c:468d:b0:4a1:e00b:a0ea with SMTP id 5b1f17b1804b1-4b94d7634demr18663215e9.1.1794127056384;
        Sun, 08 Nov 2026 00:37:36 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b7e32ad610sm320858215e9.3.2026.11.08.00.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:37:35 -0800 (PST)
Date: Sun, 8 Nov 2026 09:37:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Owen O'Hehir <oo.hehir@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hal Feng <hal.feng@starfivetech.com>, "ziv.xu" <ziv.xu@starfivetech.com>, 
	Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH 2/3] rtc: Add StarFive JH7110 RTC driver
Message-ID: <avA0OjTMLYrQtkzt@monoceros>
References: <20261106175600.3877614-1-oo.hehir@gmail.com>
 <20261106175600.3877614-3-oo.hehir@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261106175600.3877614-3-oo.hehir@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_003739_016483_AE368C2B 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Type: multipart/mixed; boundary="===============1895394612191434785=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============1895394612191434785==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w6dqbkxjdqv4qjrl"
Content-Disposition: inline


--w6dqbkxjdqv4qjrl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] rtc: Add StarFive JH7110 RTC driver
MIME-Version: 1.0

Hello,

On Fri, Nov 06, 2026 at 05:55:59PM +0000, Owen O'Hehir wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>. You can (and IMHO
should) assume that <linux/platform_device.h> does provide struct
of_device_id and just drop <linux/mod_devicetable.h>. If you insist on
IWYU, please use <linux/device-id/of.h> instead to not get a bunch of
unneeded dependencies.

Best regards
Uwe

--w6dqbkxjdqv4qjrl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrwNMoACgkQj4D7WH0S
/k562gf+NM6dtuk+VWVwvfDXf9+p3g0jKrADlgWKDDzFhosSn+83jWZrSSeCdQHN
atEMR3M+GFDakfjamoCsKhlrIcVely5FAoEsrgBRIKs669FxDnv1DsNATMVzwwg3
Eg7y2DbMRNDqwG3W1huzFANgVlJwJnxjNyAzkIwjXJ4ysfKo82m5VmiPfRGvzsWU
UiBFjyKSYAmyZcKKgFfWPIkhzz2TybMy3giCRfuzG25nzmdfTurBybDNOR7u1SJo
P7610P2PM85V5G1mowLZWnrdVsYYv0dj/eReQgJzlnvNrPQbypbe37ci9ygplOE8
GyU8LEPvbAlhS3+i4v73X+olcVCOKA==
=o5i2
-----END PGP SIGNATURE-----

--w6dqbkxjdqv4qjrl--


--===============1895394612191434785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1895394612191434785==--

