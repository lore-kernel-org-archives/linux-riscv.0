Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEA9C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 21:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28326603E9
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 21:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28326603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vVwecb4CBmFTjWLnbjqQ2xPZ5cUZlXBCMHP216supYc=; b=zCkOyHQR8+9PwAdrYreOlmDLCW
	UfPSRRDwKQhuYIDbytUh7ggzTzwUeoo2u+TLxw7Zou+ebLFs6cQdE82RXPaE67p2rFVFKYpbxm4jn
	KVRr0Ts0GyeFoiw0qlIV2xgaWAw0hE/zHHXs2OEZFqoAYPlmjKRiw+AwO2e1x2pyliRlGarQznOyO
	FfDcdeAfB7xZlEBja+ovCGR5QioMJsVpmC/ZHIe2VKIxwoqhCJ4y93+dpVkBkXT7sLmU+hVp+dN6L
	QFGX3KCqVCfdsvmJDhjYWHrAsWUG3TQNfL5ZFUJSaNXrh5zEyyV7ODpkhIS5fYT1kQNv5C0HNqA54
	MgWbhwTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi1Vq-00348U-2S; Tue, 02 Nov 2021 21:40:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi1Vn-00347Z-Nb
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 21:40:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B5576109F;
 Tue,  2 Nov 2021 21:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635889207;
 bh=6QId1tCDmNcyi+jWRu55si8BIMYCJ8/u74FP7DpWxfo=;
 h=In-Reply-To:References:Subject:From:To:Date:From;
 b=Bzku4hIlcT4z2WIrcHv1YlS/Fh6BLuZDWrAkiuspnlQAWSkjEHPrpzI6LTk9wypwm
 t9ootAqoQfLFLn4bYw1nhN9wCESuPo3vcwKPB6quUDTBykyWgfH6xwHgFj2yh08apI
 oIzrfbxylxylqkWfQQJKrurqtiYVhUUDraJPNY72mqNxsL6kPJ8TbbLb/ENGLdnh97
 vqfi9HZPt0wZq60WoIZ6UubO3+ww1l+ws4dCah5ji0jqobFRviCpBm0SeAd0eKyWYJ
 HTwshRiKgCmXy7TMN56WRVvhfvwCiu/gcddeXO9IJa0P0BKSwxU0gPG3kJTNl9uPN7
 aoThSWXmpSEjw==
MIME-Version: 1.0
In-Reply-To: <20210920144944.162431-1-krzysztof.kozlowski@canonical.com>
References: <20210920144944.162431-1-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH] dt-bindings: clock: fu740-prci: add reset-cells
From: Stephen Boyd <sboyd@kernel.org>
To: Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Zong Li <zong.li@sifive.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Tue, 02 Nov 2021 14:40:05 -0700
Message-ID: <163588920589.2993099.2787121696105187714@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_144007_818994_0F3BA2E5 
X-CRM114-Status: UNSURE (   6.01  )
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

Quoting Krzysztof Kozlowski (2021-09-20 07:49:44)
> The SiFive FU740 Power Reset Clock Interrupt Controller is a reset line
> provider so add respective reset-cells property to fix:
> 
>   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml: clock-controller@10000000:
>     '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
