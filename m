Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5338CE9D80D
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 19:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNo1hrmBTDUxClt8CYnW1K/hUV/48Skdesxy9MgyXYU=; b=0sKhQ3o9XUHZDh
	MNOPJRkkueEQ943mk7iXVgNWBGF1LxwqP06QpUmbz5HiGUO9y8Vfg8NHSCTvTijfFOScRP88lBLm7
	S0idgaK4o1WLBjdmc2pnLoewd8QTGKPj0UFUtqWLlbrIkntuniyuXkjBaeBof3+YfS5q/0uQRzhKc
	/r8V1x7H5L/eJ4QOmhr9wsdnLhePX4uyqH2hvubKE2s2+vl0tbV8Ck02Uq9aEKBQOqzR65D7HP2h+
	OZVjmb1JrmeE31s+VOBOGvtDAVaU8Ds4taek0XvtWl+slrjussdfdrv8pCLcqmTXypBAp6TQoqYku
	ukbdT6Y1F5wHX463QudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TGL-00000004Qzj-3kyS;
	Sun, 05 Apr 2026 19:36:01 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TGJ-00000004Qz1-0dE6
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 19:36:00 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2cc175eec4dso117357eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 12:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417758; cv=none;
        d=google.com; s=arc-20240605;
        b=Nv56dyeMEq4jnWV/R+FIP810ZPn1l6lyxPNgiPPIh5Ka0zgPekIU19A938iWWRmYhH
         IhhV9j2HD1BwHa5EpQR4nIljLWNkjPg6vXpUEw3xTV+v/SWjFA109wHr/QJCGLBYnWC2
         QjGjSRFP1bIaEa2aH/DCaErRpKqdOq2O2isn0mtdLbN5VwbL0zvdhhtJdGQyMXBFV1av
         G2EN0YjjUOkIIBj9XWNhrIIh8NbvbDTX8YSExGFdjVQJg4okKMQ6m6sFlkeIW5iGT1Zh
         9cPW8nyKBfdutaYBhlEUjvP4eUOKNM8xVlPq6TqiU9oDMys3238KWdMxJJnbWc24l3Xh
         c1QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        fh=hqAR4CrpBgjvOgCpeYjq6QRooGzC3Ij2xPcKk0M/B/o=;
        b=kkBjHQlNR4q9gWHJcTsUbsSFByF2SqgLT1nqHNshPwjaOVd8esWTJR7AySSbvBecIp
         wV/Led8jPXiktu+YO4yp1nmhFFcJmEkLjEzO4F38clpHu/CJQUlJNG5djHnhJ9tsUGd3
         QznJkjl0HuXBCFBjMB8owXN/qew3vYdDdssiUqneYnwt1/SJqyl3NK3b2wMIRFVdA07V
         Vfv2jzLt6cRhdHtshrvfOV4jfXp9XilcfO80B11iIHbSO6d7Muh4yxdhVxyOXDBiRGi1
         5jdiZQ5kE2Y29RJWkRX2qYSMvLccHknq49LLGTy6Xn8LEvpFsL8PxeBIuypheJc/TJFN
         GYoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417758; x=1776022558; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=dot2zva9Ch/CM4IUTxJkZGPV9cwAuGJLphZUdd2wLETRTgaz44VlK3idceYfbsSfPL
         UFxWnizFk4tG2Hrueemy0NuHiWq1E1EDJTRrZ/9gSmokP3D0TAK54XaTqpYXwTkPdk/t
         Cn2UufIUZIEKq4foG089FleonOzu9Go48pf86dMv7FlVx8HbjpHTWkU+gnNjBwXAyG+o
         r994pScKV/Uq8qYpIiuNFOXtsHObMSNEP5NPcfBtf7AROI4Yj0yxHoBnFwxTEGH2Dyy7
         m3lUe4q1EG2ljTVpswpDe8b9YGGqjU6bMogXxcbZz5+Uzjq9F/Wm4GSYDayuJZzweWbB
         WBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417758; x=1776022558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BfjKSt6DEr7n25ZH5xS/6Npl1F2WZyz5JjVGM21RHvg=;
        b=tY3o+si2iiJQKWdiapXkIM9BgpKY66YDNPlgM457UjTANYEVtUYuJZV0ghQkRYNjil
         K9J338Q7EQeYYNrcgYsJ4k+L9siBYmQTQ0eDTMZnV0DAIgld6IIwpQzVgqck4OkMKqIU
         /3VLxM5gesacNgQb+xJvwiYCJlkJo+otiYbTDM4FHwJsP0PPF+99adYkJcRGQFMusAj7
         A1nsRUaYr3fq418frSDFK5A2flAytZsgbP9guJaay9ltziVFV/niql5o9btvpKxh/jSC
         VNauOb/SVPjt0kloJafPjWjmJDqVnKoe38AY3McrBp49oAlX9GbucSFSM3V4wManUoZ+
         O5ag==
