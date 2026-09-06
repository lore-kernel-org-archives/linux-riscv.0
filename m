Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD32DC79F99
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:Cc:To:From:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpnsI4TI9nDwCFi7veBe3LHyTS8lex1H7x1ePk9/u0k=; b=ALn675mI5V/QvKPruiwQtBJYJ2
	0YstO6EMnxunzI0IQx9Strf1xYHBSRTv81YaChCIi/cWcWx18thMurabmi44tmP0tX1GrnXblrLa7
	ksS5Z486D+79lA7aUPoF8LV2J/f9Jm70qPmr7evy3DDqhf/fBq/D9Wqw4sTsbZfXwhssd9rjTYQ1a
	xQhj2hB7Aaw044PiQLi6Jfzu2ey0HjfJtbm8YQyNAD2LSgInAHGUTINKssIykRkTmLcHBGzyhVBaS
	59bE1YQ9AtSfpAhwcsnjL+hN38c4B3F/dp/FMQpytuF5ITiLpZPP7YX0ycfLCrFU7TuQxcGz7Ii1K
	4iBbtErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Avr-00000004z55-219t;
	Sun, 06 Sep 2026 11:21:07 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Avn-00000004z4Z-2MPe
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 11:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788693647;
	bh=hU5drRsukxKTZr6Wttsq4VqOiCpjnWKHL3L2R4CN/6o=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=jGTIPV8WnA7IDUuELWPdtVK2O0eDDJojlQ13jKbgAuAI1eru93zjxltQE1QYq+btf
	 ABVL9nZ1NJr8FSGRCTp9iA+/BxwUqFhMr4QSAeneZp/Aiw5IPLK/RwdqS1xmWcRWsZ
	 +FXnEuxFtgiqmDIvkZBo1eCuqx04FktT+7dwzeas=
X-QQ-mid: zesmtpsz9t1788693645td04f833d
X-QQ-Originating-IP: DTpauE77uDk1X7buhFaDFSwHJ4/UV6jAd8hGgoHJ2L4=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 06 Sep 2026 19:20:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6232298470301250172
EX-QQ-RecipientCnt: 19
Mime-Version: 1.0
Date: Sun, 06 Sep 2026 19:20:40 +0800
Message-Id: <DL86Z6P8P2YI.160YXDVBSSC6I@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Aurelien Jarno" <aurelien@aurel32.net>, "Michael Turquette"
 <mturquette@baylibre.com>, "Inochi Amaoto" <inochiama@outlook.com>, "Alex
 Elder" <elder@riscstar.com>, "Haylen Chu" <heylenay@4d2.org>,
 <stable@vger.kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] clk: spacemit: k3: add CPU PLL rate tables
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com> <apmuG46sBg2rGzCD@aurel32.net> <DL67LEVCXFA5.39M5FO7JGKWZS@linux.spacemit.com> <20260905220746-GKC53903@kernel.org>
In-Reply-To: <20260905220746-GKC53903@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NGf6Juddf2av1Bk8NfLKPcxvsFIALwEmDxNU0SXF7DhV2BjuVFczEfwY
	htGBs9UrUW2g01HBaf3PYHQEPBbEAFKJMkgPqfklaw14hJa146zEVYgNoVAu5pi1+y/vm0+
	sknWUEKuL7RRn9vBURBozE/F8Ix80dIx73+UskZL6KdM9L/TlmXtpGNGVAr++cRKTi6DZxd
	KYsfletsNI0co3Tr1Gsm7CDG6vZQlDr5Mib3V2io14GwwOHywbrg4Yv3Ajq2NxnQApc7cin
	7frk8Zvem3GJ+tZ8vXTcw1W/AESr7tkxMys4mAhWl3NhsXjLMigz+ewR5wBPFqpuxRFT3bg
	Wy1H08tbESosANSaIpplzCEsHQJiL9zugfvwimN1JuHPLg/VPiB8A5E1KmyRGwv4oL5gydy
	+YyAqTBzB5fu4CaOAOGtcx5IQ983rxUHkUU+T7Cs4HYhpVCbFlDHNxmZB6kCuUfJNO/fp+i
	NV6hnRxQ+nZqrOUOcc8ANvoKjFXCKnvaTKdP1CNc2WjfxttRC20WBjnVYBaSf/DGp3Zfw+F
	M13LTFGeymqG+/Z/OfW3jP1V5VntKUK/uIY0xLZGvJ3gD8Enagj1RHVDUHBjsipfJVmKNee
	ABv3lC/vlgW25+PDX2iZYbUqPw/2z2DsL8MGgWmgDyUBYCI0fN0e/JGxLAXQGKdwDD1/PYk
	J2a6/WBgbjjIyIUBKmo0XUsR7E5mgnNebKiLjIDFlTSMzmTlcsr62UCZXzub3Cr76xb0vfb
	aDDrZjhWd0bmjeouQscdj6img/k9w0+N9/hS8aNNNlSbo8GABhIjM3vQrblXolEnON+VXtJ
	g4kdifuEVS9pYHuuwgHD0+q6BMU93Lj7uo4p16delEx4w0IHw5yWp1wVqayi26t1aP5sHXJ
	BZa09ftphjJtRC882MTF3WVYlakJW6ONMaZNeqB5f8eiDfh2dis9w9cXfc/P7guY41IgmHO
	B1uel3MGhme/iyz3Pjpbw4miiNktGwmFv8Lk3nfClmxI0QA8PsWrRmaUkXYZf9HJjwPRie9
	L4ljc/liPlIbUPxxH93QDtULvq9p+2r1ctQI7/XIEFs/2BBOmeoXiQ9kEyWVKhpkBaUpIU9
	Bt+hahoSmjCcEEMTEg+37UFzSRBjrz9mw8KSophvK7m2Moop6xGYrOmRoKYCEDvKg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_042104_487358_EC1D467F 
