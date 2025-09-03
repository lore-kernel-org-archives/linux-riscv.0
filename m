Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A397CA1014
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7o4dGcxViOkxSWExOc2F4e0UpRZ6K8YN+I/FlyIhfhM=; b=K3WsDmgVYGo3UB
	r9d3d31BLx4ASjhtWOBdO7Yrmu+hpd9pWZEazUbl41u1Cozhy7eyedGM94I8Jsl3r8Ci9dOnWtk9T
	Mq0JflqldRYYDnuTjEHVrTiebRmAMjE9csU6tnBZo8/wfD81xpLT92ZjiTj9/bU/QtmR36YuXas7d
	zrG9jOzPD1akf3Dr1kfj3Dqk6WrqsAdRawvxjzHziYsWr8njDX8CTvpbuA6PZd9B/9Sakhf+0GoQO
	XpIYgGkSp1ydm4crjqFI7RDr8q4mS/rORsf8u+9oKwF+6KYS85/Jh9TXLUTSbQYr9b8lc4Nhsa+Tb
	IHM3hYE6KVdugF8/p/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bj-00000008fLl-3ndW;
	Thu, 04 Sep 2025 03:25:55 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwqC-00000007uNR-1BrG
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 23:24:37 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-248e01cd834so895755ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 16:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756941875; x=1757546675; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
        b=MvAUPL/kFN2WO3OKhXUY34LNWDwKkWPXyX+6QWXEOyPMqIgCAxfNjrVn0TkDlnAV7s
         fuYGHYoRfpOVe2IYbWpp7YEEini3UbBrTrJH6l/ApbMMXxpGNnuv/aOli41NQTzo+xM/
         AAziBeS4X3PG/sAekQqJSJg5bx5KMV0gOrXvgp3+VCY/+SspCAH9A3nmMBuMpsUQn0hi
         /w26Z+xTZMOfTnJXoYjMlsJXmKTUO5pVv5amIzEOb499nk3xjCIYaX+mXc5GqtrHZlx5
         KRs9mBrAnQKznAaR16m/iEG7Gi+Xf8pvypmQ+piubpQyx6TJHyA+vGosWaSatAv7tmCV
         M5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756941875; x=1757546675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
        b=fNJiXGNayiZTx6ZAZVRqkus+Oxc0xVQ7hp6RxZwaQO8WZiuOw5v5IHuQoeB/ai8v1i
         dnjK/IcMs6nHciJQgS4TcffIzeqxG45ObOD1LJCGN5Xf4tf3s4VcYEPxdjPxIEct21Ep
         JEhKzS21lLxRzx1TUK7wsHlfJGYocqFBbsVz4OYFnF4kXzuuXvD4yK7w3ekRwWc+Cvx0
         fooLfNHD8NTNTD3mRsh7Y8yldksgtRLAP3pSIvn1lnFVXKbqoSpgzrA0winZwfotGH7D
         zIlZJVbT5jYxTuoZShuHjb/FRlVos3pxmyFaVpLKDPW1LK9G41jIYix/M/4QMZiIdcU/
         Y4pA==
X-Forwarded-Encrypted: i=1; AJvYcCV7UyL/p1/GhLZirhfw04x+Eb9nQXKWVmDyNAM+Fvd3y8J/isZpbwFE3x4JD1EdsXCxcUSLZi0hgi/6Dw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNOgWx1QIB7Xha3l0M2rbieOiZ4bOmjiJ4O2SwDsHHmv75nwrz
	/IxOZH6vdfUwFo4qAj+qKx/HQnKziC6OqPKYWGNLnRMeigZ+16eX6KzVNnjS5U3JHCxTD0zUfFe
	xnoTIdLOzf4mRMBH//7NuJ+aGmeyFn48=
X-Gm-Gg: ASbGncu0L8fmycH5lGSnQT6aIftyW7uq+sUPp5WaOB1hED0b+NjUW9xaGhyhDD16WbG
	NYUl4RyPreh7eS/uMGhC2RTYdgyyBeEtkFVJ6yR6XT8rasvM0EGqWVvRqxXKcNul8tlxhR6x9Ij
	EeRnGK30hzVU9ZtEupfHT3ihZWMj+4i5XHpJKfvCBG4/r3G0Noc0ddYQSFZrvX0d+WQmyCw1ACL
	kpcmLYiDbzO5FDJnlGmlMNdnDBA4C/gzYbFC3es17ZSgErA/p63Kze9itNhpvYx3wdia5vN5Scw
	dKU6dCNnpINnXb17tBcW5mb2TBlaI95sG/2G
X-Google-Smtp-Source: AGHT+IEjlWFuPMxhtD/Mq7OZwOStvmczamQHMaG5FsSJXT9epadmoDRef8lNJ29rsmcfdJHBWLObAXkHao0s90DS5wU=
X-Received: by 2002:a17:903:1a70:b0:248:847b:8906 with SMTP id
 d9443c01a7336-2491098b4c3mr158698905ad.11.1756941875488; Wed, 03 Sep 2025
 16:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-cheesy-prone-ee5fae406c22@spud> <20250903190806.2604757-1-SpriteOvO@gmail.com>
In-Reply-To: <20250903190806.2604757-1-SpriteOvO@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Sep 2025 01:24:22 +0200
X-Gm-Features: Ac12FXx5iwHLbaJ0TZ88p_k42OqHbK3bT3Fq9WvwJC3yuhfgjLr0qE6Io-xqWpQ
Message-ID: <CANiq72nRA9zHbzroLPa9aNSEzKre=V8Jwmw2Lezy6AHgbm+FcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: get the version of libclang used by bindgen in
 a separate script
To: Asuna Yang <spriteovo@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>, 
	Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>, Jeff Xu <jeffxu@chromium.org>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Christian Brauner <brauner@kernel.org>, Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_162436_340420_A29C948D 
X-CRM114-Status: GOOD (  12.35  )
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

T24gV2VkLCBTZXAgMywgMjAyNSBhdCA5OjA44oCvUE0gQXN1bmEgWWFuZyA8c3ByaXRlb3ZvQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBEZWNvdXBsZSB0aGUgY29kZSBmb3IgZ2V0dGluZyB0aGUgdmVy
c2lvbiBvZiBsaWJjbGFuZyB1c2VkIGJ5IFJ1c3QKPiBiaW5kZ2VuIGZyb20gcnVzdF9pc19hdmFp
bGFibGUuc2ggaW50byBhIHNlcGFyYXRlIHNjcmlwdCBzbyB0aGF0IHdlIGNhbgo+IGRlZmluZSBh
IHN5bWJvbCBmb3IgdGhlIHZlcnNpb24gaW4gS2NvbmZpZyB0aGF0IHdpbGwgYmUgdXNlZCBmb3IK
PiBjaGVja2luZyBpbiBzdWJzZXF1ZW50IHBhdGNoZXMuCgpIbW0uLi4gSSBhbSBub3Qgc3VyZSBp
dCBpcyBhIGdvb2QgaWRlYSB0byBtb3ZlIHRoYXQgaW50byBhbm90aGVyCnNjcmlwdC4gRG8gd2Ug
cmVhbGx5IG5lZWQgdG8gaW50ZXJ0d2luZSB0aGVzZSB0d28gc2NyaXB0cz8gVGhlIHJlbmFtZQpp
c24ndCBncmVhdCBlaXRoZXIuCgpDYydpbmcgdGhlIHJ1c3QtZm9yLWxpbnV4IGxpc3QgdG9vLgoK
VGhhbmtzIQoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
