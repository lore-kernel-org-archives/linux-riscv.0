Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEAEC0015E
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umuJ1vxuUeiDJKqskbxxIMJxfoHJnjXJZQuGNAdEmO0=; b=KjtrKru81MQozK
	VLVR4hppt2FHu+P/T9UhWMIa+NUEVSZ+ABfQmO+YhFr9wuuBl0mzvNEefzvk2zEttZlwCO7okOGz/
	DYMPWARtZTu1S6YEdduqVjdDVp61qF1msuWF06p77IipPUgwtacq4D5FBqUVG0UThnHpaUN3Q7h4B
	zvRqpjSHjjiS1Kfz66NctN3aw6/SkpLyITOgLaidDJ6Yz++tgVfTLe1RRhjYYE6kTiw+ls5sDImPW
	NyPeKRL1wDowPYSmnZ5HfQB4WJ/V9hoKdq0WETI7FXuNWAY2fJzLdadV3EkEBWvmVlM8oN+WgbZzp
	mlcCAekondvXsHtG1RTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSEnF-00DykC-0I;
	Sat, 05 Aug 2023 10:45:57 +0000
Received: from out-92.mta1.migadu.com ([95.215.58.92])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSEnB-00DyaR-2c
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 10:45:55 +0000
Date: Sat, 5 Aug 2023 20:42:59 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1691232338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FpB0D3mxI9kO/4n6kQP6vW7np01C4MPqEWX1agkDUuM=;
	b=gHfgjkGCHQ9obOeEfPj+rXReZOqs6s5Y3WfqT1BD5VbUn7wfUCTkIR1nmCvI4aTXO4b9Q3
	x+yNXqQkoCwG0YtlsPF7gPzZWnB93RJw0EnB+NnPGg6ABVyL8ZZXLwV29Dj/y6xwiVttd7
	ybaOzUh12C2oICB8d1EHO0Aof1e+7NaFFGwEJCWbGP3MVS01sQWOVFB/2zZI7TKQ4Bfwt6
	xk86AXc6c/yH/a6l5Cp5yhrQOqQpOqooqL6QHJB6DjVsgyzZN5SqVOv0ePnOFZrptXlCsu
	iB4nR3ob1y3DOFsDGM2FBZJGhI8GDfeLAD67J9k6P8RccZgR1A8N/z2bwUMAAQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Message-ID: <ZM4nswDuc5YBfEyV@titan>
References: <20230731023701.2581713-1-contact@jookia.org>
 <3248110.44csPzL39Z@jernej-laptop>
 <ZMyZ5kZSiiJHtdeS@titan>
 <5696365.DvuYhMxLoT@jernej-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5696365.DvuYhMxLoT@jernej-laptop>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_034554_008354_99728B7B 
X-CRM114-Status: UNSURE (   7.40  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, mkl@pengutronix.de, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBBdWcgMDQsIDIwMjMgYXQgMDQ6Mzk6NDFQTSArMDIwMCwgSmVybmVqIMWga3JhYmVj
IHdyb3RlOgo+IElmIHlvdSBkb24ndCBtaW5kLCBwbGVhc2UgZG8uCgpKdXN0IHRvIGNsYXJpZnks
IHNvbWV0aGluZyBsaWtlIHRoaXM6CgogICAgICAgICAgICAgICAgY2FuMDogY2FuQDI1MDQwMDAg
ewogICAgICAgICAgICAgICAgICAgICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwogICAg
ICAgICAgICAgICAgICAgICAgICBwaW5jdHJsLTAgPSA8JmNhbjBfcGlucz47CiAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjIwaS1kMS1jYW4iOwogICAg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMjUwNDAwMCAweDQwMD47CiAgICAgICAgICAg
ICAgICAgICAgICAgIGludGVycnVwdHMgPSA8U09DX1BFUklQSEVSQUxfSVJRKDIxKSBJUlFfVFlQ
RV9MRVZFTF9ISUdIPjsKICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjY3UgQ0xL
X0JVU19DQU4wPjsKICAgICAgICAgICAgICAgICAgICAgICAgcmVzZXRzID0gPCZjY3UgUlNUX0JV
U19DQU4wPjsKICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKICAg
ICAgICAgICAgICAgIH07CgpJIGNvdWxkbid0IGZpbmQgYW55IGR0c2kgZmlsZXMgdGhhdCBwdXQg
cGluY3RybCBzdHVmZiBhdCB0aGUgdG9wLgoKSm9obi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
