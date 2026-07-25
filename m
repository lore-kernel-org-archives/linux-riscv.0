Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF92C531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmuMSknEwnNdnSXvxeFaNpaWKtrRT+VI77T+YU/REd4=; b=VFzGuISmWIOmWu
	nQj73tkr/xbhwz1LEZF2IrKek4YcDNxaT8+UiqHZG/sOvotHk7UL7Jc4QRSv+zl3maxPRhEZICuM4
	SAqONeWtasQ/UjdNgN0Gy/Pv8fcVtnv+GQiL8g6/1kSayAxaaezmKIDKgA2CiBFKmWaUjDJJxd+Bb
	RiUF85/brIL+6IKrfZzDsWP39vsxXDfPAmGzRIShzvc4oMtUKDG+M6zigx9JNAIGwiuqmuHYIKdOO
	mbTlHljoyJCtktXxMW33c5gF4vq4CqH5RLacuwnCjOe2r6puPxe87urOzN1XPURxmVbyLCi0GRwN9
	QKWMas+zHY4qpbDBMyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYYN-00000000DH1-1Qgw;
	Sat, 25 Jul 2026 09:20:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYYL-00000000DGh-2586
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 09:20:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0F66600AD;
	Sat, 25 Jul 2026 09:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558F11F000E9;
	Sat, 25 Jul 2026 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784971216;
	bh=aaDUVqB32MI4QmsAjMF9hCDK2Ml6G6nBK4sVDZs312o=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=at+O6F6thh9JDAut+fw+N+7gfFvcjo1gZfqTqaWsQKfxd1v2ADwP2aYaRHlwpFW0f
	 Us4TytXumHMPea1ylzdlpEiZTHYgoyJ4pAxUQXXbtwBRw4cAnIOl/DmdA3nvgKTCqV
	 0QYXo6RvXWQSMKZoiMsAR/2umZj39aCRlJhLfRRIa3nR+Ul5rZ1wePWSaptBm1hDxu
	 /MgRsjjKCCdkLr8Ws9BT3vkLJ3zLg8A9AHpyV1/fDeuobJvzWv0pv6URJ10tJgJqBI
	 O8Pd3zHczfvXtiAA8Y0xyII1givDObJuu8hTdKyTeMEbKdD8tjeQ+gdibIWn5nTrrA
	 7jNmJ6o8Ntkpg==
Date: Sat, 25 Jul 2026 09:20:13 +0000
From: Yixun Lan <dlan@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
Message-ID: <20260725092013-GKB77545@kernel.org>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
 <allMTB6R7eHf_UZO@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <allMTB6R7eHf_UZO@aurel32.net>
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

Hi Aurelien,

On 23:25 Thu 16 Jul     , Aurelien Jarno wrote:
> On 2026-07-02 02:31, Yixun Lan wrote:
> > SpacemiT K3 SoC consist of UFS (Universal Flash Storage) Host Controller
> > which has features compatible with JEDEC UFS 2.2, MIPI UniPro v1.61 and
> > M-PHY v3.0 standard.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  drivers/ufs/host/Kconfig        |  12 +
> >  drivers/ufs/host/Makefile       |   1 +
> >  drivers/ufs/host/ufs-spacemit.c | 931 ++++++++++++++++++++++++++++++++++++++++
> >  drivers/ufs/host/ufs-spacemit.h |  90 ++++
> >  4 files changed, 1034 insertions(+)
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>
> 

Thanks for testing, but FYI, I'm not adding your T-B due to massive changes in V2..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
