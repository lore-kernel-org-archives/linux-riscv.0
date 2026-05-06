Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7C5CD3439
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ap1b/56n75CfwlGw41FX0XxrJ3dJYPYCrKFEN0oh7s=; b=SmJ14wCVrw5JVB
	rKwC8+rhJ2o1MXlJ3yA233GwS7uUGLPBjKCsM3GXJ9Q2GbtZd+mVPWmsjsjfiZIOrewC2TQtG3Ec8
	bO9NPaz0OmnGWsG2p3b7nySGHHXTyWUItrYQcx2Io9r3lWUh9epSOIl7NPImt58GjR1hsUe6rBT6S
	54IXVLH4AJPMvwjiRCEAwxc6zKWfRdqJj7hHihVG0W68asQ+UYijtbamM3AMXy5TwmxhiRbSE3bCf
	CaIUF06d8LcYFETvIlrVMMSVE0o0Z9+fHS+6jShfI3P1HheLR34SgZi9AKe0SEhJ7iXq9W3/s6bl+
	WaLbnlZGLPEJcO6mIzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkIe-000000029Qw-37D5;
	Wed, 06 May 2026 22:01:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKkId-000000029Q6-1BK8
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 22:00:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646KNWCb3036649
	for <linux-riscv@lists.infradead.org>; Wed, 6 May 2026 22:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aZPxIliVcF9OGztv2uIgcJGk
	CT8mmquqC1ZufniuUCE=; b=SR6oKNSlVvu5Oi4g7EAbzQbJqL70VeUZkFFoQr7d
	jBTGJhE+nNHV7VIPGBmbgJvVk94vulDk4vSyBaQdr0VA5aT4g8uEpcUXXT7q0JoP
	OLCwAnATUfCoKhuBlsGJh/kce1HoHHTpuvlgE5+SRwwPboydQTvpPsxucipuWjpQ
	FolwM6ppk6NBKBrvz+2DXaJ2ByuHnVvXZqsQDQ2fCsQREk9X3qC1J5H+Bg9UUqVE
	BBM+drUf+fkYJo30GFOq8SF3eOyE7GEYV2IQkMpPevkjuyf2D4P6FmTY8vPwBJeD
	ugUnK83b7jyBxEYuha1Q/Q7wi+mIbCd2p0uK02UclJEZMw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf245k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 06 May 2026 22:00:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2efc342ef15so248761eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 May 2026 15:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778104857; x=1778709657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aZPxIliVcF9OGztv2uIgcJGkCT8mmquqC1ZufniuUCE=;
        b=ioqgodY+dDiTJFHUXyEMe8E5w2i++IOAdSw32vsHMMHWy/yTrrtK6/2uwML54po07o
         8pcFA2uqyY7FS8klkWtNum/mF9txjDEal0gcGrgXAn6GitBK9oZ0S1krw5t1MIqD0GLV
         j/JFJgE5KTz8MIUasLIRamfsPCCTjn6DErwsPDxDUz+abdUHd49agcG+npJn7xV3jwRV
         d/8OP3R/yDRKS1IawXdLLZOjF4DUUwKVcGmkKT6Ax+KTjLh9Jx7vunN2mxS+jmrLu4gg
         AqZfGLVofo/sO6EphsJBVEbJL4I/BIhXuFAzIBlr/29Rf12sXK5fZ0wOGn+6YJXWlISm
         UoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778104857; x=1778709657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZPxIliVcF9OGztv2uIgcJGkCT8mmquqC1ZufniuUCE=;
        b=gYhmUMkQJCyOrYJAk4Hf8K8NXohrU0Sa8Ljq7TCr52Te8AchR4u5Jkaef7PJeZuSmu
         KAyiYeUVVf5fYogEploAr4n4Arp/ax9VyMp64pFQRf5AvuPZk1WiIgbz7qnJwTuy4Vq/
         dVUNstjWNPivDxqTreoSU6PjFEeCFedgfQmk2asbO+HK5RM70X1XNQpe03cmHA9WJym6
         ETDyDa5tjwz/nL+66mPjU1jYdpbKO92AlbQyYWMQuEZvaHZ2ie+CdAJe94j9LAjBPvT1
         pzRtkg69ikUfog1tj6r75+4PwqMl+nnqT3mYYhiAFNaaYjI5+q3HCC7S0IQqVHikTacD
         nVyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+LbVmOSz9dbr4jfRvt/vgZzMXjKsr6kbI+J6ICtlZVDItKrx28CFnTv2+VhhHuJRqBsVketAkrQUe1Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzN9s+k6Q5hirRH0icIQRqy5MtISjLdtH+SIKD3LJ3wPeS8HiC
	rBQRb3EiXaD1rEUlXcngsaWPHnENvmEkq+tffeevZeIbbWBWhS3XrFx26/oUi7UFDHjAQEILGqM
	VGjWXvgrRPEXs4m4Iutu3co9Ysz54ueYzpzemLsNY/0mEVZZWs/doBq9oT7F0NeZl/3GGr1Q=
