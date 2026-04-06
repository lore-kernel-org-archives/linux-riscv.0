Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3412BE9D827
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 00:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ax3kciomPt41vw/wm8gk0OzmxSOw/yVh/XpIqkOxoR4=; b=S7mbxD1IRVqA/X
	muQouuZjKxsLfIgjRmVxR0RpdHNseUWi+RoVWAVMnhvcC7KQG1ur4IqsHBOwP7g6SwlX1AkRTrRRw
	qGxwP7ccBltVyLmPwML3ZoFlzswCgJNYr8l5w3N+Yjhxi/ApIRhH38KCyL1kvthc6aGwNNBCgFJRm
	8TEi2Hy1OxIHx9HZCzFDYqmtdWmAKB6Sa391DCNrovMD21dEbB9CIDErTCWI3sKqsjsHnd2Pgvzo8
	q0oHgQP0DlHP4AzoG5KC2nhHwdZuiEmrvsLjEldDN5a8c3dDPDnmrz/Hh8z0wBh8O60iXLWtJjK9e
	OfNvpv96R6wsx6AhMWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Xbd-00000004dqM-20Ql;
	Mon, 06 Apr 2026 00:14:17 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Xba-00000004dp1-0oTQ
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 00:14:16 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2bd801b4078so366900eec.2
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 17:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775434453; cv=none;
        d=google.com; s=arc-20240605;
        b=K90KvjfTfe9rV5gIssoQ2/OxfM4Z28aaEI4pxNLsVY6dai+P0PCX+WPS5vyBIOHXyO
         qBmo4qXWC/D3EvuOZFbiUWLU2mRBaZkTNGDYrHgkkJ+a00ccUsJL6Lukz4Q9zPWuXiqf
         0Vzd9puTKtiF8syl+7MIDuMoFt/qZAb7Q+FpyDbFLJVX2LuyAiT3UyNSgtPK3nTgCr+W
         KKhbM6vkyp4cE/qZcO0EWGAYM/9TXh5UjAsjvJhn1XbdrCdgZvP6Z7QR26nEiGBn+Igj
         yeLTQKnG9pQjKek9KZ/0g0vXr9pPl8YkH21agK45UvY8iqp7bt5p1ZeLhAAT+4VLku70
         XyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        fh=vtEj0m6ZKikL+10MXdujqaQJuLJ9m3R1CzDlY/wxpbQ=;
        b=C2wBMAyUyA8No/rmW0L0mO8v//4TBz8LaMcY9XE/fypGazPcXR5+9NVRnhIn131/Zu
         1qNwcxHlRk1E33B1KRLMuVnkaR2F0VZ2zgUADm4fJpsAQPjV7UPuRC4M990mBRDI9lQF
         JnMaEYroaqNudasg6uKBfOn08rfak230iRXBHB1Fktw0P/iO2D6K4H1aqAeCxmSM4yud
         Qo5RgAXw2areQyjEgwwWtgyHlfd5TDkd77p8TjDWUGziz/KR2jpoBWQ4P8n4pzUh8tGs
         +FC5c/p0h2a26PCtVEHI5UZUfTykNjFnQhNnE3CEZ9IWQVsm1J1ja+Rb5DhHncwpbtHh
         yGRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775434453; x=1776039253; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=K1oknZl/v8xNhFdAapSjtgugUtljwVUslxTw36ap8JQspNq5b1yhVQw51BhWfAXQrX
         s5J/Ex+BZO1nuech5eBUQnEgST0a1MGjgjYggNHZEa6ireVmHB0XSq4c5v/6iah+M0xm
         14ZAskyoosCtb1KMFS2RVFi50KsgeFVMYBlecR5f8gwrBk2JUtzLtZcWfCWwDO4DxMW2
         FO4YAxwfhGzkNswnN4t1Dp1Iji6T8rBdIQH4vc7A7KxP46ZzX1IYHgW/lYP2nbtmyQzH
         z/5dYVKOtJTBuRnOhmjRg3j1jBqNmhNWF5Kluu2hFClVsv2aiiiaBZMLgAsWvnOYauCJ
         cdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775434453; x=1776039253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEpvz0SusfCyL05O+8XHZ5HBN7Vc6GU6ixNlE1n3otA=;
        b=XNRhJt0NRph22BpXaZk84cC4Gz+Ktus29uB+SseOgKv9m0MMkGHw4zIEMaZqlqVqJH
         UMoNaSAn9jE7SfNj7iFM4uGaSgRZ4Iu7E6+o1Xjd5cdILgq63ILD6b0Bxrz22oRigRSm
         XTnyR8TNXK9WugJAFp62+fzC5h06rul9hbO/M59v5xAOJkTDQSaL19k1pic0vr9LHris
         zWn+6GN64wMEYK2fDHNEGT5P7BACyu3LNw7Qgc95CL8md6xu/D8CRNH5kPcBqcBK3LaP
         qkOikD9NaIMySMm/HTZf2rT1x3ha1W3KMnYBHQDVWkSEXdRQjk3lpkNq5JPvGb1Ctwq8
         gvMg==
