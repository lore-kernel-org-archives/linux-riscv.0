Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791E0C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 00:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+GHhIQcLPJpsjF+eYF2ci7V+t9iATCmqhE81tn9z7s=; b=OrBADL4WBG3+TN
	R7BJMdTxpjg4y2zvyDaUHLV/G8J49Pdwo9EL+bcsVAHJPecRBr02tr9bYwZf/HSKZimYJURnjtgAN
	2sL/RgdJGoSK3mR7RQYjOd35y+6ikMPtmEyOY0di0wZbxUbknL+TXZUpp19VzxJqZIDcJobpFVHJM
	qKk1/eNq9N1IMMRfdfGtKZXbTH6sj0b5UHNNyyy8zaNrvLrVEAUJ2c3Bii0n86JlGy9xqcjo9LWmL
	JDMK29HKOL4rsErj4JsV+tloydoCNNIAoz1WnKNIaDcINeCXI7Rqi/mL25vAjMRSfyIyDqen2vyLr
	NrPLFNsWLATefd2fCJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2hU6-00ExiM-0M;
	Tue, 14 Nov 2023 00:40:54 +0000
Received: from mail-dm6nam12olkn20819.outbound.protection.outlook.com ([2a01:111:f400:fe59::819] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2hU2-00ExhZ-15
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 00:40:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/NPNMoNTx64o1xW0uQ4bCDga97wIM33i/Y3NqUAccQEJ8bl+2aqzQOTPP1kLUpiRc64wAgnEiqKP4XUezKBi2VrDoQ1TYmqwojmi7LAhXJ88dqz6ZaEUoNDxZDW8vlcqNpGrIIv1FoTJZ8QtBWQXrFRiMIXHiaDXK4vdxjE2+VDx+hyMDr5SUggRp6smm2uQvR01J5RrvfrRTZaZBsPsvRpCv8sUpuRcy4RDtnyGm9ME0MtmmjshMptAIZgKPJObQ+3NUucr8new5pi8bkSypGzHIraM9u02Ra8yOuzfKFw73dbocYJLq1rtSX9cIlwRwgP1A5w1tZ72rYtJabwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QcWYdTHt5XhvCDkK0lKpm//R1QuKnoWrv/Sa0Z8u58s=;
 b=RvO1Va+NXlrFwWfupMgW3rs2wXTJ6ePRNy9COaXLyzAgd+ZlO4z7U5gKuZyxiYz3o9+9aPUhOh7CrCtULjALPBibU3QYohBJTfQhGPeSy33DSfQjH+0GbXl6LqeRTZJpLlrUwnUNy3c31H9cGrkY/6dD7E0WqG2yfetgKJqdZr+dqc+Mszhpl7p/kySBNpCQ931WWh71oWQm9YkJBMj5ZJyqQpEPkD6sj7C23J17bENbwd5CjwYcXVeRzZT9gOr0lIs6zKBZVRnkFMPPQccIav6qjPiqNgFtSMYEYrjIuZRg58GjghCQs79HSzr9EYpkFpJhx+oyny+FCiI5v0u/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcWYdTHt5XhvCDkK0lKpm//R1QuKnoWrv/Sa0Z8u58s=;
 b=B1SWOWWNZ3l1zPGNqXpyTXBrAe10LURSEA1M669S5Q1Uhvy6GpsKTDEviBJ32rFbo4iq6siADa/Xs7RlGNyLR/54pj940rH/Mbl6ecwkC+CrP6Z8S2F4v6l84nEWbLBX4wUmFYZObEnbjntFSlbJIOPr+d6CWFIINP7QesVVJRW01I9ModnXki2+O7U/m+3o/e37cCIH+vG3PwjULbIUrGiqEOH/8+N3wtU95o7hZQIh1PUzIrHgwFNYcda2yXMYHxg3Xt1dlI0SlHj/CjiY2Blmfcn+EwP095HgK7pindVHiLohhuKzSSJFlLY0zlxkTS2zpzboOmiPI5gVIu+8jw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SN7PR20MB5410.namprd20.prod.outlook.com (2603:10b6:806:2a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Tue, 14 Nov
 2023 00:40:41 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::55b:c350:980:ad8%6]) with mapi id 15.20.6977.029; Tue, 14 Nov 2023
 00:40:41 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: remove address-cells from CV1800B intc node
