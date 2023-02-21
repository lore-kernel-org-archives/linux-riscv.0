Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95EC2C64EC4
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BHZTHwDfg3FF7w8+Oq4dGl22FtB73h20vDaeBoNWz6g=; b=sfjPf73X8QFwFJ
	8GsL5OdfS8LyXV9jRRFyuCIObm3nOdUb1Nd9z4bJxQG7amcq1kgtYtW403QXlimciux5RqZsKoRoE
	tABtrYBeXQ52ylXIgXgUdeFOCNrX0xjMjafuxuZh/JrD/2XHM0hI+/3Hq9EnpNjt4OLi6D074SVyB
	obSoIpNH25LcK5cHYTmsKoeHWXl3uGF5QgC1JzROi/vexdp41IgpD9rnHEeH3k2FHyELJ3ldrx/+Q
	OJoOrzYUebdTrOU+Dmuw9O/wbn8vNR5u8fj28AuRfYiv4xvnw0Vm8vJAb5FGKiP65QjwnLgPxN8jg
	9DShKQ5TJsA9ySkiOfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQRH-007UmE-8p; Tue, 21 Feb 2023 11:04:03 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUQRD-007UkH-Iy
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 11:04:02 +0000
Received: by mail-wr1-x431.google.com with SMTP id v3so3890941wrp.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 03:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nuii1O1uXqWSPb5QmokeXfWS5vvCDyLzlvaBL4q0jA=;
        b=ngKsUA1fri3dXJyo2WTKtv8pm59KVoqPZ2+wgww4/qt+B18+838Nmg8/c4vLBr8Hb1
         RrX1cr3XacBMEm9yDpKinYwiGx29E1SG3yprab9xqBXSQ0XdjH111hptHlJfYXd4cSJM
         A66sA7XajwTLYsjkIH0ol67ql3xA/ewCbNi4Jt/kRnQ7q4nziMVFfRCk4QojMaH9BUod
         BnH6pjZropMvQdyfC2WLB4qreyNQGpzkQsxsB/54Rqxl/zV3+vISHw4F3/zjfP1n+W9s
         9MIvCr5vXXQSFyvV5Vxc7tJlMX9oFfYicNUjTpP8RKs+atZKPBXTbjx7KdGMOLiNAUo/
         YiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nuii1O1uXqWSPb5QmokeXfWS5vvCDyLzlvaBL4q0jA=;
        b=GBPSa1//d4t9vHPLsACBNQunCZWVCo0QLTSZ1jPSzQjrjSgJxi25y8e5xpg6g3ctIF
         ydljHgLOprZeiWf5o5U61clVkSqMWHnuifrrPnRDQy2fmUtIPoTLYzBbqvPyRT47y5fp
         cSuz/LqTqfu5vdZEDwiEScTuKbteX5QZ5MECFk05OZUdxQxZ9BAsHt3mlK4RwQBzLwEB
         6egs/dqrfGIEE+mR2ETQrg76M6mloo9EI5B4iEr6NkTNbUkWwWJh4AWpiFopQpjoswZE
         Sg1qwGsW0pRNkcRGXmcX3INCzFpNmYlJnRyj3pH9FEWpETAk/Wl3yEZQrrV4TqOy/pxR
         Tj4g==
X-Gm-Message-State: AO0yUKWKQ4Ko739I9lhuloyhT+HRC9Prz4SZwMsHYApcJxB8zWEw+pwi
	O1XA0VeK6IOGXPjQxWY8MciNFpeebL7ymtN9E1v5Rw==
X-Google-Smtp-Source: AK7set/p0Op55W1O5D/4Ls2gp3wEI6ZwX06UJ6h/kCzp2F6pBHxE8g/N5Its7aG571Qjz7hLDLVIdY1hi3fybLfcBSU=
X-Received: by 2002:a5d:45c2:0:b0:2c5:5b2f:8c80 with SMTP id
 b2-20020a5d45c2000000b002c55b2f8c80mr350550wrs.318.1676977437766; Tue, 21 Feb
 2023 03:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20230128072737.2995881-3-apatel@ventanamicro.com>
 <mhng-0f9bdf58-5289-4db4-8fd7-38898824c44f@palmer-ri-x1c9>
 <CAEg0e7hrQFu+cdZy+3QO1ML9FNTPBehZwOOBnr1F-5ABYDnkGg@mail.gmail.com>
 <CAEg0e7hRjMSgYZbPTQztbQ3bGZf-r8wAfCK5ZnDXOcx27HcTCA@mail.gmail.com>
 <Y/Sfpb2c/LS0LCiA@wendy> <F80EBB4C-29C4-472D-B213-EFD220EF9B1F@jrtc27.com> <Y/SkES28TNBz02wM@wendy>