X-Forwarded-Encrypted: i=1; AJvYcCV9npyNlEq35adZ6lyaJpuf3RHjHxe86pYAR6jEsIA+S1p7d4sVCCYDRmHDRE1Bb3/nkM3nJI/EbRrtgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwLLhJN1ScglbByDw8/ynQvTuroTBGf1cypFXCl3tPm+9E7N3P
	W2/y1HmE6HTpDXdjY/vBwA/knElW5uB+sgQHlOZ+XI2qAoUZL7fUZY5k1BMjn5ftZrSpfvZZLkN
	bXeybgjG99azOJMCq+oOT6Hdvx/0g2hk=
X-Gm-Gg: AeBDieva00RhVdJ97nWW7EJLOAmUcAoVM4FAXhj8VjldavfYcmPt2agck/y5GNsIgX2
	RQiZ0c5HOUPHOhcarMyVtxxAOXGqCJS9ZZQHBn9Fhd3TEBywAP+f06HXw5/KhpdzwSucub6/+Lt
	z9PJuGRuN9lIJx+aA1CXdNa8e3MlmOvcHIuWEsBVHnLyNARmfqCxFnm8a17v6MOVN1/cXcQFuAG
	vzPjiiGAWOYrGVM+gLYHj+e8CxWT8Dll5VYgbHpD2q1z6LhyP5jzWK+mezYz+Ft/ApLVlmadBow
	O+U8JVji41pakHU5v4s1eyk/mKlKxfNJPhB4dlehcwOa3DJwj6fIpO+cQu/mGDPKsGsnHnRkbdX
	INpQ8W4SWcEg5KQiN551AOyw=
X-Received: by 2002:a05:7300:dc88:b0:2c6:7f49:a862 with SMTP id
 5a478bee46e88-2cbf9afb2abmr2166610eec.2.1775417758303; Sun, 05 Apr 2026
 12:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-24-ojeda@kernel.org>
 <177508434465.73816.4492182082440539007.b4-review@b4>
In-Reply-To: <177508434465.73816.4492182082440539007.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:35:45 +0200
X-Gm-Features: AQROBzAMmQ2fYtLyUeAFSvUDsVE_iEOg6GKNUQ48f6LlPWNoSXcMUKGWx0A_W0I
Message-ID: <CANiq72nqenC30r7QQAmdKxS8ehGU2SoSGr+LCnoTAGLegH-KnA@mail.gmail.com>
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned packages
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
X-CRM114-CacheID: sfid-20260405_123559_196437_EB174FA3 
X-CRM114-Status: GOOD (  10.82  )
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
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gUlVTVF9MSUJfU1JDIGlzIGFsc28gbWVudGlvbmVkIGlu
IHRoZSBuaXggc2VjdGlvbiwgZG8geW91IGtub3cgaWYgaXQgaXMKPiBzdGlsbCBuZWVkZWQgdGhl
cmU/CgpZZWFoLCB0aGF0IHdvdWxkIGJlIG5pY2UgdG8ga25vdy4KCkkgdHJpZWQgb24gbXkgb3du
LCBhbmQgaXQgZG9lcyBzZWVtIHN0aWxsIHJlcXVpcmVkIChhdCBsZWFzdCB3aXRoCnRob3NlIHBh
Y2thZ2VzIG1lbnRpb25lZCBpbiB0aGUgZXhhbXBsZSkuIEJ1dCBwZXJoYXBzIGEgTml4IHVzZXIg
a25vd3MKb2YgYSBiZXR0ZXIgd2F5IHRvIGRvIGl0LCBhbnl3YXkuCgpTbyBJIGtlcHQgaXQuCgpC
eSB0aGUgd2F5LCBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gaGF2ZSBhICJzdGFuZGFyZCIs
CndlbGwtbWFpbnRhaW5lZCBgc2hlbGwubml4YCAob3IgYSBmbGFrZSBvciB3aGF0ZXZlciBpcyBi
ZXN0IG5vd2FkYXlzKQppbiB0aGUga2VybmVsIHRyZWUgc29tZXdoZXJlLCBpLmUuIG9uZSB0aGF0
IGlzIGtub3duIHRvIHdvcmssIHRoYXQKY292ZXJzIG1vc3QgdG9vbGluZyB1c2VkIGluIHRoZSBr
ZXJuZWwsIGV0Yy4KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
