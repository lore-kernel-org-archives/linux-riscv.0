Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5D9FD9E0C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 19:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W86euFzyiO/pjDKdvspuLfVmgKgJgtoPulvivZS4TEk=; b=LKI9kGQML7SyHt
	va/LSVsL/zDrgV+1l27KNNq37Aut6RX3YKCSnEx1nJu23LmdTFGUByYKXQqgoEn3kfzJcxqtYWYAt
	0QFeNKOo8v1199vDkT+0dO3bNf3eAXDWEZAHanMAXv3Pq7XBCvQdAfJpvohO8NERRMWzYoQGPsiaM
	4ZgQo81uoS548rEBU3Z58peH83pxAH0Sg8CT+yI8q5P3PASlJ40nlW7gDNjUnH6SCqmykDloEs7fV
	kV1IKNYDg5mfsnd7rAHGeafUwvRjlua2Al9brUsOq183dXHIADK00uBMnHJ8jHu85Iqtt0I4VqPyA
	wlgbTpkYnwoRxM/h/V8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhRL-000000076yR-1oKj;
	Thu, 26 Feb 2026 19:54:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhRI-000000076xj-2i36
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 19:54:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEbID2608713
	for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 19:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gkS2kEkiD1AazRxh9MEv+lrE
	cNwpZ9ngwbS4rZ3aYQY=; b=bQHQBnuY976RywjkkxRFoJe1aPFJ/Rc7+AJMIJmA
	y+xV9ItFDwrV5VVJB0WoORNHY3ApR6lEBMjFWILzqRaKb08DNmPQgvI09pZ6uSBj
	lfckXXnFndIkMCVi13Y4cS/FOC+SNPBuWAo2rpYzFC3/1TmZd9c0pLlrAIXBBAqG
	LNgSp49rX3g7BoCy0C+iLcmAK6OkH9QEtrs8O3axSSprqElupwd1tuLXwbK4p1mi
	KepYovkFCiN7wpy9Gs1QXWlb+I9U4W09ja3g6VbmI4PsB0+guOMfqWXkWtygp+wN
	GXD+RBobmG5w/pfGQD46E3ztudBgi5Kq5Touq62EVny7LA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7y8s2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 19:54:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bddd304622so530855eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 11:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772135662; x=1772740462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gkS2kEkiD1AazRxh9MEv+lrEcNwpZ9ngwbS4rZ3aYQY=;
        b=gp+hNlXXlQ6p50KNSTXSWZesRf8pyDTs8XKuKEHJO2GXShNVXpaoyI1E6bCCmdOrw2
         B5SH5twDbWdrKyc7ssDsh5vCi2EbEC9EQ3l5CCAkU9ZKvs7pD+wQ2yOe2kXhEqeogMBA
         S1ZVlxWP7ux27ibgWXQbC8aPNwXW9034qaNiRQOJGa9zkcmQeCx/3IVN7686cUD8nky7
         C9a/GaFrN5KCn7XMo5Lm7cAXMcFtULGwyBM0Jglhk8YXypFb+Gvfsr2ToVvpyvGZD26x
         fo++Ca3DY6MgpPbz+Ix5IGoMDHZcqEnaojnc0+GcqIqfDZxSl4t0NGiR6CKAWMEmQ0ke
         Ybxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772135662; x=1772740462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkS2kEkiD1AazRxh9MEv+lrEcNwpZ9ngwbS4rZ3aYQY=;
        b=fJoSh85dM459UUD3J3RtrO6XGqyEx8+E1/J+ijTwFemNK198gO84H/mYXPqGzqL9y0
         4iIgdmvr0ZlqEjj+A72zumLk1l1CEhGMWIxWDvpqVFs8aVHMqWnUOUVDckhe0cOdvXto
         1vMzb94VRIjivhrQXu8Hhsz6HyR7+UpnqobuePU+uH+BVo28TjWDuA8K+FRCCe0ibH4V
         wUoo/5W6CyP12N1Ji8hzUBOAv6YFGlfuGZmtA8fmGKZGRieIe3QozvrH1ho0yTUXX1ml
         wOQZoPf9P8sFzV5jpZ/vTVQGPP8luloKgIQq1Ol6mjfkIS/X62VLj/DryJi++ZN6nrca
         yAJQ==
X-Gm-Message-State: AOJu0Yy1ApEiow5PWz2pEufrNnYBUm+0XzXUEOtJFQZAKFEAg5TZQdKo
	hpNYp+F2hKdFdjDbYRD1nmM//4chNeENf3x0dxoZxZuMJrSJKAqU14Dq282XGilCIxmJrtXuMZI
	9Z8XZLbcIjcwCKKIvplQDdKCI8euUsp3dFSqyS+s5yVdt/lHfQRyQko6DUNkbmPpsy+UqU6Y=