X-Forwarded-Encrypted: i=1; AJvYcCWf8EW6XtUprHGTi68qvqYpzuPIKruPWunWq7tg1/D6xoYALkQJ+S6MzikCaDTvqxsHZbzckXJppT8sdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ5b/ukAO8yVb6eA4JUeapsnFxExyqDfRqo8aAYBgxq7QYEW9C
	gKFJJwRO7bUFXhC67ZbrqjUu+IjiIUiK7JuixD/vge6wTJy+alMLBnc9n63jobxyxnLeaHPkYo9
	muiLEBYO1bwzLYrWj6xQFfDq1vPA9gD4=
X-Gm-Gg: AeBDietnrHraPVPy0s2UY19xRKJVnU9GO+8/msdn8oWaw9xBOTLA3UciyZqwyuGGMMm
	NujFahkTkEm4O4B1QgrXSwUd57omMemFYyuMhXe86cJMrGHEf5rl5bSPYHprqoYqG5jaUeNimh/
	PbGCWKp6FZOpBqkeeJ9kmUt3gDp2fyUjac8qSOyjvS8n7V5ahVeAveG4WYbwBLANv2ud6SBClui
	wZjHcJKkA6Sw8dfuILHsHwpLHtjCWlhspifEeUXkbdSCJ4SaXLtHtFqbHZN9TDYz2Bh8v5bEfEE
	RtUk6cSR5r8UR0ABFvjA3vDM8emWlbNfBKTG+MUr+Reura2d8kQYl2CLnJszFj18PrRY2R2hF1n
	qaClgNp4+ZXZuWmldmi5QoGo=
X-Received: by 2002:a05:7301:6784:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2cbfbc7dc06mr2181016eec.4.1775434453241; Sun, 05 Apr 2026
 17:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4> <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
 <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
In-Reply-To: <DHLMTLCY6U4N.3VOMQXRIT1RFY@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 02:14:00 +0200
X-Gm-Features: AQROBzC0xKqhkvjW35MYEt1fkyhl47XKSCgdBG6b_PFaPBKsGPkzdO2Dex1iVhA
Message-ID: <CANiq72nPjz4FiYUDDV5Xw1=ychH0DrhVN88hjygBnawLf7oamw@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
To: Gary Guo <gary@garyguo.net>, Fiona Behrens <me@kloenk.dev>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260405_171414_256235_D6429D10 
X-CRM114-Status: UNSURE (   9.77  )
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

T24gTW9uLCBBcHIgNiwgMjAyNiBhdCAyOjA24oCvQU0gR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5u
ZXQ+IHdyb3RlOgo+Cj4gSXQncyBzdGlsbCByZXF1aXJlZC4KClRoYW5rcyBmb3IgY29uZmlybWlu
ZyEKCj4gUGVyaGFwcyBoYXZpbmcgYSByZXBvIGluIHJ1c3QtZm9yLWxpbnV4IEdpdEh1YiBvcmcg
KG9yIHNvbWV3aGVyZSBlbHNlIGluCj4ga2VybmVsLm9yZyBTQ00pIHdoZXJlIHdlIGNhbiBwb2lu
dCBwZW9wbGUgdG8/CgouLi5hbmQgZm9yIGFsbCB0aGVzZSBkZXRhaWxzIDopCgpJIGFncmVlIHRo
YXQgaXQgZG9lc24ndCBmaXQgcGVyZmVjdGx5IHdpdGhpbiB0aGUga2VybmVsLCBidXQgYW4gdXBk
YXRlCmV2ZXJ5IGtlcm5lbCBjeWNsZSBvciBzbyBzaG91bGQgYmUgZmluZSwgSSB0aGluaywgaWYg
eW91IHRoaW5rIHRoYXQgaXMKZW5vdWdoLgoKT3RoZXJ3aXNlLCByZWdhcmRpbmcgdGhlIHJlcG9z
aXRvcnksIHRoYXQgc291bmRzIGdyZWF0IHRvIG1lIC0tIHdlCmFscmVhZHkgaGFkIGFuIG9sZCBo
dHRwczovL2dpdGh1Yi5jb20vUnVzdC1mb3ItTGludXgvbml4IGFuZApodHRwczovL2dpdGh1Yi5j
b20vUnVzdC1mb3ItTGludXgvbml4cGtncy4gTm90IHN1cmUgaWYgRmlvbmEgKENjJ2QpCndhbnRz
IHRoZW0sIGJ1dCBwZXJoYXBzIHlvdSBjb3VsZCByZXVzZSB0aGVtIChvdGhlcndpc2Ugd2Ugc2hv
dWxkCmFyY2hpdmUgdGhlbSkuCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
