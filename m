Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFDFC4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 00:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GpnvyILW/c0Wl4lyErVUlTI7i0BtqJdlz/JBfO/7v3g=; b=rQA+C9fr8oXFWw
	ob8d/J/QVXRyt2ulx3B+Ue2EfJ1qCt9cP8WCFhPbjnStYvXea7awean0ZdWeV2wIqvoI5tVqn6HnK
	9N0VAIIDGtrTrb1GHr2ImaVoEMP5YD0rv3lkfSSx9iTkjmxNOBXfeXre2QDIhPG+Zk5H2gGVVtfRy
	gNPYIWIZFKcyReiR67wCFTVTaHITcxzRbZ+IRIR6St+SCZw3kQIIb2myTXFQ709ClXGrKnRDzfav2
	b0ho4yRbJ8bP9B2KvDvtJ4MeGrM2g9qyp5fVyef/abdSEAgV3u6jN1H1x0HE2XvAaF1Q4Pl9rKpfn
	d8qnhuzQk7mEflyIcrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXsAn-0000000CIgd-2gZU;
	Thu, 08 Feb 2024 00:21:49 +0000
Received: from mail-bn1nam02olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c07::801] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXsAk-0000000CIf8-2JIO
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 00:21:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvJjwZzCaVhlvTzJbKq8DJOZCUQmmZbl57SHmkb29mO9KkZmOnMKbfmaj7A7IFzFCXLjGOx4FjfDVZj8qfWzN9eCX8iLJmXkYjXjftkUpCtECfcEuWM7Y7EfhgQAFqCKERpyCqHrW8cyiHdzFuPJdbRKjN87kmYN6yMVfXlG3DjkbBcMcAwfRwZWXE8k9CUhRztciHPiYGLNpaAPpLGAsLspsnKZd9bihfmqHbfzf0yf1ZHiK9OlTOMYT+XSFhPbRJ3m9mLs1xxFy8h/N/SVaprkfJFTj+YCSSpdZyiHAaGgpWx4OMFlmJV2/9/MkqbCNINFpLpFA60dREdS7YhgOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGezQzUhQovpjvb7TPzDYs19/RhPOvl3Wlec5xnoyM4=;
 b=UHMMsRhrrLKtidOnbOj3EtV6tAApoNbpzYxPzAghcGVMYQ362/XH5PWyRznGiSAG/3I2PxQr4Q3a59JDHH30ZUgXjUWZuDdXCxY2UWHC16L6IiCvRXlHBs3I/jYIfBMjWCdWw6odkeN2Mg+u6C49hK8zG48ldq59w2PUcRqn5dVGhc6TK47hjr5OWDqu3bOuM9bwu9/pkZSMmLiDbuAomcDNdiH8Og3ud1iAXvq4RqMtCo59U/qdAIlSkgGnaMSdolDuxdJ0DkFdSFBTLNdrJV/Kc83GcOmCeIn+AF1L06dhbgW7OKW+r1noHp39Ex26grrLbdYoKhphpcRPz7MUeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGezQzUhQovpjvb7TPzDYs19/RhPOvl3Wlec5xnoyM4=;
 b=VKuZlJ7ShvQsWA8Y1v6a4iFg5MovAPFSl45J5ub8AiigJSOHaSLOnRuqwSZyh8+J2LtCLTHLMSIg3RROwyRgEMKb6EgMH6Qr2xkdjgM6Dwtw5ExU456I4le81CvlSQlpWRjlJpDqnGky1NmKrJTN62g+wvQTNQn9azJTZGpwmutf2KBhXuQvBwuV779Vh+h+1pFq7lNpJcsWXI3rMl8d3GbMY0FaT6vqj2eAZFLIYVEmowUQvLScBlinrMASqkuGcE61EUyKt9SxtYKNvOxyPr5f9jadNjOPeeOLyZnrRioOXoYQeGgEqlN2OdgQpwXOGmAzU4hIGqX7Vyt1wJFVjA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SA1PR20MB6986.namprd20.prod.outlook.com (2603:10b6:806:3ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Thu, 8 Feb
 2024 00:21:28 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 00:21:28 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: sophgo: add i2c and spi device to CV180x/SG2000x SoCs
Date: Thu,  8 Feb 2024 08:21:29 +0800
Message-ID: <IA1PR20MB49539A9C5F5CFF6644ED2C2ABB442@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.0
X-TMN: [bJWcXTvnHmTI6UHIS+vfUDyU80EOX8KESFfzyIaYk9cTTUUUwEUf+hJmjTCUXlnL]
X-ClientProxiedBy: TYCPR01CA0189.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::14) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240208002131.162432-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SA1PR20MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c308ba-baef-431f-425d-08dc283be476
X-MS-Exchange-SLBlob-MailProps: Om8TgR6f4EBS2ftQVFRXvBH1S2ebRITSsr5Ej2yRezSpnOKhlTFTpDa7AkzAJNH2Wu60oFK5OWM86lEQU7+sFIOpv5HFAyPGqpQnpH5r9t0+tfVTiXYJojBvo7sIkmbDBpAcIK/Sw9HWxv+TUqSGbzUd05ynFIOOp9Un/aEI7N42ZhQHpdhuw3bh2GaZ3jBkROnfTptBcz0Q90OQ/nm4aPWQP5SxJM74wlSVzOO1zW7IFdO9MSqCtjgPMN8GK2qENkFTwoGsrOTxODpaI0VgmzR80KtoGjtr6XgL9M6bonQNjo+IksqkAjonqVY5JcDSFDlrLF+Lx63WLlZgR194IRt1SM0MHuBVH1WugIEnNwS98jrAbNAp60LpyqGcLoxgSyXfUFfzxPZGOLBB0bwW53NTyJxNAhvmqDF9zvY+JzKhl3O1fuO3YExGYNFVpgsjPi5gFSbxW16Mimwm+abfOAEH0b47Spqj5Kk9KLznmG6FRhKnn40dfDYdtZmiOG2vdEuCIoSYLgzBokmg1poyV10skJrmROPdNFf27WKLrPc8ai4oHS/PpCPn12GAHmhtt9ud+bxGZ5ZFJk6l64IWP0JgFVCMnLu0jVyQnYx4W7R7CQACWaowZu1nG8b48zDnaCQw+cKCQaxdecwaBzruOuc3CZlGQmZfqNWko+ssU3+QFs/3iBdMNtz1fk1UZpjXDkN5818noeUnjCwSWtxkYORC12iTBEjF6UcmGkbL4fIT9Nme+dghcFq6BvY+AkC7FdORbK5p+3Siv6N+jv697bVXmtvSzOGvVer5vF6PmvrrrEI0rG/oG9AtZSYDVj1Sq+5WPCtrT0XumJad/0MDSRlpISoc3MxI
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+I/0QrCtuzxGlsotQs/ujGS3I1GSQ0nwvZ5V7/chSnhdVeEz6GwXCipZsOZTALh0QkS+ULRLWiYJ3iEwITiAJ/il2UL7KtmEa3UoQSAyPFxjai/tHiiAw9UbJRU0rsXLx0WO4uLnSjGQdGFeHGW+KRl9ZFL2grNd0mr55rdltxRraMl5qABzkBM3chu4aVWGpeuFQ8QxdDSZQVqYaI4XsbExOMcLzaU1IUtmdiOh2A158H9Nyze4nwkpzEN/MAogHJEjeeQ4AzoYzWQGGq6G5XJuilcO4QNoeZNObvre1lI12wB3dattcliMKMsqfDM+w+OE0JI+/dALoRh1DMq893Eu0/vv56yZ5XedlFcweinubfBGCCRjYlqByL408xsp9KCrnBJYFvXInKVtafnnhe/0CwY7/xNcCR/5N2VQW4yOZbggLDEZy0ltY+yfr/B+KEcMhXUKC5RcOdvzPs3U5Ei+A/eJzIL7bHnmDFMViIdErWhEl1TLsrDdtW9jca0d+DOffXQgt+Kdvi+uDQNViqNcwiwpitNLp1VmdhbwPN4y8uegDmguwZZR3ux26Yi8CvbAPy6yhEi4b2vFrl74TiSqUmaEt9JJRrd6F9jMMq3b1WA3RHmfo7ZsTBg57/k
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cBTMRBNrDkL7sNPWEI5b5puQKg71j/Qrnh91IiH7XyvuQ/Nns9tOSy2g0Mz3?=
 =?us-ascii?Q?NMXxj8CmUVj5mIU3llap6zMX+yVG9rFTRjzBHijc1hfRXua4IBQgiGKVGv5L?=
 =?us-ascii?Q?htSeaQOZUS6hGD8yQeMkjAJJRT6u7HD9mXsTJxLEXhCLSFOG27HWz/W8b5vC?=
 =?us-ascii?Q?vk3kv5937fNqgroXbu/8aRSrjadIU1abYgz30WuV6UQju24N3YDDzPmovMGF?=
 =?us-ascii?Q?RMnM4BLMf6wG/0o8ja7NzEWYZvY2V5jbtiYIGkVQpIAAS1fES1kObKb25bLe?=
 =?us-ascii?Q?VzIHTRb9pv6Z0iisK46yAEnKUhm+s08IwbFfYOgtYm1rzQEJ715IMdiisV7P?=
 =?us-ascii?Q?dXPMj4MbrxDFUcGDO7h1HMZR7iBUEWtS73jbQuahqQAmysjndgRbC3jaY5IL?=
 =?us-ascii?Q?3v7VzeNNMfhit+i6pV8BCJ71kXhed3l/KMVtfZ6BHYAz/r2F5dLYvLdxAjY8?=
 =?us-ascii?Q?t12wwPzaItuTTocWxQNywnu7XeJHlkxbKFrONztzs6JwjV45yhqZ9qWT39om?=
 =?us-ascii?Q?XydtwVefGjK6XOoZjcQSpqCWOOg3fEMId8/40kUVzRDzAQcHzS+w2TXFeDSh?=
 =?us-ascii?Q?inzYjH0W3yx6iktQzNV2dKOUiPqQqv4t0ktx3L+oxy3SKr8jlzDS2fpwO6Wj?=
 =?us-ascii?Q?5C05M0sA84PnLSF8qsYNkE0kNZOtjhCLjvBPZEpw6nzffXzB+kEXD5l8osjV?=
 =?us-ascii?Q?L/IBRSHqSxOdFiD4hIo/dKwGYM/ms1Sczbt78rm2T/rkb16xm88/wbdWJVMf?=
 =?us-ascii?Q?4O/QNc1NMYb3J1FYRm7uL3ScbZcM2CNS2gyLlPVgXS6ouEqm/tBbVzNsppfU?=
 =?us-ascii?Q?wjQaMLL60tyjKU4YXa8y7UDrxOsXeg+EgFOqV+jHwXfHjzOeDGBhKQb7t166?=
 =?us-ascii?Q?lgQWD4vkYOi8qCbCSXl6m4x7dIad9hid+HYGoqNjSQ5ILdA/uJwSYGQd/kpi?=
 =?us-ascii?Q?uiarhSfwJRMVSQAHbBNW2he4Y2B+CC4+B850yK1tv7UTaeW+66ttkdZuQSHS?=
 =?us-ascii?Q?PtwSO7VogkL2TmaLWIIBpAbBRxx7gHF9yNTqB0fYymihuSLZHZczt2/iFujr?=
 =?us-ascii?Q?g4uWQjifqEp2qEldV/RiHx3uh9kcVQp8GyqgMHfla/OMrEsHm/jDz5xYifNG?=
 =?us-ascii?Q?6Lvy47CGKrB84MKw6P1MjEqEfwXDgu+PftDlT1p9mxKc6FI1KZXw3f9kJ8/K?=
 =?us-ascii?Q?SIsonGQE2wN3nryLuVodmonNcsp/zWPHGJw9n1KgbvCv/ZGWxYt8S5tpiqrz?=
 =?us-ascii?Q?ZwN95+EqnGaj09Bt0horRVrkRpoJI+UMRPdkiKHRjg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c308ba-baef-431f-425d-08dc283be476
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 00:21:28.3906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR20MB6986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_162146_597526_A410BCC0 
X-CRM114-Status: UNSURE (   5.44  )
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

Add i2c and spi devices

The patch depends on the clk patch:
https://lore.kernel.org/all/IA1PR20MB4953C774D41EDF1EADB6EC18BB6D2@IA1PR20MB4953.namprd20.prod.outlook.com/

Changed from v1:
1. adjust the order of properties in dts.

Inochi Amaoto (2):
  riscv: dts: sophgo: cv18xx: Add spi devices
  riscv: dts: sophgo: cv18xx: Add i2c devices

 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 99 ++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

--
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
