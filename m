Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A69606A338
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=To1YGWmY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fOPG6BKB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SHjiNpTBBsVu6za9mVSQuSP9YhblFgb4tnyLBEk6XvI=; b=To1YGWmYrAOif2i1LWcJJKBEF2
	t3owV196Ite6ugK7Cg6EQslWKeVDubnCtC1bCt3Ka0XLr7NC68JONuvUaVdzV0OHooj2n4TvDY27g
	Ew5QNcqRGOOmGEXqqvpZGaac6usD1lRA5DZWejGYw4prAQdHgMSpe5DDbZfTtla1e1zz5gPcVbzug
	kM3HiAsDK1UoXDdvBH7vWxkGmkaaI3hYU+8Ts0bFYdpDBZNd1klbHS/0wmccoaLRCMtUvZQUCM89B
	ZpQkI4vWtzHgPyva6PRUp32FU6PMXGeYUZF2MAd4TAb8mEJ8lRyMDgqqOJmY30ZLKHgyZeQ1Ic+Mu
	B/2GtjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTW6-00000009o39-2b8M;
	Thu, 12 Nov 2026 12:02:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTW3-00000009o2j-1hKE
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 12:02:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2401828f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 04:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794484972; x=1795089772; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4QOZ/ziloNp1YzjgE4+Apo8LJ81vNJIp5Lxxwu3DGk=;
        b=fOPG6BKBGvcavGihcs127sSdECqj55hUYqjutcjj8bznMltLdD5r8oRhkYWN1CfX32
         SC0+wXR/xLkvOdY5f+xGQi4pPQ7DHMFfsFj3op2bbnlYgu6idfgxzDYUxxmoDsGYYZ8p
         cOaAlQtmNcWO1/PPHiInuy/ui2T6xw1vCjXca6oFiAkEs2rgV6dT/c//Is788+Qv8JyN
         vHFzhwEV5zMLgTYZeNT+1fHia4E0nYCTVnm1SFQKEcN5XM7jxJRBBUltOmttq1WXPAph
         sJLQQXKp0/YLwojhXe+y2nETcxcdGTQAePXSQl8mx+/2ZhroP1n/Axn2I49XSaaUBold
         Z3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484972; x=1795089772;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4QOZ/ziloNp1YzjgE4+Apo8LJ81vNJIp5Lxxwu3DGk=;
        b=NEqxgIEH3qnXHYD7LTpOUugsHFQ4kC2LiD0n2265UzRjXMjrMxKew1QhjYSsXXfKXG
         zWFhSzeZjS8gCfrfKKMdZsrZF9kzU3XLfkJYFOnkLhPHh6Qc7r2WtFjuT4t9N9dEgoX/
         yVbLeQbScoRaGlsba7TKp2S8bm0UaM2TNWfFtM/7SnER+zAtyDWjmoKhhjumCRd6BR4N
         d6b6jVGL6OOkkmJQKfAXjUifsH93ylL9QdAePA8xVmbnW5DJ2WcJTcy/qUL9U9dIKIIK
         a51Q3NpPtgGfZRjfBkuMhMTLF8/4jcHz0ihJfFf4BgAMSfh8TzRUF3+N0wygSx4UfREd
         /ZQw==
X-Forwarded-Encrypted: i=1; AL+hErE74sjEn3F4TZg6GVQebON7VIdehPOJE66PRen4JIUeBTIpFFGIKWhqWkDKKiPOHlgvmm6PGuDQEh+alg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9opYQp8E9RRR16+b1cdiuERQVN9uHIqCIbEE+UMAmEKjgIB/Yp
	FLzPFrIekk0QAqiXjVMq2r4bEAvt/IM6Err/p193zFGPWiqDRoesdBwi
X-Gm-Gg: AYBFou3KWSD6WME7LHKFeGnZRU4Hikkupy4684UGleIX/sHboI6pE+C7PPl+AVZui2F
	sALZ8nFov7Pc5NVfv3Pkfqy6wWPJtacyPYL6AYCqNGiAxiG56LLr5mtiqsSi0PoVzYEfpn08vti
	PxbFdFFilX0AwqXgs7lfNN2qREvxj7vpu1aFAVc56sWEJNnETM3lvu0jrZX0l7jOoF7znrJxBoI
	vOc38AKtMyQ2uCUMbBrxVkjIGVX3mnbVxAHfEe7qM2T/8onII06+EH7cW2XSW68CnJx8WZWMwNz
	m87GUtDft20qyJdUg309lCEfp9EfQOaHGjCivhArAbzeyD+/ENWDxNPAcOUGJWM/Vsp+eS/kjA7
	NtwZhN5I7drdgfXisAjKSORyNgXr0ZyTElGH3odad/M473JMrQSZYQaMyv97OPWnrgTpXYRM9+Q
	CTiiR3NfOjGgagJyRFglmcQmF/CZP/8pMJknakYMHjCqNNUQe0tpnegad6gVluN98Chtmhg4oHw
	yPCmfrmnAJg6iaGPgQt9828sbNtQs9Ss/zXPMOCzWWRxxcF96aWnOkTAFj4o2DlL6Lj8+PtFcGn
	OvBNHw3wzURnwdFRMzTuIP2nwLqhQGcAZpWpymNNDqBNatK/xo2+2634vD2887ZMmA==
X-Received: by 2002:a05:6000:460b:b0:491:1e3f:a427 with SMTP id ffacd0b85a97d-499c898168fmr8711941f8f.42.1794484971757;
        Thu, 12 Nov 2026 04:02:51 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498367ba82csm16541261f8f.50.2026.11.12.04.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:02:51 -0800 (PST)
Date: Thu, 12 Nov 2026 12:02:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 oleg@redhat.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, bjorn@kernel.org, pulehui@huawei.com,
 puranjay@kernel.org, broonie@kernel.org, dave@stgolabs.net,
 jszhang@kernel.org, tglx@kernel.org, conor.dooley@microchip.com,
 thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
 rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com,
 debug@rivosinc.com, seanwascoding@gmail.com, andybnac@gmail.com,
 menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
 wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com,
 arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v10 2/9] riscv: add infrastructure for preemptible
 this_cpu operations
Message-ID: <20261112120248.5c8265e2@pumpkin>
In-Reply-To: <20261112104149.38589-3-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
	<20261112104149.38589-3-cuiyunhui@bytedance.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_040255_494010_366181C3 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 12 Nov 2026 18:41:42 +0800
Yunhui Cui <cuiyunhui@bytedance.com> wrote:

> +/*
> + * Mark a region where the per-CPU offset and address registers may need to
> + * be rewritten by exception return after migration.  The three registers
> + * must remain distinct for the whole region.
> + */
> +#define __PCPU_GPRS_BEGIN						\
> +	__DEFINE_ASM_GPR_NUMS						\
> +	__PCPU_GPRS_ASSERT_DISTINCT					\
> +	"li %[off], " __PCPU_GPRS_VALUE "\n"				\
> +	"sh %[off], %[gprs]\n"						\
> +	REG_L " %[off], %[pcpu_offset]\n"				\
> +	"add %[addr], %[pcp], %[off]\n"
> +
> +#define __PCPU_GPRS_END							\
> +	"sh zero, %[gprs]\n"

Those are quite nasty with all the hidden variable names.
It wouldn't do any harm to pass the names though.

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
