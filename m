Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83E6CA1012
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edd2U8A6mSQZloB8W109kiXZWjVSm/ygAOYMHaYiL9Q=; b=2Fvvg9906tnjmBJHt/gixxCg7z
	awONiGWX4SvZaHYTqVlJuNj/M8tPYSJPoZoE4O62Tigbv+9D1AM676jfWaIW+dB/nNgE6QuvrZEv6
	gSsNQO8Ah4WgGMzfFtBbQvJiw3xuAb9BeKBHjJ1C5rN0n+WAkgXACO47hkUOJSxKw1eqhsXBivUZa
	pH+xrPtliezVarrq+9kmK2AxLQT5Z8jzJ6jDUw/KP40ToQWJvqP5i+MIrEfkados8CpAanNu4Gk/8
	4ll2kHJOn1IbjnGR0wwIpvA4oSg/PepMK6IX4jFjfeBope6a/UHg5LAS5FIZ18hkbSOZt45Rt5kGT
	eQn0+A+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6M-0000000G5Kw-01Bv;
	Fri, 05 Sep 2025 02:22:58 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuIsu-0000000F00i-0nOp
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 22:56:53 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-723bc91d7a6so15287237b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 15:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757026608; x=1757631408; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZJsJ6Dias4aJk5oVm4edgReGaNhIOC6r9PNPMsZ5pk=;
        b=T0VVoM7RB9FmxAQgUZ/1TJHMgLuyN0+cJ1Kne1juoCzuoZR9afQiSzLPUfZnO+SA0I
         NiRHVVf6OmhhvoDzC643lds//2CJSFW8XCQPGz9wH2dyOgpN4aZ6QjXZB7WKGuXkNJIq
         ZAKV8fO5sJW14tuyDJ6HsuAOgyKFh6d8N7gg7vmN5y4bEXxyidO05oJvv6VkxHuJ1gP4
         EorCJ0gXZlDEH2eBMkRreAEQc0CzvMItAH9hSqfCqwsNtdmAu7cDZYOiad1SV/d1U9Fg
         3AHnpsTcZ5ZQ0iaj3tNDPUTg3oOqjGVOht3AGsmWVqPdvLa7XmIti7xvF+pXywq2Druk
         9gkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757026608; x=1757631408;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZJsJ6Dias4aJk5oVm4edgReGaNhIOC6r9PNPMsZ5pk=;
        b=QjUqdamSD0NM2o1D9BxOBmfJ563cI+g8M/gy0mO1LOt0Xkdyf8Ve6lrXeup1G6cHe1
         GZHS3Owv3Uhy3asBTse84qlgs67G74s2DAZiCZ4Q6sNH8iqhWOdwAvDhohleKePE9D1Y
         23fKzDx3XXQZm4lODu57SLZtEFuVQJb9mvyqZn4d+Lq+kNWXDoSo+OK7Abs/y8IGw5pP
         zaTyfTk7eOdNjHD094PWYgWQ7pe9Bpv6iR3uSb4VDATjX01+7PoJU/J7D0OuXCFcgj/6
         UOtZEQlmJTXP2JYSdK8UaK8YN/8k7okKxyIJ1S9802FnjXGPAYhQNavwdZukYGVAyaDA
         yN8w==
X-Forwarded-Encrypted: i=1; AJvYcCVw8Ye1A0tJ6ayhT3JTUosnBEpvTnj7uY6IofbEAOGI+2Vvg3i5Yh1DpHcaOrykzbC64/A7DQNrxezZJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw71pIqhUwy0jO1eP8D5YE5rNyuKdtG7GMBx+XO647O4aRj4Uu
	VsrA7de1eOW56376jti9htVUY+aFK5zTb4supbVENmDKDXXejn8Dij+E
