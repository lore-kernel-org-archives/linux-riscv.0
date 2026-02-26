Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F37FD8FC2
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 15:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyFwGwhod+OpFhjJzZqH/kcOfWcC9Q378mQypW71QYg=; b=5CBAPBP4FGJp3T
	zNwp3N2bUDvcXI+p1rWXb8LhwYemUJXjqLa+W+zWfxn5axByE/RqRL3zQDuY6haD8lcmJNKVwwDbv
	89zVQ7uFOU0XvTwwhJlW6GGr5jPlOoYBFFaOE5S8b0KGFsW0b6GRfKlnQzY2rjeWhflTg5vnF5KKo
	jw38lnQZHVADFiThn3byfYCAtb1nP5PnNw1mFOblqcyDnoLMdDzWjYNDqmWPQIpKhqsoCKjTyk9Sl
	gN1JNtoqG7Z3iMYIIZS5WAFblWrX4EAOy3WPdRzvwYkM43H0Rz3YGb656CO7Hw9UMMSFuLNxumcSk
	mmqPSypHTBaMr3P9+kJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcv4-00000006P12-3Gp6;
	Thu, 26 Feb 2026 15:04:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcv2-00000006Ozs-1cO3
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 15:04:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL8WB3987242
	for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 15:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qp3TU7bzUr1B0vZ7uPapTlnahGO7pQVMf5jftO4wjJI=; b=GzGEF53SIu6p5rL2
	FSzlRnRl/1ny7hdPTi7cfN1pijd2a8AUO4dm00PcTez3Uq4OMf1cO2K4EigAUEJm
	9oZ5mw1R+zCmREzqwxByTbrKpVLrDX8UtHagBJ4JjNSHczqKXEK+L9aRfz5s8c/e
	PXNZKU6e8gR/51X5T0nwNyiO2/GLfVpML2nvU/DEE3kv3Z6TNeSX/OaoXVw8ZQu5
	3W9Cz5+M/wN6wq62tYf91lyVqwlmfyV7C8qyZ3ePUzRjlx5CkB4XsYEYFD7VneQy
	JvelPj8eN/8bsDXt/swz/lt7ZUFonpXnhSvP+Pp3mr6p1N2is5u3j8ECBgfC/XOY
	QmSXEA==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjdph23t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 15:04:47 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-67999892f00so20791758eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772118286; x=1772723086; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp3TU7bzUr1B0vZ7uPapTlnahGO7pQVMf5jftO4wjJI=;
        b=WzWhumxwYCRFfXHk9l+VV8n25O0ewUbBcOOUbDL/C7EcM5nt0XUdt73dgmPtpd+x2n
         nK6QGdRmfWQyGK2x8zS/fxbNEAe5GqK+9ZRf/xXVoUuFcCwDsMT9v/Jn2Y67A+dMdU35
         KoCeEOkzl7wywU7+7AAp9bgquiAP7A+su+eIZzMd/6KVkTYkUT8c2Mnq1bguo39WGCK1
         16pJGroJjttuYNZ9JnKgKkY998C9jQLvQpKnYXBQ07kQ16LiKKoJEDOCPGHkyseMn10V
         mujIY/EaWyEUfwJWoBD1VsiP3yeiKx09Uf7F2FSnARZwVfaSsxkuoQPj1eDjdON5m3TO
         jAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772118286; x=1772723086;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qp3TU7bzUr1B0vZ7uPapTlnahGO7pQVMf5jftO4wjJI=;
        b=k005PZaEeEYRUkOaB188OlOXmhGzQjkwNW8gcHb0Fvp0zDtvYi7i14cDdAi4S5RXHu
         oi4+H5xFizROHfDRcuCIe6Hn2VlX4C8VCBTMp2NG3+ZWTEjkc7C3Iyll7+j5ghcGBrxY
         04wydol7KNGkTlIHmg36RnfoPR4NI9SGpWFC7sDsvImt7nSMn+Zk+AdmXSOIYROOXRnH
         m/XPBjF10Q5PvmfAn7bis0RDCvsyGnESP6aVnsrAw6JLF2PJA+hHodCu+w917EIk9/ki
         CRnM6HRlMyrR7CWEAuCqIc+Sxy85XH08vsy7us82vbkDBGy450BceMauSMR2z0V9H+8e
         55bA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Au9XFYZDCUbwmv1RsqGthw6H/cU4VWzWbnALhzZVZ5ZorldEviaMRSjKS6UYt4cocZfFAqm6U82woQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAzw3VsobnXqXAkzv8G6Jn2JFrIDfRlT0tCRPvqBKScUkEDtUV
	x7IGcWVPsAhvFrwKwbXYpHpYjSGKAYfEL5sBg1E14S4vlKD3lXrxGniPgV802W8AG3baExRcvIv
	nSxR7foxsMwH6a8SPx2i/xiYi+uEvtiwfltCJaqUDaHGj8YAvGGpDzII8V4/yjAr4NdhSNR4=
