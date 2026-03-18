Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885CC103E177
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/QnDOFhBBJQrzBSNCw9vUJvjxHP9mGS0VWe5HQcJug=; b=J7EPvJLN0X1pM0
	f/S8MEW7wcMINA9GUFJNqXLyNiJxbmYS6tIuMncoSZaMvlLtNHofo2fR5+SyAEP1/NQL/gkBRvFNV
	yHT7WjB0IqcdOzBCXnUF3fkbxEwoycIn8+ZE9C0WRfoOh90wX1Q2GhVjeHLmQs4f4pRPKVnLcZ1KK
	hPHmZxeU6CoxS+wuWyMQ7uk/r7b7IhKFoWs2Bl7exCOymbf22ostpJByKM09Qn43C5y9JYZWQW2dO
	sRUl0YIXcUSu6DbCfRogza9wdPTubaTAY8DzBhjkkketuUkrz7A3o2ML4uj6yLmDtK03DBgm5SSQa
	drbc4M+cRSVjttQry7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qxS-00000008TuK-3e5C;
	Wed, 18 Mar 2026 13:29:10 +0000
Received: from mail-uksouthazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c205::5] helo=LO0P265CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qxP-00000008TtQ-3oYq
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 13:29:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwUeu19JXLiJwultpI8eJjYnaeQG1+dz6rlCDZsKvo6+w+I6G4HbxNFRPXJXQNro8lESsPXeZN4HmNw35/gyv/E/xhCZEtm+qgojDxBY1jNvpki3oZpGAD9CGv2DLQ4fZp/m+zDD5WObbPSYe7qIjvXzgP2/MARp3ZkRXfun7/JeeJ1V4zoWUZJ7PkL9yGUleTl83OINsWQbw3pZH6Tz45PKHQ1YmhdUhHkoswTEsSjpWNF0R4SpfKbHjuC+P3uo9qOlDa8Zy2P8bNqULuMF2xKPLJTyZXLQ+RThpw2WE9chis8A5E0c2pKlbpq26XP6khkSqzAA62TQBE8zYcGKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZQaE6zuLIJwIjyrS/QctnbgoLoi7OfCCID1vez33EI=;
 b=XUMLWatB2LRLiJeqEHzobf+1kP6m2wZSI70+t240UDVZcS+BMjuRE5UrILCBRjbo8OiSexM688eCTUv7kgYjXGm67nCJX5LbUPrpGSDQwNFeDeKPyJjWqyeZtBvZrvnoQ/gLfcjRCERoWCFtcvOFzxIG88TpTEM3O7xS+eh6i/x1RM2ZootNbrD9tk2z6UszbDm7rICsk/y12xnjfAjYC5JEN22t0fyp43bcdnuM87d3Q94wBnayY+D/a0CMgTfJsWKsSWP3ZnwkC+im3zNwPevu88IJrVPGeHsoGPMezM/PiKZKPh75Jb0EK1QvsgDcq4T1N1IgAPbj8TAF28TF6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZQaE6zuLIJwIjyrS/QctnbgoLoi7OfCCID1vez33EI=;
 b=AAhKZR+cwJhbMp6NcrDQtnqkxonxxvDnrrBjas5nuAgK/TdgH079EAtIE7P4whk0kfQaqrEnQOYNQlioyIgEtbFe87FvRZ6NwOkqsdCCAVcJDP9G0deD6Wri/OcM7IlBebrGgVBerdK6Hb1lPW/qP9RtaBIJlZbjhMF/6Goz+B0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6609.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 13:29:00 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 13:29:00 +0000
Date: Wed, 18 Mar 2026 13:28:57 +0000
Message-Id: <DH5XZP4LPOXG.XL69OTK91FIX@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/8] gpu: nova-core: convert PMC registers to kernel
 register macro
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260318-b4-nova-register-v1-0-22a358aa4c63@nvidia.com>
 <20260318-b4-nova-register-v1-1-22a358aa4c63@nvidia.com>