X-Gm-Gg: ASbGnct150aeGjvezy1H6C6yimxH8KFAfQljw7C2tQ7hy7d60vPw3tMDmJYMQAQalLO
	y1qF+EV/tNaGbjhEWmPzpr+KV4Mb9Fd/NrfyMiq2hc9ROlt5dPHjTcbm2Yo0r6Cf+/VrEfBexZE
	dRPV1VS88vRTANiJDFSKwGRmzKEWJydjto7QGpJErS1WjiM6mEoQnD6B1/1up6ClGA53GeDqC5Q
	qIxHqwzBDLLSvQfLkyXwureaJCWNIj9F903Q9z5zvrp4Ty+Vrr4g2qxXncUTfEXMxFCBrhuLcxr
	97I0PmzEHETgQO7w6YzEkQEZqVfaQKwUPMVktZOxse8QvWd+lmHoZUmbGErVLlPPApXMDNYT4MW
	fXRNqFsQjSRf94nsHtoQBPuDhynpFWAczgBLDqNrsXfgeVnL6Hpu+DW6LyLRPdX4=
X-Google-Smtp-Source: AGHT+IEHGA0wsG9SM+lLIiJeqw57Hw+stWOBnY10zVsxOztzEXgl10NjAasmizVO1rfQqLWWpmuaDQ==
X-Received: by 2002:a05:690c:6a03:b0:724:c055:3cf3 with SMTP id 00721157ae682-724c0553f47mr40845437b3.14.1757026606920;
        Thu, 04 Sep 2025 15:56:46 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a855a865sm24681447b3.54.2025.09.04.15.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 15:56:46 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
Date: Fri, 5 Sep 2025 06:56:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Jason Montleon <jmontleo@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Tejun Heo <tj@kernel.org>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jan Hendrik Farr <kernel@jfarr.cc>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Brauner <brauner@kernel.org>,
 Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <20250904-sterilize-swagger-c7999b124e83@spud>