Date: Tue, 14 Nov 2023 08:41:10 +0800
Message-ID: <IA1PR20MB495315537971694463B65DE9BBB2A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113-portable-garnet-8a04dbb71b51@squawk>
References: <20231113-portable-garnet-8a04dbb71b51@squawk>
X-TMN: [9a55Gwg5rZc7KIFwFtJa8BCNEY1AXJh9Tv94qJZ5jyU=]
X-ClientProxiedBy: BYAPR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::38) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20231114004111.41970-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SN7PR20MB5410:EE_
X-MS-Office365-Filtering-Correlation-Id: e0241bb1-5792-4cb5-1937-08dbe4aa541a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2hP0iTpxAkdC96tWu7G6M6Qz4zkYqMWeizoFqpHqt5vQpkcsVhkjMhIoLVm1zZQ+tXq3wxhw3qDTgUAq/yN4f4KYPGfvF/mIHQhNowaoOPdO8LDK62erY30BCvFHhQNW36XSbh5dQvtdEwnhxikwi0UDVAxrg9L+Pd7tZ3JrUBmEROR+pdR9ckLMV4oLFVeqsiIifIyWNo9CK5Vnqnb0hGfy/IfcvT4tmU5SE/GitAvPQZkwWdf2VjMDJWcLAFbelZLt2/udz5oelLxQk4IEWLLAhHSjsfZYIY82RRQ9pxLC1mO1Qtq4sq4kQLUq7kBc7jVImothhvpmvAAM381uqy//KKVGoAzRjssjYTA8HT/SN6b46Aeucg8s+es2vJGg/LUewMMArhpeCrkbYJoBsHF5evXWg1sExe3KyfVp2wHuLqJ2UpXQ/R/ojKIdl/t97nTV57EWgbfcck+m2Wsbtu3Q4Jo19o3KPA9Y4osTNdIkE3CRcWyqV6FS4E/npW91fhnmuKiEvkxCuholNcVJTlJyleFd+Zz6M/uO4tz6SmqRtiwOZ+WFvSWnZikZBVLaZJ0GBKPOJCx4yheIwVNrZ5aV8CzroKEUrldQCJChvk9J0a3fjmLTxEZ5FHq71HM
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JSGoLdhY66RmQ6qYP7NIxmKNEzOm5eZKV1ed7vpQoUeaTBK3zxe2yhBVuC6B?=
 =?us-ascii?Q?Z7glJb6zKGfeOKthvkgGUpj2WqoWKZznUPS4TRzHgy9rQg8re0hbiK9JmnQO?=
 =?us-ascii?Q?HfINt8jrbDEKhogHfwgD2iGtl0EBuDR2xNdQ2F1sRMktsz6R22HgkJd+g9+D?=
 =?us-ascii?Q?MOIzCw0pPgc2pWVMgwMCG1a6euZmj9ranDGQz8Dkhk/2WZ1ZwI28vf20C4IX?=
 =?us-ascii?Q?jUiDTK5lOlkqfG2DgLKDPuVtaKOz6Ho1X8XCv4K1ctaSt9Gfv2cRCGlwKtxo?=
 =?us-ascii?Q?E8Mbb4yyBbmNAbEVqK4I9I78Vi35qDQ46+SFEM9cDnfGnU/Gad4QATWlaV0P?=
 =?us-ascii?Q?4hRJdEfnvKaMsoJqn0Q93Byw6JP/b8Tm3vsnqYP+dYyhlZ7Z6XsTICnVnICM?=
 =?us-ascii?Q?vqamn1b5m7/2WnooUfdnAc0rVrjZKThEDy3J1tfE4wSW9UduHf15pFFHc2CT?=
 =?us-ascii?Q?PaiCjqpmZCsY/guIZx66UyANCDA62wO4/2P0ke50Zy15KDGAIK3ga+QbQbtx?=
 =?us-ascii?Q?Snc4ReRZTo2TkAQ8hEFogGzkRPJdP1fEIThJjoKLjW2Ez9MiG1uJ4nScGc6D?=
 =?us-ascii?Q?QxvAM5csfFcz+pDH8ajnmExz6DDqqk5tGKBp6IJ0/FIXVOtsbF2mrreilhPp?=
 =?us-ascii?Q?HgRhiEvQ93F0qd7B5dCzuIuaq7RDLow1/SHjS63Lnn9U563YuHkoiuyLSo0c?=
 =?us-ascii?Q?tkLxjqhpLYbP87hafxwnrj+LgoaGW/XOUcOFZTrh9lzrOqTzw+1Bmjll64fN?=
 =?us-ascii?Q?2xuM1cmHqnKr2qUgYMwDevgA0CyXGWMRfcJWsjzvNWM2qBAEfWsXE1oY4CWT?=
 =?us-ascii?Q?7BXuyInvtWI8tOsv6Rwu8MxnaVjQZo8y5oh96AsLKqQzuiJMf9vBOSgf7a3i?=
 =?us-ascii?Q?/0vkBviBCl5teGLVNvtIWCURk8bM1NqFIbY8e8rm91EMwm7ASbWwOdDJSCow?=
 =?us-ascii?Q?VLD5LHLo4hLuWd8ZhAoe7qKc6f6dL4ROYK2VAyGoiFq/fIuchfyOyaJp0A0K?=
 =?us-ascii?Q?YkOOWExz1Ik0CosmImT06FyBOM62XW8+mQX/Z422Ul5OtVUhMxjsmUDSKvw3?=
 =?us-ascii?Q?jTFybjUl3NCnipdLDuXbk4LVdjNaCxO3flLgk2qiTxx9Le35lkB/pjSsIOrw?=
 =?us-ascii?Q?rPgUOWDZ3vvdylOo2s6V2MKWgZKwgdmxSSxU47oYB5oWRiVKUHJZD18SeXMY?=
 =?us-ascii?Q?XCum+TpXFCix9b7OOED4kni4oTT54Eih6m0/aNAYmAf6gxUa7I3dC7LDHfc?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0241bb1-5792-4cb5-1937-08dbe4aa541a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 00:40:41.2733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR20MB5410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_164050_396214_28B7D9C7 
