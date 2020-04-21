Return-Path: <SRS0=1Rer=6F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6E5C54FCC
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 17:54:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 689D120663
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2020 17:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cRDUbq5D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="jqxMBWky"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 689D120663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fXONOcXjfzmg4/8NqYoxCOrRJXZM2a+CQjG3mmDwPyM=; b=cRDUbq5DCwtsez
	sahTuMqbd4JgZqe0d9aQ+vH50KtnIcbF2hL5wIUrwj2TSFOqKaUFpOrexpHwicYamwuCasHgx+Ykp
	6GxOhfJVfcY7DtyHUn+P+H04x/BcKgEXbHbBXUI11PdOtuSOB4E6KqDteBqClwGKd7heRgKRSM6oq
	hVng2/21NhjTV4Z9cyqpsNp+MitB0WVncQZp2FetZ7KoYk8hiOad/WTm5P2c/OrIuFT8Bfke+a2yi
	0NaNM04SjK5GJkOcWwkgmqAHNsltDMc3FV1f3W745Z2xkdMoWgNfTAJLcaT17fvMC9zNDP5oU6Qoe
	EoHTLLyRwD5u3iQM0KVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQx6c-0000yP-BL; Tue, 21 Apr 2020 17:54:46 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQx6Z-0000wr-Ns
 for linux-riscv@lists.infradead.org; Tue, 21 Apr 2020 17:54:45 +0000
Received: by mail-pj1-x1043.google.com with SMTP id ms17so1714080pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2020 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=fXONOcXjfzmg4/8NqYoxCOrRJXZM2a+CQjG3mmDwPyM=;
 b=jqxMBWkyITGTkyArVg5A7B3Nb+yKDX/D3KPdvqKLY0Ri6kPC86+wcydWlXG1SOVg8V
 gPL7/JGN2Gjbkmysk5ZwRZTMggUW5PqbZ+c7WvDT6PyqIIlUu1RDYF0h1KXTs+vuWCQk
 frqrtY0HOzU7OAVa8rif0uRUE7E7QiohdxG/8OKCqhRI+8F2cdqwds/1IsvZAXMW4bV1
 HjT/tbGON/oL1iBaowvcmqF/hCP70nrduT+Bls+0EwQuyGh+cSSXKk71DlHjnF6YwYny
 mA4U8duugWqlDDY/sg9LgR5jNq7QrHSStIgiyVNIQit7Jw2MWOvaiqYFHL3B6qNEO4iE
 /23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=fXONOcXjfzmg4/8NqYoxCOrRJXZM2a+CQjG3mmDwPyM=;
 b=IW+kH5JdJWsG+zNSmj6kQ5AfCzc/wDUYi6xJX5owj5VNGY4LENQ7ICcCpVoWYcepzq
 hzkLOQa/p29o4SRbHCJFKf+Iy5W5v5v0wAhMzlRWU+auzOXeBIY64fisynllFyZhie1v
 JB30L7Y14wHG7a0c6xqPCCQJZIrC9j/jWX+HmF97IrTdNksU3ltDwDsM0O0nCjpT63lG
 Xr2K51EIp6MbToaSWjn1ecTskXMm9W9+zBJ55Hamel2P4wzud+FQ0dKwFpDDImUzUcol
 rciUoWx6Kwkvdwj1pf4EsI3vJ22aL6OmW4CcJZ6x+w/DtvAPjcq/yjnDke8nhDGj/+Y8
 xVLg==
X-Gm-Message-State: AGi0PuaZKNkNZ8seEyT9usP3QoRv+b4WrVNIn9MiTO32JuNLDRrnRCHl
 Gxy7RY/RC9D4pEYHHF0sYqrjPQ==
X-Google-Smtp-Source: APiQypKUKHy9LqmcEHWtneAGE00iw2r9YefvUnXi4aNqVMqA5eInRhD74ETL3HPTg5l7RO2P2U2zBg==
X-Received: by 2002:a17:902:7d98:: with SMTP id
 a24mr5927002plm.75.1587491681259; 
 Tue, 21 Apr 2020 10:54:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c3sm2953665pfa.160.2020.04.21.10.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 10:54:40 -0700 (PDT)
Date: Tue, 21 Apr 2020 10:54:40 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Apr 2020 10:50:41 PDT (-0700)
Subject: Re: [PATCH] RISC-V: stacktrace: Declare sp_in_global outside ifdef
In-Reply-To: <20200413161234.78346-1-linux@roeck-us.net>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux@roeck-us.net
Message-ID: <mhng-05436660-e53b-4e68-bb35-3e47141bdcf7@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_105443_778552_4723ACEC 
X-CRM114-Status: GOOD (  13.87  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, linux@roeck-us.net,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 13 Apr 2020 09:12:34 PDT (-0700), linux@roeck-us.net wrote:
> riscv:allnoconfig and riscv:tinyconfig fail to compile.
>
> arch/riscv/kernel/stacktrace.c: In function 'walk_stackframe':
> arch/riscv/kernel/stacktrace.c:78:8: error: 'sp_in_global' undeclared
>
> sp_in_global is declared inside CONFIG_FRAME_POINTER but used outside
> of it.
>
> Fixes: 52e7c52d2ded ("RISC-V: Stop relying on GCC's register allocator's hueristics")
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Apologies for the noise if this has already been fixed somewhere.
>
>  arch/riscv/kernel/stacktrace.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 02087fe539c6..6c854875ac74 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -12,6 +12,8 @@
>  #include <linux/stacktrace.h>
>  #include <linux/ftrace.h>
>
> +register unsigned long sp_in_global __asm__("sp");
> +
>  #ifdef CONFIG_FRAME_POINTER
>
>  struct stackframe {
> @@ -19,8 +21,6 @@ struct stackframe {
>  	unsigned long ra;
>  };
>
> -register unsigned long sp_in_global __asm__("sp");
> -
>  void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			     bool (*fn)(unsigned long, void *), void *arg)
>  {

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks.  This is on fixes.

