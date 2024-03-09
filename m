Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C73C5475B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2024 02:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYAz6Asga93EcaIc2oIUIsI23YMU2WWfvhnkjyEDCoQ=; b=mc+zjhlxgJ7RRI
	7YoMFOsHxqvbpxorZFk5HkxypKIrE5tU/Sdlt56Jh115+m1D4vN23wPcC/BXbbCpGm2X2jnbwKudC
	eyWSV7nTsZa5Y3KQ2TYEo0TtFHO1m96xG5xsDrB/ATkkXowuWnpxo1AWIKP46DFMcUSfxwjGqVJvo
	EQcGh0Ly+GKHN0lUzJiX6SmOC/njq+w0cpr1coWwSKfwySJsRpSWpb9D+vwmiQjvxjv6ZM6ElHmIo
	Tj8fJvugxTHKJBLGJVhEzOav1XhNSzGosQRkX8aaeOZeAdSnHd3jjSdymjaXwDXboEZiQHduG3MNn
	Qry05rjAkcg+YRtI017A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rimF5-0000000C7p7-11t1;
	Sat, 09 Mar 2024 02:15:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rimF2-0000000C7oD-2Yih
	for linux-riscv@lists.infradead.org;
	Sat, 09 Mar 2024 02:15:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A81226118A;
	Sat,  9 Mar 2024 02:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AE7C433F1;
	Sat,  9 Mar 2024 02:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709950514;
	bh=4Qrf/Byr2Zv7iIhlTlzgFacoEmHeefX1Prg8xbK7Dzc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UjFmO5k1oGM8NsMYEbhrdS0gAGUK9qruz+5oAbTF2r5OCLJi5kFRzftf9exqAiY3W
	 Kv2X0NvthRLUMvqO3vB7KSk65/MjV/GuWdiYU3X1sej/l1IvbqqX3B3JH0NNjvTgrI
	 S1Qxk6sz1afXLT/YDq9Ubov8QhNX7xkDOEjAf+WSn6xIwdcQVewIu1yucLAfxmK/xs
	 z0TSQwGRUZpkT6+3vSpZ0ncN7wKLh2T4k9Tg2aiTj/rkMZI/TcBosVr/ruB0Hzp/rx
	 5k9whKJpwXmo//aCY1AA4ZX/kjKxDrJI6z9X0PThKFM6Orw7OkYT9rScMS9JSSjArC
	 iNFeFB40RnZPg==
Message-ID: <066c6fa4b537561ae6b20388a5497d9e.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <49faf8ff209673e27338d4b83948ade86b3c66e4.1708397315.git.unicorn_wang@outlook.com>
References: <cover.1708397315.git.unicorn_wang@outlook.com> <49faf8ff209673e27338d4b83948ade86b3c66e4.1708397315.git.unicorn_wang@outlook.com>
Subject: Re: [PATCH v11 2/5] dt-bindings: clock: sophgo: add RP gate clocks for SG2042
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen Wang <unicorn_wang@outlook.com>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, devicetree@vger.kernel.org, guoren@kernel.org, haijiao.liu@sophgo.com, inochiama@outlook.com, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com, robh+dt@kernel.org, samuel.holland@sifive.com, xiaoguang.xing@sophgo.com
Date: Fri, 08 Mar 2024 18:15:12 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_181516_845482_51DC12CB 
X-CRM114-Status: UNSURE (   5.64  )
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

Quoting Chen Wang (2024-02-19 19:08:59)
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@10000000 {

This is the same address as the pll binding before this. How does that
work? It's the same register area as the pll node. The resulting DTB
should only have one compatible for this node.

> +      compatible = "sophgo,sg2042-rpgate";
> +      reg = <0x10000000 0x10000>;
> +      clocks = <&clkgen 85>;
> +      #clock-cells = <1>;
> +    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
