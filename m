Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB60A606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 18:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qLN1dySF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=qlZ7bc5q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y/KjSosw298tmw80YhUSDGJEpO536pcn+WTjAMZttUo=; b=qLN1dySFujOMdVZpu79aEbJsQ/
	VsFw9Ympv1FyNLwZoGxj4ymCPt5YNTVnUD/MF1OYSl4MgEdFTXrKFjSE1+531wPGyjM6sAfOiWbZQ
	5TsKprSGVr3pkDYSRQIXrnGcF6PcMJR6eLrIjSZqiOB+0jWhrs6BjNrB1igISFpJxpLChkPVEzaP1
	sizrqy7PgTWafzydnuT8UcLduzGaYkylem62pM0jjm+e7AuY0UIrFhCQuHeYnnZKpg6+3hVNw7+qD
	Tj2jqcE22aywkHm/erLGJ2xdgvR7rWL2mvlZTwXs6EvTAsPMw0hEy5kTBlEc7wAjkT/43xH9wNVhU
	1l6t+F9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVv3d-00000007TSf-0saC;
	Tue, 24 Nov 2026 18:15:57 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVv3a-00000007TRd-3KpP
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 18:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=6G63QTH0P52Wm7LZTOCz21z0QIqu9cIv0849Yq8dU8I=; b=qlZ7bc5q1QghNKdJi28KgFaO9k
	MWOgLlFEXe0+HPmxZakPl6vf2voPzwX25VWOHTTcMbUjv8u3Jlzv3qK33mPLQiR4PAejpFoho1R0y
	W5Lmmaz48/XNvGtAAwJ/nq4Ne5zTJ0T49M5Hm2oXWj/fLgBL+AD7sCZnkUoNSXu2c5npMdaJZQwKx
	zRQqzVhotSuuW7xlu7tUN4RXZEelWd069rkZwhFr+Af2A5PE9nFOdQe2r3ei++rkKiRNvztOM0HnM
	hnqryY+ukPCdbQB6MC5EFE9QakKLzRjrwi7e0/oYdHBo2mjswuKcmf3WCiysutn9lbsc7yLQMhhzA
	h3Sww9jw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xVv3K-00000008lu6-2KEX;
	Tue, 24 Nov 2026 19:15:38 +0100
Date: Tue, 24 Nov 2026 19:15:38 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] riscv: dts: spacemit: k1: fix the EEPROM page size
Message-ID: <awXUSuYOUQMPCl-5@aurel32.net>
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net>
 <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_101554_835992_0B95E796 
X-CRM114-Status: GOOD (  20.49  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Zixian,

On 2026-11-24 11:31, Zixian Zeng wrote:
> Hi Aurelien,
> 
> On 2026/11/24 5:58, Aurelien Jarno wrote:
> > Hi,
> > 
> > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> > > 256 bytes with an 8-byte write page, which can be found in schematic[2].
> > > The device tree declares pagesize = <16>, which does not match the
> > > eeprom chip datasheet which declares pagesize 8 bytes.
> > 
> > Oops, I am not sure how I got that wrong. Sorry about that.

The question of the page size has been raised in the initial review [1], 
and it seems that the GT24C02 has a 16-byte page size, while the 
GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confirms that 
the B version is used. Sorry about the mistake.

> > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> > > together, based on the chip model shown in the schematic diagram.
> > 
> > The k1-milkv-jupiter board is also affected with the same issue, despite
> > using a slightly different EEPROM (24C04).
> > 
> 
> The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to have
> the same issue, which you can find "Page Size: 16 bytes" in datasheet:
> https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf

Indeed you are correct, and I confirm that this is the exact version 
used on the schematics. Therefore there is no need to extend your patch, 
it can be merged that way.

> But I don't have the board, simple test would be appreciated. Perhaps I
> should include test steps in the commit message for the next revision.

Unfortunately the board has the EEPROM write protection pin connected to 
VCC, which means the write protection is enabled. Therefore testing is 
not so easy.

Regards
Aurelien

[1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.net/ 
[2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_Au.pdf

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
