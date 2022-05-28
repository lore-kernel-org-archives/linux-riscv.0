Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088D9C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 May 2022 08:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ACSNVX1tWmyPWuVBP4BTWy+5z9eXUfrmcHG7wt632c=; b=w4D/zQwneqFV/O
	JY53D1nT5vZoAsxnksuQ34+kLT1zZMSAMyPMCYf9YIG2+fQcQVNDNJzM7HJTa+Z2791tP7Xgd2L4q
	vfvg+C4mU20zl9kFU73enILLErhkQVOpH2SrCpahHVqyGmv+3Y5tHP/ZW2rZ3+IRgXDuLqTvqEWmv
	h2jTMzETKwD/y3wQw/fYkyhaM8SSDu297emGnP1CwApdfbGw5Ure0uOoBWnHxS9PiPSuIJuEIx4Dg
	R3YKJbd8vKoPlvNykR95fQcQJK5OYPWxP9bxw42qpmgGzFdJchciOU5t5UsfL77xqLwsverBQY3S9
	pgYclY73nPMQL8wsJBmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nurmw-001kNl-6V; Sat, 28 May 2022 08:27:10 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nurmr-001kND-OI
	for linux-riscv@lists.infradead.org; Sat, 28 May 2022 08:27:08 +0000
Received: by mail-lf1-x12f.google.com with SMTP id br17so9979642lfb.2
        for <linux-riscv@lists.infradead.org>; Sat, 28 May 2022 01:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MdBohn5lqfcigLONJ4tlR9+A0EebTM5wGoV2izTpT+s=;
        b=GSveqXx1fB4DtF+qokOmSKuJx40Nb4rcFrGbdTMAo+w1/aEtd0vMM+AXLBnFKQswcr
         TNxoTCQUPWNcFtuVAEMFUSQmmpU2WxpdgeFPcog18bF4Ii/8+uAfDd3n4HTm12JK827f
         0J0ubSz35p/qWcYLOiX1sh64971D6MeB50jLVTZSsiNfGK7lvqjL8GCAcvhanObAniAZ
         zRW5IucHLt2ug/frUzMU3X5zL8eLKFA5Jhnl+LuT8iF+pUV6FGqeIEFfV4FYe/yRb8rC
         61Fu3J4sFdfA/CYTw1owN9HnzcX7K0tFwAhP/nbtuPzY2Hx/Gtc2/NEGTILQkLxM6yz9
         sSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MdBohn5lqfcigLONJ4tlR9+A0EebTM5wGoV2izTpT+s=;
        b=RCTP73wAd5XdKjkvYE8c/iu1nmxSKr6Iix4DRYJHMXBTkjeIyVklAICMiUvxZdfxJ+
         A8lJP5EBVpyYb+S5ucbB5Ffr/vWmXjCOzjqKtOvSJv8h3/OPuWvzhzbANWcdVqzXTCPS
         TLFLNKp6bvTjdHvWFLMzKCBu5K5yxrQEr3Z82uiLnKr0IQi4ivhCkkQyNasXA/Oux+X3
         0lmSRFx/XTXA+eLkHECucMC98E6Fkrxt38VSFNd0sIs5Fc8H8wZS4L/sv+grMB/6qkw/
         qPKx4WN6B8BJoc8ary04gg5OwbJLqgmIdZPgf4kkS9wmE6r2jcw44flUS0wGHNbsz//Y
         slgQ==
X-Gm-Message-State: AOAM531SVgpoRO+lLQAoLB4NKdfrDEoYxYF7ZjTCAXp3j4mi395usxi/
	ZQCaska029Ru7II05bYYpPEgri8oQWaVloVUuFsojA==
X-Google-Smtp-Source: ABdhPJw0VnqVAfGGkafG+4wY07hGryCH2b+Rs5r9RjqjltF/tJS1+e4HxHiBTOAptq44bQf9EGzI2GbhxzHqBZzy+9U=
X-Received: by 2002:a05:6512:3f13:b0:464:f55f:7806 with SMTP id
 y19-20020a0565123f1300b00464f55f7806mr33598585lfa.598.1653726416484; Sat, 28
 May 2022 01:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d0437b05dffdd1de@google.com> <CACT4Y+Y8DOKJtwhRsyNT7G26C3Fx_oeibpXn43Ks0RtYYdZG3g@mail.gmail.com>
 <36f4745f-0e47-4f49-8f4e-ff7544f163d8n@googlegroups.com> <CACT4Y+Zy7wLdeRCa+ZH-swo9ut=U6pEk4rP461QE1m-gT6s-uQ@mail.gmail.com>
 <a55430c3-a0bc-4af6-b7e2-20f2e0d091b2n@googlegroups.com> <CACT4Y+ar18tcxx0tOthV0JBrmWsLXtXAjXVFX4sac5k1UGJ7Lw@mail.gmail.com>
 <fcb6d1aa-78bb-cfad-7655-cbab59f8d5c3@ghiti.fr>
