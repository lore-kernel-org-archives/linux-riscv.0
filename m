Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE81ECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 22:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Date:Message-Id:
	Subject:References:In-Reply-To:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGkubwc6PwuasPR80Q7iK7g492mmv6qrCUZCmZkmwGw=; b=lCk+KYMTpAiE+A
	31cee4fVRQiQAcrHi1Lm0xof1rWExt6tNxZsgFiZK5Sq3B0xLWhQB9ivA5LQe9TcPry3witqrBtGo
	EPsw0hvRZLkXwa7yc6LYybETN65v9CXQYFUtpsv9lbSonv9yRWsIBJi1NpCSFjBQhhBsFua1+p0XF
	Ky9jq9ZU97VNwclpRXjQxZHxsKo8X69E+kCcgHeswgeV9ozi5L7Njmn4tUjoGx03u+ym7FKRBKXn0
	s4VlnkPW9TMDUW/92aERP/yyutYO0DCAoyscm4C4gt57lFiZI4V/ay+r3FNuWV9JHOY7IYpLBMbys
	gffkg0safjTt8SI++lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooXlF-0038mc-Qr; Fri, 28 Oct 2022 22:23:33 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooXl9-0038kE-Q6
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 22:23:29 +0000
Received: by mail-pj1-x102c.google.com with SMTP id h14so5789163pjv.4
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 15:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ihcw8NxFdUArfYGoYPQQdxW1/H3YB3VcR84XFdSGYw=;
        b=qkUdA/p6Q+cT+8qbm8kiLgu1x0YNjH2FbQwsJNCU/3V9tcobjtro71CSmddyIPYZX6
         WOZqnfgUhhOrytqaJt9vv3HUx7O9tFANNfKCRymPc4g9slE2WjBb2B8slG58lAepI3cs
         GLmZtln4A6EKXTQMy15TsD2yJRUd4/fl5R9DcsnxwUmruYwYUsHF3bnz2KdeEbrk2aAt
         x58BOTPidIbZvqmYVLOOVPMd/HSU9qktmEYSFZfD687C9FizvVUXcS2aKY3ULTaOJMTt
         G3hspNTEafiQsVXYU5Cp6fe6OXnowU08tTf+2MNkxhIg4r2HsEFqmmuq5r9HD7nk+hRs
         ntGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Ihcw8NxFdUArfYGoYPQQdxW1/H3YB3VcR84XFdSGYw=;
        b=oS5yhVujMFWAVd1KnWbZ/SfX6/X3m6M8X+/Hhq00taOAoAJezCoDGW1Ryl6U8l+Uy5
         gO5YMmbpe+uI5kZD+N3dwsrT0MaKFk7VD0ND+EyewzSTAkkpPO13UevAVS4lp6V62Dd7
         /tZSDkaGDYxt1Ch7L3l6h9DjB5T4qcq1Sa4Q4HAKn7KXFqsYevi87TDkvPqF8wZLQqu9
         Hp9GSw4pq682n3qAz+p2kKjisrUffqiKP+AX8rtOVioPhCy3oamQ6vAzAaqP2G0mMyc0
         FIpmrpHATcXfposh8eBc7khCOnr335PA5R5rBxouQGsrpxNo74a1lgAmDhV023qpS5RP
         xjIg==
X-Gm-Message-State: ACrzQf2zK5epQ/Q+IyuaLrZJpINqLNXham6uJ3QkSuCg+01LZfyn3lbH
	6Ewpvi42uQEBLjIT5fGMCOEHabO0+0lb3w==
X-Google-Smtp-Source: AMsMyM5FkW8lXL0j94ViobvJHEOvz1kLRmJFT1+V9+Q2wyOOwmHy+AcAQB7vEC9Iy2KxwNKEI0ahRA==
X-Received: by 2002:a17:90a:dc10:b0:213:90f3:27c9 with SMTP id i16-20020a17090adc1000b0021390f327c9mr1517757pjv.240.1666995805267;
        Fri, 28 Oct 2022 15:23:25 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d16-20020a170903231000b00186b04776b0sm2537002plh.118.2022.10.28.15.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 15:23:24 -0700 (PDT)
In-Reply-To: <20221010182848.GA28029@watet-ms7b87>
References: <20221010182848.GA28029@watet-ms7b87>
Subject: Re: [PATCH v2] riscv: fix styling in ucontext header
Message-Id: <166699579461.30369.17737854094128986667.b4-ty@rivosinc.com>
Date: Fri, 28 Oct 2022 15:23:14 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Cleo John <waterdev@galaxycrow.de>, Albert Ou <aou@eecs.berkeley.edu>,
  Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_152327_860841_1549E9B1 
X-CRM114-Status: UNSURE (   6.81  )
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

On Mon, 10 Oct 2022 20:28:48 +0200, Cleo John wrote:
> Change the two comments in ucontext.h by getting them up to
> the coding style proposed by torvalds.
> 
> 

Applied, thanks!

[1/1] riscv: fix styling in ucontext header
      https://git.kernel.org/palmer/c/3558927fc2b2

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
