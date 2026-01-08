Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0F9D148B7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 07:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3r5wQZrOAw4Q9Opi4LnT12o/N0a5VxuCvVx2sb+54e4=; b=tuOMKJ31zfADSS
	U0vzq8t/dAqSC6bLhCmekw9NGP1bjcdEryNtJoMFMqXob9MlMN/enRxw2ENw65fgsey8qaajPAMek
	SmVr8ifShgJQ/KP+iJxZxzGrwOyvG3AX5kGKLDVTJGPfA6MkwRFSHwrqLOFF4Cu511nG7jepXcZ1g
	LPPdvzpxMdsATG4XbV9LjsYMwT5bLvU+SC3FiL8CogrNiYydmjEQT5gUWZmzRoCdgxNXvoHxM73vt
	l/3A6eA5ocSjL60OyDcGSFExcpn/kHi7tMX7/uPo2ztmnBJLmDqOkajyoV8r89J5NfuRP/2z3mutf
	8tMrlWP36icdgkq9OvLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkhK-0000000G80L-1dfO;
	Thu, 08 Jan 2026 07:44:46 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkhH-0000000G7vb-0q5C
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 07:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767858224;
	bh=gmPLxFNB7PwZVYw3lcnPElLWsgdJCt7CvgwsN7UTtf0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=yuZtF/CANbuXFaPOSS6APmAQiDZ5p8PSb1rxkehCVI6O+Rha8xKvCHPmcLm3729kQ
	 XNtjQZItcIV+Y2XSf3eQWVjT28m+8FAKwTaWigXamJXs/pXROAh0+D2ASGS4Sbf5ZK
	 6Bp+Fg8MvSIR5ScQRXy9N32lX1tJxVgKziUIDE1I=
X-QQ-mid: esmtpsz19t1767858216t642a04b1
X-QQ-Originating-IP: 17o6U6Qsxjsav1MFN3Xqj+2GCXT9qk0RWU0f5TMEWJs=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 15:43:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13065356209076285472
EX-QQ-RecipientCnt: 10
Date: Thu, 8 Jan 2026 15:43:35 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v5 2/2] i2c: spacemit: introduce pio for k1
Message-ID: <DBE079430D146D2A+aV9gJ2Ws1y24y-1E@kernel.org>
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-2-023c798c5523@linux.spacemit.com>
 <aVKZIwZf6_NJJRz8@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVKZIwZf6_NJJRz8@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MfDY8OK1Yq+TgBbSl6LavdY4Y+7vnGMgyfiK8hr7BXvWo5xNIZGCfW9O
	YyW3y80vy83JzpNRR5ZAQMgmpZavm+BpOR2hKvl4NBfAmpIIS9ni4AGcJIgIa8Zt0dcGFyX
	2k2DfxyUeHrxGwqMrP3shUf0GWf368jdAyHaFk01hVYCYZHIfuk653reFp4W9Ak0gVftuOO
	yB1Vozqh2jHAV5SJD97rWh0ijhV170BBaHJYjE7rpSdo0j643JpBbt8jplvEuDM9t5mSsmd
	cy1DeNy8eUFuQbBH3XxvpBpbxYicXfamneU/XoOtw9hAEDhHbVIAF8SIcT0jiOawToMOAVZ
	yMw+g78vUiNpr4KvobkrTOBfpc2tsOyvPLInC0vk7cpaB3TvPvCpn3REl4BUuEjGmJuKf76
	Cs89iEcqJbqQs4t76G3uwh91KrXtYidE7YoFsCf1jpE6hUu8am3F4f7OgiXvYIQ+/O+4YZz
	1+41Q2aABnK1nxWx6zcdnbyCNpxpH7XFzEX1f2zgXH4EJWNqxaynEEYwBZK5R2rKCu6q+oS
	5wQuvxD3HUXT8HP/4Q2eBEn/GkWJGBtZ+XCdxVWjW6F7uGZSwLNA6eC8v2yS3FEeeI+w77Y
	eZeeRvYIxONrQINJ5bq/+oDmmOWSqGjj0YejePlxbp7iBG47PGQ/sAvhm30Ya4avA5k/iE3
	AeDXqHYZ9BtzNaHOIvlta2t3EiRgoQPb186LTro1R52b+sQqRdoP5c+QM/iGnUprVTq4LEn
	HxmS0qaAbUT6OvCuOThbIpdPoJ8OApNjK2Y0xYYI0etLLO5PEw+2MAahyVIVX3XGmL1Y8xi
	w0u5EmCYh96JwXk6KMMtBwF6HiFDv82gkp/3EotKHFPSmBYAiXFnrUtkPhdFXnkQ4tjgWaa
	KM2BETIBq8+EO+H3rFt4aweLkknAfohRAtIc+vjVujpBiG1xLiQ5i3utdTMGl3EVr0Ki7J6
	UTZeyp32yZmFrNLvK9DQRfJFckZqlkhLhfqdTLdNCUXDKxElC7xD3VMTvBrPi8XzZBc2Xim
	KArLROC3qPoK8yOW21dpvscyVJxY0CibEVRHW4pNsDTqzylMBfNqNHEBlR1sCRAz+ZyLF8o
	7JujHWCn64dzmHH1RTWe6c=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_234444_140267_18B94979 
