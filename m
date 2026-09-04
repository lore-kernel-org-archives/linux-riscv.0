Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90123C79F80
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 08:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9M0/u+gWORlU/7v4MA6HSmSO6t4BaPjD04KKuJ+XETI=; b=WRTgoWPBgMpjxC916WBAzZ5htm
	NBgHGfk1kHTd1uNtcoPVAFB0kMKAy/19hSF50dR0wrFmN2nr3IofrXg6oAcLNsZbG4IFQMYEXCb1V
	4lgZ8JlQoFVqYdj8tOEqVR1JcX9lM+Y0OUrVkeD/8azAYGY+gSeAMPElRBqT3CLn3lt8XXQXm7DSy
	Sr1h8b4+DW5kxLCuRAziUBhTwBuzYA+Mrjx72ncj0s4sAAUpwDmrSl3ZyWRy1Dl2t1uB2XUiom2E6
	VVhxvB33KpSNChDjIOcb6FS4N8JZpwrXO6yz3rD+jSsJJ8k5oI3oWdVi+//8WIP2rqlavsvvwLK1c
	N5JdDM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PHP-00000001N31-2xzy;
	Fri, 04 Sep 2026 08:28:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PHL-00000001N1L-35fx
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 08:28:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso5960685e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2026 01:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788510486; x=1789115286; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vAduMceZ5WykF9AxLntA2mjBC+eC1Z+b3m9MMdygFJA=;
        b=O+mdIjFHtC0rIjiyWDgWYW1DuuN3ItvNqRQorv4J5BL13dOvv8OKGeecunnE4OF2j3
         Xzt9x6xENgdxkwluhaEj6lLAT57gB4PYHLWvEDXKZWIhmWcaWhmkYqmr8MEZY0j+Vtab
         Wuo47ja6IecbWnII5hbyfhBlmN/2TF9emJEjQt/O6EVIt2jPKM3iVA0CTbL3Odd5DHTt
         WQulBzD6tINUP480m1F3NCTl41lOubvWOzNso4e2Zsxwkyven0mFn+iyqPZtABykxtLe
         /HTl/y7WvUP0rHgUeFx19l+vsM923kIPNYEpn3PRRAKVlnzofj+PjP36LsykVxauVMHu
         v9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510486; x=1789115286;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vAduMceZ5WykF9AxLntA2mjBC+eC1Z+b3m9MMdygFJA=;
        b=Igpnp5W+ZztoA1ogs7MQil8KS+lAJ8wEppnZhFwk/kVGB+PKierSRk13GgjMBY1/ot
         swrXvSTwZEZMMKys1PFVuv9APMysrn47l2rsWqFsZeg64W/4frG2F7knRg5z6Q+sMNTz
         DRUSEhtzA1pdgxD1Raevi0PbkpK3kdDBmGJn6NJvhwlqMCLtWF6EEO+Q6bSpVhjPrTY7
         YMAbcCQDcoXm62qeTMgEt3WKB9LFzZ/vIw9CsmZLJsOXtTk1PxHDDj5ryDxK4UbqvJ0h
         KzHNzsGIwsWIok5XfQln/b47713ZaqCIBg+6fjc8VDKyyOweh3BXEKOGMv3G2kNgCWCd
         z/Iw==
X-Forwarded-Encrypted: i=1; AKwUvBx8hdDrMvZSC5lQeqpFCTiof3fqyUHaNZz2UO+cVAAbYjKDR1OQcNhzHAzgVldZA/leBre3rd9rgfqHkg==@lists.infradead.org
X-Gm-Message-State: AFuF++kGhrmTBgLT8OASZyOXUS2/JxJbZrj6epXTmn2rOaOrdtBtEJmK
	D9WIiUGRRv/akRwiLVBa6DhmIA8wZ8iKuW5waXnZyKbn0l+QReyPmqMSnABApUiCrR8=
