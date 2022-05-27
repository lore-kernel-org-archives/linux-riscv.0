Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838C1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 17:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IV+/G5FrvaHyVyRyZe35ll2kKilqfDap2zRGo1xgLqA=; b=N7OQiDqpmYdOqs
	XAD3gZWNEYXU2FIZFu87ukP2OFVQmNJs0/HAT73B62h9vtv9KNq9VmbaNEjaSBdHr6XdwvBw+6Asw
	A7xHi9doeAT/xjtuTWECT2YPvh2+9Vorho8pVxfur7rtTzZnDZ3PT/MlyrbI4b7Rgr3ZdyAN/6vDH
	SwQxnRVjySBpTEYa5ZYydbflxrAoxezppdizNXJ5fbm/Zig2CwQjdzFxQgZqVrYy2Rp0ZUzVqJy0v
	NNCJbwjx6s1gc6nsvaryWsg6xlv/9B8Pg4pFdva9ljke6LIjtCaTiUC1sGqVLn34LJyGtR9F1XWwL
	8Z6Cd91W17caZa8aYtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nudNz-000ayB-FJ; Fri, 27 May 2022 17:04:27 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nudNv-000awn-Ty
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 17:04:25 +0000
Received: by mail-lf1-x134.google.com with SMTP id v8so7796408lfd.8
        for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=JndZRADLXoEuYMpvl6NdPiIxcR5VqDmpIIChLC/ZdPA=;
        b=jEmtTD8nJpoym6G/1dadazSPFlgrgg6DZNN5zOCjLiCfw6d8ocYBtrpT+L91hDi5ls
         MK+LqAaKftVfqu7tNHaZez5fXiQaw+2gDiXhvREfUjms97LiKfXY/TqpfBMjPEXInmm8
         ZH/l7b4t64H/njj5p1L+Bwj4dyldFESGz/6+yJhssRObXyTXd3VR4f/A2hfSRimpRVo0
         W1AXleA5CmPZReHghbqvJOdVaWOv5VBVt5CsGspqvr/dReJQEJ/zDpgabY0CYys5TNXj
         KOzxKgNuQv72aHWHHmXIu0hZzbZDLW4bs+TuK1G29Cu5tbEjXE65wGX6pp9Lf3Iiq0ar
         H1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=JndZRADLXoEuYMpvl6NdPiIxcR5VqDmpIIChLC/ZdPA=;
        b=tk2n40KoRL094kWSNq90sIamxFgmEoBkGpfE/dCVRyodOUckWfjhBMS3QJvigCYhL2
         +3RSBF4Inl7ca3ojB4xEIwLGJ/aKpLNDB9Em6xiXj9K40mYgUHVqB/l1uUH5dgdaKdDn
         uyV6d13UYsno5GP+tCKtB6pwutQejIkzzRWDjg3KmkNQKZbHGnTtSn0ut9MUWsOadUFz
         vDxbDlgQMeCVV5QHX9Azd8f5rlYb5fQeGrV8IxU3p44e1vlIKS+OZidgY++z4EENSEHs
         9f1bWtd4Nt6AD6hI528Mlc7SJeDMW36LNEOLlZM9mBmUkz8DM9t9QIlBumIiJmLaLkcb
         08eQ==
X-Gm-Message-State: AOAM5314W+6dptK/3v9XZPxK7XvFr20sVjf+Pi1EDhXmelyZhpIyMeXu
	ohwJqdMx/XDV/VEcMQ08aT1wPS5B2K6NuOsf6xee2Q==
