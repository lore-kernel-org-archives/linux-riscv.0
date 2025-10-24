Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74C5CCD1A5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZNGfiyZfHTz6j6rlvdBmDyVFjcrmR+yHXF3LZks/6I=; b=IIVVRi/Dt3kYLF
	B9IuzYYoWpJ2QjAU5h1fDXydnX4UBb27SEBgOetscDlEgIDAKkgYJJCDEAOylFNVK0zvXd8m8qhpz
	jbnoxreUoi3fJdYoBBGM43G2k5gwIPAQV/SuZ4gP8G1emmb6CtuRgK+cvN3+ggOFIdD1D+ZGT6+sB
	N7yNV4aqQ+ztaSvzXAJA1Fqx6ryfg/FhR8iONFWSS+KcFjeUoOdfFPX8TfOxOo8su4wnmFKHQV0bS
	H54UsJqL0zjY+WBiVA0F74VA0bL9i+0agVY22E3mSVKi2iorTeq1gUgHPkeHz1e2tHtrYhjK6mUUj
	nxFCalc+zap21xDfaoLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFMs-000000094je-3kSF;
	Fri, 24 Oct 2025 10:49:58 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFMp-000000094eD-1RBa
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 10:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761302946;
	bh=PvlLbAtr3XlzVLm6/DyAYUo7+1BEZwmOFQMdHFYJrCs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=dLwD0pd4ywjbLoaWL5hNcfJ/kBbNMfHuUPeF4/+2VZ80fjWmgWFmKmBpzPRvfIyUI
	 2b+iPLTMSzqi+ZF4CmaBuRgWAhm11OutYFvtCXf+wwRR7tV4OteN/zy1cwln5XZ/Dc
	 4eVwTJO+I029cTLEf/Zd0/vJa5RCjyyeY2jAx8+c=
X-QQ-mid: zesmtpip4t1761302939t485c17ea
X-QQ-Originating-IP: lTQezpA5yN4MrVbzvzdIeTYUYXSeOApYxnJ36Znae8A=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Oct 2025 18:48:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8636402591889847719
EX-QQ-RecipientCnt: 7
Date: Fri, 24 Oct 2025 18:48:55 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@gentoo.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <D8C067EFD2F94D3A+aPtZl2S44JYNUijG@troy-wujie14pro-arch>
References: <20251017-k1-i2c-ilcr-v4-1-eed4903ecdb9@linux.spacemit.com>
 <t26pyjnmzj62oczwuje2bbscowj22pdge2ef3tcktwmhzpsq47@7odo2ccvc52a>
 <sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx>
 <748544ABF6A72D31+aPg31PBvHDkBALoa@kernel.org>
 <lr77avehdf3skwd5o2yur4hvbxhyx2spzve3wpo733l74ppjcx@mn34escjt542>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <lr77avehdf3skwd5o2yur4hvbxhyx2spzve3wpo733l74ppjcx@mn34escjt542>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MsGkKnz+xAbkOk5PEMsmxnIORBwDpcFCsS1Z1yQ4uBh6Ul5aGbhpEx2d
	/1Mr3kaCWHZbatyP9KN/NDJ4lS1TIuGLSdf+yaaS5+uRUm36KhbEuyNkM45MXIlxdlctJRq
	cmAr9yNOJcWqCSaQbBRRaYLHcy3s2yYt47/qKza11XxehzttN4THDGeNq1dO5yrPZjlxQzE
	JjzRWA+1UniS6loMPYV4on7x354EGzaimRiTLU1TbZMK5gtn6ZPShr/aR/GxA+Ob6rxejkT
	TcxF0tS8pORG5Y28PGhyHz5NsJeT5HSQk96lqtwC3ZUX3j9gTQKrHXfWldNrFIvvBR2usHP
	XOdft7rJvEalGCJu2FOD2Y5hIPXBA2jxctBN7F0U71j79RISzcyzg2RoH6aRgwTMJ2P///u
	Icl5vZP/T0BY2fGpnBpNMHi7qz4V6ITP4Kkqi4VyxxxQHXpzMLipSDDqc0kPrexvjSiHT21
	KHSiIwOPC3Qgf+xiVZ+qyWRFFY4NGXuemsrb8WMr004FYguxqC1ry7h8S85WeqWzpYOy5Ay
	KUXygCPSJw8a2Kv1lgqyIuD/fjl5ZUdEVbyHU4nmHZM5+6EN1UjQU9WruunqHZPjlfNPIYZ
	UjYL7JXNTL47U37MZiUpLB2f391oqMFBIF3Gpg4zB1NI1jx00acOpzIaH15qy7icMfIRls1
	TfqEHUvi6gd3qbOrADCO7dqovTqXYlLjg6UGd0MY40s/LdWOrDten81xUz8jTRxaoV7eE17
	tXIh7NpkAVTWPWYfrD5Kf+e4lTMvHkuFoPbTpbqqTYStrLJGGnC1UapgPGFlNhfhss67ZP+
	mGLkK6DQNxBjI/t4ABYV7AioybK4hVGSUmRQYnULF3BgxDSVTiTuKATnyqT7v6NUmJpIiuR
	xs5fLVaS3mnxmPihjcAm8fk3mUDrtZ9QTtHOSfLQvpVsZ57idGIINQtR/c32rXMy5fXWqkN
	IOZHmyyipL7OiJxPV14RRHFLJqfqrlkcDQJTAxiMtMAAp6kuDNW5PtH7ySVkle/DRN59sGk
	EzkAjFOUAJpZCdzMPIw9NtrQlvVx8xgxd2EbsoqXA15ZzVbXce
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_034956_597629_2C3003BF 
X-CRM114-Status: GOOD (  27.62  )
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

