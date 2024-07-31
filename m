Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95356C3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qoSxVtkPQj9IY6M2/CHllHhvuJ7i1mY1OJLCWwu3Wc=; b=KkOag4da0tupug
	bwhtqMiquMzeUzWRAIZrLXf+CjlCwYGbyWc/JrVyoGYB5B6JdbOs0leR9kCGmLEYgQ/IzpMIM7fpw
	VwfY1u67CNefUTL+HHMXam8qymERzOeGi/iNvNK9x5B5zY9unUa6h3FKCgnefPedlW5RDHZUjADLs
	L2b7FWIKgtjEyLcm7OePiKKpLA0LmyVToum1iWoN0JOJ5tII3TwQU61qaCqNa1OG18hS4bXjTgvMY
	UQRL4o11/WiIpJGUTDz8IlTH/wWU3vGtmNz7jBD6LmjdnxREg2xrkPfrdKYBOnNXjre4r6exf4yqk
	4csRdbRXtfrOf/UfE7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4Ea-00000000DVH-21Ii;
	Wed, 31 Jul 2024 07:58:56 +0000
Received: from mail-co1nam11olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c16::800] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4ER-00000000DTd-2Rfo
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:58:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCGRqhi7slA4gadufyBhDh+/cxxVeWm4W7F2h2UfN2f2p4ZqrY83HDW3ZSpTC7jKWw1c565vH+zSOtF2vT83NnuMLCdiuqgDFEI9PisZtgTNaCD7+TKfZ9aXxnZJyUAMNZ6qaZ0ld1o5plbLBqXyKJKP4shY0soJlu1hZJV924q/XN1dPd76FP0Cn10PPkqIqgP4u7E1U51eFWS0ToEGyN+opvD8UX5tb06G5/GopjNsksMxdNktpnRrtjLs2Jb79E3a6ahV9R53JKAUCVOseQ1kTQo9RTw2+KD3c453lkETeWYj+1Lve2plOWmGbLvfXVhmOaUyzZr93DxeDbBqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l31kTjDUM6lrLQCWDqRK07Aaiv2VCztZ01dcWCtWFBE=;
 b=WhkdMqya7LgFa4YKDjGogfQURXWvwxiayYyW7eG5ixFZBXAAh4rGzpHbqbN4ydRWdoubObktDT6mfDZQp24IHvdl+J1nQR490YsdAaJaPnoRQLxAum3Vekapq4++UtEhOde7gp+QEVdypSMpI0zSOskQhjQtl8tvDTCap7JIcESy5ezWFWI92BDOKtb41WqtwgoVW1X4b97ZQ5Xwq557Iuuf1qu3djvjWnAPllSScUdaIH2jMsCiaek5EejUfRsiVIK3er1kT4nTrKstSheEmKNVuywXsuToIRCFucqI14iIrgPx62gY9LfOrMo+hag0G82sd5N9jz6WtAJKrHje7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l31kTjDUM6lrLQCWDqRK07Aaiv2VCztZ01dcWCtWFBE=;
 b=rc3/aITtZ1eZira6wp9nzL8B+aXBsjjDQBzMeNoHaGt0KIlQcCOILBWhGNdIhS5WPB30KYwGSWPivkYUs/NTVPHLk41EIHlZhQ6QxF6sBEFy8gPm8tnKd7zCZjCAGj8iyvOn8zcPo3BsAsyxELlftD0a66YcoT5GzhaaufOwybpIdxkp3hYCq4+4jcML9EH6gZERkFSHLqHouxNKzgAK0zCIyCgYC56dOJR7bJoo9TRwnzyjtHcFDcpSEzDzsjZlaflUBgmXWe5jD5xtdTdv3ItNPnciDpJaC7zfV5D7ooStDABWd73sqPYqHUJVX7N7Lj3o2R4HZ1wRtx80pXAj8w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV3PR20MB7123.namprd20.prod.outlook.com (2603:10b6:408:1b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 07:58:42 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 07:58:42 +0000
Date: Wed, 31 Jul 2024 15:58:12 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicornxw@gmail.com>, adrian.hunter@intel.com, 
	aou@eecs.berkeley.edu, conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com, haijiao.liu@sophgo.com, 
	xiaoguang.xing@sophgo.com, tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH v5 8/8] riscv: sophgo: dts: add mmc controllers for
 SG2042 SoC
Message-ID: <IA1PR20MB4953350D2A8084D53362785FBBB12@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <cover.1721377374.git.unicorn_wang@outlook.com>
 <5110a64d513390c01daf3b4a6a6fc5560baf77a8.1721377374.git.unicorn_wang@outlook.com>