X-Google-Smtp-Source: ABdhPJzIBmaH3vQMV7prGP7HMUkHtZXnxABZMHGnnlf/r1rHICt0d45Yypwh/FvQC87EOBiPfYlbt4gXCmgiGGdwmdU=
X-Received: by 2002:a05:6512:3c94:b0:477:ba25:de54 with SMTP id
 h20-20020a0565123c9400b00477ba25de54mr30752000lfv.137.1653671058843; Fri, 27
 May 2022 10:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d0437b05dffdd1de@google.com> <CACT4Y+Y8DOKJtwhRsyNT7G26C3Fx_oeibpXn43Ks0RtYYdZG3g@mail.gmail.com>
 <36f4745f-0e47-4f49-8f4e-ff7544f163d8n@googlegroups.com> <CACT4Y+Zy7wLdeRCa+ZH-swo9ut=U6pEk4rP461QE1m-gT6s-uQ@mail.gmail.com>
 <a55430c3-a0bc-4af6-b7e2-20f2e0d091b2n@googlegroups.com>
In-Reply-To: <a55430c3-a0bc-4af6-b7e2-20f2e0d091b2n@googlegroups.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 27 May 2022 19:04:07 +0200
Message-ID: <CACT4Y+ar18tcxx0tOthV0JBrmWsLXtXAjXVFX4sac5k1UGJ7Lw@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes test error: lost connection to test machine
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
	syzbot <syzbot+2c5da6a0a16a0c4f34aa@syzkaller.appspotmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_100424_006308_5A9DF014 
X-CRM114-Status: GOOD (  20.33  )
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

