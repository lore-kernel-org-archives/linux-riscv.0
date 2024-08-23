Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13F9C531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KfkVkumlmx61X6zO/lZHf1RuiVKAyufEjFhg2WADU9k=; b=Bx9RrLo3SY4t6QzFuuixiqxgnP
	uctVuMA1sY5xEkxLMeqTUbrV6Q8YpMwBdA0NRRJvE0kmvmykXcBfGHVZ5vmQbHIE8OLiDLUoMCpHM
	VsUHwn9vWMLTB7L7ha2aWSAwyx6Zk3eQSzTAOt+sRkYqYT7tc7C/vyssEMhs4OdjpFuRePDjK24KI
	NEt5fe0N85hiR//ENqv7xApFsWjgi/0LHp7FVOBAMb/Ub3dBeXAPoHvpEplfEwTkAhoMrPQnYL0HI
	ghrGlfzOzJw4L9G1T6qVTixQlbZG79pXTR+heTHjAdkgPHEa8VlNoY2DIYC5v6ETpR4vrjmVcCcvC
	/RJE5kgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWmS-0000000HSKd-233K;
	Fri, 23 Aug 2024 16:04:52 +0000
Received: from smtpout43.security-mail.net ([85.31.212.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWkH-0000000HRf8-0mti
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 16:02:38 +0000
Received: from localhost (fx303.security-mail.net [127.0.0.1])
	by fx303.security-mail.net (Postfix) with ESMTP id 7843C30EE2B
	for <linux-riscv@lists.infradead.org>; Fri, 23 Aug 2024 18:02:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalrayinc.com;
	s=sec-sig-email; t=1724428940;
	bh=89ZKYoLYk+p8wqGKURVAViPbto+cwGj+j2OJMj3CqnY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WGptGS8Y7gAguiAybdQsa114sj062hYUC+D7fCOYAZU57rv/aynPFc89HPGd0kUGZ
	 iQvB/sg8xEdJ6fRJwLaNKNOo4emxOs5Nz5whoJq8FkhFzzOBvuqeslmFwQbj3d/Kg3
	 ZM+mEB4BEijoLPji+ZD2dMFWB/nCx1K+aD0DKzdQ=
Received: from fx303 (fx303.security-mail.net [127.0.0.1]) by
 fx303.security-mail.net (Postfix) with ESMTP id BA94530EBE9; Fri, 23 Aug
 2024 18:02:19 +0200 (CEST)
Received: from PA5P264CU001.outbound.protection.outlook.com
 (mail-francecentralazlp17010002.outbound.protection.outlook.com
 [40.93.76.2]) by fx303.security-mail.net (Postfix) with ESMTPS id
 CAC8A30EB15; Fri, 23 Aug 2024 18:02:18 +0200 (CEST)
Received: from PR0P264MB3481.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:14b::6)
 by PATP264MB4620.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:42b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 16:02:17 +0000
Received: from PR0P264MB3481.FRAP264.PROD.OUTLOOK.COM
 ([fe80::7a6f:1976:3bf3:aa39]) by PR0P264MB3481.FRAP264.PROD.OUTLOOK.COM
 ([fe80::7a6f:1976:3bf3:aa39%4]) with mapi id 15.20.7897.014; Fri, 23 Aug
 2024 16:02:17 +0000
X-Secumail-id: <be95.66c8b28a.c6bbc.0>
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6MCOX6IDLFJY6jQ3THusWxsGegZwmQgOkvy5xCjwr6oxTvdn+Z/EnIB+CPVpHEc0ACDCceUT50s1lRGZPKAjxdgTdodpf16QblaFlyt6rddxZXoOxrDR+jZAm5tgAPT+6BQHMYBJFHpdLVA48XxF3Oj4iNaCEdjND+AjfdQB95AqYERJpD854qUeAMtwumIDIIV7joEiBm6lq6sC65JdLd68uMhimjDOX+UOZFLUocEW3RyslQKvPQRjfYE2sEBDTvW/rlpR4Z5aaDzFwXQUF/c7Ugr9PedzQ9JtTuyEvKnkyeN6CZLE+IAmE8DJYEo02fs25Dtw5k1Y9EEz10IZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii6HvnpCfEwV1o2++1pTTIxXtcWapRhDPTwVa5cRMWY=;
 b=E/H61CP2vHJHUJ3G9t3K1L7xo4iE2c9IR+4tnOAU/iit1E5Y986+Zl89SCa+5lA+MBjFMwnQfgbhtc0NNEv0khmdS9GVXGwlyzcSC1RbbRFUj3lY/44BH9G9XrE0deFgf2poIbF9Y/LZR8yy7fXTsrTeqZ/YTLB0FvVjPgDs/yYBG4BIqp4Pm0t1rEwtj72CXdeDZgcCSE4OJgHtXFXqzToB6fpJ+OrxCWKkNB5iMy1jIG/iP6EmPE0p9X3t8krFxyHXuZADHEIzwS1kxnbTBPJ2+8M8C/whZV4iA4PEVQesl6eWN8nYfJjgPuOZi/XmDKcqdU02jsYbL12zUfpJ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kalrayinc.com; dmarc=pass action=none
 header.from=kalrayinc.com; dkim=pass header.d=kalrayinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ii6HvnpCfEwV1o2++1pTTIxXtcWapRhDPTwVa5cRMWY=;
 b=oLZnHrfFm73Mj9/fh4PVfnxSZxtMkktYUpvM58EV2NaBNqWpZrbuuE9KQeDMh+VpSMKz5/vKOGX5Ir5MFehX/bCpRMArqNCBMDr0sa/ked4gGzeFcFbPNUggK6nuO87KmZ59FsnABySkyS7NSKOb4nMPWP3FBS7e1oQ+l6di9c91J5PgdLzi1m99DYaoH8LeUwbexcZWb3C3wdWQdzWlTBuuNRPkbtpgZ2y+/40kNPWwE3458DULrtd9vXf2qyqX2c1bIHvL4vSw65yV1YaI81jhcnkcE4qGsBOvokeEaBJpSMiz10tgt2M6yekBJBZ+/ctmOI3cRlWrMcrYwqmQtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kalrayinc.com;
Message-ID: <be04b692-d4ef-4e59-896c-085d92e3d193@kalrayinc.com>
Date: Fri, 23 Aug 2024 18:02:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 24/37] kvx: Add memory management
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, "Aneesh
 Kumar K.V" <aneesh.kumar@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Borne <jborne@kalrayinc.com>, Julian Vetter <jvetter@kalrayinc.com>, Clement
 Leger <clement@clement-leger.fr>, Guillaume Thouvenin <thouveng@gmail.com>,
 Jean-Christophe Pince <jcpince@gmail.com>, Jules Maselbas
 <jmaselbas@zdiv.net>, Julien Hascoet <jhascoet@kalrayinc.com>, Louis Morhet
 <lmorhet@kalrayinc.com>, Marc =?utf-8?b?UG91bGhpw6hz?= <dkm@kataplop.net>,
 Marius Gligor <mgligor@kalrayinc.com>, Vincent Chardon
 <vincent.chardon@elsys-design.com>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, Robin Murphy
 <robin.murphy@arm.com>
