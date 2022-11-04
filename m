Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7AFC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 05:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8J77uT/Az4OX3JO6U1VUsY2PhbYRDrWkZ4F+dVeUw40=; b=RYI6fbXyucnaMU
	aSKi8BIJ/DmI/Vz9UjXIsprhHbTBt7a2jVSg8VW3xVxlQSxUWwU5pT5MvkBfUWbjTrboQAa9Jfj+A
	As0z6qDEYP36OIVFV9Mh14SAQ1x49CKUf2WXS58fkcvy7seKccu+o3NnVfB6keYtDC4vmblH7VDsH
	APk3SHj2hq/uXpQRNICremXwYRy0nVi2Nn9C1SgI6mlQfgYxIFzoj6M0F2C+jB7JZpC3J7TwPNNQ7
	8gJFA6Fv8GZRvQAxBc3HewwipsP1ih7Zc+fCsh1mq4elUMRY5T8wnB2pqJJ8+MdVAlhTeFltx7MJO
	Q58qcxzrAMIlVoj1XE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqp10-002Pu0-8n; Fri, 04 Nov 2022 05:13:14 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqp0w-002PtJ-EV
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 05:13:12 +0000
Received: by mail-pf1-x433.google.com with SMTP id m6so3609625pfb.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 22:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQhQGhyhGquSofm52cjAAkU6Fzx8FE6v+R8p+O6DonQ=;
        b=cJgBTj5+VK2r4tr77YFAeNubKerNgFNWlQq2YZIN7dm5oQ2/r9sUKFEBmmcFYNq2pG
         diq3eRTq7fNDrxAHCvG31SylCqlRYRVgWOkaP3gzTvhdm0nXKhj7ytcnnQQ4EOKUsSDu
         P4lTdlKb4bWwfOYzAm7jYbSoGnBcpJQdskxf/dqmfr7Hqgg1j0lfE5g2TuF9YMq+Ljbq
         MrbtXTUjNAPXJGuy7pxIZqpymM/h9WQoANH8djkBV67Awn2HSScsZp3CXEJuUxYpsrv/
         HRrC9mVhph5jRF75AT+/Px0sXAloN9Fi1NtO0u2gHqCRny5D8PKCevmfj7fYQSPkpFdD
         EoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GQhQGhyhGquSofm52cjAAkU6Fzx8FE6v+R8p+O6DonQ=;
        b=DHCgxxqrPX7zsMojRe/gtm27iDLtzBGMHgtsYNQO+jyNen8rDKS8+ea294q89MLorq
         416yo5VVFM592P77YLpWdPDpUB7rXZwse+BJ3tSSu3gvCno2dNVqBI16dWNnHpCqFl19
         X1/u55FYn0oC7q+DmvcICDifSek2MzC2+zDALxawNIki8bia4I/gkvdEyW9sgSDTg5yR
         N9i6YFiwj/xPzZFV2h+O8pg9QvlNxuFev33MqTczRmkSwCpRrjOO6vLyhFp/Nr5fZGfS
         WtKXIKvLxx4gbBxOK2zrnm2A66//nR3JNUO2+349vuPbcwluEiTyPDQysYQtaJ6vZfHq
         Aa8Q==
X-Gm-Message-State: ACrzQf0hdkSnCYf0Lbh9YQbsFZs1ZfzXOGcsSt0U4KYkfjmUXrQd5mX9
	Pdv/x580ZYzpCKcikt909QrslQ==
X-Google-Smtp-Source: AMsMyM4CyTZNCkRG3R9ouuVtH4B+s5xPrYGR2coHQzAUQpnyFNaXjJqXDJOxwdFboWeApUXZ95VUqA==
X-Received: by 2002:a05:6a00:4206:b0:56c:2e49:ca0d with SMTP id cd6-20020a056a00420600b0056c2e49ca0dmr34132547pfb.22.1667538787394;
        Thu, 03 Nov 2022 22:13:07 -0700 (PDT)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id h15-20020a170902680f00b00186cf82717fsm1578086plk.165.2022.11.03.22.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 22:13:06 -0700 (PDT)
Message-ID: <784babf1-ca2b-0a7e-7bdb-c767304c3dd5@rivosinc.com>
Date: Thu, 3 Nov 2022 22:13:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v12 07/17] riscv: Add vector struct and assembler
 definitions
Content-Language: en-US
To: Chris Stillson <stillson@rivosinc.com>
Cc: Greentime Hu <greentime.hu@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Qinglin Pan
 <panqinglin2020@iscas.ac.cn>, Alexandre Ghiti
 <alexandre.ghiti@canonical.com>, Arnd Bergmann <arnd@arndb.de>,
 Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
 <20220921214439.1491510-7-stillson@rivosinc.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <20220921214439.1491510-7-stillson@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_221310_707317_3538A7EA 
X-CRM114-Status: GOOD (  17.77  )
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

On 9/21/22 14:43, Chris Stillson wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
> 
> Add vector state context struct in struct thread and asm-offsets.c
> definitions.
> 
> The vector registers will be saved in datap pointer of __riscv_v_state. It
> will be dynamically allocated in kernel space. It will be put right after
> the __riscv_v_state data structure in user space.

"Vector state includes vector reg file and additional dynamic 
configuration CSRs. To handle variable sized reg file context (due to 
implementation defined ref size) and to enable lazy-allocation of this, 
there's datap which points to appropriate location on user/kernel mode 
stack as relevant..."

Something like above.

> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 19eedd4af4cd..95917a2b24f9 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -39,6 +39,7 @@ struct thread_struct {
>   	unsigned long s[12];	/* s[0]: frame pointer */
>   	struct __riscv_d_ext_state fstate;
>   	unsigned long bad_cause;
> +	struct __riscv_v_state vstate;

I think this patch should be preparatory, don't wire up the vstate in 
thread_struct now. Only do it when the save/restore calls are wired up 
in low level code.


> +struct __riscv_v_state {
> +	unsigned long vstart;
> +	unsigned long vl;
> +	unsigned long vtype;
> +	unsigned long vcsr;
> +	void *datap;
> +	/*
> +	 * In signal handler, datap will be set a correct user stack offset
> +	 * and vector registers will be copied to the address of datap
> +	 * pointer.
> +	 *
> +	 * In ptrace syscall, datap will be set to zero and the vector
> +	 * registers will be copied to the address right after this
> +	 * structure.
> +	 */

Nice.

>   
> +	OFFSET(RISCV_V_STATE_VSTART, __riscv_v_state, vstart);
> +	OFFSET(RISCV_V_STATE_VL, __riscv_v_state, vl);
> +	OFFSET(RISCV_V_STATE_VTYPE, __riscv_v_state, vtype);
> +	OFFSET(RISCV_V_STATE_VCSR, __riscv_v_state, vcsr);
> +	OFFSET(RISCV_V_STATE_DATAP, __riscv_v_state, datap);
> +

Ok.

Also move the __vstate_{save,restore} functions from patch 5/17 here.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
