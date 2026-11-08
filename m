Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E7A606A322
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 21:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=puAlJ9F3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RKueN4c6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zn0EvfaACZn0c9sRBHYA7xlEBx4XmrbsSunYmBnMuQI=; b=puAlJ9F3J/Qw87dIuGZbPeRkYg
	i7+SoMnkWTnJETodmTHIEsZ3Duq6G04Gn0gaWqHb/78DaLdWk1Ms4/wzlatC0d5SYR79sod1N0d29
	2dD/Lg/Ci+PfxB8+SxEEirmLJbiDPBvY985UWzTLVjVPuphxa6k4g8FvLOOt4esbSecYMrqIFFuMh
	D3sa999foS6Ko8ymRkqhwe4c5Sj36oqdfxHUYOXc8BK/CAJ6lgKzgSwSii1I89e32pPT1esLKrkS4
	wudDPYZYmwwNKY4yGPwziGHGSAvPHfJjkRxV7wHy1LNzdn16VpRLwwG8HIdREfFdwckCTxtfQuJZ3
	4jO2Vyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAVZ-0000000Gjmd-16Aw;
	Sun, 08 Nov 2026 21:33:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAVW-0000000Gjly-1o47
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 21:32:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-490d59c3edaso182172f8f.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 13:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173576; x=1794778376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zV+j1o90j03z3/bSKQRAMr2OAwRnzRNXDWN23pKxKc=;
        b=RKueN4c6ZMNyVhxX32pxnr+4Mk+HoWhJK2mPnE7oCZbrA2fHQuoOfxAqJ7GtR5mPv8
         OV1cmTKbVWXS+5MRX4JJP+TPrb61kY6+XzaNqv5K+lPn6DV+v1Z2p59r2OBiGpQrNXIc
         9ejJBCXgDPJAfd+6xXyxXrSq+Bqaq0quHGMuWdajPYhDd7lgyXFqp+VT22TCflG8rDKS
         AKdQUeMC398XAH7E+kpZxtJdPFIQRrA7tLMZLYUSvB/dUsRP21Wz+i8VhGxoeLLRfdRh
         DtZorBQWu61TwJcLV7dxSrfPgimZ4qehA0J4d8Nb5Z1UjBudyGkcz3snLnpvo4U6RPYU
         b8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173576; x=1794778376;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2zV+j1o90j03z3/bSKQRAMr2OAwRnzRNXDWN23pKxKc=;
        b=eVXXAO3ZFA5+5IeNVvEeOAbZrh9//S6X+ssNqSYzoOBeHy2f4IgLECL9Qc8ESiqOfm
         MI8QwgSqzI/iL+iSuKaTsMocg9zfzvglDr2kLy0a69MjLkcg+RxGiEQXV89iZXtkJT6s
         KBZIb3mf0oBITulxWB9DFc3XTAie9A1XWznnuY+9gBmHZ8jWC/5yOloRBcPmS4JnWJQz
         Csps8xt8cFoU57Atm/d5uihwgrcn+0XrhBSub2OYQBtH9/IkCSeH9n3lloU8s4H+gdXB
         1FdbZmSN+tByTU5+xwwlf/OTb9Yw9vZWJUDN5g+uav41Y+Ziz9bjHcRNYyBq2N6lw+hu
         xcVQ==
X-Forwarded-Encrypted: i=1; AL+hErFonv9LWAh6Jxm3EVCVR09rJICCXD8EodT5cx/lsDYF/ylkD9pHUWAmT9mW08GWfX1XKgdi1zbw7gLz+w==@lists.infradead.org
X-Gm-Message-State: APuU4Z96pcujR4WBJFmkmZxTRXEaSW98+POVdIpPnjgSgi/KSmdceJxm
	8q5hp15fsXLDagEZwXMtxg9F2eG7FDTxs47E3a2LLZ+RseOFZgXEzN5c
