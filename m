Return-Path: <SRS0=0+L8=4P=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D235C3F2C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2020 23:34:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E87D2469C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2020 23:34:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YAyScMkU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="T5+uCPzh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E87D2469C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=faeXfJlzS5GQM7uC+KFYtFDnAxxuzD98DdPgHoNTSmM=; b=YAyScMkUTalg/G8t71LWSi/yS
	NiYpeGJbJsyd89FHCZ/dleeCYAUpS8BFDBpnLf+CAqrtZN+x4oA9t9A7OErDTpjPYW9M9KDwWJob9
	KN4oEt6LGKMGSsta9/9gFanoDvKQYNfBc/VzXtDbUiAtWNccmNjdg5i2lchCgABQ+B/CcqJ9IUCJH
	zPYNHaUSvuQSRVr2Utsy1A6NEctwKAqp5smLbBilTpdTfKSBK0PsIlfHp3RPGzYu7/V361wfN2RBP
	wYm5tdJvpdYSgsV0K2HPGK1250oAvh/wFj1jNI/2GKdTBzZE+um+7bqHu/Unn/tNBCfnFioj1G+Yr
	RaWuUzOGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7SfK-0001YM-9O; Thu, 27 Feb 2020 23:34:02 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7SfH-0001Xq-6O
 for linux-riscv@lists.infradead.org; Thu, 27 Feb 2020 23:34:00 +0000
Received: by mail-pl1-x641.google.com with SMTP id p7so447497pli.5
 for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2020 15:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=faeXfJlzS5GQM7uC+KFYtFDnAxxuzD98DdPgHoNTSmM=;
 b=T5+uCPzhYVZON/vDvsZKKTt/Ww54/o+W7APFIrPf3eNpMdB0q5KpkAGigk/Iu+D2BW
 6J2oMumCrQ8tHI7ilC2taHtFJD8WY9t/QVZOB8Z2VtFhpzsKVKLDid2JdL6DJvI0Sxex
 HTa37TI9XWj9/uxs4GkBYPh8W6jZ/5Aje+QLqGm17COahOEZbjcJTj0iPuOdk+RLIZVm
 MuOnfhtPgn0Q56++tyLYilF00JnRCo5rGXqJXThMqK26wOLspt9SbU+Xw22H/swwlTY8
 WrgEqkgzyJKXLj944RMeL9BVKPi6P4UBK76kQXUfbuyaBdF4+zhl/OadAYzoidlnO0ns
 Y1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=faeXfJlzS5GQM7uC+KFYtFDnAxxuzD98DdPgHoNTSmM=;
 b=k4AW5As0XPFliqS5KgZDUvVZS54P+xNsoq1mPkAI3o3+rsVA6e20nuJZz5DQNvF0IJ
 o2cuoUiK1/zsmW2Yjqw/PG9bcq4H1kypglxrAuG3ZD2dM3n/l8j2OVzRIFedEWQNOgEW
 5gOfAYc9+zItCIy5Gr+YijlOu/l0KFeU5nN0H5RhgvaX0SX8GvHFuyoEFmuR+rTdn1sf
 p/04Tg2aWMn3E/51jb2uYpjkXeeunBDSx8EMxPMQ6qEMbMTlq/v3w2v4jDSa4w+MyTqs
 RgEG12pzcA631vJyp/X8RrAorCGmYdaxd2PLo1kGfp+OYjhseqCAqdetfz0fgS9FWuW0
 aK2w==
X-Gm-Message-State: APjAAAWHli3V5yC0+siEt+0ngFat6Oh7IWp/t7ARATdXuJ48ke8whLsx
 zNK/KlQrbd3m//uA0t3OyBC8fP0IpM8NigbjATYVlQ==
X-Google-Smtp-Source: APXvYqxXeWDxaGq9NlPe9HIn6J/Ifylj3ev0huenDuQNVJd536nBdgCL4aPpU5RvBtM1Z7aVuTxNYjqWH3vClX2THl8=
X-Received: by 2002:a17:902:6948:: with SMTP id
 k8mr1162951plt.223.1582846438094; 
 Thu, 27 Feb 2020 15:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20200227213450.87194-1-palmer@dabbelt.com>
 <20200227213450.87194-4-palmer@dabbelt.com>
 <CAKwvOdn0wuytFTkJRm7u5vGUTWyYnrXdGGXHfoOfg6ndzT+u8g@mail.gmail.com>
In-Reply-To: <CAKwvOdn0wuytFTkJRm7u5vGUTWyYnrXdGGXHfoOfg6ndzT+u8g@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 27 Feb 2020 15:33:47 -0800
Message-ID: <CAKwvOdkbxTeABpnBxhRyGSqxUpDqnfzf-JAiLw0uqB0zq-f6Bw@mail.gmail.com>
Subject: Re: [PATCH 3/3] RISC-V: Stop using LOCAL for the uaccess fixups
To: Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_153359_286316_1A7063FE 
X-CRM114-Status: UNSURE (   6.67  )
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 kernel-team <kernel-team@android.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 27, 2020 at 3:03 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> I also see two usages in:
> arch/riscv/kernel/entry.S
>
> Would you mind fixing those up, too?

Ah, removed by patch 2/3, sorry for reviewing them out of order!
Outstanding question about `.altmacro` though.

-- 
Thanks,
~Nick Desaulniers