X-Gm-Gg: ATEYQzymcxgLyBrvJrfI/PR9uYHWsZVX7WHPgC9pYe/lY+m4+67yFzIR9FUoOXdvrwY
	zMp2RzeVt9xRYqKHh3k06J0Ce3CpBKYQUddWX6f5ffayM5W99uOZ+HZZWlgG3Pl92596UntIFpp
	siApn1Ajq3sEPhRIEwKrM1b1zVOhuiyPePN33iApY3z5bid6rH6t3W69FgIibZzqELaRmxA06Bu
	zGu79NaoQNdS49fesUpNVxFSLgCb4Ta0Ax6oBsn6PP6uMGx8XI/An4qmuGusrDZ3G9E14dl79RV
	zstRVcfgXwGT/BvVF43CPCZuK+zKID06yOlQjvUz+9du6vhYr2ZeZ39uLfoJgVMAamtcrZ32eiy
	9be3ZH3ZhUSJ0ZnEQ+Iw7e7UvjtkRjk0/MUlgN/IsgCaAO1y7Jwzl9t11XsjX
X-Received: by 2002:a4a:ee84:0:b0:663:3c7:421d with SMTP id 006d021491bc7-679ef9b9587mr2113799eaf.75.1772118286075;
        Thu, 26 Feb 2026 07:04:46 -0800 (PST)
X-Received: by 2002:a4a:ee84:0:b0:663:3c7:421d with SMTP id 006d021491bc7-679ef9b9587mr2113774eaf.75.1772118285481;
        Thu, 26 Feb 2026 07:04:45 -0800 (PST)
