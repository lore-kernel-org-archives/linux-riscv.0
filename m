Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480D2C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 10:12:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA91C601FA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 10:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA91C601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AbLK9+Lx19KC7grHHrj0ByIexN6AsoP32wqWg28TTmk=; b=SmSOdF2UXxQ77MJKF0pLOGJXM
	r3tn0OvxgiFij4HJ9ulkNTYjYRd4jh/yFyqXCTDHI1a4RVvBmLFL79ARi3jEF1Pn/nIFSs39Rnzwm
	jXWHRWNTdG0+VUZo2fE9HLMAFq9lbcq5x1PdlLdm1eXVtVo43cYwm0eXWl4c2Du6XhQXAm5/0WoW0
	e0cikLT9XTVPVIC3xSOO5exjEAP/uMouajiU0WKz2YePbQrSojx6kfBFNuKofwXTS6AnUXallnrj8
	LbFowp63IfyDX2lP/f4A1Dnzv/S27woGn6ZUaORJuEZmmCx6mHcAgTuNsAT9vZM+LaUN5EY0wp7k1
	TCEMJO97A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljJBl-003ZM3-8A; Wed, 19 May 2021 10:12:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJBh-003ZLd-1m; Wed, 19 May 2021 10:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6gsim/e0/sH9sRE2x3oYlLhZp/gycpL6fdCJ0rKcCfI=; b=ncw7TxuKvu5zHyMlPIxEjKEMdX
 upB3EzZ7LYc2IUaqmlQ/ri/fqSzC7qLOvzQd1ZvUM7rUVczfNWzimFqKarZdjanE3LAJlB646Veml
 LkLqLYc9erXs3pNI/8SHVLvd7BHfPLeoN28JiD9Hcz2ma3Lxzc5yD3LctYE0p2jNGtk33Gi9XjFEh
 8mGb1bGdno3yTKA8t9O/DRoPv+XB5hqzoawoaFuwzGFuLvUxzklRnjRln6iuFwc4Ae7zcjS8EUv8X
 QxoaE7y9a511+uvkpDPR/8geDh2Q+M4si7W6h6AIl5neA9avF3CkkjWf01b46kc+4GXMnB0WrO+rV
 Ohmuod9g==;
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJBe-00FLic-H7; Wed, 19 May 2021 10:12:23 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14JA5s92172229;
 Wed, 19 May 2021 10:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=6gsim/e0/sH9sRE2x3oYlLhZp/gycpL6fdCJ0rKcCfI=;
 b=ZOSUzB3wfVT+wwlxiEyP65q9MBH04b0KUtz4yyL5ohKOjcQWQO/8I2nvkJPVMbT739wc
 OOxoQbDijP2zonVyzn2dKNswF5fen5zKZx2vuAOu71nJ4+pfPm13FvOvvuRHSiroUBty
 wDtH3R8sHeAUsfZgE/KiJZZ7S3kn1YGwHI0RplQod7rbI44cTKS2sB8//H+HUg/b+MGy
 doOJ+ebnvXCtT6ZW7MLOjmg0D4C5t6KuFtYdD+ONzlCTsqXicHp0CBIuTr22fquGrNhQ
 2kLTHvXe7NS6N6UkRjkqQiKnfSdYVTU6CcxSzVWAnGYZ7VHqXYvXPX5ugKyIBZUdoIN6 4g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 38j6xnh1qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:12:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 14JA5s0Y045768;
 Wed, 19 May 2021 10:12:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38mechqcxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:12:14 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14JA6WwH053027;
 Wed, 19 May 2021 10:12:14 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 38mechqcw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 May 2021 10:12:14 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 14JACALZ006865;
 Wed, 19 May 2021 10:12:10 GMT
Received: from kadam (/41.212.42.34) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 May 2021 03:12:10 -0700
Date: Wed, 19 May 2021 13:11:49 +0300
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
Message-ID: <20210519101149.GS1955@kadam>
References: <20210519033553.1110536-1-anup.patel@wdc.com>
 <20210519033553.1110536-15-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519033553.1110536-15-anup.patel@wdc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-GUID: cHcD0Ne08M-eDvFMU9La0STty0w6mH1R
X-Proofpoint-ORIG-GUID: cHcD0Ne08M-eDvFMU9La0STty0w6mH1R
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_031222_726891_20B8AE57 
X-CRM114-Status: GOOD (  17.01  )
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
>  static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>  				  const struct kvm_one_reg *reg)
>  {
> @@ -427,6 +519,12 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
>  		return kvm_riscv_vcpu_set_reg_csr(vcpu, reg);
>  	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
>  		return kvm_riscv_vcpu_set_reg_timer(vcpu, reg);
> +	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
> +		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
> +						 KVM_REG_RISCV_FP_F);
> +	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
> +		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
> +						 KVM_REG_RISCV_FP_D);
>  
>  	return -EINVAL;
>  }
> @@ -442,6 +540,12 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
>  		return kvm_riscv_vcpu_get_reg_csr(vcpu, reg);
>  	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
>  		return kvm_riscv_vcpu_get_reg_timer(vcpu, reg);
> +	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
> +		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
> +						 KVM_REG_RISCV_FP_F);
> +	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
> +		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
> +						 KVM_REG_RISCV_FP_D);

These have become unwieldy.  Use a switch statement:

	switch (reg->id & KVM_REG_RISCV_TYPE_MASK) {
	case KVM_REG_RISCV_TIMER:
		return kvm_riscv_vcpu_get_reg_timer(vcpu, reg);
regards,
dan carpenter


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
