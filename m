Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B112AC61DD6
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 03:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Cc:To:From:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLxkqiafys0+9P5B9Rw/yNlTePHLjQF8V9zlEuasgrU=; b=2B09nHJt46xdCcFIrhg8T/ue28
	Cg4BMmfQralkPIX06nqWcDS5k/jzNLbpLBPfDWpx39piM9hlbmp44SoWjSkqOkpk0alaZeaiyKxl2
	bFqknYwPvfxvMcKRM6yiIfubhjGCsuFaQ6f9j4qy/B2vaKOFmFd7TmWA88dD1MbUsomTKzodcRT3R
	RrxWgsw/1uodU9CFryi3IbgnvVwNYYFHh7XT9ROSNbkCjNB4sRTlgQYQz5j28wO3srm3RgwSFSzP0
	dFjqbok4LjPI6Mp0Tk/BSfPTqAPEySAjwXbifTvXJQP5+GCyeO5yN1QQS0pd3UEqFhFkKtOID7UOI
	VZDxnecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KXo-00000000vNO-08LY;
	Fri, 04 Sep 2026 03:24:48 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KXk-00000000vMb-1ekb
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 03:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1788492269;
	bh=+fjce5Gv68gDb4c/l/fe5+Q4SZGtlsosTF1WEjjxUK8=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=Zj8yLUQlyL2m6aW139jNLntDDWwOrrsU4IJ5v7dA4/ogtjFSLT7ga397YGm8m0fLP
	 VR6QQcq+e07+VFKYPKW3A2kPtwwOWmw7ucELMob7u3CQdStIYPfjxTLBn7xtKkK+yP
	 rjcANDqptKp07AifhFMujrBNb72RNpM8HH/TXIRA=
X-QQ-mid: zesmtpsz4t1788492267t97a1c389
X-QQ-Originating-IP: UUFOhxrmyWmafniu2RpwCuAxO+jazOpB/m3P/JOKzfU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Sep 2026 11:24:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16749050241281996791
EX-QQ-RecipientCnt: 19
Mime-Version: 1.0
Date: Fri, 04 Sep 2026 11:24:22 +0800
Message-Id: <DL67LEVCXFA5.39M5FO7JGKWZS@linux.spacemit.com>
Subject: Re: [PATCH v4] clk: spacemit: k3: add CPU PLL rate tables
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Aurelien Jarno" <aurelien@aurel32.net>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Michael Turquette" <mturquette@baylibre.com>, "Inochi Amaoto"
 <inochiama@outlook.com>, "Alex Elder" <elder@riscstar.com>, "Haylen Chu"
 <heylenay@4d2.org>, <stable@vger.kernel.org>, "Stephen Boyd"
 <sboyd@kernel.org>, "Brian Masney" <bmasney+clk@redhat.com>, "Jerome
 Brunet" <jbrunet+clk@baylibre.com>, "Yixun Lan" <dlan@kernel.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 <linux-clk@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260903-k3-pll5-pll8-1800mhz-v4-1-afafd9cb47d9@linux.spacemit.com> <apmuG46sBg2rGzCD@aurel32.net>
