Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D901E9D80D
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 19:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aycaY9lICGbkPqeZmklMOsesSYgcFyda5zZuc9ghiU=; b=3c1xpcZGDNa+BR
	+BJVNO0JsYiSVVgvfU3ad4NkgkYCwEi4Vld2+EMmtREhn6jH47n0sYdJ25K8twEYMRoLgQqtDN6Kc
	I4J8WT79JIYhjN8iA1yYitfCM2S2XXcXXjDv+z4ay24sM/sHGl/KH8aX13MHFq0WPfj+kt0zLqRNb
	81ogQprMHmxDkaHzY+E0w75OI6H2hNQsXjR6yGGqqDbAztQdKk3+nZXixfkI7x6A8fsP3dBKGftA8
	IfN9EdQDUjzf6uZjyAMUjQnwA6MnIle9lW8OSFJ/cphICj/7wRFdIWiZ1BZJ6p7RIC3V2FdjLdijN
	j6lifCBOmgub43grt3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TCe-00000004Qa5-2Pga;
	Sun, 05 Apr 2026 19:32:12 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TCc-00000004QYi-1yVX
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 19:32:11 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2cdf546f956so48649eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 12:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417530; cv=none;
        d=google.com; s=arc-20240605;
        b=hmDV1OECIczb9IUP5oxHyDLsHX5KNlPmQLhRVG58uoJ1T718D65LPhjwtGqyLl975f
         hD2D2Y0bNAGbX5El8OCWREs4OAcxMjZZNoL2q5pU6W8sB1iN89YfWA8fDL3B08NxShQ4
         /7XXCatqMq8xRsBS/UD0P7IhfhHQ7nrXExeSmjR0oZmSBebdaVJTbMSR9c2H2uLICFKG
         aJ1p/ibH/5DSSzLXCT0DAPnLnRwuPn07gg2uLZ57myBV8FD//ID0SeIyJDhvSjbB8xwy
         6TRO/K4tiITyArwC85VpmCmQsCBz8E+46XzZ9b/CmLBAkrqOiOPDp4lsBfILYH6e0o94
         j42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        fh=G/c3Tc6I2sXj44DGZxs3bOMqtgrDr74dP2FpaRwizO0=;
        b=OUt+BjCnEAKehvtueq93oUqkQCo32hSOgYgjMCPDw4NruGE+faRTcyUkwPQUtElV1s
         huJy2icWp0XpNOk3aX3++Un9TIDWo0BOGDdnUuCpWfE2A8eY/fiwW32jVCoDm/dFRSxT
         BUOGJtQ8+JDhgq0uuhU106Wb9yfy9fqjAg5yJOxXAOhjIuQAcQ9Zs+yAB49vmopUx+TL
         nDBLpOI/m+BQNphKpzBW0ZoVEPZO+uMiLHYtwtYhWUXw56MFff2+S5qLt/Wn5l+678mZ
         OpnwH5a5C5LiwLSETIFpMtM7kXoiYWSmwZhhwrjygES10NFkNB4HJOuI4ZX7IdYqb6H+
         dzDQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417530; x=1776022330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=PVw820SPKiAYTYCCfcEp69U6G6+qEm/Tbyhfe41Ai9koGCElKBR2RcA+PRL1NOhPOH
         Byjkn2WEfBKXvMwnmjKaOfLjF0hWkRCXzcHtTfgo7NkFy8Q2X449OZJQJ4Pl1U1wjvLg
         +IHM8U9cZLfWse+oRcRI95Oq3Z0MnuwQLMl2VGcH6zguvDXt7adVTPXNOYuECOr8HO54
         fA3Rt5yJ+NK5SvU+WyR4GNA1NgBE3u9UYWBSDkDc+hksIVAMg6otRr59qLmTRSD3ZQgQ
         wjmvtwdBlBd9K7+tEyxmz38bQypZ3/6L0dmPCWkbVTXBdZWYFF32W7Lub1dnsH1YX5Q/
         IsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417530; x=1776022330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uj4oJAcIVuVW575tTJ/+8h74lmRr+UIi6+RvtopYiMw=;
        b=elX4wxuRiGJDFReoDDQ2w6x+ZjPxZvLWcdEfmZhxWhrypysIFDznqdNbNlhSBsjoU3
         m6zqgzk2nsGyPfwzWrjuz+ty90WExnQl4epNs6syLU0cqxGhw07FGQxk+9XNuAC3Y2m6
         3Vn46XG0Gtr41ehcuJy8nIslP4dA7+xqlLGFzNnYdpu9ClEeTHNc4PNWQcgycOcEBRUJ
         xfWyMkIT5sPrVyuXF5DFySXmUJtNdEVEXVgDO0ykQeOO12ecUM1ESQJQBKBo0DFMVODp
         LNNFshGXFUc8dpcSEVGm6GP4AXJUmSpsThSjsNLXUXl2JUQ0ZcNfgTNRh/4MWiXZaQ91
         GdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7GcRC/TRdcRSYj4SksRa34aA6BlwcMwZGdj+VhEYlk2CpPy+R79oG8KInBtLmyH0GPE9Gj8CF/yHPAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy66ctOa42qt9VsIxutOsXxuIpPOuJuHDLwdOsblBPMoC3vBLqj
	F79o4IBI55KlJ9VadCxeiG6UW+dV+MaXEV9HCUnWVQByLbVY7Js1ZPIKo8XpuS1+Ca7rF1Zx7GP
	ST7IyqcdbR9XCPKqamNiW7jjYWrfSv5s=
