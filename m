Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B69EEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 20:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osK/oXLDeu4pZDYAjREeN55qPUFEhbYlRGAFJTOFtuM=; b=M3fowSNEbKatr4
	9glrIcBUJuxfOeq/l6qkPu1eKZMxTGVsLEkGvjCJO85POhpAKdv3fnr4uuginBgGJ740inU61KkZe
	mrXCL1nizcZq0FZ69ReR0Kse+ea6E66wxXpV2+7NpOEg7Xn1+bDWfo0r7ix0vhLYugidN99186NoY
	qZuoV/13fscT1ecS6xVjb+R6x8B/32J753x0b4CTFLeOxTaRAoWQ8qLfo/SMzAT2hx9BqsLlR48dL
	X/8tlLMk2OkS6SPKZ3hwGhVPrd5IdaPCP6E0MA58jVNM1j5Nf6dA4vqFbSJmOUAcvoPySPdehLE8Q
	Uuqvfbs/oV5XvOXWoaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH9Lj-00H2uF-1K;
	Wed, 05 Jul 2023 20:43:43 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH9Lg-00H2sw-0D
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 20:43:41 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-76758b855edso57733985a.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688589818; x=1691181818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BLtlZez9GAkHzasHFvmV0dDR+vDOeVbGvtxiizQEwv4=;
        b=qoJ/WcInnMvxpe/7GYFg2GXpLKxlltJ2gqvaiqY44B6DdIWAU+YP7JMLutJNgP2G0p
         PS8eidSRJn3Fl9ZhTpgMUdMGP9jXV/2myeCTFXsR1jOrQlsxSti0P/bFqLgGGAnLNjnm
         Y851GXtefxphylLWbgQlxgBzgZhgWRyCqfiSDetpCtO/Xi0C543Cw6dwegH6QRbcXoUK
         RcSYsRYqN8niT0QAh6V7Uc6lLPp1u39bDKH1+LKlV2xKlfXmkeXr8NFZY+UGFtYvuWAR
         xHsfrwwatncC14sspoLrcoiGsd+1VNKlXU7OakZirS5BPjzbW4TH/OzYlR1bQONPJgx1
         IimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688589818; x=1691181818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLtlZez9GAkHzasHFvmV0dDR+vDOeVbGvtxiizQEwv4=;
        b=Qzdf+3tSA6i+/xtCJGxUTIi/He+gaIPL817RI+F2aVSefwlDnhKI7zohrbKesxq86B
         ypHzTvL/0x7LEUB6BuEwx4e5WSh5AXyei556/nKArh21GrIkeqwiVL9MmYU2Zug1cZ5y
         F7WKQHpmx6AfQ5gu2TT6s7dXmkJki3DkPPjWcPdbzr8TbCEhAKEH0cCBatge4OrygYrm
         moLCdJUs8lyL/eLv7Z+rlkLGTLJmM0od7a+SR7tAcM7OJr0ZHevtKUK6M48hDevvUYYw
         GjY/XcCali+AX0efjtJU7ArZhvFDRu1Eq2tv1p+swMvMwm2/L21O/AeLeix9gLMVzaCt
         Riog==
X-Gm-Message-State: ABy/qLYW9FC3P7mK5jiKHAfNvpOqIom91y1mNDOhsTbnB0smMJCfuHKK
	kx0PSwKD3TLcLNOfYEBlbgv7+4uDezvjTlBmoVIXrQ==
X-Google-Smtp-Source: APBJJlHbB9as3fe+0u2+Ip6pMscKC0JFWdREHMoggTYXzbM688weDbz0++Qq4UE/yyF05PLEILCR1aFPSluIC8MNkps=
X-Received: by 2002:a05:620a:29d2:b0:763:bac8:39c4 with SMTP id
 s18-20020a05620a29d200b00763bac839c4mr4044453qkp.18.1688589817815; Wed, 05
 Jul 2023 13:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com>
 <20230629234244.1752366-14-samitolvanen@google.com> <20230630-rake-clubbed-bba8a9c27219@spud>
In-Reply-To: <20230630-rake-clubbed-bba8a9c27219@spud>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 5 Jul 2023 13:43:01 -0700
Message-ID: <CABCJKufa=TpydWsCY5QotC9a+hUHUwkpfMsC07BMwv6-VuzdCA@mail.gmail.com>
Subject: Re: [PATCH 6/6] riscv: Allow CONFIG_CFI_CLANG to be selected
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_134340_100298_19A59DA4 
X-CRM114-Status: GOOD (  14.58  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgMTI6MDjigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMTE6NDI6NTFQTSAr
MDAwMCwgU2FtaSBUb2x2YW5lbiB3cm90ZToKPiA+IFNlbGVjdCBBUkNIX1NVUFBPUlRTX0NGSV9D
TEFORyB0byBhbGxvdyBDRklfQ0xBTkcgdG8gYmUgc2VsZWN0ZWQKPiA+IG9uIHJpc2N2Lgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2YW5lbkBnb29nbGUuY29t
Pgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9LY29uZmlnIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZp
ZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gaW5kZXggMjBhNDA5MjcxNzVlLi4yNjk5ZTFmOGZl
MzMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvS2NvbmZpZwo+ID4gQEAgLTQ0LDYgKzQ0LDcgQEAgY29uZmlnIFJJU0NWCj4gPiAgICAgICBz
ZWxlY3QgQVJDSF9TVVBQT1JUU19ERUJVR19QQUdFQUxMT0MgaWYgTU1VCj4gPiAgICAgICBzZWxl
Y3QgQVJDSF9TVVBQT1JUU19IVUdFVExCRlMgaWYgTU1VCj4gPiAgICAgICBzZWxlY3QgQVJDSF9T
VVBQT1JUU19QQUdFX1RBQkxFX0NIRUNLIGlmIE1NVQo+ID4gKyAgICAgc2VsZWN0IEFSQ0hfU1VQ
UE9SVFNfQ0ZJX0NMQU5HCj4KPiBQbGVhc2UgYWRkIG5ldyBlbnRyaWVzIGluIGFscGhhbnVtZXJp
Y2FsIG9yZGVyLCB0aGFua3MuCgpTdXJlLCBJJ2xsIGZpeCB0aGUgb3JkZXIgaW4gdjIuIFRoYW5r
cyBmb3IgdGFraW5nIGEgbG9vayEKClNhbWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
