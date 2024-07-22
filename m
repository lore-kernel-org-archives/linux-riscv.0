Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A8DC3DA59
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 19:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDA+N8opflMSqpbZ/mVKXEVWpNCqY00KcK/TtX2TgDk=; b=Ra8/e1sPg1N1hG
	dgm6hOJ6/3KF4thmQQE3qFDPGxikvyXCJfkT8NovnKUkz4DKENhee0PLPu/wPH/Tg32v0m/GZhjXK
	xx8o9wpkaK8wuGVW3nlQVi/GjpnqEOrpWnoz/THi9YJtb4NJ7Fv1/zGM8ym3LrqctWY0vtfI9PCP0
	FAWiKicMpCzoNU0R5fMovJq8v4qIVA4XYY3tF7CQpmHfrhn3Llwjs3ymiYxc4IqoTV4qUGsaAeylg
	5EJl5wvjS2SkTEY6DDVqr1eSXfJ/DOatTdzkXrmFf/PnDfI1AVq2pZShxjeSjMBmsXi8hsqcSueqd
	KKzc040SaLspTex5j0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVymF-0000000AOul-0IlY;
	Mon, 22 Jul 2024 19:32:55 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVymC-0000000AOuH-2VcI
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 19:32:53 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-79f16cad2a7so284767985a.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 12:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721676771; x=1722281571; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TL88S/2Tbb1ImSXlSTv6BMkVNu83Hjf3x7A/KXZiFo=;
        b=Sjev0GfgV5hxeRhqLv9TqrQIYrs19iqV+2bEfoFxfj5IV4JHWIdDBO5WcSAzSUQ1WO
         bKcs9Ah4Nss/SVHHJDnXu4pq9XCN9ys1E/kZGmPSVS/nlHcWXTo6P3vMGAQz60WDksWk
         X/ZJ3FSAaj5HGxVnM7jsR17tpx17oPlii2oUwauyvqvP/lILy4/P8N2r8vCFxFRB9ek2
         oD+nEIWbUccGjJv0bhf7a5cn52NgLNw9ZL/jG5Evy5cYDXO1XKuKyINA7RT8jkM0YPd2
         LykbvP82oD0lk2e9Z+f1NMDdjHV0G0pP/2sMQPSjE8wyJquhu37y+xgmyRNME8GnmnXn
         NTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721676771; x=1722281571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TL88S/2Tbb1ImSXlSTv6BMkVNu83Hjf3x7A/KXZiFo=;
        b=dtw45TLlBqwxkZxgigEBGtLfa2JiwtqDTDfxEmHBXaxrncrtnQsSbMlVBapul4tPNu
         /3xJ5unUlG/mXCedw9A+PbwEpbUpRQA46ko8n8EvBlA1vk51se1FdJjM3nW5EXlJwS8W
         6mX5Vbbs3Ulo0EvuOwwQWOD9VxCuUmcTGC80efnS9UAAiskTpn9jbOjBYK2U4zihSp29
         i+P914BT4ICCnqr7uD2ZGA9jG9QowTyuuj7xj3E1Apo8JYqlgEleCC982CPGePpwQHvB
         +2LmOsa4MxWZb/MeLPJoed6qPzvcSKF0O4Ii9pN3rODMwbP7uhZtpO3dh8xsuculuk6I
         loDg==
X-Forwarded-Encrypted: i=1; AJvYcCUH1IoLVD9mqZJttOs5nCwo8AAIE9RoKhOdegOO0TI/t7cTaH5tIVEdCD98fiARgOWBLWET+HuqGdVbtUs5CQ7rC1lb/lY1OSDrwNGY/Aa/
X-Gm-Message-State: AOJu0YyJLQVnKb89bL08rJ9OePJ4i+ne6NqBf6DUsXjqNvJ0sIKwKz50
	H5+XLDGrKdPiutzTGwhLLCfBlGHtmG9Lpb8apCI5EsgLhExujduCXMt1hW81InI=
X-Google-Smtp-Source: AGHT+IFOObX/nJmFXIoaFCVc8Ij671uAJbT39NfWw6nz7bPjAvrV2JBAYXMpeMyh3BtxLMq5kWzdVA==
X-Received: by 2002:a05:620a:2901:b0:79f:178f:99d9 with SMTP id af79cd13be357-7a1c06ad2f8mr104351785a.5.1721676771041;
        Mon, 22 Jul 2024 12:32:51 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a198ffe9f8sm392206185a.62.2024.07.22.12.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 12:32:50 -0700 (PDT)
Date: Mon, 22 Jul 2024 14:32:49 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yu Chien Peter Lin <peterlin@andestech.com>
Subject: Re: [PATCH v3 0/4] riscv: Separate vendor extensions from standard
 extensions
Message-ID: <20240722-0c2488245ce33131693c6d34@orel>
References: <20240719-support_vendor_extensions-v3-0-0af7587bbec0@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719-support_vendor_extensions-v3-0-0af7587bbec0@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_123252_661342_5A853E65 
X-CRM114-Status: GOOD (  12.56  )
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

On Fri, Jul 19, 2024 at 09:15:17AM GMT, Charlie Jenkins wrote:
> All extensions, both standard and vendor, live in one struct
> "riscv_isa_ext". There is currently one vendor extension, xandespmu, but
> it is likely that more vendor extensions will be added to the kernel in
> the future. As more vendor extensions (and standard extensions) are
> added, riscv_isa_ext will become more bloated with a mix of vendor and
> standard extensions.

But the mix doesn't hurt and with everything in one place it makes it easy
to know where to look.

> 
> This also allows each vendor to be conditionally enabled through
> Kconfig.

We can do that anyway by adding an extension menu for each vendor. If we
don't want a vendor's extensions bloating the array then we just need
some #ifdefs, e.g.

@@ -405,7 +405,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
        __RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
        __RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
        __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+#ifdef RISCV_ISA_VENDOR_EXT_ANDES
        __RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
+#endif
 };


So, I'm not convinced we want the additional complexity of vendor
extension arrays, but maybe I'm missing something.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