X-Gm-Gg: AeBDievgrPRExqX+W+7oD2bO9pwrxZ+T83kG5wyOH54UDrX2ju1j2U+Xhz5tLesv0eJ
	MIP/mXzbKVuV7HIIMYJoKxgGJm5TFCNMeyTauQbrJRkZKEOg+9Lw37IdY29pGKSF7p/V/TyLLat
	f0jPnCkz7JITsJbB+XvwwAtol8ajveBQ/N2SRsRwiNxwIDKI11Lt7hzpjYSR+zj212g3rt7scyV
	7Uq0anrGZDU/5fvqY2r+K+WH+cH75RRxQMLZgR8WdTGdIWt7aarM3gSox4hpbHJ7zXfIC37qiex
	kDXb4uOMp6HG/5xR4HDN4GJqbaFZhFv85XO+lkQbYIOA7QVgD596uEsHWY9Pia0ktve5uJvRvjf
	7B7RbFbFKtmQKxL4MGd9P99w=
X-Received: by 2002:a05:7300:cd86:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2cbfc768bbdmr2210515eec.5.1775417529556; Sun, 05 Apr 2026
 12:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-21-ojeda@kernel.org>
 <177508434460.73816.4231801886718165891.b4-review@b4>
In-Reply-To: <177508434460.73816.4231801886718165891.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:57 +0200
X-Gm-Features: AQROBzDsQvgh2EDKUg3LiGNTUf-8TUQBnEeLR3UEGt8KzpEPnOxtdZC7xsmuU3c
Message-ID: <CANiq72m9bsXZnMJv2w9eszV5DGUG1Cq0NCEUqv60=4Op__Uong@mail.gmail.com>
Subject: Re: [PATCH 20/33] rust: kbuild: remove unneeded old `allow`s for
 generated layout tests
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_123210_515783_D0605E78 
X-CRM114-Status: UNSURE (   7.93  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAxOjAx4oCvQU0gVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJk
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSG93IGFib3V0IG9yZGVyaW5nIHRoaXMsIHRoZSBwcmV2
aW91cyBwYXRjaCwgYW5kIHRoZSBuZXh0IHBhdGNoIGFoZWFkIG9mCj4gdGhlIHZlcnNpb24gYnVt
cCB0byBhdm9pZCB0aGUgbmVlZCB0byBtZW50aW9uIGl0IGhlcmU/CgpUaGF0IGlzIHJlYXNvbmFi
bGUsIHllYWguCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
