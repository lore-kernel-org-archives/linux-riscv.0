Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CAFC04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 19:20:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F1F6214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 19:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ToLpameK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="b1NitquW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F1F6214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1f536o+nv8yYVXcrJ1chvmIA1Eylb1+aMsD5u0i/50k=; b=ToLpameKB0uMIx
	PIF3IZPqPTl3TfLYu5YI11lKT4PvzUJHm2ripkTYYBaobkJfM6a/s/855VH8w4/Id18zu2BSgBSsj
	D+N57tiRoDpY7cl4KiQZgJa7KgSOLfESzRfx+XSn/hogRB7w/rDku7iuxzFmCzyUEBMBIslPWzY/M
	o+EiYDwQAg+Lh4dFdyUMonTkYAWmCvQxAzpbR+7RfbD7f6hI+Vld/hkN+uEveptNcjZiCl1Gx1flv
	hm8Deh8lDz40W02KkjLVhiu+USZq7jCPoK+QagnIaQIDGV/xRdjk+MJxdfSUP1gKIWeHg4yG40Z6I
	1qT7y9TaC4M+8XIFjYig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUzCj-0006F3-Ge; Thu, 06 Dec 2018 19:20:57 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUzCg-0006EM-Pq
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 19:20:56 +0000
Received: by mail-io1-xd42.google.com with SMTP id t24so1327159ioi.0
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 11:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3l1bT1wrmEe0RdgJPl48rj9ymkjVQkwNUnWZ7wIpihI=;
 b=b1NitquWdvPrBmRdCB1RcjV7nivZ2P8SRLbrLmQcgBjgfyM5qPAkUNYXlAwxXw0kKA
 FQWofFpUCb8R5C88k8CsSAlv91Z/y6f2DWCNSCyji6ZRo8vj7biuSO5aapZT0+/bxLLG
 fzNZ21rTpTWwNqZGuEjOI7UWrjYAbWoakMja5kmZn0zBvLNzxqSaMXeRDR6zgn5nBMiI
 lKMg1JUUpclzCfjoqdQNMAIFiq36Hf5r0jmnQaRZpjy6G9HLnQNI4JI2l3KoneQocafE
 eB8IEjcEPl2kZ+4762a3ZZPgT7BtIvHY2xSo/C8+EvdzjJIoEzlO7zO6sBI36Rhr5wvs
 d8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3l1bT1wrmEe0RdgJPl48rj9ymkjVQkwNUnWZ7wIpihI=;
 b=tkAaaKmuF4OTwRbHh6hWDqdV2scd9P9UWkz09X4pmF1gILa6CXQlR4tStYbTyBtXSI
 +XHSk8vMGKwuyAhTHSdBFwpb1okxwmyLSQhHshGHHA7ujgkXX38MOR2eH2PHNm3lt0uV
 o/TqBZVbA0AGyu6uR7F/EhvgDGFchpDZfaEw3zKK9HFj/1UWpVPgTEtUY4NIgWDZ+Qr3
 fxSARehHfTRQS4u0AYjV8++3LR8oEYxaYFDvsqAfSzf11EJJsV8KP/gBzBEbDQE3NemK
 hruZKOH1QHHByr5SicjwSCekV6bwJbqldvREWdcQAxKKbnyPCb7IEGILwwQ45Rw7kxVy
 xwHg==
X-Gm-Message-State: AA+aEWZAaeSh2lRk6aSaJVintF1hbM9bFtf7jo8WKpQE1UoctB3idx/k
 oYLD01paBZXg/Ag1b9odEmgMLewny5PCHpeGrHNlaA==
X-Google-Smtp-Source: AFSGD/X34khEbHWDAJCWiOXfd18MB7Gmxal6uEb4gbp0RK24ery8cyYKEwTcjcuOLbytmbRqFVmBDzptPWdw4E8khxU=
X-Received: by 2002:a5e:c107:: with SMTP id v7mr2148052iol.155.1544124042917; 
 Thu, 06 Dec 2018 11:20:42 -0800 (PST)
MIME-Version: 1.0
References: <20181206102626.2557-1-david.abdurachmanov@gmail.com>
In-Reply-To: <20181206102626.2557-1-david.abdurachmanov@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Thu, 6 Dec 2018 11:20:31 -0800
Message-ID: <CAOesGMiT2OpN9VFaeST5tBW=epkknRUcrQtVLrpeR-GpRCr34w@mail.gmail.com>
Subject: Re: [PATCH] riscv: remove unused variable in ftrace
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_112054_839433_71A21D1F 
X-CRM114-Status: UNSURE (   5.97  )
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
 Steven Rostedt <rostedt@goodmis.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Dec 6, 2018 at 2:26 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> Noticed while building kernel-4.20.0-0.rc5.git2.1.fc30 for
> Fedora 30/RISCV.
>
> [..]
> BUILDSTDERR: arch/riscv/kernel/ftrace.c: In function 'prepare_ftrace_return':
> BUILDSTDERR: arch/riscv/kernel/ftrace.c:135:6: warning: unused variable 'err' [-Wunused-variable]
> BUILDSTDERR:   int err;
> BUILDSTDERR:       ^~~
> [..]
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>

Please add a:
Fixes: e949b6db51dc1 ("riscv/function_graph: Simplify with
function_graph_enter()")
Reviewed-by: Olof Johansson <olof@lixom.net>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
