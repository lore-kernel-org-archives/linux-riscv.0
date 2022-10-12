Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69CEC43217
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 16:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfSxaKQyFhAD7iHyCQVuU0U5nCPTS2ysj3gQ6x88RZU=; b=fv5pxdsCz5bMm1
	sw1OsQuXDLgtw//YQv8sleT5ZZSVkDx7pKpwTFI9ojXf7FKvXC/pq+rhUHnkCZZZ4UKL6VG567eIn
	E7v50G4THJooQAO+Effs6kBmIJWztQSf4tuElwbJzfwg92Upl6faLhv+vGYUCyezmkrhYFjdAWp7B
	aDLD3jp/QDx3zcdjnZThbUNHUq10zuFLFRCuI7+EIoyV9Tr6FBMklDC0+ImY1ld0GvfqevRYDom2j
	AeF3eRt3HM76eBGnRDHmB/ashQF6w9GL6b53cV6hS5XDbIKBhTdJrfqHP1EXxSFDoIjWr5kfvwmhm
	AKotPlPgOU2jSkThZtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oie9O-008dGU-Oe; Wed, 12 Oct 2022 16:00:06 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oie9L-008dEe-Ok
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 16:00:05 +0000
Received: by mail-pf1-x432.google.com with SMTP id i3so16890313pfk.9
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 09:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2lvFXzj1B5AbFhRx0jQ0CX63rE8hZfFVslgge4Qybs=;
        b=o7zR5YOCdpSYtKJk/cFHbC2zAt7QwxSG5H2JsihQkXq2yIMYUJ9KHWNAlAZRQCFS+5
         O3R++Z8N9Q1jBlXTdarjJSH4CzpGC9skg9+iwMqhbILhx5y+M2NWUn2cxezcrIwXHeaF
         +SgzRw/Tuk7x0ZSmZ991tXAXpz3bzVLm9DCfvtnveT+IgtQTzCF55niQDpStbGmB3Gey
         UrMLy+B42UyIKWl1HWl1g1jkMYXRIwpAVOuWjL9w3OWgGcVz2Tz+mYgv8n1U1zxwzxn0
         mw82v7xinaLpon6ig5zi6Eezu/BwX80vy3evLw0dQm7qCfWaF9UXett6WQWJAhTgNwdC
         6kJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x2lvFXzj1B5AbFhRx0jQ0CX63rE8hZfFVslgge4Qybs=;
        b=bJEIpzBcziB+/YmOSaxFkcpD9cJmIqN2TOHeWlN21nVrZPrEQ032pT3zJd0PngdDzW
         0bVm1XvFVf7nJIIAMVJpx7iV2rJ2Uw5hPphIxpq8sh3k2MjO0I58AJKe+IeVvhlPm437
         6f4+NGF1lV/4LL8gUE0OesbggGMaIDcfv9q3ZHpkRF2EkBPVT/N2o+RHiaoLHu1vwWCu
         0FnVCBNvwoMjEJ0XM5IgXSj/onQ7d7OuxSOGo0TZ9EwkDCgQH7wQ2Tl39+m33AzcpAqP
         hjFOhKZMjmTSJKhq/yDqGJh2RuPpgoXkwf3P0YnGBheu8X98iLm71J6MXrQFxMV6ojBW
         0vOA==
X-Gm-Message-State: ACrzQf2kTet/5b4QE/WnHnzicIF9LF7sCiIhTbVb4rk5xhPlL6XFQIVq
	Svf4rIb6rCXMoQ186dF5pUcXcQ==
X-Google-Smtp-Source: AMsMyM4L7kfhQ6titzJtV6W57V3d2nORtXiwltbKsZB7DHCP68SPxamj3WMqedvmtOyyzFy67jgm0Q==
X-Received: by 2002:a63:5761:0:b0:43c:5940:9176 with SMTP id h33-20020a635761000000b0043c59409176mr25604652pgm.65.1665590400186;
        Wed, 12 Oct 2022 09:00:00 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090ab70600b0020d39ffe987sm1630094pjr.50.2022.10.12.08.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 08:59:59 -0700 (PDT)
In-Reply-To: <20220728210715.17214-1-palmer@rivosinc.com>
References: <20220728210715.17214-1-palmer@rivosinc.com>
Subject: Re: [PATCH] doc: RISC-V: Document that misaligned accesses are supported
Message-Id: <166559036448.27925.6190896060696605736.b4-ty@rivosinc.com>
Date: Wed, 12 Oct 2022 08:59:24 -0700
MIME-Version: 1.0
X-Mailer: b4 0.10.1
Cc: linux@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-doc@vger.kernel.org, bagasdotme@gmail.com, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu,
  Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>, corbet@lwn.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_090004_011209_41E0A8AB 
X-CRM114-Status: UNSURE (   7.46  )
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

On Thu, 28 Jul 2022 14:07:15 -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> The RISC-V ISA manual used to mandate that misaligned accesses were
> supported in user mode, but that requirement was removed in 2018 via
> riscv-isa-manual commit 61cadb9 ("Provide new description of misaligned
> load/store behavior compatible with privileged architecture.").  Since
> the Linux uABI was already frozen at that point it's just been demoted
> to part of the uABI, but that was never written down.
> 
> [...]

Applied, thanks!

[1/1] doc: RISC-V: Document that misaligned accesses are supported
      commit: 06267eb2decaa6baac81bbd882265a8e7782dba4

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
