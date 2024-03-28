Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B548CD1283
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U0p2rvHlVir4EoSBzUnywHVLc21hanFTOZWvpvj5ts8=; b=M6Gwg85pgQNTok
	gR0EqImcaheRfXYE4g8rZkBACEPZvEerBsOuDkoMhO8YEInsfWO2ZXKsaxcyMTP4vDQUOGBrJBaHo
	Wb66MMXeHDYuqG2H73ZATLR5HUK2mXAQcfk2ScdpoDCkkh0T8Eh4QErjdElZv66fDDelPF7O/GbFA
	o4iaP36TW+tj4f3EFz/cpxklIA1324nfSQiv6euxw9V6fD3jT5U6Tlu3JldBWEH6p/Z9Wnv10u7hc
	gLGSA+tddxLWQHs/tZD8godeS6tTkNLUSeAgkDwrlujhs/xnBSZ2wBMd3v2PWM7sqY4StfWLIl53j
	2i7pmp5X23yyEhABMSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptBI-0000000EtL3-3Bxm;
	Thu, 28 Mar 2024 17:04:48 +0000
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptBC-0000000EtAX-21Qj
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 17:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711645465; bh=8ssu01htiYsJMJRjHgP4bblrXVq0qnGeiqD2k3sHcKg=;
	h=From:To:Cc:Subject:Date;
	b=AOiv/ivY2d7nYFclDVbyGsluXTR8ThO+UlUmz/l+jbngQLIkwERsmUiGKWMONq+X+
	 lIDEuYpf1pK8S5NmGKoo4zk95x+J4Ka09Ziu9F/UTzxs8gFYVmFJQkX01ORz092cp0
	 amJMFbRJcuAV1QBBvge4sIxh/2s2na2BLlxeDUgo=
Received: from cyy-pc.lan ([240e:379:2277:8a00:7feb:196a:dd5b:c05f])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 11335EFA; Fri, 29 Mar 2024 01:04:19 +0800
X-QQ-mid: xmsmtpt1711645459tb1h7s37q
Message-ID: <tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com>
X-QQ-XMAILINFO: ORuEwgb9eurk937hgCQc/4UpQ04yu+q4iEC8YqNyGIVokpunePyEspOAdrFfaD
	 TAZUrsoAzBa67OyGvySF9OBMgKTkKIA8T9Hh4gpac+UcW8/4s8lQd7TSLbfRX04oJHBeBehpJkfd
	 yfaeUq2t9XWRzewmbxDNmZnmNbLP0qX+UD/NwvtecOIdyIqwxui8BLG5InboZ6yxLJUzWx18OJaZ
	 NInfgjkEajkg2BM2REbaOoWjRfEjruia2KRNVsPlJAq07Pf3d8zvtf73tlBgwJOi+FkldoXYgh2h
	 w8cm0GXPJCQiCABsLHlJhR3UE4HV1eovUOFvp+8cfgJv+sXKzcDxPojDqRVeA3uhvkj1zmEdtWJ5
	 WATnrSDp6GF4vwgZrQfZVpD1tcR/vLF62gE4KXr5PoUfbOzucC2qH2Fu5iWBGqlvazAO6MPD9JwC
	 2e1PCvQJKcUdhJ9BXsZDw7GBRAY5uFPBasxEqEQqJVXjDYBZbvIk6dGK+Z79sRji0ZaaHfrFaIl6
	 bTxdAcHvVxeooFqsHRn6Tu/UurCPRsVP9RD05M2SzsfydgKujJ1yZXmD8YTC+K6PmbBC+tQVRcLP
	 FzMqCVelVo0RRmDRgM6ZnQS7rZ2jMxAjJ5hdHig09+STq9uLx9ttCE+ntZF0m4K4skbvjZT2cmW2
	 JqFBLShKuoCiwkasVXJC3httmDVrxUWLnwLBfpl2povSQkyM2m+QjAj7jyxESOZW54MTRMuTuvZ9
	 vve4pLChyAuYBQOmOtLXzgUkEectMa7nVL9xCuK9JfzmmZ+HNx07qcUoHQK5gVuXrsA9tsHLT3Ac
	 frPaHmtg1waA/McJfGlhrLlS9LtG5cWUvX3kUHHXPVZ5Zg6M+uq5bAUzXbkyL/mzikYXO8aPQnjG
	 88UNSETFrJ0WKvwOHTukplXk3KVJLDf38eukbzd+h0TMgFaI4DHnWcnCqgH/nc0L/6EIQZIc1rsz
	 rHe+cUi8/DeoWlc8u8r3mEN5P63Q5VE2QVS/0iyLsEP6/UYJ46cW0iuvjx3UbtZw4LwejHYFCDI2
	 uCQC8CZQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 0/5] riscv: Kconfig.socs: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
Date: Fri, 29 Mar 2024 01:03:22 +0800
X-OQ-MSGID: <20240328170322.119305-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_100443_203817_14D2310C 
X-CRM114-Status: GOOD (  12.62  )
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

Since SOC_FOO should be deprecated from patch [1], and cleanup for other
SoCs is already in the mailing list [2,3,4], so we deprecate the use of
SOC_CANAAN and use ARCH_CANAAN for SoCs vendored by Canaan instead from now
on.

However, the K210 SoC is so special for NoMMU and built for loader.bin, if
we share the ARCH_CANAAN symbol directly for K210 and other new SoCs which
has MMU and no need for loader, it will confuse some users who may try to
boot MMU Kernel on K210, but it will fail. Thus, this patch set renamed the
original use of SOC_CANAAN to SOC_CANAAN_K210 for K210 SoC, as Damien
suggested from the list [5]. Then, it made some adaptations for soc, clk,
pinctrl, and reset drivers.

Note: This patch set is used to prepare for Canaan K230 Support, which is
on the mailing list [6]. The next revision for the K230 support patch will
be based on this patch set.

[1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
[3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
[4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/
[5] https://lore.kernel.org/linux-riscv/2b0511af-1b5b-4c90-a673-c9113bb58142@kernel.org/
[6] https://lore.kernel.org/linux-riscv/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/

Yangyu Chen (5):
  riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
  soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
  clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
  pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
  reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210

 arch/riscv/Kconfig.socs                        | 10 ++++++++--
 arch/riscv/Makefile                            |  2 +-
 arch/riscv/configs/nommu_k210_defconfig        |  3 ++-
 arch/riscv/configs/nommu_k210_sdcard_defconfig |  3 ++-
 drivers/clk/Kconfig                            |  4 ++--
 drivers/pinctrl/Kconfig                        |  4 ++--
 drivers/reset/Kconfig                          |  4 ++--
 drivers/soc/Makefile                           |  2 +-
 drivers/soc/canaan/Kconfig                     |  4 ++--
 9 files changed, 22 insertions(+), 14 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
