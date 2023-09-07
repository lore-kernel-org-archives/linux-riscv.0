Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64214EE14A9
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 01:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-ID:Date
	:Subject:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Ja2hU9yP9JDI6GYuPyvs4Qxy7A5t1oORF7CAPydejE=; b=IxDumXKg+P2Bep
	akHjqHjtQODEvY9NwKY1YiAClPAty8ZSr4TQpoBXMfzxSxTkUz6RkCyzC0s0pc2fJIw/SKEOfe4qu
	XussbL/5/bsPeh4enNrk2NgUn/PjWzDndGwMkp4IVf0eyu4et7ZUEHpAuyAsdj888UGDDFrW0XLfM
	jFfTULUNoEZ0u02TDielSmRFNgFkZTH3jnbPcmi7igRIy+90ubDc46tImFZvM7LZd3soQaaDj3aa/
	+d4xdM28djfAR2mszY81uhooKde01MuH3ljAF6MtTXX/ag3EMHjDCsbuvBmb926Rg7Q8r2SYn5cb0
	vFRQ6fFFSlwPjZ71LDFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe46N-00B9Xw-0I;
	Thu, 07 Sep 2023 01:46:35 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe46J-00B9X4-15
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 01:46:33 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20230907014620epoutp01b34b8eaa3a2302ce5f6c3b0e573dac88~CepLHjqb50155701557epoutp01K
	for <linux-riscv@lists.infradead.org>; Thu,  7 Sep 2023 01:46:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20230907014620epoutp01b34b8eaa3a2302ce5f6c3b0e573dac88~CepLHjqb50155701557epoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1694051180;
	bh=OkuoPtTpHJVB2fCg6+nOQpQ3udhh1o1CmNxCcKdiJLg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=D827dadAG2MhEI1XXXvNOEaeFdYQjom/x6ehUVVTR4TvL5rJsdxWjDRo6AbeVS7PW
	 lNYfC56oDICyIjtm+5t+kjM95i0pyHr8AjdonGTAri4n2dl+HlCjW35jPbPiSqubVv
	 TYz/HVHkmNEXc2NtFhthcZuY9iOb6NUuRaysRi/c=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20230907014620epcas1p4c9f7f4f01a227409b1dfaf6d9322542f~CepKqLWIW1550515505epcas1p4X;
	Thu,  7 Sep 2023 01:46:20 +0000 (GMT)