Content-Disposition: inline
In-Reply-To: <5110a64d513390c01daf3b4a6a6fc5560baf77a8.1721377374.git.unicorn_wang@outlook.com>
X-TMN: [Gob5Lht3fZXb+B1CzTPqNjCU72tac35xPB4MV4ZxNS8=]
X-ClientProxiedBy: TYWP286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::22) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <t53u23r4jwfc4n3j57pc7o2xg5d2qaycqxl2muufk2k7zpyzxh@k465xiotrld2>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV3PR20MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 0969f831-c031-4237-c5cd-08dcb1369883
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799006|5072599009|19110799003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: HxXU3Ra+HGhXJL1UkRj2sSrR/U/VxfrzKW7Q96RrPMfJNQjh5LoAvDsHialsw7Q1vEVpSXYdyB9z/CJ8U8l63LNkG2oTJAJi7w+DkVJsKumZLapZAGXVcT3eNU5txYyu55W0WG9wvLKNwt6Jo9+IW1EaslYlPH1zw1m9vIiq+xqWU4C07Kklx/UkNfYdGz9d4I1HlLauAjhz5LdSwyq8XM4tFpva246OG3PoHfsay5t9ubTpjMu6itdugoJ4pHOiQugpp4JHdcN23OKl8sRe08Si6B1DCrrjo7QC2UP35urTJLqynmYpDcCDXEUlw8yphHPo2eTdvJ/r4McL8i8KbDJLU45+3eJR4pytSwLhbYx1VmZq1KlW024368YbvLr11cbAXEB5teUwhC/1lAgG0d++f4r/8iKB/jjpAJHUTIcfSZ7iX7Fy9Pg5FgYiSID/gYJsyvGgcCmPmb68VHxgJS6GlzjAO4EQ0ktNAskF9xldE9R8U0TWOPBTihQYZMV+/IoSl9KRqT3Hb5+o+LB2UiL3fjPA/W84AOKhDkCn7wQkIeJyCRzMC0fqs2jRzF7WiWixqqK7753UxK0/lChHmDIM52fNilUcuAYdAps3lwviVQwtEm4RtruDkOwP2joJOv4dnChrfdj3A0/vBORBVlXuULGr6sVnAJvlmjXBnm2ZHnniLGiQZeJqehrsTyggDlxd1UdezSnh5KYn72fYuw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MTVmu9VFnGQAVBNJtT6gjlNhQK/iQBuLAFD+miYu83lS03o429pgkC53jaxa?=
 =?us-ascii?Q?94qwsVNmyW06VZCfYixyRf5rezqm2zV8+878w86zjYfnWPGH+Gx3f/E+TAcj?=
 =?us-ascii?Q?KkyriGXOKyeaX57IWavHoYZ2eRLWKh1XQm/Y30UKYqf5zqyUhjZL4SqIrRns?=
 =?us-ascii?Q?J+7+KuU16/mcr+Fby00m+80DIh19OAmnELFoWA53swA77oHurGuSJtQAVKJk?=
 =?us-ascii?Q?3WoR98s5+U6vHcx1Zj/dx4hE0U18my3SWd8HTRIu5+Iug3Jjy3PpKuUqZuHP?=
 =?us-ascii?Q?sJTGEIuxvEX/sOs630/EFyAiYL8Xl2JVXNpoRF7TblObkJbwrTff/u356Eqa?=
 =?us-ascii?Q?7/jrAO5V6XngiGN/TUNzk5+WhzrwjZYrcWKGAT05iG/von27V6tc2pmrd1l2?=
 =?us-ascii?Q?1KbG6InpuCvdTpYUC5FrXtK+jk8xBUp4JhIjPJT8BD6aZxRy6aG4W3pFPxDl?=
 =?us-ascii?Q?rNfGAGrGQket1LH7KuLRwI3oCj4KXVGU02XaonNPMpiA4Guk+i5w35NMMRxZ?=
 =?us-ascii?Q?vfvwF5+4d97pqi+Odjb59LMEGI6U2LfI/9fYx6khzHCCPbABtWi0XRSnlA1A?=
 =?us-ascii?Q?g7gU+0QD9F7b3tNoykAlP6+0xYIp937YJZbwGy4hAatF5fS/YU/z86d1ojUd?=
 =?us-ascii?Q?1C4TJIwIf22TjUcrcLJ3xC0smPU+9/McGx6MjRoCcjqhusvJ0OCxpbNOGSAq?=
 =?us-ascii?Q?Eq/7cg6dGfMdHXA+9fcYsN1sZPgvrnuCvNaqM9SfRKoQf8Ce1Hr7CXbMqcje?=
 =?us-ascii?Q?X7qQSEC22QAocp6O0CAt7UKhRrLZ34zr7nQn2l+O9td+pCvQvJ9n90lixNWh?=
 =?us-ascii?Q?QQaSnPTU1wBy9tvEmp+Gqd5mk39P0Q2qllOT2G5toEOI/dIXEgRnBXI3+3lL?=
 =?us-ascii?Q?0u+aYI1DTuT6OUEJ4+5jsjF94m2FwjVo+nj6HCnSOX8DNexJ47NFiuaob3Hn?=
 =?us-ascii?Q?Bs27PUqPhgxaWUqzPXRDf4PEYibXAx9Gt2SWGlZaSyqOk0fMPeYn/FRInvwV?=
 =?us-ascii?Q?sdU6XHezTbuBGfVUFcCZmczSaNAaO36P1KVYp1LvrJ/jA2OGX8jyXwWz25wc?=
 =?us-ascii?Q?+llUqJW8eVulKzpHHEj+K2O8+hDWI5AHYtHHAM/vz+rlyiRlrkC/uP2BlISn?=
 =?us-ascii?Q?OZ0edRiYQmaDgiifXNRTsDB9MAMV6UWnU1uLsLls/HzgHBE1Q7ECqdZ7WEmj?=
 =?us-ascii?Q?+UPKB+zAqK7mprAE9w8H+tJX00ip0frHOZr9aX///yeldhzvR9EduPu6hDmA?=
 =?us-ascii?Q?A/e5jmmfQhKt3oGsxo5T?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0969f831-c031-4237-c5cd-08dcb1369883
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 07:58:42.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR20MB7123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_005852_214200_09F9A0C7 
X-CRM114-Status: UNSURE (   5.03  )
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

On Fri, Jul 19, 2024 at 04:47:22PM GMT, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> SG2042 has two MMC controller, one for emmc, another for sd-card.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

Please rebase your patch based on sophgo/for-next.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
