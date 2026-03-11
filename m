Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E642FD88DF
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 02:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BN0+0Eqtwu1X9erLrgVCFD4CwD2Xz5CpVPN2oUt2J3A=; b=NDgDSwIz1qco6R
	/UcZgIz0C1meoWgTRfcq2AvzcN9ExUPcbn2tqkdqZmeYbivUVQhtfkLp8K7LsJe95wwOjdi420i7k
	7exfc9YAA4EFjXGc54DJjE9FSDg4KehMO80SlWY/x8q9i2Uuh70fGIqSuNrJW6X7nZ97fP2iNwE+E
	zhZYEHksIxZ7ysmfcVyXCSeB3vWO5xsqBOmhotlWop3gQjhkK2/24KfxuHJe1MdjawECHgncPv3S5
	RjTObzBQ4brX8otyOOfm8IBR6ttoSNn9wKSbedbF+496nTFGj0gQBtxORDIPZ8jgU8EKImXcx+POZ
	wR+c1YmKDcXUhA2dCGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09nY-0000000Aa1b-3tFK;
	Wed, 11 Mar 2026 02:59:48 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09nW-0000000AZzs-1ArF
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 02:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1773197901;
	bh=cdYAA+g/5AwgfFzsh2zrBrYJPymEr6G4WcYfRqa8g2A=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=LZ7nTvklF5b+GD6I66nWVRG2zJPjmwpOWs7RR/GCdkw9pKVXO7iaE58cst27M9k/v
	 87/dnVrOHmvMYYTOn+qBdBcQyq+xRmWGRD4GWj3wgBVMmxv0y1H7bNel4WA9at0V43
	 e1fFg7HcdO1P9ezBt7cut0hBqIkH8YKq8jjspW64=
X-QQ-mid: zesmtpsz6t1773197891tb6bc5c9c
X-QQ-Originating-IP: JjQFje59Pj2+UWzI0DdnSaJjGPej3hv3InT1nK7o+PE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 11 Mar 2026 10:58:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11627406965186864480
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Wed, 11 Mar 2026 10:58:09 +0800
Message-Id: <DGZM6WUAVPPS.20Y0NIZYI4572@linux.spacemit.com>
To: "Aurelien Jarno" <aurelien@aurel32.net>, "Yanko Kaneti"
 <yaneti@declera.com>
Cc: <linux-kernel@vger.kernel.org>, "Lee Jones" <lee@kernel.org>, "Sebastian
 Reichel" <sre@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Yixun Lan" <dlan@gentoo.org>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "open
 list:RISC-V ARCHITECTURE:Keyword:riscv" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit"
 <spacemit@lists.linux.dev>, "open list:SYSTEM RESET/SHUTDOWN DRIVERS"
 <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] mfd: simple-mfd-i2c: add a reboot cell for the
 SpacemiT P1 chip
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <20251102230352.914421-3-aurelien@aurel32.net>
 <b51a62513daa9d2390031ec350e0b33bdb7e54aa.camel@declera.com>
 <aaC78FTN31QYaVg0@aurel32.net>
 <990bc03ed2baa05e619f0aa9cc6a23acadd66ea6.camel@declera.com>
 <aaS6xeKFZz06fb1_@aurel32.net> <aaXuWwyA5NzBZzlW@aurel32.net>
 <36f8df695463e5ff3eaaffbac357fc73026f7373.camel@declera.com>
 <aadGw1fIlJyNNoum@aurel32.net>
In-Reply-To: <aadGw1fIlJyNNoum@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OLsBWtCIHsg6buEiKGGL/LCBUeXpuoFwDyI9NRafgFg1zEkJDxEW9jX7
	CCnzBTLKftIQu0WYFRFJbuq7tTu6o6mDYPTaFerfqFSQOBi4BTloFi/hHd1aH8a3cxLZNCh
	YIZtWcUWcqLUNEXlhTWts95mavd/h/ykbAGybhKdonXikBx9DQnQ9/iTzreTfJFTQinbo4k
	zokyEc5btd6DjE2V14QoZt0SulA28q9vawh7VAbP95EUSOCTXgblRwqtNarpjAKQ4TLxBUr
	Lhku3UXsIfkLvsIfNZ2dePAXPPuXYVs/bsoEL2a0j7HKGJ7Q2e6v1HU2Tf6koaXMREsCoMN
	sphw3WN493QaK2YAgRrMTsAPMXf7PbXhARzUcMPVuTn/lAONs5HRPAuXkcZlKkwTrPqFArp
	3yA9MEUW+BeD+NKclWawUPsu8l2Yk3uD1T0njXxBdMLNqUhUi2PlhgjFROzSztMIGVfCZNA
	6sjpQs2uku8bVGl6tWnppBLlqzfJhf+PgEJyjRRutXZkydXCRdeCCPviSNn5SiZUAVnq5Ef
	Xz+pjLZi7HbUisZ2deP1VV43pKVPn1OL+yJsG6quB/l2pR6pjrU1Qb1sax8dK14cJHeDTeC
	FO++057Valgvny+YQl6Jt2cf4vi6Ghcn6x9s26FGDAEewCGzV09RKMUrf5loCbSi+Mm1ysy
	82S3MGpooa/gwEb9Mmvg8SCod7qWbuw4YaGHPC8URFiyrL3MX/p16nw1WC8JXgPDjKls23e
	mIWxIu2GrweISzOOw6aYrCWcnFli+LIiQtv08AU+dmFc9uZ8Qt+cn49tQgfb9nsEHGDpF4j
	9ZEoPvVGizvkY9O5jxNrQjU9Fj6N6UoK2/A/Q1R5V9kEq8kUqY1ROIFyh7Phjhy6jXVA3qA
	rg0NIhO0REvmLfc4Q1ZFCAAQsHr+LtaEGIoSmTX00nujCegozbCORMo6td7Wz4+G92jp+QX
	zF8r8+cjM6BRtffiGxoZDcKOUJNo5CQwb/gimAlex5iN2xIP+jAPMJ+bQS1o74tGcFH4gCE
	wb8pdfv+gVyIz7N97JkOhKvc1fMFJUWuGLR3m0fHdq1UQzH0a49rDRxHUKo/tx+W7h2bwqS
	amUypc7RMsJZ4LqsgdFuq8=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_195946_779637_BAC827ED 
