Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A56606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 21:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nkLUkpQq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=Bzeb5ZAI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/uA6cazhbmoS6vh8KpJ389CBWiZvL1XQfdRBHhDHIFE=; b=nkLUkpQqLX1jdfP2PRElct/mSf
	IVR4+7llLzjbG+phojC/TO4FkWNbyC6AlvnKHXyBYYN0O+eJZsPtsHbaHtB+EUcuvF/CGsucYfDXB
	7CAUNXH0QJlh+3mTAekWPPdEfJtSgdjtTmS/uW09aqStiGwU0cTLDEwahmTIK/M5NoNr92TRDVJXi
	J4ZuS8cd0DbPFWmxNXlaKgq3nwUVhNPGTSIqbiDu0lB1cs5T2BynzAONz5QMvQ6W4OOHznQujCaUe
	3fi59SoxxwRR6NPAeqR3SXqE4L61JqyXjgdhqCn6L4t1a2wfYEA1pZ2Hmtw+kw/nXAGN1nfvmgYrX
	CrkHvczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVc3s-000000051v9-0BIw;
	Mon, 23 Nov 2026 21:58:56 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVc3g-000000051ty-082y
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 21:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=HA56YBnBjS6ejjIegWe0iNjtvEk49TWfG37iY7fhSAs=; b=Bzeb5ZAI4Yqkb42m9BOTb1NStq
	HTC5LTHOhHzE2ag7ZZ3wr7VPMM69K4crX6gYwDZfpq+IjhvuAQvHH+sdw20sBjnql8wX76QYFp6ys
	1VwWvOUznFNLYc5811IAoJXjs6qH+Y2SzJmVPKCt6QnoftSwAuExGNiI8H3SsLyNPiZEJMpXH0s2E
	5gPhFW5XNapDa2GpKtQzoKxyjr8B31KjBRMnNUEHq1oaotgPgKmxbnpjKcap4AqZJQp30iz+yRjmL
	s7PK1Z3sw8Ng0GQatB78yyabk7eAKxTL8rHNAj56rqEaa20lFhyPR11+AaMIZNugGf/LnL64Z18Po
	9mxwD+BQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xVc3G-00000007ZxZ-09JF;
	Mon, 23 Nov 2026 22:58:18 +0100
Date: Mon, 23 Nov 2026 22:58:17 +0100
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
Message-ID: <awS2-clBenE1r1a1@aurel32.net>
References: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261123-fix-bpf3-eeprom-v1-1-df8cce6ef2b5@gmail.com>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_135845_265913_9801570E 
X-CRM114-Status: GOOD (  12.00  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 2026-11-23 12:41, Zixian Zeng wrote:
> The bananapi-f3 carries an AT24C02 compatible EEPROM GT24C02B [1]:
> 256 bytes with an 8-byte write page, which can be found in schematic[2].
> The device tree declares pagesize = <16>, which does not match the
> eeprom chip datasheet which declares pagesize 8 bytes.

Oops, I am not sure how I got that wrong. Sorry about that.

> EEPROM pagesize of k1-bananapi-cm6-io[3] and k1-orangepi-rv2[4] changed
> together, based on the chip model shown in the schematic diagram.

The k1-milkv-jupiter board is also affected with the same issue, despite 
using a slightly different EEPROM (24C04).

> The TLV EEPROM on this board holds the base MAC address and the MAC count,
> so a corrupted write leaves both Ethernet ports without a MAC address,
> which is how this was found.
> 
> Link: https://www.giantec-semi.com/uploads/20230414/GT24C02B.pdf [1]
> Link: https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view?usp=sharing [2]
> Link: https://pan.baidu.com/s/13UTY_qM4gGuVxsZ9U7_Xpw?pwd=8888 [3]
> Link: https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR?usp=sharing [4]
> Fixes: bfce75e2345f ("riscv: dts: spacemit: add 24c02 eeprom on BPI-F3")
> Fixes: 46a8c01700ac ("riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board")
> Fixes: ac436e6879f5 ("riscv: dts: spacemit: enable onboard eeprom for OrangePi")
> Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>

Thanks for fixing that.

Reviewed-by: Aurelien Jarno <aurelien@aurel32.net>

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
