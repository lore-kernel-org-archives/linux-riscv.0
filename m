Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B641C05027
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 15:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+oiPWjKJCNYSfUVutfUn+ajtj8Js9250ccwNhe2aZ4=; b=YwcUs5Kyn+WIgX
	KS/M+T9W+Suosb8Gt5PFNNEMcnQGQ7JDNqMCmXE/fD1wR1W9aX2A69XBpS9cg2OdRKY1xU9JYb+Ht
	W4CIMXA8fHzF6r29Ct+uPBDHllhOAab4FPKdg9I1o4X6whjJneEPOPe88pQ8QnOSv5VKvWzwtpluv
	3lCGOmIi/5gYNH/rjJCOamtmyWaAI5XOeXJdhcVfYHZp7WBXv0AnSShaLhcP3p6xLgmYnh7JXAuLp
	7X+1QFgkc5qVJT0sSrcvZab3ElEdHxMMSHLgMDGI1MTKOk7L8FmGawAaRYwWxSw4J4u7SvGjz78jR
	x6Be7h6RoDzScx2ITIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pREa7-00Bk1d-Pc; Sun, 12 Feb 2023 15:47:59 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pREa4-00BjyV-0F
	for linux-riscv@lists.infradead.org; Sun, 12 Feb 2023 15:47:57 +0000
Received: by mail-oi1-x22b.google.com with SMTP id bx13so8357599oib.13
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 07:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v40wNeUT3ozSt1M2CMP46GOKsa/j+2vOrjFqtiKLKW8=;
        b=MoOjcWLjjGhbrR/V+M1ATj5QTIVwkCT/1OkSoS6AcP8Vw8Vj6WRP2LvjJWv4lzXh8s
         65pUoDGxY45CeXyB3YB23ridmcTB2lFajk7MgiaSpNQLv3tnGBvEtLVePOx8ElWM4GS0
         IHRXpJVeD1NaUL+/8sdYGp0e9XaAqQnncvU4JZAOVnsjiI4MJWRwZ4cC2U83D2pKnly/
         D3atrakXt945KwmPB2VluawA9zQX8/oUkKHjbABpQ6xcPW+86AovLpKDG+hE7d6JPPV6
         qxJt7JYFsJiolZjkhVUtz33XA5znbDOd45I1NW+/gbOTXFOGKyayHLFLhr9I1TDRbSY+
         iV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v40wNeUT3ozSt1M2CMP46GOKsa/j+2vOrjFqtiKLKW8=;
        b=x028uHv9VIXG48neVOfvi8gKGebRLJnttGDDe1hzGsMcnhPzwSQTZYBEDDzbvjHS2S
         utbN5SIprWQ2VQ+lFbV0+Oy5FFsN0rXIPAtJ9HCgYPHRojCxctzhUFzfSlxZdhBs0Hk5
         +kGzWhO8g4GQb6kczLrhL3raXlwnm62iKL2zZewe8DzlT5MU48Rm/DP7wII7FcvfBMXT
         EXcP3eNU6QvJsbAvWBtlzEoHV7vR0vvX87GztMm9WNPnBo+45UwXDB544ZiVPcj8p8V1
         yQA9Ijgz0UIY8o0H2ZNqvkfHOxwGLNZFCTzy/sypH9boRt2YCRUvOB865x3xWTvKim0I
         mfrA==
X-Gm-Message-State: AO0yUKWFAmCSzA8pTZ+3kt1697/0AiaK4Y2w7iopD25kakgxKtc+xKLM
	BVYumoo9K8bI9s95GpxSqSE=
X-Google-Smtp-Source: AK7set/nRy2Y2yifT26gdPDNvR+8c5bv8rRSRZjgJjd7v4MjrH+A1EoRxP0+0iWlf0OPoRpQ86O0Zw==
X-Received: by 2002:a05:6808:4d6:b0:378:5ce3:b390 with SMTP id a22-20020a05680804d600b003785ce3b390mr10599176oie.2.1676216874098;
        Sun, 12 Feb 2023 07:47:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v84-20020acade57000000b003458d346a60sm4185043oig.25.2023.02.12.07.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 07:47:53 -0800 (PST)
Date: Sun, 12 Feb 2023 07:47:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	jszhang@kernel.org, Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v5 2/2] RISC-V: add zbb support to string functions
Message-ID: <20230212154752.GA3760831@roeck-us.net>
References: <20230113212301.3534711-1-heiko@sntech.de>
 <20230113212301.3534711-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230113212301.3534711-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_074756_096307_9C03DE16 
