Return-Path: <SRS0=qC9n=SG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD54EC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 23:29:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88630217D9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 23:29:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aX+5ncmR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NlCUU5PO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88630217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=yHAxl258z+Ijfq3s5X7yw1G5a3YUvAFoFv2PFPD3KVI=; b=aX+5ncmRRFh+KwTxY6aTQGRmx
	UhkmOFkKMJjtxwGbuFbT45+e90QBDyoN2jS3+xtCU/fMcP6YEhwPcY/0n1WqVj+VDPLbPx2yUhdHR
	cAiIMkN3ykhwT9Ww8SLxK8JFbjnq6KkoEBpYaWxSVf2NcPWqg3PrYtSa8WimItmJyb9L8onIGtoNc
	6JD017uhyZwwRKeichcTOu6l/8uOiuqJiftoi3y0VzP2zqsbYAO6ulRyXAHbrCSfpsJ+ce6CrGRSY
	RNLPdQ53XHhNW6Z7qUzqY6pLbdXCYA0vShRd7RUJUHvq5ZlZ86WstA29DklKyv4qTd9U5cIx0VwHJ
	mc6yWdAHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCBnn-0000C6-Rg; Thu, 04 Apr 2019 23:29:47 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCBnk-0000AR-SA
 for linux-riscv@lists.infradead.org; Thu, 04 Apr 2019 23:29:46 +0000
Received: by mail-pl1-x642.google.com with SMTP id w23so1955039ply.4
 for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2019 16:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=nNTAkkSsesyNF1L4wisBciP/ffK/Ou780QIlgqZ7C+I=;
 b=NlCUU5POvdSDVM2ZUfmhXzSe8nwyHxfj3wmUbZuFZrmik1KALP438cig7tYr2imNuj
 fkbo39GuuYQkJFk0maPEgW0F9Xrud2GIKuqRTq+fUn53DN+B1MusFx7iPyGmCFteSvcU
 4+/hyrmaz7hAQbfMRAlLJqrzcDb31K/nbB0qnFMKY+/1F2k4nWNqJJIuLP/Wm3D1NaC0
 8dplYsRrrPkU3uKURX3cbb0ygf2N55l5ZZ4xMhH2ksaIib7IrS26RM3UGVBmvWmcEgB4
 CdUq6dTx93i+yVnoVQrJljIUjEwR63Fk6wmMBrrBqKkIJl2QJDtc1i6P8M3/TBADuV2g
 +aNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=nNTAkkSsesyNF1L4wisBciP/ffK/Ou780QIlgqZ7C+I=;
 b=LG1Vs82T5aj0S5ALfwmWB6EZDrUGlJfRdNJ1FVQkhUGKrFDx/AUFc3PvMKw3EfyXd/
 9jt+oyNLCZ/fTe2TTK0A3xczMxj3lgzeYwusC0lIhJY08PwtA/BBXaMIHi8ykKR6h9VF
 Dc4Hp87UZqP1FU0ZRPCktvAFHPAIzp9P29Lih8XAZliYMFSuOzTwarKar10DaCD4tWeR
 xL18O6OAgIV31mqmXjvj2J2F9cjdNGebo+PwFj5WEHImGMNgrIQ1o3oIqwlR8dRkZ5JQ
 dmT2bZstosZ3VaUk0URg81gxuPrlnVYg5/uP6xE+o3MA9NY1fn/NjdqP9+I14l9TnBRT
 3DvQ==
X-Gm-Message-State: APjAAAV2mm2rqMPKBPWZ3PNgXBJ7vOQgFxZ5Gv9RJoFlwqcGCO5oyoMK
 nlrz7jfIaK47k9X4yXvF/WkofA==
X-Google-Smtp-Source: APXvYqyT886hiDdS9f9N1ElR0YHL1O+XWROWt1J/VpvcSZn88aex51BUH6YO4f9IFbNnWC2h08TDZg==
X-Received: by 2002:a17:902:47c2:: with SMTP id
 d2mr9263608plh.277.1554420583757; 
 Thu, 04 Apr 2019 16:29:43 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id f6sm16304527pgq.11.2019.04.04.16.29.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Apr 2019 16:29:42 -0700 (PDT)
Date: Thu, 04 Apr 2019 16:29:42 -0700 (PDT)
X-Google-Original-Date: Thu, 04 Apr 2019 16:23:28 PDT (-0700)
Subject: Re: [PATCH 3/6 v3] riscv: Fix syscall_get_arguments() and
 syscall_set_arguments()
In-Reply-To: <20190404102653.705456df@gandalf.local.home>
From: Palmer Dabbelt <palmer@sifive.com>
To: rostedt@goodmis.org
Message-ID: <mhng-a348d416-3a9d-458e-be83-d7a584f590aa@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_162944_924594_ED56BDE4 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: gustavo@embeddedor.com, peterz@infradead.org, linux@dominikbrodowski.net,
 oleg@redhat.com, hpa@zytor.com, linux-riscv@lists.infradead.org,
 mingo@kernel.org, linux-arch@vger.kernel.org, x86@kernel.org, mingo@redhat.com,
 aou@eecs.berkeley.edu, keescook@chromium.org, roland@hack.frob.com,
 bp@alien8.de, luto@kernel.org, tglx@linutronix.de, ldv@altlinux.org,
 wad@chromium.org, linux-kernel@vger.kernel.org, luto@amacapital.net,
 ebiederm@xmission.com, akpm@linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 04 Apr 2019 07:26:53 PDT (-0700), rostedt@goodmis.org wrote:
> On Thu, 4 Apr 2019 17:02:10 +0300
> "Dmitry V. Levin" <ldv@altlinux.org> wrote:
>
>> On Mon, Apr 01, 2019 at 09:41:07AM -0400, Steven Rostedt wrote:
>> > From: "Dmitry V. Levin" <ldv@altlinux.org>
>> >
>> > RISC-V syscall arguments are located in orig_a0,a1..a5 fields
>> > of struct pt_regs.
>> >
>> > Due to an off-by-one bug and a bug in pointer arithmetic
>> > syscall_get_arguments() was reading s3..s7 fields instead of a1..a5.
>> > Likewise, syscall_set_arguments() was writing s3..s7 fields
>> > instead of a1..a5.
>> >
>> > Link: http://lkml.kernel.org/r/20190329171221.GA32456@altlinux.org
>> >
>> > Fixes: e2c0cdfba7f69 ("RISC-V: User-facing API")
>> > Cc: Ingo Molnar <mingo@redhat.com>
>> > Cc: Kees Cook <keescook@chromium.org>
>> > Cc: Andy Lutomirski <luto@amacapital.net>
>> > Cc: Will Drewry <wad@chromium.org>
>> > Cc: Palmer Dabbelt <palmer@sifive.com>
>> > Cc: Albert Ou <aou@eecs.berkeley.edu>
>> > Cc: linux-riscv@lists.infradead.org
>> > Cc: stable@vger.kernel.org # v4.15+
>> > Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
>> > Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>>
>> According to
>> https://lore.kernel.org/lkml/mhng-8e9b547b-7fe3-43d2-9dea-b217de923605@palmer-si-x1c4/
>> the following tag could be added to this patch:
>>
>> Acked-by: Palmer Dabbelt <palmer@sifive.com>
>
> That link isn't actually an ack. Palmer, you OK if I add it?

Acked-by: Palmer Dabbelt <palmer@sifive.com> (for the RISC-V parts)

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
