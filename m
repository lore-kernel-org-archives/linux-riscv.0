Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4CCC07E95
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 10:44:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78E8F6102A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 10:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78E8F6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPryyGi3uOGAC3/8egzqRCCaCtNHqGdkgMOIrtoNIes=; b=tBdeNdYvFvggq/
	dnou08+d6bIlkVleXUJGjATfr6T56cfd/GqCIVxVshec+CrlFj6Q9QX2Ry7k1osc4qC9/38JiTnNS
	TFZ1bzy030lRUmxEeeTAJorPvILWbwng+ukDeGateI4kt5QA08l7O0Vyd+rK2lEQPv4/ZOLVpKMaF
	RYhR9BZIqw0igtvicfdOL2ItBq0LtUc4VKjatK10n46DrxJB8ijEq93DU/ZgiwDF2yxfPMdotjP0A
	hxbKZmwf+t0S0zRnpq/TH+d5ZzLnAvCDTN5lGNaJvrGsgAW0YpHWaynSR+1KInamWLdXxMDTzS2sm
	pqE+LZodouB/zjixO2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4LKY-004BG2-18; Fri, 16 Jul 2021 10:44:30 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4LKV-004BEZ-1Y
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 10:44:28 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id v189so14131411ybg.3
 for <linux-riscv@lists.infradead.org>; Fri, 16 Jul 2021 03:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IIriuGowBPy7qDKgpwPUUzsyIgcUFjUWwSaWGUdPlRs=;
 b=s/iUgXb4UO+chmBCFLeAVPjAsV8WsMp6nDOtGR97ef3etMAMawPMeQJePULkSBlbWh
 wjr56lv3rH89btMb/qbyT7TuLdrkNfqo5TBl9WzpKj5wOlM8zUlxLzv1dhpUez8eSdrY
 URxX/EB3hfGHYk8G8Jx01Z2f6IwIQTAcuR5zl1QDsQnPTb0eZzpDg1cdMC2UJ9Do7FUv
 O6clbI6ow3Tv8Umqc/Ogh2iMhCkFrcChxX0KUaAJcgV/WEJm3axFlUh0rGk2hntvejtn
 Vkm42pI7lQOwV1Rw6HQsYcyCZu4k6E1Va/M927k29lNZVLxfjkvoFkduuypIG9V4a+pm
 ihSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IIriuGowBPy7qDKgpwPUUzsyIgcUFjUWwSaWGUdPlRs=;
 b=MReL5cTZzydaJovZZkShAcGzlvu2CGKB0lHmMQrpemNQIA71krgvLPJctI4CYVmBiZ
 Pytu5HiUlFCeWHFAiIn84kiAZ/y0NbIhbaLedtUo7cfq7Z8yWpWBl2xsUPXbbtVooLD6
 WK/zSQrOuuNGP32zB7R0mNBJcRvs6YRJ5ygUPLdTDPKNqt5HHZPfhUAWUdn4YFllhww9
 1n8fMqyBWgjvt6ZTyNXo4RpilcPGgBQrSNlEzu3wI8odXmG4da0Cx/d1oyUsp9+mlMh2
 GgGqlK1wMCeaqA6KSjLBpcEhg+7Ys18LlVwMrJm5CvKSw/6Hj76mani5lsgQhxkJ1/KW
 isHw==
X-Gm-Message-State: AOAM532BA0UYDL7NopsCCETwRw7IpabAcMuT+bkoeR6U3dzdE7HV/1RC
 IaL5rjCaXKQqG09XJycWaSSiui+57UpOnyt6Slc=
X-Google-Smtp-Source: ABdhPJz0QsImGYXUjHaO+CmXOBVEwHbwvki7a8VkWRjf2qT4XONPJ2+IN/IqZakrLXbOe3e58uz/4Se8gJa2ZtQqz/U=
X-Received: by 2002:a25:be09:: with SMTP id h9mr12035043ybk.239.1626432265636; 
 Fri, 16 Jul 2021 03:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210712174849.2202287-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20210712174849.2202287-1-ben.dooks@codethink.co.uk>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 16 Jul 2021 18:44:14 +0800
Message-ID: <CAEUhbmWmrEuwdy8OPhF1p1Sb7779QiWkx-Ca1OG5VQ38dxChLw@mail.gmail.com>
Subject: Re: [PATCH] riscv: add correct as-options for assembly in modules
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_034427_126749_7151699D 
X-CRM114-Status: GOOD (  15.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jul 13, 2021 at 2:28 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> When trying to load modules built for riscv which include assembly

nits: RISC-V

> the kernel loader errors with "unexpected relocation type 'R_RISCV_ALIGN'"
> due to R_RISCV_ALIGN relocations being generated by the assembler.
>
> In commit 7a8e7da42250138 ("RISC-V: Fixes to module loading")
> the fix for gcc adds -mno-relax to the command line when building
> C files. However this was never applied to assembly flags, and gcc
> does no pass -mno-relax to gas when presented with a .S file.

does not pass

FYI

The GCC bug was fixed recently via:
https://github.com/gcc-mirror/gcc/commit/3b0a7d624e64eeb81e4d5e8c62c46d86ef521857

>
> The fix (other than making gcc always pass -mno-relax to gas) is
> to add -Wa,-mno-relax to gcc to make sure the as is invoked with
> the right options.
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