T24gRnJpLCAyNyBNYXkgMjAyMiBhdCAxNjowMSwgQWxleGFuZHJlIEdoaXRpCjxhbGV4YW5kcmUu
Z2hpdGlAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gT24gRnJpZGF5LCBNYXkgMjcsIDIwMjIgYXQg
Mzo1NToyNCBQTSBVVEMrMiBEbWl0cnkgVnl1a292IHdyb3RlOgo+Pgo+PiBPbiBGcmksIDI3IE1h
eSAyMDIyIGF0IDE1OjUwLCBBbGV4YW5kcmUgR2hpdGkKPj4gPGFsZXhhbmQuLi5AY2Fub25pY2Fs
LmNvbT4gd3JvdGU6Cj4+ID4gT24gRnJpZGF5LCBNYXkgMjcsIDIwMjIgYXQgMzowMjowMSBQTSBV
VEMrMiBEbWl0cnkgVnl1a292IHdyb3RlOgo+PiA+Pgo+PiA+PiBPbiBGcmksIDI3IE1heSAyMDIy
IGF0IDE0OjU1LCBzeXpib3QKPj4gPj4gPHN5emJvdCsyYzVkYTYuLi5Ac3l6a2FsbGVyLmFwcHNw
b3RtYWlsLmNvbT4gd3JvdGU6Cj4+ID4+ID4KPj4gPj4gPiBIZWxsbywKPj4gPj4gPgo+PiA+PiA+
IHN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGlzc3VlIG9uOgo+PiA+PiA+Cj4+ID4+ID4gSEVB
RCBjb21taXQ6IGM5MzJlZGVhZjZkNiByaXNjdjogZHRzOiBtaWNyb2NoaXA6IGZpeCBncGlvMSBy
ZWcgcHJvcGVydHkuLgo+PiA+PiA+IGdpdCB0cmVlOiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0IGZpeGVzCj4+ID4+ID4gY29uc29s
ZSBvdXRwdXQ6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3gvbG9nLnR4dD94PTE0MThh
ZGQ1ZjAwMDAwCj4+ID4+ID4ga2VybmVsIGNvbmZpZzogaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3Bv
dC5jb20veC8uY29uZmlnP3g9YWE2YjU3MDJiZGYxNGExNwo+PiA+PiA+IGRhc2hib2FyZCBsaW5r
OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9MmM1ZGE2YTBhMTZhMGM0
ZjM0YWEKPj4gPj4gPiBjb21waWxlcjogcmlzY3Y2NC1saW51eC1nbnUtZ2NjIChEZWJpYW4gMTAu
Mi4xLTYpIDEwLjIuMSAyMDIxMDExMCwgR05VIGxkIChHTlUgQmludXRpbHMgZm9yIERlYmlhbikg
Mi4zNS4yCj4+ID4+ID4gdXNlcnNwYWNlIGFyY2g6IHJpc2N2NjQKPj4gPj4gPgo+PiA+PiA+IElN
UE9SVEFOVDogaWYgeW91IGZpeCB0aGUgaXNzdWUsIHBsZWFzZSBhZGQgdGhlIGZvbGxvd2luZyB0
YWcgdG8gdGhlIGNvbW1pdDoKPj4gPj4gPiBSZXBvcnRlZC1ieTogc3l6Ym90KzJjNWRhNi4uLkBz
eXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4+ID4+Cj4+ID4+IFRoZSBDT05GSUdfS0FTQU5fVk1B
TExPQyBhbGxvd3MgcmlzY3Yga2VybmVsIHRvIGJvb3QsIGJ1dCBub3cgR28KPj4gPj4gcHJvY2Vz
c2VzIHN0YXJ0ZWQgY3Jhc2hpbmcgd2l0aDoKPj4gPj4KPj4gPj4gMTk3MC8wMS8wMSAwMDowNjo1
NSBmdXp6ZXIgc3RhcnRlZAo+PiA+PiBydW50aW1lOiBsZnN0YWNrLnB1c2ggaW52YWxpZCBwYWNr
aW5nOiBub2RlPTB4ZmZmZmZmNTkwOGE5NDAgY250PTB4MQo+PiA+PiBwYWNrZWQ9MHhmZmZmNTkw
OGE5NDAwMDAxIC0+IG5vZGU9MHhmZmZmNTkwOGE5NDAKPj4gPj4gZmF0YWwgZXJyb3I6IGxmc3Rh
Y2sucHVzaAo+PiA+PiBydW50aW1lIHN0YWNrOgo+PiA+PiBydW50aW1lLnRocm93KHsweDMwODg0
YywgMHhjfSkKPj4gPj4gL3Vzci9sb2NhbC9nby9zcmMvcnVudGltZS9wYW5pYy5nbzoxMTk4ICsw
eDYwCj4+ID4+IHJ1bnRpbWUuKCpsZnN0YWNrKS5wdXNoKDB4ZGIzODUwLCAweGZmZmZmZjU5MDhh
OTQwKQo+PiA+PiAvdXNyL2xvY2FsL2dvL3NyYy9ydW50aW1lL2xmc3RhY2suZ286MzAgKzB4MWE4
Cj4+ID4+Cj4+ID4+IEdvIHJ1bnRpbWUgdHJpZXMgdG8gc2hvdmUgc29tZSBkYXRhIGludG8gdGhl
IHVwcGVyIDE2IGJpdHMgb2YgcG9pbnRlcnMKPj4gPj4gYXNzdW1pbmcgdGhleSBhcmUgdW51c2Vk
Lgo+PiA+PiBIb3dldmVyLCB0aGUgb3JpZ2luYWwgcG9pbnRlciBub2RlPTB4ZmZmZmZmNTkwOGE5
NDAgc3VnZ2VzdCByaXNjdiBub3cKPj4gPj4gaGFzIDU2LWJpdCB1c2Vycy1zcGFjZSBhZGRyZXNz
IHNwYWNlPwo+PiA+Cj4+ID4KPj4gPiBZZXMsIHN2NTcgd2FzIG1lcmdlZCByZWNlbnRseS4KPj4g
Pgo+PiA+Pgo+PiA+PiBEb2N1bWVudGF0aW9uL3Jpc2N2L3ZtLWxheW91dC5yc3QgY2xhaW1zIDQ4
LWJpdCBwb2ludGVyczoKPj4gPj4gIgo+PiA+PiBUaGUgUklTQy1WIHByaXZpbGVnZWQgYXJjaGl0
ZWN0dXJlIGRvY3VtZW50IHN0YXRlcyB0aGF0IHRoZSA2NGJpdCBhZGRyZXNzZXMKPj4gPj4gIm11
c3QgaGF2ZSBiaXRzIDYz4oCTNDggYWxsIGVxdWFsIHRvIGJpdCA0Nywgb3IgZWxzZSBhIHBhZ2Ut
ZmF1bHQgZXhjZXB0aW9uIHdpbGwKPj4gPj4gb2NjdXIuIjoKPj4gPgo+PiA+Cj4+ID4gVGhhbmtz
IGZvciBwb2ludGluZyB0aGF0LCBJIGV4dHJhY3RlZCB0aGF0IGZyb20gdGhlIHNwZWNpZmljYXRp
b24gYmVmb3JlIHN2NTcgd2FzIHNwZWNpZmllZCwgSSdsbCBmaXggdGhhdC4KPj4gPgo+PiA+IFRo
ZSBjdXJyZW50IGtlcm5lbCBjb2RlIHdpbGwgdXNlIHN2NTcgYXMgaXQgaXMgc3VwcG9ydGVkIGFu
ZCBhZHZlcnRpc2VkIGJ5IHFlbXUsIGFuZCB0byBteSBrbm93bGVkZ2UsIHlvdSBjYW4ndCBkb3du
Z3JhZGUgdG8gc3Y0OCB1bmxlc3MgYnkgcmUtY29tcGlsaW5nIHFlbXUgdXNpbmcgdGhlIGZvbGxv
d2luZzoKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY3NyLmMgYi90YXJnZXQv
cmlzY3YvY3NyLmMKPj4gPiBpbmRleCA2ZGJlOWI1NDFmLi5hNjRiNTBlZDc1IDEwMDY0NAo+PiA+
IC0tLSBhL3RhcmdldC9yaXNjdi9jc3IuYwo+PiA+ICsrKyBiL3RhcmdldC9yaXNjdi9jc3IuYwo+
PiA+IEBAIC02MzcsNyArNjM3LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgdmFsaWRfdm1fMV8xMF82
NFsxNl0gPSB7Cj4+ID4gW1ZNXzFfMTBfTUJBUkVdID0gMSwKPj4gPiBbVk1fMV8xMF9TVjM5XSA9
IDEsCj4+ID4gW1ZNXzFfMTBfU1Y0OF0gPSAxLAo+PiA+IC0gW1ZNXzFfMTBfU1Y1N10gPSAxCj4+
ID4gKyBbVk1fMV8xMF9TVjU3XSA9IDAKPj4gPiB9Owo+PiA+Cj4+ID4gLyogTWFjaGluZSBJbmZv
cm1hdGlvbiBSZWdpc3RlcnMgKi8KPj4gPgo+PiA+PiAuLi4KPj4gPj4gMDAwMDAwMDAwMDAwMDAw
MCB8IDAgfCAwMDAwMDAzZmZmZmZmZmZmIHwgMjU2IEdCIHwKPj4gPj4gdXNlci1zcGFjZSB2aXJ0
dWFsIG1lbW9yeSwgZGlmZmVyZW50IHBlciBtbQo+PiA+PiAiCj4+Cj4+IFRoZXJlIGlzIG5vIGtl
cm5lbCBjb25maWcgdG8gZm9yY2UgU1Y0OC8zOSwgcmlnaHQ/Cj4KPgo+IE5vLCB3ZSByZWx5IG9u
IHdoYXQgdGhlIGhhcmR3YXJlIGFkdmVydGlzZXMsIGlmIGl0IHN1cHBvcnRzIHN2NTcsIHdlJ2xs
IGdvIGZvciBzdjU3LCBpZiBub3QsIHdlJ2xsIHRyeSBzdjQ4Li4uZXRjLiBJIGhhZCBzb21lIHBh
dGNoZXMgdG8gZm9yY2UgdGhlIGRvd25ncmFkZSBieSB1c2luZyB0aGUgZGV2aWNlIHRyZWUgYnV0
IHRoZXkgbmV2ZXIgZ290IG1lcmdlZCB0aG91Z2guCgorb3JpZ2luYWwgQ0MgbGlzdAoKRlRSIHNl
bnQgR28gcnVudGltZSBjaGFuZ2UgdG8gc3VwcG9ydCBTVjU3OgpodHRwczovL2dvLXJldmlldy5n
b29nbGVzb3VyY2UuY29tL2MvZ28vKy80MDkwNTUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
