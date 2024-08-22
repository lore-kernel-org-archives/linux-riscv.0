Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A9DC5320E
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 08:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BS/D+KXIx4ZJU9sHMiDLyv/1+QTBQd0Ml90icCGZyT8=; b=qX12FevbaLUZw5
	tQ2Sj+g7re1CIYQ7im+Tn7raeHd/vyA8SAB6Z6H6YRfyLWqwKKtpzXF/RGS4LsVTKTSdkNxmFUkOX
	9JhuT8Cf2cSamSSOrj4x1XlAeaaeb0yD7dVgO1PTa//NJKLO+2rCmlorouwbpD+DoxH61y+eSWMZv
	EZQIdx31oqEt856WU7D5s2yQDOJfWrYDxhB4I4P+N8kKVWgmyAKfov5s8ieKd0Hs20CIrRtukQLS7
	4zn+2tZZh2hZFxSaFu4T4o/fxoZFjQ1wXbxSOF8Pvl6EmIU1MO6zTu4U5j58bMpb0QnHqsTnUPZpk
	U8qI49dF6SvPC/AsoPCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3Nw-0000000C6cI-3lew;
	Thu, 22 Aug 2024 08:41:36 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh3M0-0000000C6C8-34es
	for linux-riscv@lists.infradead.org;
	Thu, 22 Aug 2024 08:40:00 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e162df8bab4so558908276.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Aug 2024 01:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724315975; x=1724920775; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/eQ4p2wkfuEw0Nha5S3OKTT7W6j71aVIFBzaGsaDr1A=;
        b=HOhtHuWjsJqMYj/SD+H7ujz7enhEbNLtnvT/wR3Ex9oWvYnZXMl8DbM61njqxP3uir
         Vmc8XiFdF7wIuHIdIzFYL/qg2X6cPsNrXQV3kKBT4X15U+DM318paUmwK1pmXKFA8Nw1
         KCRSF6qE6j2KDtKnxPu7WJtW9Quzhu9SJb7ljDSY+Z5EwkHWYgG6zPjqzfx0eXIX9Vx6
         voWIrcquO+6hIQBbWUSO6Eliv5KHWf2OIupLwvjKJliRSuPeOX9JwHXrhj0zA+zDQj1Z
         DrbrWFkdTSnrXMdEfvVs34Wi04Po97leHViExHT3D5M85L3MosaziEKIy81mfmiZLHt8
         +kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724315975; x=1724920775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/eQ4p2wkfuEw0Nha5S3OKTT7W6j71aVIFBzaGsaDr1A=;
        b=Xo0QOXgla8KuMijd8/L4HU+6kGWFQenHHB/FCfxdGaSt1C7gOAi054p6zQiLUtBHCT
         ++EtoznjGmRId67XrLY7vhzRwd7SB1hmJAzrIW6OWjIxOZPzwY29Wdrnvwu7dRYVY455
         Bso1VaarxV+kwvC+3vjKVTqDYrnTvhrSN+SdC0lF6+v+i3NaaLqdlzFW2MpfreBcJZUj
         ZHdk5K1Xz1uoxIv91TibPgm7aZsKFcVB0yvdVRxeqCQiSMTjmoHnoLtyk07vqa4wW3+y
         S+H8oojzJ50KHUCsiWuDJ6FPG0pzxm4E8KAgy4Ro3j+QJhI8BlPcX78n4hmw4pST741U
         WAbw==
X-Forwarded-Encrypted: i=1; AJvYcCXG/EQqZOBc3TR39LLbIHd7MaY8QMe0lFwvrXO9TMFdPJKTea5vvJjtLfkDRmPGXllbOwHh2V0zsI1A1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqTOZLRWBYtvkw9zTE8OYCjc71Pq4y9/9wcKnOS53DSTvxko8k
	kSO19BWdCAvsxT9DoGXYJpsjEkpcKqglI64P0oRJK4cfjPkTyq3G1YEvLQsZkHeWsmPimM+OXDO
	79i3oLbl7B8mPIQs8H3PRTV7KBrVew69rG7XrjA==
