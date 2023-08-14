Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A2EEB64DD
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 20:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fMjahpCqZxMBNBGLBDfyK6/4ECBnZ5eYT/Yz9tFpKM=; b=bvcUSXiBDA3LUY
	ad/9xt8C5qewsg+etPoQ/ZC0OZ/7aqYPd7pL5+VtxldyunZL12r4Akubdksrmw++vNL2CCQa3vx7i
	ktdercKgwhHmOOLxfm1dOS9uVUFpQuBPGvLBgmjcd9bvc15d3qDGptSXoMDtXPnUavTAy2YBAj3FA
	qGv9Aaian4QxYuKF/zm35iiyTLnqKIWAJ4e9nYJoTKDwNI2TXoZXq2mtbBIFkoArrUCVrWz0+q1jR
	MdHliEvPjcdHXCFe2crC9YjzrgGRFktvflcGfReLjhBSkIsTBELua60uEEIUBcdyjQhmIhXpJWHwK
	PpYy1LxsXNaq4INIS/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVe1y-000HQj-0u;
	Mon, 14 Aug 2023 20:19:14 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVe1u-000HQ1-2c
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 20:19:12 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-447b64b0555so1335491137.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Aug 2023 13:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692044347; x=1692649147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7NBKIaudZg5pCYQXSbPQz6qkuoJtThIS+SlVr6T2ss=;
        b=2ggILfUkx+J0GaDwD/w6xQ7NdbZaQign7zCVMSAYwBlsbMHdYcvWTyE+wiwuDmmePV
         6bj/epA9FIr5PNwc4chwEbunFmcsFgL9YTpMtJJKoglfZO5XQgPzZBjplAQdcaU27ghN
         OSAcUZLdRhvL7lJ18RDzVd58oCk45dvfuTbLQveUpvxOILVM7V44UfBsEDgDYG+poAyL
         aeJ1qOaC7QqVnk/zuFb0t7R8gUJ63o5wt7qvNRHkhgOFVgikTyu7QLysHU6fGHqdoXHU
         pnIZsvEx/ZJwdwuFKUgaFHcBeeTPEOhb2n2qfj69XijWr/RDxo/LGgy3bElIpmevDSUC
         Ruiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692044347; x=1692649147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z7NBKIaudZg5pCYQXSbPQz6qkuoJtThIS+SlVr6T2ss=;
        b=BwtEp8EQaFlTLIfjXRxyWcotxQp3AgXISuft9f0OeTAsIajrSImPbaTJdqFWvVeOxx
         LF47KioIMbGiY9ufS8MdrLRUPJ1WmJi1LXkEoshkWvDTXoa7XZh9ZXngbJBOZPLYLZmA
         QdOHtiRQPTi5NjulV/lRsCa6Q75FdALmCSU03woylvrFt9m9M5XI52D0vBO2+AV1Lq4C
         f0zHdFIGzZkJx063mnm70z+PdIwjkJy9ww8Gw5vQ7d4RBD3Ll+OgqWyAsLWZ60Qs0VKj
         HTdduQ9KOLcNoio9YIpgDhiPj2mBOFvFqVuOm2Iia4Ij8+co506v2jNW3a7MSRqdEabK
         UC6A==
X-Gm-Message-State: AOJu0Ywp8kypfq8J9+VG3TU+V65rS5vwp0ZJxSDdtDXILPe0dn7qA4kF
	dDqxzaDjJGQl4YbXS2dSU3LW2sLiw/d81Z/4XcJsLw==
X-Google-Smtp-Source: AGHT+IHF0E09EnWMkn/qFpKOn1LBeu/xmPCIZS3ihtJBPqiw208Hlg8gySJGMAbdcb4rzGK3mlcno6Gp80oreT0TkNA=
X-Received: by 2002:a05:6102:1344:b0:443:5927:d415 with SMTP id
 j4-20020a056102134400b004435927d415mr7180453vsl.10.1692044346673; Mon, 14 Aug
 2023 13:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230811233556.97161-7-samitolvanen@google.com>
 <20230814175928.GA1028706@dev-arch.thelio-3990X> <202308141131.6B90A4205@keescook>
 <CABCJKueV8N4pDBFmw0aWn3wqeyjWUVTGotiC-gjMohJtw=_97Q@mail.gmail.com>
In-Reply-To: <CABCJKueV8N4pDBFmw0aWn3wqeyjWUVTGotiC-gjMohJtw=_97Q@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Aug 2023 13:18:30 -0700
Message-ID: <CABCJKue93aSknVnr8Mc1uaw5D5vk7xaPxaGp8JMqvvjqqHY3jQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] riscv: SCS support
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_131910_850461_4DD7E432 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBBdWcgMTQsIDIwMjMgYXQgMTE6NTfigK9BTSBTYW1pIFRvbHZhbmVuIDxzYW1pdG9s
dmFuZW5AZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gTG9va3MgbGlrZSBfX2J1aWx0aW5fZnJhbWVfYWRk
cmVzcyBiZWhhdmVzIGRpZmZlcmVudGx5IG9uIFJJU0MtVi4KPiBBZnRlciBzdGFyaW5nIGF0IHRo
ZSBkaXNhc3NlbWJseSBhIGJpdCwgdXNpbmcKPiBfX2J1aWx0aW5fZnJhbWVfYWRkcmVzcygwKSAt
IDEgaW5zdGVhZCBvZiArIDEgc2VlbXMgdG8geWllbGQgY29ycmVjdAo+IHJlc3VsdHMuCgpFbGxp
b3R0IHdhcyBraW5kIGVub3VnaCB0byBwb2ludCBvdXQgdG8gbWUgb2ZmLWxpc3QgdGhhdCB0aGlz
IGJlaGF2aW9yCmhhcyBiZWVuIGRvY3VtZW50ZWQgaGVyZToKCmh0dHBzOi8vZ2l0aHViLmNvbS9y
aXNjdi1ub24taXNhL3Jpc2N2LWVsZi1wc2FiaS1kb2MvYmxvYi9tYXN0ZXIvcmlzY3YtY2MuYWRv
YyNmcmFtZS1wb2ludGVyLWNvbnZlbnRpb24KCkknbGwgaW5jbHVkZSBhIHBhdGNoIHRvIGZpeCB0
aGUgdGVzdCBvbiBSSVNDLVYgaW4gdGhlIG5leHQgdmVyc2lvbi4KClNhbWkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
