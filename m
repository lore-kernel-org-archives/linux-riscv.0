Return-Path: <SRS0=EHGE=NX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DD0C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 07:01:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54998216FD
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 07:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TRi+0Ur+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFilkktP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54998216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cYjyyq0lhpnIXc2JbUnDZJWasrkdHcFEhKA9M5bjhVU=; b=TRi
	+0Ur+ItH0PLliLAPxL9ZBG4Evua0xt3kng2ocMD/mxQBWzRXYxAHFfkzIonR/ctER6ol1ZQTTcMwh
	Q/9W1e1+Qyba8vLI9mewmKFQbCuQsfirlvNtMghKEz3kgKaSrseDLON/2NeBHRuFfQyX55w55EmSh
	7+bUde5yCnUxXCVuuym2KCnyj3JiwRBqvr4igNCM9HUhJoeVkNeQcSTiIfYI5Dcf2fkPV5qbNdWXP
	Mcpp53nb6V242pUnimZxbJdHSlfWk/4gAAKHygkyj+cVFVEl+JGLjPgYjU4hWIjdmQAtBrQycPqf6
	aawy7QTObe/bed/sCktMhVlhXlfMMrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gM6E0-0001yT-3N; Mon, 12 Nov 2018 07:01:32 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM6Dx-0001xc-9z
 for linux-riscv@lists.infradead.org; Mon, 12 Nov 2018 07:01:30 +0000
Received: by mail-oi1-x229.google.com with SMTP id g188-v6so6327672oif.8
 for <linux-riscv@lists.infradead.org>; Sun, 11 Nov 2018 23:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rDrlIed+7basQ8sEoMiDOT1wgTELTi1P5yoR7gQWljk=;
 b=SFilkktPRiUvv3zXqP254ai6iU2WE9x1LW7OdG2Y7+bhRZuhG6jddzvOT8SZm6Bp4N
 S/BDA9g3XyhrlcXlVbU6xVG+NYq6il+FPGlom2OTzs6ynmfn0Eipf8nwRB5X31sucHcD
 +G0JEYXh1knJr0ip5hifM/d1PNtFvkNdiGuhFkJp7/w5u/zu+BJCibq9ZxhDpwkWlBfk
 9XzVgt4MNW+MfE2kQ1iDZwvdWfuwboHISEWhviwo4zuNyk/goUxWEV/8tUFXfXAy5kkI
 4T3FPbTKSeN80XvliL3yfK0EeWQJePTzACXRrv9J5k6ubg67Kgwr6HonO4blfYq2UH+z
 3Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rDrlIed+7basQ8sEoMiDOT1wgTELTi1P5yoR7gQWljk=;
 b=nWekILXT6pstKl0VWIGbcV8CzLje227VwVayTEiP+X8pW0uwwzubWuwbX6UsfnAedW
 6rhmkvTC1Dl500iCtD4xyFi/PziWsR2At1MsEf/ECojnxo80P9D/tIIXuiKcvs9qEeZM
 38LB4p97xq7OwmKMkR7t8Vhz6hgQOIL+2pcj8pwCnX4G9Bo8lrsf0fne6ncMmsVDFuEg
 vyq9qspPC8+MoRw80Oyl3JLqRB30tvvsersYN2yJjCh67cLI0NUsm6PBn3z/yrz5O+GG
 mqu9t7/PYKd4GrF1pZCPtJopqy8M9BKY2mXEsvnY/HRWaOC5oNN+VFtEOy48m8HH/NLS
 fqbg==
X-Gm-Message-State: AGRZ1gKEXdg1pwbkWqpAOa8jSMF0aL+SdQGX2cnQnwsDpm6gCRW/e8a3
 a9gL/7IY10xDvKgj5ZeJo8nalzG7a4nSXyszfAySCvwv
X-Google-Smtp-Source: AJdET5c0RsIkcBMe0fEMn+oBvR05nnvU7ukSq0Vx4hAl/467DFbSGuZnuT9ZaRGeuTg8wCJkHbR3gNBjtdTZ9aJhG9I=
X-Received: by 2002:aca:3246:: with SMTP id
 y67-v6mr5493809oiy.165.1542006076111; 
 Sun, 11 Nov 2018 23:01:16 -0800 (PST)
MIME-Version: 1.0
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Mon, 12 Nov 2018 08:01:05 +0100
Message-ID:
 <CAEn-LTpkgi8y2XMvTLx-qXbC=xsW4pDZi-hG4ZDykE6uK9R1ig@mail.gmail.com>
Subject: /proc/cpuinfo shows mmu:sv48, but kernel only support sv39
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_230129_349470_C5E5FCD9 
X-CRM114-Status: UNSURE (   3.96  )
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
Message-ID: <20181112070105.Lj-LFlgstUiCvd5O91HMVTwpb1v9Ud3aL5iGOz_LJso@z>

Hi,

I noticed that my Fedora 29 with 4.20-rc1 & latest BBL
show mmu being sv48 in /proc/cpuinfo. The kernel only
implement sv39 for 64-bit systems. QEMU 3.0.0 also
supports only sv39. 3.1.0-rc0 version bumps that to sv48.
I would expect /proc/cpuinfo to show sv39 as that's what
we are running.

[..]
 43 /* SATP flags */
 44 #if __riscv_xlen == 32
 45 #define SATP_PPN     _AC(0x003FFFFF, UL)
 46 #define SATP_MODE_32 _AC(0x80000000, UL)
 47 #define SATP_MODE    SATP_MODE_32
 48 #else
 49 #define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
 50 #define SATP_MODE_39 _AC(0x8000000000000000, UL)
 51 #define SATP_MODE    SATP_MODE_39
 52 #endif
[..]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