X-Google-Smtp-Source: AGHT+IHkFdJeVV+WqzmMGZrvSF/bGpFOy2vIodVP1TRyAky2+0nTxS+aXkYfl2LkMvbDx6kyhrF2nGcG5PB1NQylZEg=
X-Received: by 2002:a05:6902:2607:b0:e13:c8e7:5bcb with SMTP id
 3f1490d57ef6-e1665555b3emr6002370276.53.1724315974761; Thu, 22 Aug 2024
 01:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240628-dev-andyc-dyn-ftrace-v4-v2-0-1e5f4cb1f049@sifive.com>
 <20240628-dev-andyc-dyn-ftrace-v4-v2-1-1e5f4cb1f049@sifive.com> <877cckadci.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <877cckadci.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 22 Aug 2024 16:39:23 +0800
Message-ID: <CABgGipV9R_=Sy1uJ3YMXzm3S9W=yHWxRD1J=drFaw8-Jesym0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] riscv: ftrace: support fastcc in Clang for WITH_ARGS
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Zong Li <zong.li@sifive.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Evgenii Shatokhin <e.shatokhin@yadro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_013937_030770_E8E2EFC7 
X-CRM114-Status: GOOD (  13.00  )
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

T24gVHVlLCBBdWcgMTMsIDIwMjQgYXQgNzowOeKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3Jp
dGVzOgo+Cj4gPiBTb21lIGNhbGxlci1zYXZlZCByZWdpc3RlcnMgd2hpY2ggYXJlIG5vdCBkZWZp
bmVkIGFzIGZ1bmN0aW9uIGFyZ3VtZW50cwo+ID4gaW4gdGhlIEFCSSBjYW4gc3RpbGwgYmUgcGFz
c2VkIGFzIGFyZ3VtZW50cyB3aGVuIHRoZSBrZXJuZWwgaXMgY29tcGlsZWQKPiA+IHdpdGggQ2xh
bmcuIEFzIGEgcmVzdWx0LCB3ZSBtdXN0IHNhdmUgYW5kIHJlc3RvcmUgdGhvc2UgcmVnaXN0ZXJz
IHRvCj4gPiBwcmV2ZW50IGZ0cmFjZSBmcm9tIGNsb2JiZXJpbmcgdGhlbS4KPiA+Cj4gPiAtIFsx
XTogaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0Q2ODU1OQo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBF
dmdlbmlpIFNoYXRva2hpbiA8ZS5zaGF0b2toaW5AeWFkcm8uY29tPgo+ID4gQ2xvc2VzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi83ZTdjNzkxNC00NDVkLTQyNmQtODlhMC01
OWE5MTk5YzQ1YjFAeWFkcm8uY29tLwo+ID4gQWNrZWQtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxu
YXRoYW5Aa2VybmVsLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1
QHNpZml2ZS5jb20+Cj4KPiBTaG91bGRuJ3QgdGhpcyBiZSBhIHNlcGFyYXRlIGZpeD8gU3RpbGwg
cmVhZGluZyB0aGUgZGV0YWlscywgYnV0IGl0Cj4gc21lbGxzIGxpa2Ugc29tZXRoaW5nIHdoYXQg
c2hvdWxkIGJlIGRpc2FibGVkIHdoZW4gYnVpbGRpbmcgdy8gTExWTSwgbm8/CgpZZXMsIHRoaXMg
aXMgYSBmaXguIE15IGludGVudGlvbiB3YXMgaW5kaWNhdGluZyB0aGUgZGVwZW5kZW5jeS4gU28K
cGVvcGxlIHdvbid0IGhpdCBpbnRvIHRyb3VibGUgdGVzdGluZyBpdC4gSSBjYW4gc2VuZCBpdCBp
biBhIHNlcGFyYXRlCnNlcmllcy4KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
