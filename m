Return-Path: <SRS0=7WNQ=OX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A532DC67839
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 01:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7102020870
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 01:58:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqTW75Ns";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="ZuDKJen+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7102020870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxbFtvYPZuRBDvMBFmv+oFa8+j3i4jLtHZSZ2JjvBGo=; b=kqTW75NsbcS+dd
	WzchmPVVFWHZt8xfgt7KUAWq1wf9hyGRFo8a8MAPPr081G1Ez/b52F1OnoiGZNZGHO3f1LlroznuE
	2AcsM0KS3xq6nAgOWNHdMgU33v/MA4HVRP/Dn4YWTPJpI2sHh1wBxjHqRpBvoVc1BoWFMWOUneYzY
	y+FDxM6O75tz+FubJzMVUa6LrQ8tKpEzxQzoPxkVwsAKyQTq0S8k/1f3whPNcsio5BjRv7e366XfC
	gGrvReDmxn9iARjQx6SmtCm68uZaJcPwVciCHt/zzWIYe39S6+ZiO54eIB+1xpP+MXlD7YMr2X6d6
	kQQlXZc/IyXILs8ZfsvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXckE-0007bi-Gt; Fri, 14 Dec 2018 01:58:26 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXckA-0007aq-Ea
 for linux-riscv@lists.infradead.org; Fri, 14 Dec 2018 01:58:24 +0000
Received: by mail-it1-x144.google.com with SMTP id h193so7083538ita.5
 for <linux-riscv@lists.infradead.org>; Thu, 13 Dec 2018 17:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ZuewYPe6vrlp66Uf3MR3QYVOS9gpDzYNJlEAO6gBL8=;
 b=ZuDKJen+UQW2IUtcB8p6I/iVec+0vV4wtfZ0jix6Dngc/dDXfSVU4AhV5x8RDIdpRd
 0rLA0up1ZTIv0AUr7LTQCmsp3YX3eSoshSl2RRF546MsutPtCe+BgCiLKVvmdyCZTSEl
 q7oJEm6nm5b3BPBE9ZDJqDDsrK49ZylefwemmPl2chViP9ybhzlvPDOufHLBFPYmixGa
 sWgAQl7dKLlDLsD+1OAts7NdVaYI+vxW7oITSU4SxkrPxvNGOAfYU/QME3eOEzmuqlcj
 T+53iuDAg0D3Wa958GJBTTO81n4FH9b5v0gB1SRSc751KrIuOLEfGMmlmCNGOegI8Y42
 hUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ZuewYPe6vrlp66Uf3MR3QYVOS9gpDzYNJlEAO6gBL8=;
 b=QPBoqYg6hkGdbWD28LCC966J8DzZeC4bkG0Uv9tFqPIrh7zo/xrYNc/lQd8u5xuMkO
 mBMn7+GqxRwcpkeW/naSH1yK9qeTD7msIqO8HGWPBTnmWh6KGcXJwjIqtdkzJbaKqC9O
 RBlXPnkWiKLN6dr5xQuc15A/9KmTukH4HuhI7LJYwlM30U3mTcDcvZ/GwE2xq+JsxqBJ
 XCJEvMmNqlJHe5SxSNwbAMbFzG1JuT3r4TmhqhaOCjTUuUeA89iyBEw9cTQl6ft1bMsL
 iiOF4+w8ObBBBB1cJEgKRXvgaTLjxlBPssUroFL2CRKsOJn34YSoTaOpMC5ux3yt+zbB
 CeQA==
X-Gm-Message-State: AA+aEWbQ+DtTK3klhYLLBOziFRQ3rNtT6C09B1uYztN6fwvi+Z73AP2T
 oA64MM/+MTtINL51t4kbK4jEKFt0hLxE25hgxFO5cQ==
X-Google-Smtp-Source: AFSGD/Xw9MvGzuzWqMP/CrcqETUlbFzw5WUQKW10MqNm+laDdcftUK/1jYBE5iUFjIom67mVwCoLm3HkISf9ZUBXKUU=
X-Received: by 2002:a24:ce42:: with SMTP id v63mr15977itg.136.1544752690364;
 Thu, 13 Dec 2018 17:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20181210204355.3483-1-david.abdurachmanov@gmail.com>
 <20181210204355.3483-2-david.abdurachmanov@gmail.com>
In-Reply-To: <20181210204355.3483-2-david.abdurachmanov@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 14 Dec 2018 09:57:59 +0800
Message-ID: <CAOesGMiVZpBtOjCDw86-u0tEBS4yYhTqQHEwtaiL+MV3PGDAhA@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: define NR_syscalls in unistd.h
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_175822_490751_2E6D9015 
X-CRM114-Status: UNSURE (   7.76  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 11, 2018 at 4:44 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> This macro is used by kernel/trace/{trace.h,trace_syscalls.c} if we
> have CONFIG_FTRACE_SYSCALLS enabled.
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> Fixes: b78002b395b4 ("riscv: add HAVE_SYSCALL_TRACEPOINTS to Kconfig")

Reviewed-by: Olof Johansson <olof@lixom.net>


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
