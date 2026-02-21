Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABD6C5AD7B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lg100cohnM5O3HYdcxWH9LcDnxhg1FIdx7v1QEErmq8=; b=jljl7YhCjACKhE
	vwq4gUulGF2zE+Gd/W2JknxsUI82qKwTn7DtYq6LY8v7JOpsnCyAYe60IG/k7xePziWiCWVkvEpoW
	89f5cuUFqc0WSnAg60xVzrh81tVRFy3KEGq499onO1Yfau0gMka/CdoyEBLl8QRVv+OkrlsG6YCWL
	rN6CirRLCaYPcMe/iRjXUbWnIKf5TGSc0MsPBIeVIk40vjEYf+/IKJsZfRHuXw+jF7bjJmeQ+qD61
	0Nt1uSnUp7CsvI9stgHwQC1NaN/P/1uy7iuQkRCN6Hh036Up3ATPJ6e433glo4de7zDgLKKA22fuH
	UefnXOIzbj4SRqhsK4dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtohk-0000000G85j-2mId;
	Sat, 21 Feb 2026 15:15:36 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtohi-0000000G85O-06jS
	for linux-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 15:15:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771686930; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=c3rqkvZ8f2YCKn6O2yrXwglaa9zp205092pNZVYggxkh9gjixWRYcIzykViMjgbD06xGxJZwtgNYJa/rgIJus8qULszChqvVwZ/eWYvSby4M6Pui5nvF8Ti5uuge2ge0795h1QwDgKY3qLRjjJxN9Jf+IJ7Ha1lwDck5p+r0h94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771686930; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7PBZ6BV0pflgpkVmM7GZBrj5GAsILxdHcBbMFPLndVk=; 
	b=OWP+sfRFICwwLR8snTogp2NWatEk2B2GvhURr2Cly8BYtcMbVpZZhW//ep73PnhpbIenwEJUUM6NSAGxRuP1ZSQBoCQNkgrN5nwAS0yDXfr8PL6zwNgFDAuM1zOx2+1hP3Tm+9Pko5hsLqdNcE06zCkIn9Tjl8p7nj6wsUlK3bE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771686930;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=7PBZ6BV0pflgpkVmM7GZBrj5GAsILxdHcBbMFPLndVk=;
	b=IxTlDxIoElob1meVtSdHlMH1GF/7ihjvp6A9PSf0nWA+E2BOncXyOP4DuA8PDGjE
	QYzoWsGzfxtDT8rNDFcnn7NwQUqJRE6CA02MNEz/FnAR55dnik6bK6R0VgMCHJO36gj
	25iqD8Gv0XOm+IOrf61tIroqShag3vrgJJ7+J3W8=
Received: by mx.zohomail.com with SMTPS id 1771686923159333.11056390750844;
	Sat, 21 Feb 2026 07:15:23 -0800 (PST)
Message-ID: <f1452f53-a0c9-4580-be51-a29d94bd7691@zohomail.com>
Date: Sat, 21 Feb 2026 23:15:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel.holland@sifive.com>,
 Troy Mitchell <TroyMitchell988@gmail.com>, jiayu.riscv@isrc.iscas.ac.cn
References: <20260214-b4-k230-clk-v11-0-6de365489b89@zohomail.com>
 <20260214-b4-k230-clk-v11-1-6de365489b89@zohomail.com>
 <20260214-lyrical-rabbit-from-camelot-2e1195@quoll>
From: Xukai Wang <kingxukai@zohomail.com>
Content-Language: en-US
In-Reply-To: <20260214-lyrical-rabbit-from-camelot-2e1195@quoll>
Feedback-ID: rr080112270177fa32e527f14d020f7646000082eb384bd644a03d1a473829161ee7e7031e2efda71e99c5a4:zu080112271340dbca08d2b8d2cd15d0db0000309bf73410f8398c9987581e74f2d478b2e9b4e654c8aca6fb:rf0801122c2b931f9241db5a1103ee22600000212592b58afb33456c686a6ec669e22222f8e52781f07090a3e9ae68a455:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_071534_142914_0FE0F369 
X-CRM114-Status: UNSURE (   9.79  )
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


On 2026/2/15 04:36, Krzysztof Kozlowski wrote:
> On Sat, Feb 14, 2026 at 08:54:37PM +0800, Xukai Wang wrote:
>> This patch adds the Device Tree binding for the clock controller
>> on Canaan k230. The binding defines the clocks and the required
>> properties to configure them correctly.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> This review and the patchset has one year already... so I am afraid it
> will be resend and resend, thus please also implement below:
>
> A nit, subject: drop second/last, redundant "bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
Thank you for the review and for pointing this out.

I will adjust the subject accordingly and resend the patchset.
>
> Best regards,
> Krzysztof
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
