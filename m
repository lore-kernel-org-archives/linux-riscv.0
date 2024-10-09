Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5384ECEDD90
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 12:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PTYOYvs0RxN+Iv5M/Sjxg16ln7G2Rbk5zNu8Ljolt8=; b=ftnwVpsG9guZdy
	upYVD/CSPV4igDkODS2DkBVX2XSPziT4eZnqxJQu9U0Sza/IK3Izf3d908zjsVokdsfmKIr+AkM8B
	UrMSlrsyBIPpALzR5+X1/h0Nvsuv8Sks/rnYcF5x64AKX0i4my5sjiqImyxSjl+etvrxxPahPCMn7
	rkKxTRTBlrOcQiJTJ1ThVHn2JfnyJFYg5RlQ0tGL42F1Ot46C9tyl4qxIIXFEhLgoieZ7UWJqvDvB
	h1jCAEmpNep1PyMp7FPTZd1HTPKNZdKPmjA+phdyuTv/NWhPLB5hDAuiAtnrBJ6AabND/79xFFRYS
	wzJE3bOXeE0pNgqTr1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWCM-00000009J2q-1prM;
	Wed, 09 Oct 2024 12:53:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWBS-00000009Iox-11Ep
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 12:53:09 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-717839f9eb6so772671b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 05:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728478372; x=1729083172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSc/Qq+bUA6UejdQbu4RGQAgtovd3cNA8kyAjwimp0M=;
        b=Kko/XFm9Jjht66BUZrdyP5uFW4rHZfEfFF/GvwwMmkNfUeRoNeP5OfqTPG/ZONjkCJ
         hekwbANqkSecve34mrl96x6L8gaftNn3YC/AQfDpCNvQ0O5qHXBoWkNvOHeklA9+3Zu5
         8Pu1Nr73OxXH990h72GTR6i85MUGGun9N7dP4WG54oBeb2y7juhuqq6bivrF2MBVtqW6
         zfYCpfp+SRNnExBJDOaB/XMrUNugylqO4NsafSHMaxIiN18WR76OYEfBpnsC6SrmLJ41
         pWcYSEqMsFb1uVvtYPgpt2it0r/2TiysL6OdJnEVBvtbmDoekwODJNwdKghkSAXZ1394
         A9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478372; x=1729083172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSc/Qq+bUA6UejdQbu4RGQAgtovd3cNA8kyAjwimp0M=;
        b=Ee1Bjad1GBlLZ4GyTSp0U/iIR1vwG0nXR1jYb2dRd+m18k0IpFjnA2PSWVBnsL83fz
         C2kqyttqxQ7ooXNjHfq4SSwylvoXvBUf1c4cVtQu7vfWMYw7S3g+srxMqJfW3PyC8bgU
         yJ6+4/5DplNvnrHtKKS+vCYYmabZcO6Mh9dZRUeXLm2E4KiAfzV2Pe0kTJ48X3f8VoRd
         LAVCKuUY+Vu2dj38BdDamhcMre0UPGC8ZmXErTqBQN6Q5PCOPe6Pxr22Gx1ISZTIS4su
         LuYTp6tiwK71FfjL8hAm/n1y1hoAVuEKKYzXFW3nYFdT5VpiGGazgODx16nYcu4EzHw6
         oQnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBwSCYBaLWvr1+UTjYHZ2+Gvz4p6LJStpBmjI6tFukS1LbN0sYgmHQjraIGBfZsIr4LjDWxe5CvmqHzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwROt9NWtczeH4hNZm1K+Kw6bmaeX8GNbmVDXMigNMv9LsuJ9er
	2rDSJNoNu2ykII7ja85yGtjgUED2pif9xw74HN/S5xWZCKEPnxywulS6sCPQhCWY9pFMirs1O/m
	ebm1MxouW7mA2mbjj3NskaB1Y+bA=
X-Google-Smtp-Source: AGHT+IGDZlk0vSxNbCEp4HYgbqEEEFHlGnksvL3nu9Tb4gLrogFMgZPPcAKSAMsknVA0x9W3GfxEWQHF/YqSRwqrI40=
X-Received: by 2002:a05:6a20:3948:b0:1cf:308f:f87b with SMTP id
 adf61e73a8af0-1d8a3c08378mr1749012637.4.1728478372129; Wed, 09 Oct 2024
 05:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
 <250e1e5d-5110-414f-abbd-fb002e715f32@ghiti.fr> <c4906bfc-5bc1-428e-a76f-3fb0bb8711ac@ghiti.fr>
 <20241009-tamale-revisit-7d2606c5fdf3@spud> <850ede17-6eb3-4269-bec6-2a2a0a629eee@ghiti.fr>
In-Reply-To: <850ede17-6eb3-4269-bec6-2a2a0a629eee@ghiti.fr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 14:52:39 +0200
Message-ID: <CANiq72mZh+=18tWY8E5xA18E0SRQGO+ApgR9sU=+3b9jrVGTDg@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
To: Alexandre Ghiti <alex@ghiti.fr>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	aliceryhl@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_055257_074486_04266B10 
X-CRM114-Status: GOOD (  11.86  )
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

T24gV2VkLCBPY3QgOSwgMjAyNCBhdCAxMDozNOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBPaywgdGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb246IGRvIGNo
ZWNrcGF0Y2ggYW5kIHRoZSBkb2N1bWVudGF0aW9uIG5lZWQKPiB0byBiZSB1cGRhdGVkIHRoZW4/
IElzIHRoYXQgYSBrbm93biBpc3N1ZT8KPgo+ICBGcm9tIGh0dHBzOi8vZG9jcy5rZXJuZWwub3Jn
L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWw6Cj4KPiAiSWYgeW91ciBwYXRjaCBmaXhl
cyBhIGJ1ZyBpbiBhIHNwZWNpZmljIGNvbW1pdCwgZS5nLiB5b3UgZm91bmQgYW4gaXNzdWUKPiB1
c2luZyBnaXQgYmlzZWN0LCBwbGVhc2UgdXNlIHRoZSDigJhGaXhlczrigJkgdGFnIHdpdGggdGhl
IGZpcnN0IDEyCj4gY2hhcmFjdGVycyBvZiB0aGUgU0hBLTEgSUQsIGFuZCB0aGUgb25lIGxpbmUg
c3VtbWFyeS4iCgpJIHRoaW5rIEdlZXJ0IChDYydkKSB3YW50ZWQgdG8gY2hhbmdlIHRob3NlIGRv
Y3MgLS0gSSBhbSBub3Qgc3VyZSBpZgp0aGUgaWRlYSBpcyB0byBnbyB3aXRoIDEzIG9yIG1vcmUs
IHRob3VnaC4KCkluIGFueSBjYXNlLCBldmVuIGlmIHRoZXJlIGlzIGEgY29uZmxpY3QsIHdlIGhh
dmUgdGhlIHRpdGxlLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
