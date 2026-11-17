Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B07606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 17:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y4hYDLhf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiPNgY+X;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VDipV8H8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aKEfuyqzOmLBnN92bPcSRHJ4hDapNwwWnUMSZi/HRQg=; b=y4hYDLhfyu70j6chzzBah+vXL/
	h66Efs4KJoBpND/NUqC9jCEXk5Ya4Bn5HO5f5LA/1ClvC0gc5ytPA1ekrGFik7YWWqVQkGj9aV7e4
	U6NUFv4mpOG2B1T82u7dnKniMuWPROnsvbW2dVS3JF7q6x4sRFO0XcmsF6hgPL71421lgJYr1BNiC
	U9Qi2W5mmxwf0qMqnNLGek8eWV1/8r45ok8qtq70taCQJV16DAds12U4NnHgyXwHalyYsKROv+tR6
	JkY+EhxCRy73k3q23I7JbliczH4b1KOepES5RN53rsDMiKeM5iqsDvjsc9TIH6bj6LQpgUeQZfHZK
	l2TlU3tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNSm-00000006iAA-1YWt;
	Tue, 17 Nov 2026 17:59:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNSj-00000006i9k-1kEA
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 17:59:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQeA31916197
	for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 17:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hdpv+Cv7ZBNO9I+6HoT8nAyHfxPrhmzzO1euuczH44Q=; b=KiPNgY+Xq9K21SfG
	3fEjB3drWi6zzyoIewogFQngiovoqU1eAPHtWcBNUcIOI1CJxijS+OqteJSXGH4X
	7Ol9r37XWjuXJJOBklZdN0Rpq3TR0W3GUwZuj6pCyq6uzPNYQ5j1NsCkxRIiJGVp
	fd56/G/DzgaT+NMgxUyrJgCZFskprYRmn4V/GgJYS96FkA3jLw0/KtDOsq1bcdgV
	F+fIfcKAniBqrtp47eWpCcmPa35HQHbMb0mk5f1YedxGzJFM251S9009BWSkuznY
	ZfrBueT9A4ZsJF6guzd+FcsEuXInbXHfYLdQ9V8/K3pqVVWlYKX5hirQ2KgrWuN6
	tpY0hA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0nc81xdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 17:59:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso422045eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 09:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794938359; x=1795543159; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hdpv+Cv7ZBNO9I+6HoT8nAyHfxPrhmzzO1euuczH44Q=;
        b=VDipV8H8/Zk8bepJYBhepiABUj4f5hLL2vnpXTABMbXqT5st2JbKJa2nHO3MR0i+d9
         Mb8tmLtG9qgU875kBjsgCZp+QhJTZBh0HROuEtkwz2hq1d6cgiucVH9stdnYJzRUDfCb
         qU0Gjbolp3ZJBRYUl0rEBB5gZ3CbKE7qg6HEce/wUAJ8P4C2t6Bx3i5MLTncZAzlbbal
         oHWMr0J6IBw1/dXiuOVaLCILPoCO0CZGGgY3L3+StqPBv+XQ8PnTLLxy7dbE/UrjeUnW
         Cqox2rSIRdljBLzhwa9hcJQ56Sp316UZ7YbydX340Gyfn1n0Y3VeYIZ5TBYcFWXE5RHg
         7kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938359; x=1795543159;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdpv+Cv7ZBNO9I+6HoT8nAyHfxPrhmzzO1euuczH44Q=;
        b=Px5mLdeEeXS2XlT8dirLZiiKyfxBJbjACnz+/nB7r6N2uy3YTw8swZTrHE5kTtlyXw
         2jpUd0qEHbs3IbXXVQ46fD05BI4R5L+VBjl12XyqRkZaHNHu01UhmRw49T7ZHx3o/TDu
         zEVMGP574gkBt+zIeXOuD6ZwL+YuKqhn4gmCd0pXQ0/1dfLWGVW9VtcGaTLLzpe36n4m
         H7sGTNaCm/RG2WTswjZFxJKTMXZBYtqwCi8vELfvd1piwDPzk9vn3Q7/KaqABDFtB3KA
         VQBogMuGJWma7Us/xkFtjos0HrWmDECCfv2LJzkUqh38CSPyfwi1ZMbxOzKnOk+SOFIp
         yq+g==
X-Forwarded-Encrypted: i=1; AL+hErESQGcm3MGTCGEBLNZVAxcdmmVln5pi6puUiy1QE73G7/EbSEyvBn0Gl3c5i2fMgEyhGM87v6QUWfreUQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+iBIRFI5ezZg5S2CIGF4qOsROSDHvh3/tpBG1XfbCwHPbuFp6m
	ea7+D99SN3CrxFNKebz05EDkaK3YYGoSXOccST27XCsokYGk46fw38M3DnHMOBbtcAwmZQG71mG
	npxz8oLgWd2dntQ9q+QcUWWnWM1vgC4hOXD8czxFXiUTmMahVybIhxdbnq96+HFyYD4emO+0=