X-Gm-Gg: AYBFou14Rya92hNZyzTlgMSmjXfaDFJj7sjSzbxMjgjGWGmEMMbVLxcjp0LiPJLpnYY
	SY9EBDmOQ4SmCttktj25dIqgKdaLDRuZHJ/qkqtKnJcY+w1+NxEOX4uUB61HvpxIko1eBzDbWfi
	G2RqV+LDN4E4B9Iw23Kew5+slCBsNmo77c55ZQg1C7afwtnx09VepXvwe7v8TOOgPEgEfx4QYqC
	wnq3Hp+d1pxTpi59C5BfdmXhTkHJrPSRoQ6otNbPRIO4VCkJn98SulnH+698Px8HIIEa6cxEQ/L
	/2i6nUqj/3Zin0Y4EAZ9oiLPmnF2OAKZHHH6V4I1lcXbjLi2ywUt5g8TXJxMEsULWQOm0IIpZkN
	FTTOdk9yE/uVVF7dAKfC9215UF9d7j9dTHaoFLcnOgNbBRbYhILHfmN9rBYs9/HNQK4EwlSUCgk
	bhyS0dNpOR532YuV5pms7r6FoTZh/DLjNukdqZJ4HrctaEO8aIbmXuNUIwSwJ2pCNuCedoIL4LL
	OjUnoXJjh28f/R+1X/CIik34DzUfjhN2AsZChSu6SqXk9wUeoT/v9uA8BRWQCTpM9NAJESVri1R
	liYpvtStrTaWsvzAoOlyZSk4dYIk9LANEq88XDmZ6rtNUpuo3hkxDpfPuLStR22b
X-Received: by 2002:a05:6000:26c8:b0:48f:bbb5:61c2 with SMTP id ffacd0b85a97d-4958852d3b8mr5479500f8f.4.1794173576292;
        Sun, 08 Nov 2026 13:32:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm5861840f8f.36.2026.11.08.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:32:56 -0800 (PST)
Date: Sun, 8 Nov 2026 21:32:54 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, cl@gentwo.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, bjorn@kernel.org,
 pulehui@huawei.com, puranjay@kernel.org, thuth@redhat.com,
 ajones@ventanamicro.com, ben.dooks@codethink.co.uk,
 rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com,
 conor.dooley@microchip.com, tglx@kernel.org, debug@rivosinc.com,
 seanwascoding@gmail.com, andybnac@gmail.com, menglong8.dong@gmail.com,
 cyrilbur@tenstorrent.com, wangruikang@iscas.ac.cn, atishp@rivosinc.com,
 apatel@ventanamicro.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org,
 arnd@arndb.de, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, qingfang.deng@siflower.com.cn,
 linux-arch@vger.kernel.org, llvm@lists.linux.dev, dave@stgolabs.net,
 emil@etsalapatis.com, ihor.solodrai@linux.dev, broonie@kernel.org
Subject: Re: [PATCH v9 1/3] riscv: implement this_cpu operations
Message-ID: <20261108213254.67805ef0@pumpkin>
In-Reply-To: <20261108110406.97495-2-cuiyunhui@bytedance.com>
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
	<20261108110406.97495-2-cuiyunhui@bytedance.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_133258_491608_2D0BAB22 
X-CRM114-Status: UNSURE (   6.84  )
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

On Sun,  8 Nov 2026 19:04:04 +0800
Yunhui Cui <cuiyunhui@bytedance.com> wrote:

> RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
> operations use generic implementations that disable local interrupts.
> 
> Implement RISC-V-specific this_cpu operations with preemption disabled
> to keep accesses on the current CPU. 

Have you looked at some of the schemes (I think arm64 has the latest,
but also s390) that do most per-cpu ops without disabling preemption.
In particular they save the pre-emption check when pre-emption
is enabled.

Basically the code tells the scheduler which register contains the
per-cpu data so that it can be 'magically' flipped during a context
switch.

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
