Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE89CE77188
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtIx5NStowjHLoF9IWjz4xchHjCs9hbzWJktmKHMBdw=; b=VTgIkHkEedQbKh
	9hQN4FDjXD14tqhmTn+5isHN2p5Hr85j5WqUBnPzT8XDknlEf/TiUzrxfxJAcy+rh3POEiMJl3Ah4
	kamu7RlC88GUyFH1NWxgt2JBXZpoHCEMJwYTr/4tdkjWI7+Lvsb8BcR5QTuQ95JmM4RaU2QdFly+c
	OWCgPTXp8ZB25MNIXzeLBxLYZTZE1w06DIQ35lctj5kbgB9df2rK7MMFXCOoJk66jrQhMmM/63QXx
	6UZU1JYX7TqpGaRyijx23huS6xxDdDnyUIldJoNfBO+d8VCJ5BPSPTbBXJM5DBuRioeqjUB05tfEg
	+EXPx9ePaa2k/U5vyFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUngk-00000001Ue0-33hP;
	Mon, 06 Jan 2025 14:02:38 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnej-00000001U8h-0WIr
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 14:00:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D5AB20003;
	Mon,  6 Jan 2025 14:00:27 +0000 (UTC)
Message-ID: <f48321fd-e618-4d68-9fb4-5c6b4bf697b6@ghiti.fr>
Date: Mon, 6 Jan 2025 15:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] riscv: signal: fix signal frame size
Content-Language: en-US
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, AndybnAC@gmail.com,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor.dooley@microchip.com>,
 Zhongqiu Han <quic_zhonhan@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Heiko Stuebner <heiko@sntech.de>
References: <20241220083926.19453-1-yongxuan.wang@sifive.com>
 <20241220083926.19453-2-yongxuan.wang@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241220083926.19453-2-yongxuan.wang@sifive.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_060033_323636_11414CCC 
X-CRM114-Status: GOOD (  13.64  )
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

Hi Yong-Xuan,

On 20/12/2024 09:39, Yong-Xuan Wang wrote:
> The signal context of certain RISC-V extensions will be appended after
> struct __riscv_extra_ext_header, which already includes an empty context
> header. Therefore, there is no need to preserve a separate hdr for the
> END of signal context.
>
> Fixes: 8ee0b41898fa ("riscv: signal: Add sigcontext save/restore for vector")
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Andy Chiu <AndybnAC@gmail.com>
> ---
>   arch/riscv/kernel/signal.c | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index dcd282419456..c3c517b9eee5 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -215,12 +215,6 @@ static size_t get_rt_frame_size(bool cal_all)
>   		if (cal_all || riscv_v_vstate_query(task_pt_regs(current)))
>   			total_context_size += riscv_v_sc_size;
>   	}
> -	/*
> -	 * Preserved a __riscv_ctx_hdr for END signal context header if an
> -	 * extension uses __riscv_extra_ext_header
> -	 */
> -	if (total_context_size)
> -		total_context_size += sizeof(struct __riscv_ctx_hdr);
>   
>   	frame_size += total_context_size;
>   


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