X-Gm-Gg: AYBFou0q74CRuLZhOIfJMIBE+JFDn4rcVeWEWw0mLB4yIG1dLl8FNlkuxjyAjyfgVuK
	V2v2UFbfXGCii5/67yl2npSRIYr8EzXXwxv2KTTgXbpgK9w3L+Zj5uYJzAlFjZ7Y47cd8nTKSkN
	XAph6hlP8qNHCprz7UmdZ2+M7+VBAcWqIVNic5NuNbsUOYCclNRiy6PRu+ZCbIZXE+cuEkRZfin
	hpGhLd8L3kEvP084Wm1Y+uLHWSdE4u/hJpcl8l4w0njhidXjMCZn3TquvYmJCFpMheTWjb16mVP
	LgmTZVMkHuuvzSKjgpsUtF+bwGusokEbw9GapW8GfKWz0UXip1NmQZFlTugPVA/QS7i3ntXJ+MA
	3kkmRB57KnHY+VV5EL/2elDxPQwmbubdMZ/tLitI7cRF6f0l1Opu8urZNQtR9JjiupPBR18iPic
	gQbjl727PxkggfTIe+5CndtEAbvC9CPF1RhRClWIXflQV/lRAUvgifhMDe
X-Received: by 2002:a05:600c:3511:b0:49c:fa20:cc01 with SMTP id 5b1f17b1804b1-49cfa20ccddmr25588125e9.24.1788510485753;
        Fri, 04 Sep 2026 01:28:05 -0700 (PDT)
Received: from localhost ([2001:4090:a244:80d4:489b:7642:1b32:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf5135353sm68845625e9.2.2026.09.04.01.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:28:04 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 04 Sep 2026 10:27:58 +0200
Message-Id: <DL6E1V8AMI2X.EQQ009BX5AZ6@baylibre.com>
Cc: <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH net-next 05/33] can: m_can: Remove comma after
 sentinel-entry in match-table
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Siddharth Vadapalli" <s-vadapalli@ti.com>,
 <dario.binacchi@amarulasolutions.com>, <mkl@pengutronix.de>,
 <mailhol@kernel.org>, <msp@baylibre.com>, <florian.fainelli@broadcom.com>,
 <jonas.gorski@gmail.com>, <andrew@lunn.ch>, <olteanv@gmail.com>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <kurt@linutronix.de>, <hauke@hauke-m.de>,
 <chester.a.unal@arinc9.com>, <daniel@makrotopia.org>,
 <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
 <ansuelsmth@gmail.com>, <linusw@kernel.org>, <luizluca@gmail.com>,
 <alvin.sipraga@analog.com>, <clement.leger@bootlin.com>,
 <justin.chen@broadcom.com>, <dlan@kernel.org>, <rogerq@kernel.org>,
 <hkallweit1@gmail.com>, <linux@armlinux.org.uk>, <rjui@broadcom.com>,
 <sbranden@broadcom.com>, <bcm-kernel-feedback-list@broadcom.com>,
 <opendmb@gmail.com>, <andrei.botila@oss.nxp.com>,
 <wangruikang@iscas.ac.cn>, <amadeus@jmu.edu.cn>, <kees@kernel.org>,
 <tmshlvck@gmail.com>, <c-vankar@ti.com>, <horms@kernel.org>,
 <vadim.fedorenko@linux.dev>, <daniel.zahka@gmail.com>,
 <nora.schiffer@ew.tq-group.com>, <v-singh1@ti.com>, <oss@vassilevski.com>,
 <haokexin@gmail.com>, <alex@sverdlin.org>, <aleksandr.loktionov@intel.com>,
 <lgs201920130244@gmail.com>, "Kendall Willis" <k-willis@ti.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260904043724.2955444-1-s-vadapalli@ti.com>
 <20260904043724.2955444-6-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-6-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_012807_787208_4303885C 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============5896089113501454909=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5896089113501454909==
Content-Type: multipart/signed;
 boundary=aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 4, 2026 at 6:36 AM CEST, Siddharth Vadapalli wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Acked-by: Markus Schneider-Pargmann <msp@baylibre.com>

+Kendall

Note that this and another series by Kendall will probably have a
conflict as both change the compatibles:
https://lore.kernel.org/all/20260902-temp-v4-0-3896f7d16ce8@ti.com/

Best
Markus

--aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCapqBDhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNU
DgD+NDmEsw57cLpzBEOHVv/Nk1EkJHkfkEl6somoL6FeZhQA/igsPy7rmcarz6Ym
lEV7ixhaA3JU6LQo0KOc3yMdNwIE
=DaCZ
-----END PGP SIGNATURE-----

--aceffad199f989fc0e7a2bade7854fe91c95aab0591a0938aa91a92fdd3c--


--===============5896089113501454909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5896089113501454909==--