X-Gm-Gg: AZFdTZdzRGrn2mXsbOBRKrRb47X16LrVlce9jpvrOFTuMhYfcsveBsKAxIJgUj7tswz
	qVWBW6+rePv53JOYKFhrqldCQuKbVQK+YmZO9TBXS/K2CbusmFlHAxCDtoUA19KaJdGAGRCWRep
	ewtXUClkGkPLabbZU4jnVNjxBprpO7EunsPFx2N5nEWLg8qn12R4XNac+r30PTKFwSnl48YDlJJ
	/nTG9lIT7mxZM62yYmtCQZboTzZrU+Bc7n2r4f9cY79mhinndhUT7n2EmOVk6N4PKBH9A+Xue64
	dSzOXlCVHNdCX9ba2CkxjJfGIdVaKTq2xW2mZKj5tHmKxpWi6dBn4Rj6odS4GxblQQVNQeCdWXS
	qsZ0F00gr4c++VRpoCgPrikzNb/MZJyEOPxIpZp1WzGzYc6tNJtKyvw==
X-Received: by 2002:a05:7300:ce93:b0:36a:1709:458 with SMTP id 5a478bee46e88-38280e29b80mr154453eec.27.1794938359086;
        Tue, 17 Nov 2026 09:59:19 -0800 (PST)
X-Received: by 2002:a05:7300:ce93:b0:36a:1709:458 with SMTP id 5a478bee46e88-38280e29b80mr154424eec.27.1794938358353;
        Tue, 17 Nov 2026 09:59:18 -0800 (PST)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm45168429eec.7.2026.11.17.09.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 09:59:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 01:59:01 +0800
Message-Id: <DMXOJEFHNR8A.SHYBI0NLEFPJ@oss.qualcomm.com>
Subject: Re: [PATCH v2] riscv: mm: Skip the icache flush for special PTEs
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Nickolai Zeldovich" <nickolai@csail.mit.edu>,
        "Paul Walmsley"
 <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou"
 <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Waterman"
 <andrew@sifive.com>,
        "Jisheng Zhang" <jszhang@kernel.org>,
        "Karl
 Mehltretter" <kmehltretter@gmail.com>,
        <linux-riscv@lists.infradead.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <owner-linux-mm@kvack.org>
X-Mailer: aerc 0.22.0.r39.g5d778487
References: <20261116022433.49952-1-nickolai@csail.mit.edu>
In-Reply-To: <20261116022433.49952-1-nickolai@csail.mit.edu>
X-Authority-Analysis: v=2.4 cv=LaipeTfi c=1 sm=1 tr=0 ts=6afc95f7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Bcon8dCWmj9BmVmNv9cA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3MSBTYWx0ZWRfXzmJeqBgmRdQC
 XO35GaBDW+52JknEV4vPIO3QDyvkhVZaB9mIC4A1E6B+vtCf8TTqwo2aMS9Odw5TSv7WAdGk9pK
 9wsTv+6MM2hgmT1be/GIPJV+DvqtcWE=
X-Proofpoint-GUID: Bxl1s58rwbBuWyUH3d0EhZqRYE4UVkN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3MSBTYWx0ZWRfX74RFnCQ++sMZ
 53bfZvyokOoVF1j7uXnxeLSCUJuGaUcpMKpGbr1WN6nOhKuiZlAcsLF0bcJffbsOe1ycwu7Fk8u
 scKCtwzYqEz3aGgdhRltvTttYtu9GOfi/anD8XRQgF69I79Bhvx0NnbIYueSrZjLvrYiLJrrBtY
 sq5vy8dbCb4Qw6/VTjS51hFEE4hSxYwwfPOz6vxwe1RG6lItsGS6Io7w4J6Aj2ImMJDAsCjbQ0e
 PrN3lc90i93rVHZQYjXokwEPeewlQZhzZXKhC5ZIuE6ZlhyESnyEGbmN0B2Ore0LhGjpCD+RmAg
 kIRf9X0DVCY4jESX1fczbQTDhwo/I+NaAieMgEsi+aQK1GbnSZYvfvaEh0pYCOfANUXvR9GgN9o
 Oz8qnhrW+RhhGY2kjVXBye2IOFwc2ZgpOD6QyvzieUev7N8EpMvSdkImHpmgYToTFA3DmLEMSNI
 KEA049G2qPgE8czF8ZQ==