In-Reply-To: <apmuG46sBg2rGzCD@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MOsVgoF62rlXg2jMy+En6/iirgDaQNRxZyXqrMP91f3S8ZHwZMVbtaJr
	7xM27fIaocapgAnzKqQp5stV87/ZpBc/zKO6PJuvevedWvY9zw5FFoz/3JV0FOolmEnfyGC
	KjDSRkS7G/2zDvIQYc3c4B43MSMHXs+QROIIVuMkfPItNf6WkF9Y7SStWvLuxgOpFKYstbO
	E8ya/Mp+URQBbu6hVxKByMG0w+zbXAdmPf4QIWRia/xGiAoA12zo5abK8p5vKQw175Y/fqy
	QhpqPQ7UJt2FJz9OOEJ/4y1oK3RUMbKLQ9qE2VzjsksyZfQLQ+L7WkXbBGnLnwwC16AdJQL
	c3om90lp2j49lBfkHhaXBT7xKbsguaHKhqILVfhS/FVpujLYZ2JPS+QfDKgQETZtj6uqOxh
	kg6X35hm8x8RgX2peklC9yHTyQ3f3e/fdPc7s87d3fTANlIn/T8XqpEl/3/bGsPnONcXa7B
	0sXLQttbLYKutcn0LixM7wet4tI/8mKTCd3h41glH6cC7jGk8rlri4LtHSnzkd1jZcKripf
	j7xzsm+0gP1mZZk/bF5J9/xb2RSeGI6hWIsllNWajCGLR9ti/kF4k2PvomRof0NrYDxxKro
	W6KEdmFMWSElR4hqEOvGx1ZOYr+w5X7FeR5N8RSwpQe1dSyyrM+gEZHcSvJylse8N9FQik2
	2PcCN3bSLovT8BTREGCD3WTHja5a50R/R/KpXxpI5+QRi5gzv3Hm/sSnLiBVPsf12OqNpyS
	3KakqTIoiABkNOmDDT8RHZAfjdN+kZDsUFc1ALiUafPZ6gkvJ1JyAwRJ98NRSbV+78b8Phx
	ZPdnVCBsgFGHCQ4Rf12cdikVShykaPvkxFI+XLlvYy+FKt1oWpbdqslGxmNZwFH95egsF/T
	6VBlf4GICSzNhi9PV+KiqZX88el5Wuso/zbDHiYVf6lzHJ/w6BtvayOw1V7/gR/NZgx9px2
	JLd+d7MiCfKzoOmm1Feg3zd+IJ9kHQAfgo8M5sadAOwNonVfZoPYpXdoNwGjciuTFzjgjrf
	XysuNksj4lxi/ZCYbN2eZu3ZD0rjZd35uug+7OwcN6CVmuRDz1lpqsHCNPFuuWfG3kT/8nV
	WrB8WGoZVJunAMSLegddIhyZNsCfJsctV3Zpd4M/EhdJybl7oSG+olr+UCqxZK7nw==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_202445_258748_44C2B920 
X-CRM114-Status: GOOD (  28.28  )
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
Content-Type: multipart/mixed; boundary="===============0497002844557088923=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0497002844557088923==
Content-Type: multipart/signed;
 boundary=a1891db0d9ec175249303eb0426fd87ee9cd330fcbf1e2986c4b86e25967;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Content-Transfer-Encoding: quoted-printable

--a1891db0d9ec175249303eb0426fd87ee9cd330fcbf1e2986c4b86e25967
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Aurelien,

