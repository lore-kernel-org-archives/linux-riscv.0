Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B1BE63FE5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Apr 2026 18:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBHqma77O2PruBa4m3+u8Hzz0hmgvKWEuFQonT5vu14=; b=Ip0nwo7t+yCYVx
	bnz6ayWxwBsDD1OPmEeuwoDAFsjVndUncuPnx5ULvG0lnt0+eQ9Gfnv5sDy/0R4YmvXLS4pAlXSmW
	yLPbcNuUA0muq5IhChm5cM8MyT7ZMzgX2lc8uVtmPo4u1XQteeOP5y/HqLH2A89+EanWyf6OyLW2o
	UaELPBqr4OqJ32mHboKEci5Fa8aNoaDq1OcmqdrgOt+Gcpe6/4DNOGLm10MRPGaV55J2qeISWuveG
	020QWiJHBEeFXAT6F/16DtM3ZjsRh9UE0f2BZniaiJM+ag2cfmXzKid1M5oGvxMtU+KejKwbYyz5M
	cq1UN+1Excq5geIKEBPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w95lF-00000003fN6-3Bid;
	Sat, 04 Apr 2026 18:30:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w95lD-00000003fMJ-2APX
	for linux-riscv@lists.infradead.org;
	Sat, 04 Apr 2026 18:30:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344BZeT3883559
	for <linux-riscv@lists.infradead.org>; Sat, 4 Apr 2026 18:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZAhnUMRLmcuKZOyI5wbt1Fs
	LKvLY6ymjIDrFpm94Vo=; b=AaTvDD/AaECxzOw+j83T3cVf42tZqXUnRXqztmtq
	wJaY6vJ2KBjBvOfLbJHaF1Ae24UmRJ1iSIqm+WJioy+YNJEJqlE9AXJRHCw5GjmL
	bfaOSkfQscEj3GtG2r/PZt6iLu5PymAMA1ip4zTDuQKxqHNSq/sxFXrMLIWghFLf
	daEtT1D8GYSiezX/btwQaUC6nzgB2CtEpTH3CthxUWZ+34YFUomghvBQVdO7bM7C
	+GhSvcl4n3uX4w0W/hBLE6W0aCzSEZSgi+Y7Yq/MpbOl1qujcZckGAzynKsDC1jy
	C/UkMC4375wTZLDfOrzqyGJG15avBFTt6U8m50jaA0ZUsg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daudd17cb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2026 18:30:17 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dbb97a2b6eso4145040a34.3
        for <linux-riscv@lists.infradead.org>; Sat, 04 Apr 2026 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775327416; x=1775932216; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZAhnUMRLmcuKZOyI5wbt1FsLKvLY6ymjIDrFpm94Vo=;
        b=QIeyc7NnOWNlTLpFH3ZpTCsGgMaL2Hzai4j0uKWFJUICwYXSnXt3O8b59Z/4ku18tM
         YncnsxkveQm0w7Ags5iXnl3wCXQgBOho7QvN7wcvRrGVOvBJTj57RVj1+Js0L79COAVC
         emzyikpGQzuJoyv2ZBUxtrbKdAv/+6AGQLTSc6Nqbr8Z4Vre7jSzWzXvnSPWYKM4LKnD
         ZZfhfAZzPJLFz7B5IvZa8tUu/tLyGI+g9vaTZGs4HF+YQADIwWuVz4oUoSucslWHjZts
         09MOk+3LSyjHdwqpSp5NUdKyo4/4xwjsDvPda/ZmItTNrxGO7D9LZNq1EVWwWNc85/ZP
         CuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775327416; x=1775932216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZAhnUMRLmcuKZOyI5wbt1FsLKvLY6ymjIDrFpm94Vo=;
        b=ZFlg0jki3SJEuSOtHxv/ytyjK/qFicUsRmNQezpxkdaDTvsbRKPe2J/rtSrqEWjLGo
         U9Q02Nr+5j/g7B88gUbsskYL6gfM0AO5uG+QOAGmg0q6xHdYjXevNqgXFGW6c+uV/g//
         L7XIC/gQN+2+FLziGjUP6gPzamq5iw6jorgkO5P42FVFcy4x30iEeJ54E4wlQrJzQUDG
         Y+vOSgnIi9ZtbeDxp30x5FbeI4nRbnwZyIWsKa1nvz7PoS2ZJlreArkHhDykhNYv+9+a
         zRGTPelpjINOUNtsO6RYaRmZe6fc9fAFqpMadURaiYmIeGM0BZE/oFpg+JDL6I2Tq6iI
         m8rA==
X-Forwarded-Encrypted: i=1; AJvYcCUMxReJWIeBOWvBBTrV3SALiG8M3MheHVZfGjqWUofQRphlYMNcIPUVgJEyy1FZVVgDLTKzRwxVYAEbng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4u9oRWZVMZlyhtEdnEG3JPXUA65ramlXiDWDDQeE1cDhRwHfW
	eA4gAtjSC6icrk5EKjZn4HRE/7AtVS5wlFWtqJSNpSvn4vghUrEr7t+M8lN/h5J8NbYv938Z70j
	st+VgOHgm3VswG+M8KNIbbUf+BWkHmhVGIv85KP8/admXRIgohF+QYz8nhV0u9yMGQYI4unk=
