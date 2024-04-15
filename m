Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E05CC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 19:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGUzDU2miKjl0reW1kk4Gu0Hw2fwXC+8RHeTLnldux0=; b=k9TrGHOFiMdevl
	QlKhZayvpNgiK1WRMZgrt2+illejQP6Qs8ZuRGE0sWiAVX4iFr+IYuJbt7PrbKr7WH5wLgNdWGYZ5
	UFZC+1/EHg1lYu5q/glojRC3D9wPFDeXCGozeJDQ/gcWydE4jVbMbjbQ9twKGuYIZM+yKtirIa75r
	K9S1YBUipteK5+2LZeTprGhi3sglVew1x+yTceh3SjI8RJBKVlhyT26fAh0MWbrsw+XGoqeSP6HG4
	fAoRmp3dMKjWFBcAm9fW9ekvsm1raK3OA5XUWMqy2qbM69UrpQhk4G5CH8m/vv7001FqJN33qXKy1
	U9pDHOb8hFaj1ZEKpMXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwRbX-00000009Wj6-1Rn9;
	Mon, 15 Apr 2024 19:02:59 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwRbU-00000009Whp-1LIq
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 19:02:58 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6eb7d1a5d39so984058a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1713207774; x=1713812574; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qnuzy4YohZRKFHiloeA4mVaIUDCwUMILHZ7C0FksI2Q=;
        b=FxwDZJ0Mwfn0J1zLvU5HY08TYk7aQQcspyuDmi/9wy3VnMx60xBrd/PKuLF84u9hwx
         njAlXIbYBVAxZrjLIPySqXljxG5n01ZNQfXRFjuwBz0/OyhOvZTiBFf4ik/60XNMG4BP
         otR0J3ST33jS6j9ZKtWHNNNIGaFwA3QFHKOpwoPb/A6lDY7WSGOcwrYO3Uwu5PID9/S5
         CP7M90t7F3DU/MF1omhM2WVDg87cb8CipZyuf6AreGYQQWuOMzjjuLav/E3Z+JmLBU+w
         SniI/wr0BNdwlcea1EH3XEcTrMnhGjoDg4YM9h2idvxR7/UwduJKLpTbgoeI9cO3wljQ
         CxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713207774; x=1713812574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qnuzy4YohZRKFHiloeA4mVaIUDCwUMILHZ7C0FksI2Q=;
        b=NJX4QTyLUOu76i5VMsHJ7rKLhO2lAO0DwlylGnutDGIxYBOJLthc7+F3hHZdzdbyQ2
         AKARg9tM++LFT61bN3J3gYoZNP4nP8nzBg0t0+BPE774Wp9P+xNxtk46idu2PjFrkKmb
         xquc6axz8t7xSdyW9dyVobaOYBwiHUhXm6afD2VMwLRgVKrsNOd7TncSqiTeRORdHHQE
         CforLXw6CX/AfHK6mRZUN7VADKVDYPhvVVmncK6u589C2KR2mBAvMIFZPOAe+XX7kwOA
         I5DnNVBkxyznqzNSP/HGIbB6LR8ovzF7OIRkjDA9Minm4j5lFz4tfNhOK2YGRWF9H2un
         UjoA==
X-Forwarded-Encrypted: i=1; AJvYcCWbENUqyG3T3w44w9J3I+Xofs2jBweoDi1c6tPgNf2NsLHrAi3GXwoe8MoDjoPFIxNyQOi1qDYPP6NkMBsln3phH4vI1KeK8RWD8v7Jht3Z
X-Gm-Message-State: AOJu0Yx3W8JEWo8HJIQDUNS/Vy1qmK1jueI26xXiqSp0XZwJBQNgBoPR
	I/OaSXkgcBLbUOxDbbYmaBdCf835hS8wdss8YiJIxJCNhUp3yBA5lLg5rHc/XO2DciP60WF3Q1v
	YphN8bzK9GCRHh0GLPw90rBsmrXxtI59pTY+z
