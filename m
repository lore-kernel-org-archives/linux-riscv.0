Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE1BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 17:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GgtFJHgldxtO80z2IWLypc4gHctpQNpVOw0MbTivs8=; b=q1QGiGv0Ur2m43
	43RLO8BoMqr244efg8UZ+ot87PbG14LiKX+2Ir6CE6J77n6tQYk6fyMoDODLn0ihM0oR3pHGbHsuO
	8usDs2f/Hbx0sr/AaxaXOpZH/qxrYOMFy8LVIvSjT9Li1Pqi9UChfUJytJghOhH+liueMzST9pcdh
	4iKbE71IyJ/FN0OR5h2+zO1DgFy42cqLy8BxMsWL2fePkZD7jSymIkzaMkoJWEQ0MRwKTJ899gAQg
	v1FUOtmrQg7ZUyOe5bM6GF+fpw/dufKimPYFsoXVwdtfvXpWhY/yWn5K5aF1v/UynuqpbGCkvMfuz
	C6ihuCP7aUbamwl0zX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZrp-00000006Hfy-0WcL;
	Thu, 01 Aug 2024 17:45:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZrH-00000006HZ4-1ZLB;
	Thu, 01 Aug 2024 17:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IdOVn5l+it30RRbFjFMhBnC4dWdN82ycxsYyW3WBHHM=; b=j7ES3NYeUB/qpKUZBgsBtVHLYd
	mCs262mP0aJkhGzyEIz48yNzb4TNcz6o8Jj8JA2YfwvpThmKds9BFBkbDVKCfaqqyncqY9/cIu49h
	Blwif9gi7JuAaMappA+bnRnIXG/1XTPI35F+HR4ZIQsIV3nGu0R4U8qn5JRi4lpmmrA3qr413cEXq
	OEkJVioYsc/s+9E3v9n1KAFxmINCP6A+CgysA0vxdf8fI532+HqG9TKI3qEYZhbAVv4WwSFW1x3E8
	rAZ/zBi9ikItVPVw+zF9Udt22x7BfDsgDgnOC4G0Z3+u7UFd1nCQ3IQHf24B4L4GKOhDHEjklmAvj
	w8mUCEyg==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZZrD-00000005XHo-26q8;
	Thu, 01 Aug 2024 17:44:58 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WZbrV0TrPz67WPF;
	Fri,  2 Aug 2024 01:42:18 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 22E93140B55;
	Fri,  2 Aug 2024 01:44:54 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 1 Aug
 2024 18:44:53 +0100
Date: Thu, 1 Aug 2024 18:44:52 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mike Rapoport <rppt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, "Borislav
 Petkov" <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand
	<david@redhat.com>, "David S. Miller" <davem@davemloft.net>, Davidlohr Bueso
	<dave@stgolabs.net>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, Heiko
 Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "John Paul
 Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>, Jonathan Corbet
	<corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt
	<palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring
	<robh@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
	<tglx@linutronix.de>, "Vasily Gorbik" <gor@linux.ibm.com>, Will Deacon
	<will@kernel.org>, Zi Yan <ziy@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-cxl@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-mips@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <loongarch@lists.linux.dev>,
	<nvdimm@lists.linux.dev>, <sparclinux@vger.kernel.org>, <x86@kernel.org>
Subject: Re: [PATCH v3 03/26] MIPS: sgi-ip27: ensure node_possible_map only
 contains valid nodes
Message-ID: <20240801184452.00007d30@Huawei.com>
In-Reply-To: <20240801060826.559858-4-rppt@kernel.org>
References: <20240801060826.559858-1-rppt@kernel.org>
	<20240801060826.559858-4-rppt@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_184455_703285_530142B5 
X-CRM114-Status: GOOD (  16.26  )
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

On Thu,  1 Aug 2024 09:08:03 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> For SGI IP27 machines node_possible_map is statically set to
> NODE_MASK_ALL and it is not updated during NUMA initialization.
> 
> Ensure that it only contains nodes present in the system.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  arch/mips/sgi-ip27/ip27-smp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/sgi-ip27/ip27-smp.c b/arch/mips/sgi-ip27/ip27-smp.c
> index 5d2652a1d35a..62733e049570 100644
> --- a/arch/mips/sgi-ip27/ip27-smp.c
> +++ b/arch/mips/sgi-ip27/ip27-smp.c
> @@ -70,11 +70,13 @@ void cpu_node_probe(void)
>  	gda_t *gdap = GDA;
>  
>  	nodes_clear(node_online_map);
> +	nodes_clear(node_possible_map);
>  	for (i = 0; i < MAX_NUMNODES; i++) {
>  		nasid_t nasid = gdap->g_nasidtable[i];
>  		if (nasid == INVALID_NASID)
>  			break;
>  		node_set_online(nasid);
> +		node_set(nasid, node_possible_map);
>  		highest = node_scan_cpus(nasid, highest);
>  	}
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
