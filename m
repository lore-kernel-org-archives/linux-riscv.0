Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDEAC43327
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 06:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DDCe82T99OKiFxUKQDMK0x7Xo0m7YzrQCAZs7RqoUUQ=; b=bW5fWqKz9AAsrW
	NqZiRGtXga3j2zN4IzmOJqoV1jFlZbqCs7fc4ztKGbXcbFie/EN2QcGI6tlHooOceobNL/hxDAVMh
	pwWKSnahYc+P22Onp9I/3bJVaNDvJBSpFKqgvDQAJQB+NCaPbuCgqxtxmFbXa1Q03fUHfgsVJAU5h
	GqjbXuMqsr6Dn2qP0tmgGLis6Vy+3CKjhF/pmojIFab81fScvmR/aD19TY9i1AA9ckA6Tkv5pBhKS
	IsLJRYc8wtB0qq0zUqw8sthzsGQlIzKXzvbT0Rz1R0CA5vDh15cLfWiR91WSyO7GQEW2FwteGjaDN
	8V9rxCJYicwko6lL+6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5bi-0000000DlX7-3svs;
	Mon, 29 Jun 2026 06:36:38 +0000
Received: from mail-sh0chn02on2071e.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::71e] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5be-0000000DlWJ-4AY8
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 06:36:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZvsclBjVxiQVGi6mNm6FCXS7la8OnhhIpMYczvcbRLnoS3oGW+C2h50XBZNVMIn3xeyTn3f5ZE9Qx3bvpPRSV8qWTnxU1StgZPH77udo9nE48I8tdaxl1eCXdZ/EELJrPupA0B6JkMc1sjGGdMH64fI9NibM1WLoYWZgwxAMmiNYD+KTo1Il5orNjUVUQlkE1lF+0YZ7EWj6ysvQnoz+RYSCGSLAtTDhsrGNTpArThBkYZrt1X+89pA2XlmXbyY7WGCahbTrMQxrlmOlTz+blGxu5Kzkgi7+t+aJHhMMmBacilZOlL6zH4aObEvtLyKB8uX+VXbVHdZzhEQpbydYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afqhIOjw/Mr9wuP0y2/QfMNtskeh94RBAkdt/ur87jU=;
 b=dtvxr0GvFjWyzHScRo9mD+oVT793wWN+bTwhzKhRmRA0g2RwTsxJPywq9uFKsYrGnMvckUsEYqYN0l7jD+JpnLohV80foH4kGGVWuwH5gcd2FZvcjKDrofs+aeNicO3FUo0cFXi6XBYZPvz7s4b7gC18b91aFHHmqRL4NY4qe++yNEOJmgfqmh9zZABcXvIj1loJnTgZM64t3H04sTw83tBhuy3h6T7YHAuqEW27sWyoybxbJa0xAkQf7Vf1el4wM/nw62L37DDdfsMTL5KOj/sN//Ysz/BsNMQmKDkioHZzQINH7j64/rtXDThSb7Iaei08RhEZ7yVXY2LNCQsB4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::14) by ZQ2PR01MB1323.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.21; Mon, 29 Jun
 2026 06:36:09 +0000
Received: from ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
 ([fe80::4386:5cc4:3bc4:4795]) by
 ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn ([fe80::4386:5cc4:3bc4:4795%3])
 with mapi id 15.21.0139.024; Mon, 29 Jun 2026 06:36:08 +0000
