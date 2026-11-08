Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2BD606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QeCNpZpX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n2aSSj9Q;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kOXOspA+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Juoj8BTQqogawd1YWXvujxP4NKFasb9LhoEvDbXAq2k=; b=QeCNpZpXrZuwGD+vW4pelu2uWu
	X2xzetEvEo55YRDGHA3hQJjukOjXIKihQ1AiSFPCsY8kpYJ8jfqlSJl1y99w65X1y+zwERGrxecPD
	W15VIv6IrEZBvjYOEWS55VJwYrWmdDfoXRq5RvYLktKwj1mBnx98/yBXZSKs92TWbfezpR2WyPdst
	kIVRkifdg1ZMUt3sOzaZuxSKsjTij3BjHpakat6bKh5tW7x56UuuPQzkhQgattoRWPt/K+uaydgKr
	rZ23OjodYnrdg4fSgfuGpkRvEaZtCDJSyQVHkHPkxVlS00CVSUHERI6ui88O6wcCLTaQEABcxIYIo
	nIuQYSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ11T-0000000G2vH-4AA2;
	Sun, 08 Nov 2026 11:25:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ11Q-0000000G2ur-3QaY
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 11:25:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AgB7s1873018
	for <linux-riscv@lists.infradead.org>; Sun, 8 Nov 2026 11:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOlxpEI0OIo74XcS9Q0hNJZEahIo7Fytq0dNzWsexck=; b=n2aSSj9QWWBGfjoH
	/6ASyY5Km7bvDf8ol+FKDZ7QSeLoFj83Mu/m9vsWMUh7LrbGH67EeTS53s5y8I6b
	t+a92NVAJe5RR/ZDhvBlBHQqk7JFBC4Ibm3gVf7dWn/+6dS9Exo2B5kioYGMUpbg
	MgiEWdClDk1myZNzYbnPu6oI6MjOAfoKV816baviwCom7ZQQXyH+7buwVaxEkJfw
	jak3svBvLYIqUBTSiZuIDPItiD53z1/NPr++NlAXrI1TTJX+2PQ9QZoN27Wa3GDT
	vkkKJR6+rEHsTwM/hVFk+JHchYRkd4mhMZ3ZbPuFCGwBo0PINmcPEM/b0qP7s6TO
	YGwoqQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxav8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 11:25:15 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b34c1f226cso34717b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 03:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794137115; x=1794741915; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOlxpEI0OIo74XcS9Q0hNJZEahIo7Fytq0dNzWsexck=;
        b=kOXOspA+n3pKEyrdjhR8xrgTiobY/98rv/7cKnNczq2obfWGeBKgr5bVpUSjUucBUi
         Wi+7oFZ04NzTKiNCgo1giOxDfeBk5Y4fZYGYY7h0W6FyD1oHz9yZLoheoaafgmlnLvoh
         9fyScfFh6s1kIuUtd894gsvTm9xs7DPniQPvXrvvaTIcvOa0fg1MoE9Q/kdu2yN5D8B1
         1buT6+HLV8Tx0g+xhIdYMKNsvOG0BAvqCiLzOHlUh6xmYOA0xFi0+NotF8ek0487Xhs4
         J8gINY7el09xoMcgQ9R201Dmw+WJnYY7pui8HVcYGYOmbqaAyNoVnNMWjGAH5/UUI1mx
         OA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794137115; x=1794741915;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOlxpEI0OIo74XcS9Q0hNJZEahIo7Fytq0dNzWsexck=;
        b=eu8MLLEcAavCOD9WF3D8JM9rKilhGYnpYURFyvaqvhXSg24gxS5LD0WVwHDOwGnqIh
         q+Uypqb7SFU3g+Eo7vo4RqFzFH65wbYx3eUCOqxFpCY4IXpuYKJ2AYIVssnxlzjZfxZR
         1XRb3Bqw8NBCEi9G0eMJYtYNm1yIvFqXpL3ySlid7KMbMS9QBaiDgQKIJt+AWyaqwitI
         Mc724PI4xlSzwj+CdyAvj05l7Xfoci27rD3qji3Ajfsdcx70Q8Em8cWJ1sARiK83VI/v
         13VPKzvBW3k2knQDZ9lcytn28ktyrSBF1pTjyTKt5lC+A+GWuf+HbZ+ZK9JAE8FoC1Cb
         qI3w==
X-Gm-Message-State: APuU4Z/YF3GDsjri36YhcndzJSwFY386Zz9ypmDeX4wuo5rCwrgtz3Xw
	3Z28v7w6KnOwxHCK+NElFrHd/786nX5a5Q23N+KZxU25YgHzUfw/I+vkQU3hn0/tzVezMeyzr1i
	BfZv55oJENswF81kGJRSPQyCmeaE4czfKHB5SsZuK2uPsbOlB7PvvbkhAcdJymq8G7+by+A0=