References: <20240722094226.21602-1-ysionneau@kalrayinc.com>
 <20240722094226.21602-25-ysionneau@kalrayinc.com>
 <Zp5zrkwyagnkoY7F@infradead.org>
Content-Language: en-us, fr
From: Yann Sionneau <ysionneau@kalrayinc.com>
In-Reply-To: <Zp5zrkwyagnkoY7F@infradead.org>
X-ClientProxiedBy: PAZP264CA0107.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fb::17) To PR0P264MB3481.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:14b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR0P264MB3481:EE_|PATP264MB4620:EE_
X-MS-Office365-Filtering-Correlation-Id: d079561b-727b-4847-f625-08dcc38cf642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: Sf58UtvvB1FquwvBdQdShGjBdKqcoG1diwnRUT+JBno368TB3YyfpAUpeBb2spC5aKu3n74V5LrfePYcqeZfrFvIL30jiYp5fO9xXBnCjZs0FVpdxTA1gzBX3ok5njo7qvvoUpVVgWEkdj7sz5lWJKI2hmSLla838+EgOpKnQd9oPkQn4rf6pn8lC4976fmRojZ6aY0z68Bm3rNWDHqjdmuXGPXbDKUNEop7uTg7aEn6L+/4zS47qs7mT14t9FklBjqHiWvjsoh6XBd/xVZtKMaDP06AUW00kAjF1c0pVTTL2NNgtkux9CQgoQOY5rLyCU0DjW1j8DNwfHtXUZnhsTsIjZZk1uFBuAJCrjD0ExILwuGNa4gR1W9Ho8RnH/MbZind+AFzmfG9/83q4O/ATT4AT4jZGLPh2lal2jzaRxO/HdEwkux1sgv9Zp08VmoyatK78sOYeBYrwZ6EFC1CXkZJ5WDvkHo+iCqI8irlraQOvLBmfkxr6VUW93of2CZNYg0Uez30Q8N1RW7YdhP6n9A5vnit37Szhnla9CF8S4pSnU+zW6lJT8Z5lQpVFIDhGeMrKA4t1xS66C6wRGST/78LGBFPByA8z+GIUNxE6PGiVxyEvEsnB3Pg7V0zxRtoR483lYli0IS8OHbyGkhA4k1wKwnhfvMW1qdKJremYFFy3IFErA42QFmiBcejPKqdo7OnvxkJOEh5ZJQOEbqXIEwVz+A+HxIXwSPCadRepis7gJiD7LQ4NtlZw3qSg9NTTv8d3L5koM9mqRBM+Ijp5kxLXa5X2HniOFz5MuJzZZRZWeN+FFGVwEbkDmntYBVfeeamQpUGS/hnPUVNyW3k9skoEHG1axmhU/l6HjvsplQiNjWMUiPj+i6LQ2SGNoEKyXqRvwrdEEgxCMdHsoQpIGMi1DnGuBah2d0nFgDU/boE2UJ7CB+cH3nk7z8ZzSwzLF6
 JjiR9NfdygQgTvJ9v7vQJaAXRqufIzciZFU2ih+Xa1/ZvZt5d5pwv8z1VYGUsjyYZ6iZV0wps+4Qb5VVo73eXV3D21JD+mnagQCn9XClBjP3+qpe8MTP3kAPD2vKioeZfSnQZODyIB7wxYdQghNcKGoWd5XZ4Iez6nUNpUB4kWYzlhWwH+LSvuI4bIwf0A0o8lAAp0NE6A1sJShL2s+KGJmf/06jHmt32hPDkjpKQaBBxiU0qJWGA2WnNNgMfC1GyDWzfdPvWAgsNV3KX/NzMTyB82GdJSgVmpkmw3eQTSHf/OFoR0HQapU4VfEdrWR2FwHPMnc7tEMM6DJ8sfLMEIoDNwLQzLAzPYZxWhzU2K3UrTRmJ2i8RC/u95ZYucQYKyCawrCqiO9Y4hCQTQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR0P264MB3481.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9ZNJggNrIvUd3Z6ySpkysuoJGsS3Ll3ttEWhzRBl+8a3jDRZpTJ0gvzAsJ/2rdVjalLoAfOufxzFgMREMHwMi+tMOvLDKF0lvhah/U2j18PTuvaQzP4XDf8USIL7kYBalaPAvWpONg5ojfmx52Y5WWRTEpU99fOnCnNcSslwD6jPtfojGnebKki30BZhZZnbNlfUWTyD6PDul4CzrwiRzGeL20ovqOqF9bgzd8tmDP7ZNQnPdhXgvZRbWSgGEDJNn2cwDTDRG4lMFHHDbuglBUZXO0aPfwj2JfJb5TV5bKKnTehm4t/fzvC5ZXI2vnxni0hPqTJb7gsCaRg6/WFX8tQPHR+uSPzwZW3MAIzU5gAbKUbbFs/1+FBZBS9MfxbqNIfEmG9tGmtFWHs61cHt1ts1RcRqQYz1WInK5f605CmKRpcSjtazca6Yo+eWG8BwqenGZDfwqzkUAmUJJZM7qmtDk/w1pKHxSn7AtO8lLPZ0cNVXemOW/syK+fqj01V4bTooyMfL/ruc0y/m2STf0DuTzAIuGKdKva8Zu6bE6CSrU1d3IxmEPpLDA17YfXxFb6JABDDyclrjxmL49/3jTvyHcJ1VBC93mvS/1szDTtwfMgjbFhkOb9duteXrSKB+hD6IcyGo68ZO2WYG4DkurNBa2Qp2psONJXML5a8AMjOO2WZD2ruTqqZslzkNvKXkrC1NkGd2tuwdJ/KaUsM9DL6lEFZDkzCwpvUi2NQEO+/3UIxdsqKYq0vksYLVAjor7Uw/+3nJkZo38ZS1agWT7YX/M4ncchwoLogPC/p8n16GCNzOBYLWGMAzwYAE0CXGQ0kbJoaIrrSjbmPuBO4VLkV1P8/VSkoaekyD+Hs3MiIC2r4MTxOedVznrh/hakWVU/8uOOu6RriNrZEtt9NT148rAW/hwIniOoA24V8c9NkXe4ha0VrPFeBe7r3u4UUh
 JfPscBBYaneIQlEa1gEvWhFyMhP1ZWr3BHBgKBBMgwoS1IaXHF8vc62Dui+9u4B4IYW05n/abR4bt1smi4rcV40/sn1ZyVXjMHTIc35fDdAxMXFzsBIRHAQKq3Gr9NNxtTsBG23uY9cQpmcYUuIu5EKrVIqcwjJWBoQS520yWT3kIztccvatMOCZ8lehtEDVUauifXiMn5JP8KEEHWm+unFXaIlJWdBK5jW6bxqstU+etZJOrKGebg1pRFbaz0k+71hvv31Tg2eABWu9eGpgdDqA+LkgvoxON6HqCmz6+gu7vZAKWJjZPCXnSgdmTrMmbUr5Co7Tmk2pmfPW615kMW4JO78sPHag13DWBGZ+hwhgJHOCboBjMMiaDy9fvuOadN2ZwFmc0Z2QmWhhG1Jq6OGEVzd1+THcOxGZ6B0JxdblbY7LkZi0HZH2HMexXieGERKpSpImS9pwHXQ17XDGI+WCZO/Oe0yXJRirfAFWMUxniMStqG8Uby58x4EF5giW7AkSlJ2J4QcjIg9YYgxkuai8gdzD24v2FEIny/jFc1hdEPCHUtM+niVxLq/Ua6ZdKwiey3mp1kvxhA55hKscOESnRMTJhbS934VsjZmQkTRHEWXSRw3OAivLgwTG+UKaXrMsbrwKDSyLLIgbtGlY6PckeTEkcTeQsS6iH+y7vtF6syhKtKlnTX/iKJHy53+F1N6KP9lbWVNPTaswrh9RWw==
