Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D2EC43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 17:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+5FXgQlf6GkQo0BQToM4SgzvaeHeUexHQRfeaoNewQ=; b=WMGkbE2hOSa/Z+
	xaQcBnMXin9P4sVwDYTrmOw/7nfvaj6OSykus6geFqaTDjLKikT2kiRDHzIh+zUvUyypuweeuGAOw
	ZyfDflRKwxNDUKZ0M8By9Z1THBIffFrAybe3f8F8vTu+TsusFsyVaA4uQ3ZWFflQjFhmLEyfqz2c+
	Dy2/X+0JgAeJLBvLHz+myiwLF3ou/rYQY59Q8tQaGGE1KA5Pu4DbiSj+aybQehU6U0tRrz+53NCqH
	m6euCHiJML32kEFqtyP+DNYmJ/fu21GLLo8zd0ect9YIMhyujaqyvALD9bybEIOA7KSAMmQUhyNr3
	Zwj9vyDt/PiDhuLPbg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9rF-0000000FaNc-0082;
	Tue, 07 Jul 2026 17:45:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9rD-0000000FaMx-3OVf
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 17:45:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32A32406D9;
	Tue,  7 Jul 2026 17:45:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E241F000E9;
	Tue,  7 Jul 2026 17:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783446319;
	bh=ArZcjnqxXY4lFXsA7ciAkqOLPQkDIBG41FVldd2FM9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nOMe5IQzEGa5vA5o14v7lBTr4l+/MkALdb30ZUydO6V/RZb/g2c4WEIMq4hO4ptZz
	 BaqlwELwS5BFZJnDFxW3tU7BXZ9jgiPb/PiAbl1RHIL+ntYfiQV7on0xvieDJ8VOBv
	 qTKY9I/WtmujKcaaI3BuHSBDGi7JjQiDfYq/lBMvT121Bmjxe2utEwFszGoqJqTlin
	 jd7RfgVc0L+Koz+z9Ri6E3D76BIM6IeEJQ8g8YPIebJx49XFLqpe3krgSXkOd5cv/A
	 CWPoQqaGZVd9bOiDYTLUUdeBABY6rYF1DgD6lTSC1NBQNlck/kw8X3V0IdzTN9YFAE
	 neO4Bl08JEUow==
Date: Tue, 7 Jul 2026 10:45:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Wende Tan <twd2.me@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>, kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: vdso: Do not use LTO for the vDSO
Message-ID: <20260707174513.GA1256227@ax162>
References: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260701-riscv-vdso-lto-v1-0-89db0cd82077@linutronix.de>
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

On Wed, Jul 01, 2026 at 11:21:21AM +0200, Thomas Wei=DFschuh wrote:
> With LTO enabled the compiler assumes that the vDSO functions are not
> used and optimizes them away completely.
> =

> Disable LTO for the vDSO, as these functions are hand-optimized anyways.
> =

> Signed-off-by: Thomas Wei=DFschuh <thomas.weissschuh@linutronix.de>
> ---
> Thomas Wei=DFschuh (2):
>       riscv: vdso: Do not use LTO for the vDSO
>       riscv: vdso: Simplify cflags remove logic

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- =

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
