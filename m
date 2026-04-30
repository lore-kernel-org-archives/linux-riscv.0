Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7ADCD13D2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 21:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqcfkbkcCRkDI0Vi4ZY/GTxtAbmlkkjf/exTkLbvCoY=; b=pj0+GwRq5xBN6I
	YxmZF/qSKoI+2CsRTUv+GZ8ADbd1fxzY0AH9FSFcIJCEPnlPM8VwlQo8qlkTreTHRTtrmtY80z5r2
	Ri128b+kJCUp9lho5QGFt0nPZy4DAKF/DNUYRDmFJw4ZiR7IXVx0/ZEThZRh0YCshlxicrNYyLihI
	sDO6kYqFLNSIyujGw43kAsTaJlnSUpvJ3wL3gM5dve+1Zz2qP4lzjaCvastbAyN34prASeOzi86u+
	0NCwHiB+cg/KdL1T9gmb6m2DSJpyGnJnSTzYVs6JukECYPv4E34XXhp+slmqqMKjG3TY0k2r1jk8P
	+h+OYrINpjuJLb7ToGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYi8-00000005x6Y-076D;
	Thu, 30 Apr 2026 21:14:16 +0000
Received: from mail-westus3azon11011036.outbound.protection.outlook.com ([40.107.208.36] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYi1-00000005x45-19bh
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 21:14:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DV5Wyw4xXuwubJDcCDkfw1VsHVHWWSSaZWee0VbX+EVuFBlqIq46P1BF+UyeZQ6+X1ZdbTIzT44+oQYLZMKuOudXogWLUA0uxQ4U772WwqsG6M9PyFwwYePmkmB/m9xCUUGjQcFHLooI6xkQkSJ9PidbQshIK32lb7Ab/Ewk/sPxDQtFGe70OZ38lOvOzvrn+lBWvr8tWdqWz7YfqAp+krIxeS/o0Roj3Wu9bNWydvb0PK+dQKOO0r84T8AIknv0JxQQ1DRuhTCzhVwwF3rwTZKZIP0x4x6xeeErzAuMP5D+y4egmUr6YHh5si/pypzIkTEYR852qZjqfPhvrnPfkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clzXa7YsEYnPrpSEDOXtKhkycHCGDNwGiCylR+5MPrA=;
 b=dVCpT7Ee601TE+SN+9lLG5eUN0THlqBWH7EvGtR6Er9gIuT57JKeBxrvq5GYH4y0Ww7w+7FK5zSqIt4PmlUyKRLVYQ50l0z4KxmKv4YPPEf+cslPw8+aLEKaq7Olz0ZvBcOP3bCo9owhXWtjSxLdoW+KVKAcQPxGSXTm6LsWZ1+/VY0nkEgvGdv4PU4LClYVNiQMj3EfRQY1OVsmDEJqdptom+IAdObgkyUuADPNEIVayHqm63o6VVZG4CKINymtuj3O5nYNUgcHM0+iDVgjzkdVzsBBpU1rHiBMM/9sRNiTxVxM2yQvBEnfxIIipoQbJw4zXG2LB/REE7XuegWgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clzXa7YsEYnPrpSEDOXtKhkycHCGDNwGiCylR+5MPrA=;
 b=aTF0ZYRhPPdQWlsyEihJo2jUoWy5FhIBdTb+yazb/RrdAFKggyX2/b30uCqzq5G2NvJEkky9qo22Dk2eu93/aMxzEZ7Z4AJwjl8RQd1ZG4bWlgItxBvpb9nLMlOaGXmeUvImVNT+J607//sxb3xsWoTMdoaMFR8+9Q+MLWlnkDPMp5o57yG3gEudpfdAr8HfCZAGBHr/VjuZiM30y7BYbZvF1EhDGBvydDmhgJbyKwLVW2SXhxwdtYRKGcPD97wTIaV+wtQIfl2SB9m0H1FwJjW6bGb+ERwynJytNFjwqQBN7ufSaHAgqp3ZFnmM0Zvng99B8U78dQ8Ss0ILz0kmtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by DM4PR12MB6256.namprd12.prod.outlook.com (2603:10b6:8:a3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.20; Thu, 30 Apr 2026 21:14:03 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 21:14:03 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 3/6] bitops: Define generic __bitrev8/16/32 for reuse
Date: Thu, 30 Apr 2026 17:13:47 -0400
Message-ID: <20260430211351.658193-4-ynorov@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260430211351.658193-1-ynorov@nvidia.com>
References: <20260430211351.658193-1-ynorov@nvidia.com>
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|DM4PR12MB6256:EE_
X-MS-Office365-Filtering-Correlation-Id: bc64bf9c-adc7-493f-5bd4-08dea6fd67dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|10070799003|366016|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: vqsJ+UnjPT9Ck5Bops7O7aUznEy6lfZgjDdGLQps6kNGPqzFd1JLcRGrLwH9p4LwqbTocxZpb842n9w9J5ja2P99qCrN7zEE2RBctHB8NI2Wve12JOrj8aR4dPO9wAdqWXrwfq1ZHkQ6IMA3oIWpv7zFfP9RYwaHOgblc7+CbfMTEOPK1ZUR43RfzO7CWRJ1qUuGomXmhDNETCBCZ2+hWLIiP5HbddEybCNIj5nbhOV9b7hOg0ee5YpZ9W+BMj7u8V2bz7jvppYFUkahSI05ikcbpATOoDqgeDKLS31JtA02lV9pwGO/qHmHtqmFJYKm2Dl4fsoAxh1DIC6Tl7753ZsH3S2VJ1VantrvhLy4+NuOA5jWWXJsZbK4S17rFKcTvVkS05oV761ZgNC5Kx/5K7WKuzUquapdjzz4/wbJ945O0KNjokE670pm6AcgBqlRX3+P0YNDt4fLbQ9QCJoQulSyz9aw6FzTPxxvDDAulEvWU26DVLFrvdK2UmD1AnrT9dB3Mp4z3Sekb5MV6+R0u+E2XDPcMi3sOpuPAMBn3r+VpQtsSDyJvZ+dMTbZIZLL4w5UqMYuKgy4dZJu2zXobPb11G623fKn/IFvLSRRx2YceJxSvMFMxW55I1yvugUD0abQm4Q+epEv3xOTYkadkEmDiwGPm07Bt0YfRLELhboh5O6I3tz0oY08+0VunguAHgvRXQebkzXnKfGJnKjN8m+DOMbdfFqjIhIDi6qrvZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(10070799003)(366016)(18002099003)(22082099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iqGjKfR0pelv85UykLTxXNpa1z7euajHkj1aDAnB+RqfktkiKRmmaRYcqoJQ?=
 =?us-ascii?Q?GNqLky60aUaOLJu7vV5j35mWiuEVCwdWptVaWVopdw8Pl9W+kTjchU8c8ljk?=
 =?us-ascii?Q?PityzpQbVjdGSm6w6vAN3vFNnL63fmIDDN2vD0Z40y4G6rsP3Iv+QVBRof/G?=
 =?us-ascii?Q?PqImz+ZU0ODXUHp2oxqP1LuhmRzCYjqnOxGAsNYnXg2GerwHsoF0E055GAYC?=
 =?us-ascii?Q?5WuOjCPQoMJIK6RV9+DUKCktMK5/5yOnOrXO5i9WpnF52o6ACGwR7JIQ9xd/?=
 =?us-ascii?Q?BG1zUa+ZFAPjjPr35+BC6X6SLZ6cjs3RKw0A42Z6/FSfb5xNOwgCYisy8Vqa?=
 =?us-ascii?Q?Qm436aEz1Yn7hPwJeb6A8FqUFTlHl1YV5RQst2f7AQ2Q+Zn6cC2tx9wJ2lMi?=
 =?us-ascii?Q?xfsSllQ/MgirvVdD290rN0wpiznVMT1p3YcOJeYRVqbN3JxEFfuSp7rInCym?=
 =?us-ascii?Q?iK6R8/Il6/lZ+ZH1dsiAV4GILKr/NBy7dCl+7FNOuXY8LezDcXVRPefYA7MB?=
 =?us-ascii?Q?6PI/eV798GwuHhqiOv3P8GJVeUR6LjNaKbuD/0KXqt0UJFKWM4IAzR6c2Dar?=
 =?us-ascii?Q?g3TefJPUoMeGgqC7EmnwsIsU8Fsrg8eIJNFXmJSvFlRbt1hai7cc/p33iNT/?=
 =?us-ascii?Q?IKOx1LrD0WomWsyDJNqTFUp/+A1VnH3pdG3E1K4hKhC5X1wVqPdFdlLDvgng?=
 =?us-ascii?Q?KQMDc2Hr3Np22mrzx93hpzoUq/J0AIC3KTBjhS/6CRXEz7q2S7JQ5+6vb07o?=
 =?us-ascii?Q?74cDAUfV9TUn7uS/kwRDmUybOGKlTqby0wWQQcDRy+X/fCrLFgbrZpERMBF+?=
 =?us-ascii?Q?V+kIaZ3qVxiEZEMOJlUdz2eIMWDkOJKh6ILGjAsODp9w+nyrRahBar8jG2aY?=
 =?us-ascii?Q?C65pjLVEQSj0toFfh3A5VyDn6uUYzoGBEblMv2KsSbg/bWA9ktqbsX3IboQN?=
 =?us-ascii?Q?mSniblRsp6oUnb3TArgxkqIUVZJZWKfLUVpMtFmEP+nGcdiKBKLgi/HEIGD5?=
 =?us-ascii?Q?PzXaVdx25CWaJF49lH/lxixvzKb5pSttlkNR1p+z1AVoQM7NgOD/CFbtBMG4?=
 =?us-ascii?Q?bce6frnrzihkcDAOrdZ+LNvIyKJaezWEJEdBOQ0eyLL8M4CYP/3OHxdO62GF?=
 =?us-ascii?Q?Sul15vmbqeekBipujLemZ6qdaRCN/OVktJ3PEfYVlaV1baR6ubM/VmaY7+re?=
 =?us-ascii?Q?MfZdOD3vzQvNBKYwmn1L/JqXLq8qgX1mE3Zn/qMDhfYQYYfIEm/P9OPOfAzN?=
 =?us-ascii?Q?IUwPnXylnAKLqOLC+umH5EWutcfoCPBlllo+4V7yw21wo+G+bkBZeODgmq5S?=
 =?us-ascii?Q?wtlHjLtup7nrIWLIQPF9JTPHM8g4W2yWWVADYi3DEQ4S5EOVtbckN/+11v7G?=
 =?us-ascii?Q?pdEWJgk3/EOrWmS7CQPwGT9TZM4ovRYKkWdCpwpJsDxNcHTf6952R2D9FhuP?=
 =?us-ascii?Q?hx36+t0i8eQS8ilnc24y8JbHHvEG0XqTYv7MbrqJy1Gh2goONP1F/beDxPvB?=
 =?us-ascii?Q?yYM/Fg5xUTOECcByAcsq/JJBm1fX+eVl914AdXJfSMR7MDk3fF4Jp0ugSQWD?=
 =?us-ascii?Q?iF2dx4vE79u4L6XbVZoUaX8dlf3I4Mf9nXl/qUL+DHRnBS14UsokwyXPlfTD?=
 =?us-ascii?Q?ADThR0LbmkYR445Zo7dHmV5b2lNhrVy7eubQHfLqTCGBqHF2+PnD0Updv2P8?=
 =?us-ascii?Q?hcokR6gqasp4VdV4LuG2qqyTnQ+46nIhzSAsoAVrc/49tcJQeQ2On1HKJ2VJ?=
 =?us-ascii?Q?OLMGcc8pY5w7C2kNjUCo5wB6G0G4/bB1HOGWpy5GVHH3iMd6IaQ5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc64bf9c-adc7-493f-5bd4-08dea6fd67dd
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 21:14:03.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzKFVA69z0Ilo4st1oJsko/L3IqbC878bmrzEsIGJOMDiFfkAZJkRrE6KxRp3XPir7dAwJ7dQdH29VgpvyS00Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_141409_315130_68CD7670 
X-CRM114-Status: GOOD (  12.38  )
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

Define generic __bitrev8/16/32 using the implementation
in <linux/bitrev.h>, so they can be reused in <asm/bitrev.h>,
such as RISCV.

Reviewed-by: Yury Norov <ynorov@nvidia.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 include/asm-generic/bitops/__bitrev.h | 25 +++++++++++++++++++++++++
 include/linux/bitrev.h                | 20 ++++----------------
 2 files changed, 29 insertions(+), 16 deletions(-)
 create mode 100644 include/asm-generic/bitops/__bitrev.h

diff --git a/include/asm-generic/bitops/__bitrev.h b/include/asm-generic/bitops/__bitrev.h
new file mode 100644
index 000000000000..f06af929678d
--- /dev/null
+++ b/include/asm-generic/bitops/__bitrev.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS___BITREV_H_
+#define _ASM_GENERIC_BITOPS___BITREV_H_
+
+#ifdef CONFIG_GENERIC_BITREVERSE
+#include <asm/types.h>
+
+extern u8 const byte_rev_table[256];
+static __always_inline __attribute_const__ u8 generic___bitrev8(u8 byte)
+{
+	return byte_rev_table[byte];
+}
+
+static __always_inline __attribute_const__ u16 generic___bitrev16(u16 x)
+{
+	return (generic___bitrev8(x & 0xff) << 8) | generic___bitrev8(x >> 8);
+}
+
+static __always_inline __attribute_const__ u32 generic___bitrev32(u32 x)
+{
+	return (generic___bitrev16(x & 0xffff) << 16) | generic___bitrev16(x >> 16);
+}
+#endif /* CONFIG_GENERIC_BITREVERSE */
+
+#endif /* _ASM_GENERIC_BITOPS___BITREV_H_ */
diff --git a/include/linux/bitrev.h b/include/linux/bitrev.h
index d35b8ec1c485..11620a70e776 100644
--- a/include/linux/bitrev.h
+++ b/include/linux/bitrev.h
@@ -12,22 +12,10 @@
 #define __bitrev8 __arch_bitrev8
 
 #else
-extern u8 const byte_rev_table[256];
-static inline u8 __bitrev8(u8 byte)
-{
-	return byte_rev_table[byte];
-}
-
-static inline u16 __bitrev16(u16 x)
-{
-	return (__bitrev8(x & 0xff) << 8) | __bitrev8(x >> 8);
-}
-
-static inline u32 __bitrev32(u32 x)
-{
-	return (__bitrev16(x & 0xffff) << 16) | __bitrev16(x >> 16);
-}
-
+#include <asm-generic/bitops/__bitrev.h>
+#define __bitrev32 generic___bitrev32
+#define __bitrev16 generic___bitrev16
+#define __bitrev8 generic___bitrev8
 #endif /* CONFIG_HAVE_ARCH_BITREVERSE */
 
 #define __bitrev8x4(x)	(__bitrev32(swab32(x)))
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
