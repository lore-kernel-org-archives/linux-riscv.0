Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053AD606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 04:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ju5jvwxh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dA6D7adK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=lBSyprRum2Na2dsBvb7ZwVa7fgtHPpzAijFKyHufP8g=; b=Ju5jvwxh/kQ0v20A1RLL8IGmTh
	cTjmW3sxGWAIRY4K62ot11S4/ZqsjnVp4qnmJx7WmpzUwK9srQovw2fV0c1L+KAoYAvJw5PYSywoZ
	AcFvLl3qQ/YlJoT+3loFVa3leNcPexVbhFEwNYFGM9t6ptA0N9cbFqpDy3ydt3yC5dFHzq2vODsgb
	8Bnbdiq5Mle9hDNueeZuqAwbhLQxQZRkaKtPz2+aASaxzbZkh2OD7XbFtshS/2+O3FABOz7OHV3p4
	tqaEi4yzhpJ9lDgpiJnBvmoStgIT/FtEOfhC3cS6G1bPJMpU88kAbUP2a0Y4/LyiryqxcLXKsdN7I
	JLH89DOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVi1m-00000005WRx-3TaQ;
	Tue, 24 Nov 2026 04:21:10 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVi1j-00000005WQs-3cjW
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 04:21:09 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso4653423a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 20:20:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795494047; cv=none;
        d=google.com; s=arc-20260327;
        b=RzXwXIoXrpMYraDur+zKLxfM1U4NK8+GcCHCGb5gwMAEuNB/rFzcGr1wtbFEGEwYyP
         ZLJjODRg513WgQGbuzkZvoy2jjS6q4bJ2K/HXB0keo3o+Y+LehJxWMVYiMa4Guxbmaj8
         /qrV7wBBENJVQ1Ma0gPc70pdh2qlljnJkiNjYngZpblnt5dTq8ZaGCZnvLy8m18DTM9i
         YroY8pyNm7+WQTKm8isJusaRd0+dp7FWFPmhg2jqnGBc16a875pIaTIzpD+7baAf6VoJ
         9bVl1LXmadaEJBQwmWJ77GaSjLSkkzhVWiJ7TYaSZTl9vCXqZWp8oEomWzIkdswL48Mr
         Ipww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
        fh=OgZeP6iYZWAkB0LHrW0Oh93OlwmB1XStVYasEZYg28g=;
        b=e0f03qo5b5SycVn7FSdZi51p+kVj+wbu3sSnmZ8XuTQ9oLJ6zvBPWRXBJg8hx9L13E
         HNV9G6/BFWiiWLJVNHOKM6YqJif8yeqhx9SklfwVe01CgQDGxuAFOewMHSaMvQKJwgN4
         0VZetkNsnP8/ao36rd9zHfvF2fRNNhIjuNpXPMODSAFR6bnwrB4t+M6Rv15Gpw1JFJZ3
         UvS0UpTxLvvHExzAJwrrbT27IUPiObxe6zFnQa9bz7Splo0/NcTzGGkeA6ng2O7CUQxl
         6sprfe/hZzZqbLPq6iGJE2RysQbsXwimAKBCipy/aqhCPL23P9bPUoqQBha7EVdnMh5l
         7vFw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795494047; x=1796098847; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
        b=dA6D7adKkajPIStCwftd5i+dx4H5fpsXv1LYLqbxrsgQPJ9BTNyCAPaASWKY3/yi5Y
         uO3AU0nNR3lE+RvJ96c/MNMIROxEnC6ZTPAQYkfFmmcLJ44dCELDzUi/yj86KOghWlB5
         ud9SsHD9UHDJ/kZdwMbcGh45fSyCbNIExhe78e6HnQNlxqh/ZV5cU0Se+4ESLIjK9eY6
         SQ/Ljk65tDGyQeWSCm4y2ExOoznnNDLKAkJmvcA0QHIQHLQJBFXz//kdskZIThf4w8GC
         MHU56yc/dlS3tN5wcAtCnlOgLgPK/p9AXBlyh6RJhEBQs0FMaUBckKBWektxE0TKJHBw
         LQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795494047; x=1796098847;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iwz99gTCxCIUCcRsgbRPplQdxHuMdIk+bgQDXj94h8k=;
        b=aXZGM/fDhJokxkmfZ83X82E/7U4B9zo+B3Z8kwY0uSSL4Z63/CK6cwP23PBr9ce0Qm
         JEu2WxJ/klIDjC8lvmmf9WT1GEhGJgbtRZd8NwytmBe/8CUaY/FbJx1gms7dwUBTJdnU
         BsJn9d9qA6NNd2e5Z6VPdNa7u+42063L3LkDMXXRK8V/0BiLgSXmLFC1XuogWtE6AJEM
         RyJxtcN9gpJvDxirwfPbrrPY2MlskC82uF1F5p0iXUkDNKAk0UQpt3HybMD5m20FXcKu
         ODGN5DW9MrieBjIlze17d+/Y3hpuxjTFchs9fE1MiZgxjXBogPtzG+uZSo4FHCXPXmsZ
         BzhA==
