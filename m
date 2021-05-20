Return-Path: <SRS0=83+V=KP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F24C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 06:10:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F770610CC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 06:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F770610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v1YF1p1xDvqocBZe7iRdWllMHjv89u+gWHk6Scuomew=; b=G/GXU+oSz0aQf3nEcw3f+dBPA
	MCV3QC80fQe7HJzSGW1ncY3n/x7bc2dC5r4/MjVDvPl423IttsJVFqZFxrZJUzlduadyZdLFCDs3N
	7N6ADPXIInmj1jswns/+AmmSQPgEflGvZ91q5eZLv0U0Ph6u8iHoJ0x//ki3PRI+iYIWWGF76pU08
	7f7dNiDwRJOOqqbrSpeNtXNjfmOspYtkjDIYrW9oD1OM/A/dT1e07bBmy2xw37yH8uvgwNQmIyb1C
	hkEqWhN7q+c3Acl+NxhLYwlk5ZJbYW4qriDNx3JlKaLlwaCZiylFro0G9nglthSHJnKpmsyaYPX4Y
	yKjh2+R9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljbsc-0061IC-Fm; Thu, 20 May 2021 06:09:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljbsX-0061Hv-Q6; Thu, 20 May 2021 06:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=C3pB+KzMdD3b0417cIrmppeRfZmYwgPZJocfpwURt2A=; b=JTuXbPem8yMG752JcYnTPEBl7O
 NqiONTOEe7FA2xNl/EKuZ5igeuavizwZJ8faSLPtMOQ2OrrTW7CeVSkhi0+WAcq2YcoXAtS1OjVzb
 JdCw22DSilap47kkNT0n/o960QEoau0kuvOzCcY2OXKB+zHxI/pXknB+r97EBIdWRqIM+/Da3cg/W
 BAmxUehTDn6UfUN1VLlaxf7aLscxAhBbo5v2Y5GOcYgcuAJk255ZMzTmWctpN45GlA7XhIkGYVGp+
 e+4EeTZlu0zlZKPY7Y5taZI0UU10SfMZ/Un2xXuUBhnNDs039JSmcGr6VYQfabKMmf7pKSsalLKl/
 3stGvrDg==;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljbsV-00Fyg0-3K; Thu, 20 May 2021 06:09:52 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14K64xCv172268;
 Thu, 20 May 2021 06:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=C3pB+KzMdD3b0417cIrmppeRfZmYwgPZJocfpwURt2A=;
 b=Uj5iEah6/9+7vmZDuhlUmzNkfBsXjRjnLJBx5h+fasApSO+IKTXWC7f383eXNnc6tBgC
 vwlLx9lE6M4iJYhWSkG9s7IQoTNXHL0V43tIbsiSalHqK1KNMbJVD82xsGVp/Vn79tfF
 uyMSQY5AbB7IxgqepPhV33H2wDblobzbXmEERKUcuLNQL7tFIZE+qKz2/eu7v/vgz3XE
 6eR7z0c95gZ2sriBvv5sprhGiYeB2ov5iU1AeBK/DDjxdJBSLVanzS8RG7v/PBiL0O/5
 ZYfrcN+qTrpQzpkyu6zCOR6ErGYKvHluznh8RosMlTr/jjfXvZhpxplwx4XNejsrWCEo HA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 38j68mkhub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 06:09:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14K65HuG081994;
 Thu, 20 May 2021 06:09:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38meegpt7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 06:09:42 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14K699cJ089457;
 Thu, 20 May 2021 06:09:41 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 38meegpt7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 May 2021 06:09:41 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14K69b6S010834;
 Thu, 20 May 2021 06:09:38 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 May 2021 23:09:37 -0700
Date: Thu, 20 May 2021 09:09:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Anup Patel <anup.patel@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v18 14/18] RISC-V: KVM: Implement ONE REG interface for
 FP registers
Message-ID: <20210520060924.GD1955@kadam>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <20210519033553.1110536-15-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519033553.1110536-15-anup.patel@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-ORIG-GUID: 9oEaeiTajIB3mCxzFbzpy6mDX4kz6VAg
X-Proofpoint-GUID: 9oEaeiTajIB3mCxzFbzpy6mDX4kz6VAg
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9989
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_230951_256247_187D6848 
X-CRM114-Status: GOOD (  18.49  )
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

On Wed, May 19, 2021 at 09:05:49AM +0530, Anup Patel wrote:
> +static int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
> +				     const struct kvm_one_reg *reg,
> +				     unsigned long rtype)
> +{
> +	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
> +	unsigned long isa = vcpu->arch.isa;
> +	unsigned long __user *uaddr =
> +			(unsigned long __user *)(unsigned long)reg->addr;
> +	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
> +					    KVM_REG_SIZE_MASK |
> +					    rtype);
> +	void *reg_val;
> +
> +	if ((rtype == KVM_REG_RISCV_FP_F) &&
> +	    riscv_isa_extension_available(&isa, f)) {
> +		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
> +			return -EINVAL;
> +		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
> +			reg_val = &cntx->fp.f.fcsr;
> +		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
> +			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
> +			reg_val = &cntx->fp.f.f[reg_num];
> +		else
> +			return -EINVAL;
> +	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
> +		   riscv_isa_extension_available(&isa, d)) {
> +		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
> +			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
> +				return -EINVAL;
> +			reg_val = &cntx->fp.d.fcsr;
> +		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
> +			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
> +			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
> +				return -EINVAL;
> +			reg_val = &cntx->fp.d.f[reg_num];
> +		} else
> +			return -EINVAL;
> +	} else
> +		return -EINVAL;
> +
> +	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
                           ^^^^^^^
It sort of bothers me that if this copy fails then we have no idea
what garbage is in reg_val.  It would be nicer to copy it to a temporary
buffer and then memcpy it when we know it's going succeed.

> +		return -EFAULT;
> +
> +	return 0;
> +}

regards,
dan carpenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
