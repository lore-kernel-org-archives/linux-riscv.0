Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF4AC169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 09:03:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F42921916
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 09:03:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k7WoOFyi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="FPfCEUJL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F42921916
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IH+Ucs5/ub9kZ0vl2pkEDQOsYPt4FxUCelESTaOo7Y=; b=k7WoOFyiI4SH9N
	7C47fibKCPC0MDtAsXgKEX2yT0Gt07PtDu+Fm7NVUwknIYVIrNhmj+/In+R6ljcCciR3XQ9gKsd8w
	qkDDR84HM5rzosx9Mas2bTc4PN6j1k6bXlYMN4RA7gNNZ4vgwwc9c2ThIaktW+wn2HTYOzGqLOWWH
	dvO4zJk7fh9gLgfDFnpMoF25s0n/lHI+8ZyLVvzHy3TvaNMMCXJigXm0mrjj1+TsfN5f3i/NWxlEe
	AwCJaATZgiCicURLU10GEjgq6D8LtAs5oMw1FsffkdeCtr5xWkpC43XO6JHjluZMrk61n0UnQ4hSc
	+R3HL0pJhyd1gPNuAsgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs23x-0004b8-UP; Fri, 08 Feb 2019 09:03:09 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gs23u-0004Zz-6T
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 09:03:07 +0000
Received: by mail-wm1-x341.google.com with SMTP id p6so2561324wmc.1
 for <linux-riscv@lists.infradead.org>; Fri, 08 Feb 2019 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9uY2GgfbAQjjjw4/21ksKGlJbXGfclv9W8u71dpXrBk=;
 b=FPfCEUJL+Ne5JhlDv0pPxS63xotjVLzc/nuuhumXY+386nmwBMecoCRadMuQkRlwU5
 JjCkDt7x6W2NoTCDM/hVkDMnSH5wDzDKu5Pz3QHyMTVV2BVCnaWD9U+C6NbSrH/mIv+y
 JDcLbS+F4PHXhQS+6PqXe9m3JP3jxZo7Kii5xZRHJV7AlktyEhbYx6xNTlSgmdJpvzbJ
 3NYqZseTbAkv83X7dYPFJK3oi68qNbeW9jT8+zJx1k6zbSNcBYIDW/eEB8HkDVGyMQtX
 X4ojaJczp6AoInUU6GJySlUuJ84x1vWH2C/C/fjFqBUeTHrwQLE3FNYbSwaJKmq2wXHm
 eCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9uY2GgfbAQjjjw4/21ksKGlJbXGfclv9W8u71dpXrBk=;
 b=XRfTZoBYaipUSN5Rj/e4BdpxfP4whOX+/1naqXSoyR/Nhfow5VUJiRbGciAXyGCp0A
 iza2oVXI8lSgf1LzptKqi5SYD8fn9y/3mXNxHPYQrhaZ0c2FX/645MPJvbg+n6QjrB0G
 KFJnFTE9VOTya85pBG2/SVtI/wPw8H1qDljlSdnE35nHiKoYmPsKIV4COiIKJBIXEoWo
 PZOYKV6ckpWK/BTdTlaP7Tj/9OjU3qUqWlOT+6AgPW3bwqeLDZNtSMBQWw05onYpYHKA
 QpdMwTLZ1ldPVSKSjp+65Wei5oRYn2rhZ5G3E0prGd+wiX1N0/YP6DS5evEdHdtXdVmj
 JhXw==
X-Gm-Message-State: AHQUAubFeMv4ddoq1FMkRpgjzhjXH0Ycvk8MJWFrjWNluTIN5IfYGN7h
 x4/mg8LCR2ZWKi0m/qH7Y/0uYWJsjrMrjRxMN0kgAA==
X-Google-Smtp-Source: AHgI3IYrEmg2If4NPwSfHdH4I1lm2Zlkl+BJevpc/7YAbBc6sUtWIXKbJP/4ELD+BVSKvUvUCRELR77kfTprEiODvXY=
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr10708709wme.16.1549616583718; 
 Fri, 08 Feb 2019 01:03:03 -0800 (PST)
MIME-Version: 1.0
References: <4b647c0d-86de-fed3-aca6-d248b9aff762@wdc.com>
 <20190208083206.GA4699@infradead.org>
In-Reply-To: <20190208083206.GA4699@infradead.org>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Feb 2019 14:32:51 +0530
Message-ID: <CAAhSdy3GZHn9k7VvcUkM4s2SpU7SjtW3HmWcHVD342arWHYZLw@mail.gmail.com>
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
To: Christoph Hellwig <hch@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_010306_380993_9EB7AE61 
X-CRM114-Status: GOOD (  13.91  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>, Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 8, 2019 at 2:02 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Feb 07, 2019 at 10:08:14PM -0800, Atish Patra wrote:
> > If you are building a larger kernel image, it may not boot using BBL after
> > 5.0-rc2. It works fine with OpenSBI though.
> >
> > Here is the reasoning in case anybody else is facing the same issue.
> >
> > The following patch was added 5.0-rc2 which helps reduce the flat image size
> > for Linux kernel.
> >
> > "22e6a2e1 RISC-V: Make BSS section as the last section in vmlinux.lds.S"
> >
> > As the BSS section is moved to the end of the ELF, flat image will not
> > include it. As BBL copies the DTB at the next 2MB page boundary, BSS
> > section may overlap with DTB address. Kernel clears BSS section during early
> > boot which may clear the DTB as well leading to a boot failure.
>
> Breaking everyones (qemu) setups that we only got working two release
> ago is really annoying.  I'd suggest reverting the commit for now, or
> at least making it an optional config option.

It is a bug in BBL because it is not keeping sufficient gap between
Linux kernel end and DTB. The change pointed by Atish actually
reduced flat kernel binary size by almost 1MB.

Rather than:
1. First revert in Linux
2. Fix in BBL
3. Bring back in Linux

I would suggest just do:
1. Fix in BBL

Here's my BBL pull request:
https://github.com/riscv/riscv-pk/pull/144

Regards,
Anup

>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
