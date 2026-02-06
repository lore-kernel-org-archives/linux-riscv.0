Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44C1ECD9BE
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 03:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WLKHdBhoFYeiXDPC51aAt0je36MhCgEFz8TH5NdFwo=; b=RaLVEXt4yEjYG5
	ate2Wy1+2uUZ9VGWB8JS34XuHyAUVr/faEv6bIOEmzjM9901dIm0B+dQECSVjgGEq/UpBPuwZM/IO
	FAf3AoEFM8aWV3M6rvRUckxph9ZbZZixkzIyMpKpowYOo8FcPKEROsu2AsUcUh0wmpQrCtHPqa33Y
	buQh+Z3Z4k2tcKJNUSo5NX6A3iSrbhMD+P3IdgzN5AhpVF7oPC/AyqXeos47t0RywnQUXdhqsEEjb
	OPKk+kbrMWz+4j/B46FVj5OJcqAWOTapIcf/cEt12AHqufqsfxOYgsOipm8NhCtzlS1OcSaX2i61Z
	+3TlnMi2yCBwu561KXyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voCmW-0000000Ap37-4BnZ;
	Fri, 06 Feb 2026 03:45:21 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voCmR-0000000Ap13-1bc5
	for linux-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 03:45:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1770349479;
	bh=I3g42yJH0JWKICHWbMZxYhHhJBEDjcyHd4q+GXqrC5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=kWNfDtDVpRh1Z4iPqAGXTZTRl0Sv8lQc4KYpySBId31LsUFlNWHCZMh+O0GLeQ9m9
	 dVSmn9P2exs+fQ/hzbZfUmUxBr6CRvY8bc4ItS+s9rXbPZS/0Oi84o9XDCZ6E3WCbJ
	 N7eTETKxnv5zi30r2znlo79ijHFAswdIJpkP1xFY=
X-QQ-mid: zesmtpsz4t1770349470tb06b5594
X-QQ-Originating-IP: GNClnZ5B0uToiIZaeP+3CrWjtBWwxgmqPCTChay5LDo=
Received: from [10.3.91.191] ( [101.70.125.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Feb 2026 11:44:27 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13007171727628371130
Message-ID: <049320517C0CBAC7+22eb4b3a-821c-4ae0-8bf8-be7455289929@linux.spacemit.com>
Date: Fri, 6 Feb 2026 11:44:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] dt-bindings: iommu: Add spacemit/t100 features
To: Conor Dooley <conor@kernel.org>
Cc: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Jingyu Li <joey.li@spacemit.com>,
 Zhijian Chen <zhijian@spacemit.com>, iommu@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <cover.1769562575.git.lv.zheng@spacemit.com>
 <cover.1770281596.git.lv.zheng@linux.spacemit.com>
 <B1AEE717CF03B1BB+22fe4be0d3c8d2c6b4c5d3c19736c937cbed3c0d.1770281596.git.lv.zheng@linux.spacemit.com>
 <20260205-presoak-reshape-9465d18bca4a@spud>
Content-Language: en-US
From: Lv Zheng <lv.zheng@linux.spacemit.com>
In-Reply-To: <20260205-presoak-reshape-9465d18bca4a@spud>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: NOIkHYnr7Vzd/QBa0AWyODA7TWoJiYyxcdouM/QFsngOoMMS8QhO7hoR
	2RVY2ZSFpqbIEvpo0Udmo2zGonRo1pkXxoelsvMm13DWpcKYIk4Mh85CQ0MNBV6Mw8F5iO/
	I626Vbj5KGT0STSvbDTPvom4JIcE8cGZiohau9eMBrpxAH8RyM9Mfes8TJ40ljsJZ/vQ/S5
	Saeeq8/80JLVG7ajEoFF+TvGIQNps5Hhtf7lHptYJCtFaoC7dVmq7qi2hAaGsm6pR2SglIE
	pU1rfKuufJKBISCYrQ5uqKCK0wiKqVgDS6C3PNdzBUa34zbcEjjeYcl0WqDrpUS/WAziw4w
	RW2yVrxPh+xEQhkIBFhfmTzqAr1PFrlDn/lWa0fq4Lj7IGDXaDBB/mEyzo5OpeOrzhH66pz
	Df1xuS2Qr7iLWTsKny3ZqbEJRI41yHOaghhJjS8X+j4zFY0d2aeAGtc74QodB1b9eiyo6N/
	Nxwh6ek7P6xQGa/9X/RRz92ZNxE5Al2HxsFHHEf4nF6eKq28GQpEAm7b7qGmHy/uI1IS0OU
	K8+/eGk1F9gn2zRBzPQsMAvCXI8bYPnfF7jKfoNtsqAyJNwxxw//EgRli7gcZBbQFCOWNhL
	zrmj41PQ0aLYE84NZ2ZtRmabDIVpRucPJGJes5I8TZ6UDOtxzzbQPGLhFvD6cQQk10cFT62
	dgh7cNEtU+1pg6lq5xZIHoX0u5vyV1PCrubfrI4bR9fI+HztxqyYK5zCCFdpGS1W5lM1nV1
	S3BCUWF2uiCX0ORcJDd7ZCpmGTqm+Pj2li2RnMmFYfHTCbTAlG5mPrRvdMsim5iz2hRgUpJ
	Kg7k+JQagM1Wod3sXsnPF+5ttgof2nOIRJEPyDdBt3jG62c+q/kloDHAAXmXI3iRTZ0TWDN
	OJ6ISUPTUo5I6omZ/kXeCsszPJsYyhY2fpOyf24kSBRHdJ+7aozUH+8bdwis324HAQq7hDb
	WJjUMzfr60PGQS00pxUa6tmoK6KiddBnhItL6o8Kqg3MNVzIEvwcJBX31QY+Ah4DTZ8yDA6
	41g8F0LgXXBfJ5LiTXT4lSEm00Qy2HxNnj5Ap3Vw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_194515_884926_654F6303 
X-CRM114-Status: UNSURE (   6.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/6/2026 2:26 AM, Conor Dooley wrote:
> On Thu, Feb 05, 2026 at 05:10:43PM +0800, Lv Zheng wrote:
>> Adds device tree bindings for SpacemiT T100 specific features by
>> introducing spacemit,100 compatible. T100 contains distributed IOATCs,
>> each of which exposes pmiv interrupt.
>>
>> Signed-off-by: Lv Zheng <lv.zheng@linux.spacemit.com>
>> Signed-off-by: Jingyu Li <joey.li@spacemit.com>
> 
> Please wait until discussion has finished on prior versions before
> sending more. The merge window opens next week, so there's absolutely no
> rush with this series, there's weeks before anything could happen with
> it.

Sure, thanks for the help.

Cheers,
Lv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