X-Forwarded-Encrypted: i=1; AL+hErGHTndxdHU0Kn8Ks61d0e6tTqwiRNQ6qEp9BgHqMmIRmqVBhqj5u6LsYNjMz8YaUgPIVF5TPk0mqF3VdQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/iB1RiOK4yM+I4LCSMjpUeBYzCc1IcLR3YQcG8cS+Q09omr1ZA
	RaU7L9//KDpTt8/yRnkKu9pTnKkwxrFUV5+qre1PVcMiqb4ulOr4RB9v2IpoyLnhpL4H4aMPkT+
	j9/0e2Zn0HYC8XS6YOSKDF9gBsx8WTw8=
X-Gm-Gg: AZFdTZeg7PwxSQqNCT2zmleto1RgtCQvKIp1/Ex+V9DSMM8f2oxMigNUhVtZW1Z8rcm
	iepULuutIEUmpQx/ubkhid6xC5xSkkwQn7ZwGadb5qhUKEaaZ8WuzvJRLhmAlEV9TlSGZFJQjCq
	ygGBIJmIv0UOtetN203d+d72SQLW7FWvUim2PkJmwPDIdYV926iYDN2YK6nSzUpy7uybOBc6zGR
	jaKa5B/Us1oVRlfZ+wPgpnh25yqrgDa7vOHePddeoXcsMIlPiirzV5HJG7l1p2h1GTsLdDJ4xxE
	iNWPMd/FK3cvuoVf6OUHn1BlhDNfGh5MV0wTMT0okZVQjtU/cio2/Vb5e6HYwkbcQ7bH9cWSeDp
	XoalGjYf4bVBm1T0dQPYOhIG+vSASv06f1lI=
X-Received: by 2002:a05:6402:234a:b0:6ba:7762:3dc6 with SMTP id
 4fb4d7f45d1cf-6ba7762424cmr5526320a12.31.1795494047241; Mon, 23 Nov 2026
 20:20:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118104935.1716-1-linux.amoon@gmail.com> <20261118104935.1716-3-linux.amoon@gmail.com>
 <awS84s2FVdzy3j4Y@aurel32.net>
In-Reply-To: <awS84s2FVdzy3j4Y@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 24 Nov 2026 09:50:34 +0530
X-Gm-Features: Aa3M54o2V3tALqDtTk5FmFGSg-XejOz73sQbTVaEuMBBmEBfiB2hu2jposXV5Ww
Message-ID: <CANAwSgQXRojN2x4NypLajJ8tUf2cyNfdfFLnaOFPd1hXuOMkJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] power: reset: Remove SpacemiT P1 reboot driver
To: Anand Moon <linux.amoon@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_202108_173078_B77601DD 
X-CRM114-Status: GOOD (  26.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Aurelien,

Thanks for your review comments.

On Tue, 24 Nov 2026 at 03:53, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Anand,
>
> On 2026-11-18 16:19, Anand Moon wrote:
> > The SpacemiT P1 reboot driver uses I2C-backed regmap operations to
> > request system shutdown and restart through the PMIC.
> >
> > The system-off handlers run in atomic context, where regmap operations
> > may sleep. This can trigger invalid wait context and
> > scheduling-while-atomic warnings during shutdown or restart.
> >
> > On SpacemiT K1 platforms, system poweroff and restart are handled by
> > OpenSBI through the SBI System Reset (SRST) extension. The Linux PMIC
> > reboot driver duplicates this firmware functionality and is no longer
> > needed.
> >
> > Remove the driver along with its Kconfig and Makefile entries.
> > The P1 MFD driver and its other functionality remain unaffected.
> >
> > Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > New patch
> > ---
> >  drivers/power/reset/Kconfig              |  9 ---
> >  drivers/power/reset/Makefile             |  1 -
> >  drivers/power/reset/spacemit-p1-reboot.c | 87 ------------------------
> >  3 files changed, 97 deletions(-)
> >  delete mode 100644 drivers/power/reset/spacemit-p1-reboot.c
>
> The patch is correct, but you might also want to remove the
> spacemit-p1-reboot entry from drivers/mfd/simple-mfd-i2c.c.
>
> Anyway, while I support removing this driver on the long term, it might
> be a bit early to remove it. Indeed, while the driver is available in
> OpenSBI 1.9, using this version requires either patch the vendor U-Boot
> or using the upstream U-Boot which still has some limitations (thanks
> for your efforts improving it).
>
> At the end with your patch 2, keeping this driver a bit longer doesn't
> hurt, as it is only used as a fallback if the SBI SRST extension is not
> available.
>
Ok I have no issue keeping this as a fallback driver.
> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
