Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9661AEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 08:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OT9Hp/RdpHAuQbtpfNqEoUNTc9ZofOpB+/SZ4bAbHKc=; b=VRgecskmICmEkk
	rP0D6XDNU8FW/BifHjdGqeWEb5VdmH8+Co8vDZjc6v7dIgIjvA7UVnRcK7GRsGJi4PMapZzrndQ70
	VEQK/0FdorF8b9NWyujKbkmbI3oe5ilhzsyrNY9rC0sAANOoMX1WUTOInStCkr8I9RmLUCwYWNODH
	adkfj3J87YsZpQy29KGBBqv06Tnn63KOUUVfbqTgGSXRKp1ZkLMnttpCxF1zZSdsVVdzpcHx5X+6y
	o8sRIMIxq+zsLI73P2h/7rtseTOgKPhX4ZO6gAunRFFeeYyZ4sxenOzux2o06rOIEd1tAIXbujW4c
	N/zKYV7R6EJK5dZtKROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2XV-006Lcf-06;
	Wed, 19 Jul 2023 08:28:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2XS-006Lbi-2u;
	Wed, 19 Jul 2023 08:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cbR284YFKWqqp/H3njFY2FaXUqfJsbXnUaTpKzvcYfg=; b=K1XwLwJns3mhcwB5rT9ojOfA1a
	6Mu+DTIYRKvZVqIk9Y93mNDvG4R62fnw8VS9CSIFDrUFXZTstWNYryij/2WQFAG5GGA4KgBSX8+jk
	CBZXKN4NCy1ZyMbp0/FMgIgSYCBWMI2yXRAb8Xi4PlTDc8psYuGCshdkOVdeJsJRaAct0B8qqhhLi
	Z6n787cgOHm/tC3+QZgyIwWHnwAnZ2M8xW2LgFg9AdXxi7+mq6vCghgjVbad+PwPSPCKUevHgZcub
	gCbG1w7RpsHOtpy67KNSVWp/Zggu7O0UCE5D4NoYQVYNWJAVlI46v/P2AYIs9phJmG0+eHQki85/r
	QKkEFNKw==;
