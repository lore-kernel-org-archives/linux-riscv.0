Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A80E95A67
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Oct 2023 11:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xE2TP+oHSaJkHPce/ghR/9dCFP2RyCm+8cCVz4MaMfs=; b=qpuJx9a/lwemWM
	9m6q4zaRdcfj8ZPTAk1O4KAItYJgH9VE3W4vBxNJyoL/3NdKGexb+EWvBR6dgXlrp9aTQ7QgDKCKG
	Qjvfih984GqBSYI10xyfMzb211mnNbj8K+m8M7a7AmtCdN1sK8vFV0FS7uFbTlRDAnf7l1GmALpbm
	1S3WJCJMZ60H0g3JLL+Aobk8F5/P2B2mJ+epobGLI136PCwMlsLbDOb99MGPu4IeGl+D6bAZ39q4P
	5ieAHsiRvOL1WQClDYC7VdW/r9NN17iPtyPH9BDSLaOxsJ+vaFcyCvXMt5/tMGpzE29furWW8tzLm
	RYoPP2ImGgXeywehncXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpRkz-008mtL-0K;
	Sun, 08 Oct 2023 11:15:33 +0000
Received: from mail-dm6nam11olkn20815.outbound.protection.outlook.com ([2a01:111:f400:7eaa::815] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpRkv-008msV-1Q
	for linux-riscv@lists.infradead.org;
	Sun, 08 Oct 2023 11:15:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWEOAwuAxnboYR3/1f5Xk7MxWwKK475z6EzfNskqE630bhEtBb7zdfDTBwWhpLUOJR5KPB2qSfPiVDn8LP4iKw9wvoaJCYeGwjgaqBMtlw2k0dLz/WofQCuAZDAlPFp/E3rDyOFtUOcGyWV5VacnYYTdjHRx30hyCrslGd3e4H0D0XuPEEIeg+oGjo/cr0xEmlBTyWbG3sjGAYHVaBg7mvIQd8Tvh88FUcSn/vfaRVYj5gI2cP/f7KtmhKL3ls8M1XSMV0RtWOVjmYYvA+REcurOWAsIsGgmBe9jlt3d/io6/OKybYvhLDZjP3pOQRdjmKhHR+a5aIFyM0IxWEoPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ijK+v5AZGKZe91kQNi0coJvod0Jk5qRjGr6ArISOSjk=;
 b=V0iI+5fbChf03AwKX7kSkHH52Lpo/bjUwtCAwUeXyMwhdGd+r6shqlibHUpvC9IJPioD2p6c+UUxdKUFMXwAC1qFw0LQyyLQjb8QO1bhnzG7RL+KJ3BZgNOt9hVray12Ih+qgj+1gyEpfg0Zfn77LTKG6tlB1fdt5F5a4ZAtn6LsUhPYy5gS1qBAwFXWoK4vXv5SE68t9hTD8NcBVmIB/pBdVs2QS1KAlxhGhAo8/kMZwu+CKR1lr7fjVrYDlF59A2hlytYh3xGqV9KX9G/A50u6DIG38BQOPOoQQxHkAxxSopMlKkXs6P84QOyFQ614CNPx5FD5+7I9hDyFRuG9nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ijK+v5AZGKZe91kQNi0coJvod0Jk5qRjGr6ArISOSjk=;
 b=rWPyfGWcOHL62oai/suk4h4GIiJBypn9Vl3fH2oUs/gc9oSGoBczu7Ai4NwdlCy51d28j+q+TpzubCKPjkMk05ggXUYakrd+iZEHPyS0y1gx92EEHbot+TTqxpMlrJhxQk96zYqR+r95sYoEoUJPOkqdDufMxMrzoWd2Ri2lrYSGKP399lDXCAgr24l+z2ECy7LALNzDYSzVTTpM0AUjHR6AfMOszRruQ/yewm/1+i/daF3nz0ts5F9fpdE/SjmMEZBR06gDvQa8ZljTe4AeYYON804zOHhxofvDJPBpbJeAxROjhWlTeJoDoOSlP2x2LVBfCgZE4HcsDPUY0lx/qg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB6969.namprd20.prod.outlook.com (2603:10b6:510:2fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Sun, 8 Oct
 2023 11:15:18 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6838.040; Sun, 8 Oct 2023
 11:15:18 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/5] Add Huashan Pi board support
Date: Sun,  8 Oct 2023 19:14:51 +0800
Message-ID: <IA1PR20MB495337659E69ADA1A8B1596BBBCFA@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
X-TMN: [RUix+Dtj22dbst0DTOIqgCJU+5/LtFGIze2U1vuBcso=]
X-ClientProxiedBy: SJ0PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:332::8) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231008111501.325200-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6db1f5-f2e5-4ee6-03ee-08dbc7efda20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AbS9VieWm+B0aZ+7gflNxLGLP11CbG8FXwtsuYqKsm/G9nDEP+rcVtnXqgT041BFkAJWRzqm5teuvMx/S79rBdOrJYgtaKLDzMPpDVvGbsSBZ+WPFhZQ4/JZknO8O70ZbQLtx6R0/bfx0y9i4bBBUuclzA15V2HBUHKqPLYkgZuf/21v5fFBGs5VFtElfKnu5frp/ZHBEIU9N1tfrAb9Gf18wQgi3XMnrAyNK28qAohg/olKjWBNVh3nbEr77sEq+EAf6+kIx36St9UMpaz90MI2KLXlWcG05B0YD9QJ4TMEgHIaxmfSss42DmqGuoxoxr3gw7oXqFbPgxkGp52HgVrChpxRyB9owpIbHMXyGSVGqy7FO97FepDPk4Ad1KnO7K7f1V6Gct44FjgQkO99JeTJtFl6JA7t9wRloU4BaHJscSlbZb7epQVD2JqTULWzXYfXCDekKw7e57+8dAar9Pmt0AH7HXCFyuQWG1dlLxDDGNQyBrXaNCCZouAdpi6SayI0+VGiBAbGSTr7ohyrUUE7vcvIXCSIA+/WdVLP9LQ8FfrsIJd8hiLK7zOq9yuVmri3SuaezFlqwY2eI9lSbjEbZmbf265lNoK+cMA2BWpPC12uoduYP7JCwPDTAcJyWuVmfb/70MXWanjGLZ1IGEX/YMK8tAUEVFIXLTol880=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DA5AfoADPOUh52JLS9rsQc6xwZEGi4nBQQ8LXQjiuj+k/3FE/sIsr9qYZhfM?=
 =?us-ascii?Q?s5xTlQLMcQcMwvcbYMF81eDpn9fdLnbhVf+B+gQ6Qv9q+b93Hutk6fEtWJqF?=
 =?us-ascii?Q?AyGtliAk/HR2UpOo8+PU7MhZeSMpXRB2svFpRSSGUk1BF2fh3mfVlYLx/8tA?=
 =?us-ascii?Q?iiDX8Q8TOH3rkPE7kXtI0SzHAJJBCN7ndow6wVNE834dm7tv0r4kUn/GJ6LQ?=
 =?us-ascii?Q?Ux+uFsxt5JYjBLKH8c4MUTeSUpj1RRIR4AyjP9/qwcIflKdMpWuqLNN7mfd+?=
 =?us-ascii?Q?8E5S8z/ZzkAWwpcFtRi8wfwH4QQRxs7Rx5GI/3GibVXJKzftZNamT9zfo5SK?=
 =?us-ascii?Q?eGsaMCSee6teOuLuUnV4KLhqMWIj+sgNTPoc5twYzPZ05XWO+qpbsV9pkC8J?=
 =?us-ascii?Q?zu4o9LqQEtqRMMfBsRsMi1ZI/23ERbWzRl9q2MPfQrAOBbngJUuUHL+Myctk?=
 =?us-ascii?Q?If+7lXjhv+fdWi1OnvaEGxahPFMSbqQ8eQK5IA4QSrBM2AZlcVIp8Vu4Zpr+?=
 =?us-ascii?Q?9ZzK4yXxG7Pj9Nd5NXLiA0HoWXSBuW/71QW6C72HHPvPFIitXT0axJjGh2za?=
 =?us-ascii?Q?68MJDDVJaQ7Jck6nho/p7zMKgmN8SbTj3n2uqMmDx7qUHee1SYORz/87ZY9/?=
 =?us-ascii?Q?exO9L6LcjW2EGfAEsZTYXfXMk18+G4pF8l0SqGf3/1dGE1W2aV9+IwCvtr1G?=
 =?us-ascii?Q?pWv2Kx7/evx2w70gQQwhJcJ2d33QytvQdSSYDNkyDDaBXT+s+VtHSXPtv+gl?=
 =?us-ascii?Q?/tOyPBy3eoEdJH/XJy1Km7wR2hUsTcLNXpAwuk9Fc4pUXqpw7WazXEwtcoF+?=
 =?us-ascii?Q?T0qAmTQZUa5JI0FZTSLMwOCb7PhSBXgdYgCCjh2s5qvMUOQXSKAnyxNhrTwI?=
 =?us-ascii?Q?RVy13QGgm11/03DEZiy5rAXyQDKcbivUpNjyvoP4JUHIxb7kpxXiTxFz/nm8?=
 =?us-ascii?Q?N8daBbtZmm/6xJcY4Hq8XgYdI67zrwKsSPCVjYGSOf6APw8T++Gx20lE47Xz?=
 =?us-ascii?Q?k7vKgxCDS6h0cE0XxSAE8UOTQrKCr02S9WG87GRwgASYo9NKTwMPLlvMh5FW?=
 =?us-ascii?Q?8uX/9mFKiw6ADnBa6Lc99e6lDdkHtuDHydbdQCaf15mHAFWF3euAV2w8/yA7?=
 =?us-ascii?Q?xjCwQqZ3EtqluNOLltdckZhmelhs36ak1rslrM7J1+1UdgPnU6BodVNiyTxV?=
 =?us-ascii?Q?P5p8K0Nj8CuU7gJRvNHMEDMWz6eTR/mTe96AVTX7nooxnzEF/HYhQAy70H8?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6db1f5-f2e5-4ee6-03ee-08dbc7efda20
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:15:18.5073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB6969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231008_041529_481132_B0E83DA7 
X-CRM114-Status: UNSURE (   7.24  )
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

Huashan Pi board is an embedded development platform based on the
CV1812H chip. Add minimal device tree files for this board.
Currently, it can boot to a basic shell.

NOTE: this series is based on the Jisheng's Milk-V Duo patch.

Link: https://en.sophgo.com/product/introduce/huashan.html
Link: https://en.sophgo.com/product/introduce/cv181xH.html

Inochi Amaoto (5):
  dt-bindings: interrupt-controller: Add SOPHGO CV1812H plic
  dt-bindings: timer: Add SOPHGO CV1812H clint
  dt-bindings: riscv: Add SOPHGO Huashan Pi board compatibles
  riscv: dts: sophgo: add initial CV1812H SoC device tree
  riscv: dts: sophgo: add Huashan Pi board device tree

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/sophgo.yaml     |   4 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  95 +---------
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        | 178 ++++++++++++++++++
 .../boot/dts/sophgo/cv1812h-huashan-pi.dts    |  48 +++++
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  36 ++++
 8 files changed, 270 insertions(+), 94 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv180x.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h.dtsi

--
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
