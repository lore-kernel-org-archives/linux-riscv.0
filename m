Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF7606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 17:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AGW8xyB0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=yzP910FA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I+UI0uNojL9U2fqnnU19XNiecGaiolG8vTE5kGOQqUA=; b=AGW8xyB0gDVz+H+lnx7sUz25YW
	rusRy8Jgl94ibzZ4n0mInNwPytCkEM1cksBJWrTbISEi7wN02eZYU3Uu785XZwvRzw2bTIzqVbvI/
	CEoousf3OJace6EzjWxNXkjP/9fGQXsL7Dc/fVgKW32Rs0ZHNrj3vH7wkYOgq81fCy3TJgkDHE74l
	QcoaXAynbK4aX10sdFOJ6pujIZGD5Dg68mEmvAbs5vGY94jmxdJP9guqlbPr/GweiT8lgKIZRepiL
	yOIWzWWsk5PzNWxKnfpHN388YqS7cGo6WkJhb4e/ODUfcQH02MVsm4GC7zOjnJMt4xXCjex6DVWX7
	nMPGNCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGo5-0000000Ak4q-3raO;
	Wed, 25 Nov 2026 17:29:21 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWGo3-0000000Ak3M-1Zl9
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 17:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=yrd/T5Z1nZ5j4ICtv7zxxrKmkmhWKnEi2p3IlK1vsdw=; b=yzP910FAxdw0Bm95XXINPjoinf
	DmAWg7phoC706aJL1nxgtfsPqIW65vFYpDXb/3mRiKlWCzjcw8ciLo+CIDw3bVFUfB2skUX9dSbBv
	kHI7u7DmxBSrlITzszVZQfATk2Ncu0DxyMjZ2bF5VaW8Iu9RYDf9U9D2Gt/4G6mF/+MsvagkhAqEv
	R31CJ+zQ3aJt5hksVgepyajB5txeY6/XihN7eLxhBfsISs2GeULpDFHIcJqZgb0rekm1VhY13MPxj
	c058YeI3GBBwz918VSGTxVLKewagQap7nMO3Dqe6bipM63+kx5pN3lQQWYVHZm687ZSzeJADds0Sm
	lMUkVhMQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xWGnd-0000000AANN-3j0f;
	Wed, 25 Nov 2026 18:28:53 +0100
Date: Wed, 25 Nov 2026 18:28:53 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Zixian Zeng <sycamoremoon376@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Message-ID: <awca1TDIKObMIeHE@aurel32.net>
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
 <awS2-clBenE1r1a1@aurel32.net>
 <12933da0-9bc8-4f92-96d4-36c5673d3f5e@gmail.com>
 <awXUSuYOUQMPCl-5@aurel32.net>
 <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANAwSgRf0XpWnyDaoiGySFv3NPKCBYn6BODf1M+P4w58BF-duw@mail.gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_092919_479034_563CA6A6 
X-CRM114-Status: GOOD (  33.21  )
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

On 2026-11-25 13:22, Anand Moon wrote:
> Hi Aurelien,
> 
> On Wed, 25 Nov 2026 at 00:14, Aurelien Jarno <aurelien@aurel32.net> wrote:
> >
> > Hi Zixian,
> >
> > On 2026-11-24 11:31, Zixian Zeng wrote:
> > > Hi Aurelien,
> > >
> > > On 2026/11/24 5:58, Aurelien Jarno wrote:
> > > > Hi,
> > > >
> > > > On 2026-11-23 12:41, Zixian Zeng wrote:
> > > > > The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> > > > > 256 bytes with an 8-byte write page, which can be found in schematic[2].
> > > > > The device tree declares pagesize = <16>, which does not match the
> > > > > eeprom chip datasheet which declares pagesize 8 bytes.
> > > >
> > > > Oops, I am not sure how I got that wrong. Sorry about that.
> >
> > The question of the page size has been raised in the initial review [1],
> > and it seems that the GT24C02 has a 16-byte page size, while the
> > GT24C02B [2] has a 8-byte page size. The BPI-F3 schematics confirms that
> > the B version is used. Sorry about the mistake.
> >
> > > > > EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> > > > > together, based on the chip model shown in the schematic diagram.
> > > >
> > > > The k1-milkv-jupiter board is also affected with the same issue, despite
> > > > using a slightly different EEPROM (24C04).
> > > >
> > >
> > > The GT24C04A EEPROM used on k1-milkv-jupiter board doesn't seem to have
> > > the same issue, which you can find "Page Size: 16 bytes" in datasheet:
> > > https://www.giantec-semi.com/uploads/20220929/GT24C04A.pdf
> >
> > Indeed you are correct, and I confirm that this is the exact version
> > used on the schematics. Therefore there is no need to extend your patch,
> > it can be merged that way.
> >
> > > But I don't have the board, simple test would be appreciated. Perhaps I
> > > should include test steps in the commit message for the next revision.
> >
> > Unfortunately the board has the EEPROM write protection pin connected to
> > VCC, which means the write protection is enabled. Therefore testing is
> > not so easy.
> >
> > Regards
> > Aurelien
> >
> > [1] https://lore.kernel.org/linux-riscv/aNLzRJcKCYOngc7z@aurel32.net/
> > [2] https://www.giantec-semi.com/juchen1123/uploads/pdf/GT24C02_DS_Au.pdf
> >
> Apologies, this is a different issue.
> 
> I am currently working on enabling multi-DTB support in U-Boot SPL
> for SpacemiT K1 boards.
> 
> While investigating the board detection issue, I noticed that the EEPROM
> on my Banana Pi BPI-F3 does not contain a Product Name TLV entry.
> 
> alarm@k1:~$ sudo hexdump -C /sys/bus/i2c/devices/2-0050/eeprom
> 00000000  54 6c 76 49 6e 66 6f 00  01 00 20 24 06 fe fe fe  |TlvInfo... $....|
> 00000010  d5 52 bd 2a 02 00 02 23  0c 39 38 61 39 63 33 61  |.R.*...#.98a9c3a|
> 00000020  32 62 64 34 37 fe 04 3b  e3 ff bd ff ff ff ff ff  |2bd47..;........|
> 00000030  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> *
> 00000100

Yes, I observed the same on my board. It seems the Banana-Pi F3 (or 
probably more the designed it is based on) is the first board that got 
produced and misses that.

> Although the EEPROM is readable, the missing Product Name TLV entry
> explains why read_product_name() returns `-ENOENT` (-2), assuming the
> EEPROM read and validation succeed.
> 
> Consequently, automatic board detection fails, and U-Boot falls back to
> CONFIG_DEFAULT_DEVICE_TREE, which may select an incorrect device
> tree for the target board.

Yes, I think the MusePi Pro is not the good default board. The vendor 
code uses sets DEFAULT_PRODUCT_NAME to "k1-x_deb1" in 
include/configs/k1-x.h, I think the upstream U-Boot should do the same.
I already pointed that out [1].

Regards
Aurelien

[1] https://lore.kernel.org/ahNs0lme0ya2zolV@aurel32.net/

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