Received: from localhost (ip-86-49-242-13.bb.vodafone.cz. [86.49.242.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae6131fsm65716166b.40.2026.02.26.07.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:04:44 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 26 Feb 2026 15:04:43 +0000
Message-Id: <DGOZI4Q6NSDS.7AQVQ7TEK9QH@oss.qualcomm.com>
To: "Jinyu Tang" <tjytimi@163.com>, "Anup Patel" <anup@brainfault.org>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        "Conor Dooley"
 <conor.dooley@microchip.com>,
        "Yong-Xuan Wang" <yongxuan.wang@sifive.com>,
        "Nutty Liu" <nutty.liu@hotmail.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Paul Walmsley" <paul.walmsley@sifive.com>,
        "Palmer Dabbelt"
 <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>,
        "Alexandre
 Ghiti" <alex@ghiti.fr>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH v6] KVM: riscv: Skip CSR restore if VCPU is reloaded on
 the same core
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260226123802.154855-1-tjytimi@163.com>
In-Reply-To: <20260226123802.154855-1-tjytimi@163.com>
X-Proofpoint-ORIG-GUID: 2mq2fGcrCTPVerTeVWnt0MJt8msiJjTQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEzNiBTYWx0ZWRfX1TNDeuP053YS
 5Xg2Cxpa5ICifdBnVlBzjyPQrvZuh9/F+NYqhvqVHTAghvxs9LmHUpHmDAYZlrUpDcKledXmRYn
 qdvxvulTcJks/Qf4EA4e9I+q59AouABhbEshjaFmqYBdbsn5rNBE+CQRMtz4QmC+R1SjiFkeIVD
 XjwXHdUWQuvlj9aa8vvkbclRxm3PF2tGTiosfZnxasQODlDEM44EczIGNT7FJyZcrEYGgtPn1PS
 bvUvCNuKSFT9sBIKAoDmDQLhvrAyjkUazoW6Bmu5fuYo5AAD8Cc9/GbnJ3BwfWJl4PydxHQBAh7
 dkfBiGb+gpz7yvO+AwtIkfidMCPE4sLOwiZ5nJ+0EQQ+6GmHywr1hPhD6ayVMgaiRs1KoTDQjfg
 QDsk8CyoGRcYAMbKAjKQ8XrAVa2GuGlfXwD3Qyva8dfXBii+GDOcEFSFxQrle6RWUwB9KWEpU06
 jCP1YTMGYAFPhzOuxGA==
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=69a0610f cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=9tUHzIdeCh+UoOnba06Qjw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Byx-y9mGAAAA:8 a=E61YY4l4AmgQ4UnPY0gA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-GUID: 2mq2fGcrCTPVerTeVWnt0MJt8msiJjTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_070448_531877_21BA4709 
X-CRM114-Status: GOOD (  24.15  )
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

2026-02-26T20:38:02+08:00, Jinyu Tang <tjytimi@163.com>:
> Currently, kvm_arch_vcpu_load() unconditionally restores guest CSRs and
> HGATP. However, when a VCPU is loaded back on the same physical CPU,
> and no other KVM VCPU has run on this CPU since it was last put,
> the hardware CSRs are still valid.
>
> This patch optimizes the vcpu_load path by skipping the expensive CSR
> writes if all the following conditions are met:
> 1. It is being reloaded on the same CPU (vcpu->arch.last_exit_cpu == cpu).
> 2. The CSRs are not dirty (!vcpu->arch.csr_dirty).
> 3. No other VCPU used this CPU (vcpu == __this_cpu_read(kvm_former_vcpu)).
>
> To ensure this fast-path doesn't break corner cases:
> - Live migration and VCPU reset are naturally safe. KVM initializes
>   last_exit_cpu to -1, which guarantees the fast-path won't trigger.
> - A new 'csr_dirty' flag is introduced to track runtime userspace
>   interventions. If userspace modifies guest configurations (e.g.,
>   hedeleg via KVM_SET_GUEST_DEBUG, or CSRs via KVM_SET_ONE_REG) while
>   the VCPU is preempted, the flag is set to skip fast path.
>
> Note that kvm_riscv_vcpu_aia_load() is kept outside the skip logic
> to ensure IMSIC/AIA interrupt states are always properly
> synchronized.
>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> ---
>  v3 -> v4:
>  - Introduced 'csr_dirty' flag to track dynamic userspace CSR/CONFIG
>    modifications (KVM_SET_ONE_REG, KVM_SET_GUEST_DEBUG), forcing a full
>    restore when debugging or modifying states at userspace.
>  - Kept kvm_riscv_vcpu_aia_load() out of the skip block to resolve IMSIC
>    VS-file instability.

Excluding AIA is disturbing as we're writing only vsiselect, hviprio1,
and hviprio2...  It seems to me that it should be fine to optimize the
AIA CSRs too.

Wasn't the issue that you originally didn't track csr_dirty, and the bug
just manifested through IMSICs?

> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> @@ -581,6 +585,20 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>  	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
>  
> +	/*
> +	 * If VCPU is being reloaded on the same physical CPU and no
> +	 * other KVM VCPU has run on this CPU since it was last put,
> +	 * we can skip the expensive CSR and HGATP writes.
> +	 *
> +	 * Note: If a new CSR is added to this fast-path skip block,
> +	 * make sure that 'csr_dirty' is set to true in any
> +	 * ioctl (e.g., KVM_SET_ONE_REG) that modifies it.
> +	 */
> +	if (vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty &&
> +	    vcpu == __this_cpu_read(kvm_former_vcpu))
> +		goto csr_restore_done;

I see a small optimization if we set the per-cpu variable here, instead
of doing that in kvm_arch_vcpu_put:

	if (vcpu != __this_cpu_read(kvm_former_vcpu))
		__this_cpu_write(kvm_former_vcpu, vcpu);
	else if (vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty)
		goto csr_restore_done;

This means we never have to read the per-cpu twice in the get/put
sequence: faster put at the cost of slightly slower get.

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