X-OriginatorOrg: kalrayinc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d079561b-727b-4847-f625-08dcc38cf642
X-MS-Exchange-CrossTenant-AuthSource: PR0P264MB3481.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:02:17.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8931925d-7620-4a64-b7fe-20afd86363d3
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1TQ/BYE4gqhzUYpnhZXdiQsb1n6BALEjkRnzHh2LNtiKOOFreumPftIkAe4nsDKgGB6fXes3v98N3L1n5SIVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB4620
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_090237_373347_38CFB065 
X-CRM114-Status: GOOD (  18.37  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gQ2hyaXN0b3BoLAoKT24gMjIvMDcvMjAyNCAxNjo1OCzCoENocmlzdG9waCBIZWxsd2ln
IHdyb3RlOgo+PiArI2luY2x1ZGUgIi4uLy4uLy4uL2RyaXZlcnMvaW9tbXUvZG1hLWlvbW11Lmgi
Cj4gVGhpcyBpcyBub3QgYSBwdWJsaWMgaGVhZGVyIGFzIHlvdSBjYW4gZ3Vlc3MgZnJvbSB0aGUg
ZmlsZSBwYXRoLgoKWWVzIGluZGVlZCB0aGlzIGlzIG5vdCAiY29ycmVjdCIgaG93ZXZlciBJIGRp
ZG4ndCBrbm93IGhvdyB0byBkbyBpdCBwcm9wZXJseSBzbyBJIGFtIHNlbmRpbmcgdGhpcyBhcyAi
UkZDIiB0byBnZXQgc29tZSBoZWxwIHRvIGNsZWFuIHRoaXMgdXAgcHJvcGVybHkgOikKCklmIEkg
dW5kZXJzdG9vZCBjb3JyZWN0bHkgdGhlIHJlbWFpbmluZyBwYXJ0IG9mIHlvdXIgcmV2aWV3OiBp
bmNsdWRpbmcgdGhpcyBoZWFkZXIgaXMgbm90IG5lZWRlZCBhbnltb3JlIHNpbmNlIHdlIGRvbid0
IG5lZWQgdG8gY2FsbCBgaW9tbXVfc2V0dXBfZG1hX29wcygpYCBhbnltb3JlLgoKU28gbGV0J3Mg
cmVtb3ZlIGJvdGggdGhlIGluY29ycmVjdCBub24tcHVibGljIGhlYWRlciBpbmNsdWRlIGFuZCB0
aGUgY2FsbCB0byBpb21tdV9zZXR1cF9kbWFfb3BzKCkuCgo+Cj4+ICsJc3dpdGNoIChkaXIpIHsK
Pj4gKwljYXNlIERNQV9UT19ERVZJQ0U6Cj4+ICsJCWJyZWFrOwo+PiArCWNhc2UgRE1BX0ZST01f
REVWSUNFOgo+PiArCQlicmVhazsKPj4gKwo+PiArCWNhc2UgRE1BX0JJRElSRUNUSU9OQUw6Cj4+
ICsJCWludmFsX2RjYWNoZV9yYW5nZShwYWRkciwgc2l6ZSk7Cj4gRG9pbmcgdGhpcyBqdXN0IGZv
ciBiaWRpcmVjdGlvbmFsIGlzIHdlaXJkIHVubGVzcyB5b3VyIGFyY2hpdGVjdHVyZQo+IG5ldmVy
IGRvZXMgYW55IHNwZWN1bGF0aXZlIHByZWZldGNoaW5nLiAgT3RoZXIgYXJjaGl0ZWN0dXJlcwo+
IGluY2x1ZGUgRE1BX0ZST01fREVWSUNFIGhlcmUuCkluZGVlZCBvdXIgYXJjaCBuZXZlciBkb2Vz
IGFueSBzcGVjdWxhdGl2ZSBwcmVmZXRjaGluZyBvbiBkYXRhLgo+Cj4+ICsjaWZkZWYgQ09ORklH
X0lPTU1VX0RNQQo+PiArdm9pZCBhcmNoX3RlYXJkb3duX2RtYV9vcHMoc3RydWN0IGRldmljZSAq
ZGV2KQo+PiArewo+PiArCWRldi0+ZG1hX29wcyA9IE5VTEw7Cj4+ICt9Cj4+ICsjZW5kaWYgLyog
Q09ORklHX0lPTU1VX0RNQSovCj4gVGhpcyBzaG91bGQgbm90IGJlIG5lZWRlZCByaWdodCBub3cu
ICBBbmQgd2lsbCBiZSBjb21wbGV0bGV5Cj4gdXNlbGVzcyBvbmNlIHdlIGRvIHRoZSBkaXJlY3Qg
Y2FsbHMgdG8gZG1hLWlvbW11IHdoaWNoIHdlIHBsYW4KPiB0byBkbyBmb3IgTGludXggNi4xMi4K
QWxyaWdodCwgbGV0J3MgcmVtb3ZlIHRoaXMuCj4KPj4gK3ZvaWQgYXJjaF9zZXR1cF9kbWFfb3Bz
KHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCBjb2hlcmVudCkKPj4gK3sKPj4gKwlkZXYtPmRtYV9j
b2hlcmVudCA9IGNvaGVyZW50Owo+PiArCWlmIChkZXZpY2VfaW9tbXVfbWFwcGVkKGRldikpCj4+
ICsJCWlvbW11X3NldHVwX2RtYV9vcHMoZGV2KTsKPj4gK30KPiBBbmQgdGhpcyBzZWVtcyBvZGQs
IGFzIGlvbW11X3NldHVwX2RtYV9vcHMgaXMgY2FsbGVkIGZyb20gdGhlIGlvbW11Cj4gY29kZSBh
bmQgeW91IHNob3VsZG4ndCBuZWVkIGl0IGhlcmUuCkxldCdzIHJlbW92ZSB0aGUgYGlmIGRldmlj
ZV9pb21tdV9tYXBwZWQoZGV2KSkgaW9tbXVfc2V0dXBfZG1hX29wcyhkZXYpO2AgdGhlbi4KPgo+
IEkgYWxzbyB3b25kZXIgaWYgd2UgY2FuIGNvbWUgdXAgd2l0aCBhIHdheSB0byBkbyB0aGUgLT5k
bWFfY29oZXJlbnQKPiBzZXR1cCBpbiBjb21tb24gY29kZSBhbmQgcmVtb3ZlIGEgZmV3IG9mIHRo
ZXNlIGFyY2ggaG9va3MgZW50aXJlbHkuCgpUaGFua3MhCgpSZWdhcmRzLAoKLS0gCgpZYW5uCgoK
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
