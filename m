Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9980AC4829E
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 23:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPjvd9rLL68WDHrB0t+3B88lQBS1YsX0OgdQpdrnDak=; b=vkD8gbfHVo/KVp
	EyRjHzudIumE52lr8Uo/1y3AP4I6qEMefbn7rJXUEUA0wpPAyCoLXhW8ssF0Mp/Es00trcdrkjphI
	dpMAQ6oeS9+hi2UaiM+GZnOwQnA7CuHOZl4akQF5gE5salVdt9DSa7m6D63qDMPDLeF+FB6yvVxMd
	w8UncFLJBPwSIGTDoPdff9mvW5+VRR48olGd2PfljV1iSquPeUxDZZXS1AtkXt9a6qURfcmbo+yh/
	fs+7Taoani5948EuPOWYOLJuA1QlZ88bQWehbAtXPXxvzkkbsmuxXI+DDgvQQy5Af+HHiO5yMkt0j
	c2U14d3GQ7tQtzPHIvuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralaa-00000000XHi-27wk;
	Thu, 15 Feb 2024 23:56:24 +0000
Received: from mail-mw2nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2805::800] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralaX-00000000XFh-1cgs
	for linux-riscv@lists.infradead.org;
	Thu, 15 Feb 2024 23:56:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqxmotIsV42V0UdRnIwAZwCA4pRHAZ7/V7IOctpXmvn5oBbkiT2SNKvkR/4GboGumImsdj5aza8ga5fHPMOVTWh7fy7hm1MteKFrpcmy7L3oTLTejKAIjbt6j1D893vdagh9HNClByia5kjTakrpSp3s81FoMxlN5HnrrSJmOq13j9A5L7KG+1+igsHc5tfEQqWE7vCZ8lx5ZYnajyhPVDh/TT0HIy3XzjwoxRWKMlggH+kFJ+48WfE0m9kjiaTBbYnnByGSbr7LVRnCUzWpEuAHkuENViDzt8+3a89/KLFPFI9gXYnhzLhe7IQNcpzGw7xHFaCf4ZOfGy2M7exDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YMMjR1OyCdPEmrs1ZpUkTTP+WIu+p8mRTlYOHvA6uYk=;
 b=RMARdrffscC4yFrnPGjQoqoYl4Rpqh87lkvj+3bsS4pbpLo45QM9sGlcPdcmZsshkSjjZNNCGX1rh6+bffzBSEix2CdHGxJnLVj3GifksTJsSDznwOMZ2PJxUsUHCeYdmS6frb/tscZwTNaIcWd0zgs0J8w0vIq6Sj0fBNv7SrrKzuICSXnsRYzBRQnSnRZh0ew9CR31WuT6cTT5+Ufkgxptm4FmMXf8GIumv4AsB9atl2ISrbgyLBDWybBPmjZU0hFD/+FrBPszKYpG5ytsxIh9b3AaKQ+YjN5odTQ7FPmwyxlpOu77gYSDKclNX8Hj7WIZB8KcD8wDOT4OpBWs0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMMjR1OyCdPEmrs1ZpUkTTP+WIu+p8mRTlYOHvA6uYk=;
 b=FHYSZ+m316w/Ru9NTQks1SZedR/pA0k5/7ox2RaCYwL3ERzQ4wuT28Z6pRV+jISFu2D79jk3WVCV1+gYdU2EH1icBjjkMl21XJg5bQ39nobBpXeapCMSJ3BKB8XM2Wf5Rjgw5zvqqIdB+46FbBir0cEO1RfpoquVbDD+KDT+cd8sju2mvGmb2eHoTKNCkfIyDOMCX1xTqvLBOMptFht5I/hIzWMOeAE7u5hlBrtelKQnPAQ/M5HnWoWXO3xfjPerxiYC1I1xFAG89ua8eFXY+0HypGGFPKgzXsYEPZucMYNekw9I2+EH4obJzceURMLg6ZzmTMaN+a3k0Hio2CBrMA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by DS7PR20MB4112.namprd20.prod.outlook.com (2603:10b6:5:3a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.28; Thu, 15 Feb
 2024 23:56:13 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7292.027; Thu, 15 Feb 2024
 23:56:13 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: sophgo: Add top misc controller of CV18XX/SG200X series SoC
Date: Fri, 16 Feb 2024 07:56:16 +0800
Message-ID: <IA1PR20MB49533FE55F2A0D7FA0CD6949BB4D2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240215151316.GA89268-robh@kernel.org>
References: <20240215151316.GA89268-robh@kernel.org>
X-TMN: [rEMLXFHHMaBBVM0nHsQG0nq5c/praLxIzZR2vhX4WJve4WqrNCtodWHpnJ0dhMI4]
X-ClientProxiedBy: TYCPR01CA0194.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::18) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240215235616.55084-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|DS7PR20MB4112:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f53d823-7a9c-48b0-1408-08dc2e81b08e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJu6w/2EpPvJtvXBO0xVe5MtqtqpGZ2yBNBzFAFUoHcUZrArx776YRc87m2kvdTNjaJ9HuTRYFJlVBWmcx54UYXu0J22j7ZP643SimHHtIxTN/csVNYTndWLRVoyEqPAVWCLEnlFGgTLxtxaeS1gKInDMGSDlXDf3oc6cJ0Gdr2l+aDHSBBmWtNkjOdPSxh/iz6kHl9IIQbBt2UOsN7mkzCjttkUjEOpVNFtXwucr3nKQFDLvxaEffNyk0Zm1q1130dcXxUKhZ9MMJ3avJOMd1X+eh3JSx/1GWNOkgqbSJIi28jKJ7pJH/8lzDkrB0ORJLfXesR+fb8mwj7RhPHRJB25zD5scwEYayy/xF4EzhHWFZPvqAerQGv0yf5Yg2ijpv2ycDnqCqwtrzD6Rk+uKzn7nOvENhvr9/b+tC3kRCZ5DrC3BJEE0Km4kCosp00cGu1rr6FII9HhYLne34uflX6Ygv91r7vfqj8vQF89oJ6Eib++ePVUyYuIc765an1wDSKDnfaDI5D/o5mH6K/isnZSiBs9mdqTfTGlEq3+r14kC2oplyI5p9zhQso3GlNtmeYrjTmN6OYU9v3lOpgzoKtDX/Jyb0tPnTtLQt5ulFqf/bMWhlksRfnRCHpj0QxCBnw20lNb5dvMbTaWPkZcEYRt+ry9jOAIG7OOh3Ml27o=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?03VEGZxWOhoR1rPIGuhNyzuoQgUZ96Ezra+lIIDXLm572NtLZtgK2LgCWv96?=
 =?us-ascii?Q?1cpeEkgMJ2ssl8OZkQQXmX9idGSxn0ZMQ9OEAFJ6oHAQfY7RnNI9d/j/mskf?=
 =?us-ascii?Q?ZNGwnOpI2Uxkzpi9HM0f+BLyqDH/2cbpHxDEH87GGB23GAcmNSRTREXk1CA3?=
 =?us-ascii?Q?z6ihWEAlnx2UtjG8bWrvv5Nv2YeQFuObJNnctIeVmO4dkGcy55QBODvEXHmk?=
 =?us-ascii?Q?YdZ4KXHh3i3XGrRYTrJgwxK4WKv+Ejuq+PjE6KZ6x6/Nf2kMaW1IWnLISY4q?=
 =?us-ascii?Q?RYgxg3tQyQ69GHoRDVyzr/ZuE0V8r6Uf6U72KScO763iYWZg5Qyax4GHk3wx?=
 =?us-ascii?Q?XUMaVMJce9p9Ewgn0Eu5PY8NyUtAWBjWiC1LMUZkSvbEtl3L1g6txIb0K96S?=
 =?us-ascii?Q?H9KxfIaO+UeFRf/zrN9m2AoNepcYTCzNpGXte9RaB7WuT+4pdYqNzvkcJEvf?=
 =?us-ascii?Q?G7IUVm4Jt2JYYggRNPBYmEo5y7plfT6554iCW+OJaKfA6KTb3SoUHDF9VVFe?=
 =?us-ascii?Q?r8v3gb/upffuN8pVCEVjgZQyr64om2rGJ7RasUos22ltTObYIrCAvR9tIXnC?=
 =?us-ascii?Q?EIBtC45FYVgMkTdQVMyXPRHl3dnAuXwP3SNAOP33+3QkZrcfyQdNG6/Q3v49?=
 =?us-ascii?Q?i8k67S5DH02caGb43CtN8y33uerPvFJBTLPODIP9U/EWxkphBJDJHTKyXOXg?=
 =?us-ascii?Q?VKUab0QXzOuJrBbzXjR9M5WesPvEubRvDc59vT7GQ8D2u3E/JEgmbLQhORoa?=
 =?us-ascii?Q?XmEokR0WTV7ck9kduo8meLd1RdwMILB6nDzZKsSLXgnpqJYNfcCcl4E9U5YO?=
 =?us-ascii?Q?/lhyQH6mYvO3+ySnOzhc9jRHlVgL588bJJ7jIBvKJxwvyWofvNYMvtLQOXKm?=
 =?us-ascii?Q?Hc70xrDy6innS69yPtRJYEHNCyRWpVm1d9QNFv2V8M5i8gM7IsGcqkShRvp8?=
 =?us-ascii?Q?1BzDkUa1eQfOpeMZSkK/iKC5a5hzshsqV/QkXkakSbS3qG9MOCWetRw80FTY?=
 =?us-ascii?Q?5gftwZPn6HnM4xUgKlpMzIAd/fXhphEtjJKk6D1XgE2ZFMXBPiwTuKyJ+o1l?=
 =?us-ascii?Q?ZVGN7adSbJQVN87M7DB3cJlvSWSChUu68crbhuh1X9TL3kaerwwNufBnYcxX?=
 =?us-ascii?Q?od5xrlF2LkP3buflqKXLT2HO5BZtv3JfupVtDd2Tj15FYkWWkWqerBN1lxPv?=
 =?us-ascii?Q?xHDURT2GnXvQpbiioRgOX7F/Rhm1XmMSSdqkgRX4NVRKVwpBGnP6kN/XEf2O?=
 =?us-ascii?Q?8gU26PGiw0DHvrPB+KA1uIqp8LAjz2qbxbv0zXYTDcXpGe8yYuqcgLshMgUu?=
 =?us-ascii?Q?/7w=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f53d823-7a9c-48b0-1408-08dc2e81b08e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 23:56:13.0501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR20MB4112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_155621_465257_D55D54AE 