X-Gm-Gg: AeBDievpAGDAIG8v9uuC3iB8grgPD4lcDeUliLI+oA22iNWKyfzTt+dC2Gsaqj68AEZ
	1wBQZUMvU/1Sb+DuKhuLw7lncDk9ShIyhKgeXGgIfBQXk2tYNZ7fOmsR13ZchiTtB40EGdq0wrI
	OPdM40h7cCoQKDgyZFthZGwugdHZTYlkwjXXClFcCn/nnlun5aKOPtJxqp2V9U1C96qNGZDWgwa
	cgbVh6u4RG7NkbAkAG2/HLzraAgli3a0KwUIZxnvLp65PIuwSP3t3aXnDFmo/Ztb9D9xcCOEdlF
	iv9IZdyBW+aOI9Jj5cf/AVgC++QkflTxJ3GOxD5fHNsItWp/yRG8uWDoN/rnu8ctPJQVCJI26+r
	ZmT5sELXSrxZwkOh4NjbXtiWbRXBg21SrQqQ0z3k/Gg==
X-Received: by 2002:a05:7301:9f03:b0:2f4:3a9c:819f with SMTP id 5a478bee46e88-2f54d79b972mr2873500eec.20.1778104857233;
        Wed, 06 May 2026 15:00:57 -0700 (PDT)
X-Received: by 2002:a05:7301:9f03:b0:2f4:3a9c:819f with SMTP id 5a478bee46e88-2f54d79b972mr2873464eec.20.1778104856617;
        Wed, 06 May 2026 15:00:56 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f5707734a0sm5901626eec.31.2026.05.06.15.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 15:00:56 -0700 (PDT)
Date: Wed, 6 May 2026 17:00:54 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, greentime.hu@sifive.com,
        vincent.chen@sifive.com, zong.li@sifive.com
Subject: Re: [PATCH] KVM: riscv: selftests: add check_supported_reg() into
 get-reg-list test
Message-ID: <kysjvcg5shcuhgsd44znceenfjw65djs4wviwp3psruq4t7n4c@ppj62upl26wf>
References: <20260503-kvm-get_reg_list-v1-1-c16f9b572e9f@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260503-kvm-get_reg_list-v1-1-c16f9b572e9f@sifive.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDIxNSBTYWx0ZWRfX52X/a23O0im1
 eb1HSO7GDma3drzJcyvihKPjoAS2dqg8jKK/7Yv4leQ81oxs2YLJG0MEuvPq2lbbZyVhZu0YQNo
 Cg5k5lP35KoRTatyS/dZ3dw264Xi83nArm4O9wlE2thnZKBLUsY+ngXoJh9o5k/NMJ8RcoFBJ3G
 pK6JSnz0fzy+DRv3ODodt73hqNP6Iw2jW3f201l2mASchD2ht/rJ8dwFtCx5LVy3VOEz2bauZWC
 LkndbV84kay/7ItmF7OraNLSq3gRtOK1PXoe1E2Y+OfYanCcDXh/oWIbm4ujPabPe7+8tBmNsoE
 18UnXlvLek8NAqOc40/clsbY1wAWVeXeHms1XCcnGILZWDLzxITKWd5kazH2Cjz8BvYS/RrgD4x
 K1LQHrYW/I/zQfCRymMbuBlmML5PSlBsl8EseHzrM37TDT79ttWpRj6DaUnVd+eE0X46ySSXXNO
 rf4aYItCXyRrCkVzrnw==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fbba1a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pFyQfRViAAAA:8 a=wBkBAAe1paUrZEgFcZ0A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-GUID: sUmHs6vRrdPxqk3Tsx_7ffVNyTxfR5qb
X-Proofpoint-ORIG-GUID: sUmHs6vRrdPxqk3Tsx_7ffVNyTxfR5qb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_150059_441164_248AF990 
X-CRM114-Status: GOOD (  21.07  )
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

On Sun, May 03, 2026 at 09:00:53PM -0700, Yong-Xuan Wang wrote:
> Not all the registers in a sublist are supported on a platform, e.g. the
> SUBLIST_SBI_FWFT list. Add the check_supported_reg() to remove the false
> alarm of missing registers.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 8d6b951434eb..d7cb9b5d37df 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -28,6 +28,18 @@ enum {
>  
>  static bool isa_ext_cant_disable[KVM_RISCV_ISA_EXT_MAX];
>  
> +bool check_supported_reg(struct kvm_vcpu *vcpu, __u64 reg)
> +{
> +	int ret;
> +	u64 data;
> +
> +	ret = __vcpu_get_reg(vcpu, reg, &data);
> +	if (ret < 0)
> +		return false;
> +
> +	return true;
> +}
> +

arm64 implements this function to only return false when a register's
corresponding feature register isn't present or it indicates the feature
isn't present. The above would return false for all missing registers,
even when they shouldn't be. OIOW, the above makes for_each_missing_reg()
useless for riscv.

When its OK for registers to be missing, then we need some way to
determine that. If a sublist has optional registers then it should
be broken into multiple sublists. Then, this function can be implemented
to return false for registers in the sublists of optional registers when
we have determined those sublists won't be present.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
