Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF73EB363D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxO1g6xGUmVeBk2K1o8Pm22DY5RbH2zdc/aB6SwGnTE=; b=FqaZ4QjjOv5ZVK
	K/iolIJnJopJLbOJ0D2BqKBKAJp/lxgxxubfcOrL78eFSKl4s3GOrKVXNAj5ONoOuD8ug15joa/y9
	AP2E3DJI5EzwuXmBMy15rj2lVuSTEDDqHUTVyROPiHOvJOglj75wlg8czPAZi+TLI+5Hd1LyxWgfv
	TXCjOhG6iRNJjOtwzLknrBEPX5XzAfIKcvyJQEFDMTHCmd/BNoSzCoYaFVCSpNvgb/1VYqMO8Up9v
	HS5ZFo24yk+axVMNJjmj2TTy9QZ7h7K2aNson34wHV9C1KFaMadMwNZNbhK6XUpVzGpGv9d8gCZWW
	bTI3/DJPqeqAChiZ6Pmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBR9-0000000E5MD-0Tso;
	Mon, 02 Mar 2026 22:08:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxBR7-0000000E5LJ-00LS
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 22:08:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622IumvN1187004
	for <linux-riscv@lists.infradead.org>; Mon, 2 Mar 2026 22:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aFlTulkTiHRUNVyM0yuMIYm1
	zlj17kVnR05A3j3KKwk=; b=oD3V9X0GhEe5gFKThb2dbOb327G4eOVgVqX3P1wp
	dp/UZ86q8QykjGUFi6SsqRNxEb69gly/McwN7KNqkIBQBfxOqaBRAHCPChCxr8Wy
	HRrDp5APKjbi7PaJSkvCLgngOHHIdeGqPL/VBbSKoj8wEbn32+oAb22fGki2N9tE
	uckjZffASObUusEP+/pmBeHrC5mI21QPgWFLQ8EgF/IeIFacMIMCQ3G1dNHZMylT
	+22//KWD9fsMUpdOEP4RnqSzNjQjGeX8xse2Fe5dh4acv4rrWyYWG9DlE6KxOM0w
	jnXsQ/EJDFCQmuCDa59W4RFtrevm2tnR0JcjTrpUfCD6Dw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cng96gj56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 22:08:19 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a95b6f61so42026779c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 14:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772489299; x=1773094099; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFlTulkTiHRUNVyM0yuMIYm1zlj17kVnR05A3j3KKwk=;
        b=IyIGbLJKGQcR8fHwnAWiwgHqAH7RAeg3ovQhNML3RI+TxcuEbmuy2IhDLIM7qWV6+q
         J1Z6EQ/3k+aJnNcF3SOlVwR8rYvEqjGll/GzxHv0CnM+U42P/8Cq24uWyCEZvB7fT99P
         CQlS8Lbn12jduIuDCCazgMYYUjzEB0F1j04EEtXx8xRNX8HZoKkodPrL1HLLTTMPShG4
         8A8Uv0Z2Tk9Nsgv+n7t2T+0gp8g/RBSGaj+aoTl1p8M92hERWe9QhpdwZF0EWqIPDRk3
         6CN7zlp6xLACBeIdMPs/lu1F6tFUQg9XNWujIrJsI2Oo+5BZvREFrcMHQtYNckbbWNdS
         gY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772489299; x=1773094099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFlTulkTiHRUNVyM0yuMIYm1zlj17kVnR05A3j3KKwk=;
        b=OtaJoyK7bXLsVNQpIGPanx8i6auXSblnXpQYiDm/5OqF52/eNmZTyL3IVAC160r9tH
         4MpaHy5OPIOeWQWLrbFXDHSZe9SVsUNHecfZ15eyjJDassqub7w+l7DbzmKgwg8USm0R
         6OE6tECtCnfxCgWOaHN9koWPzIr3R95RHTuHuaa8kjlsug3gEjC1QS2iapefPEp82CV2
         C1ddacwwzXk2ZRozFelVAG+eVast5Ublm4b8fisIrCoUkF4q32tbHS/dn94nD9zPgl6B
         Vhw05yt37ZwqeV6w72zrvjMwXJTsJIEqk4Kod309dN880+efRmPtODcb0ykjZCtPPCfP
         0x1g==
X-Gm-Message-State: AOJu0Yx+8uAhD8bihCPUr+eV3PykYwgnG1xwfmyil4Lvj6fug9ZBDRgT
	l7bD+MER37CX/MYM3Ab7Vvoa1nFw1rqpHvR57D0O/ZZzTIgPDPFHtkzA9Qtk5n0ti23wWYa5jb4
	4uAbNBhEt82N/2YVuB36VZF9rTLGlDTjNMDe0D75II2wOA9wei+cHgjDMOv/4hQimnoRIeHM=
