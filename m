Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC06C4321E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 00:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KPbJrOL2wG6t3lSDA6RRkNz4EKcmscPspXgyIbav2o=; b=3o60p1DoPM2fQ8
	oiDFxT4SEFAEOkYUhiK/HybjmNay/uY+S7nkhmwzXw7hdc/rxsCW5s9beNzHnIIrrJguI08jOREig
	o5dIfm8wBbGQ0TFN/iWW21BroQvSANxye6JpzDFisSrKjX7+u2JHJPYyRSe+HCx3z9ry4hReQW/ZM
	i1WUNNKsmXKg+TEZLTYC/Ah7GHXVZjnQc+pp1Ny2tD7MwC5tJRfQqAhn/zdosO7W/GoWqKfb9aPvS
	dRu30wh2AxXzbRGr9WSJvd8pMOSzikX3lOmvc2CJ6oeDDUXKGm9ayZ17aWHI+BcACm4GEKH/cjoR8
	5akshvS7NYMWl4++9C4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1GS1-001oMP-CP; Sat, 03 Dec 2022 00:32:17 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1GRy-001oLc-Iq
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 00:32:16 +0000
Received: by mail-pg1-x52f.google.com with SMTP id f9so5677459pgf.7
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 16:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRChpZav5IUrRCCfNMjwsJ5gE9vU0npcYHbSte7ykZQ=;
        b=UMZ0kD3ro2ZGDE+e9W16wQdmAPwhKaJvzuPQieVDlZ/p6T3Yd/L1hZ7feEdLmzsD28
         aZmDXrkZtQYwATKeKIPMgHhwg+xWAsWIwjwCdwT621lfUMwTdBSGRRG9W6kNpOfTgNR/
         eBC4K2BnUz248QiQLid9uNafWRvKFDyyDjWtGSmRbJcbIftPl8kYToj9uKACwOa5+0SG
         i/9EgR3Vq6WxhK7tMK+MY64ecK6t1kB+3Og958L076S0ExASqn4ftQHI5akFAsgQdXz8
         ZpwbcxZAN3JlaE1ZcWUNmVx7xSzzcFehYCxVe77BLtdtw4AROurt5soR9Jb9z94eWuDZ
         WE2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRChpZav5IUrRCCfNMjwsJ5gE9vU0npcYHbSte7ykZQ=;
        b=lWQ8gBGnTMIMWymRJytMvuIhJJnCSW9m/qUIrBwDNM1VBjFaWvLz37SnXpy4XcAgrz
         y5xogjDuC4Gyxv6JNGvQonP8XPW9o2K1UAKkgoEvfhSuaOhIOTeMvihmJWKaVdhcxVuf
         51RrsqT1UybQTA3U05LxSr8y8hIqKbFrBf3AW9SOmJBwRvKBoStMiixN20ezkJb+hOPS
         6Lb5tr9833BMM+3vu/zxS9+QRjprY6Ew8cpZ21UACUOyvlJ1jURPCW4SGx0t7yVmsZbX
         WUK+WsX40JLLo88TQkNNUpIhzNPPwBiRFBD4WHeKsHf8vOsmSc69CA7gd1695EpjdinH
         MlKw==
X-Gm-Message-State: ANoB5pl37/XLqblFqnFAWfkC+m28iZUFX6e+G7YRoE6/Rc7E+OWJtT3x
	m4goS6aXYj9/zbyj7XlOOlxUbQ==
X-Google-Smtp-Source: AA0mqf7uaiW9KUWwAqUqSe0UQVeO4qsy7A6HdKkJOVvJ+/TBdv5/aPmr2UcMgA37azQM7d8VmMiDWA==
X-Received: by 2002:a63:f5a:0:b0:470:18d4:f18d with SMTP id 26-20020a630f5a000000b0047018d4f18dmr47532513pgp.295.1670027531410;
        Fri, 02 Dec 2022 16:32:11 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q14-20020aa7842e000000b00575cc2f74ffsm5665749pfn.35.2022.12.02.16.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 16:32:11 -0800 (PST)
In-Reply-To: <20221025151831.1097417-1-conor@kernel.org>
References: <20221025151831.1097417-1-conor@kernel.org>
Subject: Re: [PATCH RESEND v9] riscv: add riscv rethook implementation
Message-Id: <167002752044.1717.9764530676447697647.b4-ty@rivosinc.com>
Date: Fri, 02 Dec 2022 16:32:00 -0800
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-e660e
Cc: l3b2w1@gmail.com, Conor Dooley <conor.dooley@microchip.com>, davem@davemloft.net,
  mhiramat@kernel.org, anil.s.keshavamurthy@intel.com, linux-kernel@vger.kernel.org,
  naveen.n.rao@linux.ibm.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
  aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_163214_860703_8534E4B3 
X-CRM114-Status: UNSURE (   6.79  )
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

On Tue, 25 Oct 2022 16:18:32 +0100, Conor Dooley wrote:
> From: Binglei Wang <l3b2w1@gmail.com>
> 
> Implement the kretprobes on riscv arch by using rethook machenism
> which abstracts general kretprobe info into a struct rethook_node
> to be embedded in the struct kretprobe_instance.
> 
> 
> [...]

Applied, thanks!

[1/1] riscv: add riscv rethook implementation
      https://git.kernel.org/palmer/c/b57c2f124098

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
