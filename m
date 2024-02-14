Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B71EC48260
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 02:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bh2r3FtaLnPDM8Cy1/uRuY8NlAqeq4yliIT7FJf+i50=; b=ad0nc13HfBYLXV
	+RPmd8+n7ReHhgyW2mS0KLo6AFcuYxRHc5PWOFGJVfrwumJGGSY9GfCAvP1FlDL2iMiKGF1dm207/
	m/Yx1WLHh5caiAP8X6YuQUclARlu6OROU0PiMXX4uGPmOL+Q+B5cEs1QFzFmb3k61A7E7rHIxuwe9
	Za6Fa85dQSlr60JxHWFB8zyO4eV8CV9LDqgAcvP4Uu/rhjM8CyfCHLetQ6UIGHH6wB26usrdLvQeo
	PI7NfgewGO1WTLiCYT5hhfHnHvxdZJU8nhokalWrGtWUvKLJaVV7smAZIfT8116yq/iEJ64uWClf9
	6pCg6PzsZlvzdne5iTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra5IW-0000000BY7u-0bVx;
	Wed, 14 Feb 2024 02:46:56 +0000
Received: from mail-bn8nam12olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c18::801] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra5IS-0000000BY5L-43uY
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 02:46:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cz+w38IqmiVsL0t78YIBmIxxPw8Doee7jc0nP6JB7PtnRjfwkSM29iZz5hHOa6t7H4XF0Fj+YmTKh9gr0jfyjV54fZzI+JvIBNxUrgYjUAoCcwAVqklQxQDmOl5KL1BGKylNqITP+IhS5TNiRubRK7TvkibD9zlT4az8NukbKlT0qzV0S7doGCr4UOkcPTAA3bOMll+81nZKm8qBjJGzWkb7D/01wGlQ6AlLnWAiEJGvDHS+YAfXJuqWwIVNcwM7MlZNl+Ms2ecq5N+DzZnuPXRbKJrb2eVDCqrrxQyL/leo22tuNwvyvH9r71RTU/yJaxHiNL0qb5NITGefs2ZzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TekwTNAVcDPO/oUUBNIMfGKrAL7Zn3dQrMaXtH6jOpM=;
 b=e0V5q4s3RuN6DN1CqtFRsENsezcvzdxLwA38zL9n5i3LLNjjcuxTgNoTzOBPdtk5Z+KvMGTGVY+GXlxjBOjlYioHtixtvUE9crVi7SyfvsLFXCbnnvCoA11Ea5JJirVQx3EwrcrggnTbixL/hyAEhtnrkysRciYNq1Uv78SiSZJP8v9nywiiRdr1kB0qXMtYo5yiycXhLoCzTZ3gbHwcpOHoRVTVSiyBIaoVgPpomIKPp75/seWRqmFlCRIja5/xe0wbKizMxnQ+Ee9oS9IRWPxRjbzysBSF1K3BjNl/Btq6ejjc+CKK9/LlFaJoajlX1MmM+ci/5ZRQd360CSIUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TekwTNAVcDPO/oUUBNIMfGKrAL7Zn3dQrMaXtH6jOpM=;
 b=I+PcJqFMTGkSusiB9l4fxVt596hbIjv5RDosXOa1jz6mGUW9lQ6OnSDKuwXZjma31dcl+72KURziLJpU+9i5BWDPLmT243eTgsbFuujz7pYuC9gBt5ikN+qVNKrouuTrnQprn/QwkfqRnyYl0NkiOQE5katU3mcLmI95936CTGXrrqwATxknok5S7qFr+7NmuBENb71ooukQQFXaxuH7bWNe+bxpP8WmhCk+W2cT/Pz4sPZB4yb9QXLlXNq68veA7GiEF89TItb668GX/2NlgeXnehzEmDXXMxY1TSsym1Oylc6ZoflUgOP30FjfPvBNhHc1gtbgkKp7A4TEdHapcw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH0PR20MB3788.namprd20.prod.outlook.com (2603:10b6:610:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 02:46:40 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 02:46:40 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	dlan@gentoo.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: sophgo: Add top misc controller of CV18XX/SG200X series SoC
Date: Wed, 14 Feb 2024 10:46:37 +0800
Message-ID: <IA1PR20MB49531CEFFD1F04CD768D8F17BB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <170787731083.3026929.8244516804059249825.robh@kernel.org>
References: <170787731083.3026929.8244516804059249825.robh@kernel.org>
X-TMN: [ojYaUX7n29OUqm7d7pUUH8qBBxTXrYWaB3IwYn599LIAEr0WM9X8CyvWh6ZeRSeg]
X-ClientProxiedBy: SGXP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::19)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240214024638.293044-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH0PR20MB3788:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5988a3-d7ea-4822-f51f-08dc2d072b80
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f8MoyBo21R7JsvduD3M/f+9O0mphOjaK+qCcDVVX5bJ2eMAYmgGW+JULN20x9vPX2yM6ozm4LI+rftL3C5qAcJTogYvjZN2m8dfstTpLE+uNr7FFRB6wB36Zo58tfZuQ+XEHXIc3BlJAfoBaFdX9Z/cvJKBlItCQIs0+xlrMqx6Kd6ZTHdbX2rUnsi+y/MgwwH9ZFL2TPOB1OKl6IvZa0p2k2YyypGKk9Lr2pMaLbe6S57USHlVRYpmv6ehJE40u2fGzQ+g4Sgg7OxmfHgqclau1wW0wT85a2XrRGs+TL8vSLOugEkCDwAMMFdwu/HC2Qe7JqVyq9AmzAZ9J8mI/j2rYrMMmQ2KgLoH5hilvVUwq+gZliCfeudG4PoW/T9Ym1Is7Jf1doNKSvxzDwQRFFmNgGfv93x5Xxl6hrQ8YkUdHWfQlEPq7OKCiPy5zeGVQkwSFLj/1Oj/O5ky4d4RLPKczqhqExUCJdtdIM9z62PCk6TbVU9Wqxf8NXE6K1RI/QXZYBgwEbquxVFXSZwS30XY+5os9lHHqtB2y7hUWqLmtWsk3o3cqvNYwAPYqPL05ioIfC9DE1VwG87YPVvO/YnLrezeONnzmc4IY+TgtpcXhlMEy/elGdzOlRh9DU+UY
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0f/kexceOl1kAOjP7c1Na39Xdp3aY+zYt75b5k9nAgV1L10vs81TyOwRiqdV?=
 =?us-ascii?Q?rg7m4rFVrFWs7I5yNfo7bx9/uvC5SfpGXIgDt9Yl4AwWN1YLUHawSC4r8Q2+?=
 =?us-ascii?Q?eJBtzMwK8MiN8arMG49WdU0v+o3v8TvioCFdjF9zYESTUwW3ArAXAJS1lOmP?=
 =?us-ascii?Q?G+btAKh1+5HnuehvF8b/Wf36u03dwXqtXYrD8c/FTFMLimx4JLH3PQmYHY0v?=
 =?us-ascii?Q?XA8WTJXajEF2J2VYWZgJEcr/8ZxXXD5xMlKq/BW8jF6KzxGaJCxuosAZ7yHG?=
 =?us-ascii?Q?A/b2jK0CaGqWVccp6pewBJW3ocgG8pP25M+eariqPltc4MMGtiMFOVYV0mJU?=
 =?us-ascii?Q?5RM6eru6eLc7YHsVaKpoH8aeOzTNRQNjN+Qcr3iE4OvVYApqXwh9W+NTFIPG?=
 =?us-ascii?Q?Ft0yAspO+vLKsr3POIq3diSvzD4NPXiWfcJvq9HCu4jmUEAKtFPoROPnPROE?=
 =?us-ascii?Q?Px6hSDjYOM5RdvCzO02x2YXmf4jLiOhb9pU7yz/8W4qVPZt5rP2LxBHdb73R?=
 =?us-ascii?Q?AGN4O1vimc+WPPocPRKGK6MER8927NPGzEek48SRLR1V/g8hFnxoXIdvrVH7?=
 =?us-ascii?Q?cdz/Z67Hg2dgK2Uc6qwYy7Huogv74utmIEJH7kVVcWEorTNAKUDHHEhkr8pH?=
 =?us-ascii?Q?2GFWGPxlsd18YrrBq2vd6oG/J3pN3pI6p5+7jSRddYT7d6NIwKim3+GslSkd?=
 =?us-ascii?Q?6Rs2yOVPq4XQ9g+cNrhiBlKWr1YzKUgZDtbUaF+SmgfltTR0DJPz22WTPQxx?=
 =?us-ascii?Q?MjpiAvkaWYIhfzZkpwoFbItj6z2rNDGUVODRPyUqShLNhuIDifW+WXfEevSn?=
 =?us-ascii?Q?dL3fhvJbPBkZn6ru9KsgRCCScxPjq9X4NG0hlSggUbr/uVVKDadhEv0M9lhm?=
 =?us-ascii?Q?sFCsQk7n5uQuKGzwkYeI4ZJ8678CF+tiTPdOkalfbzTwRHETK6saTT7fCY7R?=
 =?us-ascii?Q?jLDmH4G5rgX3hnoDt0m3f7xtZE985IyISjPQnRyKkrgV6nMuv1iOKN8Zhjo8?=
 =?us-ascii?Q?lmf7O1K81VClkmSMTipEd+KuAPey25prw9wSiEqR/m6yK2lQmwTX6X6caF+S?=
 =?us-ascii?Q?faChPQS5Q/zHdaHH8jtcgYkMR8Y+5LJnSVL55/4T9oqnNwgnqsrOO9opvjHY?=
 =?us-ascii?Q?IEVBnjUfnoGJb5HegPRmjAROLHvul+hZqAdZJ1gzk72ZZk/kzoXLA4PtbJfp?=
 =?us-ascii?Q?6DoiP/TUPRqTo1xUVUMB77JuV4Ic3WodjEwkb9WvYq3TTtUxKw6Zxk/njtem?=
 =?us-ascii?Q?i6POkG5T3769YN/cywssV0Xg8Z1hdDssPdVIedlWL7587umV+kWIYULZRtwV?=
 =?us-ascii?Q?6CM=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5988a3-d7ea-4822-f51f-08dc2d072b80
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 02:46:40.1443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB3788
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_184653_107846_DA6176C6 
X-CRM114-Status: GOOD (  11.75  )
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

