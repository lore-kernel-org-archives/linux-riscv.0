Return-Path: <SRS0=qC9n=SG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_NOVOWEL,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826D2C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 18:55:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D372075E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 18:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lZkCltZi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oShr81BX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D372075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wrdn0fr7gVvUimjId/fkgyVPehKv7KVs1c+uqn7UH1s=; b=lZkCltZiIdGTXy
	e3zKxEmyvFGsB/BV/5ncBK+ztHDZevFBw9oMfqKYy+4LjGv1zzxiaT4vLV+bLuol2aUHWGXm9n6Qu
	NZSGc4c7m2gmYcjcddl/E63LdzrtD/jiF25c+tULwct8Q4N0duULhkAtL1ZL647RV7B/D1HIgTX2X
	CMUlgIXBl5QH6+A7b2LvR0IW0F7ejHgFjnmPJJak0gpKXvNQRMHZyFGrjLGmQWqt6IGnmhmzzDE6c
	tMlV9AtwEhOTwvG2ddWqVswtTqr9FagQR3my16b/GCMSgwXIwA2nTL+xWsGYSiF2RnpCaqJBDi+ZD
	u8cwANerpSt7X9Tq/U5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC7Wg-0002UV-T9; Thu, 04 Apr 2019 18:55:50 +0000
Received: from mail-yb1-xb42.google.com ([2607:f8b0:4864:20::b42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC7WW-0002Kn-TF; Thu, 04 Apr 2019 18:55:42 +0000
Received: by mail-yb1-xb42.google.com with SMTP id d20so1423844ybm.10;
 Thu, 04 Apr 2019 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=25sghkzH7+QQTBx8fQe0oQc1kNQMTCVYK21rCY5qth4=;
 b=oShr81BXfJmMNACrlPJNe3qZjMk8TVDODP/4DOZSEiguPFnp1XoQQSzj2L+/S7OgcZ
 xlRxsRSl3LKCT8cceZDc18vbr0akZuu8eHO9YvBuQC+ZF/Bg8Nd03nDvnFvPx3DTgSB8
 stQjWpAL9qfP/+KDg6paUcBuFqxkPiT8XzUlvjf8FjjvD7SiRbtUnQVK6FFEUypEDtYr
 qEOfIrGQMIzPvqW5P7S02ntouLCBWfQfbcVkwPGrsbjjwDMVuxZQUHNol5XmKFpEaG1w
 tH/XQqKdk0d4pVTwSgCh0Dh/8KyNP9gBybXk1tsa55B2gmsPvleeNJBUVZHmlKELfyUB
 hvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=25sghkzH7+QQTBx8fQe0oQc1kNQMTCVYK21rCY5qth4=;
 b=mudMurDR+Y5zg/XpomiOAlkp+9G82/DluszDumOYBVZdTrDEjuUCiIzqCwSS+bY4u0
 5HUqs0EQQe1ik8vwo57GIAbVcKbnguIajgwL8Tp5q7Jo1AVXV3woqWzaNuld57LDk8gq
 SzSnJRGa4iJN5p7qWSFcIenMBpc3QtOuHHeduoTlexVqZt9tqAsxH7tGflkg668GxE8z
 lt4vBWYqEfWscsYXI0wJXiyu/S0te4GFLhK+sQ+aScHlAh5opxT24XhyK6pZgrg8KFU6
 1wjAaigdFrBlpcu/y5OEFRRPPzXBNg3ccLmpDBL71kgKmK6MWKplCIuy6509xLPosqGT
 0egw==
X-Gm-Message-State: APjAAAUPtL3OqRya1eaSGFKtW5HJTDK1nVZAm4WCy6Vsu/5AKgjzEGth
 mDJlVmhj7rVWQpyQ9YSYT80nn6X53OQsJeOC+pU=
X-Google-Smtp-Source: APXvYqzh21O0ITqX+GxLGlXQTKYy8XTPMJsQuockVZOBkdbHKpkJnf7AUuLxdh0xNW+jLZEdFbPk0yqWF+qcuNBCN9g=
X-Received: by 2002:a25:6e56:: with SMTP id j83mr7056113ybc.16.1554404139647; 
 Thu, 04 Apr 2019 11:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190401134104.676620247@goodmis.org>
 <20190401134421.442323029@goodmis.org>
In-Reply-To: <20190401134421.442323029@goodmis.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 4 Apr 2019 11:55:29 -0700
Message-ID: <CAMo8BfLooVJgKCPQFDXUAfieH3XAF=Bhz2PmAb+3t7BhVBW5FQ@mail.gmail.com>
Subject: Re: [PATCH 6/6 v3] syscalls: Remove start and number from
 syscall_set_arguments() args
To: Steven Rostedt <rostedt@goodmis.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_115541_499282_412AAE9D 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: "open list:IA64 \(Itanium\) PL..." <linux-ia64@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt <palmer@sifive.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Oleg Nesterov <oleg@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-c6x-dev@linux-c6x.org,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 Dave Martin <dave.martin@arm.com>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Roland McGrath <roland@hack.frob.com>, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "Dmitry V. Levin" <ldv@altlinux.org>,
 linux-arm-kernel@lists.infradead.org,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@amacapital.net>,
 "Eric W. Biederman" <ebiederm@xmission.com>, nios2-dev@lists.rocketboards.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Apr 1, 2019 at 6:45 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
>
> After removing the start and count arguments of syscall_get_arguments() it
> seems reasonable to remove them from syscall_set_arguments(). Note, as of
> today, there are no users of syscall_set_arguments(). But we are told that
> there will be soon. But for now, at least make it consistent with
> syscall_get_arguments().

[...]

>  arch/xtensa/include/asm/syscall.h     | 17 ++-----

For xtensa changes:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
