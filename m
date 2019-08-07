Return-Path: <SRS0=DSzU=WD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6704C32751
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 12:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79F7C21E6E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 12:29:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZXmlHmBD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hs2BZRdp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79F7C21E6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MP8u50koRgLYGvho8o3Lc6L4mBWqhA9kvMVrfeeDKU=; b=ZXmlHmBDy+1Fw5
	Y135I8vrUzQTOFVp/UbIki0miDKv3HmYkmcfbiNqqoWUUa8/lWsGiA4CNnBzN827xmT+fwHro3zyB
	r8dQUoLcnUFf43x4uVw7S9wvyBxMrWUncCgtUOoj6jzMtSH/Z383OjuhbT+CyMhs2XKh8r+bNR6W0
	svz6sswTY27Y8G5jwRtc/fD2Gl8m8+lbs6lA9Q6C6Tc+J97cHEcnThJo0pnHrZ5/zhKG0aKkHW+IC
	f/AorkvQ+hfEA2MJ5E/6zDBnsHWS1YfSXnp+AO85YpDFHp7Il24Sk4Mn9BgBtczB1uF89i4zJHPT1
	dOxZWL4h3FMIOtpNPdrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvL45-0005Ov-FE; Wed, 07 Aug 2019 12:29:13 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvL40-0005LG-IU
 for linux-riscv@lists.infradead.org; Wed, 07 Aug 2019 12:29:10 +0000
Received: by mail-ed1-x543.google.com with SMTP id v15so86069547eds.9
 for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2019 05:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RMGcLcpBFvBpeJnTu8pKFKchF/J4VwKD/tTDs+NsQXU=;
 b=Hs2BZRdpKwuVf04EmL/zxWrnNhMxtMy7h0wGB3ikJvc3l/oxOzFWnumHtlGGzHAEX1
 zySBfRKQCOt8Fs1uW+NRNdqCLcU6I1CKBWWPz3V9PUuHR/Qq/eG6O11acF4zG5BpD36m
 2ZLfT9yo6+bHOkew7NGT5pU4xa/i+jOGcoXw+sKYn0jBTp9YB504PVh6Ehicjsns5mUp
 3TAsX7d+r/kbrvYcHl9IW9NaYgYGWncAM3Z0wpJ2niOieZ1SviuTY+xedO0IjXBR+4NO
 QwTPlWBimBKD0BfkFRwF3fFfNZiLCDA7fSQDn4OjAYuqA1KrmbgK9qCD0VTrqYif08HT
 gZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RMGcLcpBFvBpeJnTu8pKFKchF/J4VwKD/tTDs+NsQXU=;
 b=aIwCBuXGMtf+h0TW8tzN3lMf2ePn2CbuyQF2Wk67uvui9Dl8bBst7nUEN7EFi+tJDQ
 WInb1ZhipuS59SCmT9vWFKKxf1KLQVW1RMjeVcro2+xsBSM6CG9VGkt1AUuHmttr7JyD
 VbTmwhpsBgu0T0iwkIKoUr8sXjJqa3tj0vBgHpRiershA9ETAcufOMjKb56k4Eaahz76
 osnBXIFMySkwasK1ujiT3B7me/iR2xkrISOv2CTvq8LAM1dAs+hqRDxtf5wr4lFsldgy
 uLJ6M/FRy8Q/E8QKdpnJB40s3Dp6+I0RTYJEqCaHWwrliNhqemulVCxCMgWExt7Ie3rj
 pLNA==
X-Gm-Message-State: APjAAAU7KYHhNzfLhC6OSwnLLqIEEeK9ypRVIxPyHjsT/kMiKXsqkUsV
 U9MkYyeDyM0UfrC+pbXKpYb5d3jC3v8KBbf+TSk=
X-Google-Smtp-Source: APXvYqzCdGyICX2LUoiY5hqgxJ7SHzCXH7ef6H+PwGXHY9Jlh73ZnjzNMytBeuwief9bV3euiMPvWui+bAoe41vQnDE=
X-Received: by 2002:a17:906:fcb8:: with SMTP id
 qw24mr8113765ejb.239.1565180947146; 
 Wed, 07 Aug 2019 05:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.9999.1908061929230.19468@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1908061929230.19468@viisi.sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Aug 2019 20:28:54 +0800
Message-ID: <CAEUhbmVTM2OUnX-gnBZw5oqU+1MwdYkErrOnA3NGJKh5gxULng@mail.gmail.com>
Subject: Re: [PATCH] riscv: kbuild: drop CONFIG_RISCV_ISA_C
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_052908_726997_17001881 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 7, 2019 at 10:30 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> The baseline ISA support requirement for the RISC-V Linux kernel
> mandates compressed instructions, so it doesn't make sense for
> compressed instruction support to be configurable.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Atish Patra <atish.patra@wdc.com>
>
> ---
>  arch/riscv/Kconfig  | 10 ----------
>  arch/riscv/Makefile |  2 +-
>  2 files changed, 1 insertion(+), 11 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
