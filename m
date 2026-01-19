Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B80D29C28
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 13:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+2SjYOVzM4r13klF59BOEj/4C3I0Qnukd0D0gBc/NY=; b=Fg0VBmus0g2EGR
	RJCXgBAeE7WQQXWDEJRl81qU0ZYmoHmWT02RvbQKOpnTgM/mxXNpLpfZiFALIvd8bVty9xIcgj2CP
	JyZoT3qF7ylty3KnBRJjwPmppeN+AMHvWD724nUhcRJLS74Ww4cawO8PgWwU1jEpSBmwt4WWuhR5h
	13o9dDIC4bZNX8YTv1ObTreAGK0NaDpK/xpu6k17vFtb/Xn1CcQoo4y4RDq5O/tVt3vtxyyeuos7K
	y3+zeuzPmo1ny2vbeqAhXmCF5kEevi/8qSNYvd8oeEvkDcs2Ridoklj9b3m/ya9poszp+LHBa3OV0
	b9gfHIbXyTMniJo6ipng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpkc-00000002C8G-1Tke;
	Mon, 19 Jan 2026 13:57:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpkZ-00000002C6v-1Av6
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 13:57:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9mgdJ2963081
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 13:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UbL31uTRGt8/LXTIbFWHOufRJpptJFeRKcwRPHZdYLQ=; b=ArzAWxLG2+NyXBFe
	Cb9DXDSAbb/37WkBnLF/0v0z+hur8mwZsy6s5GgflucGBw74NnX1MIqWYweZqVoi
	CYTPNQBiXFn3YWf/9AnjdUslkV/1+BoYuEOsgJL+/uVUQ/0+kfhBPOn8nGvX/hG2
	L3Qc548DH3Z+laJGdVIx7SAHiVWfRfqbK6mt1bPGqt8VX2XZdIWux6Gi88Y4otZh
	VdZMqvrzyXZLxfHodoSog4LP1vZW8cAjD5BLq7rgY8RhweLjDzMWSNWIbjRWuoSX
	87QUzsstPy/0dzmWLacemLsS1Q+QLVBBtLff2BNE8qyshIXHn633HvtZbJHVUQPs
	vL2Kdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa8nrt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 13:56:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a5bc8c43so919476285a.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 05:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768831018; x=1769435818; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbL31uTRGt8/LXTIbFWHOufRJpptJFeRKcwRPHZdYLQ=;
        b=fjD6xbzrABP09Z1PFHoE+v5Bo6zsU5+z7cPtqDH1R/9Jb8ToBZcKb6A5lAfKiK46S5
         kOYCChf6J1QH/tjtKEIu8aydM4jKczplwHEG7nj+uwcxXEEh2FAFaG7Xk3VxzmibMqxP
         CKnYeMjSzFXqgFvC7MgSGdBru0HEr3b0VVhc7S6gpx+XWUzpAuKVKOeHRXe2JDvkoDkQ
         eN88xcXc18fFinDl210ql6ycMJjb6Tj6yl9Y54eGM5P3FWJCK0mUlOYgGaZANqmiC6q7
         K5pER+WyFU10DO6pcRO1uaW/7aGtB1myl21lp2J5RECfDpu3fgQ8YQxF+sTjR34oYOVq
         n1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768831018; x=1769435818;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UbL31uTRGt8/LXTIbFWHOufRJpptJFeRKcwRPHZdYLQ=;
        b=o3LvC+8hnWHnRwKsMdZzm6pTXjuZ3NIR3UPchroWSSeTaQ62ZcBh2lfVS2l5otwcxF
         xgjnoq7HhvnppXvGYQBKf6Br0W5bMW594lcT25bcLECKDjpkApMFtLokOlWGSwo2ugUp
         pI6ArG7o+QlLHk1iJCH9Er7Qma8wvj9Ss6mezK+Q1JHjXF3Fg7h/sIAqM/GkYICexxen
         de+FsA0fdu9QSkpvrUoajJit6ldzrdHYEv18W5BnlnXXXll2gN6/0xH0VpD12PjI6jfU
         QOWEGshjHJJfX/vxebaVZJb9BsmDyh+iaAAUQz+ei5Y8Qugah1hnvpSczwMfA7NO0dNr
         0Xsg==
X-Forwarded-Encrypted: i=1; AJvYcCVPpMmuTr25t5oS6tsSj4KDO1P6xPccY2XvnHYUYJdChRRCABKOiW7csUrrQWqD5ZKknrk1m4y//N7V1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZkJi70rBxTQmroMj+VB+wpVyvItgDOjmGZ5r3AaV45aSciUoV
	HXHUTWV666U0v1ejOXQtRyQfsQscTcYo5Js76fFLIrl9Ttqdh8vTHa/+s6UMkYKTRG/6x7PAVaz
	PVe2aJM53svSiyI2jFrJmWx+5n99y95z9nt0lnPdp2XAUqoXgPOQbbne2gRWAWv/PH2tKuUk=
