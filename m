Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A7D6C4743C
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 17:20:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55F8B61414
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 17:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55F8B61414
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVxdFYteZhukFBDH5z47xDPVcb4rSetfXywYFD7HKMY=; b=tuybl2EMRajaDX
	EQXBnEHxKDb7HfaHS02h0H4wkpnor1P7+WZMjVGHojJEa0ILZkSibjcy7Q/vMK5uQBqELW+uSAr2N
	UNmerrmRyJNtCXUh9wpwOijQIyHYGxM5t9lHWt/jlSRgHkxbokoiTiJ3Na/cvMpKtvqtgKBfCDmdb
	QIk8UZTAfj8EjMU6d8U7G0o+Axp9rqS6mQD3o262rMWjj7VfMTMtExBjQR+1HBQIUFIysT4b35vGA
	M5XuFPNzUDDg6TcbbZqfWV1zqiYbltyNHTARkOTSfivf8WmapvTYs8Jb2YvU9e14Uxv1I4W4jtUCE
	+sX591Mi83in4djETJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpDUs-00EdXB-3M; Fri, 04 Jun 2021 17:20:38 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpDUb-00EdOx-1v
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 17:20:25 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 440D74A6;
 Fri,  4 Jun 2021 17:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 440D74A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1622827220; bh=x0gZ/+V+J/EpZw6CTyYmGuRUO4eDuSK+FswFXgyN9e0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nTTJ26HkdMTj+/8yEOjRKxUCVOwSiq+xGz4Y8NTDL3TVggfSVCPgj8Rf7ypCWxlFI
 JoLqs8D2I98JascDuPpDCMenjmqiYYZc9tcHmuWuByM6PK+PjtXOnscqX4gbn4fGjX
 7YhHidGyubb7aRymhLGDHuV4yVlktutMPFGfD1We92VSRsdpfQ3enMkfOYn4Q4XzZt
 BQ1I57UqWdOQghTJcb4+KA8L3CKMvW/LSjoeiGMuJVbp94fbA4BMYl/D/rzj5Hiech
 Hrz/zcxr+sMYRqiQ+lP244+5r7cSGoLlXzu8odlm+QXLZz1o9hOGCivECBClvEy6b2
 /zdnCMY328ugA==
From: Jonathan Corbet <corbet@lwn.net>
To: Wan Jiabing <wanjiabing@vivo.com>, Alex Shi <alexs@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Wu XiangCheng
 <bobwxc@email.cn>, Fangrui Song <maskray@google.com>, Bernard Zhao
 <bernard@vivo.com>, Wan Jiabing <wanjiabing@vivo.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
Cc: kael_w@yeah.net
Subject: Re: [PATCH] [v5] docs/zh_CN: add translations in zh_CN/dev-tools/kasan
In-Reply-To: <20210603141127.101689-1-wanjiabing@vivo.com>
References: <20210603141127.101689-1-wanjiabing@vivo.com>
Date: Fri, 04 Jun 2021 11:20:19 -0600
Message-ID: <87r1hhzgvg.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_102021_133245_6BC1CE78 
X-CRM114-Status: GOOD (  10.60  )
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

Wan Jiabing <wanjiabing@vivo.com> writes:

> Add new zh translations
> * zh_CN/dev-tools/kasan.rst
> and link it to zh_CN/dev-tools/index.rst
>
> Reviewed-by: Fangrui Song <maskray@google.com>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
> Changelog:
> v5:
> - Fix some aligns below titles.
> v4:
> - Fix a space missing.
> v3:
> - Fix aligns and inaccurate translation.
> v2:
> - Delete spaces surround with English words.
> ---
>  .../translations/zh_CN/dev-tools/index.rst    |   2 +-
>  .../translations/zh_CN/dev-tools/kasan.rst    | 417 ++++++++++++++++++
>  2 files changed, 418 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/dev-tools/kasan.rst

Applied, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
