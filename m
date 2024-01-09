Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BFBC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jan 2024 13:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LMt9VAXhmlli9lpwpBiPUg0d3ciUi7XhDEqOUCtr6A=; b=4GucrfRsvH0krG
	njIY2lISvF1BMWFWNTvkByXSpezu5tCpE1rcBAWDiL9PXvB3fC/X0AOj7AUWtKa7aIPB7h41EnJ9n
	zmnDt7sEuDmlTDW5Sxgy+S6rcTcma+kD5kXDDLnMFKTfitQpFJWOizob2PkcgJfS7JczTkRSnG5r6
	J5/Iq5UzJycBOXqxj2zNQO3d6akI9ezp4nrNLFU2b/MEdSehv4vd6ZQd8WysMi9EV3uDcIR1qHwYJ
	IgIzTBYVcBsp2EGa8AICZU+EdYMH57FhQXmAeDF8C3TJxdobCqkK8TJfhCcS7ktcxlVDAxKT1aZ15
	Yxj7b5hHs/sDMMWCwlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNCVp-008QDA-0i;
	Tue, 09 Jan 2024 13:51:25 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNCVm-008QCW-1e;
	Tue, 09 Jan 2024 13:51:23 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 409Dgf03005564;
	Tue, 9 Jan 2024 13:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ymKWYi8Z65Trhul0I0GccChFLj4eXF904h1FUWP0hJQ=;
 b=k+bvkKpmf3iiMtK06hUlfeog0dywwVwG9vrrW3YdrQna6ysKZaPOUmcd4/JTXYJlV82v
 9YPynhoyzxJSuLCzq5ClOkYYhwBPjvh1jZA2aYhBCrTtxEK9VYdHZKl3Vm8o93xqtQvx
 8wFtGRLnuiZ8DAvvTOe8jhtrc8re455eBZ/Z+iqaNlByta0LWZQOnbuI18PiWYfHZU9r
 tWldBLm3rS4neEO8CmUdSxSIIi5rsleyjBFb5zUy0QdcmbKmsBuG8JkgapaZjqGuZpjH
 2A4erMBMNabpWj6HJbgXFgKyFZ2I51Hsry1Rkc7ohOT43/l5OIyOoHy+ZW7ATg8RXhb8 aA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vh78vg69w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 13:50:12 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 409Dh5i3006163;
	Tue, 9 Jan 2024 13:50:11 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vh78vg697-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 13:50:11 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 409D1SL9028052;
	Tue, 9 Jan 2024 13:50:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vgwfsjub2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 13:50:10 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 409Do73W23986828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Jan 2024 13:50:07 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BB6420043;
	Tue,  9 Jan 2024 13:50:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B27B620040;
	Tue,  9 Jan 2024 13:50:06 +0000 (GMT)
Received: from osiris (unknown [9.152.212.148])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  9 Jan 2024 13:50:06 +0000 (GMT)
Date: Tue, 9 Jan 2024 14:50:05 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-hardening@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-mm@kvack.org, steven.price@arm.com,
        Phong Tran <tranmanphong@gmail.com>, mark.rutland@arm.com,
        Greg KH <greg@kroah.com>
Subject: Re: [PATCH 4/4] ptdump: add check_wx_pages debugfs attribute
Message-ID: <20240109135005.7302-A-hca@linux.ibm.com>
References: <cover.1704800524.git.christophe.leroy@csgroup.eu>
 <2e8806da45a4b00249d5c449130b5f9ce78b3403.1704800524.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e8806da45a4b00249d5c449130b5f9ce78b3403.1704800524.git.christophe.leroy@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GWEkJgHDQrp2b62jDGJkkX_iMwFv_Sr-
X-Proofpoint-ORIG-GUID: MorbjN2VJcppxv7aT443XRfsyD1mKQHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_06,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=853
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401090114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_055122_577929_CEDD06C5 
X-CRM114-Status: GOOD (  23.09  )
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

On Tue, Jan 09, 2024 at 01:14:38PM +0100, Christophe Leroy wrote:
> Add a writable attribute in debugfs to trigger a
> W^X pages check at any time.
> 
> To trigger the test, just echo any numeric value into
> /sys/kernel/debug/check_wx_pages
> 
> The result is provided into dmesg.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  mm/ptdump.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
...
> +static int check_wx_debugfs_set(void *data, u64 val)
> +{
> +	ptdump_check_wx();
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(check_wx_fops, NULL, check_wx_debugfs_set, "%llu\n");
> +
> +static int ptdump_debugfs_init(void)
> +{
> +	debugfs_create_file("check_wx_pages", 0200, NULL, NULL, &check_wx_fops);
> +
> +	return 0;
> +}

Wouldn't it be better to have (only?) a readable attribute which triggers
this, and provides the result via this attribute?
That would allow for automated tests without having to parse dmesg.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
