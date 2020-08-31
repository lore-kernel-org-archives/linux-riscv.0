Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,RCVD_ILLEGAL_IP,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF13C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 14:29:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC6DB20866
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 14:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bYEJwEDc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="itm8LFvX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="rjM3emVZ";
	dkim=neutral (0-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ohgAOehJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC6DB20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nrzHMR5mbGDGmj8FPd6BfHjrsdc03Gn1Pkp/wEPw6Ok=; b=bYEJwEDcsBAfZReFB9Zc3631e
	i4VLAPtV3EAcaM1y+WTBiXHE30qAsvmYvSDR8J6FuGqgL4w49z6PG4XCRRZd7jJPPW9UY7u8pAnwb
	bGSwv2ztz3x1gbm+CbEzcXGBAPEx4NsEY1i3XzEpUQu2V8M5NPFiNgmiACFg4Afsga2LFtoWeTIJB
	doOzgkCcqM/0OSbw9esqIWtaRSajXZYzvC5Je4hhRSBJf5vdxZBXFnmJNNlmJY+Uzm4+d5byuTeEb
	MydqHNNesDEi7ATK2Nn1aZNjDa4YB5VXJahvTwnWnhEdtwjb8n1HIWoWZHjqsjk45CraIeFgYyNfS
	Dl5vyx/lA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCkoA-0003fq-GH; Mon, 31 Aug 2020 14:29:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCjmT-0001Jk-EM; Mon, 31 Aug 2020 13:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Y9l/BYtVt7dK9ZDfAtSAr1mkf2KZcxu9AfQS9ivD09A=; b=itm8LFvXH2LbAAlC+ltacjF+hj
 3OI1DY3XG8MkbdskGTyYcfvXi1K8Syj1x+5RvpWFHx2pezMIgW2m03KxIeCxG94xTAgeXfsYokQBq
 WjoKYOeLFT1sjM5BRN9VRAYN+CtpBKU6ujj6WO5k00hGz1QCsRs3tpDMS5XgbykrJkxgDRQ7cA7dt
 KKTFFnBzguDZZapM+OM9nx8o2juNR51/ZMN2kNGM7w6/T+NeoO3E2fWygH6cfDl3SXxjkwpkRMm/n
 vICZoEKwOpGjf2GpOLzG6Of7Ic+oM4iy6qRJTh2qZ23Hoxyv+tXU3FajgHRLB9tNUDdB0sUgzuFnT
 MbDKXHew==;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCiyX-0004Zm-MB; Mon, 31 Aug 2020 12:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1598877113; x=1630413113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Oz1QbsEusOtvbubifHA39dsl4XUiDJgxL10JqXIFoa4=;
 b=rjM3emVZsB7mA1Nzdx4fZVwR7ILq0CrPiZUrHFW6pTXVInFJnPJSGTxR
 BBP4MjGlYcj/saXewLf+h8PDzfsWObQTt9VbfbuGqL1kVDHGmRE7PEHSh
 AxkUmy3DE87TbO5t4bFmENUaQLMK3WBz6QFvUZPdVMMDn6HKT/ZGJMT9j
 eFNqkMuK99k5YM06pKITimOQrHlWcNRX2QvE+oE2S9uuh/MuET0tqF/p0
 8j9wEGnqgi3yY5yIacgr9Mz0gfj/If/T4evTMt3GemlD3zWD4LyvOzOqG
 /xH1xNFQqvwM0EJxtGcT3itrfVWiioxxXOD7v7qCAhcDhe80aGw4GtN9r g==;
IronPort-SDR: e1t/junpymYeGGq2T6veA6C/y8ydMeFIkafkqDxgB7PEaQmMLWuWMKETg175/RBJk0qpNAK5m1
 lPR3RrAULxitfWMjH8rOATr+kM6VKfVXPjQ6g45iimhFO670be42uDk9f+w107Tsp6/YbPu0ci
 bXt6hgAHzRFK1u6XLPf19i17vk4dlZUhxZ9tDilcSKFyHl7j2BwCYpfVkMyLq/mOtcOJUWAKeR
 r3MlB35KG276feRQx0iDrfghGVc/IvDXt9Mfy9iIQwm+K7lJjrXzmmT2NeLLo70Lg62EBZZWmx
 zmk=
X-IronPort-AV: E=Sophos;i="5.76,375,1592841600"; d="scan'208";a="255743407"
Received: from mail-sn1nam02lp2054.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.54])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2020 20:31:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1UKBI+UE3ArKVgy3lOaxb8zHJrMMHFbcQGhHfU6dedkOsA/s7/V+H446KclC5dCq6XPhT/w/mrwtNwGHA4PyBYfalFpPpDLcYGoWe53c1rXJWDKeggVLsiIugVyiXNGCr2djXGg5AINup/XWAA/D1XwCM0B8xJW5S7r0GlnT1dtMPtFdMNlhkZzkoPIR9cO8jfJ4znW1oEdukZ3x1rvLghW3TSZJxRageCqOcept7xCRJvnEJzEuyv1kaxnahgDjJf0q66b6bjH1cWwIUs/1Soqg4bI51OnTRxvrMR5dR324jMyO500nyfbJBPGIIf2xoq4/KF4EP2RG2YpxZICRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9l/BYtVt7dK9ZDfAtSAr1mkf2KZcxu9AfQS9ivD09A=;
 b=SWtWvMtWU9ccydvsDAgY2ueLNOpf9j3B+Y8rlipZb60cQ51eBxOMf5uItWlbJGD34T5fdyXJFSQuG882AAlUKdHdYvZA8unSPAB7sME9ECyiLWJ/nlZD+RS3EC36UBUg4Ta0xDUMNVCUqmtT+eDeyGW3ff6po3O7S5WoRiOHldQEcOYIy8YHK8X1XuMOgV9luWQoAJ9PTQk6EmegarYzmib4gRWZ/ZiQ9vVowOuG3rUpGOmmEE/K10gsfE6L7E6ybX4Xp9vTzUTVtlh1zn5LO9ysctI+eCyR3W4kzVolhZ0Bylf9TmUPL7ZLsJLyjRpwF/kk7Gk6ZOzdFiy+jiDkqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9l/BYtVt7dK9ZDfAtSAr1mkf2KZcxu9AfQS9ivD09A=;
 b=ohgAOehJC9oeDTFWzHdnWY+Kw5oF8Ia/Qsr9lwrjmIkfhg5yC8trfmZbHL18DVFdS1Ht9gv4XP8EWNHu7O0GZTi+dQjPdUZZczKXG3FeMeYZ0Ojo+Z6BlYNatX+P18rQqPeDQHJDnTjIPZz3INPOdxsFTFXU023n/iz4btd6+Qs=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6092.namprd04.prod.outlook.com (2603:10b6:5:12b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 12:31:49 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 12:31:49 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v14 14/17] RISC-V: KVM: Implement ONE REG interface for FP
 registers