X-Gm-Gg: ATEYQzylE8sAWPDkUP9XeSTCRMsoOWVh0VKEl0mS2Sngczvvm7WsGqJBWUYxbhTUkdh
	esbSxy5ipaUNboCaTMPyIW2uP7gB9AEfQoz1a8JqL4G07XJQvI+WmkTZdCoAe0OrMo0Ff6KmrXF
	6VdkIpIZuo5PhjahVDGirngAxE9OVObbew2piF8xO22VKvJGV5nGwpYPo2zd/BZbkq2TjpV70H1
	87C37FaXneFvk2uIQitEL9iqKRy4o1CZP+MH0rBhQHLqpSVusO9K4OicJsPVPrCeKC4Qck/+3qS
	LJrxZ33bqNDBHf8ZEzUzV81BjnKQQljIaW0XppO51JMzzkRz+oZl8/yIlZgL3G17xVytNjzjQZk
	xblmZ88WMMEvllWltGwtve4FT64QQ5fE=
X-Received: by 2002:a05:7301:5795:b0:2b8:26b8:3426 with SMTP id 5a478bee46e88-2bde1bb19d9mr133484eec.13.1772135662425;
        Thu, 26 Feb 2026 11:54:22 -0800 (PST)
X-Received: by 2002:a05:7301:5795:b0:2b8:26b8:3426 with SMTP id 5a478bee46e88-2bde1bb19d9mr133461eec.13.1772135661846;
        Thu, 26 Feb 2026 11:54:21 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f7ee87sm2493752eec.31.2026.02.26.11.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 11:54:21 -0800 (PST)
Date: Thu, 26 Feb 2026 13:54:19 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Albert Ou <aou@eecs.berkeley.edu>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v8 2/3] KVM: selftests: Refactor UAPI tests into
 dedicated function
Message-ID: <kycoxbbf7krrqaqivzin6twb4vnbl7g3xfnx2qwotwxkjklxad@37c66df75wv5>
References: <20260226083234.634716-1-xujiakai2025@iscas.ac.cn>
 <20260226083234.634716-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226083234.634716-3-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: dvUrZT1SL4QVt2zQORrIEFT7SZZJh7mQ
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a0a4ef cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=a8_vTcVqeGFb8pxCYGAA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: dvUrZT1SL4QVt2zQORrIEFT7SZZJh7mQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4MiBTYWx0ZWRfX/A90tdU+v2O1
 AqvIgLgWSh4p5DajAWDf14jXIvVFRqHq7eAFH7i1SsCQC1rzehP8roXfJwOTk7zYg8tqiDK7rKJ
 nF19nvKF16aTwq9DvAfn+ztSsi7R5FQn8U9EWCPReQxTymtAcueXeYBOLzr0xV/zqZGEzd/5Myy
 Cx61iUSl5FPQF6C1ZbUZBjxoI+avCtZtXLy7eMCmAr2FHMfwD5WQy4Owaf64tkMsq+PjWtG1e1g
 e9/UjrCh1Y4FmzL6uOZpaE0i5lhUYMLtPf1dnnX6yrkgM9GTgl/5bRkzT2diyb4Zu7o7YXeHKS/
 lYxJTS64iiInsCkYZO3ixlui+KZzDXlR+ANC5WElvhITWXxm0/ZPHepiku2sJBz7v10nHJNVxdr
 fbVb5S6GFb3Y6OMGHThDwCHkV1hYy7rJ5kreB/JTocu3EwlQce+TCqcEshr/ZJShzXQfHUMdkz9
 yRNTYrUPvPChxySA8xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_115424_708851_E09C6AD6 
X-CRM114-Status: GOOD (  12.09  )
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

On Thu, Feb 26, 2026 at 08:32:33AM +0000, Jiakai Xu wrote:
...
> +static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vm *vm = vcpu->vm;
> +	struct kvm_vcpu *tmp_vcpu = vm_vcpu_add(vm, NR_VCPUS, guest_code);

We probably get away with adding NR_VCPUS+1 vcpus to a vm which was
created with NR_VCPUS because we don't run it and rlimits happen to
work out, but that's pretty fragile and not a correct use of the APIs.
So, we should also create a throw-away vm,

 vm_create_with_one_vcpu()
 ...
 kvm_vm_free()


And, even if some archs don't require the temporary vm/vcpu we can use
that same pattern for all of them. So, check_steal_time_uapi() doesn't
need to take any parameters.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
