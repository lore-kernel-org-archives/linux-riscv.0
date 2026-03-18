Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB75CFF6E9F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 00:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kakFymjNqOWOhm5AX01j6hha0dSaCpevrOYjWzyEEA=; b=4yq5R2a5bRiIev
	jUw2VdUnKyhnqWPBTJQOlkj82KY1IkKKxosUAXHMKZwcG1XYZujDph54a3aSfAHk00C5w8OrdIxF3
	8WKBqAemqQ9TYMcdf4rTO9OPqIjjV3g16IJQq7vq8oybVDSfHHoVx4A7sEXDqxxGTuy3VGGZBY61B
	T6rAgjiw5eEJuk+N8zOcSimUH/eO3QrYR6HjS5rbDTCu5dL+J7ZpJOpJF5gCrbm6oGc3gPOYRGBTY
	HdWOhivztC7QYh8pbwkMOptYZhQ9EaLFxSOrYzd1Q7tAB853xK9RXNyLzz1yTPjBMSVYlLvIVE5DW
	9tmUO4WH97bIs06RXzyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2eoF-00000007VjO-1bmq;
	Wed, 18 Mar 2026 00:30:51 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2eoC-00000007Vio-3QvZ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 00:30:50 +0000
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HLVSnk2203031;
	Tue, 17 Mar 2026 17:30:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ARB/qNTrSOxrgBOmNj1QosMdcf8uPxne7bjDZEXkYwg=; b=
	YO8RB9eWpxKcvn0X48Gv2ROCgr2mmGpNJuazZhIhGxCiW1tlf0BLCkQT98ofVdCY
	1sh2wTIYIy2lQGgrlhPSEODvNIeak3QYWvc2DF4axPpaLAky72SnXiqCP2ImurcS
	Y/mejrNktRFomWzpdyiVPaoB+7pxcq1DuC1pI9q8VewnXksON+rRE6e+GL0zOCgU
	dybeopyMIwHn1wSSb0LFhsEUiRar4HDsbzlENlOWqG/kfaIRDetbrND2h6WTCTGm
	IQUlxvHFtclC6B1uakEdZIQyshdr5aJCbwXs3ChViTqDDjDgRWGAFD7Qpc37vRi6
	41EmgJK4U16RKTzOjv8XfQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4cyaecucdr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 17:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1773793808; bh=ARB/qNTrSOxrgBOmNj1QosMdcf8uPxne7bjDZEXkYwg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cydOoRmRg5vgsf2y3LlHYlxjUqtnD1pL/7XTBhjzjptwIt9q4VpqyY6KlBqFg53r/
	 hJP0vG6a06Rx4Dw+bgPhZdbt1oMJ6Ur37HAoiU0IBnmAYRQVV2BzxqR1xZCpLx3LsR
	 +Qc+U0F/Mbca7y9T72XrnzUO/QXY3kQ0ul98alSaeQrFf24JhfvEAgpVuJ1shGNdQP
	 A2tcOsQK1mXc7Zkqycn++GCSv5zVf/Ce2V5RQ/gd9XMkF00jkX1RYehhKGBuQRjZP1
	 jfbv1qvfbQ6X7vbZSaYKvGl7BB/2oBRehz/yFmclfyw/VIJwa2YWAnXvjc2M4uSZqn
	 eYIINSKFGy2Cg==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id AA46C401EE;
	Wed, 18 Mar 2026 00:30:05 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6D50AA0219;
	Wed, 18 Mar 2026 00:30:05 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=C+Avo0eM;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00102.outbound.protection.outlook.com [40.93.13.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id A0A33404AC;
	Wed, 18 Mar 2026 00:30:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFdqUzmdeo7VsHJ20neJuQhECp4jLpwIQXztM9v2QGPYkqMHAAdC8+hMyEX6EyuICqAA8smYGZtRwdRz9/ftYPX26RDSFJmsIsBiy1hDNzbsBJ4dlQ6hIQhSnzqnTbywyC5lRyTYiMpaaDZEl8bPF3X5tL9eTKueJMJC4+N8eomQMKsMoyorDEAc1lIfsUnHfW9MAWxUU0b+HVObZ1s049s5PA/rXnbvIhfQZNfUXUfquPdL52X1c04EF2WbfMXl6jqFzv6VJxcK0sjg+fcUxKxS2s+Rnk69xtN9ja9nwV/7qc98UtWTceDi/npa34bYB+XLVQn+EoKynPQVPlIEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARB/qNTrSOxrgBOmNj1QosMdcf8uPxne7bjDZEXkYwg=;
 b=nodMxcsTR8TbqRasscfyyvCrNzMoRJ9bGTNefmhI1t7FQKiFe58eJXuTE+7Pzh612oXXP3I+fqAsRaqQWoKGGKey8ObKxTdIsQcZNfffx6WoEQSeQhK9acTHkEn6mB6aw45pOeLcX1miIHr3XRTIWnLwBOt0DYGrX4nMimidQlLgmLpTN1vZpPVpLAzCb7Atb5B3E2fU+GZni1fRY74BU99fPLbibHDOUcJVYdh/GOmR3ioXggacL2zj0Hqc4DgxWvg3Zo42k8huk3R29aYWpx24HhQzKdGfGkqDmELvkCEOAD6zqltKUc6x7pI3qEx6nfAEchNvJuncnN4TKi/2mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARB/qNTrSOxrgBOmNj1QosMdcf8uPxne7bjDZEXkYwg=;
 b=C+Avo0eMZHh9FC46px7XIL5mG7v0nuG7FXgiq75SqXs1fsC1n0t5xGmN+57RXlBmgUGVMUCNVSQPKr6YnhVwZSBrBlAEGbUqXq7yZz+8af6qJcPe5u4J+mhbZRocrYtQEs7bifo8DgyVNdjPqskCMVBXA3+Dl+jEIopsCdM4X/U=
Received: from LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16)
 by SJ2PR12MB8925.namprd12.prod.outlook.com (2603:10b6:a03:542::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 18 Mar
 2026 00:29:56 +0000
Received: from LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899]) by LV2PR12MB5990.namprd12.prod.outlook.com
 ([fe80::7b72:b921:b9bd:4899%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 00:29:56 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ze Huang <huang.ze@linux.dev>, Yixun Lan <dlan@kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
Thread-Topic: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
Thread-Index: AQHctRr0ppGnJPsRE0yK8zk2BTHieLWzcneA
Date: Wed, 18 Mar 2026 00:29:56 +0000
Message-ID: <20260318002953.6gknb2jfveqyisop@synopsys.com>
References: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260316080000.3130372-1-amadeus@jmu.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5990:EE_|SJ2PR12MB8925:EE_
x-ms-office365-filtering-correlation-id: 90dd270d-c1d7-47a7-b011-08de84857b4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 0E5YFwn2bGVfLjZoY29cD7eABkkJ3gjWhEeHbbQborJOHCzk9S0Ce819e2N7hiFKDi9uqAZmMoi9Gln6W8g+rBNMrhuwMskQx8SPuNIurTe245uKoiSXDtG0is9avn1c/yGObBVKDKMrg0Z66JdTzH7SVzb/w5mJDzzsZLu8NzBFQcgI1/jlBBsW0YC2vYBAIFGvHD9Iq+HdJlcwwiOiTWKiw7nBBynj9uyCnAKcA/R8fmR+7oLkYqEOJr7slWzoW6CRToCtEtU8eaEQZRbCKOPhqkuErHr61kWzgJ3EX2pJ7sSZ6xok1XUqqXycAQJd9iInCYtjSNsJTUIq5dHlD7YI81Eu2TPgoNa3w5RMDx1fBw9NQoUxjzCmQ+T/XLGWqJ7J/nyK4x2LhmSWdripRGrt37SNQlts0sqR911HcfX+VD2X1+Eci5XyBsLVLXjIoya15pzPLcPf/Moe3hDF0OTYRd7CM0a3MsVhXrJtl7XpICuFOKMHUtbxBygIquDWCoWPMBlsriX1nDgvJT2qiL9ld3MF6RgoxfQWOgBafo5vvfPge7NFwjWA81+YhPD8I/ay7+al8hX22Xy74ixsze+zY0tbeHqIO78z6H8TH9o0S7pveUp8ILG2GW9T607Bg9MQrzpWOiGf2kOSOwZXSKAP720ydn6/9jtCTOr7W7qr5S1lk4JU9o6ZRhaQfAC7ACNvnPEP/KbN0EP8eDiOwMfc9yn7XBT6vgOXsWuLQ9Kc216E9JmQxekfgh+fYWyO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0NGY0xVMjdVeTVaV2RZdDdZMkN2OTZ3ck1zalJ2ZHhjNlhzYkRRZkJBUFhy?=
 =?utf-8?B?aUxhNDRxYlpKRVRkUUk2a2RGRmIrelR5L2hrTitlbWxpMk01YVhhNDd5VUVF?=
 =?utf-8?B?d1lGeFYyYlUvWng3SUlVZkJsaktEbGdFWGEvbFByekNza0tVeGpnajNPR3V3?=
 =?utf-8?B?WkE5WjNwN2YwZDFlK2tOaTd4RHRqK2lJTCtLSHFZNzBTaG5BMUQvVE4zRXFM?=
 =?utf-8?B?UzFFS3VEeVNheWU5OThLM3FaMTN1dzY1RVVtSmJ5d3FiWVc2U3daVHNvUDlk?=
 =?utf-8?B?Q2puMlAwRS9GWFNvbURoWWxuZWpVU0NvVUpGQVdDTzlPeG1CMEpabThGMksx?=
 =?utf-8?B?ZjM1M0E4R0w5Z2tUYzBsaVhNUlc5U0NGMWZhYWk3MFIrR3g2ZTk0V2Raemdy?=
 =?utf-8?B?UWUzOVJkR0xKbjQ5cHp1M3AyaXQ0cDJpOEJuUFIzUlpldnIvYno1M2hlazdR?=
 =?utf-8?B?WnkvdCs4ZEd2WXk5VFlQQ0NYVG5JWnhvMmhCbG9jeUpnbHdIaGpCUkV2MDFO?=
 =?utf-8?B?UzNHK0g0M3dJYXNiY2NBZk85NElSU20yTkxWamVrVGtyTXpaSkxOUXRrNFNl?=
 =?utf-8?B?ZUZCV2dYTGJJL3ZPREZwQXpVUG1iUUxidFNtOFBEQkFsdGZFZksxbWNEeW9u?=
 =?utf-8?B?dHJvTm1xV3JBbzAzaTQ4b1E2OVIxL1pUQlEwTS9JdW5RaG1ubTRJNDY3ZkhF?=
 =?utf-8?B?NGhjMXFhWUpIRTZEbjdVS21xa04vWnU1QmRMQTJrR2QvZzR4aXpJa3BxRTJ2?=
 =?utf-8?B?bGNJbXpJSVNRTUgzZEZQbzE0ZTg5UUc2ODAwR0xNZlEzbnNQTUZCb2lmL1Vv?=
 =?utf-8?B?SHMyaEZJWUNwemc2VitUaUZEekw5bmJEV2lTeGIrNi83bE9MQWdpZXI5SkYr?=
 =?utf-8?B?QklPRjdlYXBJWE1rZkZhSHBoMTBGdkhxTkZKWWh4QmNIY3hVZGFvNlAwSHBi?=
 =?utf-8?B?QWE0azJmRzFCOXBqSGdPdW94U2gwVHZYZGRVQWNoRXAwNWx0Z2hNcVlaV25v?=
 =?utf-8?B?REU5WUF4L1pUdFdFSmhzS1Zwd0Z3WHZqN0xaSjZBOC83ckRtTWg2TUNZMHZn?=
 =?utf-8?B?VlVoU3l6cWFNYzJLclpnVGw5YlRJOENybEJtbnZQaHdKemQ4NzByeVV4bkhT?=
 =?utf-8?B?QVN6WTgvVkxMbWxaSWtWSEpBSG4xSmtDWXBsOTBjNWJJaXV6Qzg3VkpQZDFM?=
 =?utf-8?B?aEZsUTNCQm9WakVvWFdJQXZjVmVtOFVlb0QvTG1yWHpXaXRiSWh5UFU2bDZ5?=
 =?utf-8?B?WnZTQWJNaWhmZStDVk9HdFpDaE05Z1pEdjdrUlJYRjBmMEU2Y3JGV3RacWd3?=
 =?utf-8?B?eWc1bll4ZTVNY05CNGV0dnJZZDNQbE0xUFJFaUJRNUdFSkZVcGMrcUFMdmZq?=
 =?utf-8?B?MjJiZjJRUWhGQTc2SjZ4L0U4ZXlXMlphVi9obFM4QURhVitNdCs2dEJHblly?=
 =?utf-8?B?YVFSWjExR1A3OGRjYTRmSnJLUTNQT2g2N1RuRjdLYkNXWjFyRXVLWmVub21X?=
 =?utf-8?B?andLZVJMUks0NTVhVElQRVliTXpVeEh4OVBxdVQwWHR4YWpka0drb1N2S0Vs?=
 =?utf-8?B?cTVQZk9RVWxZZ1QrU2FDcG9qQ0MwMXNsTlFpbHRuaHZNVDdHb20vOCtvOUIx?=
 =?utf-8?B?dWF1T1hHVDFzMnlJbTlad2Flc3Zsb2VZMVJJdWY4eS9SRm1lN2NOTE9Vclcv?=
 =?utf-8?B?bXVQRmZocXkyS1JMWFlVV1R4SmtTRHFnb2JYV0pueGh5bXA5a0J1TnlKMjJw?=
 =?utf-8?B?NjM3cUdkakhlS0xOMzJNMmNMS2h6VnRMTzNyWDFlRzdzd3ppaFBLTm1wZ2x3?=
 =?utf-8?B?VjNGODlOYkYvWFJUQWdWVzM5c0FUczRONkE1bFNhemNETG9PaUFpSXVYdzli?=
 =?utf-8?B?THMrVTVzbWxzbHJQTmVrOTFYdjN3ckE0ZnRuNnYzT0R5SUYrTGFPUjR1bWV6?=
 =?utf-8?B?cTZNakJFNW9PR3JqS1BJSkMvc29EbUhURXRqZndvTnBCUkpsN2RXd0t2b29y?=
 =?utf-8?B?eklLc3o1K1JGdjRNS3NsWjA0UDhEQXVzZ1ZJYzE2NUtkdkc3NmFCbk9UVm9U?=
 =?utf-8?B?SXhwNVN1UmZxL295UHIxK2xGbE1TVXhOYnM1SVowdnJQNVFNWkcwU0x6QXFZ?=
 =?utf-8?B?eFJkT3RpcUNFcG5yamlLM0c4WVRXMHNwWG1oUEk3TENvWVBiOE9hSExYb0NZ?=
 =?utf-8?B?ODlvQzlrTXJSZ2F1WVdjdXpNL2U4SGcyUFEwSEhtZ2tUcDBKanBwM0tCbjBw?=
 =?utf-8?B?Sys5MjI2NCs5Zkoxc1BGYWpoais2THQwaWlUVlVYeDBEcGZVbjVldG02VUFH?=
 =?utf-8?B?c0E5MENha1AxN0R1K2k3RG9EVnVpRDhyOUhuVUVzSlk2aDRrZ256Zz09?=
Content-ID: <EC9A44D31415E7448BE73C7DFFC3D31A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: twC+Gusi4O5QYLy1btCepNsvSgzTtlCCPAbDeRx7ZF7KM95sq3EBgSJIJSfanGf2cpYarZ+CDs1pnurgItCJ/9q8Emo43PdQPdbzQEQwn1ZBw2G+7A6CWAU3uBgX2y6YQSY7pnkJ3Rq33ePW7U7J4+RXnGEtOH8me6YHmfrL57hh4abr8+hDC+maKacu3zqCbAfnFUY2orG3LodjbmBlZWFQWO/MDAxaeUKi0S+b6q0mgFrbf64fhPWepTuGASDQzAtUzxecmDN04ciI8bcBsaBCJxgVNGdH+YFrc60yivfsrMCJsgiJ0B1zBxy2+AtKyTlKeS83KAy1pResmwEHcg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: LRBxSfSyw5JKIgZ1Mz37GI0ORnDT9D1T4EBk/5EGQ2tI/ukdDI63ncodnTCdg39rV+IwxCKE54TMpXNqfsQoYtPrjFKDl345ZOE+h6jQ12nCMAvBzwsZFxmW62JvrTtRFpEhCy3JxhcWXhmbFVSLreeBNJLV1Fq/p3CwHHtdd//gRPfwZPiisVCPPetsy/8cPDSht81Qr3ioml7O1K1rSEz9mcr6qhBgis/qb1NAzxMRWLIBgZvNY33PDoGBHP+3TwxmgwU7c5/XczMWRtTD48Z6VPcr9I5G/pWoq13Tcmj2qnO1y+YZAmJrN857uLoIE6CFYbUYFOZrs5zt3EktrmUsSyDQHzsvhzb4m3NEufnwd2Z4kUfAEtVBbAk3xk27lBOU/XujD9QT8oU9Uqzy1YWiJMc/DN28bPQ44N6sOSc/NlgTo28+L5pnjHBmOOl8xZY5xTrD6oMyJ8ewp2cFyQNdOVNatLdQmwTfpdvRxYol4G8Fa0czwZHL1JaYr5Xj4M+JqgcjAbFvtrMa8G3U6igj4zJrvwuI2CJMzJxn5zYqhqXP6N2A9CR5SXzL4mhGyabw6d8Vmfv5Y6l0ILWMx6raw7r5JlSWrVltMvBzD9oSmDcLPiWf3Jw77AQX3uXbZFiwzEKKNbEErxtbJjyUlQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90dd270d-c1d7-47a7-b011-08de84857b4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 00:29:56.7186
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4dwuoKcH4hBVszFu6t+IemtZtg9rqEfBKjCv8ic3Nv6T7V5GHWlaskLas+sT2nv33IOrU0i3osTR4zVGI8+OZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAwMiBTYWx0ZWRfX+ZxfGRKIoMYb
 yAi0zSzdkJnBP+WnW+bKvzNVQJPIvdmBoNVcyzeftMlyvS7tJu+boBPhP0J+V9CqyYNJvl3OeQ5
 wYk9X85i9+hYl0xDNE8mOgiCcpI81MCAOB9iMXDoFdqhwzIc+HFsPFB6yzg0psij495Ux5lGlof
 5aNq/rUTw/ZcviVsanNGnRBuUHaLAXd7/pd/fq5VVW7porHoYVFy3eoiTpC20jS5R4QV3hUdTnQ
 aFOdvRQwbKGDE4J3iPomRCZX3vDZMyPdvXyJid0UnM4PlX4KX0CsHy5SHSj1mrwADM4z2VlmtbW
 vZBT76xdQXAtdsuwts71g78UZEziQys4VI5srOrdlnOvlb6v+uGzCdYaxhM67zSAyCfFf+uTqVL
 1yDCfNuGzn3LtFrSJNotsX6hB+7aY6D4x8y2h3KsvMav4/lCsqZzVFC35emNqawX7SbelPoZyIZ
 6gbiFpSdfGRI50NrEcg==
X-Proofpoint-ORIG-GUID: a_QLwUDEzhmt5UR1Ae08ogLpcIHWjiTb
X-Authority-Analysis: v=2.4 cv=efUwvrEH c=1 sm=1 tr=0 ts=69b9f211 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=9AdMxfjQAAAA:20 a=lQR9YH99-W1lUZ23WugA:9 a=QEXdDO2ut3YA:10
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: a_QLwUDEzhmt5UR1Ae08ogLpcIHWjiTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 clxscore=1011 phishscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2603050001 definitions=main-2603180002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_173049_033088_14BBE838 
X-CRM114-Status: GOOD (  11.89  )
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

On Mon, Mar 16, 2026, Chukun Pan wrote:
> Some boards provide USB VBUS through a controllable regulator. Add

If we have a specific user, please include it in the change log. In this
case, it looks like spacemit k1 as noted under the "---" line?

> support for the optional vbus-supply property so the regulator can
> be properly managed instead of left always-on. Note that this does
> not apply to USB Hub downstream ports with different VBUS supplies.
> 
> The enabled and disabled actions of the regulator are handled
> automatically by devm_regulator_get_enable_optional().
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> The vbus-supply property has been declared in spacemit,k1-dwc3.yaml
> https://urldefense.com/v3/__https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/usb/spacemit*2Ck1-dwc3.yaml*L71__;JSM!!A4F2R9G_pg!eSm5G5c19zlsLK5DkD6WgQ1EgAL-mnHHd90kLRFzrgMWts8d0dfjK5HglU-SA4RLpLkgMEcA0Z2GgfsR_cBJnnub$ 
> ---
>  drivers/usb/dwc3/dwc3-generic-plat.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index e846844e0023..83b4e4d69ba9 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -12,6 +12,7 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/regulator/consumer.h>
>  #include "glue.h"
>  
>  #define EIC7700_HSP_BUS_FILTER_EN	BIT(0)
> @@ -113,6 +114,10 @@ static int dwc3_generic_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "failed to get clocks\n");
>  
> +	ret = devm_regulator_get_enable_optional(dev, "vbus");
> +	if (ret && ret != -ENODEV)
> +		return dev_err_probe(dev, ret, "failed to enable VBUS\n");
> +

The name "vbus" here maybe confusing. This regulator powers the
controller chip and not neccessarily turning on VBUS of the USB bus
power line. Is there a common/different name for regulator id? At least
fix the error message.

Thanks,
Thinh

>  	dwc3g->num_clocks = ret;
>  	dwc3g->dwc.dev = dev;
>  	probe_data.dwc = &dwc3g->dwc;
> -- 
> 2.34.1
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
