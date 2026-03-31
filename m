Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB354FF60CF
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 07:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcHQxkaUhWjbrl/BZpWYSieJqWLTK7B6li80EQ/4ZEs=; b=VWXFvmN31YS2DP
	AFlATHOjzyNlDnoj70dHeEqBm329FOxwKZ2+xFCo5x7Fcbjds1U6YiugU+0+dukdg/V139gOOCaAY
	u1bQpLuMo5MklSIMuRhH0aNJTPgYIoR/9auSqC9SW27bMfM8w7+XkJBb7WheyadyQSy/EbyO4qg3Z
	LfdX7SHFQTCC4uTdtXM///4ZvCVb467O/1aonAl3dkR0lvk4Plrd5Uzm6QDRlTvMR6SVndl6ihwY1
	CyBBEvr8PGZPi/ZzUPek+bTfKUQ02petfdaKysJ2pEdEThgWP2GiXZeAUnpiUpacTIK6W3JWAzEAy
	zqWyU7yv0rd3bTSoobow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TLK-0000000CSYB-3lhp;
	Tue, 31 Mar 2026 07:16:54 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TLH-0000000CSV0-2ngX
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 07:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774941328;
	bh=FMUkMUxgtezj8otmGMF92Nid+Gsbj62Jf5IU2WL2R/w=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=kkbKps3Qoh3s1fR4xyEgZwnUnTGH7mXhT59kPp7JVxRzHMTXfceDidZ4huJI3zE7A
	 iWRu5PRFerGdngsw72YJ5x408nYZSICeNm2Vk1EWbGw6yjSOOpaCgHz6rei6XcEVbP
	 u7+WaYLaGCyTjSl1vsf55HygvBxEWpZr9DUds/Bw=
X-QQ-mid: esmtpsz16t1774941326tf5a2ee7d
X-QQ-Originating-IP: Cm+r6MKhV4qTjGje/QFxDUQM2Xm3nEaCpKy58BmZF+c=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 15:15:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16497226984384082408
EX-QQ-RecipientCnt: 19
Mime-Version: 1.0
Date: Tue, 31 Mar 2026 15:15:23 +0800
Message-Id: <DHGS6RDFCOIN.14KI92Y8TSNRS@linux.spacemit.com>
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
Subject: Re: [PATCH v2 0/2] Add DeepComputing FML13V05 board dts
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Odky5wNUcHo/L8YYDQoTOeN8D4XlqkjXcJRUVbjyNSwRgWTruDMkCjIz
	J1tpPX5Jq7/VeuCzMpt0Ys0EbCkjjogmJ4UPwDIUBs4/bd995hw9tFGrTDwue0cp+8roMDv
	+h4Jp2GpxDie2JzeLshR51YR25gnAIAdoBqojJG1VnSKhEapRRf2oOnTBRckx0cDU+RsT1A
	OuGTTHmtoQ3jBB1dXL2l2P6DQDAn/uHyhQPao502cizx5njC252PEApPouoJ3Idc6Ba9/c8
	nSkZC9SLKQOVLEoFY9UnSoW/jLYTbv6WRnb8UIfGrBu47VJlUO06X498lmn9Vh/ZOuFna5h
	jCqGTln36yigoUA9BKLJBUn+YX73tTJiOIGKbDvAkbD3GKlI+fs7rOMiWn1gqDUZhcAagzr
	7/y/6X0gCsQIX0D5RbKPOzE2boQBuaQMyMMEYvWmeFQKU7wUrcUA80BkEsjV1mxi31B0Y1b
	VNPgcwaKuyBrdWgE58oWMy/JBCwy6TXy5XUMPd5ZGM8jc3OB5gBJdNZbFuEftj8c2O5YbDL
	fHVSiR1fmUg3dhs4cqZLlDOMwJ8X6DamhYiSHXSXIkdLlTINrnQrxtK2gNb/da+4gWfh0Jm
	TXeePnbqZPEsfkvnFv7DrBaQeM+lSUiCQpEX4Jbv9axW2M+lkYzVq6WORwyI8ode3e7kLSM
	Dtlu7JsZzP3gTbM8qUjP5Y/pAY5X/JdSnLzcQAXzR+puxzDhXM87uuO+5Ek9P8ENKhX4O1L
	akzEPtNg1ezIBCjUktld0+KTW7AfCdBdoEkscVeojOlAyFHwcDI4zXhXB55nesIJOlCJ1BI
	OwjeJqfhI6kaBt0YmOBWEhAD8DsmYjxFsC06YQKp9gzFOL95r5YDYBye00+IR/s5991V/g3
	l4b4pkm+y4b97h7Bmbzb1LRqqX57W69fPlE7Kn+YMS4sqo5DQ4Sh5AATZOploI17Oo3HIek
	Q+RJuDXfudr0VQaNuQx/Z7Hl38mS1iN1iKkJbZuuuv19LL7rhuKNEY6GaIH6t8WDJyIDhyC
	n4H6LhLAwg46BUZOAm01SJteG9gVakJ/R1a9VSW48QG1NJOg2EMyC2+9GPitoKLPUfFmLSR
	Ic0QL3vm0Y1Xh5Iy2QqqR8=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_001652_826550_06937F59 
X-CRM114-Status: UNSURE (   7.30  )
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

Hi Sandie,

On Tue Mar 31, 2026 at 3:11 PM CST, Sandie Cao wrote:
> This series updates Device Tree related files to introduce the
> FML13V05 board from DeepComputing, which incorporates a Spacemit
> K3 SoC.  This board is designed for use on the Framework Laptop 13
> Chassis, which has (Framework) SKU FRANHQ0001.
>
> The series is based on riscv-dt-for-next.
>
> v2:
> - Patch 1:
>    Use formal format user name.
> - Patch 2:
>    Use formal format user name.
>    Add Reviewed-by from Troy Mitchell.
>
> Link to v1: https://lore.kernel.org/all/20260331034423.67142-1-sandie.cao@deepcomputing.io/
Please slow down a bit. Sending a v2 immediately after a single review doesn't
give others (especially those in different time zones) a chance to look at v1.
It's better to wait a day or two to collect more feedback before sending a new iteration

                        - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
