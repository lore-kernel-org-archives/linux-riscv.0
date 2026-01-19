Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AD7CA6007
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 08:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmPwx1aSTuLGHMTR1NXsA4YCFvEom6tpFukWjhJdnjQ=; b=nnXZbHGE5Z+WHB
	aUTlPGgInvloeJfZDqzkYdlG/+KN6g+sFdTfupqjhyEHTOJaiTnqfCHxS3E4EaJ1gsHixr9/5YFgu
	c/ucTQHCZO6LQnZiK8sfoYWbp5iv0g1ewm0+BsDNBKJoUnlUlSZ/kAXIgf0kscOO13DbwPav65/s4
	66NeOC9mF63O++dTKC26XIQYU/gC7ZvQz/zNVZQDQT+eofnCW/ynpYPjeFC1sIogNkeBQOWanYdaw
	II+7pJUMCytwGkjNJLCxGEOLQUoEn8cD0Nrf8X5fAJGptYftPZYfdXbLPJmfcAJrvbQOcb5V5NqRd
	Ndk9sOM//ATlAyn19QNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkTs-00000001XwJ-0YAq;
	Mon, 19 Jan 2026 08:19:24 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkTk-00000001Xvq-39Tu
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 08:19:19 +0000
Received: from duge-virtual-machine (unknown [223.160.206.18])
	by APP-05 (Coremail) with SMTP id zQCowADXZwv46G1p2zmUBQ--.61720S2;
	Mon, 19 Jan 2026 16:19:07 +0800 (CST)
Date: Mon, 19 Jan 2026 16:18:59 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Xukai Wang <kingxukai@zohomail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v10 2/3] clk: canaan: Add clock driver for Canaan K230
Message-ID: <aW3o8xVziqb9iRBN@duge-virtual-machine>
References: <20260116-b4-k230-clk-v10-0-de59033c5d30@zohomail.com>
 <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260116-b4-k230-clk-v10-2-de59033c5d30@zohomail.com>
X-CM-TRANSID: zQCowADXZwv46G1p2zmUBQ--.61720S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFy7Kr43Ww1fXr45KFW7Jwb_yoW8XFyxpr
	1IvFyfWFZ5JrnakF4DZ3W8Ar1kJFs0y3ZxJr1IyrW8Gw17Xryvva4agr1xta1UJw18Ca1U
	XF4DJw1rta4qk3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU8fpnPUUUUU==
X-Originating-IP: [223.160.206.18]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_001917_157098_42C69A5A 
X-CRM114-Status: UNSURE (   7.41  )
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

> +
> +K230_CLK_GATE_FORMAT(hs_hclk_src_gate,
> +		     K230_HS_HCLK_SRC_GATE,
> +		     0x18, 0, 0, 0,
> +		     &hs_hclk_high_src_rate.clk.hw);

Here, you replaced hs_hclk_high_gate(in v9) with hs_hclk_high_src_rate,
but after my board test, I find that when hs_hclk_high_gate is turned
off, the mmc/sd and other high-speed subsystems can not work. So maybe
you should not change the hs_hclk_high_gate to hs_hclk_high_src_rate.

When I used clk_ignore_unused, I saw the log as follows, while the enable
and prepare count of hs_hclk_high_gate is zero. Here is the log:
       pll0_div4                     5  5  0  400000000   0   0     50000      Y  deviceless   no_connection_id
          hs_hclk_high_src_rate      1  1  0  400000000   0   0     50000      Y     deviceless   no_connection_id
             hs_hclk_high_gate       0  0  0  400000000   0   0     50000      Y        deviceless   no_connection_id
             hs_hclk_src_gate        1  1  0  400000000   0   0     50000      Y        deviceless   no_connection_id
                hs_hclk_src_rate     4  4  0  200000000   0   0     50000      Y           deviceless   no_connection_id
                   hs_sd0_ahb_gate   1  1  0  200000000   0   0     50000      Y              91580000.mmc   ahb
                                                                                            deviceless   no_connection_id
                   hs_sd1_ahb_gate   1  1  0  200000000   0   0     50000      Y              91581000.mmc   ahb
                                                                                            deviceless   no_connection_id
                   hs_ssi1_ahb_gate  0  0  0  200000000   0   0     50000      Y              deviceless   no_connection_id
                   hs_ssi2_ahb_gate  0  0  0  200000000   0   0     50000      Y              deviceless   no_connection_id
                   hs_usb0_ahb_gate  1  1  0  200000000   0   0     50000      Y              91500000.usb   otg
                                                                                            deviceless   no_connection_id
                   hs_usb1_ahb_gate  1  1  0  200000000   0   0     50000      Y              91540000.usb   otg

Regards,
Jiayu Du
> +
> +K230_CLK_RATE_FORMAT(hs_hclk_src_rate,
> +		     K230_HS_HCLK_SRC_RATE,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
