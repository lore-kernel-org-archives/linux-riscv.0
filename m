Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF2C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 19:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OiWNBTEpNyDtA+Xo6+H7Mgc2tUwYRDDk3iWioLbTKw0=; b=BVMWEzQVPMBx6a
	RKJZzcb6bC+WjsKNZbiKqv/I+OVwsI4dR+G5w2Mkgmw2lglr18OSfN7E/u+bK2PUtz5tXol3WB/e9
	vvJPbGDFuCwc/pjNdyDZRI31xmEfncymaRBPU/gDccdaUfxRWUyUrCvssNYu4Cvtqpc7vIXrz6cwi
	IBle7NdctBXPdtLQB5iFwLIhbjunu+xxr43EkkuXwhIC4DGk+Zmn8L5Q/xTrEu7scADplrkunR7Al
	6vU8Yvu6iAFoljylfab9nQUC9hml4JDUFzqaAMV3RcQyaGzxmqKNKrkLWawcnFWXUumlebcVYnQ6k
	qXBFw95BrGyK9mKm8Xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGWA-00Eavn-Ry; Mon, 06 Mar 2023 19:29:07 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZGW7-00EasY-LP
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 19:29:05 +0000
Received: by mail-yb1-xb34.google.com with SMTP id e82so9303674ybh.9
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 11:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678130938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ttfPrW0GRQ9nbvMrVtjoiB2Knz31FGcqjmMbmblOGw=;
        b=SU2Xcpc8fy/jDn5Hq/sgA44RX6PMSz8Z/CGlbTyvJvLrVhvSx8x2b1d6eRLg5UuFBZ
         9eVJz2MI5oZX+kbqnjMoreoLj9gtAXJEVmsGQH9WiYH5SIAaxVOwcUykaRPeUNNBY40Z
         p6N5Gg6h45DIpjQLit8V41JA6snJWQUyo8I+WomncvbRMQ/Q1RKTSADQcVgXWYMWXW3U
         BANkIPKJO9EOekb2ftXDbgdEMXarRb//A/+hqBYV49Ckk/3AGLVxvnH3CoiHh7ycyQEx
         DZ0cS4Sn1p/f5m7wcYMPv3Iio7GI4kQP1JdUN7MUomAf4xMjU4WiVFbT47UReR3zYTHi
         Sgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678130938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ttfPrW0GRQ9nbvMrVtjoiB2Knz31FGcqjmMbmblOGw=;
        b=NBZmpLO2aDhNg1P5NEj5+CMnj5v35m1HMQSJ8WYM795/PYEU/Qr4wTS9Vg5GgPlZqm
         F9gbkBaVGo9Kb1aY77veiacL7qUnVTJVGBVtUOa/CnwugPRvUig6xEuMcoUg3BhCoX/n
         mhbElPHUo7yhZXMZ6y3BBg33dWydB5UdiQICIRiw68s/XtDFXYL+/UUHyIg9ZGkq4AhU
         6gXDkELud/mX6kjpIOGrDTDG5k3QKIGv7OXyj5yGgJxzlQ1seC2zS8APcR9/WfGZS24M
         GKeJuTiUIAM6QGUKG9snkAB6RigA3pp/76eu3pIBhgKic+jiJa0GSwGkNELlV92COpIA
         YBuA==
X-Gm-Message-State: AO0yUKU+iPScB3xKU03heYEMySBHneF7sL4gXR19kZpr/iJGiyT3PIPL
	wrY81Xt0RcwQNlGQ5YnAHfb9q8paqs0L6WmlrdY=
X-Google-Smtp-Source: AK7set+Md8UTQSh/AP0LixVNnGi65tvY4YYP3IbXzgyvl8DJUVpm6e49kNmGaSXZTytFJEf4T12wESB3k1aIa0rjZuI=
X-Received: by 2002:a5b:191:0:b0:a6f:b921:cded with SMTP id
 r17-20020a5b0191000000b00a6fb921cdedmr5516798ybl.2.1678130938238; Mon, 06 Mar
 2023 11:28:58 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72ndkF0JM1kV=ewnO4uGirDowHDGLkhvjQgtLnuPEk_hTQ@mail.gmail.com>
 <mhng-a7ada57e-543c-434b-a4f3-4fbda9238eb0@palmer-ri-x1c9a>
In-Reply-To: <mhng-a7ada57e-543c-434b-a4f3-4fbda9238eb0@palmer-ri-x1c9a>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Mar 2023 20:28:47 +0100
Message-ID: <CANiq72=hvS6KxxkLocFOrU4E4pNi=y4OuJLm3iSiPGmi5B178Q@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: gary@garyguo.net, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_112903_739516_4EECBFB2 
X-CRM114-Status: UNSURE (   8.43  )
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

T24gTW9uLCBNYXIgNiwgMjAyMyBhdCA4OjE44oCvUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4gd3JvdGU6Cj4KPiBJdCdzIHRpbWUgZm9yIHRoZSBuZXh0IHJlbGVhc2UuICBJ
SVVDIHRoZXJlIHdlcmUgc29tZSBhdXRob3JzaGlwIGlzc3Vlcwo+IGhlcmUsIGRpZCB5b3UgZ3V5
cyB3YW50IHRvIHJlLXNwaW4gdGhpcyB3aXRoIHRob3NlIHNvcnRlZCBvdXQ/ICBJIGNhbgo+IGdp
dmUgaXQgYSBzaG90IGlmIHlvdSB3YW50LCBidXQgSSdtIHByb2JhYmx5IGFzIGxpa2VseSB0byBz
Y3JldyBpdCB1cCBhcwo+IGFueW9uZSBlbHNlLi4uCgpObyBwcm9ibGVtIG9uIG15IHNpZGUsIGFu
ZCBlaXRoZXIgd2F5IGlzIGZpbmUhIFRoYW5rcyEKCkkgdGhpbmsgd2hhdCBpcyBpbXBvcnRhbnQg
aXMgdGhhdCBHYXJ5IGlzIGF3YXJlIGFuZCBhZ3JlZXMuCgpHYXJ5OiBkbyB5b3UgcHJlZmVyIHRv
IGJlIHRoZSBtYWluIGF1dGhvciBvciB0aGUgYENvLWRldmVsb3BlZC1ieWAgYXV0aG9yIGhlcmU/
CgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
