Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4250FD2ED11
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbuLfNqF84dROiPlIM2qKb3QivxYdh8zzUNDlJDJaic=; b=H28M07UszN0jdC
	7aC4PtBO5kT/7wV5PEb8HlD0l+dsvv51noTIr2i9A4wkZdiusHcAAv7u24OgLf3FERRxfUnoRIu/4
	/ehGU1sOdN9h3J+f0h/pQ7D1FFBuJ/rYBJSbiRu6i/p7ai6a2ZbuUPsXQ6Iy3zx/gQYnbiS3ViZz7
	0su2sAG6cgnEgWIXvBzp788AwIOUKpQ8JKdbQVsZhR+EAKAsXBivz7DgEIKflf4EmysCiGHGxWAK5
	L/+TtvgId48NkYGJUQ3atD0QHxGarGBEJDfroJVQwv6lPg4cv5Olc0zuKJZ7c7xaUgKIcVd3xbH6Y
	ee8cdk5A1XbWyvb3vYPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8hU-00000003aJI-2kQo;
	Tue, 20 Jan 2026 10:11:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8hT-00000003aIq-0wz1
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 10:11:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52B196011E
	for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 10:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B120C16AAE
	for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 10:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768903862;
	bh=mfa8z5RfKXPAS4wZuyN6R1BkYiqbfqVBr92qKhxryZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KeenIgtzqd5UftBQWxNfqVPdJEpd/T7+7ktSej8KjCu82FhhNElPZQfOJwJqj8Owx
	 jVz8fBZ+J52icT7ht0zW9/tQK7iL94VQ15Nc+5jFMFoW1x/ZBH7aPhcOzUeC83ZJpG
	 jxWQlojtDPKq6/CdgAQZ+qWry3dDt5HSTufvXxA9tlPQ/p2hLld1D5lGhhRep/5VIt
	 o/ahpx385DGlG2sj0+wDwn0YHsVQbzN6tAqF1yCYuo0CZBvtZmjZQ4NkzK+Q01zNk6
	 SsjbGenisLDapInnfg7jJscrgn+7zaKrm9fGd4i4JukeCT3qOi0yK8aJQkdefzeAcE
	 L7JwI7rKLctag==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6466d8fd383so4864459d50.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 02:11:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW/IV/9Y3FB3f73C72UrY+HMxE5IDozNb4lHQ/4siM8mJ6vbWTDfbxwiQ24eLLYJ0J7fprxyEFFFmUasw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiH2zmTer7sp/HLRmpgCm1WB/2k/zht1rUSUgNARmPEj34Cnp+
	4T8loU/bGdiGjBtLYxg4bZwL8bS/iTlGgOSXkEPxMvVXnm1ZcEoDmSS0Dcmfpvun1BGt78C3zv7
	yoUUk+Apm3JiotDXZxS41yhgsc6KkDYQ=
X-Received: by 2002:a05:690e:dce:b0:640:d174:3839 with SMTP id
 956f58d0204a3-64916486fa8mr10877674d50.36.1768903861459; Tue, 20 Jan 2026
 02:11:01 -0800 (PST)
MIME-Version: 1.0
References: <029e5e79-ae9c-4d31-b75f-8f48f359d539@muenchen-mail.de>
 <aWk59MT8yWcxiYKr@x1> <0733e741-ec63-4419-a08d-50b70210361b@muenchen-mail.de>
 <CAD++jLkmeEoynOurZoSB_sz0XfJupiJcLPyWqbTe6fQFpYJotQ@mail.gmail.com>
 <20260119135553.145092-1-thomas.gerner@muenchen-mail.de> <CAD++jLmyweD1Y1E1qONC41sPF+ZE4ajh=UvT7OeX_0DJPJsLZA@mail.gmail.com>
 <20260119152004.166749-1-thomas.gerner@muenchen-mail.de>
