Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B20C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 05:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D06F620818
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 05:37:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PUPPE7CU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G90q6NTQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D06F620818
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drnWUmMZu8E1Qkp8PS7qd1LRA4OcRw7L/LibeAlCHsI=; b=PUPPE7CUfHczl9
	olPbzTOJ8MrLmM2wsUgFOyZJdmnm7/ji/G19mW39PMH4EC/Qllaz8i0scAzBVFmD6Ck8DYggFFvYt
	TqoTI0Alt79dkbF//1eYgnSTKasYbRxDcXWZGLsFSWxhJyOYweqwGZsHC5dwy+1v8Mxs/fbI0ax7F
	ilXVG/Q69VemVHJ+IWv1rdtaRgwAhLmDvBJQCdgEkeHdCsxnAfI97ImWASArUuSTUz033Xn1qFQ9y
	xfXz+wtm46W00or5d66E48J0kf77pbIeR+JErCucXL/4eLvJUSEC8wCySUQOV8zLTp/R7tyBHp5vU
	JJApxZbYOLcWnSdV0AKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLLxO-0005jA-Nv; Sat, 10 Nov 2018 05:37:18 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLLxM-0005ii-D6
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 05:37:17 +0000
Received: by mail-ot1-x342.google.com with SMTP id n46so3614186otb.9
 for <linux-riscv@lists.infradead.org>; Fri, 09 Nov 2018 21:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VupJ6bV/hI8EhHllXZL1KTk+2sOSAIdx7xfnFCaFoEM=;
 b=G90q6NTQX4uJmA5ARfAgZe5vppfMoWKw1pQuzaPqdhm/KUrrFzh5A/h+FnM2zEVCyQ
 mnrHlJxB2RbMaVXoZGh4thaV6++4LaVCkM7e6wLfppYnxFELcMSLFr1ddY2CjbavUmuW
 CUXxPP1FrKKpABr95ccOTySjBYg+HmZHTo/ukJrYNY2gqZLQPWm7yeoxicQDe8XGiOob
 XcmmRGE7a7O/EAN4puUF1+Q6ebsP+V42fTXvK3qgnuUERmn9pWB3RrpxTRagm4RnyQ9o
 wOuPRP/RhEAojQzbwUmsbYdEymoyKCcvr48/Ph0RRNAIZJ8QFo8OUZU09h5d/Jc5vO7h
 nWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VupJ6bV/hI8EhHllXZL1KTk+2sOSAIdx7xfnFCaFoEM=;
 b=GVXGpudQpF6imeZ7WHPOQ8JQ6QEvTyrJiVQiJl5/XrDUP4y4sZ16zp76KvUuAUcVgK
 mLp4KXUtYqZvNS473292I7ykZtbBo5b/byt9+aGIsVcQ5HhBRFi6d/sJtguxkMzabPmV
 Wn0UDmzriLTjQePiwgAZtfJe/Ob95P0ZV3Azo0aMGDelKA6pBJVYhtiJjwZBi6S1u/6B
 INQ4cvzGpB/C3bN17q9wSwtrIlnnXxJu/f+igQwnLRg9NgwCm0CloRJKP5owUyOCDHI8
 jWj+c94/fkjqbxKxzAdU3hZDlSZ4ODpfqNx8mxtb8l33kFkjO1FVIUcJ8ll+qko2ihTc
 ULdQ==
X-Gm-Message-State: AGRZ1gI0gF5sSrnW1l5ePGPntYBi+rtHFwV1ADxi712gB457ja2IjVAW
 l/x0pFLpSLoRt6RLTb+Cgd+i755IW7IGWEp3jw4=
X-Google-Smtp-Source: AJdET5dxBeVrzHketMfJNEr0XYf/wbz9fYi8+vvGOYRQMcfyNvFwXvF0DXu3TKcrNbbOd9HD5TduWkrx+etL3xsP7I8=
X-Received: by 2002:a9d:2ea9:: with SMTP id w38mr6433143ota.99.1541828224669; 
 Fri, 09 Nov 2018 21:37:04 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
In-Reply-To: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Sat, 10 Nov 2018 06:36:53 +0100
Message-ID:
 <CAEn-LTo1gKtuDpH6iZVT_-ixaQHh79gJ6oDbEsP4yAawriXeEw@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: atish.patra@wdc.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181109_213716_468344_33E6489E 
X-CRM114-Status: UNSURE (   7.96  )
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
 Abner \(HPS SW/FW Technologist\)" <abner.chang@hpe.com>, anup@brainfault.org,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, Alistair.Francis@wdc.com, paul.walmsley@sifive.com,
 mick@ics.forth.gr, sw-dev@groups.riscv.org, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110053653.peLPGOjh8m7m-i95PWqGNw_adnFbZgZE2gvMf7J7DqE@z>

On Sat, Nov 10, 2018 at 3:42 AM Atish Patra <atish.patra@wdc.com> wrote:
>
[..]

> 2. Every SBI function call may return the following structure
> ```
> struct valerr {
>    long value;
>    long error;
> };
> ```

[..]

> int sbi_hart_suspend(u32 state, unsigned long resume_entry, unsigned
> long priv)

A small nictpick, but could we have consistent typing/language in the document?
I see you use "long", and even mix "int" and "u32" in a single definition.

If I look into PSCI I see:
```
SMC32 uint32
SMC64 uint64
entry_point_address
```
which leaves less interpretation for my eyes. For example, "long" can be
32-bit or 64-bit long depending on a few things and thus easier to make
mistake interpreting the spec.

I would suggest to use (u)int32/(u)uint64/friends and something
similar to SMC{32,64}
if needed.

david

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
