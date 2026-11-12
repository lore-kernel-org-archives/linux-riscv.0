Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1CC606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GVmz8c2M;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mq+JD4Bb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Up4mAE+8cZJPYA8deGYqP6EdihofbdrCD8B9MqyJdGQ=; b=GVmz8c2MBxaaSRiQdn6Ar+Vizk
	4P2pu14uXoCaS75HZ9Pk2ctw5HkZJ2dLdLavMxCFok8Z+/5NmLn4W7BN/oJ8mnErrIt5NYYTjdbz2
	MokPaOsCzIKkvedhtty8ryUL0BhE76Zu2nFGXMRacbR0Gb3htMFNTMcb571A1ou/QqOcO0ZQFlAe/
	5g2xxZKQ3dzhOjbLxtgTGnHl/5pMxM9iae3ZZ8vtcLp4laog0V8ga8iqfNwMf27XSXX7IsYvNY4h1
	B1nB1BIzRD9oLElz/SrkD0TOD/IfFbHwWOKLH8jw7Jk1Z14sWEyNDVbVMPM5n4pU+N+xqismj5Ova
	1LsCh7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTcb-00000009osK-07P2;
	Thu, 12 Nov 2026 12:09:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTcY-00000009orP-2Bla
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 12:09:39 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4922dbcee23so2454902f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 04:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794485376; x=1795090176; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yVXFtg5uv6jmT0ohsABv7mNA4IYkbP/bTmshktkMt3c=;
        b=mq+JD4BbdxT7Qxfk2TezbyK/Y3XPd3ylspfMeUfcnIRPDeGn+QSqje0kvNhrGKZfgC
         jjO+FMIIJMoHTW/nANMgLMMIx39vhE+JZvpvD3JzJqiuQTKQtGL/dBIdX6lpEgPxvm1T
         heUEjxHkNSg/KHNgnWB2vzbznNaLoFu27CmZqV0vtMgPg8WAGOQdMpuQ52EMiMMhSW86
         3PvHwwOQP2LxGaym9oFf9opy7CZAWo2Rs8rbrp+oCsvfAp021Ml7JQNqEM3NNJqUKWWA
         hKRApp/j9IXGuXdpz5mXBk053QxhIlY2Zskv0S6YQciHg3Z0BJ137Ju3siWFT2qdqby0
         t+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794485376; x=1795090176;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVXFtg5uv6jmT0ohsABv7mNA4IYkbP/bTmshktkMt3c=;
        b=fb/dnBF8b7TLpd96eBKXBc3kvyEKsxKISO9VF0RQs9McDvjFhKKu96AbO9w84yvy82
         CR3Njb6kpLKfS7l9zLYTbII0CmDjNsKMvv+jxJiGTuqbw9g8KUSLK5frkvKi4oQBOhHa
         9DDSKDTUo3/BgcR7ikwgkA9rUHKaX7QIzpakP0VLhrUiBzUGAZf4P0R6E3RT/F30h7in
         I5n1eT2ObANdC/wsCk4TLbtqxSDhgfyvqhWaxywaxmH+Ytt3NzgtQ14DEqOaIIZeM25t
         B4kwu6qQ/k3Dauj1cyO4zseLpT2yO1abnN/Xu1Kx3DpLucb6jhQ4rdYA4JavVDiuGO1q
         5a5A==
X-Forwarded-Encrypted: i=1; AL+hErHh04ucxlTqqjFLYQs3ZbMp7qOk8sLl+9yGfPoZWJd4RFiUgBkMY/cA0nmizlNhBsjw6pjRoO++XcevNw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/6FecdOXal/YaVzUcVrL7EbtZbHPwsXPrX0djcW7vaaOTQtmBn
	8pUymfQx7Yo4PzfQvZH1A/Vb7lqS+HhxRomJR10bAJaf7IRKACMd67iT
X-Gm-Gg: AYBFou1FGTJKR8P9zkKorrotqsFG2oQcY3zABm/KEqVtv1DafgBCiVHDsepy4/8V3dL
	rfGOHOtv6MbNXnoJojEnMgpZuZ6QVKruClgmvgEJyMyxRrt6vy2hOBtLDgIHbY0Z/O82XoOQtb6
	lBF5AGGvEdC6OxA2UYYwPTtsXOnIcq1j3mPDhGJsdzNGvwu0l7nmgn9AIGz5vxLnUt72gEC7l57
	LsvfZqRnXqc3po1+TIdrW59j1yFgbskI6aM0XS6zTsaKnyXUawEpkSI6L3+eW0ur0kfJ9lSFRI0
	WGSV07WEcd90xvgTGGE7PLhEnRI8AB2sRxSSPiMNz8/4rSO+vdrniGRsUk7g0mJqLhe1AElX6PT
	fE/KEqRQSsqhIrXpiWN4sBsaBMK1jGngOq8fMkZVp7ZusBq4kfn7ZeAFnfKaFRv2zeC27MKExbU
	if4GuNpJL8uSIbOYExvTOhn6nYwlMFtWL1CDHBj+ukj0xHAoIksDq5Q+aR+FBY3cHqZfStSIflF
	Db6AALufKJZtgxcmhY8X0cWj/oRNjFwGwmYO/H/lOOD/gus2CMGl5lO5qhFTNPlTIaQ9bYuUil+
	9JWsV6slNvBvEojkeVgeyxeVikXbd7bQoT3kRvfigHq0nU4XZKTx7rr6EGp1b+dxYw==
X-Received: by 2002:a05:6000:288b:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-499c3aaa3ecmr10258629f8f.8.1794485375130;
        Thu, 12 Nov 2026 04:09:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49895f4e6ffsm15149402f8f.16.2026.11.12.04.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:09:34 -0800 (PST)
Date: Thu, 12 Nov 2026 12:09:28 +0000
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
Subject: Re: [PATCH v10 5/9] riscv: implement preemptible this_cpu
 add_return operations
Message-ID: <20261112120928.24145d44@pumpkin>
In-Reply-To: <20261112104149.38589-6-cuiyunhui@bytedance.com>
References: <20261112104149.38589-1-cuiyunhui@bytedance.com>
	<20261112104149.38589-6-cuiyunhui@bytedance.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_040938_703196_E0F27D04 
X-CRM114-Status: UNSURE (   8.89  )
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

On Thu, 12 Nov 2026 18:41:45 +0800
Yunhui Cui <cuiyunhui@bytedance.com> wrote:

> Apply the recoverable per-CPU address handling to add-return operations.
> 
> Native-width AMOs return the old value, so derive the new value required
> by the percpu API from the operand. Use Zabha for subword operations when
> available, or a masked LR/SC sequence that returns the updated field.

I can't help feeling that some of this code is the same as that for
normal atomic accesses.
Can they me merged?

David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
