Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F3A10A88E2
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fkjk/3g41AYywhjNnhGjKVVqyyMRNGo24fJLEpLpC6I=; b=poM1VKi4CF+Y0y
	sWRwxOC6TzEzStnEhmkbTfnNX7rcR3YoEk8d4pfV0IqbuT0PqmEoouDDxwhFbrTJbxYLmNiw05887
	mVsmFLcUNfcLyPCeoObSRbYGdve4gD+YMIgEH0pUuYT4fa9pdGMqEWjiXdf0SS/uO2BtOMqOunkCz
	/moAEks3KhE0dsldb/yvN33FFyClmiOnuPI7TiMz34L3qeMIHfa2ObaJUAxce+ovJ2i9SLBOgDlXB
	h1QkLSJ2RAgnyJBqjy/07KTCht9+FNXaZ+hTjPaLLyZpMYDsls2+kXXT80cpVVAxWCpewVnuGDpxv
	5G83aNe31NSI6nzithiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5n8x-00000005ofe-48sZ;
	Thu, 26 Mar 2026 16:01:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5n8h-00000005odD-1OGz
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 16:01:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9fNQ334263
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 16:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ECC+K5fQgmcE5dkI04RZqYls
	9iR/vuOsXzyZFSZOHcs=; b=lqPnS6HBViB5u5fap46r619+PbuzdXnfZtMS4xU+
	igKtkDhfIWDYprk8wHEkHeYgrmkheml/hsZxOh2m9qpdRjPTrg2D2UpD7KPcBKdA
	Zpbb2hZkaVarLGOuG4zzAChhr8Y4MQhzoaq5XrkjfZl5D3lRdN8D2yCFUogyhW+x
	BcSeW8gLfwYymnLMAZfrlDbODT3G8ItOjo+eWwAxWFv7CIP55GVZUlfzy7bVVO9o
	aHZc5WMTOlOB8ZBCgSGoGXJ7WmawJWA/RMPmoVwuHXZ3gYM1lzE75iYQd5xkD1CD
	CdeWmlWWNiCRL0TP/7dRs+8xW7NQZtkK/wrZpwBwHCwXLQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527ysbk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 16:00:54 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-128edc72e5bso830374c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 09:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774540853; x=1775145653; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ECC+K5fQgmcE5dkI04RZqYls9iR/vuOsXzyZFSZOHcs=;
        b=E2QA/M+rh26OGWSufa1t5dNkTCIYvi7IJRC3bAXI/QhKCe0f1aztB45645gSeRSqka
         NUGxSlPkhkIdjR02lh7DAH/xV/EmdBqZQkRjQwOqxzns/qwtB3grAKjdA6xH36S6j+KY
         eXfZvdg25DLzcSdnPUWurM0PeXcuHEBx3jUGx0UfMZhyHl202vvsoHvJufZ0cPpVJmO/
         bcoOwVPYUy70XUwQUpZ+gZeVxgkVzYUr72QYALVIE4Ii1r8+APaEkONipGJ1975AqC2C
         /tzx/f9j0ASBaa9Vvo4dM8MXdFpSWNis7mshJt3eeKoGYy1RAKoBSJLG1kzpAhbHsOT6
         MgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774540853; x=1775145653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECC+K5fQgmcE5dkI04RZqYls9iR/vuOsXzyZFSZOHcs=;
        b=l1S32/soY6lniTJeDblV1SHJFUi1H5QaSZ6mYDXhXANqXH+As6Pj8CoyUVKwxbBXDD
         UPsV6tootybKi6IJadIDb/t+1k6PhB3MsMzbDDF5T3/xKUQsp7gYEEMj/ekk20aER31s
         CeOJU/0pXYUFEF/Uh/1oZNOgWaLGTweq6Uos2ebdx1HGB0kUXMiQKe8hPfDTgPBU+HxO
         tZYlxZnBHY4IDX8tp6u4985H+6EeQZB3rlor/YrzD5oiaK6wiPhJg6+IT9cIELZvTD4+
         Cn0wdI0Od60O3uSnqwSjzsWnjo7vNgpwV/bJDre1yf9cE/jPyL9AS8V5r8/xMbHBcxBF
         aLKw==
X-Forwarded-Encrypted: i=1; AJvYcCX1yEE67qqH9b+w9WnVUZ2DrdBSBTd546/lmkCMzwN6SpEDKiGhFcpU6+eM1Tg6Q2Nr7U6L8PFpma+O/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyEmAc6yMYpLMdDEkK9ixLd7RBDycsy+0HgIB6+FI4Iqg9QiiQX
	BPf9U8mfVpv4H8fk/1HOTig6mhT46ZcpWDwllA6zY9SxC7lbCJPXIoovsrakNZQv6xvZfSlKrdg
	X0HVl6zHE9mZt9ZoIW9wh6BX9Hf5OuqfuFPH37Owh2OdOLKeETF7oTtnfklid2zZZd+CapEU=
X-Gm-Gg: ATEYQzzA7KS5yqIQdsTTwqkeB+jXmLE45m+kJKggAmB5N8723xTrrzeeDsye25CXvlV
	KfeQP4AJvBHwyU717YZN93MourfcuOVdYV74ZtPHCzf0a5WsFF/o70E1YMqkBo6VzXDYna1GD+o
	R/tro6ArHahEMmyecfMLl6Vvz4G0DijJfdjFXkGRfipa+zDJtm1trzvZf1HzhqMzSkc/FzrBZGN
	R8ScTOQ6tO7/96qCCSxlTjio7ggS3TsEvBDLO+7qB1bYUXzpiAix5rtDEzSDb1H0FQRBB7q60f3
	jJTyljqEcOnZykBxaxgmFp0EXjP5TeHK3+XR9RU4SSmvEhVdolhrzdgmF1QvX7F6uDvgQPcpNj2
	Odz3oQechdxGlAMnB3YJ1QlZGbH4p6HU=
