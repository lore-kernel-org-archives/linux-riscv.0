Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B10FD5CCAC
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Oct 2024 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fsl7xeuihlVCh9gBJdYSchub+8WtU0u9SFv7RGZ0MVw=; b=1t0BQTI2REbvJH
	d1e9nKhgS1C6WTf1Cm2a2zbFp0Ow7+KQjVk9jn3CwM1aKVkHA+Zl9INbYUvbLSnOjwj6V9nXQ/4lP
	PtlTlfavDa09N1kxgKQsuBTe0PUyxC+EBGen1Hl1TYxnfsiow6FrKES+qR6z42iaD/T1wLhIJFF+Y
	MyQwhaQCMpVjpr4Q5aiJn7t2i4OdniLb6Qe5/qJv97UHY/B6ibukAQWq336ZJAPZ5Wf5ucxqh4T5Q
	B11goh22GrHXouAnLrhhyZ4jVfxbxfgtV34e9Py4rbFK161EKSsMnaBIE4Dcl4PNKna/qJ7oYOc3z
	q2v1oWIujGXqHGb9BTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UGA-00000003WOT-27eQ;
	Thu, 31 Oct 2024 12:26:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6UG7-00000003WO9-2ySu
	for linux-riscv@lists.infradead.org;
	Thu, 31 Oct 2024 12:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50096A44042;
	Thu, 31 Oct 2024 12:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E411C4FE0F;
	Thu, 31 Oct 2024 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730377598;
	bh=ROImIcKd26I37IIPZ7G3j3tGh80SEofFXW3tR61BJI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VQZ8HmfllQmBOTiIj7AXghEbzCewVOl5UEKOTbuj/oF9tT8vmfaZti53DuzStqOFg
	 KJLwrCdV/8Zky2cGPZckIQkZA8AdWyJDefksndBQIX7jeHyHjL9tTAT1pA0uWiWlyX
	 49shJFYqGwYDWq8EqWvCfCruM5eDunH+FAymVk6Pseh4Sn1BJsTprZsLTh+wPQqCa9
	 ZmAgHnUdnjvMXPRZdlnBCGi9QSbqmqv5aPpZ4krsVn0lzmxKRuQ4TS+IYT8hh9KGpK
	 RxaNryz+eLxzGoVxwfdCzlO2TiSbEtw09YpJSXUgIzVQekmN46opDXkc3r/bCZgYoh
	 VvCKISkHqgwOw==
From: Conor Dooley <conor@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] Add DeepComputing FML13V01 board dts
Date: Thu, 31 Oct 2024 12:26:19 +0000
Message-ID: <20241031-synapse-cycling-0f7834a28b91@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241028082553.1989797-1-guodong@riscstar.com>
References: <20241028082553.1989797-1-guodong@riscstar.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1245; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=zWFfzFih/Cg5hWs+WTraOfKNpKZTj9yvCQj0KE3sbQ0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOnK5Tnr0tcHFdVmFD373qH2YlbwiYTsXRkHQrS1hP/vK /wnV7O7o5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABNJt2f4K2AbbrR6f+/1JZX7 5fafkVxq07NYwWKhboJmDSev+v4d2YwMSy6p1QWv3WqX6X99h+qK9XEWx5/lay3/1WOwI2y9kN5 /XgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_052639_839400_BDCA4335 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 28 Oct 2024 16:25:48 +0800, Guodong Xu wrote:
> This series updates Device Tree related files to introduce the
> FML13V10 board from DeepComputing, which incorporates a StarFive
> JH7110 SoC.  This board is designed for use on the Framework Laptop 13
> Chassis, which has (Framework) SKU FRANHQ0001.
> 
> The original three versions of this series were posted by Sandie Cao
> from DeepComputing.  Her mailer configuration caused mail threading
> errors, which led to some confusion.  After some discussion, we have
> agreed to take over moving this series toward acceptance.
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/5] riscv: dts: starfive: jh7110-common: revised device node
      https://git.kernel.org/conor/c/5a5001d27065
[2/5] riscv: dts: starfive: jh7110-common: move usb0 config to board dts
      https://git.kernel.org/conor/c/817eac165ed4
[3/5] dt-bindings: vendor: add deepcomputing
      https://git.kernel.org/conor/c/e9b4ceedb5ae
[4/5] dt-bindings: riscv: starfive: add deepcomputing,fml13v01
      https://git.kernel.org/conor/c/e87fa39dbcb4
[5/5] riscv: dts: starfive: add DeepComputing FML13V01 board device tree
      https://git.kernel.org/conor/c/c8b72c301dbe

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
