Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C4FFB44C8
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 07:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ag1YjMK88Qiz7MAgzbpgwceTthb6Wz2wTFZnIPQ3sX4=; b=gXE4eLWN2LjWsT
	rXJvm3xvXdtLGEH/LndUVcDbo2TqrgIGgvlDF3M7TB3qvDs5xKgB0JQkDZKRi8L5E+Nfu+KFx8OOb
	wGgqJn1eyYEZk2R2JKWoNfPP9sjShnkOIbQU5mAjyksrWfPAmZeZYAH9J/R+e+aAH2IQ6LNE8Iajj
	Tsr2v6CSm+dm8By7/hu98DlLNSNiMU0HWMveHbMCFTDhZWh2trR5PhDYnq3swy7M+4qRJDJaD/jN6
	+nY6PA4Spf/m1Xfp8i7Myx73EHtOXsj0ogC58eIoCuWEJnbLZQEDsY0HeDAger2a2FpUIhGr6v2hp
	5Bfkp1zYj37yedNcxyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBB1-0000000CozP-0jik;
	Fri, 24 Apr 2026 07:42:15 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBAy-0000000CoyN-0Fj2
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 07:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777016475;
	bh=PyZmHuWfKfnxFQXFKX9eFlxb2Dgp9LXI++/EQXWEc0o=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=zBrreF2knd8Mk0g+cNETAvLG3GrcpD995sxKqqHZwF4WYen5oFxRKAncWMRKAr8o7
	 Y6H96ni1qjWEwULMIWIvzVBtVpB87To1qdOoAJNHtua5iRja5L6GRATKp4gE8DhW6t
	 1wL/4QrKgex7ITyxyGsROoW80TUG8QAv6nYtwK0o=
X-QQ-mid: esmtpsz17t1777016471tb355b527
X-QQ-Originating-IP: I3YscDtf5R4mtzw4gOyfBpObXsnW5epaXi8nhYV/Te0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Apr 2026 15:41:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11335633746206723623
EX-QQ-RecipientCnt: 18
Mime-Version: 1.0
Date: Fri, 24 Apr 2026 15:41:08 +0800
Message-Id: <DI17RJXO783M.HVG11THU3E9T@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Michael
 Opdenacker" <michael.opdenacker@rootcommit.com>, "Alexandre Ghiti"
 <alex@ghiti.fr>, "Guodong Xu" <guodong@riscstar.com>, "Hendrik Hamerlinck"
 <hendrik.hamerlinck@hammernet.be>, "Yangyu Chen" <cyy@cyyself.name>,
 <spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] Add DeepComputing FML13V05 board dts
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N5QhsOwzP0INht7wOnLC8AfmUBAdfueamrZ8tHkDp+y1NEONmgTJ6gl4
	XfNK2H+DKX9TNB2BMYHxcrbd3w8WkoTdHS8sPbEG9bBsh+Sk5XHVD9iugcEzw/Dagoq2aEc
	KkkQ15v9bUFPtV5jHjZAQYP+rkoj5zl+6bW0EAcK74v/whRMzLa0tHwAhCFUPOM9DB2uQ4l
	wGmfQQ26fNUVD9GOJsNj69J0A1ho1BIhJCWGZCmZAu+zJ7WKqJqf4ET/Pnysrdk0eDXgPu7
	mrUAu2hAIOofpeis0UBSUH8YekYvV4lVAtjA/Kw8HWwWv2NzpomiScwuebjtJHiITFssfmY
	s2ZexsrVYOY/YRFc3ZNQ6/LNvdAgQoz511hwRIG81udwyuAUYehqxZSO0wxm5GqtifTF2+5
	gf88pven6IQvWiHswqUjMDjlG9FnVoGVElPNkjrneuKU0te5tY1rjIZzNp9n/62e+5GtDpN
	9xavp29ewO38K/SEGLOQiFo4w/6TzAYVhsekE6JMoXIfCl04Vd4MikhkCNlxfuk1Ka24ZhR
	n9vJwG20IS1bt+06VXfeBMZiPmAUXYguin1tWMTOiz0H5Unlm01kgS6KRCkP3RYPVaC7AdI
	JMqcLZcoWOBtscF6W0boa+r2QruiHMClwzUc91V8OEG8JMVqsh1GZEcyC4gr22MAfEK76AD
	P6HS44ReRuMGd0NJbMmYgFmgtkIf8pQR40Axfka7wQVad7rbGO3sj5tUId/fKav5Ly4Pwaj
	zzg9vaRiAwMtDXWPgFwWlZy/r3BMj5fFzWKFVc2dcH2Ms5N8Z6ahMGcKeeVUGiDjBEFGsRZ
	6NcCjQK9994Wv/oE7W/t/OO/Igw1FftQyMczjXs5cCLylsVIx3prJJP0w8gDY8ONWEzzEe7
	FU5KuTY2NHphKUlNFMLfQ4cEOnhFPKOnFPSfP4fUvDMFoMGhaLTM7Gk0tB/JzIELpSe6WJd
	Nd6khQbX8TpIo1NTLlMjCSxSAl6IKIP2Mvqxh0aIwKle3caXLL4ibO8KfPzexOnWIxh1S/f
	M7gDaI2rxJlaVp5EVV916tpwPO3TfICyyOFyIdEM3b3iogskOvtLQoR9QRdqo=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_004212_517523_2D1D5995 
X-CRM114-Status: UNSURE (   4.97  )
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

On Tue Apr 21, 2026 at 2:40 PM CST, Sandie Cao wrote:
> This series updates Device Tree related files to introduce the
> FML13V05 board from DeepComputing, which incorporates a Spacemit
> K3 SoC.  This board is designed for use on the Framework Laptop 13
> Chassis, which has (Framework) SKU FRANHQ0001.
>
> The series is rebased on next-20260420.
>
Thanks.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