On Thu, Oct 23, 2025 at 12:34:23PM +0200, Andi Shyti wrote:
> Hi Troy,
> 
> On Wed, Oct 22, 2025 at 09:48:04AM +0800, Troy Mitchell wrote:
> > On Tue, Oct 21, 2025 at 06:03:34PM +0200, Andi Shyti wrote:
> > > On Mon, Oct 20, 2025 at 11:28:45AM +0200, Andi Shyti wrote:
> > > > On Fri, Oct 17, 2025 at 03:27:39PM +0800, Troy Mitchell wrote:
> > > > > The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> > > > > master mode operations is determined by the ILCR (I2C Load Count Register).
> > > > > Previously, the driver relied on the hardware's reset default
> > > > > values for this register.
> > > > > 
> > > > > The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> > > > > frequencies lower than intended. For example, with the default
> > > > > 31.5 MHz input clock, these default settings result in an SCL
> > > > > frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> > > > > and approximately 338 kHz (fast mode) when targeting 400 kHz.
> > > > > These frequencies are below the 100 kHz/400 kHz nominal speeds.
> > > > > 
> > > > > This patch integrates the SCL frequency management into
> > > > > the Common Clock Framework (CCF). Specifically, the ILCR register,
> > > > > which acts as a frequency divider for the SCL clock, is now registered
> > > > > as a managed clock (scl_clk) within the CCF.
> > > > > 
> > > > > This patch also cleans up unnecessary whitespace
> > > > > in the included header files.
> > > > > 
> > > > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > > 
> > > > merged to i2c/i2c-host.
> > > 
> > > I'm sorry, because of the report from LKP(*) I reverted your
> > > patch. I2C_K1 is selected by MFD_SPACEMIT_P1, so that we get the
> > > following warning:
> > > 
> > >   WARNING: unmet direct dependencies detected for I2C_K1
> > > 
> > > and compile I2C_K1 without COMMON_CLK. Please, fix it and
> > > resubmit the patch.
> > Yes, I noticed that too. The issue is introduced by PMIC driver(P1)
> > instead of I2C.
> > Should I resubmit this patch right after sending the fix,
> > or wait until the fix gets merged first?
> 
> I have reverted the patch. Please send them both in the same
> series, where the first patch is the "fix" (or preparation to
> this patch) and then this patch.
Oh, I have sent a sigle patch that fix the error..
I'll send v2 with this patch.

                          - Troy
> 
> Thanks,
> Andi
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