X-CRM114-Status: GOOD (  37.65  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Dec 29, 2025 at 04:07:15PM +0100, Aurelien Jarno wrote:
> Hi,
> =

> On 2025-12-26 11:31, Troy Mitchell wrote: This patch introduces I2C PIO f=
unctionality for the Spacemit K1 SoC,
> > enabling the use of I2C in atomic context.
> > =

> > When i2c xfer_atomic is invoked, use_pio is set accordingly.
> > =

> > Since an atomic context is required, all interrupts are disabled when
> > operating in PIO mode. Even with interrupts disabled, the bits in the
> > ISR (Interrupt Status Register) will still be set, so error handling can
> > be performed by polling the relevant status bits in the ISR.
> > =

> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> > Changes in v5:
> > - optimize code logic
> > - refactor delay handling into spacemit_i2c_delay() helper
> > - introduce spacemit_i2c_complete() to centralize transfer completion
> > - rework PIO transfer wait logic for clarity and correctness
> > - modify and add some comments
> > - modify commit message
> > - Link to v4: https://lore.kernel.org/all/20251009-k1-i2c-atomic-v4-1-a=
89367870286@linux.spacemit.com/
> > =

> > Changes in v4:
> > - refactor for better readability: simplify condition check and moving =
if/else (timeout/
> >   wait_xfer_complete) logic into a function
> > - remove irrelevant changes
> > - remove the status clear call in spacemit_i2c_xfer_common()
> > - sort functions to avoid forward declarations,
> >   move unavoidable ones above function definitions
> > - use udelay() in atomic context to avoid sleeping
> > - wait for MSD on the last byte in wait_pio_xfer()
> > - Link to v3: https://lore.kernel.org/r/20250929-k1-i2c-atomic-v3-1-f7e=
660c138b6@linux.spacemit.com
> > =

> > Changes in v3:
> > - drop 1-5 patches (have been merged)
> > - modify commit message
> > - use readl_poll_timeout_atomic() in wait_pio_xfer()
> > - use msecs_to_jiffies() when get PIO mode timeout value
> > - factor out transfer state handling into spacemit_i2c_handle_state().
> > - do not disable/enable the controller IRQ around PIO transfers.
> > - consolidate spacemit_i2c_init() interrupt setup
> > - rename is_pio -> use_pio
> > - rename spacemit_i2c_xfer() -> spacemit_i2c_xfer_common()
> > - rename spacemit_i2c_int_xfer() -> spacemit_i2c_xfer()
> > - rename spacemit_i2c_pio_xfer() -> spacemit_i2c_pio_xfer_atomic()
> > - call spacemit_i2c_err_check() in wait_pio_xfer() when write last byte
> > - Link to v2: https://lore.kernel.org/r/20250925-k1-i2c-atomic-v2-0-46d=
c13311cda@linux.spacemit.com
> > =

> > Changes in v2:
> > - add is_pio judgement in irq_handler()
> > - use a fixed timeout value when PIO
> > - use readl_poll_timeout() in  spacemit_i2c_wait_bus_idle() when PIO
> > - Link to v1: https://lore.kernel.org/r/20250827-k1-i2c-atomic-v1-0-e59=
bea02d680@linux.spacemit.com
> > ---
> >  drivers/i2c/busses/i2c-k1.c | 297 +++++++++++++++++++++++++++++++++---=
--------
> >  1 file changed, 225 insertions(+), 72 deletions(-)
> > =

> > diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> > index accef6653b56bd3505770328af17e441fad613a7..78a2de2c517e51e6ff997cc=
21402eb8f85054f85 100644
> > --- a/drivers/i2c/busses/i2c-k1.c
> > +++ b/drivers/i2c/busses/i2c-k1.c
> =

> ...
> =

> > @@ -383,8 +424,134 @@ static void spacemit_i2c_err_check(struct spacemi=
t_i2c_dev *i2c)
> >  =

> >  	spacemit_i2c_clear_int_status(i2c, SPACEMIT_I2C_INT_STATUS_MASK);
> >  =

> > -	i2c->state =3D SPACEMIT_STATE_IDLE;
> > -	complete(&i2c->complete);
> > +	spacemit_i2c_complete(i2c);
> > +}
> > +
> > +static void spacemit_i2c_handle_state(struct spacemit_i2c_dev *i2c)
> > +{
> > +	u32 val;
> > +
> > +	if (i2c->status & SPACEMIT_SR_ERR)
> > +		goto err_out;
> > +
> > +	val =3D readl(i2c->base + SPACEMIT_ICR);
> > +	val &=3D ~(SPACEMIT_CR_TB | SPACEMIT_CR_ACKNAK | SPACEMIT_CR_STOP | S=
PACEMIT_CR_START);
> > +
> > +	switch (i2c->state) {
> > +	case SPACEMIT_STATE_START:
> > +		spacemit_i2c_handle_start(i2c);
> > +		break;
> > +	case SPACEMIT_STATE_READ:
> > +		spacemit_i2c_handle_read(i2c);
> > +		break;
> > +	case SPACEMIT_STATE_WRITE:
> > +		spacemit_i2c_handle_write(i2c);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +
> > +	if (i2c->state !=3D SPACEMIT_STATE_IDLE) {
> > +		val |=3D SPACEMIT_CR_TB;
> > +		if (i2c->use_pio)
> > +			val |=3D SPACEMIT_CR_ALDIE;
> > +
> > +
> > +		if (spacemit_i2c_is_last_msg(i2c)) {
> > +			/* trigger next byte with stop */
> > +			val |=3D SPACEMIT_CR_STOP;
> > +
> > +			if (i2c->read)
> > +				val |=3D SPACEMIT_CR_ACKNAK;
> > +		}
> > +		writel(val, i2c->base + SPACEMIT_ICR);
> > +	}
> > +
> > +err_out:
> > +	spacemit_i2c_err_check(i2c);
> > +}
> > +
> > +/*
> > + * In PIO mode, this function is used as a replacement for
> > + * wait_for_completion_timeout(), whose return value indicates
> > + * the remaining time.
> > + *
> > + * We do not have a meaningful remaining-time value here, so
> > + * return a non-zero value on success to indicate "not timed out".
> > + * Returning 1 ensures callers treating the return value as
> > + * time_left will not incorrectly report a timeout.
> > + */
> > +static int spacemit_i2c_wait_pio_xfer(struct spacemit_i2c_dev *i2c)
> > +{
> > +	u32 mask, msec =3D jiffies_to_msecs(i2c->adapt.timeout);
> > +	ktime_t timeout =3D ktime_add_ms(ktime_get(), msec);
> > +	int ret;
> > +
> > +	mask =3D SPACEMIT_SR_IRF | SPACEMIT_SR_ITE;
> > +
> > +	do {
> > +		i2c->status =3D readl(i2c->base + SPACEMIT_ISR);
> > +
> > +		spacemit_i2c_clear_int_status(i2c, i2c->status);
> =

> Do we actually need to clear the interrupt status even if none of above =

> bits are set? Said otherwise, can we move this line after the if and =

> before the handle_state?
No, if other bits is pending, we need to clear them here.
> =

> > +
> > +		if (!(i2c->status & mask)) {
> > +			udelay(10);
> =

> It seems that the poll delay elsewhere in this patch is 30 =B5s. =

> Maybe use a consistent value.
> =

> > +			continue;
> > +		}
> > +
> > +		spacemit_i2c_handle_state(i2c);
> > +
> > +
> =

> Please delete the extra blank lines here.
> =

> > +	} while (i2c->unprocessed && ktime_compare(ktime_get(), timeout) < 0);
> > +
> =

> Otherwise it sounds good, thanks for the changes.
Thanks.

                              - Troy
> =

> Regards
> Aurelien
> =

> -- =

> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
