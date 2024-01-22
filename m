Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33816C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 17:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xAzUyIuM+Mlj0qxwj3NPOrIQuyGRF7SlEb57p5mZco=; b=YY6vuNNYYZuOFV
	z7vViZiCk7wXzeoP2445nRIiLd0X1WSL++66Qp5/y5TuY6vVs4WX6oE94eaz+a+9rTRc8oJ50I0dU
	+hgDhk0hosyDvEjk4EnORYMu5My0/XJmz7vB3gg+i5zWOdMDp5P/Oabd4bFm/IBNUfkQGtCKAhxd4
	vuiq5axsuUIpLXoQ8hRDKLx+3O3thunZ7IG6rpnTkcUjURAGjl3RdZJjFuPGldZIZlXu17Z0X9tNL
	HDsHBSwVHLuw0hSmET6kIHh+D478+FC3WyZ69kBEzebnGeOdZmzPUQUpjdZCaZz+y8VURZB4JLVMX
	WpeZOf/LHYLDOCDyN4KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyMi-00DKh0-1u;
	Mon, 22 Jan 2024 17:45:44 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyMf-00DKaM-2p
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 17:45:43 +0000
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTPS
	id RqM7rZKTa8uLRRyMSrPaoe; Mon, 22 Jan 2024 17:45:29 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id RyMRrMe8V55BJRyMRrEUbF; Mon, 22 Jan 2024 17:45:28 +0000
X-Authority-Analysis: v=2.4 cv=QcR1A+Xv c=1 sm=1 tr=0 ts=65aea9b8
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=NEAV23lmAAAA:8 a=7YfXLusrAAAA:8 a=lWKqt4ZwYMmOSQLAUVkA:9 a=QEXdDO2ut3YA:10
 a=9cHFzqQdt-sA:10 a=PUnBvhIW4WwA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=SLz71HocmBbuEhFRYD3r:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nzXgY+4E9/m1cHPFb6LChwOFY++sdTtbwz4YGbTrgRc=; b=n3+7wiRP+JuxvMMGo4qhp0XaKk
	ntYdQmu1vPL0HRLzb0Xjgsu5gVfpRgPAGCi3iU7g3a6+4XzF7KY0H8WEyi7NVc5ZUK/6ODe+JJL03
	gtl7koEXVSWVIxh9BrwWRdPNYICBEOgSEObEJZlMzWGTOJ6IaFoKW9NboFe+oloOUicVrmpSYhjOb
	3jZzqCJBY622cN9gleh/XZFh/AA723zNBf0XJ3XKDB/GCecp/YKxFp6teZmmLNwinrAit76vPFEIJ
	bowEh1zBADupQW7qH+6hWqsJONUbtRHWyLVuYFSE928EK5739PtY9OgrFeSAV2zBYRDzeDaoUgvA+
	2U6fAAMA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:41722 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rRyMP-0019jE-22;
	Mon, 22 Jan 2024 11:45:25 -0600
Message-ID: <fd635112-c960-49a9-807f-692f47be46ed@embeddedor.com>
Date: Mon, 22 Jan 2024 11:45:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Use kcalloc() instead of kzalloc()
Content-Language: en-US
To: Erick Archer <erick.archer@gmx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 Jisheng Zhang <jszhang@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20240120135400.4710-1-erick.archer@gmx.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20240120135400.4710-1-erick.archer@gmx.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1rRyMP-0019jE-22
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:41722
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfH501a4iPQPyKke0MfDB3ueUnsMxDuCkBjcI8rHmGPQNC2PAXlrjGJ8GjjRAeILyvshQQ/809emnVnUcTmBAOyWAlbDaF2yS2cziiz/T4ON9X+snZo5+
 iTXh+in4iAEqjop06VJUH71JSmdm4QmfbcS37bJn1MeUgjSLAnX8XxG+14oFUzd3R0M6fHqIN8rJcC8/XyqhDQqBqiDHdvzqOL3GhfWTtdCax/YKEgL4ix/H
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_094542_023169_DC92866D 
X-CRM114-Status: GOOD (  14.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 1/20/24 07:54, Erick Archer wrote:
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
> 
> So, use the purpose specific kcalloc() function instead of the argument
> count * size in the kzalloc() function.
> 
> Also, it is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not change the
> former (unlike the latter).
> 
> Link: https://www.kernel.org/doc/html/next/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments [1]
> Link: https://github.com/KSPP/linux/issues/162
> Signed-off-by: Erick Archer <erick.archer@gmx.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
-- 
Gustavo

> ---
>   arch/riscv/kernel/cpufeature.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 89920f84d0a3..549a76e34c4e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -901,8 +901,7 @@ static int check_unaligned_access_all_cpus(void)
>   {
>   	unsigned int cpu;
>   	unsigned int cpu_count = num_possible_cpus();
> -	struct page **bufs = kzalloc(cpu_count * sizeof(struct page *),
> -				     GFP_KERNEL);
> +	struct page **bufs = kcalloc(cpu_count, sizeof(*bufs), GFP_KERNEL);
> 
>   	if (!bufs) {
>   		pr_warn("Allocation failure, not measuring misaligned performance\n");
> --
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