X-Gm-Gg: AY/fxX5XMy08uRiBHrZN92narqiJwZh5rXcq1ECp+o6pl68jGCFFZ3xN/kGKOpea7uZ
	SgNEUIeFHe6j4gzB0jyMuRLUOivumkuUcNQB3qNXrVnolKnfB9gUtB1EDJh0G9GeVRXrOwoldn8
	7zUzdpo6guqe0YVPpTJL+OzT6zrvnt3ozPOyJ1Hg8OQdg0sUubPGDBZw4I/K+bFFHN1F0+UBLAv
	COGS8XSTF25og+7Gckd2NzLxmsx86Ce208uoJiIrMSGHwaKdnwjBHRP4q9n9Vi26vDOhqeDRcXt
	ek9LuGkYLH0OmS/+aakNQGF6I7hP2wG5aVDaBnnafv5/0Udcgy7n2r7RKN3QlGXkgKvzIKkRzss
	PXfLTHoCQiCtuek8yIdt9D/jFceKBS4fD/Gh4VdR2ax1SMK3d
X-Received: by 2002:a05:620a:3953:b0:8c6:a5aa:465c with SMTP id af79cd13be357-8c6a676df81mr1514906285a.55.1768831017851;
        Mon, 19 Jan 2026 05:56:57 -0800 (PST)
X-Received: by 2002:a05:620a:3953:b0:8c6:a5aa:465c with SMTP id af79cd13be357-8c6a676df81mr1514901485a.55.1768831017126;
        Mon, 19 Jan 2026 05:56:57 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e86c1b2sm190952425e9.3.2026.01.19.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:56:56 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 19 Jan 2026 13:56:55 +0000
Message-Id: <DFSM9IHXY24S.3W4T39VHEH420@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>, <rkrcmar@ventanamicro.com>,
        <linux-doc@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
References: <20260105143232.76715-1-fangyu.yu@linux.alibaba.com>
 <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDExNiBTYWx0ZWRfX+tyKb/1jWsC+
 FkGPohuLcSgIGQvTKeZArvAHPvunDha42noRzksPBnO9xiajaC6pW8oLO23pqPwlr/v3gFXxFyr
 bJUbeKTcjj5ENE1AEHUUGSfL8ekE9htWtwtfIalA8Oo+m6mY2FvNxSw2XlG6N1MwaCgn0CvTRFb
 hI4DS9qLIyp7Y/88UnYhgdQDFeqLKK8hzyyWQwEoRiBRNDKDSGXv8Z7DSLDGR4KVxcl159JlYMv
 mJZ4paLs+V7UQWji2YU/X94NK7VtO9VuJn20mInfQKoekyqdlYp9Rs7ptnORtwWmrYpBBDhEwLG
 Ynv1qb7OvTN2F5lh5qay5lN6QcCYNQvte7xjHBKdGG/p4njiCofFUZoQs759IcsdndY3xeYQA8/
 qhJQ/3KKAzgHgzk0zGZ29cuGjKg+vt2Evptd2um1oXN0JuOXxcKUDRTldJtaciAID6QC05kulNv
 FmOI1hc0SQQZnrqL5EQ==
X-Proofpoint-ORIG-GUID: IaZ55BRuTAy8dgEDMQg7uJgDbTWdxoVf
X-Proofpoint-GUID: IaZ55BRuTAy8dgEDMQg7uJgDbTWdxoVf
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e382a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=kNzBq6KntmL7tATRjgYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_055659_315160_D8091859 
X-CRM114-Status: GOOD (  17.29  )
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

2026-01-05T22:32:32+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> This capability allows userspace to explicitly select the HGATP mode
> for the VM. The selected mode must be less than or equal to the max
> HGATP mode supported by the hardware. This capability must be enabled
> before creating any vCPUs, and can only be set once per VM.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> @@ -212,12 +219,27 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	if (cap->flags)
> +		return -EINVAL;
>  	switch (cap->cap) {
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
> +			cap->args[0] > kvm_riscv_gstage_max_mode)
> +			return -EINVAL;
> +		if (kvm->arch.gstage_mode_initialized)
> +			return 0;

"must be enabled before creating any vCPUs" check is missing.

> +		kvm->arch.gstage_mode_initialized = true;
> +		kvm->arch.kvm_riscv_gstage_mode = cap->args[0];
> +		kvm->arch.kvm_riscv_gstage_pgd_levels = 3 +
> +		    kvm->arch.kvm_riscv_gstage_mode - HGATP_MODE_SV39X4;

Even before creating VCPUs, I don't see enough protections to make this
work.

Userspace can only provide a hint about the physical address space size
before any other KVM code could have acted on the information.
It would be a serious issue if some code would operate on hgatp as if it
were X and others as Y.

The simplest solution would be to ensure that the CAP_SET VM ioctl can
only be executed before any other IOCTL, but a change in generic code to
achieve it would be frowned upon...
I would recommend looking at kvm_are_all_memslots_empty() first, as it's
quite likely that it could be sufficient for the purposes of changing
hgatp.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
