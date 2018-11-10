Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA629C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:40:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA3DD20858
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="USj14qEe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDL+17dH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA3DD20858
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIR4BwRu7E6VZCs4wzd/TSz4moqq9WKy2pYTE/dV75k=; b=USj14qEeUc+4Sv
	UToWRjLD054abvzovyxiEpIY3AR8QHXDyHEa53oDvcaBed+Y+B3vOo4H+ToSGhFkAw9R47ppycuUp
	2BIUPD22n26cBGn0ybPvcsQCBC1rdFL9Y7F/vXGB+BBNh/rf2IvEHWnYFxfLRsSDdpTjQ26NvJITJ
	6n53YdGoRrWJZ3Wm+RTsZ4DfP+BF3v9xtMK3iMy/5uMVxk2uwA0+Vw3JwJXIXnqV/x0VRnKzinSCm
	DnAy4t6FeV2W7xlvMy8yidzXPNG1JMkkpq7i1gq8ef5z7Bu3yc2vJqR9/Ee3rt07wxnakCDc1jhuS
	KHqQsw51TELiBrzO8oFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXFN-0005K0-0D; Sat, 10 Nov 2018 17:40:37 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXFK-0005JI-2r
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:40:35 +0000
Received: by mail-vk1-xa42.google.com with SMTP id n126so1121206vke.12
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 09:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fxWTYYbq7y0ra1kmr9KX1kI3o3ZNhlkki7tw0gEP3Qc=;
 b=gDL+17dHGDJTlLGEUDEsXj/CZyNBoZSXuyXIdAItTCeCK+lPjjm6XP9yy7ljJszZS2
 k5XX6GIcO0h5Ii9LLK50scxix/zAavobUCbUx1VcMo5AeFjjc2PREddbxKW5cjLtsxju
 FWDG/bVCfpe0hMYPPSVEhNHGGFrm+VZDIh2PzncHkoZnALUJrmmKwwxe6UFOgxE7oRNw
 0eMGthgu5QQmnKb2RX5nK/pLQ09fRpWbBiX/ovqOYhdY7L9aeJ5oY3ud3ukgXWmgIHUN
 caZR0ewtabE4SIZEiXjbGqmYn3pItfEUFxlMkeUPCXvDSDoVk/FH5efYNY3ZPAhe3cj1
 mHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fxWTYYbq7y0ra1kmr9KX1kI3o3ZNhlkki7tw0gEP3Qc=;
 b=LmOh49ibi2YiCmqHLHXw9cWjkwiyyzlxXmDtJ/USC0c5MqiwsRhgnwvMgeL8fX2I9o
 2lVi7JczJA7s2Lf5Jz4WBCVFSEaPD8bjhKcWZhW9G3SzmGolEttO13cAX3r3zjB9VfjF
 c7DR2Q2sajW8e4atwg9jcHMP5nJkP8uJ9WVWZUJy+JvY5k6hF42YiDoyXTKeRPAZ1wqg
 Nm2dIVwBEAHAFONrP0vRJvFF3V4cqw9FyquhIU4fzyfkn02mdV5/4pDsVvSacBngbXU4
 8Q8O16L75tjs2zpZJ/FquRkGIvUi+wL9g+kL/uUw4XqiiHPQnh/piSw6dCZaXQDHY8v6
 IN8w==
X-Gm-Message-State: AGRZ1gLrostx7KMQMFjtUQOLD2kYpmhSv3Hk38rxqyPKm4zo63aL9ivm
 dN+N88Q36C8JAmPSrF4byYJlCRUHxwVmH9Anzfw=
X-Google-Smtp-Source: AJdET5fBFUwZW+OiplRh93f1X4eRaYex5HntqIJO7SnTaUfVcNnaydM7KDa36vB070zygJheIPM0gmXbDXmTe1LTDKo=
X-Received: by 2002:a1f:9f0d:: with SMTP id i13mr637625vke.6.1541871622688;
 Sat, 10 Nov 2018 09:40:22 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
In-Reply-To: <CAEz=sokxTJk=0EnRnLeG6LkaZiW-Dr4nmz=2JDgZm893NM-adQ@mail.gmail.com>
From: Samuel Falvo II <sam.falvo@gmail.com>
Date: Sat, 10 Nov 2018 09:43:02 -0800
Message-ID:
 <CAEz=sok_rh+fCnfPAVbaz3GznKhS8jsXTQrV-qcvH1bR8RTsTg@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: ron minnich <rminnich@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_094034_126020_D01A3A10 
X-CRM114-Status: UNSURE (   5.88  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 olof.johansson@gmail.com, alankao@andestech.com, "Chang,
 Abner" <abner.chang@hpe.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, agraf@suse.de, zong@andestech.com,
 atish.patra@wdc.com, sw-dev@groups.riscv.org, paul.walmsley@sifive.com,
 mick@ics.forth.gr, Alistair.Francis@wdc.com,
 Luke Kenneth Casson Leighton <lkcl@lkcl.net>, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110174302.1vWqMHVKZzG5wVZHxYBTjE6xR0uTojvMl9sDgRaDxPw@z>

Sorry for being all lower-case; I composed my text in Vim, and when I
copied it to the clipboard, I must have issued a command that
lowercased everything accidentally.

On Sat, Nov 10, 2018 at 9:41 AM Samuel Falvo II <sam.falvo@gmail.com> wrote:
> i'm inclined to agree with the overall sentiment of the concerns
> raised herein (omitted for brevity), but i feel that it might go a bit
> too far.

-- 
Samuel A. Falvo II

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