Received: from epsmgec1p1.samsung.com (unknown [182.195.38.237]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Rh2CH1WS7z4x9QH; Thu,  7 Sep
	2023 01:46:19 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmgec1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	02.FF.09647.B6B29F46; Thu,  7 Sep 2023 10:46:19 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230907014618epcas1p17b3301ecfe2bd09f105e905dfb9123b0~CepJRjORj1677416774epcas1p17;
	Thu,  7 Sep 2023 01:46:18 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230907014618epsmtrp17856d09f45545919c829ce4e598640b1~CepJQyoXm1887018870epsmtrp1Z;
	Thu,  7 Sep 2023 01:46:18 +0000 (GMT)
X-AuditID: b6c32a36-0d9ff700000025af-25-64f92b6b02c4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	C8.D4.08649.A6B29F46; Thu,  7 Sep 2023 10:46:18 +0900 (KST)
Received: from kson001 (unknown [10.102.7.58]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20230907014618epsmtip10aef9b5c4390bfa27ac9cfea01612cf6~CepI7sSey0225602256epsmtip1p;
	Thu,  7 Sep 2023 01:46:18 +0000 (GMT)
From: "Kwanghoon Son" <k.son@samsung.com>
To: "'Philipp Zabel'" <p.zabel@pengutronix.de>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<jszhang@kernel.org>, <guoren@kernel.org>, <wefu@redhat.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<inki.dae@samsung.com>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
In-Reply-To: <a0894d3dece496f6d2d8bf4e5379794369d48a9e.camel@pengutronix.de>
Subject: RE: [RFC PATCH 0/3] Introduce reset driver for T-HEAD th1520 SoC
Date: Thu, 7 Sep 2023 10:46:18 +0900
Message-ID: <000701d9e12d$18774d70$4965e850$@samsung.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGu9iCUenuWNo4+XXoKLIyFFtBzUQIKln6jAmvpzC+wQLeEMA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHJsWRmVeSWpSXmKPExsWy7bCmgW629s8UgwOH2C22/p7FbrFm7zkm
	i/lHzrFavNjbyGIx6f4EFovmY+vZLPpePGS2uLxrDpvFts8tbBZ3751gsXh5uYfZom0Wv0Xr
	3iPsFi37p7A48Hm8efmSxeNwxxd2j02rOtk87lzbw+axeUm9R/9fA4/3+66yefRtWcXocan5
	OrvH501yAVxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6
	bpk5QPcrKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgpMC/SKE3OLS/PS9fJSS6wM
	DQyMTIEKE7IzLu/ayVhwkaXi1+8/jA2MV5m7GDk5JARMJKbtfMPSxcjFISSwg1Hi5fa5zBDO
	J0aJ2T+WglUJCXxjlPi3UBWmY9LsKWwQRXsZJVau+ABV9JhR4vjcVBCbTUBTYuG534wgtojA
	SiaJHW8zQGxmgVSJo5fnsYHYnAI+Eh0/GsF6hQU8JTaunAsWZxFQkXi/7ixYL6+ApcSX201M
	ELagxMmZT1gg5shLbH87B+oFBYmfT5exQuxyktjw7zUzRI2IxOzONrBvJAQ+cEicuP2cBaLB
	ReLbw61sELawxKvjW9ghbCmJl/1tUHa2xNGPe6FqSiSuz1rECmEbS+xfOhnoIA6gBZoS63fp
	Q4QVJXb+nssIsZdP4t3XHlaQEgkBXomONiEIU17iVmc5RLWoxJmnH9kmMCrNQvLYLCSPzULy
	wCyEXQsYWVYxiqUWFOempxYbFhjBozo5P3cTIzhha5ntYJz09oPeIUYmDsZDjBIczEoivO/k
	v6UI8aYkVlalFuXHF5XmpBYfYjQFBvVEZinR5HxgzsgriTc0sTQwMTMyNrEwNDNUEued87g3
	RUggPbEkNTs1tSC1CKaPiYNTqoHJdzZ/30abHQ9LdYvYOZdEvouf6OW5zLFZ/0kWl/m003IR
	14rfCmjEvnoxWyurfPK9TZe7qvfovbEyM1uv/GRhvGrtL8FnLzK/p/94+WRbhlWVZ5Xv/2PZ
	szPtWFuCJFlZ3A85TVXSuPwoeVbo5xt7Cr408jKutQ0+Ht4QstuxvL022k0mTPSq1n3WybHX
	Tcxq2ZZcnnTW3/qGU9rKpV+1E7cXzWE5lr5tVk5K3f+eyR02zP2iWdHywv9XNU7V3Jy4fEPI
	2+zaFWvZDtwKvP9j7fPAIm1LlwnXpt2dtbRkm1csh8Ldblt93uVt89/4iK9ycizlYfO4YCT+
	8vuKSpWsm5bMOy49Fl/9OuTl0Y1KLMUZiYZazEXFiQBsT+oeYQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRmVeSWpSXmKPExsWy7bCSnG6W9s8Ug9uPFS22/p7FbrFm7zkm
	i/lHzrFavNjbyGIx6f4EFovmY+vZLPpePGS2uLxrDpvFts8tbBZ3751gsXh5uYfZom0Wv0Xr
	3iPsFi37p7A48Hm8efmSxeNwxxd2j02rOtk87lzbw+axeUm9R/9fA4/3+66yefRtWcXocan5
	OrvH501yAVxRXDYpqTmZZalF+nYJXBmXd+1kLLjIUvHr9x/GBsarzF2MnBwSAiYSk2ZPYeti
	5OIQEtjNKPG08Q4TREJUouNyI2MXIweQLSxx+HAxSFhI4CGjxL/TIiA2m4CmxMJzvxlBekUE
	tjJJvJ6xFmwos0C6xK3XZ1ghhp5ilHi24RIjSIJTwEei40cjWJGwgKfExpVz2UBsFgEViffr
	zoLV8ApYSny53cQEYQtKnJz5hAViqLZE78NWRghbXmL72zlQHyhI/Hy6jBXEFhFwktjw7zXU
	ESISszvbmCcwCs9CMmoWklGzkIyahaRlASPLKkbJ1ILi3PTcZMMCw7zUcr3ixNzi0rx0veT8
	3E2M4AjW0tjBeG/+P71DjEwcjIcYJTiYlUR438l/SxHiTUmsrEotyo8vKs1JLT7EKM3BoiTO
	azhjdoqQQHpiSWp2ampBahFMlomDU6qByXH+qRWtrXqFouV9fZUXNyxMajCZMn2G7Ty1zFKu
	Q9czrixal7Vv7bk7URICmydeOMg2w0S9drK2WdjqHx+K5efdEBDS/f5w6oqJrflTi/y+fWjb
	sHvmjtXN/PsevPSzjcw7tMZky4trH+f5uTDYPG5Pu6IucP7N3Be/TG5qVB8XbXy9dVV3cMC1
	K5+eBFkxu67h3v6983OFw/HtdU8f+b2YvtwwaWrW/l/8C2/EN968FuBw7GKSTzXDQl+TyVt/
	eU8VF/V1mpNTdE3LUfINY8vFz0Lp+97sFo97Pe3vNtEpeRPVaz6Y1iV9sCoqOLhBj53h9AbJ
	b7zTnObpz86s+/C54XV78AwnG7mWRb9jppsosRRnJBpqMRcVJwIAws2zQk8DAAA=
X-CMS-MailID: 20230907014618epcas1p17b3301ecfe2bd09f105e905dfb9123b0
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230904042603epcas1p40f732a0ac7871371126d229945cc0849
References: <CGME20230904042603epcas1p40f732a0ac7871371126d229945cc0849@epcas1p4.samsung.com>
	<20230904042559.2322997-1-k.son@samsung.com>
	<a0894d3dece496f6d2d8bf4e5379794369d48a9e.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_184631_719337_28C85531 
X-CRM114-Status: GOOD (  16.81  )
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

> what is meant by "initial support"? Are there just more resets than the
> two watchdog resets, or is there other functionality that might require
> describing in the device tree? Is the dt-binding document complete?
> Is this the only reset controller on TH1520? In the thead-kernel.git it
> looks like there are at least two different ones.

True, in vendor kernel has more registers npu, vpsys reset.
But since I can't test other reset so I only added few register (CPU reset)
Also other reset can be added with same driver.

Best regards,
Kwang.

> 
> regards
> Philipp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
