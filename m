Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F62CF532C3
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 01:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upBTpkOOYk0/WC/+PFuX4QCvoeklv4zHiOXGVJEhJcI=; b=i3DVK3n2J+8V9P
	O7idiFf20b7FLdtkeswrYf+Ez+qhsoTwVMv3n/pb4NX2INiLLs1ItpYiYG6fg5bIWNbnuHPX2Csez
	xXQlaiCbw2IeCjmgt2E8IMVfrmpw8GaKO1mrKTi8Iw4vX4PJZXH/JMf04P0nd0Ti8FzN83EvL5bH0
	5H9iQc3VHkoNAXbp0/KsZoNypBPB9WCbLkmjuiXodBe9COXObGNhVn1o9vzKqucH/Fv//savRedN/
	+OPBcDGqJRQxiwea4U6/04NzJSZ4GySHzK7J/MoNymTihNv10N/msJxQ7+GoxRecYFJwol+Rebk1y
	hyE0DB5QgREZKidyRW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qnM-00000000KKA-40Ve;
	Tue, 24 Mar 2026 01:43:00 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qnJ-00000000KJU-2vVh
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 01:42:59 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O0jagJ4132522;
	Mon, 23 Mar 2026 18:42:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=8GU5bRGeYRvSLa3O+CmHrLHE1wRLwSUT43JBaOuSmeY=; b=
	HR3MdPDM7zC3IfxWu04+ZeYSbj0iLf4V/Xy8oSflDovV5HtaTSeAgzTZSwyiYzll
	3827LT8ZYjkEvGwWauMY2+0pBPpP/0lIisG4+8afnE6/QpX+9rHu3nl9gdEWdaGA
	X7cj9+TjvPZDlF3WStSJPf0evIT1Yww7BVhSOTVo7Rdm45LlqvVsgTIZCIqd2JwE
	Wq19g9QBoWcuQbpJi3wtormJr5zq9QrS/3Sknd+/0tCg3C1M9GCDoUV3UChxbmNl
	8n4qjMRcaDs4GKb4JZpXIsud9nnSkBmcmFi/0LDizghtD1z30ABtqQ2H4ed7fTu3
	hV01/l59hAzHjxP/ACEa2g==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4d34tccxj0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 18:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1774316527; bh=8GU5bRGeYRvSLa3O+CmHrLHE1wRLwSUT43JBaOuSmeY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QcVAXX9mqDgW27/ja4cnSuyQJwV28Fj2JEqGl1eu73U6FviG5Y39FuaJHxr3JibHg
	 P6VtTvDhqyZx7R2c2aRPM1PT+d8RQwJVZbjEeXoSiZW3zaxyVLQsL0gAuF9zV2FuyI
	 Pd+uXpaToNbXClPGqZ5AqcBCeHa0RiRZfeNRNgPNpS5rOkn9b4fkSrqF8DlOSyxwvA
	 bWaAwk3STzF/Ec/InnYyhypGgTHii9eWoLCbJhfdUE27zyUfrMcG0iMIMY6AokEZRR
	 ix0jd9dtVAEtxhy/BLtiQ9Qk/d2uyzjbuuEwKigjlR3F/dmc0LaP0fHLqr19B6jdj1
	 ITQ3xU4Tu8qEQ==
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3ED594058F;
	Tue, 24 Mar 2026 01:42:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay5.synopsys.com [10.202.1.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 7C073A026F;
	Tue, 24 Mar 2026 01:42:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=NAb4BWLx;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00106.outbound.protection.outlook.com [40.93.13.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7D8FF220112;
	Tue, 24 Mar 2026 01:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3xujrZ5XjhZRArJw71EzgbXU67gGlJ8fnEs1LiFTT+pXnSeK7CelHhRj2Yv2L4psXwa0fk5KzPkoSov3uLCWMGYMhoG2ygm8h9zRWJ90YruRXYgCqHxErBXGopdGpIsQa2MPisI9K2hhK0qJLR7DyCFYVPEgRDwIeNFrRm3aDF+duUanp4cG6I9sbEb0Xy7U65rMaNJLZoSV/gOA+GL8FWdEFNx7JALvtFdPSXNhyMNeQ/gjjnlP9+11N5TZ8S0Qh1pVbon2lTpaERgAnqafsswtiDIEA0cXDUtpKTaWr3tEX+FAeT+gyxLsauUl6JKy73+nY/pNBvXfFheSgtunw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GU5bRGeYRvSLa3O+CmHrLHE1wRLwSUT43JBaOuSmeY=;
 b=KZi46vdAd0UsogY8F1JxGDWlkaWAeMLdD0YYU9kVRRih9a4EPdLQzaiNBE7C3fAKJcldHuH2JyJuIfrMB6ReROkvUIQWs0gET7oimmqZBQAld7b+TTfaiHuGLTBOCtMqq5akYrnxXBSrP3mUiqj15bW9v9eh3DT0jdSuq/xM2FkIomGQPUQv7252tzVed/XaZrlYNqEMRlYoUu2QkR6NcP+ov2hbuVhYJnBPCNbp4iWwGPD4lsuVneGyCBZUNXap6jfCL9p4rWJpKu+VEgAP7RGso1PXmVezvmWnRkA86qsf4EJY4nbomR2x+iS57ymr0ZbR6vRv6zOqUIexzidoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GU5bRGeYRvSLa3O+CmHrLHE1wRLwSUT43JBaOuSmeY=;
 b=NAb4BWLx3opOTb0A2GYJCStP0f7wgzIODpvc2ONtfT3dVkyuj6u/pTWLZYxG8TK0lNu9fw4TBGbqQXKBxOj1aaeH4zjn0AqHd0VBLn1iOkQG1ctBYkzACfokBcGBVKtUn66PWqIYZtRrrQWlgQxBfgVmcRy7t2o5EdYidpTqOrw=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 01:41:59 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 01:41:59 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Yixun Lan <dlan@kernel.org>,
        Ze Huang <huang.ze@linux.dev>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
Thread-Topic: [PATCH v2 1/1] usb: dwc3: Add optional VBUS regulator support to
 SpacemiT K1
Thread-Index: AQHcuFCg4j08scIVQUWhcqnUxwbaH7W87hwA
Date: Tue, 24 Mar 2026 01:41:58 +0000
Message-ID: <20260324014144.yq7s46fmo5gx72ym@synopsys.com>
References: <20260320100120.1343629-1-amadeus@jmu.edu.cn>
 <20260320100120.1343629-2-amadeus@jmu.edu.cn>
In-Reply-To: <20260320100120.1343629-2-amadeus@jmu.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|DM4PR12MB8570:EE_
x-ms-office365-filtering-correlation-id: 47326c5d-fa03-4343-b345-08de89468a0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: eJCHUU2rwlYJImcXOI9537LFm6wJ6moogkruVWWtL3SHgaSZDe/kcgdipjMFhy7PLGMDfcvCRWAQQOgRCUjZj/XyI7ADaMqjptj/kVj9zSGA9f6Zaxjw4ak3Ue+lslUoeq/MCCRxg0idApey0oMgOUd6LeTDfeNoeH2HkLTqBv+O6685nK66Bi1RSOspA5maMqJR7bqjstsVw0t1wvDbuueFKOTcvTmS5boCfFCgolJTmfNaZxwcE/PB6xXQSSKanjglm4jxnbuKl8jss9RK3id6S3knFXbmit/m9v0PnnyOyqvgNsX424sTx+YYgTcSZdX0L7bjeto+jM4THKwaRGXS+meQnrXO+oRUn3fKywJDD+olBnSb2pPE0qI94LgNhY4p0urtjLWtkfQ8O1BUy/+5oNs1gXIj4kJjyZXyVMXG6/Ea2mqRMz5VsEBymX1VKUd6QIVNLoAHHxA4iidSSXNkOS49n1bgkgvV7l2OAV62NcH/vp/beYeihQrZ7nO8Bc9tnFMCI1DoJQ21BtQC3Xsra7L0iBYfpxoCjD7b9p4qfXr3xeqzeNfZNO8oDcbeKkAxbdTseZpWyS3eMRwXwuS0NndLDj5Vm8tnVWOczsjJD2SqXMqn0xIe5QjQUB63NQSdajh9xGRRYDH6LwwgYHqrsv+werD/VkMZM7tV/XbJJCql/hwT2KL/JH2uDk7RCefOPklfUR0lZyrFARnmghZ7ee1wkcv79LlWcZR8JLadiGvnJbtT75B4xopgkJ5aas2+hxGAPUuJc+KtuaNc+LqXmtDyKrNCtzcLpvNwWFI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0NiNVZNUzJETmNSZFJ1dmJyMVJ4RUtVZkxBdWJIRGdIcEhVNFR4STlTbXFm?=
 =?utf-8?B?T1RUcGdsci8yZ0NLTlNnclNsdnMwNWIxYWl4UURnSldpYWZhT0VYY0pHZGQy?=
 =?utf-8?B?c2k5d2RHZEtUY1FCUWg3MU1BZUpoZFAzS21yY0tqMzU0NUtzakJVMUQzN3Mw?=
 =?utf-8?B?TjFPcHkvTjRvcnR6a1pWbmoxVjZYSXdqUWNJZHBoYi9nZFF3amVyaFJnT2cy?=
 =?utf-8?B?cXZEQmhDb2RLWVBaNVlIL1VCWTR2SUp0UFh4Ylhma1kybkRCTHdxUnVSV1I5?=
 =?utf-8?B?cXAvLzR2L2dSTk1lUjEwT3RkdFM2czJMR1p3UHB1QnRzSitMVUIxYkdVOW9v?=
 =?utf-8?B?ZUd5em1qUEZOK0RtUjgvdFVweU1lNXhmZmdhVCt3cHFMdG9GbkdUUmM3a2hm?=
 =?utf-8?B?NEJRd3lOVXJhYjBIOXJEUGVPaTVBZldpRGZvVUd5c09tZjRUTWZ1ZEdTdmtH?=
 =?utf-8?B?bllFQ0pvblJ1Y3F3WnRZdlFHalQ5UllTbmk4OTJoY2ljbTZ6WDUyQXJxUVZ0?=
 =?utf-8?B?NFJMdGVRYlpMVkh3bTlRR200ZnRRTVVmRjhVOGpNdXVXUkV2RFNDbGoxQmIv?=
 =?utf-8?B?NlI4bEhSbDFtNXB4bnRNdDhQZjZNNHhGQVIxNWpkN3gvWmgxSG5kR1E5K3px?=
 =?utf-8?B?VDZuZXB1V0hwWWs2UlRuNm14NXlpVFp1SmtLSDlKTmVMRHJqRkFLUUNWaWJH?=
 =?utf-8?B?QktRdm10M244UTAwM2xyb1dXVkxRMlRuMnlsM2pjODEwaTJFaCs5ZnNGN3hY?=
 =?utf-8?B?QTFoQWcyeVBuRjdUUUI4dE5oNm5nMElMaXBpS1EzaURyTG5kYU1Sbzl5OGts?=
 =?utf-8?B?Vlh0dzV2SXV2M1JQcGV4VHp0SDJ4SytrZDZ2OXkyRTlJVXE2MnUrcW5xbzlU?=
 =?utf-8?B?TFpaLy8vd1BmN2xhZTJ3d3owSzh4TlZRbU51TWM4Vk14b0hrdU9jY28vZ3ph?=
 =?utf-8?B?R0dRY3dCZk5pd1NlRmw2TW9EQzEyVHpoeTY2RC85OUlZOC8xUHFGa0d4UGNw?=
 =?utf-8?B?NjNMY0NCK2swN0hqOG5UN3U4dW9waVkvaWFvdEdIcjRnUitiK20wdmNoOVNz?=
 =?utf-8?B?aGJoVTQ0NzZxSkRveW81dGphSFl5YUpRSmhmblRkUit6c1laU1pPdG9NSlFF?=
 =?utf-8?B?SVk0cnR4TkdiV0taWXJiR0gyMStZSmlRUVUyL1d5bXF4ajJXcWhqNmNnN1k2?=
 =?utf-8?B?blJXdnlZTk5iVitaZ3M4SkhETGxQOTFEOE0xKzBHLys2K0Vta09xUXlrTC9y?=
 =?utf-8?B?WUxNOEZyYlBmTStDbFhydGZGSmlrOTJqQ1N6UTYwb2Y5QWhlU2xGYU44N2RF?=
 =?utf-8?B?eTVHaGh2dlFkUDBTV3BCYnNqYVFLbndGUm9vcVNrY0MzQmwwM2NEUzY3MWg4?=
 =?utf-8?B?OVZ6NHFtVjJDQmpwOGxWQy9CMjduaDU0MC9RY0RjQnZSTjhOam40ek1yTW0w?=
 =?utf-8?B?ZzdWM29zMkovUXVDcWF0c24wV0FRdjEyb1NpWjN1c20rOHJMWjZMWm9jbkRT?=
 =?utf-8?B?eTZLaWhMbnlxZm5PaFgzdk4vNThRZ3daYS9rNWpuYWtYNWpuVi9DZDJXdUVw?=
 =?utf-8?B?QXRyd3Y4d3lvY0x1V29RRjlRUzRvdG5WYXJrRXV5Rk0vMUQ2akpydnRHSWxJ?=
 =?utf-8?B?NU4vdHZCK2dSbnY2dmpRbzFGeitrSUovRS92VW9mZnVXNkMzZ1d0OG9wUDlV?=
 =?utf-8?B?Qkx4aUROTjZPSmE1dUtEWHc0WW5UaDEvWlV3bGRKNlNjTk51UUJGdGNmRVZk?=
 =?utf-8?B?QTlnOW5sUDhjWExqUk8yRW1VNGpURDVCSjM1Ny9KbmFiZFFQbUcybTJsMDlk?=
 =?utf-8?B?UXg0bDlzMUZpOTJoQ09mUFJ2V054UTNoVXdtM3dyY3lzcVgzdy9vZHpKZUY3?=
 =?utf-8?B?NFNpajFPVnhJbGJ0NGE0c1RpUzdDdEhFTzdMenRVRGRhTmNPVFBVa0VrTjdu?=
 =?utf-8?B?RVNFbloybGR2dEttTDNEVzhMODRKWHdpTXBMREtYT1gwS21GU0ZWNFBmUmZ2?=
 =?utf-8?B?bEVvbnduMG9PbUpJaHFjRjIvd2dvbUVsQUVyZmZtMzNyN2pYWjhCUklHNDM3?=
 =?utf-8?B?U3pxaWg4WTZ5SzA0QjJLVTdOZU5ZcStRTEowa3lHZXhMVTM5T2YrRTNuNXhI?=
 =?utf-8?B?cFAvekdwWDRPV2t3dFpCdDk4UUI4M2RMTVFBSUszOHgrMkZ5aVlubDdvY0Nv?=
 =?utf-8?B?NmNmak5OZFUxenpFKzRxb0xLR0NSdm96MzRkQzZTTElDLy9LSmxEV2dvc3Vi?=
 =?utf-8?B?MDJTRUZyVHRpZERqTDRjUm1ESnlybW9va3cyRUlzYkw5Q2JZQVU0QnlZc1li?=
 =?utf-8?B?aThoTjBEWWkrY0s0MHJJd1N5alFBVFkvcXJpaE0yVFRwclMxUmZpZz09?=
Content-ID: <D9A763ECF1B44D4589DE497D17669EEC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dUaFCwNb8Drz5KEHVeigpTDGTCiKDMrnAqsXr36G+mXM3Yzc+dy5Us9UM2yPDGh2H1z8iOL3kqNK8rs37mSDVOrhgrGgd4tKbSFHb3NqIcul0ezqbjkJw11BhOw0232k1IdMo5YK8F+laYRba0oFSHi/HxertM5U7FkHVMUwKKQLLVtscd+48UQ2rMYHX5QtSAecjqjtBNRmy4gbC6QK2mSuRBZGZvn6m31X+OdTMJFCkkWsUNDCGIybR4u0vZGneeZ2w+vGL9BQbX0ogY6agzGc4KTxIwFObvCzmzfXAK/xAj5KIf/x8zF45WsgqJ6bHFcBAc7nvKIXYVuWR/7p1Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Zb4KJfHQ8gdqns697+RNwxx9e/22gkinkujmS3OWf8DT3J95KFXmiRUiJAnaJn6J4P40Ru8z3QzoRUNAofBuxsXeV6T2C0pHpknXRVeplLb+XMn7cjQ4Q8CEpdvs0nxdgnW8gJJ5SgRIlwudNahoFk/9LlEfd4gkdtFc5cG4KDug4J8odhrcyIhzUHbZzIYq9vZDJk3CFjOPhbp6w9mU/uO4FvnTMxxc7S/U1ogHdDjwvkrzSm6aDCXMA+QuGF8qEGh/se2nRCug7ehDCXhMLOpDj8Cq8WyWJAxdcg0QN4RljaOlkoxtD7F4TgLGOtfPK2yhppQuX4fZ67r/HvsPgX+GFJhqKn4ujIsRF3Q3AxY6JtNyN4ZJ4p2MIWMJPRvYlac8hnGMd5Abzkc0MfgHB/uvILwfbeRe1T29jlPtYsxJHVLztwAk/bvUAIb/OSzQQTzS1zKD66Uq/+BTCc6Fw1TN1wurj7wnB1enfAMg/hZCGP8bmGG1oQpaG8lrlqta3921PZrkvLCR322GdrleX0lHkk0yTVFFwuXZRjaM5dycnK6E7rcnvs8m4EQgO/NNFo1UEQUPnc6yCBFZeX4t3xBOWOTreeoVUz0LFioZ02KXF7TQAqmEOrBdpIBEUsqAXCPMpmrVN8YTGsSj29KYLQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47326c5d-fa03-4343-b345-08de89468a0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 01:41:58.9440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eM/ySbvn6sKydyUq1eIrWIV3WMvlq0WGvDSPEcY2wM0Z9/3kQB5hYzvbwsvarufMBfnV4jkGowICAMu1V5ZgGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570
X-Authority-Analysis: v=2.4 cv=b6e/I9Gx c=1 sm=1 tr=0 ts=69c1ebf0 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=Wo6YDfOMAEstGd-0DxeT:22
 a=RC_nnOGSDeUlnqkDifEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JDLTssB5c7dwAMhMTdGja1s8WpEaarSY
X-Proofpoint-ORIG-GUID: JDLTssB5c7dwAMhMTdGja1s8WpEaarSY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAxMiBTYWx0ZWRfX0PbRsnpPxHcV
 GFC1d0YieXIzTcxk9B3FqhpZYH+NhfrOnVqSbC05YGPv0+I+onjwQH7R2WhUvhlcdgrvbqPEMOg
 Sv38VWDONMWBIVxrtMgAOQKS/w6pdMOiImzsUxnwyy935e0fCBuryf3XvCg9Oghi/buz/de3o5K
 MsQFwpQOOoxX0EpiLK+vur+68NbileObVNf7wObJMPnOv0F4k0ymMi2irrJasKHNRErkRB492Tr
 XtwqbZfpsJw6XZI2HMcuKLMp6JKNFHTffe2jsrHpkqsdrhDBWCpZ/xNUFFzNrAEDfFDiZ3R6E2M
 Y2X2br0F1TZQxd5teBB8C2SBocV5LF5l/DSXXs93kvJ4gh01Sk86EzoMO69t6VxDBWI2Qm/7jgt
 aJaIhEt9m3k+fiQVdbI5nRWVK1qFwfrRTfcHNDo7+luc2D8ue6BXX28nNMsqXkh88Lv0JJocRKW
 JjdS2qajF23SmWiQP0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 impostorscore=0 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603240012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_184257_766972_887D97CB 
X-CRM114-Status: GOOD (  13.00  )
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

On Fri, Mar 20, 2026, Chukun Pan wrote:
> Some SpacemiT K1 boards (like OrangePi R2S) provide USB VBUS
> through a controllable regulator. Add support for the optional
> vbus-supply property so the regulator can be properly managed
> in host mode instead of left always-on. Note that this doesn't
> apply to USB Hub downstream ports with different VBUS supplies.
> 
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  drivers/usb/dwc3/dwc3-generic-plat.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index e846844e0023..bd281fde5ce0 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -12,6 +12,8 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/usb/otg.h>
>  #include "glue.h"
>  
>  #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
> @@ -69,6 +71,20 @@ static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
>  	return 0;
>  }
>  
> +static int dwc3_spacemit_k1_init(struct dwc3_generic *dwc3g)
> +{
> +	struct device *dev = dwc3g->dev;
> +
> +	if (usb_get_dr_mode(dev) == USB_DR_MODE_HOST) {
> +		int ret = devm_regulator_get_enable_optional(dev, "vbus");
> +
> +		if (ret && ret != -ENODEV)
> +			return dev_err_probe(dev, ret, "failed to enable VBUS\n");
> +	}
> +
> +	return 0;
> +}
> +
>  static int dwc3_generic_probe(struct platform_device *pdev)
>  {
>  	const struct dwc3_generic_config *plat_config;
> @@ -210,10 +226,14 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
>  	.properties = DWC3_DEFAULT_PROPERTIES,
>  };
>  
> +static const struct dwc3_generic_config spacemit_k1_dwc3 = {
> +	.init = dwc3_spacemit_k1_init,

Set .properties = DWC3_DEFAULT_PROPERTIES,

> +};
> +
>  static const struct of_device_id dwc3_generic_of_match[] = {
> -	{ .compatible = "spacemit,k1-dwc3", },
>  	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>  	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
> +	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},

Any reason for moving this to the bottom? To avoid cherry-pick/rebase
conflict in the future, can we place this where it was before?

The rest looks good.

Thanks,
Thinh

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
> -- 
> 2.34.1
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
