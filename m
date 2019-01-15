Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE48C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 20:11:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6DC420859
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 20:11:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kfy6nzhU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6DC420859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5c/QbON8hf7IYGZ+kgOfqtsjaT0QTKLEbG+Yj40U9gU=; b=kfy6nzhUW1t8wy
	NBUa2izPR99+QWqiOuAp04lA53X5qIAdWiY40q7tragrwxtf6b6NHcIbxuhsTsmoLu7jJZZdl5Ee7
	QvnH3GQrjPpeofcvJRbUJJnQ92qrebxkkjJJh7ILoRC+lBuWDxzVZrS6rEDQRiFXevNgnuF3Jc+CZ
	ftQG61Bw1Y3DYZOdW2cgZJ6zNpBHKa5qVN4y8+Ss6rNr1ekWBG+4zE8ZCcwGk/LCWXWryykPnycCm
	aJuFEtC4cK50ms6PxKrnFR7J4U7FLFFl61XbebG5q+AefGCna7KXDkrgUrqqTg6HqPlvvAM2DIEz1
	G1/X+SSjBq+f5dhGMRoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjV3z-0007k6-IX; Tue, 15 Jan 2019 20:11:55 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjV3w-0007jZ-SP
 for linux-riscv@lists.infradead.org; Tue, 15 Jan 2019 20:11:54 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gjV3v-0005Fh-5N; Tue, 15 Jan 2019 21:11:51 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1gjV3t-0004Pm-R1; Tue, 15 Jan 2019 21:11:49 +0100
Date: Tue, 15 Jan 2019 21:11:49 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 1/2] pwm: sifive: Add DT documentation for SiFive PWM
 Controller
Message-ID: <20190115201149.ghddnf27s5kqephc@pengutronix.de>
References: <1547194964-16718-1-git-send-email-yash.shah@sifive.com>
 <1547194964-16718-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1547194964-16718-2-git-send-email-yash.shah@sifive.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190115_121153_074740_B626E6FD 
X-CRM114-Status: GOOD (  19.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 sachin.ghadi@sifive.com, thierry.reding@gmail.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hello,

this is v3, right? It is helpful to point this out to ease reviewing.

On Fri, Jan 11, 2019 at 01:52:43PM +0530, Yash Shah wrote:
> DT documentation for PWM controller added with updated compatible
> string.

Not sure what was updated here. But assuming this is compared to v2 this
is not a helpful info in the commit log.

> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/pwm/pwm-sifive.txt         | 37 ++++++++++++++++=
++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> =

> diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Docum=
entation/devicetree/bindings/pwm/pwm-sifive.txt
> new file mode 100644
> index 0000000..e0fc22a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
> @@ -0,0 +1,37 @@
> +SiFive PWM controller
> +
> +Unlike most other PWM controllers, the SiFive PWM controller currently o=
nly
> +supports one period for all channels in the PWM. This is set globally in=
 DTS.
> +The period also has significant restrictions on the values it can achiev=
e,
> +which the driver rounds to the nearest achievable frequency.
> +
> +Required properties:
> +- compatible: Please refer to sifive-blocks-ip-versioning.txt

While the description was too verbose in v2, this is too short. You
should at least mention something like "sifive,pwmX" and
"sifive,$cpuname-pwm" (or how ever that scheme works).

> +- reg: physical base address and length of the controller's registers
> +- clocks: Should contain a clock identifier for the PWM's parent clock.
> +- #pwm-cells: Should be 2.
> +  The first cell is the PWM channel number
> +  The second cell is the PWM polarity

I'd drop these two lines and refer to bindings/pwm/pwm.txt instead.

> +- sifive,approx-period-ns: the driver will get as close to this period a=
s it can

As already said for v2: I'd drop "approx-". =


> +- interrupts: one interrupt per PWM channel
> +
> +PWM RTL that corresponds to the IP block version numbers can be found
> +here:
> +
> +https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devic=
es/pwm
> +
> +Further information on the format of the IP
> +block-specific version numbers can be found in
> +Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt
> +
> +Examples:
> +
> +pwm:  pwm@10020000 {
> +	compatible =3D "sifive,fu540-c000-pwm","sifive,pwm0";
> +	reg =3D <0x0 0x10020000 0x0 0x1000>;
> +	clocks =3D <&tlclk>;
> +	interrupt-parent =3D <&plic>;
> +	interrupts =3D <42 43 44 45>;
> +	#pwm-cells =3D <2>;
> +	sifive,approx-period-ns =3D <1000000>;
> +};
> -- =

> 1.9.1
> =

> =


-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
