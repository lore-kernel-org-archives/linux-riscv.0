Return-Path: <SRS0=yTIg=5V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87460C2BA17
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2020 14:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D4CF20672
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2020 14:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N27bJgIg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5AZ/Rsu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D4CF20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SK0gM5FiI9XuUvcTFvtmQjbWZBJJQIOo8chrmozcPoE=; b=N27bJgIg2HElZRUhgfumm+uAZ
	JGHzxL4oXNXXHqrEVvFI+AQMbvsZIgoRwkfvfzTnlZe8uZRqZ5ryN1TTxbQ39YQTCBHRg4l2sAKHG
	wSbH/x4rLSuQQX3FJmanv8bL9Yweq5KxRJe5PxmS3OBDUxLdCeZx133rYwmQu3ZOjP904I1o4IFDH
	zyFJJhajKmQxr63iiXFYNKtQ1pLh3dRVlUyI/YUFucZYuCVHTUd5P4z3bj95JK9WxeoUyoq29xizy
	RjJIA4EuLw+1ThSwKZnnMHKUDHjoO3GAGqrBXtgCa4W0wMDCYOSbZ2iKIJaIv9vusj9ITi2jkSxlg
	V1Zokracw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jL6Oh-00049F-3V; Sun, 05 Apr 2020 14:37:15 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jL6Oe-00048A-Ir
 for linux-riscv@lists.infradead.org; Sun, 05 Apr 2020 14:37:13 +0000
Received: by mail-yb1-xb44.google.com with SMTP id h205so7281241ybg.6
 for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2020 07:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SK0gM5FiI9XuUvcTFvtmQjbWZBJJQIOo8chrmozcPoE=;
 b=j5AZ/RsuWdKjZog+IPmSJ8xEKc+kCYPKGASqxpoZiRUSDzIipgtVU4HSjrOEjHCSQF
 bgM7QXS1VIZEd9ZtmvdezVLiobKFngS8stMwtzgr2LLTuxX9W5N8rgFRJpfwM4zHwYHp
 1qMgpUyYttbidGObst6ryCYUavhxDltWQElPE4M9R9CdtA7C4Q+iOeDsmZGomjz87fTm
 BQz4meXv5ahOAwDFftNU3JwUqSEMbdvm4Rwl4tzCTZ9KIVHb8Pfw1ACkZToIuzfdJBGm
 cQh4RCx9EyXmmk6n+30X1I08dQPxvdSZNiqFd4CoUVfTi5+9JKLx7ygRhRBpWsGZ4yVI
 /KgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SK0gM5FiI9XuUvcTFvtmQjbWZBJJQIOo8chrmozcPoE=;
 b=f2pfH687JYXeAHSd8+1bIF4pI5Qi9lJiNe3fvVEuGAhn/pFfctn4/0cJNvqJ2dPndm
 588Q3i9ojcbrWuIc8fnlxvIjmzPmL/CDsSLytjmfpjqEHZl5VaKS5LbW5lLNSZiwjrXF
 NjEql1+bVfyMnp9V6TuilSqxNKotKWxWYwLB0UITumanHoH4jadf9Q8iTV1roa9lpYwR
 7B/svl+2wN47U4+7tlr6GG1u/m7Ne6+8RH8UGdlcLdOz/bYpQAoCWL7mnLwUwYlPp2r9
 Wou1DgkTN+/fU3/w+5duH2q53hGTRYLZwZFqGfAznAfJUbCXtlHyZGgz1GAz1jxOygkc
 752Q==
X-Gm-Message-State: AGi0PuaiphiOTFdYvjmKI5VE1WrOsyqs+EzOshH8vi0GbeFP3JRehHkn
 z4w2BSUMgfrHnflDDOGy1XATQwn22IW7dBffyGC4Zg==
X-Google-Smtp-Source: APiQypIXLNvikhWh1JwSWqmiAj/CdMw3jmv/ihkLr5mX0EIzMKlQDZeFeXPoudR2shtZzU/LpUwGxwkMhW1FBSIMzR0=
X-Received: by 2002:a25:e694:: with SMTP id
 d142mr29195012ybh.490.1586097431973; 
 Sun, 05 Apr 2020 07:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200318011144.91532-1-atish.patra@wdc.com>
 <20200318011144.91532-4-atish.patra@wdc.com>
In-Reply-To: <20200318011144.91532-4-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 5 Apr 2020 22:37:00 +0800
Message-ID: <CAEUhbmWxFR3VX7BkJt6Nc1t-QF2Q+GnXH0_B8QEbgTADcy7+RA@mail.gmail.com>
Subject: Re: [PATCH v11 03/11] RISC-V: Add SBI v0.2 extension definitions
To: Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_073712_619131_04D96B5F 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Vincent Chen <vincent.chen@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mao Han <han_mao@c-sky.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2020 at 9:11 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Few v0.1 SBI calls are being replaced by new SBI calls that follows
> v0.2 calling convention.
>
> This patch just defines these new extensions.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/include/asm/sbi.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

