Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7DBC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 22:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MM40YQduzukvdgSDaB5H7x8IgdwqFA3Zy2/qMgIJ5p4=; b=d/lkJz9IY7X3rt
	ge62rMhkzfngb8nNm1R8NlF35I8wwtRV67is/NnKyv0TnyldnAYExqMT4ElqjMzIrP4+YiwRimw+T
	x5A9NnsRR+DuPKc2K9P1sn9nbaKpHyS0Hr+Du8nM2Y29Reg+4oP13+QKRMJ4qnpbaLK38+8VUuTHc
	iQDM/ejsVzP0UqUALRGPfRYKO5uhoViJyCN0k4vam16aEXJJtwwD4hFGdXiRVXhBe3dKqs7G3jdzj
	/xlgzoMAOMERl0j0mGecREXASs1ZzTmnlXq4ZEw6IzioN8cGwjr1Lt6f8aEntoHml9w66SGs99HZT
	St0cyuTKjdsxBNiqPOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8U8D-000AWP-2W; Thu, 22 Dec 2022 22:33:41 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8U83-000ARo-65
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 22:33:32 +0000
Received: by mail-pj1-x1036.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso7114143pjp.4
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 14:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUqs8vcCeo3WHQ/wZsX/ATHWp0759Uw7X3vsCU3FtHY=;
        b=DwnHKs3c9lTnGCWPnEzrJd+HhxNJulfG2ievlpH2dXgxDg7pINpzCpKD8PFkAq4lvp
         OdzF1+9aG+FHTRi9Wa5C0W2LKepu1HbsED+iz/mAlHxrqhOnIcJPcei0dNgfQYTKU0to
         Sp3/v3vTR/c6mHaDigsc1vtniqXux4MPjatC7soqFopT56aPnWsYQAZVBT3eUtEZtNYD
         a137DrIn7gCuvJ65bLjneCZ++COlZ1G0hSL52cS7C+ZZWU7p/D327yHiGfei6n5IMzKt
         oiIp6OUmNScsilZl/rie6tId5bqQlxQRWlukBsTTYJb10kBIuNZfHNur0ymEFVmV/j1d
         OPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUqs8vcCeo3WHQ/wZsX/ATHWp0759Uw7X3vsCU3FtHY=;
        b=DtPr7C8L7lhv7GVDv/hLxteXH2b/VR2pHtaCTh94is4cEsGDLCuv1F5u2DYc7YUCL0
         bd0UT+qOA8BMYzC5p/I7zuRf5uUoS7YhgXQ9Ka6igdZLw1EPDwTqyASuL/9NuNG+umug
         FDXmsb31uApxN2zhgSljAnOsl7ushTBd9n4vMzuxp0Jyzh2/B+/E4NU+IcO2OJLtGZoJ
         331fG0iIPGgnKVEh+gkN1uXEoC9wJnWUKogPw8dtGp37RjfZ2fcjrSYjsEeQDKYdXliU
         9x0JkI83jI+2q0GMDNbj7MW481Nd6yi0q0D0Bw6CxrMe/jyt7OUXxqruuDMByZZq3srY
         QOVQ==
X-Gm-Message-State: AFqh2kpOCNrXOOymGk543qYjO84c+ltGW/wqxjC41QPSVRKLOI7UXElX
	n9MaZ/PLeXWJuder3vWn+Oa4omuLAM02anEG
X-Google-Smtp-Source: AMrXdXtIMyF6DUH+b6qp7alupaBEj70iepcAoTKuZjgt46jEFosCxcG59S9c6rru4hIHDbMvEpz6wA==
X-Received: by 2002:a17:902:bc45:b0:191:3c3d:86fd with SMTP id t5-20020a170902bc4500b001913c3d86fdmr8146280plz.48.1671748409505;
        Thu, 22 Dec 2022 14:33:29 -0800 (PST)
Received: from [192.168.101.16] ([75.147.178.105])
        by smtp.gmail.com with ESMTPSA id l6-20020a170903120600b00190c6518e30sm961407plh.243.2022.12.22.14.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 14:33:28 -0800 (PST)
Message-ID: <68fdb6e2-ed53-32ea-52ca-1e4d913ff7f3@linaro.org>
Date: Thu, 22 Dec 2022 14:33:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Vineet Gupta <vineetg@rivosinc.com>,
 Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>,
 Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
 <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <1631497278-29829-3-git-send-email-vincent.chen@sifive.com>
 <871r5sd1zq.fsf@oldenburg.str.redhat.com>
 <20210913135247.GL13220@brightrain.aerifal.cx>
 <CABvJ_xjGZ3S0oAkT08x4DToQFdcUH06omk2OTT1EHDZRJ-2wKg@mail.gmail.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_143331_316137_A38A7809 
X-CRM114-Status: GOOD (  10.84  )
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

On 12/22/22 10:33, Andy Chiu wrote:
> I wrote a PoC patch for this and it has been pushed into the following git tree:
> https://github.com/sifive/riscv-linux/tree/dev/andyc/for-next-v13

I had a look at your include/uapi/, and it looks good.
Mere nits:

> struct __riscv_q_ext_state {
> 	__u64 f[64] __attribute__((aligned(16)));
> 	__u32 fcsr;
> 	/*
> 	 * Reserved for expansion of sigcontext structure.  Currently zeroed
> 	 * upon signal, and must be zero upon sigreturn.
> 	 */
> 	__u32 reserved[3];
> };
> 
> struct __riscv_ctx_hdr {
> 	__u32 magic;
> 	__u32 size;
> 	__u32 reserved;
> };

Thinking about the _next_ extension on the chain, perhaps drop the 3rd word from here, so 
that (&hdr + 1) is 8-byte aligned (which may be enough depending on what the extension 
contains)?

> struct __riscv_extra_ext_header {
> 	__u64 ignored[64] __attribute__((aligned(16)));
> 	__u32 padding;
> 	/*
> 	 * Reserved for expansion of sigcontext structure.  Currently zeroed
> 	 * upon signal, and must be zero upon sigreturn.
> 	 */
> 	struct __riscv_ctx_hdr hdr;
> };

     __u32 __padding[129]
or
     __u64 __padding[65]

depending on your answer to the above?

It might reduce confusion to move (or replicate, for redundancy) the aligned(16) from the 
innermost __riscv_q_ext_state.f[] to the outermost sc_fpregs and/or sigcontext.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
