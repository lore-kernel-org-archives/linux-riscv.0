Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03C606A339
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WWJ5ETEs;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mIco+KWB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/UMiVmj59mMLKfOu1V5i1vLDj5O35x2bXRs47iTIiHg=; b=WWJ5ETEsDF6fcTpEZamohhfw2i
	+bilIxuubBWO62lXyaDR8b9BvLQQWBSj0S6W4wXgtSgHib2JGl0QCsrqsTd7+zhNthYGCXkF/yIcL
	tbcg6PwYQ7T6SkzbnKRJ0rmkCL24LRfyiYWmOGOxiDVQ+NMGt8uLcGJeflLl4P/VbyKeOB0/x9OxU
	BK8V2W+Qf5ah6b2oxOBjyt0M27V3sKV6KXCXr5/4H1IrNsLgNO2T18IX+FQsh9GtfEPXtbo6ijFCF
	NytnwXqFxAJ/Rhi5F5jcHcirZ32IXN07SKAAvUojZMoBIUCnIpJlfi6i86kNkGIm0OEIO+0rRndBX
	qmUXukyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2Ob-0000000AATD-2IcA;
	Thu, 05 Nov 2026 18:41:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2OB-0000000AALh-0qk9
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 18:40:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F0281433E3;
	Thu,  5 Nov 2026 18:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8013F1F000C1;
	Thu,  5 Nov 2026 18:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793904042;
	bh=mrPZKSww78CDEYriyViFtkzmvPXUmkfVcHviTAAFbSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mIco+KWBQtZn/2+Ylet//LqsWczzhlOZomRiI2LpIHZJJ6GPSbMN3VrA+4GsWiOjP
	 DTefVeYO+vOt0oX7+UKiHR7UPvDyVn2j0VLV+cr0nqT0kANak0XZ+F9J1oeBqzFzW7
	 AD5l3l2XONsnJes0BuTj0msmUcsGwo13np2CjNSsjgs2Rn4bP0rx9ODyXjQZOSNSqS
	 n+uP8CanP5yBNA5mu58RK9qyc9D0p9vmrFSmdKSHROFRIAw4Uiq0NfHZQL0A3PqiBI
	 mDD2EvsYBb1gG6r7daXML1EoXyXhcVejztiSvtd6e6s2QJyJSjY6kXbYMZgQB+9R3r
	 RwFLIkJ1GbdeA==
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brian Masney <bmasney@redhat.com>,
	Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	samuel.holland@sifive.com,
	domibel@debian.org,
	panchuang@vivo.com,
	trivial@kernel.org
Subject: Re: [PATCH] cache: sifive: Add bounds check for interrupt count in probe
Date: Thu,  5 Nov 2026 18:39:45 +0000
Message-ID: <179390394386.1477457.13551015598281475758.b4-ty@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029064137.569-1-zhangjiao2@cmss.chinamobile.com>
References: <20261029064137.569-1-zhangjiao2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=782; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=N1v/Z75LuaIRQEGlixlkdCi8GYwdg/qEI2roVFh8XyQ=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlvzuZy7Jiw8uljAwkdKW3Vj6vCfe5t37uTW+J0prt2t meQ5tbpHaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIuSPDHz6Or7yVIfd8vWTZ vtgqMz7YV/JFpGzz8lKpE6sj5jd9W8HwT9PFy28Rr4Dw3q9OAYafni5cyLOYVTxjyszLXYxBLVK KDAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 29 Oct 2026 14:41:36 +0800, zhangjiao2 wrote:
> The sifive_ccache_probe() function uses platform_irq_count() to
> determine the number of interrupts and then iterates over them,
> storing each IRQ number into the global g_irq[] array which has
> a fixed size of SIFIVE_CCACHE_MAX_ECCINTR (4).
> 
> If the device tree defines more than 4 interrupts for the cache
> controller, the loop writes past the end of g_irq[], causing a
> buffer overflow in kernel BSS memory. This could corrupt adjacent
> global variables and potentially be exploited for privilege
> escalation.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] cache: sifive: Add bounds check for interrupt count in probe
      https://git.kernel.org/conor/c/56ca3e2f00b6

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
