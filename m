Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82B2C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:07:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC8220661
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 17:07:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ymg7Q4fk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nUEtgp4X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AC8220661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttegHw8/LinT+NfAYErCJzl5Qpvuhddy2CUJ9uel0KY=; b=Ymg7Q4fkzAQjXd
	UQAhEZj9ebSkmxXvgg18rRz9BcKY1q5FFrQW+wGz9sPCDP9Wp4/yVFpFh84asEJJGuFNp3ufWURI3
	MoRzx9ey5aGRvTXDHs+c5E7zRYT6KdU4FBA+9G+uHra9Ch1hlz4PcKPdozAWTx3nr0L2jUIbYddub
	hyavTZVipMkiPLRtoBnUVkbxNnWeybcA3cs0nLPrPzLubhOFwr8CvAB2xTgQsRxGQO3XeHemBIb7e
	q/7GvSLSxp5hEXczsHGWOf5K+nDVTD8cZ7n/sYxAC+jguKJHmmzjVRWUkmYnVbdfhVZWmRQCkr7z7
	oQuJU8GCut8msFCT5mdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUx7J-0005CR-Rm; Thu, 06 Dec 2018 17:07:13 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUx7G-0005Bv-UN
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 17:07:12 +0000
Received: by mail-yb1-xb42.google.com with SMTP id l126so947226ybf.13
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 09:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=St5x4BajvjzpktTvJ9fGLPnVf1FbO6rxvCZkxwXohoc=;
 b=nUEtgp4XO8Oi5L3FZYbrD5Gmy8ugvfSOxMLYU/EmcLtO3rPGlfOVeMu3t40Es9ORMv
 /4C2LTxdM3hPTGglD2wLoxNyaZ0fZ3i0jdtGiv/L1ddRojVlWnJI7wU6io1t3lxBbrfF
 hVLd1nZFPZEaYHq3dB1Xcc6XYWNLPJuBqzNKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=St5x4BajvjzpktTvJ9fGLPnVf1FbO6rxvCZkxwXohoc=;
 b=jGB2+qVSVpP8zF702DgAh+R5S09/bSHCkfePVWGyZ3WzUHi/XAY+5SeMT6CTvrQ969
 RTXAApRa+On4pb9E/h0iJOO6w6Ra4iV99/UD2v8B1KB5pU8X385PPi2RdzQ4N0VJXRG9
 GRSXhac+IGcZv7v69+qT+eH0uMZTc4KPqjSNtMCeXK/zbETHqacI0+X0RwjQdyeB+Ews
 rrQstcReEKVWZUreeT0I2j2zcIzg2EgWL70IZj4wUbQ0NK/wlcorpFQr48Xd9UxO81ZI
 /ob/IYkhCE6QYKTv+/e3kBRx1CfST8RLiOuLKFUu0rIQvFoTjKxxpTyOirUzYigdLneS
 26Ew==
X-Gm-Message-State: AA+aEWb5R17ElU+VVTYYWuEtavAqAIIKpOD0UpXzlzgAiQegnyfET4B2
 FGWS1o1yfZHn2G05SejF3L60QuVQga8=
X-Google-Smtp-Source: AFSGD/Wbaxwk9H1PKbB0Mlu3AocMqGpVT3J+bFx4EJvknh+1dL74l77bO9xFn0eVEI/KCE9MMGKkwQ==
X-Received: by 2002:a25:9381:: with SMTP id
 a1-v6mr27411712ybm.386.1544116019311; 
 Thu, 06 Dec 2018 09:06:59 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id j134sm215673ywb.91.2018.12.06.09.06.57
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Dec 2018 09:06:58 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id l126so947122ybf.13
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 09:06:57 -0800 (PST)
X-Received: by 2002:a81:c446:: with SMTP id s6mr30380855ywj.237.1544116017182; 
 Thu, 06 Dec 2018 09:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20181206150156.28210-1-david.abdurachmanov@gmail.com>
 <20181206150156.28210-2-david.abdurachmanov@gmail.com>
In-Reply-To: <20181206150156.28210-2-david.abdurachmanov@gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 6 Dec 2018 09:06:45 -0800
X-Gmail-Original-Message-ID: <CAGXu5jKevZHDW8hRAAh_muFUXsg-WOVCYh3HczjY5qKtR=wYNg@mail.gmail.com>
Message-ID: <CAGXu5jKevZHDW8hRAAh_muFUXsg-WOVCYh3HczjY5qKtR=wYNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: add support for SECCOMP incl. filters
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_090710_978916_79FE337F 
X-CRM114-Status: UNSURE (   8.65  )
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

I built this against linux-next but it's missing seccomp.h. Was that
accidentally left out of the commit?


  CC      arch/riscv/kernel/asm-offsets.s
In file included from ./include/linux/sched.h:21:0,
                 from arch/riscv/kernel/asm-offsets.c:18:
./include/linux/seccomp.h:14:10: fatal error: asm/seccomp.h: No such
file or directory
 #include <asm/seccomp.h>
          ^~~~~~~~~~~~~~~

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