X-CRM114-Status: GOOD (  25.92  )
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
Content-Type: multipart/mixed; boundary="===============3849645907996415763=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3849645907996415763==
Content-Type: multipart/signed;
 boundary=536c7c79d9464b992ad1d7b5be05ae3641e4b875bba8fe2b43dc9e787550;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--536c7c79d9464b992ad1d7b5be05ae3641e4b875bba8fe2b43dc9e787550
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Yixun, Aurelien

On Sun Sep 6, 2026 at 6:07 AM +08, Yixun Lan wrote:
> Hi Aurelien, Troy,
>
> On 11:24 Fri 04 Sep     , Troy Mitchell wrote:
>> Hi Aurelien,
>>=20
>> On Fri Sep 4, 2026 at 1:27 AM +08, Aurelien Jarno wrote:
>> > Hi Troy,
>> >
> ..
>> >>  drivers/clk/spacemit/ccu-k3.c | 96 +++++++++++++++++++++++++++++++++=
++++++++++
>> >>  1 file changed, 96 insertions(+)
>> >
>> > Thanks for the patch, it makes sense to add all the values, to support=
=20
>> > future firmware changes. The values match the ones in the vendor kerne=
l.
>> I forgot that you had a similar patch as well..
>>=20
>> >
>> >> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu=
-k3.c
>> >> index 92b930d5ff30..950bf531c734 100644
>> >> --- a/drivers/clk/spacemit/ccu-k3.c
>> >> +++ b/drivers/clk/spacemit/ccu-k3.c
>> >> @@ -29,15 +29,91 @@ static const struct ccu_pll_rate_tbl pll2_rate_tb=
l[] =3D {
>> >>  	CCU_PLLA_RATE(3000000000UL, 0x0b3e2000, 0x00000000, 0xa0558c8c),
>> >>  };
>> >> =20
>> >> +/* Keep the firmware default as the first entry. */
>> >>  static const struct ccu_pll_rate_tbl pll3_rate_tbl[] =3D {
>> >> +	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
>> >
>> > Is it really necessary to put this entry first? I guess it's the curre=
nt=20
>> > default frequency, but we have seen it can evolve. From my tests, the=
=20
>> > driver seems to just keep the value configured by the firmware=20
>> > independently from the table order, so I am not sure it's necessary.
>
> I agree with Aurelien here, the default frequency isn't a solid stable se=
ttings,
> which it may changes in the future
>
>> I think keeping it first is necessary. If the current register settings =
do
>> not match any entry in the table, ccu_plla_init() falls back to the firs=
t
>
> Isn't it a bug if all frequencies added still couldn't cover all settings=
?
> I'd simply suggest to bail out and yell loudly if there is a mismatch
>
> I just don't like putting specific frequency at first one as default,
> this logic is kind of fragile and tend to fail easily..
I checked the Rockchip PLL driver. The RK3036, RK3066 and RK3399
implementations calculate the current rate directly from the hardware
register parameters. If that rate is absent from the rate table, their PLL
init callbacks return without reprogramming the PLL. With
ROCKCHIP_PLL_SYNC_RATE enabled, they only synchronize the parameters when
the current rate matches a table entry but the register parameters differ
from those in that entry.

This approach seems preferable to me. Would it make sense to sort the rate
tables by frequency in the next revision, and follow up with a separate
series to calculate the current rate from the registers and preserve
configurations whose rates are absent from the table, as Rockchip does?
>
>> entry:
>>=20
>>=20
>> 	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);
>>=20


--=20
Troy Mitchell


--536c7c79d9464b992ad1d7b5be05ae3641e4b875bba8fe2b43dc9e787550
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCap1MiA0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQv+TcBAKuYgm3NzSdu2AewDdZD9GRhXTKU8Kg7xc4yVrlo
nVfcAQC2ZNkxsjsFJBZyiwSwQYWdYZq+bsxMX1yf4dEkWAOCAg==
=J7rf
-----END PGP SIGNATURE-----

--536c7c79d9464b992ad1d7b5be05ae3641e4b875bba8fe2b43dc9e787550--


--===============3849645907996415763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3849645907996415763==--