From: Hal Feng <hal.feng@starfivetech.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Hal Feng <hal.feng@starfivetech.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v20 0/3] Add OpenCores PTC PWM support
Date: Mon, 29 Jun 2026 14:35:58 +0800
Message-ID: <20260629063601.63917-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.43.2
X-ClientProxiedBy: ZQ0PR01CA0025.CHNPR01.prod.partner.outlook.cn (10.2.0.214)
 To ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn (10.2.1.78)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ2PR01MB1307:EE_|ZQ2PR01MB1323:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ea0173-d53d-433b-6552-08ded5a8b41e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|7416014|38350700014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: efSJv1fM+gA4YzDE/Wklkg1wNB+hETLnOM3BwKXiITo9rLGF/tAy9U85tyNv6fNUlaK4Xpbso1kH8DGgTpTsQDADA6Jc/uWYNZzng9JeLlWLd+gNiB5Yc19UKjENTgfPUN7eXR1vk5HVsdzmvVuSMoc54eut+sT8/cVpxKoO9eESliOpTQxRinzLp5poPapxRpFas0hh+NfF6I5uflyS5/eY4nt6bfZ3tqhI085QCLIHOcxnhlZhC+ChXBDW2SWWT7VdoaO0u+OHB31KAWZZGiSlVdTbtefgpQtZpmlntXqNqgGPEpXZE7HCZlaRDz9WBz2kaPtJYwviUOE9+2Pd4kYOR2Flfb1zCxahmFmBjBoxh0Yqz2ekBhn+Y1skBN2Kub9hVeOZDSR/28qod4oJdGqL6leG+fTTGxDLOkDl7YcQA/d6aKKi1K0EABol18UgxcZtamZumh5TCgp8IxHm1wwvox/cW5jfADgxcNeHWPD9iGOOX7yN5IO1tBG6TXK+huAVlMdzE1FF8yjAND9qAQWNfBctOblld3x6ShwHPpTxehi8lzaeO2kAenr3y23g
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(7416014)(38350700014)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q1sb09Li2Cdw3SEA29gHtga7CtieVigrnSxTvIklJoswF7NgwI/a8sYMfCe6?=
 =?us-ascii?Q?aE7onjGo3rGDvQyL1+iwCAKGwAoghv31mLYnDDvXA2YroF4Or5RZILy2LnHI?=
 =?us-ascii?Q?sovWz+AjqymUUKG18t/bJ2Wf97hc5StHtH9uJoohN7mx/hA6AX/VPn9VrGZB?=
 =?us-ascii?Q?iMc7LzFREPYPqpDlgJJjmP4idS9UaB2eFwgVlZpGpTvCDZbKCPHzTGBRNNIs?=
 =?us-ascii?Q?TwUAs1MjGiFTVX1ZuZO7XRVy47a6HQ6k4SH+uPHyXFp7PSA8LLtoEkLwTpd+?=
 =?us-ascii?Q?pDO5SsoYOmIB+DGCFFsTUtAxJIB71fminIzjckAjwVwUVGtJGjiOQEKjiQDB?=
 =?us-ascii?Q?UuoROlQ8ZcRruUzdHqTEj5BNMjXzWNmPOxltiDus2oXTMP9hdgfDMHZ/E9hT?=
 =?us-ascii?Q?HOrDf8LCmjDHRdB+ZRA5fe2HLkWz07KpQHqmMsF55amviHj8dVg3yoIN3Hjv?=
 =?us-ascii?Q?kh58htaylqid8hqMGpTLuyhCFRTom2FOxrBhh961absoBqxthcxrIItqnhzS?=
 =?us-ascii?Q?MqO9IFULq32wrO3FhRHUBYv2BfSJGM/jxiO5fmCT0iJdac34xEBDSfVXfsB7?=
 =?us-ascii?Q?VAF9FB0je8FUzBiGmyy9H0fCKn059JGacQnc4NN0iwxykpDXcVJbKxJ+59vV?=
 =?us-ascii?Q?csVpdCdb3DCnLNrW+ZFBeaGqboM49NPrzIF04wZ9atg0psgpL2lDieipgKi4?=
 =?us-ascii?Q?wqNiumUywun7xaC5qOoQ8SpEwwtOxv1oWSUN6Q3o7m0svUfdh2khrcYDBymY?=
 =?us-ascii?Q?H0WsRqwTNn9iHhqVR11C0poSkb0APkULeEQ79DNV/YnwMIiSU5RGKfwxx4ve?=
 =?us-ascii?Q?XsXFkSJUE4wW6WPscSqYwu8Vr0IsCeL4aFoFZeUaIsK9pZz6rj56y4YemBxG?=
 =?us-ascii?Q?iWwq4NXk0jBNrTdO5/tpL2Uy4M75nV7N+zVluB7GXgeV9m4XDqQzqNEog/Tr?=
 =?us-ascii?Q?wyktij4Fs0qQxZp2FZZaNtjwmhber2npdiTRXDBXGyFNHJmx+zkQBwoIarzP?=
 =?us-ascii?Q?Zx0m745NJfn0nqnURlq0Fpb+EtD2eo3d18t5Ail7GtuhmbwlEKJAmlJzRr2U?=
 =?us-ascii?Q?3x+0298E69gxZsn6ttwDcpVwE2tYlx3t0Rq4iZXXLeWGGkzapqBaWNzDOwwJ?=
 =?us-ascii?Q?Emvp15bPhcqkNpmgTkLjNQ249qnI3r0z4r8wSoHH67osXKMd7w2s9VQCRO/m?=
 =?us-ascii?Q?bWc0V1fyVGXXivYldcx02m88MnrrXn9uizzPUpmHevrBGklPlswQW0g/NQiQ?=
 =?us-ascii?Q?t3MoOR/UcFr36vR3UvGU5Ap2s8SGrJCTT01Na54ijq59/fppg+zlZJDXwoUi?=
 =?us-ascii?Q?8YHHmAm2xJ5Dp3ZX07iVkCbnzEYjPlUsKD+zCDomyWIekFcxE+VxW6E2MXgf?=
 =?us-ascii?Q?KuHlMNuKzDxWU1hDbeI7U+GbpVkBx6FrDvus2K9JJ3VwJhtATJL3tmS2ZeXS?=
 =?us-ascii?Q?/oR/Y2Byjy/9fSgPRNAoWigZ8pteVmIN9QSEfFW/PKXde2ElK7YknDQ0sXF/?=
 =?us-ascii?Q?8Rp/6tKTuMYrJ5/qhYTInbHUD9CuaVIYky/EklCFd583AeCexjbUUO6AUj7y?=
 =?us-ascii?Q?WsFt4J1JBChny0XGwcnuTG9T+wp9dGHXZjuRhcHJ9w0LCZzGQ7jjDY/RGup2?=
 =?us-ascii?Q?daMF2JH574ttdYo1QvcbZrU52dyyVWeCDP4Kt5DgZEN+3b3XnADiqAjnkW/A?=
 =?us-ascii?Q?j7Of/ieId74dCtWnkK8RuWL0/Iq9kBisXEOtkPraSj6VOAbEaJYminhKrEJr?=
 =?us-ascii?Q?kGXliA9/xR7fEzO2P8q0bIoVCqhUYHI=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ea0173-d53d-433b-6552-08ded5a8b41e
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1307.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:36:08.7733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDFIQw2XETvdEXrKr0IprqDzlj+wQmTXgng/V4LQwzkN6Zstf35wgLuZ9bkTlxVUiNhG5GlobeaA1eNrL1Jf3NAah6iJJMJemMpwt27SMXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_233635_051816_AE64E85B 
X-CRM114-Status: GOOD (  12.16  )
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

