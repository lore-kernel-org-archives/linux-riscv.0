Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580CDC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rbk3E20hRTikaFgwa92IeL66TP9yHWXPIfitQ7EF8E=; b=er/5lbAbFMVzX5
	WYk8i/BmqoWmWWqJG/lK/pd6tSrdgbH3BNYbIazEIB4RJRuPMxY+oyVZtGpBftqHq+ZXrmCWBmegH
	AdZge35ZZ2Efr/G68yZU6066CxHKYcdnwvwhD34SjwDjsuS72/1BtuLuxlPusUPZb4EKNMJe3GM72
	zqcFW4w25E4OGo4/cFvr1LVdBqRjEWBxNkHnDWYUwMmPR8pObHWZNNSUDsshrioi2Puu8eYiz5A1E
	igQrec9U5jpnDUlNZ3Q/rpdmZ4S89/t+ZQ/IsdHORDEDSFaqY2hJZ8vATSsyA0czOmQWT2zj0bOwi
	0v5ERK2BwcwS72XcEbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBcmA-0000000FidJ-394r;
	Mon, 27 May 2024 16:00:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBcm8-0000000Fibv-0UU5
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 16:00:41 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42011507a54so32620465e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716825637; x=1717430437; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GnnpD0FzpzbYfq1ngxZSbacY0kBYXWsANl4BUlAOofU=;
        b=BDU61mdnVWcTGHH9z/e1Unsf1m7jLfTe1QF6m2sNELpSHoQqQoQ2HJAR6U87dt8DpP
         e2+eBRfO6MtXMa4rvRw3IGLKzCUI3km6j+pwKX5wujjvXUVGLZyizA1NMOk0fp12xUNL
         ZYX0KNW2Do53HZBhmoEm/QE0MTII4eBQgn4NkYKNMsoBj+aJ1wFrDX1lweIKtESOjw9k
         mSf778q+jz1cGfFDmKoaVudm8QXfN/NzS7oi8AXOQ9g9fdt9iTCBqX5aYPNBD2731bP5
         lTgDycgLXw3dYxEFRQaa4buYtigYIbSDFCp1gPuNAGcBr+B0dmB4kzaVHklHfcx0BUdF
         fhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716825637; x=1717430437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnnpD0FzpzbYfq1ngxZSbacY0kBYXWsANl4BUlAOofU=;
        b=RK/Ny5cyWnP7HxvdVzJ+0OjWxaV08hoZn5fIk5b24aJ78ldhPbUG4Jhu+FmZKOytZk
         rGo99aHM609zlOvmSuUCLgbr0TYIbyR9nQklcFW6WOTJTwr2zeyylORA5QAGGtQuonL3
         ouLdYddfOuHACgAbtfip+1qbYungbxRHVlnI01Roiho/8pfCBzLpJbAXRWjG0MeqUPP1
         uq9D0iNADxXi41/EBd7T0085/sKzl89wdYFlLJ0fhg/C1j4bCUSr5WuWTIm6pmJLzkLz
         QoTBcdojahTUoVH9UujQ6vSY7jVCu2oYNumwNnFBhs19atRnvoIkso1OQtl8nQ6WUfjh
         CgiA==
X-Forwarded-Encrypted: i=1; AJvYcCW3sKvUy/ayF/2inIv2BQvw+T4h7KPMt4OTOJS3IdS1EVuwGizRpqUCbM6xrjfeYfyqjPrIL8+y72lsCw3eyzgy1Lq5OTejFcrX9lIxonZN
X-Gm-Message-State: AOJu0YzhlhlE6O/4a3Nh/EbyiKIIa6Rg7FyBCTRqglj6UMonG1xJ1xq4
	GgU2aHwJxA0auuY9KnbAF3AMSfAwQqT+x1KULbHdb26VR/9nILXv
X-Google-Smtp-Source: AGHT+IGtO7+X98RuvpMG2dActz0xWJmVguWHzph/jBeY6LMcG/4HZrsbQNDsc+iimhUZE7+DFXGchw==
X-Received: by 2002:a05:600c:450a:b0:41a:8035:af77 with SMTP id 5b1f17b1804b1-421015c7259mr107577395e9.12.1716825636675;
        Mon, 27 May 2024 09:00:36 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089667fbsm113219105e9.9.2024.05.27.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 09:00:36 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Mon, 27 May 2024 18:00:34 +0200
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH -fixes] bpf: resolve_btfids: Fix integer overflow when
 calling elf_update()
Message-ID: <ZlSuIu1aFLzAiH_1@krava>
References: <20240527153137.271933-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240527153137.271933-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_090040_177293_0BBA92F5 
X-CRM114-Status: GOOD (  18.60  )
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

On Mon, May 27, 2024 at 05:31:37PM +0200, Alexandre Ghiti wrote:
> The following error was encoutered in [1]:
> 
> FAILED elf_update(WRITE): no error

hi,
this fix got already in, check this patch:
  https://patchwork.kernel.org/project/netdevbpf/patch/20240514070931.199694-1-friedrich.vock@gmx.de/

thanks,
jirka

> 
> elf_update() returns the total size of the file which here happens to be
> a ~2.5GB vmlinux file: this size overflows the integer used to hold the
> return value of elf_update() and is then interpreted as being negative.
> 
> So fix this by using the correct type expected by elf_update() which is
> off_t.
> 
> Fixes: fbbb68de80a4 ("bpf: Add resolve_btfids tool to resolve BTF IDs in ELF object")
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218887 [1]
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  tools/bpf/resolve_btfids/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/bpf/resolve_btfids/main.c b/tools/bpf/resolve_btfids/main.c
> index d9520cb826b3..af393c7dee1f 100644
> --- a/tools/bpf/resolve_btfids/main.c
> +++ b/tools/bpf/resolve_btfids/main.c
> @@ -728,7 +728,7 @@ static int sets_patch(struct object *obj)
>  
>  static int symbols_patch(struct object *obj)
>  {
> -	int err;
> +	off_t err;
>  
>  	if (__symbols_patch(obj, &obj->structs)  ||
>  	    __symbols_patch(obj, &obj->unions)   ||
> -- 
> 2.39.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