X-CRM114-Status: GOOD (  12.69  )
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

>On Mon, Nov 13, 2023 at 05:26:15PM +0800, Inochi Amaoto wrote:
>> A recent submission from Rob has added additionalProperties: false
>> to the interrupt-controller child node of RISC-V cpus. But CV1800B does
>> not follow this change and still uses #address-cells in its interrupt
>> controller. As it has no child nodes, #address-cells is not needed and
>> can be removed.
>>
>> Fixes: c3dffa879cca ("riscv: dts: sophgo: add initial CV1800B SoC device tree")
>> Link: https://patchwork.kernel.org/project/linux-riscv/patch/20230915201946.4184468-1-robh@kernel.org/
>
>This is a dupe of a patch I already applied, but have not yet sent a PR

OK, I will try to check the tree next time.

>for:
>https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=riscv-dt-for-next&id=b99df62818919b84e970eea5aec60b0dbc57da18
>

Thanks.

>Cheers,
>Conor.
>
>>
>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>> ---
>>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>> index df40e87ee063..aec6401a467b 100644
>> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
>> @@ -34,7 +34,6 @@ cpu0: cpu@0 {
>>  			cpu0_intc: interrupt-controller {
>>  				compatible = "riscv,cpu-intc";
>>  				interrupt-controller;
>> -				#address-cells = <0>;
>>  				#interrupt-cells = <1>;
>>  			};
>>  		};
>> --
>> 2.42.1
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