Add OpenCores PTC PWM driver which is used in StarFive
JH7100/JH7110/JHB100 SoC.

I will maintain this pwm module in place of William.

Changes since v19:
- Drop the oneOf construct in dt-bindings.
- Address Sashiko AI review comments for the OpenCores PWM driver.
  In ocores_pwm_apply(), handling disable requests first, then calculating
  and validating period/duty for enable requests before taking a runtime
  PM reference or touching the hardware registers.

Changes since v18:
- Address Sashiko AI review comments for the OpenCores PWM driver.
- Fix runtime PM usage count handling on probe, error paths, PWM release
  and driver teardown.
- Reject period or duty cycle values below the hardware minimum.
- Restore PWM registers across system sleep resume.
- Return the real error from devm_pwmchip_alloc().
- Preserve bootloader-configured PWM state during probe and keep runtime
  PM active if the PWM is already enabled.
- Use synchronous runtime PM put before possible teardown.

Changes since v17:
- Simplify the code. Make it more readable.
- Restructure the driver to register the pwm chip for one pwm channel,
  because each OpenCores PTC IP core only supports one PWM channel.
  Drop starfive compatibles.
  Add patches to fix the dt-bindings and device tree.
- Support runtime pm and system sleep pm.
- Disable the pwm module and reset the pwm counter before updating the
  period and duty cycle.
- Improve the descriptions.
- Update the dt-bindings maintainer to Hal Feng.

History:
v19: https://lore.kernel.org/all/20260615155759.129210-1-hal.feng@starfivetech.com/
v18: https://lore.kernel.org/all/20260515054723.25024-1-hal.feng@starfivetech.com/
v17: https://lore.kernel.org/all/20250106103540.10079-1-william.qiu@starfivetech.com/

Hal Feng (3):
  dt-bindings: pwm: opencores: Update compatibles, examples and
    maintainers
  riscv: dts: starfive: Correct pwm nodes
  pwm: Add OpenCores PTC PWM driver

 .../bindings/pwm/opencores,pwm.yaml           |   6 +-
 MAINTAINERS                                   |   6 +
 .../boot/dts/starfive/jh7100-common.dtsi      |  28 +-
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  67 +++-
 .../boot/dts/starfive/jh7110-common.dtsi      |  27 +-
 .../boot/dts/starfive/jh7110-milkv-mars.dts   |   6 +-
 .../dts/starfive/jh7110-milkv-marscm.dtsi     |   6 +-
 .../dts/starfive/jh7110-pine64-star64.dts     |   6 +-
 .../jh7110-starfive-visionfive-2-lite.dtsi    |   6 +-
 .../jh7110-starfive-visionfive-2.dtsi         |   6 +-
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  67 +++-
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ocores.c                      | 309 ++++++++++++++++++
 14 files changed, 529 insertions(+), 24 deletions(-)
 create mode 100644 drivers/pwm/pwm-ocores.c


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