X-Gm-Gg: AeBDieuvZ2SsiXBGJc+kr0MbNuRvqvIRCXORNMLiBDwnygHe1TbzD6CnuIb7O1PzSf0
	pjV1rd9c2tQL46gW3FgC7mRzzgGj2VZWmMsb98xkCwZZz7H/KnQmc19QroQZCj+jo0IeBJ98ore
	L6y9riVwBLTq00HPpb0x/fdNDfjmeurfnG70OzRZwwiy+/HO4JcKVuuSExcm+vNClOlSo54Ja9Y
	OKi26TkXB7pArdV/2Nny6B6rUmpgThZnXe7FhwkNb8h/b3iyE/bS7pNtM7NOTALvfONS1wNZAVa
	xRXXuEMchgTgVq2x2mMNxzAufBWalzd4k07mrxNQgaawfMFnCate21kHXwt9Vt5Us7uXS7SP3qg
	hgHA4/53Kyb7TpTUQS6NUqUdlOjfyP4o=
X-Received: by 2002:a05:6830:34a3:b0:7d7:fba1:f950 with SMTP id 46e09a7af769-7dbb7177bd4mr4168297a34.26.1775327416480;
        Sat, 04 Apr 2026 11:30:16 -0700 (PDT)
X-Received: by 2002:a05:6830:34a3:b0:7d7:fba1:f950 with SMTP id 46e09a7af769-7dbb7177bd4mr4168287a34.26.1775327416085;
        Sat, 04 Apr 2026 11:30:16 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dbd663a4a5sm420968a34.25.2026.04.04.11.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 11:30:15 -0700 (PDT)
Date: Sat, 4 Apr 2026 13:30:15 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix shift-out-of-bounds in
 make_xfence_request()
Message-ID: <uqj5bh45tsakyjwswvjb6mv3esvui4eq5tic65o3b7ljoev45e@s5rlgtdi5dlf>
References: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403232011.2394966-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: HFpJfMON5n7-GdXEJZ1EqLfBW4vR2eJs
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69d158b9 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xswxI8Vr1sjf9FmkDDsA:9 a=CjuIK1q_8ugA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE3NSBTYWx0ZWRfX0IXuww39MIyI
 nvzt25qOF9bLjvYoD4oHFUEOIbOL4+5mCioTpqpjSPdYBfqq+Hh0gapotYqji61HBlXLOVmuw87
 i1oKyjibVn7N7ecb2KC6s+YPq9n6kCbpcsJvpZUSkmuRvgis1yfA6Ci8zTQd4TpFvIgeZ0P1u8v
 HHP+KR+gebVoVA50M+sHxhFWrae3TeNxVUv4ZjopRmC5Q3vQvGQDwLLSynWAKbfoH0sJ30bkja7
 XoFUyX/ptHSaGp/ytQZhqOoTPZ6xB2tuq+gnrjP0vdKfLo2ZY5FQn4VvnVYJCftwGu71YvOkRxk
 y4fNGB5ZxAYFomhLnq2SShQzf4P+tQcSUut8YetcUq2k8UmqLMhzxfM4WcZy9Ng2r1yL4PlqbRh
 NzasMv8bjrFjAETnoeDHx3P248CzdkwYTk1uOR6sW34y0NWrsE43II0Zc2kZyvyhrQf1lZw1SY8
 KZQkDTCxZq+CKQQakAw==
X-Proofpoint-GUID: HFpJfMON5n7-GdXEJZ1EqLfBW4vR2eJs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_113019_554639_56C83FDF 
X-CRM114-Status: GOOD (  21.27  )
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

On Fri, Apr 03, 2026 at 11:20:11PM +0000, Jiakai Xu wrote:
> The make_xfence_request() function uses a shift operation to check if a
> vCPU is in the hart mask:
> 
>   if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
> 
> However, when the difference between vcpu_id and hbase
> is >= BITS_PER_LONG, the shift operation causes undefined behavior.
> 
> This was detected by UBSAN:
>   UBSAN: shift-out-of-bounds in arch/riscv/kvm/tlb.c:343:23
>   shift exponent 256 is too large for 64-bit type 'long unsigned int'
> 
> Fix this by adding a bounds check before the shift operation.
> 
> This bug was found by fuzzing the KVM RISC-V interface.
> 
> Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> ---
> V1 -> V2:
> - Dropped 'idx' variable and compared vcpu_id against hbase directly,
>   as suggested by Andrew Jones.
> ---
>  arch/riscv/kvm/tlb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index ff1aeac4eb8eb..439c20c2775ab 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -338,7 +338,8 @@ static void make_xfence_request(struct kvm *kvm,
>  	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		if (hbase != -1UL) {
> -			if (vcpu->vcpu_id < hbase)
> +			if (vcpu->vcpu_id < hbase ||
> +				vcpu->vcpu_id >= hbase + BITS_PER_LONG)
>  				continue;
>  			if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
>  				continue;
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