In-Reply-To: <fcb6d1aa-78bb-cfad-7655-cbab59f8d5c3@ghiti.fr>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sat, 28 May 2022 10:26:44 +0200
Message-ID: <CACT4Y+a79F0SmG2KTZyYQ1ZTktY7zQ5ofZMdpkCKNq=SeNxbCw@mail.gmail.com>
Subject: Re: [syzbot] riscv/fixes test error: lost connection to test machine
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>, 
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
	syzbot <syzbot+2c5da6a0a16a0c4f34aa@syzkaller.appspotmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220528_012705_852552_EC7F2FEE 
X-CRM114-Status: GOOD (  19.54  )
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

T24gU2F0LCAyOCBNYXkgMjAyMiBhdCAxMDowMywgQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRp
LmZyPiB3cm90ZToKPiA+Pj4+Pj4gSGVsbG8sCj4gPj4+Pj4+Cj4gPj4+Pj4+IHN5emJvdCBmb3Vu
ZCB0aGUgZm9sbG93aW5nIGlzc3VlIG9uOgo+ID4+Pj4+Pgo+ID4+Pj4+PiBIRUFEIGNvbW1pdDog
YzkzMmVkZWFmNmQ2IHJpc2N2OiBkdHM6IG1pY3JvY2hpcDogZml4IGdwaW8xIHJlZyBwcm9wZXJ0
eS4uCj4gPj4+Pj4+IGdpdCB0cmVlOiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0IGZpeGVzCj4gPj4+Pj4+IGNvbnNvbGUgb3V0cHV0
OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xNDE4YWRkNWYwMDAw
MAo+ID4+Pj4+PiBrZXJuZWwgY29uZmlnOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94
Ly5jb25maWc/eD1hYTZiNTcwMmJkZjE0YTE3Cj4gPj4+Pj4+IGRhc2hib2FyZCBsaW5rOiBodHRw
czovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9MmM1ZGE2YTBhMTZhMGM0ZjM0YWEK
PiA+Pj4+Pj4gY29tcGlsZXI6IHJpc2N2NjQtbGludXgtZ251LWdjYyAoRGViaWFuIDEwLjIuMS02
KSAxMC4yLjEgMjAyMTAxMTAsIEdOVSBsZCAoR05VIEJpbnV0aWxzIGZvciBEZWJpYW4pIDIuMzUu
Mgo+ID4+Pj4+PiB1c2Vyc3BhY2UgYXJjaDogcmlzY3Y2NAo+ID4+Pj4+Pgo+ID4+Pj4+PiBJTVBP
UlRBTlQ6IGlmIHlvdSBmaXggdGhlIGlzc3VlLCBwbGVhc2UgYWRkIHRoZSBmb2xsb3dpbmcgdGFn
IHRvIHRoZSBjb21taXQ6Cj4gPj4+Pj4+IFJlcG9ydGVkLWJ5OiBzeXpib3QrMmM1ZGE2Li4uQHN5
emthbGxlci5hcHBzcG90bWFpbC5jb20KPiA+Pj4+PiBUaGUgQ09ORklHX0tBU0FOX1ZNQUxMT0Mg
YWxsb3dzIHJpc2N2IGtlcm5lbCB0byBib290LCBidXQgbm93IEdvCj4gPj4+Pj4gcHJvY2Vzc2Vz
IHN0YXJ0ZWQgY3Jhc2hpbmcgd2l0aDoKPiA+Pj4+Pgo+ID4+Pj4+IDE5NzAvMDEvMDEgMDA6MDY6
NTUgZnV6emVyIHN0YXJ0ZWQKPiA+Pj4+PiBydW50aW1lOiBsZnN0YWNrLnB1c2ggaW52YWxpZCBw
YWNraW5nOiBub2RlPTB4ZmZmZmZmNTkwOGE5NDAgY250PTB4MQo+ID4+Pj4+IHBhY2tlZD0weGZm
ZmY1OTA4YTk0MDAwMDEgLT4gbm9kZT0weGZmZmY1OTA4YTk0MAo+ID4+Pj4+IGZhdGFsIGVycm9y
OiBsZnN0YWNrLnB1c2gKPiA+Pj4+PiBydW50aW1lIHN0YWNrOgo+ID4+Pj4+IHJ1bnRpbWUudGhy
b3coezB4MzA4ODRjLCAweGN9KQo+ID4+Pj4+IC91c3IvbG9jYWwvZ28vc3JjL3J1bnRpbWUvcGFu
aWMuZ286MTE5OCArMHg2MAo+ID4+Pj4+IHJ1bnRpbWUuKCpsZnN0YWNrKS5wdXNoKDB4ZGIzODUw
LCAweGZmZmZmZjU5MDhhOTQwKQo+ID4+Pj4+IC91c3IvbG9jYWwvZ28vc3JjL3J1bnRpbWUvbGZz
dGFjay5nbzozMCArMHgxYTgKPiA+Pj4+Pgo+ID4+Pj4+IEdvIHJ1bnRpbWUgdHJpZXMgdG8gc2hv
dmUgc29tZSBkYXRhIGludG8gdGhlIHVwcGVyIDE2IGJpdHMgb2YgcG9pbnRlcnMKPiA+Pj4+PiBh
c3N1bWluZyB0aGV5IGFyZSB1bnVzZWQuCj4gPj4+Pj4gSG93ZXZlciwgdGhlIG9yaWdpbmFsIHBv
aW50ZXIgbm9kZT0weGZmZmZmZjU5MDhhOTQwIHN1Z2dlc3QgcmlzY3Ygbm93Cj4gPj4+Pj4gaGFz
IDU2LWJpdCB1c2Vycy1zcGFjZSBhZGRyZXNzIHNwYWNlPwo+ID4+Pj4KPiA+Pj4+IFllcywgc3Y1
NyB3YXMgbWVyZ2VkIHJlY2VudGx5Lgo+ID4+Pj4KPiA+Pj4+PiBEb2N1bWVudGF0aW9uL3Jpc2N2
L3ZtLWxheW91dC5yc3QgY2xhaW1zIDQ4LWJpdCBwb2ludGVyczoKPiA+Pj4+PiAiCj4gPj4+Pj4g
VGhlIFJJU0MtViBwcml2aWxlZ2VkIGFyY2hpdGVjdHVyZSBkb2N1bWVudCBzdGF0ZXMgdGhhdCB0
aGUgNjRiaXQgYWRkcmVzc2VzCj4gPj4+Pj4gIm11c3QgaGF2ZSBiaXRzIDYz4oCTNDggYWxsIGVx
dWFsIHRvIGJpdCA0Nywgb3IgZWxzZSBhIHBhZ2UtZmF1bHQgZXhjZXB0aW9uIHdpbGwKPiA+Pj4+
PiBvY2N1ci4iOgo+ID4+Pj4KPiA+Pj4+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCwgSSBleHRy
YWN0ZWQgdGhhdCBmcm9tIHRoZSBzcGVjaWZpY2F0aW9uIGJlZm9yZSBzdjU3IHdhcyBzcGVjaWZp
ZWQsIEknbGwgZml4IHRoYXQuCj4gPj4+Pgo+ID4+Pj4gVGhlIGN1cnJlbnQga2VybmVsIGNvZGUg
d2lsbCB1c2Ugc3Y1NyBhcyBpdCBpcyBzdXBwb3J0ZWQgYW5kIGFkdmVydGlzZWQgYnkgcWVtdSwg
YW5kIHRvIG15IGtub3dsZWRnZSwgeW91IGNhbid0IGRvd25ncmFkZSB0byBzdjQ4IHVubGVzcyBi
eSByZS1jb21waWxpbmcgcWVtdSB1c2luZyB0aGUgZm9sbG93aW5nOgo+ID4+Pj4KPiA+Pj4+IGRp
ZmYgLS1naXQgYS90YXJnZXQvcmlzY3YvY3NyLmMgYi90YXJnZXQvcmlzY3YvY3NyLmMKPiA+Pj4+
IGluZGV4IDZkYmU5YjU0MWYuLmE2NGI1MGVkNzUgMTAwNjQ0Cj4gPj4+PiAtLS0gYS90YXJnZXQv
cmlzY3YvY3NyLmMKPiA+Pj4+ICsrKyBiL3RhcmdldC9yaXNjdi9jc3IuYwo+ID4+Pj4gQEAgLTYz
Nyw3ICs2MzcsNyBAQCBzdGF0aWMgY29uc3QgY2hhciB2YWxpZF92bV8xXzEwXzY0WzE2XSA9IHsK
PiA+Pj4+IFtWTV8xXzEwX01CQVJFXSA9IDEsCj4gPj4+PiBbVk1fMV8xMF9TVjM5XSA9IDEsCj4g
Pj4+PiBbVk1fMV8xMF9TVjQ4XSA9IDEsCj4gPj4+PiAtIFtWTV8xXzEwX1NWNTddID0gMQo+ID4+
Pj4gKyBbVk1fMV8xMF9TVjU3XSA9IDAKPiA+Pj4+IH07Cj4gPj4+Pgo+ID4+Pj4gLyogTWFjaGlu
ZSBJbmZvcm1hdGlvbiBSZWdpc3RlcnMgKi8KPiA+Pj4+Cj4gPj4+Pj4gLi4uCj4gPj4+Pj4gMDAw
MDAwMDAwMDAwMDAwMCB8IDAgfCAwMDAwMDAzZmZmZmZmZmZmIHwgMjU2IEdCIHwKPiA+Pj4+PiB1
c2VyLXNwYWNlIHZpcnR1YWwgbWVtb3J5LCBkaWZmZXJlbnQgcGVyIG1tCj4gPj4+Pj4gIgo+ID4+
PiBUaGVyZSBpcyBubyBrZXJuZWwgY29uZmlnIHRvIGZvcmNlIFNWNDgvMzksIHJpZ2h0Pwo+ID4+
Cj4gPj4gTm8sIHdlIHJlbHkgb24gd2hhdCB0aGUgaGFyZHdhcmUgYWR2ZXJ0aXNlcywgaWYgaXQg
c3VwcG9ydHMgc3Y1Nywgd2UnbGwgZ28gZm9yIHN2NTcsIGlmIG5vdCwgd2UnbGwgdHJ5IHN2NDgu
Li5ldGMuIEkgaGFkIHNvbWUgcGF0Y2hlcyB0byBmb3JjZSB0aGUgZG93bmdyYWRlIGJ5IHVzaW5n
IHRoZSBkZXZpY2UgdHJlZSBidXQgdGhleSBuZXZlciBnb3QgbWVyZ2VkIHRob3VnaC4KPiA+ICtv
cmlnaW5hbCBDQyBsaXN0Cj4gPgo+ID4gRlRSIHNlbnQgR28gcnVudGltZSBjaGFuZ2UgdG8gc3Vw
cG9ydCBTVjU3Ogo+ID4gaHR0cHM6Ly9nby1yZXZpZXcuZ29vZ2xlc291cmNlLmNvbS9jL2dvLysv
NDA5MDU1Cj4KPgo+IFRoYW5rIHlvdSBmb3IgdGhhdCwgSSdsbCBwdWxsIHRoYXQgaW50byBVYnVu
dHUgd2hlbiBtZXJnZWQuIERvIHlvdSBrbm93Cj4gaWYgYW55IG90aGVyIHByb2dyYW1taW5nIGxh
bmd1YWdlIGRvZXMgdGhlIHNhbWUgYW5kIHdvdWxkIG5lZWQgYSBmaXggdG9vPwoKTm90aGluZyBj
b21lcyB0byBtaW5kIHJpZ2h0IG5vdy4KQnV0IHRoaXMgaXMgbm90IG9ubHkgYWJvdXQgbGFuZ3Vh
Z2UgcnVudGltZXMsIGl0J3MgYWJvdXQgYWxsIHNvZnR3YXJlCm91dCB0aGVyZS4gSG93ZXZlciwg
eDg2IGhhcyA1LWxldmVsIHBhZ2VzIG5vdyBhcyB3ZWxsLCBpdCBzaG91bGQgc3RvbXAKb24gdGhl
c2UgcHJvYmxlbXMgZWFybGllci4uLiBidXQgc29tZWhvdyBpdCBkaWQgbm90IGhhcHBlbiBmb3Ig
R28KcnVudGltZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