X-CRM114-Status: GOOD (  34.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed Mar 4, 2026 at 4:38 AM CST, Aurelien Jarno wrote:
 Hi, Aurelien and Yanko,
> Hi,
>
> On 2026-03-02 22:34, Yanko Kaneti wrote:
>> Hello,
>> 
>> On Mon, 2026-03-02 at 21:08 +0100, Aurelien Jarno wrote:
>> > On 2026-03-01 23:16, Aurelien Jarno wrote:
>> > > On 2026-02-27 13:29, Yanko Kaneti wrote:
>> > > > On Thu, 2026-02-26 at 22:32 +0100, Aurelien Jarno wrote:
>> > > > > Hi,
>> > > > > 
>> > > > > On 2026-02-26 16:32, Yanko Kaneti wrote:
>> > > > > > Hello,
>> > > > > > 
>> > > > > > On Mon, 2025-11-03 at 00:02 +0100, Aurelien Jarno wrote:
>> > > > > > > Add a "spacemit-p1-reboot" cell for the SpacemiT P1 chip.
>> > > > > > > 
>> > > > > > > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
>> > > > > > > ---
>> > > > > > > v5: no changes
>> > > > > > > 
>> > > > > > >  drivers/mfd/simple-mfd-i2c.c | 1 +
>> > > > > > >  1 file changed, 1 insertion(+)
>> > > > > > > 
>> > > > > > > diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
>> > > > > > > index 0a607a1e3ca1d..542d378cdcd1f 100644
>> > > > > > > --- a/drivers/mfd/simple-mfd-i2c.c
>> > > > > > > +++ b/drivers/mfd/simple-mfd-i2c.c
>> > > > > > > @@ -99,6 +99,7 @@ static const struct regmap_config spacemit_p1_regmap_config = {
>> > > > > > >  };
>> > > > > > >  
>> > > > > > >  static const struct mfd_cell spacemit_p1_cells[] = {
>> > > > > > > +	{ .name = "spacemit-p1-reboot", },
>> > > > > > >  	{ .name = "spacemit-p1-regulator", },
>> > > > > > >  	{ .name = "spacemit-p1-rtc", },
>> > > > > > >  };
>> > > > > > 
>> > > > > > Perhaps its safe to merge this one now that everything P1 and I2C is
>> > > > > > already in linus tip ?
>> > > > > 
>> > > > > Unfortunately, this patchset is still missing:
>> > > > > https://lore.kernel.org/all/20260207-b4-k3-i2c-pio-v7-0-626942d94d91@linux.spacemit.com/
>> > > > > 
>> > > > > This means the reboots work most of the time, but are not 100% reliable, 
>> > > > > and that's the reason why this patch got blocked from merging.
>> > > > 
>> > > > I see. Thanks. Sounds to me like sometimes working compared to never
>> > > > working is better , but anyway..
>> > > 
>> > > I agree with that, but the decision was to hold on this patch until the 
>> > > I2C PIO part got merged.
>> > > 
>> > > > FWIW  with this patch and the pio patcheset I get this rcu splat on
>> > > > reboot (which is still working). Similar splat is there without the pio
>> > > > patcheset.
>> > > 
>> > > I haven't been able to reproduce the issue here after 10+ reboots on a 
>> > > BPI-F3 board, but I tried the patch on top of 6.19. I'll try to build a 
>> > > 7.0.0-rc2 kernel and report back.
>> > 
>> > I have tried that, and I am still unable to reproduce the issue with a 
>> > 7.0.0-rc2 kernel and a BPI-F3 board.
>> 
>> I can still see it on every reboot (with the patches that allow reboot
>> to work). Do you have CONFIG_PREEMPT_RCU in your config ? its default on
>> when anything PREEMPT is selected. In Fedora its CONFIG_PREEMPT_DYNAMIC
>> that flips it.
>
> Thanks for the hint, that option was not activated here, it's not the 
> riscv64 defconfig. With it I am also able to reproduce the issue. I'll 
> try to debug that and report back.
I have sent a patch to address this issue here[1].

Could you please test it on your hardware when you have a chance?

                        - Troy

Link:
https://lore.kernel.org/all/20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev/ [1]

>
> Regards
> Aurelien


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