In-Reply-To: <Y/SkES28TNBz02wM@wendy>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Tue, 21 Feb 2023 12:03:45 +0100
Message-ID: <CAEg0e7i3=Zg5pxG4HCEfFkzpot5-u6yHoTSFKPBuCGU+djZ5uw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] RISC-V: Detect AIA CSRs from ISA string
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <apatel@ventanamicro.com>, pbonzini@redhat.com, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_030359_645797_8D0C7E81 
X-CRM114-Status: GOOD (  12.29  )
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

T24gVHVlLCBGZWIgMjEsIDIwMjMgYXQgMTI6MDAgUE0gQ29ub3IgRG9vbGV5Cjxjb25vci5kb29s
ZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIEZlYiAyMSwgMjAyMyBhdCAxMDo1
MToxM0FNICswMDAwLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiA+IE9uIDIxIEZlYiAyMDIzLCBh
dCAxMDo0MCwgQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6
Cj4gPiA+IE9uIFR1ZSwgRmViIDIxLCAyMDIzIGF0IDA4OjEyOjU4QU0gKzAxMDAsIENocmlzdG9w
aCBNw7xsbG5lciB3cm90ZToKPiA+ID4+IFRoZSBmdWxsIG1lZXRpbmcgbWludXRlcyBjYW4gYmUg
Zm91bmQgaGVyZToKPiA+ID4+ICBodHRwczovL2xpc3RzLnJpc2N2Lm9yZy9nL3RlY2gtY2hhaXJz
L21lc3NhZ2UvMTM4MQo+ID4gPgo+ID4gPiBUaGlzIGxpbmsgaXMgbm9uIGZ1bmN0aW9uYWwgdW5m
b3J0dW5hdGVseSA6Lwo+ID4KPiA+IHRlY2gtY2hhaXJzIGlzIHByaXZhdGUsIGZvciAoY28tKWNo
YWlycyBvbmx5Li4uIG5vdCBzdXJlIHdoeSBpdCB3ZW50Cj4gPiB0aGVyZSByYXRoZXIgdGhhbiB0
ZWNoLXByaXZpbGVnZWQuCj4KPiBZYWgsIHRoYXQncyB3aGF0IEkgd2FzIGdldHRpbmcgYXQuLiBU
aGlzIGlzIGEgY29udmVyc2F0aW9uIG9uIGEgcHVibGljCj4gTUwsIHNvIGl0J2QgYmUgYW5ub3lp
bmcgZW5vdWdoIGZvciBzb21lIHJlYWRlcnMgaWYgaXQgd2FzIGdhdGVkIGFyb3VuZAo+IFJWSSBt
ZW1iZXJzaGlwLCBidXQgZ2F0aW5nIG9uIG1lbWJlcnNoaXAgb2YgdGhlIGlubmVyIGNpcmNsZSBt
YWtlcyBpdAo+IGtpbmRhIHVzZWxlc3MhCgpUaGUgbWFpbCB3YXMgZm9yd2FyZGVkIHRoZXJlIGFz
IHdlbGwgKGFuZCB0byB0ZWNoLXVucHJpdmlsZWdlZCk6CiAgaHR0cHM6Ly9saXN0cy5yaXNjdi5v
cmcvZy90ZWNoLXByaXZpbGVnZWQvbWVzc2FnZS8xMjk0CiAgaHR0cHM6Ly9saXN0cy5yaXNjdi5v
cmcvZy90ZWNoLXVucHJpdmlsZWdlZC9tZXNzYWdlLzQzMAoKQlIKQ2hyaXN0b3BoCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
