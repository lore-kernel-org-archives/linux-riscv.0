Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64DECD4F3D
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 02:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpRRaPPRinUT91npr+aIrTd+6eSAT6WI7HcyhBWu3fw=; b=zn6aXzQzBJikdH
	oFnA4pBzfggwkNpLv+Zz1na1vCXGtyyxQJJUKm0/2m5kX3Dk4QWyjmKEi40wEYn6mpd2KiwNsTPGG
	5EFOVNUtqPWN/DebjoWhhGwPjEfWjmfERofjXVRpfk2Qhzjn3sQII5nECsO1z5Elu5k0t7WoaAI3I
	PkCeuBd1cdtARZF1zIXPS5EXOKNzOf5csujexOtaYevhV21a7/lI+7BcbzuNG8/t6P6W7I9O7s+1z
	EZ4HZ8/EwpGb2lZ8drC9PbAhQ08n9/sm0RXxK1+jJdLKTu1KCZ7UYqmoPN2JgX3+Hps1y+GuOrI23
	C9lcPluCSzk5wtTzg8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPtDv-00000006TKK-1OqF;
	Thu, 21 May 2026 02:33:23 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPtDr-00000006TJd-2Ywo;
	Thu, 21 May 2026 02:33:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779330781; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eVvDBgigwF2rob/+3k/GEbK0SCWdP80MVE6dQOJ4IS4tT28cVC3ktxk1yhxtjkckfrNyXlISZJdcWVW11Q3cOjL+/b24LQZxd+q/mqXL8eEKZLkceFNCA/yj8Giw/FIJ5AWQ10oMxrP4RC4F/5rYK7vGtelfBNr+Zx1hcmyT3TY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779330781; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=s/PblY7klnzCYy8mFArJf5ReUrplx2JZSs7qfE6ecHg=; 
	b=TjNiWwGJO65U0ZKo+j+F42vQVbyzipNjWM8ijyUKYL8ntGslROkBd4uDfm3QU6VtiUFJwawskZzGJESs2JB5tufMbf5APlLHNYlR3rowJD3FyHoSDKtBdx/IjEiUDShrT+ZFCc40DPMTs+oo/hXG8qsffCO4g4H4pdYTUcquIMg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779330781;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:References:In-Reply-To:Reply-To;
	bh=s/PblY7klnzCYy8mFArJf5ReUrplx2JZSs7qfE6ecHg=;
	b=pNgoulAW1XGya22Rm7gNmMSVWzNG019lRBUFD4i5n8tFmBnUYgZx7B7binQ4iorw
	VWr8olctjak12Oo5Rfj1kmEsEjAq8RAQxpSeaGkCcC3LykkoFxZfkWd8heAJZBtR4xQ
	yTgyCLbfm+BDZ2RUeJyDkIO3j4TSzLzF/VwWGiEs=
Received: by mx.zohomail.com with SMTPS id 1779330779681268.8860829590343;
	Wed, 20 May 2026 19:32:59 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 21 May 2026 10:32:46 +0800
Message-Id: <DIO045II19FT.2YKEZZ74Y5WAL@pigmoral.tech>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "open list:RISC-V ARCHITECTURE"
 <linux-riscv@lists.infradead.org>, "open list:RISC-V SPACEMIT SoC Support"
 <spacemit@lists.linux.dev>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v2 3/5] riscv: dts: spacemit: enable eMMC on Milk-V
 Jupiter
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Aurelien Jarno" <aurelien@aurel32.net>, <linux-kernel@vger.kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
X-Mailer: aerc 0.21.0
References: <20260519041458.3287843-1-aurelien@aurel32.net>
 <20260519041458.3287843-4-aurelien@aurel32.net>
In-Reply-To: <20260519041458.3287843-4-aurelien@aurel32.net>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_193320_030863_F16030B9 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Aurelien,
Thanks for your work.

On Tue May 19, 2026 at 12:12 PM CST, Aurelien Jarno wrote:
> The Milk-V Jupiter board has a connector for an eMMC module. Add an
> entry for it in the device tree and alias it mmc0.
>
> Mark the device as non-removable as eMMC modules have no CD pin and are
> not supposed to be inserted or removed while the system is running. On
> systems without an eMMC module installed, the kernel emits the following
> informational message during boot:
>
> mmc0: SDHCI controller on d4281000.mmc [d4281000.mmc] using ADMA
> mmc0: Failed to initialize a non-removable card
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>

-- 
Best regards,
Junhui Liu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
