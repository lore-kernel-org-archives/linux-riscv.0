Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C5DC54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NroVyyxJGO4xqlgFR/9iInoSCjFz3vRt098ucF+MwkM=; b=1inXMeeyawRB5F
	vDDUaPYI+fbEYUdKD4q+0EeUDgHTk3nV53DqYQD8bUDMSHitqI6SM4cvv90jZEP/zASQEKvHwhDOh
	p2NkPP4LL/+lWYHIWKT/gYWs2kxuPyZdMZr1/rP7Yo8fs7vdN13Tx39+bBFU6vr7TeFSMLEW8Dx1C
	2rqXiiqDkSAooIlvW+ieZSR7GfWacaGon3P0/0NwAO92on00xkAMqPoucFkYdyWUx1/a94IU3u4iE
	WFWgDS45OX/ZdqTTLnOg6TL9Y0TVzN8NO3an5b5vqYZ+LLsXvOEmybT+OR8/rCB6ot1VQmelWMrgD
	IMPmVL/R5gRTPy8PR4kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp1ID-00000003RlP-2ijl;
	Tue, 26 Mar 2024 07:32:21 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp1IA-00000003RjL-2Zpo
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 07:32:19 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42Q7L3KN013841;
	Tue, 26 Mar 2024 00:31:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=pfptdkimsnps; bh=2V5QJPxZyZeCPYTwPsHmnV2OrY+5edDwuhyRa51bNFM=; b=
	L+dQx1urnE5qy2x5g2pb5+EPP3/b3udsJwZw63iHlHqsOJYsWD2QYfU7zZ3FyiLw
	EOy5mRjj8K9c9NsFP4COaTVTIUQXiXHnJMdZnIZ3m4elsoEuJxR1VQuTDLOXeSly
	LRr36/BF2CkEMN2NpOkz4+9AlA2bhgOXHXsn9/624FGaT/oxoXcC+KAWSefxNwRJ
	rXz+x4xbaEMa+LQIWbThYAbO829CO86B5GmJMi+vDYuPq5rxKjTOqV920hjOaMWT
	lP+ETDIDeqUmRWHaK6ud51+zjpvK/HQEIu8RcleXBFBXkl4kSx9gAudu4aId9JIi
	KKJ465GtMwLV2fWKRzVMBg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3x3b6fv9b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 00:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1711438314; bh=2V5QJPxZyZeCPYTwPsHmnV2OrY+5edDwuhyRa51bNFM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=jtpi3bgwrV9Z7ZC24wVI7/Lp82W2PIKOLnhIL6gxZt1H7scrtJBB4htSBIbnpo0zK
	 OJlW6o8UTMk5QEVB6v8icMms4wSc1qISVd55SS/x8frWpLHLaMu9tLGXqV17QIDUFd
	 90CP30ry1BUTewzeg7umwWyyxS5Pxk+RnjTwkSAd9kdy4QR48z4yO30F1DEmHIvUHU
	 g0KGzCBuSjqi5nJLNFZKNwiLrPn/WxnPNd8mtFV401QRcYmRvd97zxaMXdDEg1P4Ia
	 ncx81O9mMp8KLkJwqe9AcabIBJhmvCDOzXhH9F4whJJJCSeutbWplOHpfKvV/MlgZ0
	 f2VC5MOQQJMCA==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 294E34035A;
	Tue, 26 Mar 2024 07:31:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 56584A005E;
	Tue, 26 Mar 2024 07:31:50 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=REdjois9;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9CD8F40347;
	Tue, 26 Mar 2024 07:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jo9tL2duy73UKt6dYL1DjrDrGnEiL1hdkUPeIXRHTDs2B1e3YokcvERPnGGmQ7OMMrI+XAfJUeX7d/dqmyRiFBuIoDFobnR+6/IXVS+ROMP7NqzkOxAA0x8+aJpog6xRCEy7+HRqDsvjEQEYYgOEDe2G0Tj8OkMrO406g7N6jp8PRlxEQCmBT4b52BwIL1vQhrIRHxt2Sy1cmgPjWRD0WHb9bY4QBGAarqgHYMed8AI0aBtWJc7TewK5UIEzhpUbHDDtoHIDLUyswTKCvKIEHivzsyyV4kgdo7g6N/+zVYZTn6GcgAg0CEj8zzqfZhRotaQBO2nZa/7zGPBmAC5amQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V5QJPxZyZeCPYTwPsHmnV2OrY+5edDwuhyRa51bNFM=;
 b=iOMAM/0YwBaikVZMlHIsEwjCwARMDrPAeqazFiwZkNXkGhZeHDN5yjn0APnpu5YjtdAvQvRwMi9USNfXzDcsL5G4X7jXe9Z2+I9b8oSAl+ZqtfhlFTaaqMnVsZrmA5RUFdpE6tBsobQorVEsFolyKDTx8KcQrVOKH/d7zUQT7wL/5CD8GcT0pFst/q4d3aMCd+ZDHkSMKHqe4WOfRAKMttlCIF3qGTwvkAwB0d4PkqSOG/PLOHT6QyLv1K2Qdt0FqSXH4dhkXt3x28YGIB9L1r7LZAzEk/C1/T5VOaXQx2Oxob74Vk6uOEYwQEnyjBI1COZUXLKGOc3KHWnGIOnlWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V5QJPxZyZeCPYTwPsHmnV2OrY+5edDwuhyRa51bNFM=;
 b=REdjois9+eJ3piCHlZ2dZnmLyaEYqUiVU0h7YoE/3d7SY4w7OCof21QVolr1DPjUlEYtSOxxuTDw1Fxyl2G1tW4Sn1qh4uDix2W8RFPEXOkZIxmcbxrgY/hdSG4PwoEaDxtfU1rkwholGNTlXRGN49VNY8rNqKJh+BC9wg57Vzo=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by PH0PR12MB8007.namprd12.prod.outlook.com (2603:10b6:510:28e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.26; Tue, 26 Mar
 2024 07:31:45 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 07:31:45 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Inochi Amaoto <inochiama@outlook.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Chen Wang <unicorn_wang@outlook.com>, Liu Gui <kenneth.liu@sophgo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/2] usb: dwc2: add support for Sophgo CV18XX/SG200X
 series SoC
