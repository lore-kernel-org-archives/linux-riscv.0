Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C95C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 20:32:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A56B23C18
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 20:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A56B23C18
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=XPkXieNP6jWr7faCwANHeuLqaXFgrqtPy0uRxwt5Nak=; b=O54OVBoGg5jVYTc4ek5FzNPes
	ylWzl01pSQXk7PZf9Ja/8KGnysBk/C235tHI7bya0TzAbdbEVl9W+L0VEZl+VgXomB/+IyKiOWfFK
	L9cD8Oe1iqM5puOmiQNnMHZA/7tnvaHzwSENS6PufkEyvhXXLV5s9GFGdjae53FXQx10NobA4F55C
	rww34Gdt37lRzGe5kfYoiZcM3F/rZrCWbOquVBD8Niq0Ukg6fnXtY/QnzCOGF75WmL4rrksMZFebc
	apeqtmm9ysdxMny65jOw2LGCGsKLUwcdFCQtgYdXb1Zy0ov/GjxRNvgZmXB4TQ3CqJ0kxbkIM5a8U
	OpUk2Bu+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knp5P-0002Mw-Na; Fri, 11 Dec 2020 20:32:19 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knp5K-0002LJ-UV
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 20:32:16 +0000
Received: by mail-pg1-x535.google.com with SMTP id f17so7908455pge.6
 for <linux-riscv@lists.infradead.org>; Fri, 11 Dec 2020 12:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8W3/RL0f9oAdrIxjf8Wk4dr9AqOCR7oiy6Dk2qCm7R4=;
 b=kVr/+Nim2nL0QsMtIjlrxXUxggHwMco9JmUhn39E47IrJZQPf1fk17INy3gRCDSY6g
 yxdd+cLlSoMNdCrS2SnzRplLf22ex4ZehwgzDwAb6t6F8ZCiWV3zRrZ6AysxKbSAYRkc
 pxZnpNi/EWlDxgSCsLOzZFNeHYIv4SycNtlKjce65owcduBpVcJKz9IXuIY1O4/g2Syq
 Qokp0xW3WrAf7bkV6cOQV6BKm4vuyCWEDBEaB6DR1ERREMwmEqkuFkdF04fOkoCQGwRl
 ROSzA0jT6QH+8N8YXQKc0RDdb4wwSVIjFpAu9eTswtKvklNUXPMn0KFXmffOwRWRLqVT
 aAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8W3/RL0f9oAdrIxjf8Wk4dr9AqOCR7oiy6Dk2qCm7R4=;
 b=k5838HYos/t3sTNEEX5bWtT6MT92FUmFOYsTpXpWHTT5ReWujsZa6L0PA62pr/R03W
 1+rx6T5ugI+OZ7GEaXbO6G2qNF1t7pt/df1VsoBC/ft9i7oYKmFdCrGh3YjqzN9HpjFD
 ObVuhCopFT/UIu2T3WRe4JqVc0FwH+NyX++SaEmXMLSCrFvsQJpzQ0TE4cml0/PZX+/H
 TMjp9pB8H6YoGk5NdrTDQr1N4w4cDMWBcfkJnhcYqp3Uas8b9gL6Edhw3j2Xfq1h+kWo
 ecKLFQayWy2wt/Ty9960m8mrcUJ6W4S6TMFJFBspvrlEkT1m46oKiHDQJ2AprLR5bWm+
 +Bjw==
X-Gm-Message-State: AOAM531VOrjs8Pk+sVADQHuifbCryHYjSUOBi7pX9I0Wr4S7qQOVr3fa
 FsEaIViNcMjTgQ493VxEaGGmBg==
X-Google-Smtp-Source: ABdhPJz+BVwwwTYnds7keGOkOEjkvsXV4svAE+CVjrOFQYmI8D+rh2kTyUWBE44zfww+oWXuQ4UG/Q==
X-Received: by 2002:a63:5d05:: with SMTP id r5mr13431438pgb.442.1607718731584; 
 Fri, 11 Dec 2020 12:32:11 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y27sm11640213pfr.78.2020.12.11.12.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 12:32:10 -0800 (PST)
Date: Fri, 11 Dec 2020 12:32:10 -0800 (PST)
X-Google-Original-Date: Fri, 11 Dec 2020 12:32:07 PST (-0800)
Subject: Re: Add and use a generic version of devmem_is_allowed()
In-Reply-To: <20200729000030.GI4332@42.do-not-panic.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mcgrof@kernel.org
Message-ID: <mhng-9ffad092-5af3-4350-8417-99e79623272a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_153215_181998_0467988A 
X-CRM114-Status: GOOD (  17.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com, ardb@kernel.org,
 catalin.marinas@arm.com, linus.walleij@linaro.org, brendanhiggins@google.com,
 elver@google.com, glider@google.com, zong.li@sifive.com,
 mchehab+samsung@kernel.org, linux-riscv@lists.infradead.org,
 alex.shi@linux.alibaba.com, will@kernel.org, dan.j.williams@intel.com,
 linux-arch@vger.kernel.org, uwe@kleine-koenig.org, alex@ghiti.fr,
 takahiro.akashi@linaro.org, paulmck@kernel.org, masahiroy@kernel.org,
 linux@armlinux.org.uk, krzk@kernel.org, rppt@linux.ibm.com,
 bgolaszewski@baylibre.com, clabbe@baylibre.com, kernel-team@android.com,
 pmladek@suse.com, zaslonko@linux.ibm.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>, rostedt@goodmis.org,
 broonie@kernel.org, matti.vaittinen@fi.rohmeurope.com, gregory.0xf0@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, changbin.du@intel.com, james.morse@arm.com,
 mhiramat@kernel.org, akpm@linux-foundation.org, davem@davemloft.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 28 Jul 2020 17:00:30 PDT (-0700), mcgrof@kernel.org wrote:
> On Thu, Jul 09, 2020 at 02:19:20PM -0700, Palmer Dabbelt wrote:
>> As part of adding STRICT_DEVMEM support to the RISC-V port, Zong provided an
>> implementation of devmem_is_allowed() that's exactly the same as the version in
>> a handful of other ports.  Rather than duplicate code, I've put a generic
>> version of this in lib/ and used it for the RISC-V port.
>>
>> I've put those first two patches on riscv/for-next, which I'm targeting for 5.9
>> (though this is the first version, so they're unreviewed).  The other three
>> obviously depend on the first one going on, but I'm not putting them in the
>> RISC-V tree as I don't want to step on anyone's toes.  If you want me to take
>> yours along with the others then please say something, as otherwise I'll
>> probably forget.
>>
>> I've put the whole thing at
>> ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git -b
>> generic-devmem .
>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

Thanks.  Davoid pointed out that I forgot about this, so I just rebased it onto
5.9 and merged it into my for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
