Return-Path: <SRS0=6doD=NU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88946C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 06:59:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D5A82086C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  9 Nov 2018 06:59:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HZwG+Hlj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cj/Q2/uz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D5A82086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tQRuAp1ZAFV+kec+tNzCuxqcsf0+KgGE5aLdX5urEJs=; b=HZwG+HljsTBS5v1ENOjVAmPvb3
	yMzYN1pXxvewk3W9U6o7IYn29m5sX1t/U6mbIOKpiaCEEEg3xk3ai5hCMgnVq+6fGn4jQ3oDk4Pc1
	HrHZVGYl7VeulhgQaCpewSY5rB0kAAdYlMrZXhZKcNoTBEaG7vXundjV41nswpaaxq4sQzoP8CDIA
	OI9BP39qDo4byB/0c4N4BFo00ndji5ZHQbCYQNYdLOSoJ2gBFSPH2F9p3zWx+KChCwdWyQ3UKnhWj
	5rtXoLdl+UwmxattPrrx8nfCt8D4P//aJ53b0YLWkesGLXYtswYw58K+5cfE/gsm3A8CTvdbeMQ4e
	6zDAPJWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gL0lX-0005Cs-9f; Fri, 09 Nov 2018 06:59:39 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL0lV-0005Bq-0k
 for linux-riscv@lists.infradead.org; Fri, 09 Nov 2018 06:59:38 +0000
Received: by mail-ot1-x344.google.com with SMTP id g27so756835oth.6
 for <linux-riscv@lists.infradead.org>; Thu, 08 Nov 2018 22:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Rt7dvlXRtuXdezXvwwdHrCrHcLtulW0mACAMUGxzCQE=;
 b=cj/Q2/uzb+1I2cqayV2i0EqPfq/nKB/b2/15tW2fon8xYVmVs5owm8Thf6hVn1V+ui
 +j4PxDcj+aEVnUfUDabuqzPZVti0vZUVXmFLBQR3PPWd4cpA1/rnWe5tzD5G4rhePnTU
 59/qgSg8bcrscrxIMb9UcmzOtasJEa3q/X9TFKyGu8QSFzvmK0ieRy3WILsumh1psVwq
 KrkOpSU6Prz+lCDDwUfRcQ8lNsj164AYeNzlz462MxUa9bKxQY9bEXk1/Ao1HdSVhmUs
 zC+3AYAD5iETMa24309sKBHrEpiN49+PlAHpbW3ozVkwUq/RkBLklEZr09wrCs4faHC1
 cuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Rt7dvlXRtuXdezXvwwdHrCrHcLtulW0mACAMUGxzCQE=;
 b=gtwfJuvp3Gc4ythjQZCimxpY3S33Hnvw8G5PoJMJBAz2ysQzNWgmuZY/hZ4vqGv8eY
 R/Y3ASWkV/ElpzOqE7TQqZMJzSyXwuQ3G121Nj2mY0oXQRTXIgSxgcs3t64vf0VpbA1s
 KjZ1pFXYq1A5Mn+Ww9xYd2oaJ5KhzqoKNs/PLnsUtXSjUu6bohVOY8yJ8pfRuu52srmH
 jUKhAY0fehAz9t6oiW02yn+lkhQ3DpgKkKpJnXwt5nOYiJ6ZSm3JPm/sNF2dQ6PWgfh/
 WQCuNfXDkcqPiSslDcKWXxaHxNno9L6aRkicPilcnvi70xiesUrNzuE6trPPuPLOHbfk
 F1yw==
X-Gm-Message-State: AGRZ1gKeLyy86FS+uSJ9DRDV+YkI//GfbLPvg5pvNnVOV01JiwI24aV9
 yxahZhvzhfr2UxxHfhW0QuE6C8UV1LWXuvMfqRs=
X-Google-Smtp-Source: AJdET5dAKOPl9dS/Ib+deFNw+ij/Zm8bpH7t66EDEK3F5Z2VHu1lEjgo1P/Uqsq9g35PM+LASxyw8iRBl3WL0YWjgIg=
X-Received: by 2002:a9d:dc3:: with SMTP id 61mr4575956ots.345.1541746764030;
 Thu, 08 Nov 2018 22:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20181109031303.GA20906@altlinux.org>
 <20181109031712.GL21511@altlinux.org>
In-Reply-To: <20181109031712.GL21511@altlinux.org>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Fri, 9 Nov 2018 07:59:13 +0100
Message-ID:
 <CAEn-LTpbzdpeWv8wqo_ptBw2t3Ypzzp0JcB+TGMG4NZbEGBnkw@mail.gmail.com>
Subject: Re: [PATCH 12/13] riscv: define syscall_get_arch()
To: luto@kernel.org, Palmer Dabbelt <palmer@sifive.com>, aou@eecs.berkeley.edu,
 Paul Moore <paul@paul-moore.com>, eparis@redhat.com, lineprinter@altlinux.org, 
 linux-riscv@lists.infradead.org, linux-audit@redhat.com, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_225937_061561_5E9542B7 
X-CRM114-Status: UNSURE (   7.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181109065913.dtOa4pwCs1ZhW6pKZpkI624T6mIzzZ4PCkcCc--VOd8@z>

On Fri, Nov 9, 2018 at 4:17 AM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> syscall_get_arch() is required to be implemented on all architectures
> that use tracehook_report_syscall_entry() in order to extend
> the generic ptrace API with PTRACE_GET_SYSCALL_INFO request.
>

I have posted audit support patch for RISC-V in October. Pending review.
It defines both AUDIT_ARCH_RISCV32 and AUDIT_ARCH_RISCV64.

See thread: http://lists.infradead.org/pipermail/linux-riscv/2018-October/001933.html

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
