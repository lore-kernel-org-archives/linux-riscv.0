Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99295F46C4E
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kv0Iai1ac+b2+RfoVCxT3VsHXc00YwdJtcWFZPnfB30=; b=JwuimvXjvXu9gm
	EK4Kp/qajIPcbsJxsJZKAZylln8gZGMFJ/6sfCXHKY+N3SRGUeK+xzLC0168BXTT1doq6BF6x1HBt
	uPGVs3IuC0xJOLXUFwsTM1kuLDxopaX4Zfg2CSk8dTCwddNsEZ++9zXBNAGu7jLOI+ovODZyX/1Lb
	WML6WnXqYhcoHKncECBscv63iU9sMjF5w+4z44KShi6i0/HqwDtdaQ5bfOqMO+LSMmmw0WXFQElBj
	cgX3hQAbnpTWdjttW2G28cxua8CjXE3054RbypeR1KXppdl2ayQujM2IAPSHVSO1rBRSv/OXDrqdV
	52KoPBOcIXPwU99QXgZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9luu-00000005Gvi-1X3f;
	Mon, 06 Apr 2026 15:31:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9lur-00000005Gv3-0bUf
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 15:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63B3D4456E
	for <linux-riscv@lists.infradead.org>; Mon,  6 Apr 2026 15:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A66C2BCB6
	for <linux-riscv@lists.infradead.org>; Mon,  6 Apr 2026 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489464;
	bh=upOPgQrKow7ScyuKD1WfCKj6976lQXmqW8HddZVDJoo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kqD9k+ycQlsiYEuHvSJeSyj6IRexOnfGBKsKJSNIrwAwZTHRSHkstsk1e8qmv714V
	 FUeHB5NV6WB/0CHoUr1Lz5BcP8qsJXzTG+0JENcCwgi5JPw01njdTBXGZ88ZdKTTKz
	 5JxnP9jfP9WcAfmbgR3zkTwF4YSGdqaoY6Y1tt9fDxwV+VxZhuFAXjaGFxcfFDAX9I
	 GG4IfT7hAE/g5gMEUz/ACvTuOyhX6rQEGd8gv6B0QFGdjdmSKpTx8VxOVqSB1+yOiy
	 cS3ATA0jMkmkM6QhsQ+y8HtZJ6SKahrSm/DoKMfme1blIQ9Trr9b2zy9kl5UEA9o85
	 v11je9Jgag/Lw==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e0ef48ac0so2763651fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 08:31:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXM0vvrKPye4XOKngU7zqmIuHK/LyoD1REFlWDvRxfTIRQ2xBG0+cwJ893tg2eHSZBig5/M6ft3bHnQSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc2Ks9giaeWkR/8K5zg3GNM8WJC4AruwH7M83jhgj73FqX+F+k
	s8n307lPb2unpT6zErM3/UZH6eUJqadwNgL03LSabVtgxn3VKzMgGnITbWl+EEhb0B17vikh3JE
	IaIugecBOFFb9vusfArVdq2lRKQdBZ3k=
X-Received: by 2002:a2e:80d3:0:b0:38a:f5a6:9173 with SMTP id
 38308e7fff4ca-38d91c092bamr32802941fa.27.1775489462303; Mon, 06 Apr 2026
 08:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4> <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
In-Reply-To: <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 6 Apr 2026 11:30:26 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
X-Gm-Features: AQROBzB1MuYM_2_U32IZvjJjOPHSscckixukkJGDNua3mGMOgh49W4AabPzp8YM
Message-ID: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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
X-CRM114-CacheID: sfid-20260406_083105_212731_44FD5F1D 
X-CRM114-Status: UNSURE (   9.49  )
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

T24gTW9uLCBBcHIgNiwgMjAyNiBhdCAxMDozOOKAr0FNIE1pZ3VlbCBPamVkYQo8bWlndWVsLm9q
ZWRhLnNhbmRvbmlzQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEFwciA2LCAyMDI2IGF0
IDQ6MjnigK9QTSBUYW1pciBEdWJlcnN0ZWluIDx0YW1pcmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gQ291bGQgeW91IGFkZCBhIHJlZmVyZW5jZSB0byB0aGUgdXBzdHJlYW0gYnVnIHJlcG9y
dCBbMF0gaGVyZT8KPgo+IE9mIGNvdXJzZSwgdGhhbmtzIGZvciB0aGUgdGFncyEKCllvdSdyZSB3
ZWxjb21lISBBY3R1YWxseSBpdCBzZWVtcyB0aGUgbGludCB3YXMgYWxyZWFkeSBpbXByb3ZlZAp1
cHN0cmVhbSwgc3RhcnRpbmcgd2l0aCAxLjkwLjAuCgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20v
cnVzdC1sYW5nL3J1c3QtY2xpcHB5L2NvbW1pdC9jMGRjM2I2MSBbMF0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