Date: Mon, 31 Aug 2020 18:00:12 +0530
Message-Id: <20200831123015.336047-15-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831123015.336047-1-anup.patel@wdc.com>
References: <20200831123015.336047-1-anup.patel@wdc.com>
X-ClientProxiedBy: BM1PR0101CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::32) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 BM1PR0101CA0046.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Mon, 31 Aug 2020 12:31:45 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [103.15.57.192]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38c10d82-5c35-43a1-9e44-08d84da9d508
X-MS-TrafficTypeDiagnostic: DM6PR04MB6092:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB6092B7E12E4545AE12F329CC8D510@DM6PR04MB6092.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f9xsqYv3MN5NCHhI0xN1WKSUcQWBH4G0PNGHaisSK9uIRp4uJhn0+35sr/cSYOYwdt+VX45CrwaGKHHcjgOqxPzJGy7X0cZDocXyen7lKNCAbLiBEljaVR5FVZ3nssiB8RbeR5fSrPYT5rsQH10/LQEWA5awtUvHjwzDSIou4DcBMI8vZqoQ2qlNEUYsF8DTUhMMUeB8bct0wmS+vkM3pXWqHv9GEY0vDsUlF0xksX03C0rM1OqQt3hFkB0e4NOchYiDfIXqE6C6wZZL2fAVGTVDvramDgMrDSJ+WmMqVruyL/tA6yiDrgWZ7wK4Pr1Vg6zLK/G0Zjcly9Vag7KuvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(44832011)(6666004)(52116002)(8676002)(86362001)(36756003)(478600001)(6486002)(7416002)(110136005)(8936002)(54906003)(66946007)(1076003)(66556008)(2906002)(26005)(186003)(66476007)(956004)(316002)(16576012)(4326008)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 2JKdvp9fGAc27Q4qLX9UD/Y7xuBuW+JFebDj+ziJE7R4CfVsSg/gl6HFXyuGQCd/ehCr+xBZKUGASBC5jbjJeBQp6ooXD6fFu7AZMYiqjUargR595WKdLRNe+0ehJKCnQUqdJooMq+eLBJfRD5MAuyI3bWl9a/DKCFRetv1+hOuIX2E4zPRUadeZGamD4uu9aeJ1whkNCLGjpgmP4HvT9qOFxGEvKoaOfK56iIw8QBw0YiKIB4L8D5LqjhrVsQedKDRLcvYaQsL/e+G+8rDmH9Ozk7sDW+i/0CLtN0QcYr96w8kIdSqVKUZ9JpbL6AgjG05DcxKE+hiuMXiE7YX1ssC6h75SY3cviBr/Kxm9CXQQr+/+rdayEH1a7mcchKiiV9Kk/Ux8Z5HjRY7beVFRVugC1oRfeMbrFBE8LxmwQPa/XheloUkOu+Np4EWuvjBcCIIcBm60sf0kkzz1F0WKEHYk2ijROfT5V+Y8bopo4qOiQ5t4Fg/p3tXnIBgYnvtqb9VQw72iXwJmq/RAL8d01rjJ/YFpJDA8X0P482ELKSxa5x+KJVqLlxarFCUMI1l5Dxa7wHV+zp160K72yglFZWVCL3LyXiYlz8rfQVKOMEBe7YXpBv2iakfgL1aA+LzHFGiRr/WMonCHyhCPTlA9jQ==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c10d82-5c35-43a1-9e44-08d84da9d508
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 12:31:49.3807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLc7WXGOkMQq1r+XcfOXQoBtY4MnMIpTUdGTFY2aGnwcPhqKb+0TgJp8+yDodkPLRj41PQy/4xN7SHjBksP9sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_133154_169905_DD4106FE 
X-CRM114-Status: GOOD (  17.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, kvm@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, kvm-riscv@lists.infradead.org,
 Alexander Graf <graf@amazon.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Atish Patra <atish.patra@wdc.com>

Add a KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctl interface for floating
point registers such as F0-F31 and FCSR. This support is added for
both 'F' and 'D' extensions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alexander Graf <graf@amazon.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  10 +++
 arch/riscv/kvm/vcpu.c             | 104 ++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 00196a13d743..7e96ac1f51f0 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -113,6 +113,16 @@ struct kvm_riscv_timer {
 #define KVM_REG_RISCV_TIMER_REG(name)	\
 		(offsetof(struct kvm_riscv_timer, name) / sizeof(u64))
 
+/* F extension registers are mapped as type 5 */
+#define KVM_REG_RISCV_FP_F		(0x05 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_FP_F_REG(name)	\
+		(offsetof(struct __riscv_f_ext_state, name) / sizeof(u32))
+
+/* D extension registers are mapped as type 6 */
+#define KVM_REG_RISCV_FP_D		(0x06 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_FP_D_REG(name)	\
+		(offsetof(struct __riscv_d_ext_state, name) / sizeof(u64))
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index d039f17f106d..2d8bab65dec9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -431,6 +431,98 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
+				     const struct kvm_one_reg *reg,
+				     unsigned long rtype)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val;
+
+	if ((rtype == KVM_REG_RISCV_FP_F) &&
+	    riscv_isa_extension_available(&isa, f)) {
+		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+			return -EINVAL;
+		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
+			reg_val = &cntx->fp.f.fcsr;
+		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
+			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
+			reg_val = &cntx->fp.f.f[reg_num];
+		else
+			return -EINVAL;
+	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
+		   riscv_isa_extension_available(&isa, d)) {
+		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.fcsr;
+		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
+			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.f[reg_num];
+		} else
+			return -EINVAL;
+	} else
+		return -EINVAL;
+
+	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
+				     const struct kvm_one_reg *reg,
+				     unsigned long rtype)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val;
+
+	if ((rtype == KVM_REG_RISCV_FP_F) &&
+	    riscv_isa_extension_available(&isa, f)) {
+		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+			return -EINVAL;
+		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
+			reg_val = &cntx->fp.f.fcsr;
+		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
+			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
+			reg_val = &cntx->fp.f.f[reg_num];
+		else
+			return -EINVAL;
+	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
+		   riscv_isa_extension_available(&isa, d)) {
+		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.fcsr;
+		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
+			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.f[reg_num];
+		} else
+			return -EINVAL;
+	} else
+		return -EINVAL;
+
+	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
@@ -442,6 +534,12 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_set_reg_csr(vcpu, reg);
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
 		return kvm_riscv_vcpu_set_reg_timer(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
+		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_F);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
+		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_D);
 
 	return -EINVAL;
 }
@@ -457,6 +555,12 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_get_reg_csr(vcpu, reg);
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
 		return kvm_riscv_vcpu_get_reg_timer(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
+		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_F);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
+		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_D);
 
 	return -EINVAL;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
