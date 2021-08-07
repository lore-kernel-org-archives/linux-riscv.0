Return-Path: <SRS0=3V4y=M6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3050C4338F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 17:55:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4523661050
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 17:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4523661050
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0wofzHKBhCRUUT9sRD0mU6CsQ/95C2TDG0PlwgY8290=; b=Fxn5AEMeZT+uMA
	Sjqa9NGj9/KlPxocFb2+QSES+yBV7rtd5tVUD47gsG6P4+a5ZnWE5MSROO1WX11bvJcRFLct6D59c
	MK5fhZYH/Iu4cYkBGStbYJD2IvROnD11zFYFSP08+jReLMS6XV4Vwg9FzTAs6bD4syIIDAoPyc6wB
	AEFku6pEEeZUsnTi8Y21VZF3ae5XpwYuU3Trtx5LZb0pBxj2n88yfUsogIIBN1AQni8zI5tohLalx
	ArwRr6GB/R+0hZYrmVIqB85sxpyrUHUTClqdx/KrKg8H6p6Mb5iBmwbrMyCC6Koc8WUoQcHRW5s6U
	ascIJK4tXMBzMA+Ddv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCQXH-00F1oY-To; Sat, 07 Aug 2021 17:55:03 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCQXE-00F1nc-Ra
 for linux-riscv@lists.infradead.org; Sat, 07 Aug 2021 17:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1628358894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+PdSIjYiqnE7ngzUNR6GSjOODY7xSE+rGb8iQWM6i3k=;
 b=Kx6UUw4K1k/O0biGtej6CPcri9T0bmOWaDClWEnhRxcY3T29rCOHJZyuyA5ldMfRA7tn2K
 BJq50XeQBH+I1c7GoDLZH0kP/5EldiBZV7gZK02RyoHMloTN4pb0txNbbN35XGDeyFFJFI
 dFzISbYNX3gGbDcZn01Tk4wsD2wt+sw=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-cYmaEW-cMsGvTxVnnpifjw-1; Sat, 07 Aug 2021 19:54:53 +0200
X-MC-Unique: cYmaEW-cMsGvTxVnnpifjw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxRpZIRpjmfzmiITMP1Q2xYVm+k/5bsar3g4Rp0ry9KzpVpgvIyNeWDGRCyz7HunnS11nevGc1l0GjNh8I4CyAt4M+pHGHa4pC7VFxF2+RyIxNvBFLgNCfM8NbH2rThnCEAOWGfPMiLniRN0MkSfme/glpDSB6yzfP5X/xneUA+J97j2VaavYyzVS0MHMlNWmeIlSWEK3t18vfi69tmbGL5NlBZE26xHgeUKUshafRdj7zyPR/mULPP2/ATxsBc/yqmdLDHiK1OdFD+6vGAQRbDU85J6tIUgnPWNitqEjrrOQ3WxQM6UfcmKjyt7Q4nrIsaQ4525NR2WJTLXHvllWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PdSIjYiqnE7ngzUNR6GSjOODY7xSE+rGb8iQWM6i3k=;
 b=ePQQRd0VWyamyrUmzACGIISSWPn2GluBb3upjZJ9NI3Em+r9Xk/n1l5Nb6/TA1guqB3aKeUXVw6/gyBqcTQ0TZ6Br7g+XU0PoWwAcbm45B4/8Y5aoBdrUnby2fv+clg6QVn5JeK6uN1ZkkNH1vqE5YV3PkriEtwkzDj1EEW6MhISJuzL3lFHUEecI6xDOQz6sUgvhBxpZLG0AL7BGoUTVjPFHWbw0AeYc1fVjfRW+Te6TvXBWXhJhA6W2qWol8cpzPpRi8yBRwb+e3/BowuV3rHOZxoplVEjcBQPUw63iqCoveFV2luf6bRpkCKwbSnpF2xmqH1QynOwifRAa64FkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=suse.com;
Received: from AM0PR0402MB3395.eurprd04.prod.outlook.com
 (2603:10a6:208:1a::16) by AM0PR04MB5811.eurprd04.prod.outlook.com
 (2603:10a6:208:133::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Sat, 7 Aug
 2021 17:54:52 +0000
Received: from AM0PR0402MB3395.eurprd04.prod.outlook.com
 ([fe80::5cda:882:3d34:4868]) by AM0PR0402MB3395.eurprd04.prod.outlook.com
 ([fe80::5cda:882:3d34:4868%6]) with mapi id 15.20.4394.019; Sat, 7 Aug 2021
 17:54:51 +0000
To: palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, aou@eecs.berkeley.edu, mick@ics.forth.gr,
 linux-riscv@lists.infradead.org, petr.pavlu@suse.com
From: Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH] riscv: Fix a number of free'd resources in init_resources()
Message-ID: <7e3ebd5a-cd41-4591-ba2d-0151fa45e8ea@suse.com>
Date: Sat, 7 Aug 2021 19:54:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Language: en-US
X-ClientProxiedBy: PR2P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::25) To AM0PR0402MB3395.eurprd04.prod.outlook.com
 (2603:10a6:208:1a::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.100.51.161] (195.250.132.148) by
 PR2P264CA0037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Sat, 7 Aug 2021 17:54:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bb7fef6-5d93-41f8-be97-08d959cc74cc