X-Gm-Gg: ATEYQzxqvynZYVdyPNuQtVW3fDbt77RkdBwe3hK8zb9YGy9qL86M67+k/PW3Oqwpb4U
	kjMLUn+vy6ae37F2rgcOUsptR51aABReKtD5RwcmK5NckkKMJSB/hwqEwk1qIr99PPrXrvDLtg0
	F+gsq9E4QwWXsTG3F+/0SeW47JTFhWdRNk/wO6X6K/IYZWuzoFjngWOz8tRS5Zlnx6O2VGtdWIZ
	jp8LWgRqDq+0MN/L/TLfEm8HdVT+Ic0e0E01mbzyehkexMNRItQKDcjbdtAI6QpiJwTFK40aRBP
	Q1nowJMcC1DZwCp/erSB70A9NacLjCMr7UM/uqvSwM/U3GnKjukFzLSpLxqE5PesMezkOhqDeyw
	GCrAI8dmh4z1IGr/k+X3SnHsxlaVWPd8=
X-Received: by 2002:a05:7022:128f:b0:123:3461:99be with SMTP id a92af1059eb24-1278fcdfe04mr7472433c88.21.1772489298670;
        Mon, 02 Mar 2026 14:08:18 -0800 (PST)
X-Received: by 2002:a05:7022:128f:b0:123:3461:99be with SMTP id a92af1059eb24-1278fcdfe04mr7472413c88.21.1772489298167;
        Mon, 02 Mar 2026 14:08:18 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127899dfc47sm18367820c88.6.2026.03.02.14.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 14:08:17 -0800 (PST)
Date: Mon, 2 Mar 2026 16:08:16 -0600
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
Subject: Re: [PATCH v9 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <xhcbisolsce6mbaoovxpzbsyqfdtptnny44uqbfcbte5udtg2g@wqgprootl7yt>
References: <20260228005355.823048-1-xujiakai2025@iscas.ac.cn>
 <20260228005355.823048-4-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260228005355.823048-4-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=Co6ys34D c=1 sm=1 tr=0 ts=69a60a53 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9KHX6hOa5LuH6kksGFwA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 34IkuFDPRO0ozEUAz9sUWrw9gj9TPpEp
X-Proofpoint-ORIG-GUID: 34IkuFDPRO0ozEUAz9sUWrw9gj9TPpEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2NCBTYWx0ZWRfXxtbeZsEZ3+ES
 uQ1Rf+ygRCXZB6FPs8/axraR4Umf387JoamCqA0svurkYNzueHuO5iNvkY8eVVaeMjY8X/dx10H
 qN7PBaoh+4Vo2vLdlBvs2fdE+++OMS/JG9494OumVEG6STIZEgBPzE9clv+RLIf7wky07+bu2BI
 yAK0RjqMss/gp7BrCMR+Q340xSUhzcqN3JTVX100UwV9AOTeqxkbEFXyL7hZ69OZVZznm+7Bwsf
 7QwqwMQE7l8qRzSzw1+zNZVznUxCS0On2jJJUwiEEEs46yTENLyf7EGoHsnVxVPgVb/ngBbk4WT
 /Xxr2/slNVk4aN8HNEbgEUfLsKwm+fiep/ZoCB1Ms6mNhcW26ins+jemSbUgTqLwqPPHojXC1x7
 dN2vdvg1D+2tJItmbWkahf3mPvmtwPsChgbnyJvEw9yS1ZUZhL4ppAngKYze+hDotWJrZRQtM2o
 VBteEanadpl5fB7Nytg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_140821_185398_818381CD 
X-CRM114-Status: GOOD (  18.90  )
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

On Sat, Feb 28, 2026 at 12:53:55AM +0000, Jiakai Xu wrote:
> Add RISC-V KVM selftests to verify the SBI Steal-Time Accounting (STA)
> shared memory alignment requirements.
> 
> The SBI specification requires the STA shared memory GPA to be 64-byte
> aligned, or set to all-ones to explicitly disable steal-time accounting.
> This test verifies that KVM enforces the expected behavior when
> configuring the SBI STA shared memory via KVM_SET_ONE_REG.
> 
> Specifically, the test checks that:
> - misaligned GPAs are rejected with -EINVAL
> - 64-byte aligned GPAs are accepted
> - all-ones GPA is accepted
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V8 -> V9: Dropped __riscv guard around INVALID_GPA, which is common to
>            all architectures.
> V7 -> V8: Moved INVALID_GPA definition to kvm_util_types.h.
>           Removed comments in RISC-V check_steal_time_uapi().
>           Corrected reg.id assignment for SBI STA.
> V6 -> V7: Removed RISCV_SBI_STA_REG() macro addition and used existing
>            KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
>           Refined assertion messages per review feedback.
>           Split into two patches per Andrew Jones' suggestion:
>            Refactored UAPI tests from steal_time_init() into dedicated
>             check_steal_time_uapi() function and added empty stub for
>             RISC-V.
>            Filled in RISC-V stub with STA alignment tests. (this patch)
> ---
>  .../selftests/kvm/include/kvm_util_types.h    |  2 ++
>  tools/testing/selftests/kvm/steal_time.c      | 31 +++++++++++++++++++
>  2 files changed, 33 insertions(+)
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