In-Reply-To: <20260318-b4-nova-register-v1-1-22a358aa4c63@nvidia.com>
X-ClientProxiedBy: FR4P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: 917cca17-a127-4680-602d-08de84f25063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020|56012099003|18002099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: wqEhib/qLEQsCiNKUwPZQ4RnTtXPav0Ll1hFJFk5bXgFCv3J1jmuM+7iAzjsWUJJPC0KrXfK5ozEZd0I5/H3753HEXWCiwxxQAimw+YXe+oOOIkYds+EI3FDpGjBaFi1gjb6NtCUzJa26cpzAX5bIlU5b11BIdyPDBtsgZGXOTQYA/thRngkU0mEjJU21mSyTOcAtTAaETYo7mO+iwM71HBQ0asqaz7B0no3CTlZbEL2wPErzD+76ZuxSdqbyophH6KHqNo1y1AnqD8n5cnnGlydm8vKeExZHXhBBAce+/9lKu5jv4EIfEIUJ7cdn+E0IHBcKL8I6j3nDa3zSfIBh6ybJVy8RHDJ9KvQ1NvAL81L9Zr+Rm1cVy8O2s8rMf4bE+hXLHGgjsCLdn8YupqtwV+o3TTPe565vtRCisXdmA0d0OsZH48g5GqVRNHqXcXggDUU5Ji+zbryytwlSl6OzTS8KBBKwNpBOmk00HTmLqK+C3MSvaJB3WO8Dv31pMfN3jJjk+lXI9ezv0xW0EmXAOcN2h129hR2aEgKAVk8jz/2L8LmE9kJzscWnOzuQePp33HX79YQ86IoSEW9Ris1jYb6NBzaakykLd0s93ADy05UYBaupwoN1SELU4laHVBCoUEDu9G+UG0Lx856LYJzzorFKYfbujtrV/LQ2A5hVFhMKc7/JmPg1nFVkxaQKUs6YDYUs/vD7JbTrSstXbFqyAfD0udh9+U+R6q4M7sM12ZENo4swx8qIcDuUIbCQG3emM4AlLk6PFVU/qTmJVZGZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(56012099003)(18002099003)(22082099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0dMUEJwTzRzYnpEY1N3TlgrZEtQamZ5MnZpMGlPVEh0aWRndmg5SlM5MXRS?=
 =?utf-8?B?d2JHUVNjQ2FzUE8zWU9FaHRPaDdyVjNZMHA0RFYzNUEyOHVZS1NwelErcC9B?=
 =?utf-8?B?TW1YTEt4VUNzSmxCR2Z3S0FpWEwvYmY4d3ZuYXA3Z1VXMXRWMS80VVE4SkFn?=
 =?utf-8?B?SUFQd09GaVdvVDJJYzcxaWZITGdvZ2x5WEdWZkZCTkZ3b1IzOXJaSklYK3du?=
 =?utf-8?B?Sis2OEZubWJkbFBCcFlQNW00UWpxZ3VIdGxGOXlqSVY5K09zTkh1WjN5V0VG?=
 =?utf-8?B?VW50Si8vSDIrNU5LWEY4SnVLOFppcXl6NzI4ZStrUkFUWis5L3lYbk00b2NR?=
 =?utf-8?B?cTJmUnMyQVAxaitSNFJRNGhQNDF3K1UzZjVneWdRL1AyZzlQQU5ybmtsb21j?=
 =?utf-8?B?OGg1aExhb2V4bEs5UFhSSDdkMldhUkZQa0RVTnE0RzFPUXV4VGZGSkk0dWs5?=
 =?utf-8?B?b3lVSzJMVVQzaTNDUDlScTBaQVd2SEhEWFVNQmZDdWpQZUN0a2FDREhUTjF1?=
 =?utf-8?B?S2tqV0tFOEMvZWJFQ1ZadkQrTW5BODNVY2c1N0RwWjI1OHFxN0Q3MzQwSk1U?=
 =?utf-8?B?dnc2OU5mY3B4WkgrMERzVVVhaUVNWGhXdDF4RWRleFJxS1hHUDR2YmlZSTV1?=
 =?utf-8?B?TTV1cm05QUhWUTJiZWJ5NTlYajZNQnNEZ2g3dnpBbzFwRVhQVTN2azVDaXpn?=
 =?utf-8?B?VFVIMDVjSDNuMkJ0ZGc4R3lKcDkxVXA3ZWk1NUk2clRjWndRQnRHcUo5aEls?=
 =?utf-8?B?enNML2FadDkzdEJXMTk1TnhBMm1oa2oyQk5MaDdrb2VJaG96UDJGNFhoSUlF?=
 =?utf-8?B?cS9WQlI1dkhpQmg3MjVyMXVFbzRyU1hIWldFZFAvck01Tk5NUkFzdkxGVHZ6?=
 =?utf-8?B?YkZaUzdBNTM2ZG5Jc2JUcitJejZORG50M3VEY09INVlZclUwcTJMcGhFVGR1?=
 =?utf-8?B?MDFTcHRLRnVCWWhQZVJZZUxaY2xXMGJ6Nkk3d0NEM1pLTHZ0MHF0bG9ZOTFv?=
 =?utf-8?B?cVM1THNpS1Z5b2dYWXlYWk9pMkpFQWU3eW15S1ZpR3hweldqcXBYYzRFak5P?=
 =?utf-8?B?cWtBdUw2MXg1c0taL2E4Z2RGb2cxY2ptaEdQaVp2aXFKNm9ySUJUV2ZaemY0?=
 =?utf-8?B?STRvSEh1U2dwbkRvaDZaNDRlNzFPeDc2ZUJsd09tZExmRXUyd3U4MTJxZ0hP?=
 =?utf-8?B?QzRhWmloYksvTi84SmViZm03VE1YblYvVEFHcmNJcGsyQkdFdjNEcmVoK0I3?=
 =?utf-8?B?N29FSzhvaFBlU1o4Y3JIeXB4eTVheWNGWUR2cGZTUGp4dGlETW5tVks2dlM3?=
 =?utf-8?B?aTlabUJDRzZiSU9uTnJIOC9NWjJ0KzRIQzI2NnZkY0VzQ2VzTW1NUjFIWVMy?=
 =?utf-8?B?KzNMSjhORjV6WkhDdDNTa0NJMjBRbzdWQ003bk56a0tHM2hqN3FRbHZSQ2tu?=
 =?utf-8?B?ekE3dE5mQUNQKzQyT1JaNlBKS1cyOWc5MVlpNjVvK0NmNFpua2VrVUloZXRB?=
 =?utf-8?B?dTMrcHhLWG9YRlNyV2JadU9lYVBmL0Q4OUZXODcwTWs4b2NBSnhNd2p3NkVB?=
 =?utf-8?B?ZmlpSUt0MndCcWsxSFg1R2lKWEFLWWJYNG4rSFQ5N2hrSjVPVFNkRmZXSHpT?=
 =?utf-8?B?dWhuUk5DYTk2VnByb2hRVmhaL3g0dXQ1eXIwcEdDZDRzOWQ5cExZOWdTak1y?=
 =?utf-8?B?QllFajNQY3ZJWTl4dExQc2tnc3FEbFVkVjRyNkhKY3FIMFpNSlBENHpvWWxB?=
 =?utf-8?B?TFdsTW5UaUlCTjBtWldjdGMxVkFTb2s5alZGNmZ2UzIzeWZHbkd3NHdPdXZN?=
 =?utf-8?B?YXd3OUNCdjB6eGIxTktNQm1raHFpU0ZsTlplbnkwcmJidzIwSFZpdUJRTTF0?=
 =?utf-8?B?YS9IdjdnWUQ4VmxCblE5UG1ENVlQMkJ4UjNVRUZMYzcvQ2VIVG9ETGlpdjRv?=
 =?utf-8?B?bGRSUVRjdisyUUZtcmlsL1djUDkwbGpqWHg0aDY0K2hIUTN6SUltaWV2bjg3?=
 =?utf-8?B?WnNjMkJpR2dYVDN2MEFURDNOL3lLNzFlQzFQbkkrcklpc3dnT013YWtqRkZt?=
 =?utf-8?B?b3hXNXR0TW9uL3N5YnRWbGdMbDlsRk1lL3dzRTY5UHFrNWcxVFN0N2lOV1pE?=
 =?utf-8?B?Y2xDRVJJZHV2ekVrQUFpbUtOY0RDRXBkYTEzelowKzFWM1VpeWt0cXRRTVR5?=
 =?utf-8?B?M0NKU0dIeWZEQjRMUU5DN3dUbjN4YisyWWM1cEd0WVRiNzBURnoyc2lYVHFT?=
 =?utf-8?B?WjJJd0F0cDFiQ2dCRUk0NnRhbUdQYU1Vak02cUV0QVhCL3VqeU9WOVpYa0dR?=
 =?utf-8?Q?jMJwbmStTpsFvL5jYS?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 917cca17-a127-4680-602d-08de84f25063
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 13:29:00.0018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lT3bNqGJidZ0owHVmV8XY6YIWjA6g+8ATSYTI7zEHqPwQyXTZG6iIMVu1QC2XdaMQbWTKKD1ThqwYDPE7/Rthw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_062908_166254_2BB1DA75 
X-CRM114-Status: GOOD (  19.31  )
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

On Wed Mar 18, 2026 at 8:05 AM GMT, Alexandre Courbot wrote:
> Convert all PMC registers to use the kernel's register macro and update
> the code accordingly.
>
> nova-core's registers have some constant properties (like a 32-bit size
> and a crate visibility), so introduce the `nv_reg` macro to shorten
> their declaration.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs |  7 ++--
>  drivers/gpu/nova-core/gpu.rs    | 37 ++++++++++-----------
>  drivers/gpu/nova-core/regs.rs   | 73 +++++++++++++++++++++++++++++++----------
>  3 files changed, 78 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 7097a206ec3c..4721865f59d9 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -13,7 +13,10 @@
>          DmaAddress,
>          DmaMask, //
>      },
> -    io::poll::read_poll_timeout,
> +    io::{
> +        poll::read_poll_timeout, //
> +        Io,
> +    },
>      prelude::*,
>      sync::aref::ARef,
>      time::Delta,
> @@ -532,7 +535,7 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
>          self.hal.reset_wait_mem_scrubbing(bar)?;
>  
>          regs::NV_PFALCON_FALCON_RM::default()
> -            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
> +            .set_value(bar.read(regs::NV_PMC_BOOT_0).into())
>              .write(bar, &E::ID);
>  
>          Ok(())
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 8579d632e717..d81abc7de3d7 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -4,6 +4,8 @@
>      device,
>      devres::Devres,
>      fmt,
> +    io::Io,
> +    num::Bounded,
>      pci,
>      prelude::*,
>      sync::Arc, //
> @@ -129,24 +131,18 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>  }
>  
>  /// Enum representation of the GPU generation.
> -///
> -/// TODO: remove the `Default` trait implementation, and the `#[default]`
> -/// attribute, once the register!() macro (which creates Architecture items) no
> -/// longer requires it for read-only fields.
> -#[derive(fmt::Debug, Default, Copy, Clone)]
> -#[repr(u8)]
> +#[derive(fmt::Debug, Copy, Clone)]
>  pub(crate) enum Architecture {
> -    #[default]
>      Turing = 0x16,
>      Ampere = 0x17,
>      Ada = 0x19,
>  }
>  
> -impl TryFrom<u8> for Architecture {
> +impl TryFrom<Bounded<u32, 6>> for Architecture {
>      type Error = Error;
>  
> -    fn try_from(value: u8) -> Result<Self> {
> -        match value {
> +    fn try_from(value: Bounded<u32, 6>) -> Result<Self> {
> +        match u8::from(value) {
>              0x16 => Ok(Self::Turing),
>              0x17 => Ok(Self::Ampere),
>              0x19 => Ok(Self::Ada),
> @@ -155,23 +151,26 @@ fn try_from(value: u8) -> Result<Self> {
>      }
>  }
>  
> -impl From<Architecture> for u8 {
> +impl From<Architecture> for Bounded<u32, 6> {
>      fn from(value: Architecture) -> Self {
> -        // CAST: `Architecture` is `repr(u8)`, so this cast is always lossless.
> -        value as u8
> +        match value {
> +            Architecture::Turing => Bounded::<u32, 6>::new::<0x16>(),
> +            Architecture::Ampere => Bounded::<u32, 6>::new::<0x17>(),
> +            Architecture::Ada => Bounded::<u32, 6>::new::<0x19>(),

Yikes.. this looks ugly.

> +        }
>      }
>  }
>  
>  pub(crate) struct Revision {
> -    major: u8,
> -    minor: u8,
> +    major: Bounded<u8, 4>,
> +    minor: Bounded<u8, 4>,
>  }
>  
>  impl From<regs::NV_PMC_BOOT_42> for Revision {
>      fn from(boot0: regs::NV_PMC_BOOT_42) -> Self {
>          Self {
> -            major: boot0.major_revision(),
> -            minor: boot0.minor_revision(),
> +            major: boot0.major_revision().cast(),
> +            minor: boot0.minor_revision().cast(),
>          }
>      }
>  }
> @@ -208,13 +207,13 @@ fn new(dev: &device::Device, bar: &Bar0) -> Result<Spec> {
>          //     from an earlier (pre-Fermi) era, and then using boot42 to precisely identify the GPU.
>          //     Somewhere in the Rubin timeframe, boot0 will no longer have space to add new GPU IDs.
>  
> -        let boot0 = regs::NV_PMC_BOOT_0::read(bar);
> +        let boot0 = bar.read(regs::NV_PMC_BOOT_0);
>  
>          if boot0.is_older_than_fermi() {
>              return Err(ENODEV);
>          }
>  
> -        let boot42 = regs::NV_PMC_BOOT_42::read(bar);
> +        let boot42 = bar.read(regs::NV_PMC_BOOT_42);
>          Spec::try_from(boot42).inspect_err(|_| {
>              dev_err!(dev, "Unsupported chipset: {}\n", boot42);
>          })
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 53f412f0ca32..62c2065e63ef 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -35,20 +35,64 @@
>      num::FromSafeCast,
>  };
>  
> +// All nova-core registers are 32-bit and `pub(crate)`. Wrap the `register!` macro to avoid
> +// repeating this information for every register.
> +macro_rules! nv_reg {
> +    (
> +        $(
> +            $(#[$attr:meta])* $name:ident $([ $size:expr $(, stride = $stride:expr)? ])?
> +                $(@ $offset:literal)?
> +                $(@ $base:ident + $base_offset:literal)?
> +                $(=> $alias:ident $(+ $alias_offset:ident)? $([$alias_idx:expr])? )?
> +            $(, $comment:literal)? { $($fields:tt)* }
> +        )*
> +    )=> {
> +        $(
> +        ::kernel::io::register!(
> +            @reg $(#[$attr])* pub(crate) $name(u32) $([$size $(, stride = $stride)?])?
> +                $(@ $offset)?
> +                $(@ $base + $base_offset)?
> +                $(=> $alias $(+ $alias_offset)? $([$alias_idx])? )?
> +            $(, $comment)? { $($fields)* }
> +        );
> +        )*
> +    };
> +}
> +
>  // PMC
>  
> -register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
> -    3:0     minor_revision as u8, "Minor revision of the chip";
> -    7:4     major_revision as u8, "Major revision of the chip";
> -    8:8     architecture_1 as u8, "MSB of the architecture";
> -    23:20   implementation as u8, "Implementation version of the architecture";
> -    28:24   architecture_0 as u8, "Lower bits of the architecture";
> -});
> +nv_reg! {
> +    /// Basic revision information about the GPU.
> +    NV_PMC_BOOT_0 @ 0x00000000 {
> +        /// Minor revision of the chip.
> +        3:0     minor_revision;
> +        /// Major revision of the chip.
> +        7:4     major_revision;
> +        /// MSB of the architecture.
> +        8:8     architecture_1;
> +        /// Implementation version of the architecture.
> +        23:20   implementation;
> +        /// Lower bits of the architecture.
> +        28:24   architecture_0;
> +    }
> +
> +    /// Extended architecture information.
> +    NV_PMC_BOOT_42 @ 0x00000a00 {
> +        /// Minor revision of the chip.
> +        15:12   minor_revision;
> +        /// Major revision of the chip.
> +        19:16   major_revision;
> +        /// Implementation version of the architecture.
> +        23:20   implementation;
> +        /// Architecture value.
> +        29:24   architecture ?=> Architecture;
> +    }
> +}
>  
>  impl NV_PMC_BOOT_0 {
>      pub(crate) fn is_older_than_fermi(self) -> bool {
>          // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
> -        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 = 0xc;
> +        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u32 = 0xc;
>  
>          // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
>          // GF100, means "older than Fermi".
> @@ -56,13 +100,6 @@ pub(crate) fn is_older_than_fermi(self) -> bool {
>      }
>  }
>  
> -register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {
> -    15:12   minor_revision as u8, "Minor revision of the chip";
> -    19:16   major_revision as u8, "Major revision of the chip";
> -    23:20   implementation as u8, "Implementation version of the architecture";
> -    29:24   architecture as u8 ?=> Architecture, "Architecture value";
> -});
> -
>  impl NV_PMC_BOOT_42 {
>      /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
>      pub(crate) fn chipset(self) -> Result<Chipset> {
> @@ -76,8 +113,8 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>  
>      /// Returns the raw architecture value from the register.
>      fn architecture_raw(self) -> u8 {
> -        ((self.0 >> Self::ARCHITECTURE_RANGE.start()) & ((1 << Self::ARCHITECTURE_RANGE.len()) - 1))
> -            as u8
> +        ((self.inner >> Self::ARCHITECTURE_RANGE.start())

This should be using `self.into_raw()` rather than accessing the `inner` field
directly (which should be considered impl detail of the macro).

Best,
Gary

> +            & ((1 << Self::ARCHITECTURE_RANGE.len()) - 1)) as u8
>      }
>  }
>  
> @@ -86,7 +123,7 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
>          write!(
>              f,
>              "boot42 = 0x{:08x} (architecture 0x{:x}, implementation 0x{:x})",
> -            self.0,
> +            self.inner,
>              self.architecture_raw(),
>              self.implementation()
>          )


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