Thread-Topic: [PATCH 2/2] usb: dwc2: add support for Sophgo CV18XX/SG200X
 series SoC
Thread-Index: AQHafyaT4XOMslNBHE2JhrZVkFDqvrFJoQAA
Date: Tue, 26 Mar 2024 07:31:45 +0000
Message-ID: <676b59ee-cf7f-03a6-78a1-197cf5a66ec6@synopsys.com>
References: <IA1PR20MB49537ED844CEBF19880326CEBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953EE73DD36D5FFC81D90EDBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953EE73DD36D5FFC81D90EDBB352@IA1PR20MB4953.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|PH0PR12MB8007:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9jv478c7X0o6s49I/cmiaPo4mIMBC0rol8BapcNPP5st07ducLFA0VCjf2Vx+yKNd1xYHM7wgouaDEXHV87xU/QSl6wTzleMeGsWl/je3Bl20dUisP0YaLIWhsSer1cj1WPtyrxl3yT1r58+LWMytr4gjXZLwvlmFEHkcZ7xzuG58oU6zYuiJTevX1v+1aSeXSbH1bhK2h9RPKuKEzr9ctaeB8/MaStJfdhStjsij8BfxTG4Cm7FNzMYb6BJ0+Bp7FZPBceEk8N/y5JFoc8V2Ej0Or+KW2BLn/VsXjR8CulYGwAe35WhzbEkeLZQcyBnlE7W3mxrPhS7EG1VBjDlwX5f407c+6kPxfq/anwaEsKyRT5+Y9gxTwfDdq6CJVtE+8RjKDgPrCNDokvk8STua7ZNo9wBm1kfVjACeKeJKcYN5LK4hSEOUHK5U930JhbiQ+ZTaJJu+deDDCoM2adZg83FB2CeeKe4YtBjrv7cTpYsIUOptZB3XeIwz772a714MGQifH88LwSlEZ9Gnw6m3yyeFs8V9TV7gcDD8ocRE9o9lvND0uKtziRjOP5Sm/bD9F0EQU/GpczuhvaNdwyzMHkETJR4nvtSdhw/a6X77ByvoOtsl4HQjo2QNeBUjtS7wbxLyCNtvdxVlzEWfymvjAcR7g+fsarVznOIf9qPAQs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U0pzMEdyNk15UHpJVFNSeWFrWHk5ZHNFcWlKK2ZVb0llWlgveFlBVjIxQmM3?=
 =?utf-8?B?ZHA3ZzYrSGdqZDc2TWFHeWtWZndsTWlPcytZTWh4SjBLK0VRY0hCc0gxTHhw?=
 =?utf-8?B?S0JiNDB0dlNoWllWMUVRZ01FTTc1VjBNd0lPUXZVYndQV1luVVpQRDdaM2ZN?=
 =?utf-8?B?UjZYelZvQnhKM1pHQTdwakloTCtjS1BRLzgyNThqa2c2M2VQZjFyWEVMczNG?=
 =?utf-8?B?TGNaaEo0KzF3MDAybDZNUUsweXVVbjF5bzZxV2t1MDF2Y3NTazZ0ZXhaSHpK?=
 =?utf-8?B?N0M2NHB4cWVhZGlIYTdXY3ppZStqdHRvMGdvaXBmN1JDNG8xVzY4QUtvY01a?=
 =?utf-8?B?TGx0UFlrWlN3d0xEMVY3emdiWGVJL0NrWk9yekgybVMwVVY3UGwyRDBla0pp?=
 =?utf-8?B?S2M1Njdkck1nLzQzVFJWRXdyemhMVVMvMzg4aVRPTWpjZlIwalJiUlRzak5P?=
 =?utf-8?B?V2IyTTdaejlHc1l0VVZIcXZ4Rk1kRnRROU5BRzZUV3gzZlBGZWRpcFBRVmRO?=
 =?utf-8?B?YmpHRG5jU1dmd3dBSUxSeGlOSFZaM0loSTFKbGYreDYzOVJoOTdMeDMxbEla?=
 =?utf-8?B?N1ZqekJuRUdRTE9VcUhaN01jZFYzUTM1STFSaDA5WHQ2VlpPMjc4Y1Zlb2ZD?=
 =?utf-8?B?K3Byd2s1eGdnSlR6V3V3eHpzR3RnVDJIOHZma09zM1JTWHM3OWxXZlcybGxR?=
 =?utf-8?B?YWJpdERNNEVuamJocXhPNTQ3Y0Z4ekJSemc2NUFPbHFuOVlhQzdnTWFzcmMw?=
 =?utf-8?B?NDE5QzlOejJOck1rcWkvczJiVHF2eFRjL3BjdzQyUTdhOVVXbTNzTnZmVzFR?=
 =?utf-8?B?bWV4TFUwYnVQMGxZN3JQZXRHTjZXWUhIaWxvcmhReG8reHRpL2VnbHpPYUkz?=
 =?utf-8?B?K0lxdDQ3ZCszVzdYSVJkUnhnMi9VMUUwRzRSZmNDdGczTmIxcEs4ZHdPYjlr?=
 =?utf-8?B?eUR1WVlpcFJGQkptVFIybHVPaWdSemtMdlZvRnNvdmxMRXI4WjJiYjIrNTkx?=
 =?utf-8?B?TStoeG9rc3U0U1EyVVY2dHgySlM4VERtbnZkMG5uVUtPeFlTSzBkdkFzMUFS?=
 =?utf-8?B?MWV6NEdXTkNwNWpIMzNiNnQvM2lpaFpLbThFdy95OVFsdHlKSW1IdzhkTkxU?=
 =?utf-8?B?dFVBWEF6QUR5SDBpaENkdnNZc1pqUitkeXVBNmt3YWs3Q0FOZFlZdmZReUZ3?=
 =?utf-8?B?c2g5amoxYkpKd3Y0a3pTTHN1V21HVGI1UXFJWWhDSUh5bkIwVlZNMWozdGNs?=
 =?utf-8?B?Qk90ZmtBdHd0U29tSmRvY0dkMUNtNmNhRW1kc1VWejhJSS9uSTROWVRmcjFL?=
 =?utf-8?B?NWJQRVdLc2tPa1dJaEtOSEMwWjlEd25xbW5OL0JZRWJ4V2UwWHJSdUl4TG0r?=
 =?utf-8?B?c2IrUWdzbE1VWXhWdDBOT1JnVGVKVHp5Ry92aE03b1dqamZkTTJBRFc3emE3?=
 =?utf-8?B?Q2FQOW1rLzc1cTZReDg1cUk5RW45bVlJL3piMVpjNE9iaXBOQzNORmY3NDYw?=
 =?utf-8?B?UGhZRnU4OGxBWGtDcmtqM0NmQm5zNC90ZzZQeFEzWlZSWnFnaUQ0U0JxbHpz?=
 =?utf-8?B?RUl5RmpYbHhCVTVBMDRzYkk2ajk0TWZzS0piN2tBanJ1cE13SHJwdTNoanlp?=
 =?utf-8?B?cnVVV2VmVzluMk5ySlZJcTYrVkhZVG5jajJTc0N0KysrZTFYVEtFR0lrYTkr?=
 =?utf-8?B?OG9USTUwOG55V05nSnplNk1CSllST3ROaXRLTWxJN2hjbW8wSUtzUHVsWGxE?=
 =?utf-8?B?c29lMGVZeHhBUTRlR2wyMmhQUzFycmM5eUxQSXVTY0VQWHZWeXgvaElVb1Nr?=
 =?utf-8?B?WERhQXg5WWtpK04zK2crRUJxOUNZT29tWWR6bEJzYnRSRmF4YU10Yk85WWQ4?=
 =?utf-8?B?NXBhenVSejV4U09NY28vaG4wNG14dFMxN1lmV2xaVXYrUDJ0NGpsYVpya3lx?=
 =?utf-8?B?NEEzSStxWjBYYmZDd3F3QjIwemtGRUZlYkxrZnhYYllEOXRJcURpVFVwWG5y?=
 =?utf-8?B?UDJKQ0NlVlRsNEhuT3JNVzhnZk80OUNuNE40elhSWE13Z0hxWFAyV3JlbzNw?=
 =?utf-8?B?WStTVmttMG8vUmdERCswWXJ0bURGM3laU2ZZdldOYi9rTGR4WnBsWjlhTnRw?=
 =?utf-8?Q?vGBE9lwvCy1oy3HIdS7G8zmKj?=