Received: from mail-vi1eur05on20616.outbound.protection.outlook.com ([2a01:111:f400:7d00::616] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLgjf-00BLc7-29;
	Tue, 18 Jul 2023 09:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbR284YFKWqqp/H3njFY2FaXUqfJsbXnUaTpKzvcYfg=;
 b=mg6FGotE+bzzST0D36aFgGxT54jtHLzVH1IQuOOd3mcWAjvYXugq+VrfvAs6EJ4bDaDskuujWgPgU8o06XlcJm5WoLbwGpfhiNWku+IJ6/8w4HE5QvYuRt6IQFlV44IuNgKzLpxhxrle9xe4ogYhfMsFbGhg11DqENklR3ZEQiA=
Received: from DBBPR09CA0005.eurprd09.prod.outlook.com (2603:10a6:10:c0::17)
 by AS8PR08MB9454.eurprd08.prod.outlook.com (2603:10a6:20b:5ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:10:32 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::5c) by DBBPR09CA0005.outlook.office365.com
 (2603:10a6:10:c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 09:10:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 09:10:32 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145"); Tue, 18 Jul 2023 09:10:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e51d28f378240e8d
X-CR-MTA-TID: 64aa7808
Received: from 1518e62880fc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D1158AE4-ECEA-4C7E-A403-ECDB7C1FE219.1;
	Tue, 18 Jul 2023 09:10:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1518e62880fc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 18 Jul 2023 09:10:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BewX935bHjIuBCmpHZmS+inb94ZgCyVJmD8LEokrAOwgDorRz3DeNTp6O0PTVAZmM3oioAm3X27mp5UzmFBmYP5gWJygda6gl7XMwDIEPPOF++vgQhLEitw6n/XlcbuM9bS4cBhntH1UnWkkmBpQE1XfVruRu4xKyFJkUaoXOzlJehPbRl0dBZ3D04yOykocRSzE19+nLTZ42tXt3oUAQiNm7ZSznVxDlGAj+ainZrVXMzpcWi0lfh95OxYpnypfg01e18oFiOk79GCFz1pVxnmp49U9V2bZCU2HbK9E67CEVRQvPDuiWoEyk5cx3jBuH++bjYITpw1X27e2AQnjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbR284YFKWqqp/H3njFY2FaXUqfJsbXnUaTpKzvcYfg=;
 b=GHQRpe1/KZrupIPs0UyJmly7biiMzW3ug/tGzLt/oQP9TOTjhAk5uJv9QsB+V0MhG1ux3aI8uzRYMxoDAEETtsUmnxRX8oPI+82SXGkZbuGMfeS/Tm2i1gB67eqD/+7ghTV6IqJu6fnlZxl6tHQg6lQPe8u7DFHnT2v9Si2yLuS0W0yNfH/L3bUE6WST4h8SnC4dn2cYH/ErJofbU/MAhSBwf7KVewjk5YulmPfvTdjBahxPLK3w6+IxB/SLyeZBvS07hJ2pIHYGgezsOjtoiX0ATfHgH0hSTdzJlbm6/KVq/qOivZOvOvCeFFJLCi/QUed28vmtAmSPfrhvkKZ3tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbR284YFKWqqp/H3njFY2FaXUqfJsbXnUaTpKzvcYfg=;
 b=mg6FGotE+bzzST0D36aFgGxT54jtHLzVH1IQuOOd3mcWAjvYXugq+VrfvAs6EJ4bDaDskuujWgPgU8o06XlcJm5WoLbwGpfhiNWku+IJ6/8w4HE5QvYuRt6IQFlV44IuNgKzLpxhxrle9xe4ogYhfMsFbGhg11DqENklR3ZEQiA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com (2603:10a6:10:2cc::19)
 by DB9PR08MB9612.eurprd08.prod.outlook.com (2603:10a6:10:45e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 09:10:19 +0000
Received: from DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::adb0:61cb:8733:6db2]) by DB9PR08MB7179.eurprd08.prod.outlook.com
 ([fe80::adb0:61cb:8733:6db2%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 09:10:19 +0000
Date: Tue, 18 Jul 2023 10:10:04 +0100
From: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
To: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 22/35] arm64/mm: Implement map_shadow_stack()
Message-ID: <ZLZW7Kvg2Rep8ySO@arm.com>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
 <20230716-arm64-gcs-v1-22-bf567f93bba6@kernel.org>
Content-Disposition: inline
In-Reply-To: <20230716-arm64-gcs-v1-22-bf567f93bba6@kernel.org>
X-ClientProxiedBy: LO4P123CA0363.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::8) To DB9PR08MB7179.eurprd08.prod.outlook.com
 (2603:10a6:10:2cc::19)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7179:EE_|DB9PR08MB9612:EE_|DBAEUR03FT039:EE_|AS8PR08MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: e25853e1-13ae-4d46-6733-08db876ed71e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: PxUwwgtHGL7gREDYcK9VjFQP3zehF4F17x0IZmGn2/yz/Pxqim/BcuRfwx0BEjsieoReHjCAbOWDl5Z1zUqBBz5naW7gzISdS3ofd6M0VNZYPmiyDMmhlYP+Z6maYR5R+2H8DwNC8jrCVvcgmOWFJ0i26WZeRkV+O+MjBu8bdZIws0s9NtkLY0SUs/g/aB71g7YW7FJce+TBVRP7pDJCptBkUMwPlPwdwvvDSiODU7R6XTAdXeXJLc1gs0mUoFYK8EaVZiaTgxdL1wXklWvK5XdjXC8RltAVIIO4C24GTmaZJ/tjiOPADTsrCv2SmtN5dh3tSZ3aTgXrzJU7N2wrM34aebIcmcI0ckePZxKdAYpmfQAF1+YQXlP9jXfp6yni4ltJqjbTddf9TPkR7qOyyNEg8tX5R4mzCGNjSETyfvNsBlG/Qj273NwPEUO1VyQwYG6B+vmrP9rB2KJw05ewzhJZVKIxJBwZcRn6FPaF4JJnYVUrPGJX9OfVbvQ47tZ/dPGxBkU61eoQEtjYVq/b9w49UGujkqUvroYHwkjacUbmvhH/nQm8dK6CpRiFyRHkjW/hRhICkKsR/nG6HJpKCppncIrZyEWWhPsquBN4scs=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7179.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(110136005)(478600001)(6486002)(6666004)(54906003)(6506007)(186003)(6512007)(26005)(2906002)(4326008)(316002)(66946007)(66556008)(41300700001)(7416002)(36756003)(8676002)(5660300002)(8936002)(38100700002)(921005)(66476007)(86362001)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9612
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fde0465f-6270-423d-7d57-08db876ecec7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJ6WQajlYmdd8neIsenTdjLFj8FsVShExOO8LzrhXyaF80x2Oftzr2FVmaEqFSFWZ6GGZZ3zerizIGxQxUHbKkDDUXYHseaqzZ06CZ/COhdy/jPAhnroHLdl8VbfeOmhJf3VCC+aaomx4AguhioqVemu+iKmHOuRpOyg3jTldG5IquVjcKolQU1hM2QXYJov2K2knmgboJ+02x8u1pPag2JXM8dyUA0w1SwJUMI2BvU9yztKJZwCn3fXVJxcN7K5qCjDcHYJJHldmPcznBOD3zs+9YN1ohQeJOFYs1sSq954BwO/TWd27btlbtHt8V8uwqg0ZuBo+g6luTBoPLyEduF/51mBZc/Y249dOmjrvYFeYIHg9R1KtmfB+H63cCPhIZ7RadKzYaGullLC9uw6i19BKHJ/obzvpb7iXw+GHQherOs1jAuxL3Ts4k47hfVbmfpg4wNIsiaGdeWEfYa6+3CBTZUGUyP/xaqbGX9/AQHSsbrJBQClMo/GUBykdAaWwZeVeSaaUUX46HqvuK5gBiJjSZD0vL7dQk5e1H89cpeRnpSykHw3+UksrT4nNxCmZJrTAzHznh1I6YzGFqL40eRLyDJgAhggPsPAYGHQphX9PSHzYkjhPA06oXutHRL7ec9RGCQzKN1VlSMYnGtN6dcI+erY7OSbq+l8inyiUJekNxcOYlso1ZDKNJMpjTeGoLrmf7o6/bHDPCDozxZ0Lz3xy07bgpkVC/IkY0kykEoevl+TGtx08Tp3Ae9YcUE9Y2x7o1JczodCzJVGUGOaug==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(54906003)(82740400003)(6666004)(110136005)(81166007)(356005)(921005)(6486002)(450100002)(5660300002)(8676002)(41300700001)(8936002)(316002)(478600001)(70206006)(70586007)(4326008)(336012)(36860700001)(83380400001)(186003)(47076005)(2616005)(6512007)(6506007)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 09:10:32.8147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e25853e1-13ae-4d46-6733-08db876ed71e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9454
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_101312_070359_0B83AA85 
X-CRM114-Status: GOOD (  14.96  )
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

The 07/16/2023 22:51, Mark Brown wrote:
> +SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
> +{
> +	unsigned long aligned_size;
> +	unsigned long __user *cap_ptr;
> +	unsigned long cap_val;
> +	int ret;
> +
> +	if (!system_supports_gcs())
> +		return -EOPNOTSUPP;
> +
> +	if (flags)
> +		return -EINVAL;
> +
> +	/*
> +	 * An overflow would result in attempting to write the restore token
> +	 * to the wrong location. Not catastrophic, but just return the right
> +	 * error code and block it.
> +	 */
> +	aligned_size = PAGE_ALIGN(size);
> +	if (aligned_size < size)
> +		return -EOVERFLOW;
> +
> +	addr = alloc_gcs(addr, aligned_size, 0, false);
> +	if (IS_ERR_VALUE(addr))
> +		return addr;
> +
> +	/*
> +	 * Put a cap token at the end of the allocated region so it
> +	 * can be switched to.
> +	 */
> +	cap_ptr = (unsigned long __user *)(addr + aligned_size -
> +					   (2 * sizeof(unsigned long)));
> +	cap_val = GCS_CAP(cap_ptr);
> +
> +	ret = copy_to_user_gcs(cap_ptr, &cap_val, 1);

with

  uint64_t *p = map_shadow_stack(0, N*8, 0);

i'd expect p[N-1] to be the end token and p[N-2] to be the cap token,
not p[PAGE_ALIGN(N*8)/8-2].

if we allow misalligned size here (and in munmap) then i think it's
better to not page align.  size%8!=0 || size<16 can be an error.


> +	if (ret != 0) {
> +		vm_munmap(addr, size);
> +		return -EFAULT;
> +	}
> +
> +	return addr;
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