X-CRM114-Status: GOOD (  14.76  )
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

>On Wed, Feb 14, 2024 at 02:33:14PM +0800, Inochi Amaoto wrote:
>> CV18XX/SG200X series SoCs have a special top misc system controller,
>> which provides register access for several devices. In addition to
>> register access, this system controller also contains some subdevices
>> (such as dmamux).
>>
>> Add bindings for top misc controller of CV18XX/SG200X series SoC.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>>  .../soc/sophgo/sophgo,cv1800-top-syscon.yaml  | 40 +++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
>> new file mode 100644
>> index 000000000000..619237532801
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
>> @@ -0,0 +1,40 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800-top-syscon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sophgo CV1800/SG2000 SoC top system controller
>> +
>> +maintainers:
>> +  - Inochi Amaoto <inochiama@outlook.com>
>> +
>> +description:
>> +  The Sophgo CV1800/SG2000 SoC top misc system controller provides
>> +  register access to configure related modules.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: sophgo,cv1800-top-syscon
>> +      - const: syscon
>> +      - const: simple-mfd
>
>You have to define child nodes to be a simple-mfd.
>
>You could drop it, but I now suspect your binding is incomplete.
>
>Rob

Hi Rob,

I have a small questions: Can I drop "simple-mfd" and just add it
when the new subdevice is added? I know the binding is just a example,
but it may be better to follow the actual SoC configuration.
In addition, most device node should reference this node by using
vendor property, and only at most one (or two) subdevices. So adding
simple-mfd property can be delayed, dt node itself could be more
important.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