>On Wed, 14 Feb 2024 09:35:54 +0800, Inochi Amaoto wrote:
>> CV18XX/SG200X series SoCs have a special top misc system controller,
>> which provides register access for several devices. In addition to
>> register access, this system controller also contains some subdevices
>> (such as dmamux).
>>
>> Add bindings for top misc controller of CV18XX/SG200X series SoC.
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>>  .../soc/sophgo/sophgo,cv1800-top-syscon.yaml  | 43 +++++++++++++++++++
>>  1 file changed, 43 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
>>
>
>My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
>yamllint warnings/errors:
>./Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml:35:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
>
>dtschema/dtc warnings/errors:
>make[2]: *** Deleting file 'Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dts'
>Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml:35:1: found a tab character where an indentation space is expected
>make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dts] Error 1
>make[2]: *** Waiting for unfinished jobs....
>./Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml:35:1: found a tab character where an indentation space is expected
>/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml: ignoring, error parsing file
>make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
>make: *** [Makefile:240: __sub-make] Error 2
>
>doc reference errors (make refcheckdocs):
>
>See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/IA1PR20MB4953DA1000B825CA29E3BD11BB4E2@IA1PR20MB4953.namprd20.prod.outlook.com
>
>The base for the series is generally the latest rc1. A different dependency
>should be noted in *this* patch.
>
>If you already ran 'make dt_binding_check' and didn't see the above
>error(s), then make sure 'yamllint' is installed and dt-schema is up to
>date:
>
>pip3 install dtschema --upgrade
>
>Please check and re-submit after running the above command yourself. Note
>that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>your schema. However, it must be unset to test all examples with your schema.
>

Yes, you are right, I have made a fault when processing the bindings.
I have correct this in the new version, thanks.

Regards,
Inochi.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
