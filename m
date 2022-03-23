Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD36C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 00:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=NELYH+hOhra8crxXoJAGgxFm5AjZOYZLJSD2AE0L/KY=; b=izlqVq+W2ReUQ+Nje5/ce8yDRw
	P/dofo56/zqPXik3iw+fk5MzyicYPOL+h6fZw74Mrlc1gkjJq/9KDgqJrz93xVBl3Sz2US3CvaRLL
	wSaLrKfG4P6HNcGTNHtw/5HFLWzrcnykScrHUgKFv329EnilrVpscyIVdSKbeldQRMfs1TXNgOSq2
	L9t66zCi+jxscz+kYux9Wm6LdkzANDeZMWlo4foxQ3LHC0v5DZaBaaFr7gSWU8kzDv9Q9ifhDaNnX
	zywCs+X+2+ix2zK6Kjn538dmmNu2u9JLuYg51/C+hphvD/sxt46lTaMWhjbbkmF/5ILosYPkfYLOg
	K6jm/CCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWpH1-00CWHG-9g; Wed, 23 Mar 2022 00:54:51 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWpGy-00CWGm-Cr
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 00:54:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id gb19so226354pjb.1
 for <linux-riscv@lists.infradead.org>; Tue, 22 Mar 2022 17:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+7wy3Ia+NV1VbKjVeUtuzmPhGU89pjqnf00x6o0e8BE=;
 b=O2XAnRXlkFoz98SoqkRNGEIDaNlQfIbYVlynj7glodBX8qISP4s8IVixE5AEwyW5wj
 OsUZgaMBGTtultqLPNw0jd75eGWhRgZ8bsMDjzJtR3h0bpyuSYgASN7ITCq08Rqo7wna
 GSyk1d+db2T05r0hDLLJryn3ezZ/JtY90wSY9FpVGAnco0yPOKHCszB7mrSAdcK10K5v
 fF6CDZWPyUWDvqZAca6lDBwS5lwxriu1l7pQXrKsRgzRDKXCbrxSIIQebEsX8MSUAUAr
 5x4yuUmuLqdP+DY1+8TGxhDtd4pW0KPG7+Dh4EEuycgbvd5tbPcWP9XRdceuankwUUJy
 FONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+7wy3Ia+NV1VbKjVeUtuzmPhGU89pjqnf00x6o0e8BE=;
 b=VhWkO4BG+wIdfazt9iPpNwQlENszCC1HstivxvslSKV/qNwmcfglWy8y8HSfnYFtLO
 SHiDvIkR0obrXnYJoc6r+fjR+S6VisrMmEirN5lXXSPTHPci5EudjKgdiZAHg15igIVP
 6IcxAjwaPaoiDTx/rb4/TjYo9PNkoapmgVyOlT3izETlSYnnLGZBtjQFd9xp1dU5drMn
 btYMPMpSleSZcazl+XE3TQLGk9QPsH6PaabUydFeYv3Ue1XKPxf27JOYiMmztssBQIsV
 uqRh2Q9bGWOFwxdaFqrNxDqxdKUXm9oiuUyHwukq+ZyK8etWxmmqFATp4Xe3LvI+Alv5
 zzog==
X-Gm-Message-State: AOAM530IW9VwMzc27YxjsKuynV7JwLMIlhhsK8BGi4eeLL7BP9IfAMC7
 PaLYhB1jPMWNLGzI7/bQUm+sSA==
X-Google-Smtp-Source: ABdhPJy3ErzZv9tFWjiPX/5S/fzetUx4xDZypXvoivlDResD3gxzcCuCbFYdx+9y+LTyXuf1IGWiHQ==
X-Received: by 2002:a17:902:f60f:b0:151:4f66:55b4 with SMTP id
 n15-20020a170902f60f00b001514f6655b4mr20991553plg.127.1647996886237; 
 Tue, 22 Mar 2022 17:54:46 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 s12-20020a056a00194c00b004f7c1da7dd5sm24832737pfk.1.2022.03.22.17.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 17:54:45 -0700 (PDT)
Date: Tue, 22 Mar 2022 17:54:45 -0700 (PDT)
X-Google-Original-Date: Tue, 22 Mar 2022 16:19:35 PDT (-0700)
Subject: Re: [PATCH v4 0/2] RISC-V: add support for restartable sequence
In-Reply-To: <20220308083253.12285-1-vincent.chen@sifive.com>
CC: mathieu.desnoyers@efficios.com, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-feffd224-1ed1-4238-a791-a6b625d3d202@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_175448_553047_996400C2 
X-CRM114-Status: GOOD (  15.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Mar 2022 00:32:51 PST (-0800), vincent.chen@sifive.com wrote:
>
> Add RSEQ, restartable sequence, support and related selftest to RISCV.
>
> The relevant RSEQ tests in kselftest require the binutils patch "RISC-V:
> Fix linker problems with TLS copy relocs" to avoid placing
> PREINIT_ARRAY and TLS variable of librseq.so at the same address.
> https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=3e7bd7f24146f162565edf878840449f36a8d974
> A segmental fault will happen if binutils misses this patch.
>
> Changes since v3:
> 1. Modify the endianness checking.
> 2. Fix a bug encountered in 32bit environment.
>
> Changes since v2:
> 1. Move rseq_signal_deliver() after syscall restart handling.
> 2. Add rseq_offset_deref_addv() to support memory barrier tests.
>
> Vincent Chen (2):
>   RISC-V: Add support for restartable sequence
>   rseq/selftests: Add support for RISC-V
>
>  arch/riscv/Kconfig                        |   1 +
>  arch/riscv/kernel/entry.S                 |   4 +
>  arch/riscv/kernel/signal.c                |   2 +
>  tools/testing/selftests/rseq/param_test.c |  23 +
>  tools/testing/selftests/rseq/rseq-riscv.h | 677 ++++++++++++++++++++++
>  tools/testing/selftests/rseq/rseq.h       |   2 +
>  6 files changed, 709 insertions(+)
>  create mode 100644 tools/testing/selftests/rseq/rseq-riscv.h

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
