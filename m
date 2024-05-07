Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9ABC10F1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 May 2024 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6Ino9HuE2VIGEDmxalbqjpvPDVItoG3+/XGm3px7fA=; b=IETlXP/ztWBF1v
	MXqILWfeytAVrvquszXh4OSySoLmKh4E7ty4tc2jDklPJ2tAHgG9x+Li6g5GXz1ECSqcsPKYLKaiN
	VK9w9T1f6xz+0bIuijXIyIdKAESIj4saH199wKt34VSAbZwdASH/a/NWJu6BRDkCxgOCbN8Ay5cSM
	QSJF9Vdk35n7O+6h3eFzS8Y2crbYbiy7j0p2P7I2PUAqwqjjc1TuqNZgfdJe+LEisnpsnPdfmh260
	B/wtYB6HVLPMvNr6NRhoFYWmGEgvQKRLaUzlofqcnCreK8GeZzbbzeXfsX/tAfWsk3mVbYdgKqWyC
	b7dFX795pbHj8DpRJ3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4JxB-0000000AvcO-3HGt;
	Tue, 07 May 2024 12:29:53 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Jx6-0000000AvZ9-3Hlh
	for linux-riscv@lists.infradead.org;
	Tue, 07 May 2024 12:29:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VYcvb2m0yzvRyB;
	Tue,  7 May 2024 20:26:19 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A31618007D;
	Tue,  7 May 2024 20:29:38 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 7 May 2024 20:29:37 +0800
Message-ID: <b83c2369-eb9a-435c-8530-52a26dc39c09@huawei.com>
Date: Tue, 7 May 2024 20:29:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv, bpf: Fix typo in comment
Content-Language: en-US
To: Xiao Wang <xiao.w.wang@intel.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <luke.r.nels@gmail.com>,
	<xi.wang@gmail.com>, <bjorn@kernel.org>
CC: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
	<martin.lau@linux.dev>, <eddyz87@gmail.com>, <song@kernel.org>,
	<yonghong.song@linux.dev>, <john.fastabend@gmail.com>, <kpsingh@kernel.org>,
	<sdf@google.com>, <haoluo@google.com>, <jolsa@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>, <haicheng.li@intel.com>
References: <20240507111618.437121-1-xiao.w.wang@intel.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20240507111618.437121-1-xiao.w.wang@intel.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_052949_040121_749474BD 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 2024/5/7 19:16, Xiao Wang wrote:
> We can use either "instruction" or "insn" in the comment.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>   arch/riscv/net/bpf_jit.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/net/bpf_jit.h b/arch/riscv/net/bpf_jit.h
> index 18a7885ba95e..c1b6b44a2f49 100644
> --- a/arch/riscv/net/bpf_jit.h
> +++ b/arch/riscv/net/bpf_jit.h
> @@ -611,7 +611,7 @@ static inline u32 rv_nop(void)
>   	return rv_i_insn(0, 0, 0, 0, 0x13);
>   }
>   
> -/* RVC instrutions. */
> +/* RVC instructions. */
>   
>   static inline u16 rvc_addi4spn(u8 rd, u32 imm10)
>   {
> @@ -740,7 +740,7 @@ static inline u16 rvc_swsp(u32 imm8, u8 rs2)
>   	return rv_css_insn(0x6, imm, rs2, 0x2);
>   }
>   
> -/* RVZBB instrutions. */
> +/* RVZBB instructions. */
>   static inline u32 rvzbb_sextb(u8 rd, u8 rs1)
>   {
>   	return rv_i_insn(0x604, rs1, 1, rd, 0x13);

Reviewed-by: Pu Lehui <pulehui@huawei.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
