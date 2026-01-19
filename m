Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35B8CCF2C5
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AV4By7QD94KHY6cpSrEBaKDiWbWDKst6y+WDwoAyUc8=; b=LXbiy0G/Pgb0Lv
	TXjCdKt2eaPoAvQEBIaA/gD8TMQH+Usbn01MYbYcYoY41QOeJ5d/NP8v44ILEu7EPLJ8kx8M4ZFWW
	pCmfuVUNNTWlBY7SMlXwtGgwyGsyjGJwp/1yqJrKFCeT73pHvr+5mrHUjvMlvn1IuGr47PuNsDEGz
	9a8jdGZ7a14sJzKf9JozkKPzindTj2SqGuIzwcNRuoMa6dIBvCcXBNlr2+1P17ny09dHb6Gq2YxIP
	BLCwpAmUnWMba9n+ooslftekemiOW1+yx1PV3VBLfO8NBZGzaXF37h3T5Kn3mUD6y+lqICe4kuT5G
	WkPX6Dl4W2i0/3FlCpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhl7X-00000001b32-0zpS;
	Mon, 19 Jan 2026 09:00:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhl7T-00000001b2b-1Lkl
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 09:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A556F43ABE
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 09:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85670C16AAE
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 09:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768813218;
	bh=b4DKBljiuvLP2VvxJczezy8Zoho9aAPyQ5HTEMJLwpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KmR5CeMmwQPLkLqj4otLvIuU8O5zW8CnNwPjRVWZNnqnPbyiP7YQW/I/h6DweORwp
	 B+V9uabzHdzN+6WR8AU3Ipk6MBhcgKT3RfSN3L6RQksguUBkEeCGQMCr9xKCLXHFBK
	 fZN9++TjMNPVJx3YkVTefeLStzgMScJ3OIfyNlPB3ep8beiwc6DA6UtEp/X2QoGbMd
	 eb81YNGxgls8FPgqLBtrvH+CN995ta9vGXm21u7v6M5wUXOuUzVc8U2mPHgdgaQZIE
	 M9QjsVvXwOiiwnlh6KAE522erRloaj0zp8FyjJdjwgzZGe6jNR/+4F/ll1hmaxn5n+
	 nTub6wCdFuG9A==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64924c40e8eso983323d50.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 01:00:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU2dXesujtYrBb+VQHGzmdt5ddW3LwhUdITQEZC+Amwm3VEnRTbMnrHoDTwM9LseDgWA99PF82vsL1mlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcvLYHra4FS/bwezhmagDnocIlUDuYXZlgy3ZqXivHrDeq3uQj
	2JGS/IcfSUinwcVEdvN1k0rr5nfGZ7nYqdGTsxoLoOxh8zXyJ/PsvZeou5ycRK9Pd2mWliPm3qQ
	EG/2UA+e5K9VPFzQCrdvljuGswWTOnpM=
X-Received: by 2002:a05:690e:4092:b0:649:1463:c983 with SMTP id
 956f58d0204a3-64917722e2emr7655356d50.62.1768813217893; Mon, 19 Jan 2026
 01:00:17 -0800 (PST)
MIME-Version: 1.0
References: <029e5e79-ae9c-4d31-b75f-8f48f359d539@muenchen-mail.de>
 <aWk59MT8yWcxiYKr@x1> <0733e741-ec63-4419-a08d-50b70210361b@muenchen-mail.de>
In-Reply-To: <0733e741-ec63-4419-a08d-50b70210361b@muenchen-mail.de>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Jan 2026 10:00:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLkmeEoynOurZoSB_sz0XfJupiJcLPyWqbTe6fQFpYJotQ@mail.gmail.com>
X-Gm-Features: AZwV_QgrT3dDiwcF08wjUUfN6XQYaWlRXYCz0muYmQRZI8OcWh4fusv65038FzI
Message-ID: <CAD++jLkmeEoynOurZoSB_sz0XfJupiJcLPyWqbTe6fQFpYJotQ@mail.gmail.com>
Subject: Re: Typo in pinctrl-th1520.c
To: thomas.gerner@muenchen-mail.de
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_010019_578169_6CC33317 
X-CRM114-Status: GOOD (  17.39  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgODoxNuKAr1BNIFRob21hcyBHZXJuZXIKPHRob21hcy5n
ZXJuZXJAbXVlbmNoZW4tbWFpbC5kZT4gd3JvdGU6Cj4gW0RyZXddOgo+ID4gSGVsbG8sIHRoYW5r
IHlvdSBjYXRjaGluZyB0aGlzIGFuZCBwcm92aWRpbmcgYSBmaXguIFRoZSBjaGFuZ2UgbG9va3MK
PiA+IGNvcnJlY3QgbWUsIGJ1dCBJIGJlbGlldmUgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIHdp
dGggdGhlIHBhdGNoLgo+ID4KPiA+IERpZCB5b3UganVzdCBwYXN0ZSBhIGRpZmYgaW50byBhbiBl
bWFpbD8KPiA+Cj4gPiBJIHdvdWxkIHN1Z2dlc3QgdXNpbmcgZ2l0IHNlbmQtZW1haWwuIEtlcm5l
bE5ld2JpZXMgWzFdIGhhcyBzb21lIGdvb2QKPiA+IHRpcHMgYXMgd2VsbCBhcyBOaWNrJ3MgZ3Vp
ZGUgWzJdLgo+Cj4gWWVzLCBJIHBhc3RlZCB0aGUgcGF0Y2ggdG8gVGh1bmRlcmJpcmQgYW5kIGl0
IGxvb2tzIHRoZSBtYWlsIGNsaWVudAo+IHJlZm9ybWF0dGVkIHRoZSBtYWlsIGR1cmluZyBzZW5k
LiBIb3dldmVyLCB0aGUgZml4IGlzIG9ubHkgYSBzaW5nbGUKPiBsZXR0ZXIgYW5kIGNhbiBiZSBk
b25lIGVhc2lseSB3aXRoIGFuIHNpbXBsZSB0ZXh0IGVkaXRvciwganVzdCBjaGFuZ2UKPiBRU1BJ
MSB0byBRU1BJMCBpbiB0aGUgbGluZSBvZiBwYWQgOC4KPgo+IEknbSBuZXcgaW4gd29ya2luZyBv
biB0aGUgTGludXgga2VybmVsIGJlY2F1c2Ugb2YgbXkgQmVhZ2xlVi1BaGVhZC4gTmV4dAo+IHRp
bWUgd2hlbiBJIHNlbmQgYSBwYXRjaCBJIHdpbGwgdXNlIGdpdCBzZW5kLWVtYWlsLgoKV2lsbCB5
b3Ugc2VuZCBhIHByb3BlciBwYXRjaCBmb3IgdGhpcz8KCk90aGVyd2lzZSBwZXJoYXBzIERyZXcg
Y2FuIHNlbmQgYSBwcm9wZXIgcGF0Y2ggdG8gZml4IHRoaXMgYnVnCnNvIEkgY2FuIGFwcGx5IGl0
PwoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
