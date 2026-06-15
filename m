Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A742CD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 06:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4JeyUDFEI5XRiTpA3OUQu8u/95mqmnRLSTp+LvlDzI=; b=OzBDzQGbVHG6aI
	rskSOKNDoSwEFiN7x1AfmH1DVui/dQwRvOqHNwlvZvHDIvOx56TPx32kpkm6tfd6v7XLlPvaUOVvr
	FUHOUWdzv8bO7nHGBngV/PFIRQ2isA7IiSz5r7I/SdwR0FtOwaiQbuZoQVSZ/6/CY/wDaY0BtUZNs
	EgExSHf/oAsZI3EFpsBIARtrRJXyfQmp16ydnGR/NAOgiwlH2IfF/N8y/ySvwSrSuiJ1RKVdEPnJV
	fHzaHZP4mjcCzkTWTaQ0bXtJMxSySz8sObKF6agEfv7p3LJu/Cdb+Bo9smbI0HOqAEmk9ySudHWbB
	w0ski4t8pECvEkxOhruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0Yf-0000000DfvT-3F36;
	Mon, 15 Jun 2026 06:12:29 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ0Yb-0000000Dfuu-3YvZ
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 06:12:27 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gf0C6218Bz9ts6;
	Mon, 15 Jun 2026 08:12:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781503938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VZ4zClhJzZrNLtXfhTdULU67m3ZVri2koYZWW3a9LM=;
	b=phzulaZ+JyLogfpRQ7HBGAPyUMuCFbqDHsgS63IH86zVwE8JMmlOMK4nk7h97gqkdCHKxr
	85o+QvnD4AhHyhIbYJI3x805Kj7mVedsv5/10NsrzmctqpG06QaWDs0AMBbKod33GbqWbE
	CMXEgj7yXNvTP3OLaJ50rO2esiTi86Z2Gu3ousMffnuP7WqudyJYpUgPpCkSPRhJNNMFna
	/9YC0E+9+5uITErC3cZ2r6T0inWTtmPpHHPtC390U8Av2ISJnVBDdxOijDUBH066+ifG1x
	WV14TL+3PwH/B6+X927t8quPY+Yrj3EBRgDeEMCt9taYl+e2NHF5SfuJth5Bug==
Mime-Version: 1.0
Date: Mon, 15 Jun 2026 14:12:06 +0800
Message-Id: <DJ9EFPG561VZ.1WGRYYHJ2W9J9@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan" <dlan@kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
From: "Shuwei Wu" <shuwei.wu@mailbox.org>
To: "Viresh Kumar" <viresh.kumar@linaro.org>
References: <20260612-shadow-deps-v3-0-2f3ba88611ff@mailbox.org>
 <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
 <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
In-Reply-To: <bd4s2icqgusnuujvrpoag4cniy3g2e4bumecqxt5yffl77aqpq@kxg4dj4c2wk3>
X-MBO-RS-ID: c7b5cf38a87e3ca26a7
X-MBO-RS-META: zjp4t73kp1bk1dehp139gn986jjq6dpj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_231226_036852_3E8CA129 
X-CRM114-Status: GOOD (  10.67  )
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

Hi Viresh,

Thanks for your reply.

On Mon Jun 15, 2026 at 1:24 PM CST, Viresh Kumar wrote:
> On 12-06-26, 17:51, Shuwei Wu wrote:
>> K1 has two CPU cluster clocks but one shared CPU voltage rail. Use one
>> cpufreq policy for all CPUs, let the OPP core handle the shared regulator
>> and the cluster0 clock, and update the cluster1 clock explicitly.
>
> If the clusters can do DVFS individually (as they have separate clocks), this
> should be represented as two separate policies. Isn't it ?

The clusters have separate clocks, but they share the same voltage supply.[1]
So two independent policies would be unsafe: one policy could lower the shared
voltage while the other cluster is still running at a higher frequency.
This means they can't use different policies.

From a hardware perspective, the eight cores of the K1 are homogeneous,
so using the same policy for them is relatively reasonable.

I used a K1-specific driver because cpufreq-dt only manages one CPU clock
through the CPU device used for the OPP transition.
On K1, the policy needs to control two independent cluster clocks and one shared
regulator, so the driver has to update the second cluster clock explicitly and
keep the ordering safe: raise voltage before raising either cluster, and lower
both cluster clocks before lowering the shared voltage.

[1] https://lore.kernel.org/spacemit/aeaXszeaE62rM6BJ@aurel32.net/

-- 
Best regards,
Shuwei Wu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
