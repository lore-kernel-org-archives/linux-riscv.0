Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0ACDC36011
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 19:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRtZrWiaarSvA8WIS+d4WJWno3Ji+dDivVM0ZdXzlbc=; b=Z0ePMSzM0657Au
	VblMZ0dPSC1xQgpDwx4Dn7dC4gs+Im8aVyFMOMGh6AlzgK/yXQE+njQXDgmQnll2bDGCYIXnTAZa3
	NocvyHCXeAJ2SzGqN8QnJ4Kw5YW517TcKDUo8oIkyLq0t4xJELPFqnsuL2JINipI9asFgUzAUd5W1
	qKvnzzMrdqFPXxGGUGDPDT5gjqcH2CJ7DG5/pN2qrQ6cX50fLZOVPxR1V5C1htzTU02pnLuT/sXd0
	DObLQjXqFgwoVy169p15BFMqqicpnXxwzuZhsUXqf5wv/Qktn//N74R/70p6/SjdTx8pGRnVk2MKs
	J8v1eXruSt+/fd+fJ+EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKzE-00000001Evo-3R3v;
	Mon, 31 Mar 2025 19:39:56 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKzC-00000001EvS-2bfU
	for linux-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 19:39:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5499659e669so323558e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Mar 2025 12:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743449992; x=1744054792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KE46Inlegp6APD9xE6trTWfYli76kOte9df0I7MWvBQ=;
        b=H1HKVXl92GiE9Z90viZCvLM3aNV8m/BPFsotKjP1MrRSNwA3Y6h2WVzjgNxo4BBnNc
         NOHv09fhLBWQjofeMeMAjD47Pb6/nBM/+xJAzGzKrnQ1q5Hy/buoUQSlg6EJBOiNe8Vj
         we2OYhu1alt5zG97Dq/47q38EgwfJuNzivdkU9HnkZaUjE8hnlv5PnUoZ0uwUpG6hkpd
         ZJGpQ7704INZ4Om6LGJnMUdgaQaz/0jYdf+qNP0YDZZHiL7+/37iI9zSegNE5dtjE5KU
         /sx8jhfQ3zzmJNdaqg4xTGK5QvzzaTjuaYCkhEI91ZLBhLShTDJH8pYiYudZYO7P36rm
         ixLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743449992; x=1744054792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KE46Inlegp6APD9xE6trTWfYli76kOte9df0I7MWvBQ=;
        b=Q1J8y5rQNDfZG+0NVX/zvNXcJypPctJzuSV5h66XO1RLTFadrVVKVEHN2bRYDMMcY0
         DUCp9+U6ftyxngdIkCqohyoPvTVyfkdu3A860bvxx7LkUDSnZKTVCyEDSFpM6FGBjEFN
         R0eKAV1etOoMKSVZwg3ubJvF88O6RzA9QzNxQHiPwnDfRdITzbJGfThQRBn3gAnLeeoR
         K2WI7s9U4uUqbIVkeONhSV2WAfd+dcp4Rhdhgj2oFEqMiueIq3ZfY0B3Y/sbCXiXIHts
         rL7sc0M1Hew9GPhZ/VVSdyVh+8w/m/duIJzkfYuC0uNCf5Zg5Vnr5gdZNmljOk8GAn0U
         bwWQ==
X-Gm-Message-State: AOJu0YxagbL5ViPPN0uWXeffsWST8XGqfHaCjT6Yz3eoW+EHujbDLeOP
	lKS6BL5lotXf0ux5PNxsaym55Mg9snpCLjM+ggHTKWgerboDcbE+
X-Gm-Gg: ASbGncu3DpD142TkPmLUqN85hGYLBM+HwpNEZg2In0Cd+OqWkoCaidd2soYBLQiJcPL
	/halFDWnz093QyDiSPnl5raW14GtQJW1LYNfozp8tuB9UeBG/zLPHpnlICzcbihObrVGQebpkd5
	HwindwpUEw3IXruX2eQH+Q/px1wyQbwtZaPf/vjbeZKePa1FGPAQm57WuDNo8EArI0aU0ajIqqa
	ebkEBaPw4Kr9Xx97Ec/HXg459NV7X/Lfyu6PBUnTWlCuDJ/MmZdS33QDTxrCaGKH1RUeeL3OpdY
	P2BfY5OVpvKQUEGRtI+eUajWqnyu89eiX+4O9CFGFITCtvGQsUbqc9uk/DlC6EzPBrorS1IUlr9
	sC85LaFShXvLrP0xDdqC69YqioFp7K/ZzmVQ=
X-Google-Smtp-Source: AGHT+IHtvjwnzdADUjoykjBM/nZjeA0797jOcEMUJpoq4gEQBt2aHMNBmOBXLVHt4e4Gi37A9IwK2A==
X-Received: by 2002:a05:6512:b1d:b0:545:bb6:8e41 with SMTP id 2adb3069b0e04-54c0a536fd8mr64283e87.52.1743449992095;
        Mon, 31 Mar 2025 12:39:52 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1204:5508:6e19:c6a3:9875? (parmesan.int.kasm.eu. [2001:678:a5c:1204:5508:6e19:c6a3:9875])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a0b39sm1219278e87.229.2025.03.31.12.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 12:39:51 -0700 (PDT)
Message-ID: <256412b3-9878-41be-8a22-78d5356b8479@gmail.com>
Date: Mon, 31 Mar 2025 21:39:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH FOR-NEXT] riscv: Add norvc after .option arch in runtime
 const
To: Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
Content-Language: en-US, sv-SE
From: Klara Modin <klarasmodin@gmail.com>
In-Reply-To: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_123954_663582_DFCE83F1 
X-CRM114-Status: GOOD (  11.08  )
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

On 2025-03-31 20:45, Charlie Jenkins wrote:
> .option arch clobbers .option norvc. Prevent gas from emitting
> compressed instructions in the runtime const alternative blocks by
> setting .option norvc after .option arch. This issue starts appearing on
> gcc 15, which adds zca to the march.
> 
> Reported by: Klara Modin <klarasmodin@gmail.com>
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: a44fb5722199 ("riscv: Add runtime constant support")
> Closes: https://lore.kernel.org/all/cc8f3525-20b7-445b-877b-2add28a160a2@gmail.com/
> ---
>   arch/riscv/include/asm/runtime-const.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index c07d049fdd5d2999c57d8a90e7363829c5462368..451fd76b881152919f22de8f5c56b51171acbf3c 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -56,6 +56,7 @@
>   #define RISCV_RUNTIME_CONST_64_ZBA				\
>   	".option push\n\t"					\
>   	".option arch,+zba\n\t"					\
> +	".option norvc\n\t"					\
>   	"slli	%[__tmp],%[__tmp],32\n\t"			\
>   	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
>   	"nop\n\t"						\
> @@ -65,6 +66,7 @@
>   #define RISCV_RUNTIME_CONST_64_ZBKB				\
>   	".option push\n\t"					\
>   	".option arch,+zbkb\n\t"				\
> +	".option norvc\n\t"					\
>   	"pack	%[__ret],%[__ret],%[__tmp]\n\t"			\
>   	"nop\n\t"						\
>   	"nop\n\t"						\
> 
> ---
> base-commit: b2117b630c48be69d2782ed79fefe35dcd192ce6
> change-id: 20250331-fix_runtime_const_norvc-407af1f24541

Thanks!

Tested-by: Klara Modin <klarasmodin@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
