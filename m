Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED2DC77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SZi4wT0nrX6TLQrJphUxvrDzwPW4Z8W7BLvrCAjZJoU=; b=Rl1uxTYx+u1kx6
	YeR7YjcoTJsUGFx3TKGDCW9mV4S4zBmoA+6AhmNfi46Qug4FZiZ9X84SxZYNkU6GRHRTJc58xEvph
	j9oEa5hq+sR9/MyCmK7QhUJabkJBGhT0X9JUKFO1OrPhtWNprTJ5AIw/UqOxdjINnWdylgtEdauEj
	0Uz0kblB0vl47+cedAh3fuJENo4MrTnfyZn3mRmM3+M6qWqIVxh2KzMzU8Isx4CMAKmHspHn9AzbL
	YpBd8G/9Q/NxGGABp+ko0Fv2QcRl/yiRDkqXZunHfpkHBprG6C6AKGaOcX6peQtjNZSKHVFiNLQ4d
	Jcky5nPWL6s7I5MHnlEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psOtl-00ArwS-1e;
	Fri, 28 Apr 2023 14:16:33 +0000
Received: from out203-205-221-236.mail.qq.com ([203.205.221.236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psOtf-00Arli-31
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 14:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1682691368; bh=mcjmIcP4bVI9FN66WZIMySUFBD0zyZdU3Ivt3jTkYkc=;
	h=From:To:Cc:Subject:Date;
	b=DdkR2e4BdZiLdzOKssPWow0tDcs8fBbHunzRZd+oePgg+HUtDxsei5MKwYxe84SL+
	 5kn+2O0QTds9GEA8leL2ur9lf6Av/zmXa3N45RMXnCpyCL/35DpDVEj2EQpVepyOwP
	 Q5qBw3iwhj0jv6rz2pV53zM+uDs/tePRb/h3Af3E=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 4029CE99; Fri, 28 Apr 2023 22:16:02 +0800
X-QQ-mid: xmsmtpt1682691362ty3q88u8s
Message-ID: <tencent_8492B68063042E768C758871A3171FBD2006@qq.com>
X-QQ-XMAILINFO: MFT3qY5n2tW2Le4qvbtdUtvjxXKtD/EfxOwCeWt0Y4ioMpxdN3zTfyj528QNtg
	 R33Rr1FeVX9AB8yCXX49e01nl5uNTmunPoTCh0bhN48LOUJ+yTPux6XijQPQyIraYPHenLp/KE40
	 dA0hJKOWkbfHoyLC24pFj5neSfhUXE5ToYe23cE0YhvNq0wc83WMVtnzY7Bqrm6PXQ//Fk02uDEV
	 U7RX151K++YLd+sq2wHqmauSv8Wz77dL0zazdMVbR22qio3wqUi6N8JuZ4mZdm+HLV4MUIGPe1MD
	 EHT7rlB9Xr9+SiQFb+QoFLBsPUUouK04QnHySj1DVZqD4wMo3MA24LxXQe0CDbnyDJ42SpMHT7JS
	 qWvUlXdeJxZZtCzoyMQaVsWSovzNKcMZ5OEKj3BtCmSxsNS+vAklj5EHBI1DlOG/hP+UMlaGxhtI
	 TYPyfhyxWyLrnjq7hsc5+09mkEOOvVSXYDn4vqT/xo9x7wRYCtnUNzArTkpB9708mLhXNlQ28UGB
	 S9EKmn8cRXuhQcEKu5CP/YLDVM3bZuM9ULO7cR6AiEJ2GJ6JSmDM70vnobdshKVg5YpwaUbOP9Us
	 UkHAwO17B7DaJLReDlG+xCMkF+tgvUSX4CNyajo3st954VlLOjQekaWU9k+pJsGpMKcMxXzORdvd
	 9/chiWz9/0aGtwDY0v/78zgTKLkrVFgbLQUfh8m9JDurvIAUo1IQ5ZqNc4yd29hkusegJWwfh6oH
	 wAHiMw6+B+Ni1UR09oWqDhBv2WymP3Mvi2/tjtz679g5vb4c9vxO2xdRFfh/I3Aa9wHnr3/brLBy
	 wFGeoh0K+IPB7i6p5cgF+Tdq9NPYidL/haViIqytqFL0wH8HNnlzLv4sOm2s3bbJReejgtVfPqr/
	 8F8MeNTe/wNAw85Y4MJnZqX2C6/TiESufCbq9c2FLDStho0IEe0yj2gFaTmNONLF1+4Jf1RK5/lm
	 6yyFCiZGu5l7eicDnPxifvxHEFcOV1Hoc4VE/hrk3QTlBkLpbb9g==
From: Yangyu Chen <cyy@cyyself.name>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Wende Tan <twd2.me@gmail.com>,
	Soha Jin <soha@lohu.info>,
	Hongren Zheng <i@zenithal.me>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2 0/2] riscv: allow case-insensitive ISA string parsing
Date: Fri, 28 Apr 2023 22:15:59 +0800
X-OQ-MSGID: <20230428141601.678489-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_071628_278388_86321157 
X-CRM114-Status: GOOD (  11.13  )
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

This patchset allows case-insensitive ISA string parsing, which is
needed in the ACPI environment. As the RISC-V Hart Capabilities Table
(RHCT) description in UEFI Forum ECR[1] shows the format of the ISA
string is defined in the RISC-V unprivileged specification[2]. However,
the RISC-V unprivileged specification defines the ISA naming strings are
case-insensitive while the current ISA string parser in the kernel only
accepts lowercase letters. In this case, the kernel should allow
case-insensitive ISA string parsing. Moreover, this reason has been
discussed in Conor's patch[3]. And I have also checked the current ISA
string parsing in the recent ACPI support patch[4] will also call
`riscv_fill_hwcap` function as DT we use now.

The original motivation for my patch v1[5] is that some SoC generators
will provide generated DT with illegal ISA string in dt-binding such as
rocket-chip, which will even cause kernel panic in some cases as I
mentioned in v1[5]. Now, the rocket-chip has been fixed in PR #3333[6].
However, when using some specific version of rocket-chip with
illegal ISA string in DT, this patchset will also work for parsing
uppercase letters correctly in DT, thus will have better compatibility.

In summary, this patch not only works for case-insensitive ISA string
parsing to meet the requirements in ECR[1] but also can be a workaround
for some specific versions of rocket-chip.

[1] https://drive.google.com/file/d/1nP3nFiH4jkPMp6COOxP6123DCZKR-tia/view
[2] https://github.com/riscv/riscv-isa-manual/blob/main/src/naming.adoc
[3] https://lore.kernel.org/all/20230426-getting-tactile-e6cee2cdf870@spud/
[4] https://lore.kernel.org/linux-riscv/20230404182037.863533-14-sunilvl@ventanamicro.com/
[5] https://lore.kernel.org/all/tencent_1647475C9618C390BEC601BE2CC1206D0C07@qq.com/
[6] https://github.com/chipsalliance/rocket-chip/pull/3333

Changes since v1:
* Remove convert all isa string to lowercase letters in `print_isa`
* Remove warp parser pointer dereference with tolower in switch, use
    uppercase letter case instead in `riscv_fill_hwcap`
* Remove allow uppercase letters in dt-bindings
* Add Conor Dooley's patch which drops invalid comment about riscv,isa
    lower-case reasoning

Conor Dooley (1):
  dt-bindings: riscv: drop invalid comment about riscv,isa lower-case
    reasoning

Yangyu Chen (1):
  riscv: allow case-insensitive ISA string parsing

 .../devicetree/bindings/riscv/cpus.yaml       |  2 +-
 arch/riscv/kernel/cpu.c                       |  3 ++-
 arch/riscv/kernel/cpufeature.c                | 25 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