X-Proofpoint-ORIG-GUID: Bxl1s58rwbBuWyUH3d0EhZqRYE4UVkN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_095921_486388_05ABEFD1 
X-CRM114-Status: GOOD (  25.90  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon Nov 16, 2026 at 10:24 AM CST, Nickolai Zeldovich wrote:
> An executable mmap() of memory outside RAM through remap_pfn_range() or
> vmf_insert_pfn(), such as /dev/mem or a PCI BAR's sysfs resource file,
> oopses in flush_icache_pte() with the page table lock held, and the task
> never exits. With FLATMEM the kernel instead sets a bit in whatever
> memory lies past mem_map.
>
> __set_pte_at() calls flush_icache_pte() for every present executable
> PTE, and flush_icache_pte() records the flush in the folio of
> pte_page(). A special PTE may have no struct page behind it.
>
> Skip the flush for special PTEs, as arm64 does since
> commit 71fdb6bf61bf ("arm64: Do not synchronise I and D caches for
> special ptes").
>
> Reproduced on QEMU virt with the riscv64 defconfig by mapping the PCIe
> ECAM window from /dev/mem with PROT_EXEC; the patched kernel maps it.

Tested on a SpacemiT K3 with v7.4-rc3.

mmap() of the pinctrl@d401e000 MMIO window from /dev/mem with
PROT_READ|PROT_EXEC oopses in flush_icache_pte() without the patch and
suceeds with it. PROT_READ-only mappings and anonymous executable pages
are unaffected.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

>
> Fixes: 08f051eda33b ("RISC-V: Flush I$ when making a dirty page executable")
> Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
>
> Notes:
>     Changes in v2:
>     - Reworded the source comment as suggested by Jisheng Zhang.
>     - Shortened the commit message.
>     - Rebased on v7.4-rc3.
>     
>     v1: https://lore.kernel.org/all/20261017013634.792220-1-nickolai@csail.mit.edu/
>     
>     This patch was prepared with the help of an AI coding assistant.
>     
>     Reproducer (QEMU virt, riscv64 defconfig, run as /init with /dev/mem
>     c 1 1 in the initramfs; 0x30000000 is the PCIe ECAM window, any non-RAM
>     range does):
>     
>       riscv64-linux-gnu-gcc -O2 -static -o test exec_mmio_mmap.c
>       qemu-system-riscv64 -M virt -cpu max -smp 2 -m 1G -nographic \
>           -kernel Image -initrd initramfs.cpio -append "console=ttyS0 rdinit=/init"
>     
>       unpatched: Unable to handle kernel paging request at virtual address
>                  ff1c000000c00008, epc : flush_icache_pte+0x5c/0xa2,
>                  ra : do_remap_pfn_range+0x284/0x3e6; the task never exits
>       patched:   mapped at 0x7fff8418b000, first word 0x00081b36
>     
>       #include <fcntl.h>
>       #include <stdint.h>
>       #include <stdio.h>
>       #include <stdlib.h>
>       #include <sys/mman.h>
>       #include <unistd.h>
>     
>       int main(int argc, char **argv)
>       {
>       	unsigned long phys = argc > 1 ? strtoul(argv[1], NULL, 0) : 0x30000000UL;
>       	volatile uint32_t *p;
>       	int fd;
>     
>       	fd = open("/dev/mem", O_RDONLY | O_SYNC);
>       	if (fd < 0) {
>       		perror("open /dev/mem");
>       		return 2;
>       	}
>       	printf("mmap(/dev/mem, phys 0x%lx, PROT_READ|PROT_EXEC, MAP_SHARED)\n", phys);
>       	fflush(stdout);
>       	p = mmap(NULL, 4096, PROT_READ | PROT_EXEC, MAP_SHARED, fd, phys);
>       	if (p == MAP_FAILED) {
>       		perror("mmap");
>       		return 2;
>       	}
>       	printf("mapped at %p, first word 0x%08x\n", p, p[0]);
>       	return 0;
>       }
>
>  arch/riscv/include/asm/pgtable.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 2ebd5fa5adc5..48eeeac1019b 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -624,7 +624,11 @@ void flush_icache_pte(struct mm_struct *mm, pte_t pte);
>  
>  static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
>  {
> -	if (pte_present(pteval) && pte_exec(pteval))
> +	/*
> +	 * Special PTE mappings are not intended to be executable and may not
> +	 * even have an associated struct page.
> +	 */
> +	if (pte_present(pteval) && pte_exec(pteval) && !pte_special(pteval))
>  		flush_icache_pte(mm, pteval);
>  
>  	set_pte(ptep, pteval);
>
> base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
