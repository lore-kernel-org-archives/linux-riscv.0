Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E7CC47089
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 03:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLAPjLrIBXFoY518x5Y4slQF/HymTXTIH2DVbeZ/gGE=; b=Zeyio18+PMTc+v
	Fy2pXTVLCrF55vzP1KhA0JwGr3Y8OcSPoSO1SszGblKc22Cfi/ppO71h7ayMz3OxxkwYGw1WzLQ9e
	58aGzTaKsSrCmDBszQTJvrvryYcxQ5mMicd7UzdDSVpd1lQ2K2DxbfcJjD3gw8c/w5KjL2i5lQAwi
	3a8673QUQx/6z6lM2KKxM1qXOV+4Apv/b1FIeLEsYklLnYNi/9/Vq30zTNI2kqhe1uO0J+dG9oEYc
	mhUWMWODyEZYTkD1agiC8mX4TSw0Af8vSvzanwxZm10WnT44on77GD2R/JfG0j6Ov/ab67BI2lzPl
	7BIA1bTE3uyaE89IKXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2OBc-00GBiL-P5; Tue, 06 Dec 2022 03:00:00 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2OBY-00GBbB-N9
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 02:59:58 +0000
Received: by mail-pf1-x434.google.com with SMTP id g1so5255718pfk.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 18:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMvd+bGX7cNzKevq9l2WAnMvQf9LCVqf4zTfyymymRA=;
        b=osFE3Jk5FGwfWjWOIbOBA9zzI8OEon/JIEP6+sIPphN0I909xCeDNZ+irhRNT2EIDL
         Tp6p5I7+N5tDDYpzPHdQCdDQ2JKbPMIfGUqxZiaR+zBodYjWNpJhW5Jrj/Oj99IRAfXZ
         VciAK51zt6sIOUPJA+Sc3liGoeHp4ZMIv9U/7WinuhEPpXpS5zv/brbb8MN/IvjL1o4u
         KeHNrQNspSOjKzBRCLfQtDxD9aM7kv57cxyK1PyQViFs9x+jL2iVgj6flOaf81pIimBS
         4dSBHbdJWzX6InxfkDPgfNonIX1EcjVo4QH08QzyzeuLLng757J3NnI27MMbr3+7F/aN
         /V5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IMvd+bGX7cNzKevq9l2WAnMvQf9LCVqf4zTfyymymRA=;
        b=M8l/PgCCslFXiL7+xogxlduVQUdpB73zPWN3n5qyEWkYEQLqCcXZZRxOD8LhdSvmrw
         2OM/qCibzb3V1VmExgg/s2LCkjbJy6mibsDTbvtmkLtFvik/8cjSo23eldRFVZGMCL1+
         uu0XwT1XoOlnnocvanRhaCwmGDzHM5xfSq1uhwleh92c8cNdEJr9HrbsKzs0gL023FH0
         A8AC485PGVrUSPlWbhZXH0ODTkFV9mGOk36W4J6Wj5bu049WSU+16+gLVkTiXGBxROQM
         K+lr6i2vmekUHdt3Hht24AUPF7lKkNLcF7Ab6yb3dWeHQkH0v8ArZQ1U52V+57judAQR
         yxqQ==
X-Gm-Message-State: ANoB5pm7kyBV1ANDxdPouRzipNZAuKWBJtPkzesvi1Ypo9QXhb91pnXQ
	woWZW/IjMkdzB40tqe2PJ7DueKgox1aV9grj
X-Google-Smtp-Source: AA0mqf5KYeHEJXRZ+kr6JgkeAh/50YD15QuTLMsHUkcRykfBkM54G39C9ocTK6xT3SMs2U6hWVnIKw==
X-Received: by 2002:aa7:9629:0:b0:576:8cdd:3f26 with SMTP id r9-20020aa79629000000b005768cdd3f26mr15108687pfg.59.1670295595903;
        Mon, 05 Dec 2022 18:59:55 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a10-20020a1709027e4a00b0018912c37c8fsm11229940pln.129.2022.12.05.18.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 18:59:55 -0800 (PST)
In-Reply-To: <20221109064937.3643993-1-guoren@kernel.org>
References: <20221109064937.3643993-1-guoren@kernel.org>
Subject: Re: [PATCH 0/2] riscv: stacktrace: A fixup and an optimization
Message-Id: <167029558296.27426.13218152789820527456.b4-ty@rivosinc.com>
Date: Mon, 05 Dec 2022 18:59:42 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: paulmck@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  Arnd Bergmann <arnd@arndb.de>, anup@brainfault.org, keescook@chromium.org, frederic@kernel.org,
  nsaenzju@redhat.com, peterz@infradead.org, heiko@sntech.de,
  Conor Dooley <conor.dooley@microchip.com>, vincent.chen@sifive.com, changbin.du@intel.com,
  Palmer Dabbelt <palmer@dabbelt.com>, guoren@kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_185956_964309_966927F5 
X-CRM114-Status: UNSURE (   6.07  )
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

On Wed, 9 Nov 2022 01:49:35 -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> First is a fixup for the return address pointer. The second makes
> walk_stackframe could cross the pt_regs frame.
> 
> Guo Ren (2):
>   riscv: stacktrace: Fixup ftrace_graph_ret_addr retp argument
>   riscv: stacktrace: Make walk_stackframe cross pt_regs frame
> 
> [...]

Applied, thanks!

[1/2] riscv: stacktrace: Fixup ftrace_graph_ret_addr retp argument
      https://git.kernel.org/palmer/c/5c3022e4a616
[2/2] riscv: stacktrace: Make walk_stackframe cross pt_regs frame
      https://git.kernel.org/palmer/c/7ecdadf7f8c6

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