X-Received: by 2002:a05:7022:402:b0:11d:f89d:85a0 with SMTP id a92af1059eb24-12a96ed3fa1mr4307348c88.27.1774540852805;
        Thu, 26 Mar 2026 09:00:52 -0700 (PDT)
X-Received: by 2002:a05:7022:402:b0:11d:f89d:85a0 with SMTP id a92af1059eb24-12a96ed3fa1mr4307304c88.27.1774540852061;
        Thu, 26 Mar 2026 09:00:52 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6513e9bsm4989209c88.0.2026.03.26.09.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 09:00:51 -0700 (PDT)
Date: Thu, 26 Mar 2026 11:00:49 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix double-free of sdata in
 kvm_pmu_clear_snapshot_area()
Message-ID: <2bepmdibreb2mkxxgmrbenfl5tnx4jgxddzvsd4h6ii6myqw6v@tuqenrqdfutj>
References: <20260318092956.708246-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318092956.708246-1-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c55836 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=FA8e0eGMvKrdCSP4i1MA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: y4MycBqX3_dEpm6cNV0vjDO6Sr4ipaRJ
X-Proofpoint-GUID: y4MycBqX3_dEpm6cNV0vjDO6Sr4ipaRJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDExMiBTYWx0ZWRfX732y+bxxtaX0
 y6p3bXRjLv3zuWYQTBFe2kkJa+wowU7H3LT7/yg5ThH5OL4YraGa31+9bl9Rc1OGevl3cEPD1Jf
 +Wn7VKweIp8OJ4qE685n44mLx5875VRKMZaO3guB8rb1LZ0faICgZ5ouxPe7NzSVGPwR+KSHc4z
 4M769w2u+CDy3DtvSEnoLWNViQf7qk94hCi7Q3azpc6oXqaKo4Hx/r0IfuZH1eDNYfpuccDMAD+
 c45tXb4b4LpoCkqPXVYhpgayQD6fBd2/ZOgH+XOQGejNHDm6sS4ogBVrWKklzAjV9wCsfuV2H+1
 zuLxBaaVTnOaOqCMoCNBOGVNvXAGXc8meQjFdvcvlZokDtcFI8sL/thALsiXN701/sgk0OaJXZ5
 PIWUUFvnDlMkUOVaFCoyiJIHcw0FJJS6Pm7SLqFAcyFuZg5PfdPtDNRTxM9gT840RzteKTQcx29
 /JL2Dq04NwvXqV67Wig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_090055_480368_78A062CF 
X-CRM114-Status: GOOD (  21.15  )
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

On Wed, Mar 18, 2026 at 09:29:56AM +0000, Jiakai Xu wrote:
> In kvm_riscv_vcpu_pmu_snapshot_set_shmem(), when kvm_vcpu_write_guest()
> fails, kvpmu->sdata is freed but not set to NULL. This leaves a dangling
> pointer that will be freed again when kvm_pmu_clear_snapshot_area() is
> called during vcpu teardown, triggering a KASAN double-free report.
> 
> First free occurs in kvm_riscv_vcpu_pmu_snapshot_set_shmem():
>  kvm_riscv_vcpu_pmu_snapshot_set_shmem arch/riscv/kvm/vcpu_pmu.c:443
>  kvm_sbi_ext_pmu_handler arch/riscv/kvm/vcpu_sbi_pmu.c:74
>  kvm_riscv_vcpu_sbi_ecall arch/riscv/kvm/vcpu_sbi.c:608
>  kvm_riscv_vcpu_exit arch/riscv/kvm/vcpu_exit.c:240
>  kvm_arch_vcpu_ioctl_run arch/riscv/kvm/vcpu.c:1008
>  kvm_vcpu_ioctl virt/kvm/kvm_main.c:4476
> 
> Second free (double-free) occurs in kvm_pmu_clear_snapshot_area():
>  kvm_pmu_clear_snapshot_area arch/riscv/kvm/vcpu_pmu.c:403 [inline]
>  kvm_riscv_vcpu_pmu_deinit.part arch/riscv/kvm/vcpu_pmu.c:905
>  kvm_riscv_vcpu_pmu_deinit arch/riscv/kvm/vcpu_pmu.c:893
>  kvm_arch_vcpu_destroy arch/riscv/kvm/vcpu.c:199
>  kvm_vcpu_destroy virt/kvm/kvm_main.c:469 [inline]
>  kvm_destroy_vcpus virt/kvm/kvm_main.c:489
>  kvm_arch_destroy_vm arch/riscv/kvm/vm.c:54
>  kvm_destroy_vm virt/kvm/kvm_main.c:1301 [inline]
>  kvm_put_kvm virt/kvm/kvm_main.c:1338
>  kvm_vm_release virt/kvm/kvm_main.c:1361
> 
> Fix it by setting kvpmu->sdata to NULL after kfree() in
> kvm_riscv_vcpu_pmu_snapshot_set_shmem(), so that the subsequent
> kfree(NULL) in kvm_pmu_clear_snapshot_area() becomes a safe no-op.
> 
> This bug was found by fuzzing the KVM RISC-V PMU interface.
> 
> Fixes: c2f41ddbcdd756 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e873430e596b2..ac1b9a91a19db 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -441,6 +441,7 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
>  	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
>  	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
>  		kfree(kvpmu->sdata);
> +		kvpmu->sdata = NULL;
>  		sbiret = SBI_ERR_INVALID_ADDRESS;
>  		goto out;
>  	}
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