X-CRM114-Status: GOOD (  16.59  )
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

Hi,

On Fri, Jan 13, 2023 at 10:23:01PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Add handling for ZBB extension and add support for using it as a
> variant for optimized string functions.
> 
> Support for the Zbb-str-variants is limited to the GNU-assembler
> for now, as LLVM has not yet acquired the functionality to
> selectively change the arch option in assembler code.
> This is still under review at
>     https://reviews.llvm.org/D123515
> 
> Co-developed-by: Christoph Muellner <christoph.muellner@vrull.eu>
> Signed-off-by: Christoph Muellner <christoph.muellner@vrull.eu>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

With this patch in linux-next, the qemu "virt" emulation no longer finds
a root filesystem. I don't know how it is related, but the problem is
seen for all types of devices I tried to boot from. Booting from initrd
still works.

There are also repeated

WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:63 patch_insn_write+0x222/0x2f6

in the log, but that appears to be unrelated.

Guenter

---
bisect log:

# bad: [6ba8a227fd19d19779005fb66ad7562608e1df83] Add linux-next specific files for 20230210
# good: [4ec5183ec48656cec489c49f989c508b68b518e3] Linux 6.2-rc7
git bisect start 'HEAD' 'v6.2-rc7'
# bad: [94613f0efc69ed41f9229ef5c294db3ec37145da] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect bad 94613f0efc69ed41f9229ef5c294db3ec37145da
# bad: [8928ece68de4371dc6e1d3336d3029c1e18ae3b4] Merge branch 'for_next' of git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git
git bisect bad 8928ece68de4371dc6e1d3336d3029c1e18ae3b4
# good: [78a9f460e33d103256f3abb38f02f4759710c7dc] soc: document merges
git bisect good 78a9f460e33d103256f3abb38f02f4759710c7dc
# good: [b35b2472ebafa29d0bbe79fbee1da6ef3c4ec619] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
git bisect good b35b2472ebafa29d0bbe79fbee1da6ef3c4ec619
# bad: [57a87a64b520c37dd49f5fde84d09a4adb391180] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
git bisect bad 57a87a64b520c37dd49f5fde84d09a4adb391180
# good: [cfc8ba01cc84b24ec6eb293ec9fba893f7cd4581] Merge branch 'clk-next' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
git bisect good cfc8ba01cc84b24ec6eb293ec9fba893f7cd4581
# good: [6acecfa485d3de955c35a18730c106ddf1e7600e] powerpc/kcsan: Add KCSAN Support
git bisect good 6acecfa485d3de955c35a18730c106ddf1e7600e
# good: [8a16dea453dbc3e834b162640028e505882cd11e] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
git bisect good 8a16dea453dbc3e834b162640028e505882cd11e
# good: [6be1ff430dab9fc047762b10b2c9669399ea1f37] riscv: pgtable: Fixup comment for KERN_VIRT_SIZE
git bisect good 6be1ff430dab9fc047762b10b2c9669399ea1f37
# good: [e0c267e03b0c77c9ac79ac08eada41ba8eb1b95f] riscv: module: move find_section to module.h
git bisect good e0c267e03b0c77c9ac79ac08eada41ba8eb1b95f
# good: [e8ad17d2b5f38e595d597a3e2419d6d7cc727b17] riscv: KVM: Switch has_svinval() to riscv_has_extension_unlikely()
git bisect good e8ad17d2b5f38e595d597a3e2419d6d7cc727b17
# bad: [75ab93a244a516d1d3c03c4e27d5d0deff76ebfb] Merge patch series "Zbb string optimizations"
git bisect bad 75ab93a244a516d1d3c03c4e27d5d0deff76ebfb
# bad: [b6fcdb191e36f82336f9b5e126d51c02e7323480] RISC-V: add zbb support to string functions
git bisect bad b6fcdb191e36f82336f9b5e126d51c02e7323480
# good: [56e0790c7f9e59ba6a0f4b59981d1d6fbf43efb0] RISC-V: add infrastructure to allow different str* implementations
git bisect good 56e0790c7f9e59ba6a0f4b59981d1d6fbf43efb0
# first bad commit: [b6fcdb191e36f82336f9b5e126d51c02e7323480] RISC-V: add zbb support to string functions

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