X-Gm-Gg: AYBFou234NL2Wsu+od3gJxZC2BmIcLtRjTxADvTJe28SMIs2D5UIKJVOv2+SfbcetQz
	Kdh/oqiLi1HwAhk8HwzRMItTU7qo9xFpaY+b+fb00WZwPx/qhJ6vlic2MUx8kmg4nXiRbdVStb+
	fseZakuYq1hZIUymeljDFhIvTS5rSNlh73JDGYsSUV8m4VYG5d/ic0183+AtgEvmvcpW1o5JXw8
	TlySo3OabBndieulWANf04SMmih8K5VIDp78fdhd1+DJMSN3AeX/EDZ5gNUYa8ZV1SdzYqcK60l
	kyrDC7nmimIXgAzig7dJQv+KhQ2htJlRNZOQbb+DDTUFITt1zNNT7xtMBgbaHMIW7eyRQNGOWZo
	go7lGsk8G0usJszNmmZclXcuB/bqD5JZAOBhA1if1OJ+rCauW2+10u/Q02nQQtxfj6eUMfxcx6/
	J0BPP66Sksuw==
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr25150827b3.17.1794137115026;
        Sun, 08 Nov 2026 03:25:15 -0800 (PST)
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr25150737b3.17.1794137114479;
        Sun, 08 Nov 2026 03:25:14 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bc57e8bsm12483067b3.32.2026.11.08.03.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:25:13 -0800 (PST)
Date: Sun, 08 Nov 2026 06:24:53 -0500
Message-ID: <4879567e977e3f5023c6e7ddca133b1a.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Radim =?utf-8?b?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 4/6] riscv: hwprobe: Report Supm only when available
In-Reply-To: <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com> <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: So29EfCqZ3HKIRVEYHc86scRUyfREo2D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA0NSBTYWx0ZWRfXwwjIiDi3CC7e
 Yueu5h3rXDGgjsUfMiuYfZ2XxkbEmyHUq/UE20LcFr9hklqh2IdI2hQ3YvMy7rUgzpRPCAaoUV2
 prFrZ6qaXLBPrO543BV1g5F+oIdC7kYLCjhEHXVbp6KDkB6YWDFQMN57dziUIxDHQw3t1+jEi1G
 2WYASlT1iTDjJdx5BICteYlUl7tNiukvkNluH9t5fT96jq1xUWvq+/nwT3LSmTvGyn4rfwxy26r
 IkDlCjVpubJSwigVeiFAv8XjclAQYIaaWmnVkP8O6op7wZAql+Q6YBUyaIPF2Yatw03JOQqGwIs
 25KnpDAsq6fyzocvTX8KC/G6GeVnR4NyND6EGjVNSHgOxvgxA7DPQjAPUxKpUmYVXjsXj4xfbvK
 8C2ytLtPoDlzdQjCUQ4k7nzw4cXgg/QuTr9GjxXtlt/qO6T+N4r6K7q+atMhZAIUE4+mD8TpAfq
 XNX7ZR651DLOmXYy9Rw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA0NSBTYWx0ZWRfXyOD/3fboDdcQ
 3LJLzhPw/D9OjMM0G3CpmmKITh/QnlymPnVMX1D3ruqTBM62MqH2DI7dS39QZwua0IBzgmfylpr
 ogDhV1CH70cg5WIr5zGtsvK9iyzhy2o=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af05c1b cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NCzzBX7O5BTftGYIIH0A:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: So29EfCqZ3HKIRVEYHc86scRUyfREo2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_032516_973781_459B016B 
X-CRM114-Status: GOOD (  19.28  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Radim,

On Tue, 6 Oct 2026 09:53:01 +0200, Radim Krcmar wrote:
> The RISC-V ISA defines Supm as
>
>   "An extension that indicates that there is pointer-masking support
>   available in user mode, with some facility provided in the application
>   execution environment to control pointer masking."
>
> Our facility always returns -EINVAL unless Supm support is configured,
> the pointer masking ISA extension is globally present, and the user-mode
> is running in 64-bit mode.
>
> Hiding Supm in compat tasks would add complexity that doesn't seem
> justified as 32-bit code has no reason to look at Supm anyway.
> Reporting based on the a global sysctl toggle isn't done.
>
> Do not report Supm when some harts lack the extension, because it's not
> available on any hart in that case.
>
> (Reporting Supm when only PMLEN=0 is supported isn't great, but doesn't
>  violate the text of the extension and we ought to have Supm7 and Supm16
>  extensions if we care about precision.)

Since the kernel already knows whether that is the case, could this
block use riscv_have_user_pmlen() instead (55458c7347a3 "riscv: Add a
getter for user PMLEN support")? It exposes the have_user_pmlen_* flags
that set_tagged_addr_ctrl() consults, so hwprobe would report Supm only
when the prctl can actually enable a non-zero PMLEN:

	/* PMM=0 is "disabled"; Supm is usable only with a non-zero PMLEN. */
	if (riscv_have_user_pmlen(7) || riscv_have_user_pmlen(16))
		pair->value |= RISCV_HWPROBE_EXT_SUPM;

That also replaces both tests in the block above.
1) IS_ENABLED(CONFIG_RISCV_ISA_SUPM) is covered because the getter is a
static inline returning false when the option is off.
2) riscv_isa_extension_available(NULL, SUPM) is covered because
tagged_addr_init() returns before probing PMLEN unless Supm is present on
every hart, so both flags stay false.

7 and 16 are the only PMLEN values the current standard defines (one PMM
encoding is reserved for future values).

The RVA23 profile v1.0 requires "Supm: Pointer masking, with the
execution environment providing a means to select PMLEN=0 and PMLEN=7 at
minimum", and senvcfg.PMM=0 is defined as "Pointer masking is disabled
(PMLEN = 0)". That is why the rva23u64 base behavior key in my series [1]
checks riscv_have_user_pmlen(7), and v9 will keep that. But for
hwprobe's own Supm bit the getter seems the better fit than waiting for
Supm7/Supm16.

Guodong

[1] https://lore.kernel.org/linux-riscv/20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