In-Reply-To: <20260119152004.166749-1-thomas.gerner@muenchen-mail.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Jan 2026 11:10:50 +0100
X-Gmail-Original-Message-ID: <CAD++jLkSp73aw2VLpz2EcFS8a5VS_u5d0pQE+AuR_=jxs2qf5w@mail.gmail.com>
X-Gm-Features: AZwV_QhZFk4dZ5IgYgB6Lyav3bP4p8faJ47pXe35pRmke7oIO-QiMTlgQTmeZi8
Message-ID: <CAD++jLkSp73aw2VLpz2EcFS8a5VS_u5d0pQE+AuR_=jxs2qf5w@mail.gmail.com>
Subject: Re: [PATCH] Re: Typo in pinctrl-th1520.c
To: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	linux-riscv@lists.infradead.org
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgNDoyMOKAr1BNIFRob21hcyBHZXJuZXIKPHRob21hcy5n
ZXJuZXJAbXVlbmNoZW4tbWFpbC5kZT4gd3JvdGU6Cj4gT24gMTkuMDEuMjYgYXQgMTU6MzIgTGlu
dXMgV2FsbGVpaiB3cm90ZToKPiA+IE9uIE1vbiwgSmFuIDE5LCAyMDI2IGF0IDI6NTbigK9QTSBU
aG9tYXMgR2VybmVyCj4gPiA8dGhvbWFzLmdlcm5lckBtdWVuY2hlbi1tYWlsLmRlPiB3cm90ZToK
PiA+PiBPbiBNb24sIDE5IEphbiAyMDI2IGF0IDEwOjAwOjA2ICswMTAwIExpbnVzIFdhbGxlaWog
d3JvdGUKPiA+Pgo+ID4+PiBPbiBUaHUsIEphbiAxNSwgMjAyNiBhdCA4OjE2IFRob21hcyBHZXJu
ZXIKPiA+Pj4gPHRob21hcy5nZXJuZXJAbXVlbmNoZW4tbWFpbC5kZT4gd3JvdGU6Cj4gPj4+Cj4g
Pj4+PiBJJ20gbmV3IGluIHdvcmtpbmcgb24gdGhlIExpbnV4IGtlcm5lbCBiZWNhdXNlIG9mIG15
IEJlYWdsZVYtQWhlYWQuIE5leHQKPiA+Pj4+IHRpbWUgd2hlbiBJIHNlbmQgYSBwYXRjaCBJIHdp
bGwgdXNlIGdpdCBzZW5kLWVtYWlsLgo+ID4+Pgo+ID4+PiBXaWxsIHlvdSBzZW5kIGEgcHJvcGVy
IHBhdGNoIGZvciB0aGlzPwo+ID4+Pgo+ID4+PiBPdGhlcndpc2UgcGVyaGFwcyBEcmV3IGNhbiBz
ZW5kIGEgcHJvcGVyIHBhdGNoIHRvIGZpeCB0aGlzIGJ1Zwo+ID4+PiBzbyBJIGNhbiBhcHBseSBp
dD8KPiA+Pgo+ID4+IEkgaG9wZSB0aGlzIHRpbWUgdGhlIHBhdGNoIGlzIHByb3BlciBmb3JtYXR0
ZWQuCj4gPgo+ID4gTmFoIGl0IGRvZXNuJ3Qgd29yay4uLiBidXQgSSBjb3VsZCBmaXggdGhhdCB1
cCBpZiB5b3Ugc2VuZCBpdCBhZ2Fpbgo+ID4gYW5kIHByb3ZpZGUgeW91ciAiU2lnbmVkLW9mZi1i
eSIgYmVjYXVzZSBvdGhlcndpc2UgSSBjYW5ub3QgbGVnYWxseQo+ID4gYXBwbHkgaXQuCj4gPgo+
Cj4gSG9wZWZ1bGx5IHRoaXMgdGltZSBldmVyeXRoaW5nIGlzIG9rYXkuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgR2VybmVyIDx0aG9tYXMuZ2VybmVyQG11ZW5jaGVuLW1haWwuZGU+CgpGaXhl
ZCB1cCwgYWRkZWQgdGl0bGUgYW5kIGNvbW1pdCBtZXNzYWdlIGFuZCBhcHBsaWVkIGZvciBmaXhl
cyEKCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
