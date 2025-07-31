Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E544C87FCA
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Jul 2025 16:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kMPYT53jiHAdYoTtmCMWy4zHJZpzwk2otreLc5i/DqM=; b=lmOsllpKX7Y0bx
	m91rAjyw1XrZAfuxPkAgY+rYsQrZKXqId6p30GmVab6wdaoFSwhGsAzXznLEAfilFN7UqZT/HiS8J
	kJepKZ+Cdtkf4E5dyv6qTfI+lgoi6+q6wcVPGNybVtbcdL5Rh1i+hYbcf+EUagj47TsdCvtaoGoU9
	3Wez8wm8pLqw5/RbtQFZZbNB+VKshwKGgGO0xZSSvBGf2k5SDX7DF9UoowLBaCn+e/KyA6fs0Yw5N
	XY/pdUGrn5D72N0rn4w/f2GycQngPULnb9Foamy9TbcdxQAXSJuc6/NXbafdyE5UBu6R7+QlnGkg4
	wsMpAezCrw5e80aV9dvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWUD-000000046js-0sWo;
	Thu, 31 Jul 2025 16:50:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhWUB-000000046jB-0wdN
	for linux-riscv@lists.infradead.org;
	Thu, 31 Jul 2025 16:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A166044C26;
	Thu, 31 Jul 2025 16:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6497EC4CEEF;
	Thu, 31 Jul 2025 16:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753980630;
	bh=TnKnojD8pZKJi4gCb3oaHc/q/bUH6sldEJl1RFC71Ic=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pvI/b5aF6F/b4g9tlhY8oUo1Ig1H8yGtRHeHW3f/o1UWV40cD4BBGkAcOsk+fUUkq
	 t5915J68JfcApQqbtP7tR0W/6pfx7X2brVDHan+cFlUMGlGYS1EDpW1vHH86KCcVNI
	 0W8HHYbOqwrdqKMpEuVecdsMfGxlnMH5glU+li8srCZvckxSP59NreNrdTZIp57S+L
	 P6Vc+XQgYK/sdnIXSOx+3agXDHQFeVTAMeQhUQC5YUUhRbhWZvD3cBtWK8t6rsGeko
	 ETHFk6uY0xrNO8dYQmayv5GVyh9xR+LLrVXeJFmHcWxOpv6/pIRrccu90K0pK7GsCN
	 2pSj/vtBWAgvQ==
MIME-Version: 1.0
In-Reply-To: <CAK9=C2WRVHZ4FdoW0fKRRFg6qAC5asn03dHj_NXkMKfBXKkXdA@mail.gmail.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com> <20250704070356.1683992-9-apatel@ventanamicro.com> <175341132347.3513.7184287611040628050@lazor> <CAK9=C2UDV3xCpKxZmT4NsRvN=hCcQrcx0fr-QFD2fuOrqmXmHA@mail.gmail.com> <175359739515.3513.8664828076215459722@lazor> <CAK9=C2WRVHZ4FdoW0fKRRFg6qAC5asn03dHj_NXkMKfBXKkXdA@mail.gmail.com>
Subject: Re: [PATCH v8 08/24] dt-bindings: clock: Add RPMI clock service message proxy bindings
From: Stephen Boyd <sboyd@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 31 Jul 2025 09:50:29 -0700
Message-ID: <175398062959.3513.15195554063633980579@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_095031_285611_6FC79005 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: linux-acp <i@vger.kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

UXVvdGluZyBBbnVwIFBhdGVsICgyMDI1LTA3LTI4IDAyOjE5OjIzKQo+IE9uIFN1biwgSnVsIDI3
LCAyMDI1IGF0IDExOjUz4oCvQU0gU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPiB3cm90
ZToKPiA+Cj4gPiBJdCdzIG5vdCBwcm92aWRpbmcgY2xrcz8gVGhlIFNCSSBmaXJtd2FyZSBpcyBu
b3QgZGlzY292ZXJhYmxlPyBEbyB5b3UKPiA+IGhhdmUgYSBwb2ludGVyIHRvIHRoZSBEVFMgZm9y
IHRoaXMgbm9kZSBhbmQgdGhlIGNsb2NrIGNvbnRyb2xsZXIgbm9kZSBpbgo+ID4gdGhlIG5leHQg
cGF0Y2g/IEknZCBsaWtlIHRvIHVuZGVyc3RhbmQgd2h5IHRoaXMgaXMgbmFtZWQgYSBjbG9jawo+
ID4gY29udHJvbGxlciB3aGVuIGl0IGRvZXNuJ3QgcHJvdmlkZSBjbGtzLgo+IAo+IFRoZSBmaXJt
d2FyZSBkcml2ZXIgaXMgbm90IHByb3ZpZGluZyBjbGtzLiBBbHNvLCB0aGUgU0JJIGZpcm13YXJl
IGFuZAo+IHZhcmlvdXMgU0JJIGV4dGVuc2lvbnMgYXJlIGluZGVlZCBkaXNjb3ZlcmFibGUgZnJv
bSBzdXBlcnZpc29yIHNvZnR3YXJlLgoKSWYgU0JJIGV4dGVuc2lvbnMgYXJlIGRpc2NvdmVyYWJs
ZSBmcm9tIHNvZnR3YXJlIHdoeSBkbyB3ZSBuZWVkIGEgRFQKYmluZGluZz8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