Content-ID: <C9F2545051AD494A9FC09ADEE57C1E0C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: E5ffJE6AV1p63gyd19Sz0LZnx3SEad5Qncp8YnJEfXEIqU4Q93H5xzWnhsy4yy1v7uXFpOEdsuNv74bvH8Zwm4GLEwDQ3A0T0L19XQoi+XTXnLPePeS1FLKsE6vz8AymZXTAjN4gfllEyBMucAZx11c+YyesUoTCEZdCl0Fb0rahFdIr4RywCdRxuhLl6ygw+cV+vfDFlperq+dGSVyXTK16XtePyhSYbMCVAOM3Ji5OBNZ0GRdR9D8He7aEyjnP0/gweO+HqKhx04IhsVV4y7AY0QtBvxBQMjnbVDuxGQfWEySGcJ9Ap8ErL448iDAxi3ObDp9eF1TCQhWpejT0/3doK0sLJ7oTwq7rJd6Zty11eUnGIS81x13+w8ZtQaOCtH4prGCW8kgzKW17Cu+1oRYo5po1frepn1uNeglxcEk+su4Rh6RObk980Il6PpXa0O4RQc8E3FVFa8twpr8r5y2fr6L5KNQC5uL/PO+8kHlCzdPeTyfwTbea6SQoaHA5QR1TrzCMvKXXrIw4rezzBIdhkS3hYbWWggoyDh9tGjEfH35qvdNbvi+SbpGbmC26KT+E8bLBeQzDWq4X9rBpl6/Gxd3BuB60AZtVhNeLtFuecmJuXyQDAZnU1JEfCx/f5UdL4pw5aaaLUnz5ioTkMg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be2ddb9f-c3ea-44c8-93a7-08dc4d66ca5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2024 07:31:45.6693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AQXd+sRqF3jcxZmx6mEp/P4QDM4ijf7y0M+02+fuTKpp2CaUpMdHdXacY1rPDitZTRFukqAoz1K1Fk/SxCwylQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8007
X-Proofpoint-GUID: dwTKQYwTGnoQpvwtWVn_LojJ5I0GZiJT
X-Proofpoint-ORIG-GUID: dwTKQYwTGnoQpvwtWVn_LojJ5I0GZiJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_04,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403260050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_003218_713358_ABB579C9 
X-CRM114-Status: GOOD (  20.46  )
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



