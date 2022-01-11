Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8A1C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 07:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90s/0VlwS/aqmlfK8HAjtQVYDYj9Xnr9+hMhX7rxZc4=; b=VJPSwgfxyqTEQl
	vJv6/AEzQFGDjx57nQ7zANJO8pNceYnqcC3IUDPdA9iF53sl4cyADkyjJI1bbLtvXI6AfyVB95t13
	WR/WMydiW7VAoJUkne6+kTkcMgMXv0iheb1QnnT69YAuGekqwpvhENzt/hr2um3CxC88Y5jEjWpHX
	1L6ljemMtH7FPC3G5+2aiyuaLN2+NxONwzv0I744CbVvYpzFJGSdx9AarR0Q1V28VRUAUSit5S2vq
	go1q2oP4oxp5Sk6p/sotTYvDFJW41Wqgo3GzCZyvD/1LQfHqsCxRgT4gNU4B9jf556JSX4JBV/toP
	d166XzKi8YnWFmVxxnMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Bn0-00F91y-9R; Tue, 11 Jan 2022 07:41:54 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Bmx-00F8zI-Gj
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 07:41:52 +0000
Received: by mail-yb1-xb32.google.com with SMTP id v186so35454133ybg.1
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jan 2022 23:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cwHw/NL6DwfU5mZ226xBfOsuZ8vgnjHLoJ6gB+S8aJo=;
 b=cXFRNvZwDo9T30RSDAWPp6X2+CkF1YM0fbtS6weAJ5lsPP3IZsJh0CAe4YExQd5QRI
 Gv7y4ufZPI5ZkiMTnZRhcYiEYmiDWD/yIGDAcRP/FU0+2Jw6BbuYz7UcbnrAS+25GvPm
 NC9Rfj/eOB8ZUPjk6O+SbMDOt8W3bASCt0v2K53ep+l7RD6Roh+RBYRU7lo5ZBWp2rVB
 fUZQTG3dvwZ43M2ox9EczRweA7SWhFq+LyCPfhQCJdqaayT2A4rtNBKZYBZIfCD6CWo7
 yF6iJOLhx0FV8AVecHISfnJK8n9mFJl3zLpN/5lSeVHnWeAegfH8YDDtPw6++0UpIISd
 UD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cwHw/NL6DwfU5mZ226xBfOsuZ8vgnjHLoJ6gB+S8aJo=;
 b=QLBCDNLbxayT9sGKT0JK8sx58jGCdvGUT1qoWbY5TwxxS96PT9Iedit+zOjyq/6KBV
 wHgYLC43ULVxTW1bckfQ9ZyWLcyDRRm1ZHJqEGL96kKY86WITDVgQWncwm4hEQQUAhkD
 unK8HEDm61YUXbwYPseiW7S51bO/mEvi3poplbGlTrANh4FYJeoIUm/tvLoSdFIPdXYj
 Gsy6sv+VYW+Xs3DZ7fyy6HiGLD9kyGuO2AY9PvAQJkT4zLmcY4FS1f7LAn1TPCb1UiBW
 PYOmx/7xRf7XclORD77uO7qPBVTRx3R7n3KvgUf4JZTfAm12BbqHSRZDheC0R8n1A+8l
 8ipw==
X-Gm-Message-State: AOAM5322mMoFbX38zQTpk1zRUqTxbWdbOFgbkrwokhKB2pjKuX0yAVoH
 lrvQlQSA7asJgdimyHSyn1WjZmv/IiWHGNWyolA=
X-Google-Smtp-Source: ABdhPJwHVKVQTxGeZWp5IVRcmqYFkdtu+KkoCuoD9z0nS8WwBjHqS7czCmxxy96YfHNRk1qFNslEXswNEy4yTTz5v4o=
X-Received: by 2002:a25:287:: with SMTP id 129mr4433689ybc.670.1641886910010; 
 Mon, 10 Jan 2022 23:41:50 -0800 (PST)
MIME-Version: 1.0
References: <20211208192607.660787-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20211208192607.660787-1-ben.dooks@codethink.co.uk>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 11 Jan 2022 15:41:38 +0800
Message-ID: <CAEUhbmX6gh9KzLLWquJ9PKFiOg+Vehv_DZL27WpSEVTE-L_wRw@mail.gmail.com>
Subject: Re: [PATCH] riscv: add correct as-options for assembly in modules
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_234151_588850_492C809A 
X-CRM114-Status: GOOD (  15.30  )
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

On Thu, Dec 9, 2021 at 3:26 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> When trying to load modules built for riscv which include assembly
> the kernel loader errors with "unexpected relocation type 'R_RISCV_ALIGN'"
> due to R_RISCV_ALIGN relocations being generated by the assembler.
>
> In commit 7a8e7da42250138 ("RISC-V: Fixes to module loading") the
> CFLAGS have -mno-relax added. This however does not get applied to
> KBUILD_AFLAGS_MODULE so when a module builds a .S file, the -mno-relax
> is not passed and the above error is seen. Fix it by adding the flags
> '-Wa,-mno-relax' to KBUILD_AFLAGS_MODULE.
>
> This may have been fixed in gcc, in:
>  https://github.com/gcc-mirror/gcc/commit/3b0a7d624e64eeb81e4d5e8c62c46d86ef521857
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> --
> Changes since v1:
> - added Bin Meng's review of the original patch

Looks like you forgot to include the RB tag? :)

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

> ---
>  arch/riscv/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