On Fri Sep 4, 2026 at 1:27 AM +08, Aurelien Jarno wrote:
> Hi Troy,
>
> On 2026-09-03 11:06, Troy Mitchell wrote:
>> The K3 CPU PLL rate tables currently describe only one rate per PLL,
>> although the hardware supports a wider range.
>>=20
>> PLL3 and PLL4 support rates from 1.05 to 2.4 GHz, while PLL5 and PLL8
>> support rates from 1.05 to 2 GHz. Populate the tables with every
>> supported rate in 50 MHz steps.
>>=20
>> Cc: stable@vger.kernel.org # 7.0+
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> The corresponding U-Boot changes are available at:
>>=20
>> - Add the CPU PLL rate tables:
>>   https://github.com/spacemit-com/uboot-2022.10/commit/787b5cf44c8dbc99d=
b886d5522c0c9cd5a96ffd6
>> - Correct the 1.10 GHz and 2.15 GHz table entries:
>>   https://github.com/spacemit-com/uboot-2022.10/commit/16a775c20e9efb54c=
a55352215e76eb3f12e6cf0
>> ---
>> Changes in v4:
>> - Expand the update to every supported PLL3, PLL4, PLL5 and PLL8 rate.
>> - Drop Aurelien Jarno's Reviewed-by and Tested-by trailers because the
>>   patch scope has expanded.
>> - Add U-Boot references for the complete tables and corrected entries.
>> - Link to v3: https://patch.msgid.link/20260831-k3-pll5-pll8-1800mhz-v3-=
1-530ed0978615@linux.spacemit.com
>>=20
>> Changes in v3:
>> - Mark the change for stable kernels starting with v7.0.
>> - Add Aurelien Jarno's Reviewed-by and Tested-by trailers.
>> - Rebase onto v7.3-rc1.
>> - Link to v2: https://patch.msgid.link/20260810-k3-pll5-pll8-1800mhz-v2-=
1-aabff510a797@linux.spacemit.com
>>=20
>> Changes in v2:
>> - Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
>>   will be handled in a separate series.
>> - Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
>>   patch.
>> - Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
>> - Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-=
0-a3a75866ce32@linux.spacemit.com
>>=20
>> To: Stephen Boyd <sboyd@kernel.org>
>> To: Brian Masney <bmasney+clk@redhat.com>
>> To: Jerome Brunet <jbrunet+clk@baylibre.com>
>> To: Yixun Lan <dlan@kernel.org>
>> To: Paul Walmsley <pjw@kernel.org>
>> To: Palmer Dabbelt <palmer@dabbelt.com>
>> To: Albert Ou <aou@eecs.berkeley.edu>
>> To: Alexandre Ghiti <alex@ghiti.fr>
>> Cc: linux-clk@vger.kernel.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: spacemit@lists.linux.dev
>> Cc: linux-kernel@vger.kernel.org
>> ---
>>  drivers/clk/spacemit/ccu-k3.c | 96 ++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 96 insertions(+)
>
> Thanks for the patch, it makes sense to add all the values, to support=20
> future firmware changes. The values match the ones in the vendor kernel.
I forgot that you had a similar patch as well..

>
>> diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3=
.c
>> index 92b930d5ff30..950bf531c734 100644
>> --- a/drivers/clk/spacemit/ccu-k3.c
>> +++ b/drivers/clk/spacemit/ccu-k3.c
>> @@ -29,15 +29,91 @@ static const struct ccu_pll_rate_tbl pll2_rate_tbl[]=
 =3D {
>>  	CCU_PLLA_RATE(3000000000UL, 0x0b3e2000, 0x00000000, 0xa0558c8c),
>>  };
>> =20
>> +/* Keep the firmware default as the first entry. */
>>  static const struct ccu_pll_rate_tbl pll3_rate_tbl[] =3D {
>> +	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
>
> Is it really necessary to put this entry first? I guess it's the current=
=20
> default frequency, but we have seen it can evolve. From my tests, the=20
> driver seems to just keep the value configured by the firmware=20
> independently from the table order, so I am not sure it's necessary.
I think keeping it first is necessary. If the current register settings do
not match any entry in the table, ccu_plla_init() falls back to the first
entry:


	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);

[...]

>>  };
>
> I have tested the patch, and I confirm it fixes the boot hang with newer=
=20
> firmware, and will fix it if the default firmware values change again.=20
> My comments are just minor ones, so:
>
> Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks for the tags.

>
> Regards
> Aurelien=20


--=20
Troy Mitchell

--a1891db0d9ec175249303eb0426fd87ee9cd330fcbf1e2986c4b86e25967
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIMEABYKACsWIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCapo55g0caUB0cm95LXku
b3JnAAoJEJgJ74D5MzQvWBABAOrdMzrm+oSmpz+4PbCFYU/sKXN1r/pnmybu2iWq
K9rlAQDr7ekCrcf/gUilgr3y2rN7N0vIvjxWJ3Sylb1GzzXXAA==
=DS8M
-----END PGP SIGNATURE-----

--a1891db0d9ec175249303eb0426fd87ee9cd330fcbf1e2986c4b86e25967--


--===============0497002844557088923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0497002844557088923==--

