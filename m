Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BBCFF60C0
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 03:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0w4PDUJ+Wf8m5ODQLouF9oJ7XKS0Z0+RYpTFWXC5jkk=; b=Beis/vz1A4GjoX
	81O2X3B/KI870wXBvpXkANpVha6naRpYB2mwVRYL4WL2cChJBEs0QJG1kc1rK7b88Hd5gCidAeRUN
	EESw3Sz3EVWvO6x52pRpJKS2smSv5fqihnmCz/4bFrPozUvItTTAvCgQN1nYVFvHj9SDc634SM/fv
	Ra595wpQYMiHsv5y9ooliOHNN/93kH9ebvo/n573FHNNPb688FeP9t3T8YM8JnvMSFMex8KmMpIX9
	l/pUOLwoHmmjVW5LYTWp0S30Dra7sON4EKsyE13Z4FUJgNXxQEjOUtPsZJYhiYviDHeXXM1gzoqg8
	nUnR2u/L5cegWC6b9MYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Q94-0000000CFel-0GEA;
	Tue, 31 Mar 2026 03:52:02 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Q90-0000000CFa5-2MkD
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 03:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774929006;
	bh=nfup3iKpYkhK8d+x8uSGvn1MyKxNMlLsAtOxr9MhuK0=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=g+bwdUniqjxkX5n2mcI5Z1Uc4zxeVsuY4lYjcBsdykOLDeZ6TSiTDEOsOKjUaXmpR
	 p7qpyRJZaGfDSv1vDFfKa+Z+wgUmu2meiU13z/ARjH5cqacQqeszVFrpWtx69vTVjV
	 aNTpZ/CD/HDxbcPmRFegN7jZATnGFWA6FBuMzxvA=
X-QQ-mid: esmtpgz10t1774929003t498334ad
X-QQ-Originating-IP: 6kW2nALZDb10PK+zd3IzzRDVIcn4KN8bG8hDGmXBpqc=
Received: from = ( [183.48.246.138])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 11:50:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7101099967736888948
EX-QQ-RecipientCnt: 19
Mime-Version: 1.0
Date: Tue, 31 Mar 2026 11:50:00 +0800
Message-Id: <DHGNTIG3VCU4.M3GUX7KRKY18@linux.spacemit.com>
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Michael Opdenacker"
 <michael.opdenacker@rootcommit.com>, "Guodong Xu" <guodong@riscstar.com>,
 "Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen"
 <cyy@cyyself.name>, <spacemit@lists.linux.dev>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] riscv: dts: spacemit: add DeepComputing FML13V05
 board device tree
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331034423.67142-1-sandie.cao@deepcomputing.io>
 <20260331034616.67183-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260331034616.67183-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NU60Kbs86PFjiLKO5XVzvs/h03bBRxlKaz4zv4+qHvI/NJovBbXpsTFI
	klCXEFC6W4x/AZ2iTRrDyt1+9IhTSMpj01rPhDfC4FiqBU0HrBz2yKDa5MjqzOJ9fHVtbA+
	9eqeY9ucicDbQ0mUyRHZw5dHbFKwX6Kys+fsNsqyvrs8gXqW4MHCC6oe19FDS6f/v14cAMq
	YDNhzJNMc/SgfxU9b+aPLnl1JflCahtFiNfzJ5FUIc1hTQXFSZj3cdT5pjx3wkFQYCx3vPh
	6qkc+FVSWHh2lZH+KAQcthoTKCTm1Q35ymcnddJGqiw61Cjq+2Vvi6MPEQ6p/24kn21ngTu
	WXmnPE+GJMdFV2M7beMmRscsGomWxmwrG37jKwowuPaVkMKbeJFqAGYNHzhLutGtvJY4W1q
	+MTlA4oB5HUScxpOD+YPEOKEbEN28d/pPUlUq8xBue5QzU8iZ30OgzELOYK2av0eOsM29tC
	CI6P8SOQLF4Jg1O9aCZkIEV+n4PgFaYUhRzqUNwsnQDqzplpeON6FEXZx1LwD44koWqKTYd
	q221dzaaAxEnbxGL/NG8Dqo6/RudY4QZ3P4RD3KQ+X1GkidWhcsT/bJkJ4Uk45I53O04aKw
	E3ulfQIOaa9q/cDAPpsPn97tq/4bFDGhQph4CHnedk8oAhazEDtp1m+N9lOuHwUvEszxvKU
	E28hXp8IXb47TrGm2g1yMRnE/BboQ59ERqk2pPSmIjiPQLBwxDaGD9kiReXgAjcrfPrJSEB
	/YGpiImfFgLeHLA+Hm/MLyBEKHZ+oIb/qRy3hNJSXYACToSkQZBybEp36yLv+t0Xv8huDyL
	4Y6kk+LOeybr3stcS7A2rhbnkB7BMRKtd9mQyLScXVr6goUMmn+dpmnnH4BLiya3kmt1sGa
	JHeKSx8gKzTB6zxLhNJ4JBWRQOsq+2UJVo/7lJno4xPtRHFItiPSuLjDUO6LV7+KnTtQzRJ
	65H1ziFSLG9H2Nx5FZatEHjpjj5aYNbjIwl9uWA24zok1Ir+d4CEI1rdUtP7lQeupTtLzPd
	0ZrqxAJ8B36zuzSG9v6uZaweaWihN1Oku+fL/5I5qGXfZbXnuImEVEWSb6h/esH0IZHB8E6
	vtCALlD21is
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_205159_090083_438FAF53 
X-CRM114-Status: UNSURE (   6.09  )
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

On Tue Mar 31, 2026 at 11:46 AM CST, Sandie Cao wrote:
> From: sandiecao <sandie.cao@deepcomputing.io>
>
> The FML13V05 board from DeepComputing incorporates a SpacemiT K3 RISC-V
> SoC.It is a mainboard designed for the Framework Laptop 13 Chassis,
> which has (Framework) SKU FRANHQ0001.
>
> The FML13V05 board features:
> - SpacemiT K3 RISC-V SoC
> - LPDDR5 16GB or 32GB
> - eMMC 32GB ~128GB (Optional)
> - UFS 3.1 256G (Optional)
> - QSPI Flash
> - MicroSD Slot
> - PCIe-based Wi-Fi
> - 4 USB-C Ports
>  - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>  - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>  - Port 3 & 4: USB 3.2 Gen 1
>
> This minimal device tree enables booting into a serial console with UART
> output.
>
> Signed-off-by: sandiecao <sandie.cao@deepcomputing.io>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