Content-Language: en-US
In-Reply-To: <20250904-sterilize-swagger-c7999b124e83@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_155652_232694_ABF52122 
X-CRM114-Status: GOOD (  34.79  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

PiBPbmUgdGhpbmcgLSBwbGVhc2UgZG9uJ3Qgc2VuZCBuZXcgdmVyc2lvbnMKPiBvZiBwYXRjaHNl
dHMgaW4gcmVzcG9uc2UgdG8gZWFybGllciB2ZXJzaW9ucyBvciBvdGhlciB0aHJlYWRzLiBJdAo+
IGRvZXNuJ3QgZG8geW91IGFueSBmYXZvdXJzIHdpdGggbWFpbGJveCB2aXNpYmlsaXR5LgoKSSBh
cG9sb2dpemUgZm9yIHRoaXMsIEknbSBwcmV0dHkgbXVjaCBuZXcgdG8gbWFpbGluZyBsaXN0cywg
c28gSSBoYWQgCmZvbGxvd2VkIHRoZSBzdGVwICJFeHBsaWNpdCBJbi1SZXBseS1UbyBoZWFkZXJz
IiBbMV0gaW4gZG9jLiBGb3IgZnV0dXJlIApwYXRjaGVzIEknbGwgc2VuZCB0aGVtIGFsb25lIGlu
c3RlYWQgb2YgcmVwbHlpbmcgdG8gZXhpc3RpbmcgdGhyZWFkcy4KClsxXTogCmh0dHBzOi8vd3d3
Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjYuOS9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1s
I2V4cGxpY2l0LWluLXJlcGx5LXRvLWhlYWRlcnMKCj4gT3RoZXIgdGhhbiBaaWNzci9aaWZlbmNl
aSB0aGF0IG1heSBuZWVkIGV4cGxpY2l0IGhhbmRsaW5nIGluIGEgZGVkaWNhdGVkCj4gb3B0aW9u
LCB0aGUgYXBwcm9hY2ggaGVyZSBzZWVtcyBraW5kYSBiYWNrd2FyZHMuCj4gSW5kaXZpZHVhbGx5
IHRoZXNlIHN5bWJvbHMgZG9uJ3QgYWN0dWFsbHkgbWVhbiB3aGF0IHRoZXkgc2F5IHRoZXkgZG8s
Cj4gd2hpY2ggaXMgY29uZnVzaW5nOiAicmVjb2duaXNlcyIgaGVyZSBpcyB0cnVlIGV2ZW4gd2hl
biBpdCBtYXkgbm90IGJlCj4gdHJ1ZSBhdCBhbGwgYmVjYXVzZSBUT09MQ0hBSU5fSEFTX0ZPTyBp
cyBub3Qgc2V0LiBXaHkgY2FuIHRoZXNlIG9wdGlvbnMKPiBub3QgYmUgcmVtb3ZlZCwgYW5kIGlu
c3RlYWQgdGhlIFRPT0xDSEFJTl9IQVNfRk9PIG9wdGlvbnMgZ3JvdyBhCj4gImRlcGVuZHMgb24g
IVJVU1QgfHwgPGNvbmRpdGlvbj4iPwoKWWVzLCBpdCdzIGtpbmRhICJiYWNrd2FyZHMiLCB3aGlj
aCBpcyBpbnRlbnRpb25hbCwgYmFzZWQgb24gdGhlIApmb2xsb3dpbmcgY29uc2lkZXJhdGlvbnM6
CgoxKSBBcyBtZW50aW9uZWQgaW4gcnVzdC9NYWtlZmlsZSwgZmlsdGVyaW5nIGZsYWdzIGZvciBs
aWJjbGFuZyBpcyBhIApoYWNrLCBiZWNhdXNlIGN1cnJlbnRseSBiaW5kZ2VuIG9ubHkgaGFzIGxp
YmNsYW5nIGFzIGJhY2tlbmQsIGFuZCAKaWRlYWxseSBiaW5kZ2VuIHNob3VsZCBzdXBwb3J0IEdD
QyBzbyB0aGF0IHRoZSBwYXNzZWQgQ0MgZmxhZ3MgYXJlIApzdXBwb3NlZCB0byBiZSBmdWxseSBj
b21wYXRpYmxlLiBPbiB0aGUgUklTQy1WIHNpZGUsIEkgdGVuZCB0byB0aGluayAKdGhhdCB2ZXJz
aW9uIGNoZWNraW5nIGZvciBleHRlbnNpb25zIGZvciBsaWJjbGFuZyBpcyBhbHNvIGEgaGFjaywg
d2hpY2ggCmNvdWxkIGhhdmUgYmVlbiBhY2NvbXBsaXNoZWQgd2l0aCBqdXN0IHRoZSBjYy1vcHRp
b24gZnVuY3Rpb24sIGlkZWFsbHkuCgoyKSBSdXN0IGJpbmRnZW4gb25seSAiZ2VuZXJhdGVzIiBG
Rkkgc3R1ZmYsIGl0IGlzIG5vdCBpbnZvbHZlZCBpbiB0aGUgCmZpbmFsIGFzc2VtYmx5IHN0YWdl
LiBJbiBvdGhlciB3b3JkcywgaXQgZG9lc24ndCBtYXR0ZXIgc28gbXVjaCB3aGF0IApSSVNDLVYg
ZXh0ZW5zaW9ucyB0byB0dXJuIG9uIGZvciBiaW5kZ2VuIChhbHRob3VnaCBpdCBkb2VzIGhhdmUg
YSBsaXR0bGUgCmltcGFjdCwgbGlrZSBzb21lIG1hY3JvIHN3aXRjaGVzKSwgaXQncyBtb3JlIG1h
dHRlciB0byBDQy4KClRoZXJlZm9yZSwgSSBjaG9zZSBub3QgdG8gbW9kaWZ5IHRoZSBvcmlnaW5h
bCBleHRlbnNpb24gY29uZmlnIApjb25kaXRpb25zIHNvIHRoYXQgaWYgbGliY2xhbmcgZG9lc24n
dCBzdXBwb3J0IHRoZSBDQyBmbGFnIGZvciBhbiAKZXh0ZW5zaW9uLCB0aGVuIHRoZSBSdXN0IGJ1
aWxkIGlzIG5vdCBzdXBwb3J0ZWQsIHJhdGhlciB0aGFuIHRyZWF0aW5nIAp0aGUgZXh0ZW5zaW9u
IGFzIG5vdCBzdXBwb3J0ZWQuCgpOb25ldGhlbGVzcywgaXQgb2NjdXJyZWQgdG8gbWUgYXMgSSB3
YXMgd3JpdGluZyB0aGlzIHJlcGx5IHRoYXQgaWYgR0NDIAppbXBsZW1lbnRzIGEgbmV3IGV4dGVu
c2lvbiBpbiB0aGUgZnV0dXJlIHRoYXQgTExWTS9DbGFuZyBkb2Vzbid0IHlldCAKaGF2ZSwgdGhp
cyBjb3VsZCBvbmNlIGFnYWluIGxlYWQgdG8gYSBicmVhayBpbiBHQ0MrUnVzdCBidWlsZCBzdXBw
b3J0IGlmIAp0aGUga2VybmVsIGRlY2lkZXMgdG8gdXNlIHRoZSBuZXcgZXh0ZW5zaW9uLiBTbyBp
dCdzIGEgdHJhZGUtb2ZmLCB5b3UgCmd1eXMgZGVjaWRlLCBJJ20gZmluZSB3aXRoIGJvdGguCgpS
ZWdhcmRpbmcgdGhlIG5hbWUsIGluaXRpYWxseSBJIG5hbWVkIGl0ICJjb21wYXRpYmxlIiwgYW5k
IGVuZGVkIHVwIApjaGFuZ2VkIGl0IHRvICJyZWNvZ25pemUiIGJlZm9yZSBzZW5kaW5nIHRoZSBw
YXRjaC4gSWYgd2UgY29udGludWUgb24gCnRoaXMgcGF0aCwgSSdtIG5vdCBzdXJlIHdoYXQgbmFt
ZSBpcyBhcHByb3ByaWF0ZSB0byB1c2UgaGVyZSwgZG8geW91IApndXlzIGhhdmUgYW55IGlkZWFz
PwoKPiBXaGF0IGRvZXMgdGhlIGxpYmNsYW5nID49IDE3IHJlcXVpcmVtZW50IGFjdHVhbGx5IGRv
IGhlcmU/IElzIHRoYXQgdGhlCj4gdmVyc2lvbiB3aGVyZSBsbHZtIHN0YXJ0cyB0byByZXF1aXJl
IHRoYXQgWmljc3IvWmlmZW5jZWkgaXMgc2V0IGluIG9yZGVyCj4gdG8gdXNlIHRoZW0/IEkgdGhp
bmsgYSBjb21tZW50IHRvIHRoYXQgZWZmZWN0IGlzIHJlcXVpcmVkIGlmIHNvLiBUaGlzCj4gZG9l
c24ndCBhY3R1YWxseSBuZWVkIHRvIGJlIGJsb2NraW5nIGVpdGhlciwgc2hvdWxkIGp1c3QgYmUg
YWJsZSB0bwo+IGZpbHRlciBpdCBvdXQgb2YgbWFyY2ggd2hlbiBwYXNzaW5nIHRvIGJpbmRnZW4s
IG5vPwoKbGliY2xhbmcgPj0gMTcgc3RhcnRzIHJlY29nbml6aW5nIFppY3NyL1ppZmVuY2VpIGlu
IC1tYXJjaCwgcGFzc2luZyB0aGVtIAp0byAtbWFyY2ggZG9lc24ndCBnZW5lcmF0ZSBhbiBlcnJv
ciwgYW5kIHBhc3NpbmcgdGhlbSBvciBub3QgZG9lc24ndCAKaGF2ZSBhbnkgcmVhbCBkaWZmZXJl
bmNlLiAoc3RpbGwgZm9sbG93cyBJU0EgYmVmb3JlIHZlcnNpb24gMjAxOTA2MDggLS0gClppY3Ny
L1ppZmVuY2VpIGFyZSBpbmNsdWRlZCBpbiBiYXNlIElTQSkuIEkgc2hvdWxkIGhhdmUgd3JpdHRl
biBhIApjb21tZW50IHRoZXJlIHRvIGF2b2lkIGNvbmZ1c2lvbi4KClJlZmVyZW5jZSBjb21taXQg
aW4gTExWTS9DbGFuZyAyMmUxOTllNmFmICgiW1JJU0NWXSBBY2NlcHQgemljc3IgYW5kIAp6aWZl
bmNlaSBjb21tYW5kIGxpbmUgb3B0aW9ucyIpCmh0dHBzOi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0t
cHJvamVjdC9jb21taXQvMjJlMTk5ZTZhZmIxMjYzYzk0M2MwYzBkNDQ5ODY5NGUxNWJmOGExNgoK
PiBXaGF0IGFib3V0IHRoZSBjYXNlIHdoZXJlIFRPT0xDSEFJTl9ORUVEU19FWFBMSUNJVF9aSUNT
Ul9aSUZFTkNFSSBpcyBub3QKPiBzZXQgYXQgYWxsPyBDdXJyZW50bHkgeW91ciBwYXRjaCBpcyBn
b2luZyB0byBibG9jayBydXN0IGluIHRoYXQgY2FzZSwKPiB3aGVuIGFjdHVhbGx5IG5vdGhpbmcg
bmVlZHMgdG8gYmUgZG9uZSBhdCBhbGwgLSBubyBwYXJ0IG9mIHRoZSB0b29sY2hhaW4KPiByZXF1
aXJlcyB1bmRlcnN0YW5kaW5nIFppY3NyL1ppZmVuY2VpIGFzIHN0YW5kYWxvbmUgZXh0ZW5zaW9u
cyBpbiB0aGlzCj4gY2FzZS4KClRoaXMgaXMgYSBidWcsIEkgbWlzc2VkIHRoaXMgY2FzZS4gU28g
aXQgc2hvdWxkIGJlIGNvcnJlY3RlZCB0bzoKCiAgICBjb25maWcgUlVTVF9CSU5ER0VOX0xJQkNM
QU5HX1JFQ09HTklaRVNfWklDU1JfWklGRU5DRUkKICAgICDCoCDCoCBkZWZfYm9vbCB5CiAgICAg
wqAgwqAgZGVwZW5kcyBvbiBUT09MQ0hBSU5fTkVFRFNfT0xEX0lTQV9TUEVDIHx8CiAgICAhVE9P
TENIQUlOX05FRURTX0VYUExJQ0lUX1pJQ1NSX1pJRkVOQ0VJIHx8CiAgICBSVVNUX0JJTkRHRU5f
TElCQ0xBTkdfVkVSU0lPTiA+PSAxNzAwMDAKCgo+IFRoZSBUT09MQ0hBSU5fTkVFRFNfT0xEX0lT
QV9TUEVDIGhhbmRsaW5nIEkgZG9uJ3QgcmVtZW1iZXIgMTAwJSBob3cgaXQKPiB3b3JrcywgYnV0
IGlmIGJpbmRnZW4gcmVxdWlyZXMgdGhlbSB0byBiZSBzZXQgdG8gdXNlIHRoZSBleHRlbnNpb24K
PiB0aGlzIHdpbGwgcmV0dXJuIHRydWUgYnV0IGRvIG5vdGhpbmcgdG8gYWRkIHRoZSBleHRlbnNp
b25zIHRvIG1hcmNoPwo+IFRoYXQgc2VlbXMgd3JvbmcgdG8gbWUuCj4gSSdkIGJlIGZhaXJseSBh
bWVuYWJsZSB0byBkaXNhYmxpbmcgcnVzdCB0aG91Z2ggd2hlbiB1c2VkIGluIGNvbWJpbmF0aW9u
Cj4gd2l0aCBnY2MgPCAxMS4zIGFuZCBnYXMgPj0yLjM2IHNpbmNlIGl0J3Mgc3VjaCBhIG5pY2hl
IGNvbmRpdGlvbiwgcmF0aGVyCj4gZG9pbmcgd29yayB0byBzdXBwb3J0IGl0LiBUaGF0J2QgYmUg
ZWZmZWN0aXZlbHkgYW4gaW52ZXJzaW9uIG9mIHlvdXIKPiBmaXJzdCBjb25kaXRpb24uCgpUaGUg
Y3VycmVudCBsYXRlc3QgdmVyc2lvbiBvZiBMTFZNL0NsYW5nIHN0aWxsIGRvZXMgbm90IHJlcXVp
cmUgZXhwbGljaXQgClppY3NyL1ppZmVuY2UgdG8gZW5hYmxlIHRoZXNlIHR3byBleHRlbnNpb25z
LCBDbGFuZyBqdXN0IGFjY2VwdHMgdGhlbSBpbiAKLW1hcmNoIGFuZCB0aGVuIHNpbGVudGx5IGln
bm9yZXMgdGhlbS4KCkNoZWNraW5nIHRoZSB1c2FnZSBvZiBDT05GSUdfVE9PTENIQUlOX05FRURT
X09MRF9JU0FfU1BFQzoKCiAgICBpZmRlZiBDT05GSUdfVE9PTENIQUlOX05FRURTX09MRF9JU0Ff
U1BFQwogICAgS0JVSUxEX0NGTEFHUyArPSAtV2EsLW1pc2Etc3BlYz0yLjIKICAgIEtCVUlMRF9B
RkxBR1MgKz0gLVdhLC1taXNhLXNwZWM9Mi4yCiAgICBlbHNlCiAgICByaXNjdi1tYXJjaC0kKENP
TkZJR19UT09MQ0hBSU5fTkVFRFNfRVhQTElDSVRfWklDU1JfWklGRU5DRUkpIDo9CiAgICAkKHJp
c2N2LW1hcmNoLXkpX3ppY3NyX3ppZmVuY2VpCiAgICBlbmRpZgoKSXQganVzdCB1c2VzIC1XYSB0
byBmb3JjZSBhbiBvbGRlciBJU0EgdmVyc2lvbiB0byBHQVMuIFNvIHRoZSAKUlVTVF9CSU5ER0VO
X0xJQkNMQU5HX1JFQ09HTklaRVNfWklDU1JfWklGRU5DRUkgSSBjb3JyZWN0ZWQgYWJvdmUgc2hv
dWxkIApiZSBmaW5lIG5vdyBJIGd1ZXNzPyBPciB3b3VsZCB5b3Ugc3RpbGwgcHJlZmVyIHlvdXIg
aWRlYSBvZiBibG9ja2luZyAKUnVzdCBpZiBUT09MQ0hBSU5fTkVFRFNfT0xEX0lTQV9TUEVDIGlz
IHRydWU/CgooVG8gYmUgY2xlYXIsIHRoZSBicmVha2luZyBjaGFuZ2VzIHJlZ2FyZGluZyBaaWNz
ci9aaWZlbmNlIGFyZSBzaW5jZSBJU0EgCnZlcnNpb24gMjAxOTA2MDgsIGFuZCB2ZXJzaW9ucyAy
LjAsIDIuMSwgMi4yIGFyZSBvbGRlciB0aGFuIDIwMTkwNjA4KQoKVGhlIG9ubHkgdGhpbmcgSSdt
IGNvbmZ1c2VkIGFib3V0IGlzIHRoYXQgYWNjb3JkaW5nIHRvIHRoZSBjb21tZW50IG9mIApUT09M
Q0hBSU5fTkVFRFNfRVhQTElDSVRfWklDU1JfWklGRU5DRUksIEdDQy0xMi4xLjAgYnVtcGVkIHRo
ZSBkZWZhdWx0IApJU0EgdG8gMjAxOTEyMTMsIGJ1dCB3aHkgZG9lc24ndCB0aGUgZGVwZW5kcy1v
biBoYXZlIGNvbmRpdGlvbiB8fCAKKENDX0lTX0dDQyAmJiBHQ0NfVkVSU0lPTiA+PSAxMjAxMDAp
PwoKVGhhbmtzIGZvciB5b3VyIGRldGFpbGVkIHJldmlldy4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