X-MS-TrafficTypeDiagnostic: AM0PR04MB5811:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5811386B761259FF05FBA602E6F49@AM0PR04MB5811.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: duru/5haPV+ArV3ToNsYp8ST+r0Up3zr3CTJSRMOE5onE2dOF+qR0IvHLKuJfDO2G4H2xuPP86Aw4O94YtFjJ/vJkBk+dJQYY9wZZbgaVmRy7axsn98MaJNqFdj8ys+Ifzc49+hx81SQDvPIEHfQGmAkjooHgLiaUSnFLIy8aqasgXIKoOXUj6Il3eHpch8M3kJQGU+WPdemB4P7AA7AzxUgifAob8oY9rCtYUZsxlt1Xsv2K0Ld1/LgJ22quTpXtsukjKSSL8TwHso4xEuaA+6/a8XDFQpJgvzmBdv0b1XqjDUOzTAXRokUPo1vjadkwYEKPFEmPVDIbH+ZSWzIhLHL9w90uVI8crFmOOEJCE1XwOsc1DmXrlCwtTTfQGV5kvVvRDTHRoG4GugTLFCrwb2Wnts+ryn8Wn/dynQQdnVv7/kmFvfGHhNIAFjDElDzS7izvds5Thr6vlFlYRJQioHvJ/IGUU/2PBKRepkM/drj8HjdidFTOm6PLnc0YL6Qrz3fwl0YFE1LIMLdFfcJJSuhta7UUHBDZ09LMqMMwyMqEE6jbKRaS6r/HQxU0WEOUoPes3OG7TLLRxvmDFR1qsYygb6rrqHYiTSg1vhHuHNzSz7DTukKMMNpbnoELFkzHCogxpM3JDoHdjiWpXB/VdAg+s04jJpLaRkupAXOdcdd+1djxnKHiJC/llOKY7WREJHdB3HqNSGjhoYNIb6FYLhhycGo6Y2FkskFKF3yLUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR0402MB3395.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(346002)(366004)(39850400004)(8936002)(38100700002)(66556008)(16576012)(316002)(5660300002)(66476007)(66946007)(31696002)(36756003)(86362001)(26005)(31686004)(186003)(478600001)(956004)(4326008)(107886003)(6916009)(2616005)(44832011)(8676002)(2906002)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXI2Tm1IeFlBb0ZCekNJZjZRY3NTU0g0NUpscSszeTJwMmovRm5yQi90RGxk?=
 =?utf-8?B?MjI5Q3E2a1NXdlM2c0xMakljTFBKWllVSkRUU0czditCdDUrRWJRZlRDc25a?=
 =?utf-8?B?MnZwNVJ1MnFCV3p0MDhIc2d2b2ZoQWtJOXM4aSt6czdQemJ3QndsNy94NlZt?=
 =?utf-8?B?a0ZtSnlwUzBFWVl6VmZBbS9Sd1kyWU1ic09uZmNOME1kRzFCcGRNNlVFUHpS?=
 =?utf-8?B?VXR2Qk1JcjdzUlhibDNVc29IWjZCYWM4UGRHUVdlQU81VEdMR0FjVDdSd3FV?=
 =?utf-8?B?eFpQZ1VyVUptZVN0b3JPR2FwZkJhbzAxQzZ5b1BQRlRtaitMZTdOSjRpeHJD?=
 =?utf-8?B?SHF1KzhFZFNnSlI0UnFmTGg2M0ZzVDJiNUsyV2c1K1FVWFEwVHZUZVMxSjEz?=
 =?utf-8?B?R0V5eFlkSURNbGtNeFNuYU8rWWJTY0crQUZQQW85Q21BTWpoR1cxYVZTN0k2?=
 =?utf-8?B?VGk2WG9LcGpWNnVtQXdGS0IzQ0V0bFV4SXpXWWFKQjVwV2JvM0FQVU93dUxT?=
 =?utf-8?B?YWhBUXlMVnR6S1R5TDdEa0d0Ris0R0JaUG41dWExNmpxM0JRVFNjU2JoS1Nu?=
 =?utf-8?B?VmM3YWdZUVBwRkx0blZjTGd5SXVwblQ0V1M5dDlHZFU0aVFGNUY2ZytCcGNX?=
 =?utf-8?B?c3NRZUxKQzlGN0ZGMkVscjZXaGVZUS9acmZrSCtjaFltam1IVTlTazFOMUVN?=
 =?utf-8?B?S1MxYnVLWFdzTjhjaXR2RzlzNitUclV1SElLSDJNdEFpRFBHTzcvS2JGOGdO?=
 =?utf-8?B?SHFqWFUvb0F2cE5zZnNJNmgySzU4TkhUQ2kzVTBKYU9Yd3llMDNZZGNwVXhW?=
 =?utf-8?B?cTQxWlZ5RXlJK2NDVlRZNml4UTN2RWFBWldMTVVRTzFLcUZXVnlLa2lNU0pl?=
 =?utf-8?B?OEJKblNsbHVta2oxR05YVGw0dDB0N2xob1ZuYVpoVzFYd25mSEhOSmxHZnZj?=
 =?utf-8?B?Z2MzVVdZbE8yVUtrL2VFOHJVWUNTckowYWN2R1p1VUNVVXlSY012M0xJRFoz?=
 =?utf-8?B?K0tWYXp6Zi9taFJFZnF0LzVyRUJ3dEVnUDRyYlNkT1hTa0xqL01aMWd4amJQ?=
 =?utf-8?B?STRkY3dZV1NUTTc4TlNGL1Z3T3ZSMkxLS2NSNlpYUXRaMkN4dUlMM3pSMGxR?=
 =?utf-8?B?d1U2VTNPdEJjTFdtNEdER3pUZUprK21oODhrTDJWbXJrOXBUdFFNOTIvejRv?=
 =?utf-8?B?TWNoamlXUW5EVUh4YzRWQjJjb1FDN2VxeUF4bkFtaTRqK1ZSUjdDTDhlZ0p4?=
 =?utf-8?B?eU1SWE1rUDE3UVArSFpsYlhtU0lVQlVKYVh3VnpiWTU5RU1ITy9CbTIyVWpU?=
 =?utf-8?B?eUZlRUYrdFhJSWQxd2Z6ZG1XcWpFQndKUERNR1Awb1hucXdYWnhWR1dqRGdn?=
 =?utf-8?B?RkxSaU5PMlFFOWVMY21iTC9mNmRaY1Q0WUs2cnIyb1VtWHBjMkl4dTlqbXUr?=
 =?utf-8?B?MWFmODJRdHB0bmNYTFIrNlZrTmRMelVyZFRZZ0tVbFpkOU9neCtYQ0sxdE9T?=
 =?utf-8?B?Q0d6aXJqN0cwMnVjVkdXZ3ZZdFFhY05wYkN4a2dSQktYMlA3L3pxNk85d3FE?=
 =?utf-8?B?T0lPM1ROTndCcFMrT2kwd3FEQnNUZTdqM0NmQk9jRFNLVDJjaXdFQW5rY2JC?=
 =?utf-8?B?RUVuVlp3bUJKR1NRTlg5Z2hKNk9tSFpTcEJQTnFWeVhiTmJVL0ZaOHdpQWVR?=
 =?utf-8?B?TVlNM1I2cUZrZm9oREQ0YmdMdDhkWGkwbFRJNjdoeERocHFCMERNWXVBVjRU?=
 =?utf-8?Q?pU6JwJ4t1UlTdE790RMN551ojQxxaZz8BY7JG03?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb7fef6-5d93-41f8-be97-08d959cc74cc
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3395.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2021 17:54:51.8370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /H4UvQWu/ErKSZhqPJTEWN58/8kwn+zHjWUu6S5p91iLSrhzQGVzUnJ+IwdBW5Kq/9tr99ELesoYWE/1xI3q5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_105501_093042_4AFCE3C4 
X-CRM114-Status: GOOD (  11.87  )
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

Function init_resources() allocates a boot memory block to hold an array of
resources which it adds to iomem_resource. The array is filled in from its
end and the function then attempts to free any unused memory at the
beginning. The problem is that size of the unused memory is incorrectly
calculated and this can result in releasing memory which is in use by
active resources. Their data then gets corrupted later when the memory is
reused by a different part of the system.

Fix the size of the released memory to correctly match the number of unused
resource entries.

Fixes: ffe0e5261268 ("RISC-V: Improve init_resources()")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/riscv/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 18bd0e4bc36c..120b2f6f71bc 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -229,8 +229,8 @@ static void __init init_resources(void)
 	}
 
 	/* Clean-up any unused pre-allocated resources */
-	mem_res_sz = (num_resources - res_idx + 1) * sizeof(*mem_res);
-	memblock_free(__pa(mem_res), mem_res_sz);
+	if (res_idx >= 0)
+		memblock_free(__pa(mem_res), (res_idx + 1) * sizeof(*mem_res));
 	return;
 
  error:
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
