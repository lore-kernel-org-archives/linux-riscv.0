Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BF0C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 12:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DeOckfd3JmUw7PZFklCGo7Sb7o489XJIzm9yH3KTt94=; b=rY1sdQSXEV32/z
	og/cXqcfDvqGJg/R2iGDKLwirg/3i49kw68Qf9z0iUFcvNg8XlcaXYfssRPxl6r/UrdF1Sk+1QRwo
	Cm+VP/4KaKTCK07UJgvHK5g1PWCyfFirDShpcvJVnAj+UQ+DE1B9Yyx1IsKW9fNYmN932t3jMf0+k
	nS+mvAb3gv6DimJ26UjKzavE6LY52OpQBJ4Sx5vCu6lZvVZZqt6oTrNqvMpP5UgkQYbbpghu8oH4m
	3WSUWWi7Z+Z/8FK9np6bSuhdlZhgzZ4maJNAtbuHhzjfFAna4UXEg9Bza0C3OqGp16ntuDLNBRWFs
	ZlpxBq6ORWTKbS8Kl4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqZag-00HN6n-Th; Thu, 03 Nov 2022 12:45:02 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqZaT-00HN28-Hq; Thu, 03 Nov 2022 12:44:51 +0000
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3CX835020205;
	Thu, 3 Nov 2022 12:44:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=uYDsL2AQLo2gEk9VMtnHMz5LcVdQt/v0CP0hVvqvaOs=;
 b=fQBQSq4M9hUH6hNCROmGwAedSYH9ER8bHfHCPj0cCnKvVlHIlxWk/0wVP5/3zwqiuuc2
 ANE0sKOM7mryjhS+H8v0Tm4/1obUDMop3BsqyWHwnoi77A2nLHSFQYENpt+kJ50/UCuW
 z8mBFAFnJN4Xb1jr0J6+7psniFA/+y5nlA9C9iWRddzKhblyjvITFClY/wicbPA/GOek
 AiFuUOIZ+8i1zgbUEYLKwpSfg6jTnv3DWSpYGfeNao51BGy9bx2nE9fi+afM6FPS9MFO
 MrmPJMnBfg11O+jpwBwwNPMy5RT+dSHFcvHqw7cHGjozWT0zUEwcG0OdqAzLNSfPusnM ng== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km6pgwuns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 12:44:25 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A3BZkjw024656;
	Thu, 3 Nov 2022 12:44:24 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3km6pgwum9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 12:44:23 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3Cad2W023877;
	Thu, 3 Nov 2022 12:44:21 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3kgut98raf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Nov 2022 12:44:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A3CiIcr28902062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Nov 2022 12:44:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5221CA404D;
	Thu,  3 Nov 2022 12:44:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54AA9A4040;
	Thu,  3 Nov 2022 12:44:17 +0000 (GMT)
Received: from p-imbrenda (unknown [9.152.224.56])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  3 Nov 2022 12:44:17 +0000 (GMT)
Date: Thu, 3 Nov 2022 13:44:15 +0100
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Paul
 Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Christian Borntraeger
 <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Matthew
 Rosato <mjrosato@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Vitaly
 Kuznetsov <vkuznets@redhat.com>,
        James Morse <james.morse@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        Atish
 Patra <atishp@atishpatra.org>,
        David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Isaku Yamahata
 <isaku.yamahata@intel.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Michael
 Ellerman <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,
        Thomas
 Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
Subject: Re: [PATCH 25/44] KVM: s390: Do s390 specific init without bouncing
 through kvm_init()
Message-ID: <20221103134415.5b277ce9@p-imbrenda>
In-Reply-To: <20221102231911.3107438-26-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	<20221102231911.3107438-26-seanjc@google.com>
Organization: IBM
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SwDaMXKcGFWnDzzjhR0txYibgdG-twbu
X-Proofpoint-GUID: 0Npk1PRgqNMEn0PTY6WCgakx0jlYm4dr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=851 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_054449_993455_C2C15452 
X-CRM114-Status: GOOD (  29.50  )
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

On Wed,  2 Nov 2022 23:18:52 +0000
Sean Christopherson <seanjc@google.com> wrote:

> Move the guts of kvm_arch_init() into a new helper, __kvm_s390_init(),
> and invoke the new helper directly from kvm_s390_init() instead of
> bouncing through kvm_init().  Invoking kvm_arch_init() is the very
> first action performed by kvm_init(), i.e. this is a glorified nop.
> 
> Moving setup to __kvm_s390_init() will allow tagging more functions as
> __init, and emptying kvm_arch_init() will allow dropping the hook
> entirely once all architecture implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/s390/kvm/kvm-s390.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 7fcd2d3b3558..e1c9980aae78 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -461,7 +461,7 @@ static void kvm_s390_cpu_feat_init(void)
>  	 */
>  }
>  
> -int kvm_arch_init(void *opaque)
> +static int __kvm_s390_init(void)
>  {
>  	int rc = -ENOMEM;
>  
> @@ -519,7 +519,7 @@ int kvm_arch_init(void *opaque)
>  	return rc;
>  }
>  
> -void kvm_arch_exit(void)
> +static void __kvm_s390_exit(void)
>  {
>  	gmap_unregister_pte_notifier(&gmap_notifier);
>  	gmap_unregister_pte_notifier(&vsie_gmap_notifier);
> @@ -533,6 +533,16 @@ void kvm_arch_exit(void)
>  	debug_unregister(kvm_s390_dbf_uv);
>  }
>  
> +int kvm_arch_init(void *opaque)
> +{
> +	return 0;
> +}
> +
> +void kvm_arch_exit(void)
> +{
> +
> +}
> +

I wonder at this point if it's possible to define kvm_arch_init and
kvm_arch_exit directly in kvm_main.c with __weak

>  /* Section: device related */
>  long kvm_arch_dev_ioctl(struct file *filp,
>  			unsigned int ioctl, unsigned long arg)
> @@ -5634,7 +5644,7 @@ static inline unsigned long nonhyp_mask(int i)
>  
>  static int __init kvm_s390_init(void)
>  {
> -	int i;
> +	int i, r;
>  
>  	if (!sclp.has_sief2) {
>  		pr_info("SIE is not available\n");
> @@ -5650,12 +5660,23 @@ static int __init kvm_s390_init(void)
>  		kvm_s390_fac_base[i] |=
>  			stfle_fac_list[i] & nonhyp_mask(i);
>  
> -	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> +	r = __kvm_s390_init();
> +	if (r)
> +		return r;
> +
> +	r = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
> +	if (r) {
> +		__kvm_s390_exit();
> +		return r;
> +	}
> +	return 0;
>  }
>  
>  static void __exit kvm_s390_exit(void)
>  {
>  	kvm_exit();
> +
> +	__kvm_s390_exit();
>  }
>  
>  module_init(kvm_s390_init);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
