Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0A8C04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 17:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE01B20881
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 17:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uzDuJVIp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fIYGj+xg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE01B20881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sIg4QsiuSSh6OL9gcLcW7DAVTI0xf83c4fxsrGOOT7w=; b=uzDuJVIpvA7r3c
	Ipq54I+z41E9aAVAVEAVT0MwYlC/ZCvRO9joPqSqRBe6J2ndM8hSAYp4w5GZwhMiwZ8VngXtL06lS
	vgI5Cx2fzsvVw/ANVBY/P5G+UuAZOAtEZDq5t5WR3OMR/fVpPPsfdqiJiUCle1TaCG5O45ONfUEyW
	EkBV6MpEuTMNUR5/spyxNcHPgAClUlz+OvinFpefQQMzlwAizWj4ck3t/Fe2g9ek/JRTIARPuRe0R
	IbrcqZQvx9kLQVfOeAfm0+t8Hd9uYGtCzUb6YfEOFNiy5JFyVAEqAdCVbBmDXtUsOK3HzTm3Mnlso
	D3a8y18R22UCOUMfqR2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC6se-0002UA-0x; Mon, 15 Oct 2018 17:42:12 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC6sa-0002TK-Pr
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 17:42:10 +0000
Received: by mail-vs1-xe36.google.com with SMTP id c205so16773384vsd.3
 for <linux-riscv@lists.infradead.org>; Mon, 15 Oct 2018 10:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UYugQquSw7Qw3oJFutT1qMuKHPATED6PhOIvnjqSUxs=;
 b=fIYGj+xgMKVJ8TEyzPYXA7L3I9RtbmUokW6rrMdbGujE6QAjVzADAcLMCv89knptGT
 rX1w4oFlccvoLKuFZwVdQ76YVSrvQ8Fo8hx9X7DrvgPGpkR284YMbF8hDve2lE/bHXw6
 kMg04wGMpGFgePJiWvxX2CE8uO0RBHl0fNQhJcfNP6JosBsVulMCQ32bz3w2tdA6LA/m
 mW/9QqQI11nNCvB29gj/2sAuy/sE/14bwgQ9i/+v2/nTzvX2yo7sk3kqrH/RBVTuZGZE
 Ldh4D+u3CQSxZeI25CuGlwV0r/8A1wEqdWuSSNu9KRPf+D+WTUMg9wE0GVakMNPIfoUf
 +1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UYugQquSw7Qw3oJFutT1qMuKHPATED6PhOIvnjqSUxs=;
 b=mAu7PwlbaSHO9Q8cC0W4QQAZ+uj1Iwm8ajkfdjyGfOY8yuxaHp+VaTZ8eO4AkVsStH
 bSfwAGLwI+KeZXQXz0zrXaMtG32mmobMYSBaml4EWXENhvd1ZpPkpg7nRyNYfew+DeAF
 OLdB9+pHE+eL4xw18DPFPj0aRUMzkdSzU10Kf2wvttFoP5nkEX/FtOs8w2o+vlaDpL01
 9+FJe4ZceFfcv9wAOAuHce4hA4guzhJxoiQR9cNs9kUEneRvEKAA7ch75B+RFoV+Tpbw
 UAtKHSRWuTfFb96q5+uH93L1agwxV65w8IOjxgDYNqf8Y8X/emonGy9BL5jBne5h5Oi3
 AH9g==
X-Gm-Message-State: ABuFfoiOsVzO4+WIaBWd+ZpZNFF6M+HGmpVHKHHXN6CTaQ2NztxabSWf
 dUKB78dqJm60YR9PwnXElFGARBDTpU6QW06Vi3dMqZg3
X-Google-Smtp-Source: ACcGV62Qq7txEpc7d2EMUbeLFvkp6NYnyxXN2bWlzsru1x5DogbvsXS9o36qwt/LwyCyA1zL/tdENzllXr3zUfOkbd4=
X-Received: by 2002:a67:4e54:: with SMTP id c81mr7212633vsb.72.1539625317435; 
 Mon, 15 Oct 2018 10:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20181013005649.14379-1-jimw@sifive.com>
 <20181015084013.GB11826@infradead.org>
In-Reply-To: <20181015084013.GB11826@infradead.org>
From: Jim Wilson <jimw@sifive.com>
Date: Mon, 15 Oct 2018 10:41:46 -0700
Message-ID:
 <CAFyWVaYGU=QQi9W2ZuO54T_akNMSk73B8HRLiLfTVoROoj-m-A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add FP register ptrace support for gdb.
To: hch@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_104208_886730_BF49CCC4 
X-CRM114-Status: UNSURE (   6.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015174146.NiOhdoIAK7pBCuu77GDSXaGRiEKcGa3kkK0ki3p4wpc@z>

On Mon, Oct 15, 2018 at 1:40 AM Christoph Hellwig <hch@infradead.org> wrote:
> So why don't we have a proper macro / type for the FP registers?

Shrug.  No one has defined them.  I can try adding them, but the
farther I get from ptrace the less comfortable I am, and the more
revisions I'll probably need.

The other comments are as I expected.  I will work on a followup
version of the patch that tries to fix these problems.

Jim

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
