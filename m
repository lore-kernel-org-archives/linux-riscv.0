Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6F4C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 20:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xQkRk58LyNJx74TrZJHwBWMlgvpMsG0w250TIT0kdBU=; b=IW9N+8lgRGO29i
	qaUDmVx8nfJHAMsDH4g9s1L3kvvST3Wp8ngt3GfmQ8kjvm8Mt3yyzSzKKFpUkyLDXS/a77AS2k3jI
	CDF9IJ0wBy2oAWSqxZtv/SBOxwYH/wwQZIlrAydXpNxOxhtJ6ae0dOKOuYPXkZtjzYxbNbF3BAjD4
	1qzuv1BdqjOTQSr84GUQR95oHa03QjtoOTnCbTPU8LrLr8WRzgsNIJuDfSQ4L3auWpQa5yUHPRcmw
	2dY98w0uqJE5NUhVZ6GWk+eDGJgrSQcETr+3SqapSZImrmJrf9hXlTgss3DVRV3vQFUynyljbrq3U
	YUKDuNQVpqM/S+cZzCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9uJx-005jvX-Tr; Fri, 08 Jul 2022 20:11:25 +0000
Received: from mail-sgaapc01olkn2097.outbound.protection.outlook.com ([40.92.53.97] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9uJv-005ju4-F5
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 20:11:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=En8JiaOP/z2kbU9pzayrzbXFkBou7pFS7ra2YPDu7Io8EOyVSwQcwuNjpBkO8qHKMExkz+CtzB65BBgOdBB4SBKoG2hLsmLqNwB1IiKJ1wxPQW/mewKXA9F5aocpHkCE/wNmqcSb0qW81CKHofr0/EepcOjjJ2jq5q+vPXd2mCZLIK5lArBXh/wHHlUZb20xTXTyNUHd7pmwQrOqyodrosoGjkja9cr+6dMEeCkz3Br5gWNmv7Asp3vp7xpGaWpoDJ6hSX8FuIqega4FkGTHMztBiK8R9on/4Kr3LHJLkFevqDtyUiUfFgU/8rsLbPRSfAcol8fyv1Zc4kzKm/iXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZzZ2EGSmy+C3qyahQ4kN/t39m9C8Q+IQ0xWiUc8C50=;
 b=YJ5VyWo7rkjsF+qph1xOUhA+AluoVfGXmL+Gzk69lI71jEEovr40gqmO639uKWlT1ALtIHGTFHPEuktlPeQki9prlIBXVO0Noaza1l1FShgT+ZUeXscuxUUW5FEbLrgaQ7FelzSvgwArSs6maX75lOxKaOhK2Tzy2k6fr342JaHwmDfTnWYUhyexyXvLWcnMQVa480EwGDSUtjBEVewTJ+LBvVyIHuXgleluDCzuQbsMzxhMaMIU79VAo1K1LYgRazq1VDdwylmlpWWi9G9x2vSUfLLqlGNExcv3ZRb8K7zUV5Ryq9G6U9buk/M9Q/JtG/gxYouAH9GZu90WJqVuuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZzZ2EGSmy+C3qyahQ4kN/t39m9C8Q+IQ0xWiUc8C50=;
 b=Nuamw6Q2XawGSQKL92IA5KX/mwt3FcwkK2SnVdl+vkq47rHiZq9wXMZd5Di92hp7ZCcSR0YMFwdrTtlgqUQ+Msonf8qpGm7LpgLVzUcalWDOL9xqGgy9JkxgP7JybJQa51AYL9leCEt50dNO8I7G3FWb+KHGUtldQpMHEBv17JmH0gDgEVXkF92VqrxJjNhbd/OAYJxJfcQIKypf8T2TEHjXSLtYDPnwMmX9j1h0I2/D0pEhXK9SdC/KZl+eJqdy8YY/5WFnQlXe1CZGE2qfB6csb6osPyOm8ELco8UuAO9VQer4HMr3JTTCrvQXFE5CNHOiZdP0Szq3MGIcVCEmcw==
Received: from PSBPR04MB3991.apcprd04.prod.outlook.com (2603:1096:301:1::9) by
 SI2PR04MB4459.apcprd04.prod.outlook.com (2603:1096:4:f3::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15; Fri, 8 Jul 2022 20:11:14 +0000
Received: from PSBPR04MB3991.apcprd04.prod.outlook.com
 ([fe80::21b8:a14e:260b:cade]) by PSBPR04MB3991.apcprd04.prod.outlook.com
 ([fe80::21b8:a14e:260b:cade%7]) with mapi id 15.20.5395.025; Fri, 8 Jul 2022
 20:11:14 +0000
From: Wenting Zhang <zephray@outlook.com>
To: linux-riscv@lists.infradead.org
Cc: Wenting Zhang <zephray@outlook.com>
Subject: [PATCH] riscv: always honor the CONFIG_CMDLINE_FORCE when parsing dtb
Date: Fri,  8 Jul 2022 16:09:32 -0400
Message-ID:  <PSBPR04MB3991F5AF4EEA354A658A3BAAB1829@PSBPR04MB3991.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
X-TMN: [5LUO4G7JNmB/Ju962+Y7oy7XLOwp4fvO]
X-ClientProxiedBy: BL1PR13CA0114.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::29) To PSBPR04MB3991.apcprd04.prod.outlook.com
 (2603:1096:301:1::9)
X-Microsoft-Original-Message-ID:  <20220708200931.1683839-1-zephray@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac041eba-6796-4328-2227-08da611e00a8
X-MS-Exchange-SLBlob-MailProps: 	CaK+F7me6CmBbcXs3exWmUn2vAQZ6fsk2lOfP5edJuPhzCWuyRgYDTAg7f2iNZAnhVCxKuKdUqtWwjubwdEVEvTbaOAcYNU0Aa0J2ltUyjGw4B2kC/fb6xczYkiV6K5xRAbx1OIpvhKnmEwzUyJFsM+uygo0wPdjqvbwGB6X4swRj/veULlEnmlYdAwmmguC8AoBhvaYsLu4rdydT8tyKmLSRSNPv3bRCkCG03duJo7/2z9pLMSTvZX3/SwRu625ALbNvs/mDjXcElSYPBbCH2EZ7Wd+tW6j0ZrGhseBloaiQaiU9+72C1vtcXZjtyJm+DWdWNVPIqz19mKXi6bUGNxf200TqdV4B8NJFVsS3YJYtp7YoGL26SLC1vf99CeYnrV7tVRQyMhGCnFr5Wgs+NKPpeWgjUcUP3rWIl0hK0SnDjZKHFpy+1DjCF5Wj2uGPjW8yOMpbUG8qkSbNp3b3PwCVrtz1BKtjVPNBGHJiUmuNmmkXuxwKraJx+HDyaqVbPfId4mNuqTejzsLXcCvpA/My/2yNu3fdDDEt/TyFiPoyc6KXo+B27ucqYn+I0kApOZWe6i3aQMVY33M9qRlgRP9ZBagnZpVV9n2uBp3GUHO9fVALt8/+1vGmp7KtGwdJc6AZt6HSm1r2ZtG8hlzY0U2eUZ3guSEzFTd7Zp9e5dnpdj6JekfZ48hIlW+kwbcV8JkUDyHP3M2z/HGdiZe3EwwBp93uGkTf02FzE8u39FffpTkfePMng==
X-MS-TrafficTypeDiagnostic: SI2PR04MB4459:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NJi5b0FEEz5ZhkMtbn3QykgkF1MO/xPHUrqpBE0bVJaJjXpErJWPfbtBV75Q6Wx/7dnP3P4krJsArwZaDNf4QNdCyTUJFsfqjBl7KWoCdmm3X7+ORf6zBIOIN08dUoNrWZLhiDaKt1g6L40D5R/F36MqNdQTNsXC/G/T3yv6w/HDMusVDsRtqQB5Qgd3oa5DTO+y6jh0hn42i/hIG8rsqYy4T6iMioKfPra7frX7HwqaLq86EMtGMNKPpFAHGyrDIdMWCHMRi+Z4fh9CIx9vLIKZspM0faBuEQk1w6AMF4f9sZrECORiclZeYqw+zEaGAEgEmxtn6UcCldQgcxjIu6mJmuhLsA3drPqZbh1veVWk/ah3fKoBEZbXxJ6S7sLN1PJ0x1NcZO+x/hbGVWEyP8uHRq22d9rnJyNFIDfQGdR5kZVVVEVO/Yp6lo04sw556vto/ucKXr0Qa5zAfn+KsWUfA91ineAD6roKUKRlvoT0ZVWTYyD1nWq3ia+Vj4mNmsoLPw8xfBpVUHhG56KT/TIUpL9m1s4Duyu4vWKePnC7IvonHPuSeCvy+DiCsI7RacK/xlu6VYS4w18ua0hGBQIlvP5qrj2Aa6Cr29rXHGWou28RFzVS1r3ExALf2myAY3cWLQ31bNGD7u1NKXN2czhdXt5irywA/AiOyLwdef2V/aYI/xVsoY7un24bsK1bbKWTZ2phZ4KJlzsNbWS6xQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?cJhivp2RrvwE6PzmsJB7qtBNYalllfTzQNj/GGX0OkMGWlTCM/nmnCjL0kgi?=
 =?us-ascii?Q?TYYA/KXPq+taQ97g10DCpRrBEjoPUdmh0JTCWR0hVhrSAmpgFMR8xMKpKivZ?=
 =?us-ascii?Q?o86vWzd/0420/n7xpoxjvaGJ1myD/sjpJzm+ZpdLpl/OJcoUqre9BnyAEqN5?=
 =?us-ascii?Q?ZrvNyRcSh3SCWAdQN011YfHRd+jQ9nCLNPaVOK6IuBAFnvYafH6vry7769B4?=
 =?us-ascii?Q?er90/5e195bE7pFUuvqvor/UNjzd+gpGa0ASsezQVIzY4bPbxVUKDQVcv5PS?=
 =?us-ascii?Q?1TYhHl/SSWFPcJUsFv+RnFrjHvVOqwwU05hX9r5o9TiKVOgITe67NBN4Uu8K?=
 =?us-ascii?Q?oSX/Ue+cPAgo1Ap207l1tJafvPmSbNnE8G2dAqMhTPiuVurbUfNeMyeBbtKa?=
 =?us-ascii?Q?KbaMtU3mINkgFE34PhyidTN1iEen5fQuAIQQaR5nOa6id8jA3mVa8i2WPD0P?=
 =?us-ascii?Q?moiWsq0rbw13q/VHrY9rK5gPqbmHlnjl2vHURpSHePr8s7joFwrMObxn7bzS?=
 =?us-ascii?Q?4qtpND8x4fnN1ladQrIifmqRyNse248VnXfYdM+cznbxf2yNIgF+VrerZkzD?=
 =?us-ascii?Q?wPzVrMslQJAj0Jxixv7TPrcrDbKEVTfDnAOXU/CXyFHfJG8dtfMaidhAIONA?=
 =?us-ascii?Q?6iFWeTLPo37GPz1iyoOW2eF5ZGVrXAeg+YB1Kcak0Qiuc5fL1TXmkJyRTA3K?=
 =?us-ascii?Q?LpcI/IDepM7C+WoGpnMpY827iZxSIRTYO9XnEti6tjUEa2Y77tKlE0Nuj68A?=
 =?us-ascii?Q?Q45TDjTPs5Uhl7OvDEZjB1sbg9ngVeL+Nm77k3K5UyTLhCCQ3jpoq9RPemdW?=
 =?us-ascii?Q?WxPq4EHum1Ow/h0DYwGkUwZQHcFviekJ2JZHeZ91z4rQd2sMtQH2SvzybjKz?=
 =?us-ascii?Q?/XNlclbPYcxDmW41tN6n8zJO+DZ2k7u2D7HaDXVjrGOG2LBj9lVo4chqYWku?=
 =?us-ascii?Q?GCWlatIMVKwtxUG98k+MW1x+YcqwJpJ7LIxzy6L1q2ed1ZNT/N9dKKKHKNqp?=
 =?us-ascii?Q?NRQ9FFlMxx3YX0fn5LYBnodoC2tpF99C4HFdRdVaI/e1Eq+dz9s7eJJVWOc+?=
 =?us-ascii?Q?QDDjyaCB68tMrzuldp754vomiNlrTE/mt9AkKzw/6h7YZZXQerwCEeokJQ85?=
 =?us-ascii?Q?31Xtjh1nSCoeAYi45ONLRu2GAqVtRDHQKf3liVjVnveLNXlSoKEJmPRbdvLO?=
 =?us-ascii?Q?N+qUyOq+CHufsueeDQW99DFTJ+BYa69nHpNr0X2tru+wit+B24IOMDK6gjxU?=
 =?us-ascii?Q?HnKkQCCpWIavLpL/LZw5+Wk6L9Ps746n6JIPTwdZkA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac041eba-6796-4328-2227-08da611e00a8
X-MS-Exchange-CrossTenant-AuthSource: PSBPR04MB3991.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 20:11:14.2568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR04MB4459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_131123_555651_BED0D9D7 
X-CRM114-Status: GOOD (  10.87  )
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

When CONFIG_CMDLINE_FORCE is enabled, cmdline provided by
CONFIG_CMDLINE are always used. This allows CONFIG_CMDLINE to be
used regardless of the result of device tree scanning.

This especially fixes the case where a device tree without the
chosen node is supplied to the kernel. In such cases,
early_init_dt_scan would return true. But inside
early_init_dt_scan_chosen, the cmdline won't be updated as there
is no chosen node in the device tree. As a result, CONFIG_CMDLINE
is not copied into boot_command_line even if CONFIG_CMDLINE_FORCE
is enabled. This commit allows properly update boot_command_line
in this situation.

Signed-off-by: Wenting Zhang <zephray@outlook.com>
---
 arch/riscv/kernel/setup.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f0f36a4a0e9b..6e8aaa1ff7c7 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -251,10 +251,9 @@ static void __init parse_dtb(void)
 			pr_info("Machine model: %s\n", name);
 			dump_stack_set_arch_desc("%s (DT)", name);
 		}
-		return;
-	}
+	} else
+		pr_err("No DTB passed to the kernel\n");
 
-	pr_err("No DTB passed to the kernel\n");
 #ifdef CONFIG_CMDLINE_FORCE
 	strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
 	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
