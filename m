Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38037C636D3
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 21:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9SxsolZDhCmDa08SdWb7aWLYkyOguwLpXN53fiBio0=; b=u2a+iY2cElxH7j
	311XNO5sDaJ7V52sUIeXvpZ4rzEmWHgkd/K5TdV6+d55+IRQ8jhOjeaG5yAftTFhPkFdeBlFDQEIL
	W5ouWQRX3BtuDpmQCpZeCGxzUavkmxymGAsBw7z7YhIc3n1gGO48bU6u2F7/re7BuFbNMYHx7ScgD
	+K/7bFEay3ZCRxkGT77F2w8krnbhGmIWYIPLC+4uJLS01+4ViJIHRZBLiTRDlGAkexSY/k7Zmc06T
	va9LJ+HVXODvwzcHCcbGEbtS36C5aI4UFiiIfDP4I0fIn4azvbOrt9GHKHmKRqGyjgCQGzh966EYR
	xzVxf7hhP0Qc3PD6mUBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPVMk-00DTtc-TJ; Tue, 07 Feb 2023 21:19:02 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPVMg-00DTsj-RW
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 21:19:00 +0000
Received: by mail-pj1-x102f.google.com with SMTP id pj3so16345006pjb.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 13:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0gc5keUcXf5U42aZBPSOFCzzi7Lkby3WUvehhaBKbA=;
        b=VqOOoB7rkICaPhrTdeAoRHvNfIQCJ204MGU94d8Ggkr7EJAlzUjNF6kI/HBErZMhOp
         KGEISZNOzaMddz4lMLtnAVatyKPHy3CSqtNu16mmrONEYSTrN8Kwqg3qIRPRfklPS731
         3N/FY1m5zvleZ9i8gm1hNsQTd+u1BdBGVp43u3Ilnf7Yk5VLnGotDQ2JDMa09VAcm269
         sLGzQXo3ZmjltnUG+QjnS67iSMClmBlZ3PtTN5cVAh7WrjrXih9vJ4vZBqBvFtt7Dmll
         dkT20QzzfY3K0GCQukTcpcog5RDGqcuk3w8cYTDVTpds1IU7PpV4RaeykVv3m6oEg6vk
         2lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0gc5keUcXf5U42aZBPSOFCzzi7Lkby3WUvehhaBKbA=;
        b=xATP1YkYsv8M59zRTFBOEj6JYcCXoYVZcemggm8tq9zSPt5U4GQbVOrcCsrxe0tKkG
         GgPduoqmvxy02fZ0FRZqXFEbBhN2hYprVhCwrT4m72Np8HxGnJD8Rw5pd6RSX25dYjTq
         95CEQ4rqnufMFX1fexHthWBNPDKNj/ATknbha9xVh9NGaJfHaxURSJ8jGW5IvgCMWVxJ
         Fpi9NNwYRcjOT+UpaEr2gIiQ1lsWKlnk67lMCZscbQU3s0mk/R2TFbcE/qC0hRE/gJx+
         D56mYTvJNmjlncTueFnTZkIXgYmSgTZ+0UAY7p4Lw3B4v15jSdEcei5vy5c3JcwFY5cl
         12Uw==
X-Gm-Message-State: AO0yUKWPqvSNOBAszyeyVu2vRD4JATvO+DXmfAPdW6EbBRqYk95B8Ppj
	QnFRp8ZyPjkUdltNGM6J4zToQQ==
X-Google-Smtp-Source: AK7set/tcOAwjePvlCcDOHogBghvok/qBEaHnXi93rhmnMJDEPyGUHdl1epz2OQpc7DQKqLl1X7mQg==
X-Received: by 2002:a17:903:124f:b0:199:1a32:413c with SMTP id u15-20020a170903124f00b001991a32413cmr4865089plh.45.1675804734592;
        Tue, 07 Feb 2023 13:18:54 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id p21-20020a170902ead500b001991fd2faabsm3875816pld.277.2023.02.07.13.18.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 13:18:54 -0800 (PST)
Message-ID: <91cd3bf5-9c68-df1e-32a8-55f2cfedd84a@rivosinc.com>
Date: Tue, 7 Feb 2023 13:18:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH -next v13 10/19] riscv: Allocate user's vector context in
 the first-use trap
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>, Jisheng Zhang
 <jszhang@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Guo Ren <guoren@kernel.org>, Li Zhengyu <lizhengyu3@huawei.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Changbin Du <changbin.du@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
 <20230125142056.18356-11-andy.chiu@sifive.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <20230125142056.18356-11-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_131859_110636_4343448F 
X-CRM114-Status: GOOD (  10.74  )
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

Hi Andy,

On 1/25/23 06:20, Andy Chiu wrote:
> +static bool insn_is_vector(u32 insn_buf)
> +{
> +	u32 opcode = insn_buf & __INSN_OPCODE_MASK;
> +	/*
> +	 * All V-related instructions, including CSR operations are 4-Byte. So,
> +	 * do not handle if the instruction length is not 4-Byte.
> +	 */
> +	if (unlikely(GET_INSN_LENGTH(insn_buf) != 4))
> +		return false;
> +	if (opcode == OPCODE_VECTOR) {
> +		return true;
> +	} else if (opcode == OPCODE_LOADFP || opcode == OPCODE_STOREFP) {
> +		u32 width = EXTRACT_LOAD_STORE_FP_WIDTH(insn_buf);
> +
> +		if (width == LSFP_WIDTH_RVV_8 || width == LSFP_WIDTH_RVV_16 ||
> +		    width == LSFP_WIDTH_RVV_32 || width == LSFP_WIDTH_RVV_64)
> +			return true;

What is the purpose of checking FP opcodes here ?

> +	} else if (opcode == RVG_OPCODE_SYSTEM) {
> +		u32 csr = EXTRACT_SYSTEM_CSR(insn_buf);
> +
> +		if ((csr >= CSR_VSTART && csr <= CSR_VCSR) ||
> +		    (csr >= CSR_VL && csr <= CSR_VLENB))
> +			return true;
> +	}
> +	return false;
> +}


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
