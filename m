Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE83CC4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1sojF6ywBysBzFfNisrw27a0Ltwh1s6LHExBdrcx/4=; b=vNYixuLPxxt4Fu
	knH6ErepHhOuS7m02SN9Y+5Tp7CuGTYuj0G8P7mEUqdkviKDQ88BhJ9MKSGK3h2AYGUpB7KviwVmA
	yHZGC3YnWlIb+QBVXBpn6hPJSI1epe80NiVFftF1InUfUOz3y7P/t6XTFEyjxEVqFfpCrD9K4eVgU
	kc/1ADOgOTOXy8ph8p8TY3YWwO4J+gEFuExB5SIJsCN1VWIlQoUANtnsZe5YqFwgPY1vmrKI81M46
	H8dhQuxPrWs2fhq8b0G1VLwwpOz6uHA5Y0KNv1zK6Qy+4NRczYeeVSD8G9O/UZ1T4S6ECqeSXP/d8
	AJj4ahNulAuZ0zePks8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3EyY-000000023vV-0fgN;
	Sat, 04 May 2024 12:58:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3EyV-000000023uJ-15jg
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 12:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BFB560AF4
	for <linux-riscv@lists.infradead.org>; Sat,  4 May 2024 12:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D0EC4AF19
	for <linux-riscv@lists.infradead.org>; Sat,  4 May 2024 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714827526;
	bh=hXNgSkWwV5LZLhpVWGiACGemV4ufWhJzafZAUIlL/Ow=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XY5D3DCFrGDofD4I75mYiI07dMFEL4RGn44HFWdUfc0ryl9FZFN8BRFb0omeeKveY
	 DhJU6AWBxpP1gwd0ELWjjQQke4D3P+HhNaakmlRRxmdCnJKqxaeOnjNR3XQAWOPUA5
	 olRTI79+5ikFY0XkGz77Z+YVmBhP42Kp3EOS8LHyqkyUKoBT2glb2N9F8g+5fzoh7+
	 NQT+lWRjctX/Ffzsxg70Awni0kfibrogmW0BC0bM3Cqhs+YgLtU3w9VLFOmyWTM1Lq
	 c56xZqPLDe3IvqUWwp+RyHMBGoSAoGA1axgq7ImuRnrOLaafbd2bwdUAvWB6ah5t+p
	 fN/CvDO5Tevow==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-51f29e80800so544931e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 04 May 2024 05:58:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YypJgPQBm9jFD3s8ENhAFlKhTXB7EZZB0ay5M/ZdYO1Fpx4EvZE
	vQZnSDf7s75lQ/Pi/uoaT72vvMyvs90lrzZNKvwkeSH0GTkchsB+coVIUnVqU8LQAAUaPQDBekb
	K1LVhdTcN+d09vMBRvjhGQWW2zFU=
X-Google-Smtp-Source: AGHT+IFq7LW2EIDcLPPbgiqTYqA0fmtOzfyu2rvhKZGIplFMx7KFWO8jYCsN+xvmxPJWu7JvdXCHRan6u12lYo8HZ5g=
X-Received: by 2002:a05:6512:34c9:b0:51d:5f0b:816f with SMTP id
 w9-20020a05651234c900b0051d5f0b816fmr3281626lfr.15.1714827524974; Sat, 04 May
 2024 05:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com> <20240502111613.1380453-4-emil.renner.berthing@canonical.com>
In-Reply-To: <20240502111613.1380453-4-emil.renner.berthing@canonical.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 4 May 2024 21:58:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbseQCgjAUDemNoo9zPd_iSb+4Gz9TaW2YkOKcp3CSEQ@mail.gmail.com>
Message-ID: <CAK7LNATbseQCgjAUDemNoo9zPd_iSb+4Gz9TaW2YkOKcp3CSEQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] kbuild: buildtar: install riscv compressed images
 as vmlinuz
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Terrell <terrelln@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_055847_361897_2998701B 
X-CRM114-Status: GOOD (  11.66  )
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

T24gVGh1LCBNYXkgMiwgMjAyNCBhdCA4OjE24oCvUE0gRW1pbCBSZW5uZXIgQmVydGhpbmcKPGVt
aWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+Cj4gVXNlIHRoZSBLQlVJ
TERfSU1BR0UgdmFyaWFibGUgdG8gZGV0ZXJtaW5lIHRoZSByaWdodCBrZXJuZWwgaW1hZ2UgdG8K
PiBpbnN0YWxsIGFuZCBpbnN0YWxsIGNvbXByZXNzZWQgaW1hZ2VzIHRvIC9ib290L3ZtbGludXot
JHZlcnNpb24gbGlrZSB0aGUKPiAnbWFrZSBpbnN0YWxsJyB0YXJnZXQgYWxyZWFkeSBkb2VzLgo+
Cj4gU2lnbmVkLW9mZi1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRo
aW5nQGNhbm9uaWNhbC5jb20+Cj4gLS0tCj4gVGhpcyBwYXRjaCBkZXBlbmRzIG9uIE1hc2FoaXJv
J3MgcGF0Y2ggYXQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNDE0MTc0MTM5LjMw
MDExNzUtMS1tYXNhaGlyb3lAa2VybmVsLm9yZwoKVGhhbmsgeW91IGZvciBmaXhpbmcgdGhlIGlz
c3VlIGZvciByaXNjdi4KT25seSB0aGUgcXVlc3Rpb24gSSBoYXZlIGlzIGhvdyB0aGlzIHBhdGNo
IHNlcmllcyBnZXRzIGluLgpJZiBpdCB3YWl0cyBmb3IgdGhlIG5leHQgZGV2ZWxvcG1lbnQgY3lj
bGUsIGl0IHdpbGwgYmUKY2xlYW5seSBhcHBsaWNhYmxlLgoKQW55d2F5LAoKQWNrZWQtYnk6IE1h
c2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+CgoKCgotLSAKQmVzdCBSZWdhcmRz
Ck1hc2FoaXJvIFlhbWFkYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
