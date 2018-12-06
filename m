Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F99C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:31:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD04B20850
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FvV9NSuN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n31MpISA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IKGvhL4W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD04B20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NudYNyLWruLHcw1/buZHnwu3veroBKkilg6m06oqi1g=; b=FvV9NSuNyDr7Ji
	eSsa9zy9PRBJaHAV6kjCzg6vc/hEjZvWNG6k4xsqQ7BfaXXPIOYjaL0k1HBSrf/7dYhE6g+S0FiF4
	Z8faajtTC5QPVj3r98brto9cZEs6fYz7G80Ns53EA/0ChlCyORFaxPSmy7bLIRkj2cfJteS/1Zfui
	Zvk4gAi5yRuFuWyC7x3sb9q0HX+zUW2xxArr5tW4EuCuqZusH7vOjV1MCPXKMybuFYPC2yBrzfRxG
	fevqL5J2Ku85zoBeklGmBSFHP6EgQh/l+ZCVwu6PExGg/bSqLpPxMLxg2vTZFWGv6dGUcaWb2OB7N
	hvCG7Y6icZmpvEdG7qHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUxUk-00005e-9Z; Thu, 06 Dec 2018 17:31:26 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUxUi-00005W-Bl
 for linux-riscv@bombadil.infradead.org; Thu, 06 Dec 2018 17:31:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4hudTdSDv5qNL7QepcQ/fJ5YR3De7dRNuAhTQWAm3iY=; b=n31MpISAlqn+ZmvhCqF7AzyV5
 Nk9djX7pACf/LsvLKEsyLsKp4UohvSJL7F0h1BTSIs2u3PmKnmw3TU2rJlV47uztKpaf/RFBU3ufk
 XjL2T7mbNSuB1Qcq0qOyc5xTJ+TtBjd1/M5uuJ3RPKIOJQcjAnPaisf7rgCM/5idPIM6MX65co82U
 9okp5jopM8rzZEX78JoGPx5fgiA/Zs1Sbv1+D5pErwITfywjrRha2eswOdlLQ5PW36Zd5uR+X5iKG
 jH9jSP3whfMQDI1kxGRuuKJ8HjIKeMLxKpkSnaGDe8ojIWu/CK5Rizxm5LBuANX2ThSZE8UkDOvFh
 OLLic5Qvg==;
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUwsw-0000Qy-8v
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 16:52:26 +0000
Received: by mail-yb1-xb44.google.com with SMTP id l126so901772ybf.13
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 08:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4hudTdSDv5qNL7QepcQ/fJ5YR3De7dRNuAhTQWAm3iY=;
 b=IKGvhL4WWfBQNY7mgvdg4cBcNoW47XDZDieadaurkmZSmxjqgmg1koAfM5lzaj7Nv+
 seiBkgt7pRlEl1soYKPZPXglbPLJWkZnhP6Olngt4r/t+n39NyVnwBX8AIHuyRgdniN/
 re8sjXhyLKf7zpTYNLeKHmnVw+ivnBnb87Zxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4hudTdSDv5qNL7QepcQ/fJ5YR3De7dRNuAhTQWAm3iY=;
 b=Cwe/7g4ZfFa0jq8slMEuxxTIvdsMur3hB2d8tUsTpV4lZO81HrmOqFdU9GwNIf6iU5
 r8OzkCiykiY1zMuaWmRDKLvWyFc99m1r4KaSjEt4ENDuuv637Pf3dppjhyVkz5/06zDq
 yLoW2xV/AHLkQTpC/MdygW8Ips9NWHoRVr4XDH3RMkYIqiGBrVO6k5WeCzcOiW8giFkG
 c2jd5LFGCGTEI4VLjbCKbgqgMfTw1Xjc4O3aAf5vBmK7NLXGR/Mb/9aZrSjGhFx3dBur
 8Rc5RRm6+ExhWlozNBbr7XvCKuuct/GeG/HziVOXc4Vi/4P836Dk8v3V36Lc1dPU1Gnw
 08Ig==
X-Gm-Message-State: AA+aEWbzkSkQ1Y2GY6nJ2rerxdhwh7nOoVDRCNHb5fZmd34DLyMf1dqn
 APR86xzxMHA94ccv+llUyEYkvWCogjA=
X-Google-Smtp-Source: AFSGD/UE7+zD0GFS8qKBHcDietKREfMc+NJeqK/BEGfD3DC0PNJ4J/cpX7UOM5vEb/KxVgbswJmN2A==
X-Received: by 2002:a25:d7c4:: with SMTP id
 o187mr13025460ybg.357.1544115126570; 
 Thu, 06 Dec 2018 08:52:06 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com.
 [209.85.219.171])
 by smtp.gmail.com with ESMTPSA id w2sm223609ywe.62.2018.12.06.08.52.04
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Dec 2018 08:52:05 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id x144so914308ybg.10
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 08:52:04 -0800 (PST)
X-Received: by 2002:a25:a22a:: with SMTP id
 b39-v6mr28748348ybi.209.1544115124380; 
 Thu, 06 Dec 2018 08:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
 <20181206150156.28210-2-david.abdurachmanov@gmail.com>
In-Reply-To: <20181206150156.28210-2-david.abdurachmanov@gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 6 Dec 2018 08:51:53 -0800
X-Gmail-Original-Message-ID: <CAGXu5jKfnE_RJL7aA5x-qqYdA9zoTTtKwahg0r5fyW5GqFLgdA@mail.gmail.com>
Message-ID: <CAGXu5jKfnE_RJL7aA5x-qqYdA9zoTTtKwahg0r5fyW5GqFLgdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: add support for SECCOMP incl. filters
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_115222_318349_19BDB1B4 
X-CRM114-Status: GOOD (  12.77  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Will Drewry <wad@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, green.hu@gmail.com,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 6, 2018 at 7:02 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
> The patch adds support for SECCOMP and SECCOMP_FILTER (BPF).

Can you add support to tools/testing/selftests/seccomp/seccomp_bpf.c
as well? That selftest finds a lot of weird corner-cases...

> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index 1c9cc8389928..1fd6e4130cab 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -81,6 +81,7 @@ struct thread_info {
>  #define TIF_MEMDIE             5       /* is terminating due to OOM killer */
>  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
>  #define TIF_SYSCALL_AUDIT      7       /* syscall auditing */
> +#define TIF_SECCOMP                    8       /* syscall secure computing */

Nit: extra tab needs to be removed.

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
