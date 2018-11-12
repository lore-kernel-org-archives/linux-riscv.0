Return-Path: <SRS0=EHGE=NX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EC6C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 06:19:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76891216FD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 06:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eXUttXmZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JOBXVVn7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76891216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TF7xw48+Fs9epHDcsWVq1JvHvUfGpszgeOG14vC2NfI=; b=eXUttXmZMl8sei
	7Ns42eIdoxHgDcCaiVlGG3CrD+/l5wbHJ5sBHxWaMUgDH3XOPkufbtcyBpTeHeenvURBtS+ZmF8Z+
	niv9D2UHaHCBO5z3RUUW+O6nlYGWCVxH9UyGuRqfEjBhYUILLKUQTx78h5LsRvQ4CMIbfDtZywC08
	nzclHtfB3Rb1O9uvCGwSwvpq83p01fm+k6D8FUc3mIONnEzHdujQhc/dlwehMwkpo/lFMrxP7GisR
	MvpnXdoshsrTDTTsp3brYcDepAHuQqp8bnWWwhnJoM3O/qVKTYzpFRTDV+B/yaGWaJDguX2Pc2d5n
	5HHj/D7fJU2BMfE0rErA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gM5ZI-0005nI-Ah; Mon, 12 Nov 2018 06:19:28 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM5ZF-0005b9-C0
 for linux-riscv@lists.infradead.org; Mon, 12 Nov 2018 06:19:27 +0000
Received: by mail-ot1-x343.google.com with SMTP id g27so6975522oth.6
 for <linux-riscv@lists.infradead.org>; Sun, 11 Nov 2018 22:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H6U+tqLICzGYJyvAoJyRXt8ctDXLaB3KKit/SZjRgoE=;
 b=JOBXVVn7TVzzX5VjiPakncIqGx0mH91BCywaJ5InsQ3tDor4qK63UaYZqG2myz1W6m
 4KA5BJBwZOcJuHEuHOSeR3hzVRIpd30kJr509GtTLieq40ZaGqcGJbwE7+hrO+OYJbSp
 vFKQzSSvDeXmHkVHYnmGAgQwj+txtcJe6o5KMBUZkf826GBLO8ENSxmMMf8HO4M6K8Bx
 FdxRujGFnkJ2VMYTb/83XCmNr9rQq9xXSJVcLYdfc09SMxSh49jYvbwUDnt6JczUut+6
 aVvu6dWbS6fvgCJEfKu8YjEyQbgfxeRyKCLMIZmKfdDh7PV75JBmHr+6jvItDMNP9u50
 /ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H6U+tqLICzGYJyvAoJyRXt8ctDXLaB3KKit/SZjRgoE=;
 b=fbqMekh4AJ5IAPtMxuyh7Iia8qQN6aR1BrVoaR2NZ6QLCFXAeQoF6ZnhzROZjRJgKa
 Py/j1FM0O3aoSQ3/cYgM8u+NIzA7N0aaIFNNUQuP84GXBj+Wb1bfvnq2SkVj9SxSSC+f
 coZNrH2jU3lD1M48LGj1NteRrW34KJ4TMjbQGdWb0vt5mdrzz4LwkjLTLTclkUHmT4Bd
 uAV5OlTFSd9GKBKY/JUmMbaKatfwNr5TVsv65FyK3sF2vX471R6wOzoIc28M2r3FXFHo
 cwFSjI4HvGkxBcooWj+DkMMx2h2a1YuVI2NEqiKq9jS2WMgmrwvKMz3zjxTlKabeAMDJ
 IWLQ==
X-Gm-Message-State: AGRZ1gLT71IYwmxug+ZawZKZcprnbIObAUiWVF441h15783DGGRF5ze+
 44iE5kpIegL0CK/9paGWFhIdNCnm092oIX3irSk=
X-Google-Smtp-Source: AJdET5efhSUJ9qFEDZSnIua0x+YB7n8X5WIOSWoWzEktyG4fofHoHLTaobbWsmH58qZ1qu93c/i0yhx6A6iy1yZG+dU=
X-Received: by 2002:a9d:3fb0:: with SMTP id r45mr10728204otc.110.1542003553581; 
 Sun, 11 Nov 2018 22:19:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1541995312.git.zongbox@gmail.com>
 <41e8cb18d321244ab7000f7dc0467b6ebc5cab8f.1541995312.git.zongbox@gmail.com>
In-Reply-To: <41e8cb18d321244ab7000f7dc0467b6ebc5cab8f.1541995312.git.zongbox@gmail.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 12 Nov 2018 07:19:02 +0100
Message-ID:
 <CAEn-LTpXnzSG-rVVvv_2cbxqY2vTchOKn6M0isRBovoq4jpZGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: Request stat64 on RV32
To: zongbox@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_221925_404746_28867946 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, aou@eecs.berkeley.edu,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, zong@andestech.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181112061902.2XrK5nJjcYHHEOBbyfbQU0oIBcIKZYGcjgOXo_0yiT0@z>

On Mon, Nov 12, 2018 at 5:10 AM Zong Li <zongbox@gmail.com> wrote:
>
> The stat64 family that is used on 32-bit architectures to replace
> newstat.
>
> Since commit 67314ec7b0250290cc85eaa7a2f88a8ddb9e8547 ("RISC-V: Request
> newstat syscalls"), the RV32 build fail with undeclared 'sys_fstatat64'
>
> Signed-off-by: Zong Li <zong@andestech.com>
> ---
>  arch/riscv/include/asm/unistd.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
> index eff7aa9..a4aade9 100644
> --- a/arch/riscv/include/asm/unistd.h
> +++ b/arch/riscv/include/asm/unistd.h
> @@ -18,5 +18,6 @@
>
>  #define __ARCH_WANT_NEW_STAT
>  #define __ARCH_WANT_SYS_CLONE
> +#define __ARCH_WANT_STAT64
>  #include <uapi/asm/unistd.h>
>  #include <uapi/asm/syscalls.h>
> --

See: http://lists.infradead.org/pipermail/linux-riscv/2018-November/002087.html

The plan is not to have old stat syscalls and support statx on
riscv32, which is y2038 safe.

The issue you see is a bug in include/uapi/asm-generic/unistd.h.
Marcin (CC) already sent a patch to Arnd (CC) IIRC. Basically without
__ARCH_WANT_NEW_STAT or __ARCH_WANT_STAT64 two macros are not defined:
__NR3264_fstatat and __NR3264_fstat. Which is later used (without any
guards):

763 #define __NR_newfstatat __NR3264_fstatat
764 #define __NR_fstat __NR3264_fstat

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