X-Google-Smtp-Source: AGHT+IEZFN4hbYjCj1ww/D1sjvqe8pOqx7vvJkr0xZqROOpJDxITAIMHtAwtRNrZa/YLYN0XY/RRnGvMJysW4KwpFmQ=
X-Received: by 2002:a05:6830:1484:b0:6ea:386a:44d8 with SMTP id
 s4-20020a056830148400b006ea386a44d8mr11138794otq.3.1713207774198; Mon, 15 Apr
 2024 12:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-jag-sysctl_remset_misc-v1-0-47c1463b3af2@samsung.com>
 <CGME20240328155911eucas1p23472e0c6505ca73df5c76fe019fdd483@eucas1p2.samsung.com>
 <20240328-jag-sysctl_remset_misc-v1-2-47c1463b3af2@samsung.com>
 <20240415134406.5l6ygkl55yvioxgs@joelS2.panther.com> <CAHC9VhTE+85xLytWD8LYrmdV8xcXdi-Tygy5fVvokaLCfk9bUQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTE+85xLytWD8LYrmdV8xcXdi-Tygy5fVvokaLCfk9bUQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Apr 2024 15:02:43 -0400
Message-ID: <CAHC9VhT1ykCKnijSbsgPXO9o-5_LHAtSm=q=cdQ8N9QH+WA+tw@mail.gmail.com>
Subject: Re: [PATCH 2/7] security: Remove the now superfluous sentinel element
 from ctl_table array
To: Joel Granados <j.granados@samsung.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, 
	John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>, 
	Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Luis Chamberlain <mcgrof@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, 
	io-uring@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_120256_590682_3E81BAF5 
X-CRM114-Status: GOOD (  16.22  )
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

T24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgMTA6MTfigK9BTSBQYXVsIE1vb3JlIDxwYXVsQHBhdWwt
bW9vcmUuY29tPiB3cm90ZToKPiBPbiBNb24sIEFwciAxNSwgMjAyNCBhdCA5OjQ04oCvQU0gSm9l
bCBHcmFuYWRvcyA8ai5ncmFuYWRvc0BzYW1zdW5nLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGV5Cj4g
Pgo+ID4gVGhpcyBpcyB0aGUgb25seSBwYXRjaCB0aGF0IEkgaGF2ZSBub3Qgc2VlbiBhZGRlZCB0
byB0aGUgbmV4dCB0cmVlLgo+ID4gSSdsbCBwdXQgdGhpcyBpbiB0aGUgc3lzY3RsLW5leHQKPiA+
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N5c2N0bC9z
eXNjdGwuZ2l0L2xvZy8/aD1zeXNjdGwtbmV4dAo+ID4gZm9yIHRlc3RpbmcuIFBsZWFzZSBsZXQg
bWUga25vdyBpZiBJdCBpcyBsaW5lZCB1cCB0byBiZSB1cHN0cmVhbSB0aHJvdWdoCj4gPiBhbm90
aGVyIHBhdGguCj4KPiBJIHdhcyBob3BpbmcgdG8gc2VlIHNvbWUgQUNLcyBmcm9tIHRoZSBhc3Nv
Y2lhdGVkIExTTSBtYWludGFpbmVycywgYnV0Cj4gaXQncyBtaW5vciBlbm91Z2ggSSdsbCBnbyBh
aGVhZCBhbmQgcHVsbCBpdCBpbnRvIHRoZSBsc20vZGV2IHRyZWUgdGhpcwo+IHdlZWsuICBJJ2xs
IHNlbmQgYSBub3RlIGxhdGVyIHdoZW4gSSBkbyB0aGUgbWVyZ2UuCgouLi4gYW5kIG5vdyBpdCdz
IG1lcmdlZCwgaXQgc2hvdWxkIGJlIGluIHRoZSBuZXh0IGN1dCBvZiB0aGUKbGludXgtbmV4dCB0
cmVlLiAgVGhhbmtzIQoKLS0gCnBhdWwtbW9vcmUuY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