On 3/26/24 06:37, Inochi Amaoto wrote:
> Add params for DWC2 IP in Sophgo CV18XX/SG200X series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Acked-by: Minas Harutyunyan <hminas@synopsys.com>

> ---
>   drivers/usb/dwc2/params.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index eb677c3cfd0b..171fcb34eb75 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -201,6 +201,25 @@ static void dwc2_set_amcc_params(struct dwc2_hsotg *hsotg)
>   	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
>   }
> 
> +static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
> +{
> +	struct dwc2_core_params *p = &hsotg->params;
> +
> +	p->otg_caps.hnp_support = false;
> +	p->otg_caps.srp_support = false;
> +	p->host_dma = false;
> +	p->g_dma = false;
> +	p->speed = DWC2_SPEED_PARAM_HIGH;
> +	p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
> +	p->phy_utmi_width = 16;
> +	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
> +	p->lpm = false;
> +	p->lpm_clock_gating = false;
> +	p->besl = false;
> +	p->hird_threshold_en = false;
> +	p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
> +}
> +
>   static void dwc2_set_stm32f4x9_fsotg_params(struct dwc2_hsotg *hsotg)
>   {
>   	struct dwc2_core_params *p = &hsotg->params;
> @@ -295,6 +314,8 @@ const struct of_device_id dwc2_of_match_table[] = {
>   	  .data = dwc2_set_amlogic_a1_params },
>   	{ .compatible = "amcc,dwc-otg", .data = dwc2_set_amcc_params },
>   	{ .compatible = "apm,apm82181-dwc-otg", .data = dwc2_set_amcc_params },
> +	{ .compatible = "sophgo,cv1800-usb",
> +	  .data = dwc2_set_cv1800_params },
>   	{ .compatible = "st,stm32f4x9-fsotg",
>   	  .data = dwc2_set_stm32f4x9_fsotg_params },
>   	{ .compatible = "st,stm32f4x9-hsotg" },
> --
> 2.44.0
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
