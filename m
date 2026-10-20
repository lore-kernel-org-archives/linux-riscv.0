Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E6F606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Oct 2026 18:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c0RUJP1o;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PyLs4m/b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rPJYK1hCMNqkiBO9JkriQOyp1tDzvnbDMdnRrmyBSQA=; b=c0RUJP1oPofckQ/BG99hISmDqA
	elyRj9maO8yZrMFFLqliY4bxn1Is01jt+021DUE2uIY7LxT4h89h79qiq9ZwMmmIMr5WF8L6OB98y
	3KqtToIynLQqqjAd/HVU+rA/fG3k0zrgq1mvIAi++LE58xJUa8mNrplxaKo1DX/+ReyyAqHYwQRcu
	jOovPiZ1ul3rywpen5I3Q5e3XMp2k180Xo0ZYjvHBXUqbD2aLk9gvFxM4C3zhL+DDE66yVGM8gnxv
	i9UlhLGGUIStHzMNfdCjt9+oXjHvlmYA5zRIjTHOQdruag0gH4i35XgW0ipdHumHlVXlibyvvwx+U
	zhVkRerQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEuO-0000000ATw9-1CPz;
	Tue, 20 Oct 2026 18:50:00 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJEuM-0000000ATvd-1tLf
	for linux-riscv@lists.infradead.org;
	Tue, 20 Oct 2026 18:49:59 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KHEGYY2978623;
	Tue, 20 Oct 2026 18:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CUipg4
	fJiQC0gX8LVYNaRjwOaAjhAgEsBQ5MnjXNco0=; b=PyLs4m/bwKvEN1Xub2+nsy
	RvDztJMNx/Z+zoVjhqf3OXsUqlQyAwKi6Di8U1rhrdN+ORF9bIIUy2WpblIgKMrY
	wQz5uaGWAvaV+A7KvUL4yg9m/v9EDesHFCLuqNWzfGs8kRBM6IgqNGhQw8n0tdht
	eA+deQAvJRxk3pWNsU0LIS6ntBFtiTy68Ba6SbC3Pc87D2WQ25G8+09mz4Ij+aqj
	fYLWN3kFHFJa9s292QZL70nuHrDz+JW2NDEXBhYrt7nyY40OuZt07GGrc2GhUGlX
	1gCPfU03Slx8kl4J391XkgR2GEiNQu4gyoA19xotJcjdqMfJj0AXeYXgDD9RM+7w
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hdw5ammmp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 18:49:13 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69KH4pQG1836498;
	Tue, 20 Oct 2026 18:49:13 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4he8vhsb58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 18:49:13 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69KInCjW27787960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Oct 2026 18:49:12 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8711458056;
	Tue, 20 Oct 2026 18:49:12 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE8CB58052;
	Tue, 20 Oct 2026 18:49:10 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.74.192])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 20 Oct 2026 18:49:10 +0000 (GMT)
Message-ID: <f6829d2023573445b0906b34812e5b0bfdfb2e4c.camel@linux.ibm.com>
Subject: Re: [PATCH v2] kexec: Select ima_get/free_kexec_buffer() with
 CONFIG_HAVE_IMA_KEXEC(_OF)
From: Mimi Zohar <zohar@linux.ibm.com>
To: Roberto Sassu <roberto.sassu@huaweicloud.com>, catalin.marinas@arm.com,
        will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org,
        kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
        saravanak@kernel.org
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, noodles@fb.com,
        linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
        Roberto Sassu
 <roberto.sassu@huawei.com>
In-Reply-To: <20261020083727.1906495-1-roberto.sassu@huaweicloud.com>
References: <20261020083727.1906495-1-roberto.sassu@huaweicloud.com>
Date: Tue, 20 Oct 2026 14:49:10 -0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=X63Hu2Te c=1 sm=1 tr=0 ts=6ad7b7aa cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=i0EeH86SAAAA:8
 a=1ZqOMbZaXgEuhprhJ6sA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Ia0JIwvxgpSWbtDkRhI4dPoRvql5U3OQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA3NCBTYWx0ZWRfX6CxIfm/eOhQP
 +/wUaq+FQGOqNArpfZIrUA+k9rkfHNtq3LEC/MDGsUMQm3qiFtctCKcsB3g0dqzV/HMTrSQIcHS
 kh45avWcDz/fa+RP2uRW8fGU108iYPrT3oaL1/s8VqCXcyTI5mX9UO7rDq0gQiB05j54tUmphC5
 M3UcJKnVRjGR5yF0kTH+AndvbRuqhLZdXHW5xBZ63UpJUlNFZ1AmQFZZ7EjQIaYbCuxgzixRrQ4
 eA1AxoIEmsZQy6ehSvq9n5ynjA3GOuarZ2tJhvCrpsIWZZUbqTsIBLwtl23nBpUqhDTFfw9xvEL
 QBTaUenCPMupL6l8hjKV2oZW8fZ1wD/GoA5VHnl9m0fQzGO+tv8xrL/dlgroHuaczSHOq+fqX5E
 cpLrzXoAs3f5D20wkmuN/fXp+2uRCw2Ftp5wPit+Q/mAZN0Rv9mp3+/u1kRTBMxoWYlDJGKGZh2
 LBmMkOCw1SrNQ0gUpWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA3NCBTYWx0ZWRfX/pCk1z+OIKUf
 8bZpWSGlRHh+7LvRdNSDPEBz4dEG1doO2AZda9JjErBmhtY1k+w0Jzx8QJ2wYxxGwVf3bi3lXKC
 57cA1acf9WI/uIkewDh2r98mkDuuQnM=
X-Proofpoint-GUID: gj5Wz7vSF5n4aqUBRYZGldP83-pRH86l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_114958_610536_37AB5672 
X-CRM114-Status: GOOD (  19.26  )
X-Spam-Score: -2.6 (--)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-10-20 at 10:37 +0200, Roberto Sassu wrote:
> From: Roberto Sassu <roberto.sassu@huawei.com>
> 
> On x86, if CONFIG_OF_FLATTREE is enabled, the kernel uses the device tree
> implementation of ima_get/free_kexec_buffer(). However, x86 passes the IMA
> buffer location through setup_data, not through the device tree, so the
> buffer is never found and the IMA measurement list is not carried over
> across kexec.
> 
> Introduce CONFIG_HAVE_IMA_KEXEC_OF (which selects CONFIG_HAVE_IMA_KEXEC)
> and select it for the architectures that pass the IMA buffer location
> through the device tree, via of_kexec_alloc_and_setup_fdt() (arm64,
> powerpc and riscv). Build the device tree implementation of
> ima_get/free_kexec_buffer() only if the new option is enabled.
> 
> Select the new option also on LoongArch, to preserve the current behavior
> and avoid a link failure. LoongArch does not pass the buffer location to
> the next kernel yet; this will be addressed separately.
> 
> Finally, don't select it for x86, and use x86's own setup_data-based
> implementation regardless of CONFIG_OF_FLATTREE.
> 
> Fixes: b69a2afd5afc ("x86/kexec: Carry forward IMA measurement log on kexec")
> Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
> ---
> 
> v2:
> - Reworded the commit message (no code changes), suggested by Mimi

Thanks, Roberto.

The patch and now the patch description look good.  Can we get some tags?

thanks,

Mimi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
