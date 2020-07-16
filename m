Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAD9C433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 08:33:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 498802064C
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 08:33:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YhC33J9X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4bD8RUQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 498802064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gj4n0BLiGl4GFS4teOhilXGDj7DSPPXIhTXLkjorIwQ=; b=YhC33J9XnYk8O5TroykoRacAi
	NpdPF7NVCnD+cjtsP5rzQvufPNcoFT3HJHnUK45pctjNL6cJQ3pRy8krDE1yfKMWr5pEtSHgP8c/6
	1XP/rpzxfZ4gSciR0MSSYmY5gjdEfBulIM4xMxPAKCs6lOD1Ntf5ohXebeydyI18hVNGRsNSKN+EU
	n2LGqehPm0HFhKDGuqBb3ikdwRNJr8uIQVZl0NrIgLIWMW6fpkkNBxKhWsEsPQQmzzoru5qS5+fq+
	0JoL7JeZcAp3Tj1BFrIlVE66Ftx48w8WWi+9yoMwjS6HLDEgzJPAEe05XMraVnZM4ydDK8AzMkgPO
	px/4f1YKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvzKj-0007k4-UZ; Thu, 16 Jul 2020 08:33:37 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvzKh-0007iR-8n
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 08:33:36 +0000
Received: by mail-lj1-x241.google.com with SMTP id b25so6181172ljp.6
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 01:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=59b36rjVhJMJ5qz4NoB11gLYTzd+HHhuOKwEomRUnjI=;
 b=e4bD8RUQiIoATMPhlE/UXLT0MyHUlwuQGvLk33+EVuH+VIwfT54uUWxhsp0zehwGqw
 VmS5iBaV7IjTH0bLYbNY9Ky7H8pd92RGFcMJP0z3sUR/fByMvovufo2kZyfELhquLgjv
 Ro2IZm/j3nyqOGeAqguZdxe4RcjU8/HfnNiP3AqLqCKfNQKnl3lPzBDIwvKLGrNWwqBW
 adcGRVxAKFWAk70uKXHKLqW0WPSLyfHbzOF5TLTsKdn5KboI9eDdhh20NluUdoZhDYK9
 Rn32zGtPP4iHCkN6FV5aw5JqjABScqle6tcl6GoCkHqDewZGH7chDdpRlanelDJJ+mma
 7xmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=59b36rjVhJMJ5qz4NoB11gLYTzd+HHhuOKwEomRUnjI=;
 b=ukUkfqbKNP7SNXPUA/DNdkPmm37SbI+HJajTmQRayzxsWtSQOt/VCKqbRWneepC/T7
 CXKo2EZ/2oU2coQyrjJ0S3ZAdWz2zUJUtPw6DusMij6FyqlWbEzjnSYtHqYjTNc8EG9y
 djrgjjkC61pekkX3bBvBBDepUoI5Xmptqn7487Sq5iUOXtZSvI1R69I26G52rf8QYIRf
 ZZquWzLCYxIeT8PTV9zSQpf+WMj8jS3nmAC/0vzFg9QtfG1sNpgyIJkjMt7Z9S6t8g4L
 0JnuabMHtWVKEXR5e2PGFGGOyaftdvw18RRVVcatlrYXi3OfAPHbbQ4rM8QU4MKGduCV
 /C6A==
X-Gm-Message-State: AOAM530yiSqV3Z1mz5EeherN5DqYuOj8ixonbdydzy4R5SuSA6Vbx2qI
 uxcQMqNgbYwnSiWlK5FeKA4qJFk44wrivzR3fuo=
X-Google-Smtp-Source: ABdhPJzGit9D95W2dUhgiFidomJBpFl2+XgJrTiCM0jMmc8tmdD/Br4YKMAhCKZhckG+1bjNJuD10hwj2GY01bZYieE=
X-Received: by 2002:a2e:b5a8:: with SMTP id f8mr1369138ljn.247.1594888411600; 
 Thu, 16 Jul 2020 01:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmV=rThbdZnjY_cbkKBeuRYNL0O2QLoJQGFPRc90SZjHoQ@mail.gmail.com>
In-Reply-To: <CAEUhbmV=rThbdZnjY_cbkKBeuRYNL0O2QLoJQGFPRc90SZjHoQ@mail.gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Thu, 16 Jul 2020 11:32:55 +0300
Message-ID: <CAEn-LTqnsygh40cqMf4Z41FuZh-tOO2bubNv7vqZUgMbWJT+RA@mail.gmail.com>
Subject: Re: Patchwork for linux-riscv
To: Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_043335_342654_54AA9566 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jul 16, 2020 at 7:50 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi,
>
> Patchwork for linux-riscv seems to be stalled.
> https://patchwork.kernel.org/project/linux-riscv/list/
>
> Or am I looking at a wrong place?

Yes, it's stopped updating.

There was an issue with the mailing list (and emails were lost) at
almost the same time.

See: http://lists.infradead.org/pipermail/linux-riscv/

This might have caused an issue with patchwork.

david

>
> Regards,
> Bin
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
