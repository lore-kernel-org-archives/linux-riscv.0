Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902ABC77B60
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 02:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQlLbQDbnW0B6o5znQLQHl6b26js9HuqouUnIx9iRWY=; b=VFRLsyeqQDuhzF
	88Dm1SV+y2+HbfFMOJ6RuhRWWjxWmeDToqw9Yibqy1IOm48rfZnUIDmMo5UmGKTHHjzl91XpOKBix
	kEutyVRBZJ+hndoSr5UOyNYzEbfaE0UYmGJWbhO161rmjYsP76nDVz54lH4B6P1+32Df/Uf4aJNnQ
	XiPbglCFynQlqa+7jTd+bUZcABCb1lhi5Af8bRkM37pCcR4rcQSptKpIN1Fl2Y3Ngv8BhLPQJpaL5
	zE64VdlrQlfmNQt/RBU+e0vuQE/4fvrNC5mDWq1E7abMb2BurePEzsGaZ/Z4Cw3bW13v0xOXYsL8r
	lnWGVJGiNrLyCzXd/xmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptIz9-00F1mQ-1N;
	Mon, 01 May 2023 02:09:51 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptIz7-00F1lk-17;
	Mon, 01 May 2023 02:09:50 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso1454403b3a.2;
        Sun, 30 Apr 2023 19:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682906987; x=1685498987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Eyk0PLYhUbjWE4n42jdym7EnheKNlKKYg75uVcYf1E=;
        b=ej2DORolgq6APTgaWGF1rTxecNFSAGY5zNWHqwVAspQ+BEOHZDJl9TcpsOppeV1lAq
         0NUUH7Q+8cV6fMf4exeSQFzbHTefqWRHGfI4I3pS5D5G1B+eAW3KHLMnTY8bRBiH2ksU
         ICcFD4USx3vGd6v3ZKhIPPB1hbPTuyYL0JGin8RwiDqupEd/m0INjonmUH8Udg4KZdmM
         7GNUjQTo614dgYHJyj7Ir67CVRNezwK/NGzh/FdvrLHIkGf/o7N7v28oCEBTDI1Gsqti
         KaWgnbSf6nc1iaFsCd9ZiEB+Mr7zxsQw/xKFyAD/kGm9m+6fhsyENX8wl97fnsCOVCGP
         P3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682906987; x=1685498987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Eyk0PLYhUbjWE4n42jdym7EnheKNlKKYg75uVcYf1E=;
        b=GdCtoFjQAFIFew7pECEjJCrs21V75TAdQBc7Mnz+V9V6EpDO+1k6fpvpXEFdBzP7Vh
         GJDW+PNVzsoBhX6BfUdpIvCAPdGnRwJmnWzlyxwXVtDBhDOdtpEiGpPHOu3VYTvtpiOn
         EH2X8niHZd9twoiKMTDfJjoH3oUdsu3z6u8dyD3QHFkJf6M8ThzX4B5XzRc1LQrLOSd8
         yD+SHaY36DAtQNcyZVNwxXXdDyxtD+EyOIzYmWX0ewAkw9gjBrQMkdxiNU4vf0BL3Yae
         lIGcEHVF7O0o7tWJKxsnUjsIwalYLSdpmicKULrTpxjxaiECYlOObu11axpcbnA2X8N7
         n6wg==
X-Gm-Message-State: AC+VfDxbuQHTBnFuKNhTjgOSquT4fZAJDjacoaR0F/TaP1Pj84PieFNZ
	pqyaDbc16M5EOqgTzjJ4Qas=
X-Google-Smtp-Source: ACHHUZ69nIYLcyx16E+QD4v/GxJx1YWnJb6Yvw3BH6GzJZBaGWcw5IirZSSt9zK4kdUWwtnp2goVqg==
X-Received: by 2002:a05:6a20:7f97:b0:f3:67da:9db5 with SMTP id d23-20020a056a207f9700b000f367da9db5mr16782949pzj.38.1682906986948;
        Sun, 30 Apr 2023 19:09:46 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-13.three.co.id. [180.214.232.13])
        by smtp.gmail.com with ESMTPSA id w132-20020a62828a000000b00639eb4480f3sm18879586pfd.76.2023.04.30.19.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 19:09:46 -0700 (PDT)
Message-ID: <87275ef5-11bd-0574-5178-ad6119f3fa33@gmail.com>
Date: Mon, 1 May 2023 09:09:38 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] riscv: Enable perf counters user access only through
 perf
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
 <20230413161725.195417-5-alexghiti@rivosinc.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230413161725.195417-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_190949_388121_05242DAC 
X-CRM114-Status: UNSURE (   8.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/13/23 23:17, Alexandre Ghiti wrote:
> +The default value is 2, it enables the legacy mode, that is user space has
> +direct access to cycle, time and insret CSRs only.
>  

"The default value is 2, which enables legacy mode (user space has direct
access to cycle, time, and insret CSRs only)."

-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
