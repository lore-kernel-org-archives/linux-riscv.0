Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE8CC54EAA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvvqR/G1dBaQbT1l7K0CE2I9wSmlwzlrKCoZ3cozo1k=; b=B3hOgKNqnQw9LU
	nLrRNABsj0A5U/72pOWAYIvj4vr3hPEqF5i5OfV3Bh83ILIckn0GQZpZK+6XkmfHZLeBN/bFhowMp
	wfXXvCI+0mIn/MFQej5DAwHlZm7f41YVZiNJ/ZJibNG3QMJRZx2cLWyX+5COVualXnZCPvIFHYKO6
	c9kBQDMVsKEBRmdgIsxINWkSgGIEPA+2ou/cyGHjkecYXAH5oT2QpDiIHf7UBa9Aopi5lTQlej6sG
	5KCE1UoBJuglAGIdEGYnVSmtZiTxeTMffIXUf37aKkcc0E6NGy0ybN+/LG94y2+glE3gywPKbipGr
	EROLY3B6ukWOoRVc1ECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnM-005wxX-N4; Wed, 25 Jan 2023 03:49:56 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKWnD-005wvo-Ib
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 03:49:50 +0000
Received: by mail-pg1-x52e.google.com with SMTP id f3so12614507pgc.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 19:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UN0/TN1hydEc2ZmLWIHlcP0AKecl2OLW32ubygEJYgU=;
        b=qpzyCrn71sDphootuI+3T+HjV2yzcxOYQCMg97S1kz3ORD4ZYB9dGMmOftd3d39cqU
         KMF3FTRzEgJpPiar/EY/ldbqWW5Bfd5zyNv558899kO2nD7FOMBaY9HkKllRlKMTX6pn
         bSGCy26GDBNhpPgdJvnmWbZ/YUl0Wh08tyjMok3Q6i2D/FVDMRENbEz6qrPIrZHod5aZ
         U2vymzUbZAexgMEjfR0PMrqGXIaMieqSl6GTzMolnZjx/l+d3Zcx17dj96qiD4mgS4bg
         6w8ho4lN8LJxlb9zYCuD98q2AIFweAnuSqJa5kvi68SRDuQLOI1FnqICSGUjeigLa3kH
         jhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UN0/TN1hydEc2ZmLWIHlcP0AKecl2OLW32ubygEJYgU=;
        b=rYRhpA6TckY7XGipxKQmlM8hot3NT7ZifGBpwqyxnYEKPxTZGQU+FMpNyvDL/jgjyH
         Q7VuShtt9VL+aNQElWOc0b9Su2xSxo2kB6V/9MGRhIasM/wpvpThuhNiv0lzVS/4eRfe
         2Qde9Zki71WcdaJFs77rZeb4zYoxyHPJYpTFv4MZ3gFfGYbhzN9aWMmZXUTP9NfsmZbH
         PvoIyp3touY8AXabwRPzgBlE0nguJAJugEfJxb2mjBQNtT2rpiP/7RgamwvK3aQoyiX4
         dqi68vPf4W39FeSbY7zNV1IhzG9TdgTHZSPWJqygUsFLuo411GF25XuCGeGvqzRWEnnN
         J0OQ==
X-Gm-Message-State: AFqh2koXQ7ZMgog6ukwz+6RrOnEuTFLwyAUp9XczkWLxQQsuq4leK+mP
	Jg8R3+i56ViPJrRgy0WyhRL2ow==
X-Google-Smtp-Source: AMrXdXtRdDkJ4w5CjtCxtaO611AAkIVQQqVjFIXySCjO30MhNn+9mjRoNh5Rm5oOYfLtgJmJxXUsPg==
X-Received: by 2002:a62:1556:0:b0:58b:c9db:c015 with SMTP id 83-20020a621556000000b0058bc9dbc015mr32717103pfv.30.1674618586126;
        Tue, 24 Jan 2023 19:49:46 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id f9-20020a623809000000b0056c2e497b02sm2436000pfa.173.2023.01.24.19.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 19:49:45 -0800 (PST)
In-Reply-To: <20230113212205.3534622-1-heiko@sntech.de>
References: <20230113212205.3534622-1-heiko@sntech.de>
Subject: Re: [PATCH] riscv: fix jal offsets in patched alternatives
Message-Id: <167461852796.4353.6729247492901401530.b4-ty@rivosinc.com>
Date: Tue, 24 Jan 2023 19:48:47 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: Conor Dooley <conor.dooley@microchip.com>,
  Heiko Stuebner <heiko.stuebner@vrull.eu>, ajones@ventanamicro.com, philipp.tomsich@vrull.eu,
  Conor Dooley <conor@kernel.org>, christoph.muellner@vrull.eu, jszhang@kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
  Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_194947_629020_8255CF18 
X-CRM114-Status: UNSURE (   7.60  )
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

On Fri, 13 Jan 2023 22:22:05 +0100, Heiko Stuebner wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Alternatives live in a different section, so offsets used by jal
> instruction will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.
> 
> [...]

Applied, thanks!

[1/1] riscv: fix jal offsets in patched alternatives
      https://git.kernel.org/palmer/c/9d5567ccf96f

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
