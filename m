Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BEFC54E41
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 05:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhArCT2jVHDP5zo7ukXjXLcw497TOD9muIJd6WAQpSY=; b=u+TkBabYECTpk7
	1PHU2KihGCh3EcOh0RuFGOL3+7mRVowlue3p7wfrmQBqTlJEKktFZmRQkzX0PdAb0YQGrwvFst15A
	RrOR26J6btRM2FVYoQaQPQjSklRZPmMZM4M1xboRySOy6F6WMPvqhKud4SISSwaXu3YWq+6w8g9hg
	F+Jj8+VSBJJ/eSyrXH5DvPd0riEilmre+u07ranY0NzPRBXzYR1/n6epOBz7AZ+wkjgF4AEFQIBmt
	epPkvggZuu03eJP37vv5Klue0ExuRt8B9CciiKL0PLbGwxh+rYSHuMLyB88+6jCTJz6YqZu0YmV0i
	2+B/LFgNiUzUKG0DFIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riSm4-00000007rm4-2t5l;
	Fri, 08 Mar 2024 05:28:04 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riSm1-00000007rkp-16bq
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 05:28:02 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3652762edcfso4825515ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 21:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1709875678; x=1710480478; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pl9NNpV23e7PPSXFKavXyx5MR9eH3+53L7KC39+t3tA=;
        b=MAI/S54d0LIwEL/S+4Ag52n15GWmQiC3AKzB8sRGecJ1/i0SBgORqzuakJz3fekhAa
         mzKQlXP8354K7i71FgEQZ0WlTvwVwSuz48L3u8n5NzOz6bSQ/4FagQSAErwT00gs4oTh
         tH9TYGbqDl+wQzgVEGQMWK/2voPb4coPD2d6fC7kaXRF2GZtjjK/INtwNB6a8Fd+u20P
         kDyf+XuHmA61x9VzIpa6pJo88LDUfDYkPSa8eU0De28yAYI+McgA6dPXqWQ3r+VrmPLN
         QXU5jyTah6XR8A5bRH7Nepyhh6TuKQAgSnf3sJXIniCzUzPvNIcdLGpFWUNz/MbE4CpD
         jcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709875678; x=1710480478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pl9NNpV23e7PPSXFKavXyx5MR9eH3+53L7KC39+t3tA=;
        b=qfO3cWDH+9Klev5R9C3m5ZP/OnhG4Rke93CB7wtjh0ud35PDL4zVBjAQTgv6NbV2Jm
         ty2sIjVAaNuVdfV+u8/LX0VYrRpmfn3ASE+WBdONAAZksF/aLJiUdgBCDuQGP+VzbqzL
         dLuNkOvKqjp6QQ7gqPYtUhlKsUObZNfNhnwWKLK7EVQWL+lqeSOp/+Y4xgKrFn/gBu9B
         XMHvvbfUDXDSU4dzyO9xo9j31JXLOjcrSAqslX0/33hkNo1WL2Vrcb0MX0Nz2X4w7a3b
         llpI7erNiIL2YJojuWJ3R9W8Yu/YdXLqSP+zwxNoMwTuUNarilTngUlb3kjVN4y9IdC5
         dR+A==
X-Forwarded-Encrypted: i=1; AJvYcCUsh7D89g1hIMu+ee1Y/LSATCXdNy4z0UIpTQeve47gFixWuH9SGTT+Ws3GfcQXpVVDWliLLC1VrcyfIPZNnN4KwzGBXVClxiKiTMx5TCDr
X-Gm-Message-State: AOJu0YwHwMxEeiGe/kHWHnbNQTYplI5QTUjjv6hahitjy2Y/48gVLuTc
	uzY0bHxeW4tG3prQ3M6YwMQ3101IymrvLo/BVdW6HIg4j6KIu4WnvAFbF6vOcFuF5J3os73+/D5
	Dh98aRthksxJ+sBWLLWsv2JIBAVmAkRTQeV9QkH3c3MjiqyNt
X-Google-Smtp-Source: AGHT+IHtDu8/USI0tggQbcaqnOFGrFTBALs/MuZlRMxGOGB7tpDm6kBEgQgsE3U2CSZZd4h2xUbIrcWyL5HEAAHhCts=
X-Received: by 2002:a92:cd8b:0:b0:363:c2d4:a365 with SMTP id
 r11-20020a92cd8b000000b00363c2d4a365mr24881857ilb.26.1709875678243; Thu, 07
 Mar 2024 21:27:58 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy1rYFoYjCRWTPouiT=tiN26Z_v3Y36K2MyDrcCkRs1Luw@mail.gmail.com>
 <Zen8qGzVpaOB_vKa@google.com>
In-Reply-To: <Zen8qGzVpaOB_vKa@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Mar 2024 10:57:46 +0530
Message-ID: <CAAhSdy2Mu08RsBM+7FMjkcV49p9gOj3UKEoZnPAVk92e_3q=sw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.9
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_212801_312988_32BF4324 
X-CRM114-Status: GOOD (  25.36  )
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

T24gVGh1LCBNYXIgNywgMjAyNCBhdCAxMToxM+KAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNl
YW5qY0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTWFyIDA3LCAyMDI0LCBBbnVwIFBh
dGVsIHdyb3RlOgo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gS1ZNL3Jpc2N2IGNoYW5nZXMgZm9yIDYuOQo+ID4K
PiA+IC0gRXhjZXB0aW9uIGFuZCBpbnRlcnJ1cHQgaGFuZGxpbmcgZm9yIHNlbGZ0ZXN0cwo+ID4g
LSBTc3RjIChha2EgYXJjaF90aW1lcikgc2VsZnRlc3QKPiA+IC0gRm9yd2FyZCBzZWVkIENTUiBh
Y2Nlc3MgdG8gS1ZNIHVzZXJzcGFjZQo+ID4gLSBadHNvIGV4dGVuc2lvbiBzdXBwb3J0IGZvciBH
dWVzdC9WTQo+ID4gLSBaYWNhcyBleHRlbnNpb24gc3VwcG9ydCBmb3IgR3Vlc3QvVk0KPiA+Cj4g
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCj4gPiBBbnVwIFBhdGVsICg1KToKPiA+ICAgICAgIFJJU0MtVjogS1ZNOiBGb3J3
YXJkIFNFRUQgQ1NSIGFjY2VzcyB0byB1c2VyIHNwYWNlCj4gPiAgICAgICBSSVNDLVY6IEtWTTog
QWxsb3cgWnRzbyBleHRlbnNpb24gZm9yIEd1ZXN0L1ZNCj4gPiAgICAgICBLVk06IHJpc2N2OiBz
ZWxmdGVzdHM6IEFkZCBadHNvIGV4dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QgdGVzdAo+ID4gICAg
ICAgUklTQy1WOiBLVk06IEFsbG93IFphY2FzIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPiA+ICAg
ICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFphY2FzIGV4dGVuc2lvbiB0byBnZXQtcmVn
LWxpc3QgdGVzdAo+ID4KPiA+IEhhaWJvIFh1ICgxMSk6Cj4gPiAgICAgICBLVk06IGFybTY0OiBz
ZWxmdGVzdHM6IERhdGEgdHlwZSBjbGVhbnVwIGZvciBhcmNoX3RpbWVyIHRlc3QKPiA+ICAgICAg
IEtWTTogYXJtNjQ6IHNlbGZ0ZXN0czogRW5hYmxlIHR1bmluZyBvZiBlcnJvciBtYXJnaW4gaW4g
YXJjaF90aW1lciB0ZXN0Cj4gPiAgICAgICBLVk06IGFybTY0OiBzZWxmdGVzdHM6IFNwbGl0IGFy
Y2hfdGltZXIgdGVzdCBjb2RlCj4gPiAgICAgICBLVk06IHNlbGZ0ZXN0czogQWRkIENPTkZJR182
NEJJVCBkZWZpbml0aW9uIGZvciB0aGUgYnVpbGQKPiA+ICAgICAgIHRvb2xzOiByaXNjdjogQWRk
IGhlYWRlciBmaWxlIGNzci5oCj4gPiAgICAgICB0b29sczogcmlzY3Y6IEFkZCBoZWFkZXIgZmls
ZSB2ZHNvL3Byb2Nlc3Nvci5oCj4gPiAgICAgICBLVk06IHJpc2N2OiBzZWxmdGVzdHM6IFN3aXRj
aCB0byB1c2UgbWFjcm8gZnJvbSBjc3IuaAo+ID4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3Rz
OiBBZGQgZXhjZXB0aW9uIGhhbmRsaW5nIHN1cHBvcnQKPiA+ICAgICAgIEtWTTogcmlzY3Y6IHNl
bGZ0ZXN0czogQWRkIGd1ZXN0IGhlbHBlciB0byBnZXQgdmNwdSBpZAo+Cj4gVWgsIHdoYXQncyBn
b2luZyBvbiB3aXRoIHRoaXMgc2VyaWVzPyAgTWFueSBvZiB0aGVzZSB3ZXJlIGNvbW1pdHRlZCAq
eWVzdGVyZGF5KiwKPiBidXQgeW91IHNlbnQgYSBtYWlsIG9uIEZlYnJ1YXJ5IDEydGhbMV0gc2F5
aW5nIHRoZXNlIHdlcmUgcXVldWVkLiAgVGhhdCdzIHF1aXRlCj4gdGhlIGxhZy4KPgo+IEkgZG9u
J3QgaW50ZW5kIHRvIHBvbGljZSB0aGUgUklTQy1WIHRyZWUsIGJ1dCB0aGlzIGNvbW1pdCBjYXVz
ZWQgYSBjb25mbGljdCB3aXRoCj4ga3ZtLXg4Ni9zZWxmdGVzdHNbMl0uICBJdCdzIGEgbm9uLWlz
c3VlIGluIHRoaXMgY2FzZSBiZWNhdXNlIGl0J3Mgc3VjaCBhIHRyaXZpYWwKPiBjb25mbGljdCwg
YW5kIHdlJ3JlIGFsbCBxdWl0ZSBsYXggd2l0aCBzZWxmdGVzdHMsIGJ1dCBzZW5kaW5nIGEgcHVs
bCByZXF1ZXN0IH4xMgo+IGhvdXJzIGFmdGVyIHB1c2hpbmcgY29tbWl0cyB0aGF0IGNsZWFybHkg
YXJlbid0IGZpeGVzIGlzIGEgYml0IHJpZGljaXVsb3VzLiAgRS5nLgo+IGlmIHRoaXMgd2VyZSB0
byBoYXBwZW4gd2l0aCBhIGxlc3MgdHJpdmlhbCBjb25mbGljdCwgdGhlIG90aGVyIHN1Yi1tYWlu
dGFpbmVyIHdvdWxkCj4gYmUgbGVmdCBkb2luZyBhIGxhdGUgc2NyYW1ibGUgdG8gZmlndXJlIHRo
aW5ncyBvdXQganVzdCBiZWZvcmUgc2VuZGluZyB0aGVpciBvd24KPiBwdWxsIHJlcXVlc3RzLgo+
Cj4gICB0YWcga3ZtLXJpc2N2LTYuOS0xCj4gICBUYWdnZXI6ICAgICBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgo+ICAgVGFnZ2VyRGF0ZTogVGh1IE1hciA3IDExOjU0OjM0IDIwMjQg
KzA1MzAKPgo+IC4uLgo+Cj4gICBjb21taXQgZDhjMDgzMTM0OGU3OGZkYWY2N2FhOTUwNzBiYWUy
ZWY4ZTgxOWIwNQo+ICAgQXV0aG9yOiAgICAgQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNy
by5jb20+Cj4gICBBdXRob3JEYXRlOiBUdWUgRmViIDEzIDEzOjM5OjE3IDIwMjQgKzA1MzAKPiAg
IENvbW1pdDogICAgIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gICBDb21taXRE
YXRlOiBXZWQgTWFyIDYgMjA6NTM6NDQgMjAyNCArMDUzMAo+Cj4gVGhlIG90aGVyIHJlYXNvbiB0
aGlzIGNhdWdodCBteSBleWUgaXMgdGhhdCB0aGUgY29uZmxpY3QgaGFwcGVuZWQgaW4gY29tbW9u
IGNvZGUsCj4gYnV0IHRoZSBhZGRlZCBoZWxwZXIgaXMgUklTQy1WIHNwZWNpZmljIGFuZCB1c2Vk
IG9ubHkgZnJvbSBSSVNDLVYgY29kZS4gIEFSTSBkb2VzCj4gaGF2ZSBhbiBpZGVudGljYWwgaGVs
cGVyLCBidXQgQUZBSUNUIEFSTSdzIGhlbHBlciBpcyBvbmx5IHVzZWQgZnJvbSBBUk0gY29kZS4K
Pgo+IEJ1dCB0aGUgcHJvdG90eXBlIG9mIGd1ZXN0X2dldF92Y3B1aWQoKSBpcyBpbiBjb21tb24g
Y29kZS4gIFdoaWNoIGlzbid0IGEgaHVnZQo+IGRlYWwsIGJ1dCBpdCdzIHJhdGhlciB1bmRlc2ly
YWJsZSBiZWNhdXNlIHRoZXJlJ3Mgbm8gaW5kaWNhdGlvbiB0aGF0IGl0cwo+IGltcGxlbWVudGF0
aW9uIGlzIGFyY2gtc3BlY2lmaWMsIGFuZCB0cnlpbmcgdG8gdXNlIGl0IGluIGNvZGUgYnVpbHQg
Zm9yIHMzOTAgb3IKPiB4ODYgKG9yIE1JUFMgb3IgUFBDLCB3aGljaCBhcmUgb24gdGhlIGhvcml6
b24pLCB3b3VsZCBmYWlsLiAgSSdtIGFsbCBmb3IgbWFraW5nCj4gY29kZSBjb21tb24gd2hlcmUg
cG9zc2libGUsIGJ1dCBnb2luZyBoYWxmd2F5IGFuZCBsZWF2aW5nIGEgdHJhcCBmb3Igb3RoZXIK
PiBhcmNoaXRlY3R1cmVzIG1ha2VzIGZvciBhIHBvb3IgZXhwZXJpZW5jZSBmb3IgZGV2ZWxvcGVy
cy4KPgo+IEFuZCBhZ2FpbiwgdGhpcyBzaG93aW5nIHVwIF9zb18gbGF0ZSBtZWFucyBpdCdzIHVu
bmVjZXNzYXJpbHkgZGlmZmljdWx0IHRvIGNsZWFuCj4gdGhpbmdzIHVwLiAgV2hpY2ggaXMga2lu
ZGEgdGhlIHdob2xlIHBvaW50IG9mIGdldHRpbmcgdGhpbmcgaW50byBsaW51eC1uZXh0LCBzbwo+
IHRoYXQgZm9sa3MgdGhhdCB3ZXJlbid0IGludm9sdmVkIGluIHRoZSBvcmlnaW5hbCBwYXRjaC9z
ZXJpZXMgY2FuIHJlYWN0IGlmIHRoZXJlCj4gaXMgYSBoaWNjdXAvcHJvYmxlbS9vZGRpdHkuCgpT
b3JyeSBmb3IgdGhlIGxhc3QgbWludXRlIGNvbmZsaWN0LgoKSW4gYWxsIHJlbGVhc2UgY3ljbGVz
LCB0aGUgcmlzY3Zfa3ZtX3F1ZXVlIGZyZWV6ZXMgYnkgcmM2IGFuZCByaXNjdl9rdm1fbmV4dApp
cyB1cGRhdGVkIGF0IGxlYXN0IGEgd2VlayBiZWZvcmUgc2VuZGluZyBQUi4KCkluIHRoaXMgY2Fz
ZSB0aGVyZSB3YXMgYSBjcnVjaWFsIGxhc3QgbWludXRlIGJ1ZyBmb3VuZCBpbiBSSVNDLVYgYXJj
aF90aW1lcgpzZWxmdGVzdCBwYXRjaGVzIGR1ZSB0byB3aGljaCB0aGUgZ2V0LXJlZy1saXN0IHNl
bGZ0ZXN0IHdhcyBicm9rZW4gc28gSQp1cGRhdGVkIHRoZSBvZmZlbmRpbmcgY29tbWl0cyBpbiB0
aGUgcXVldWUgaXRzZWxmIGJlZm9yZSBzZW5kaW5nIG91dCBQUi4KCkkgd2lsbCBkZWZpbml0ZWx5
IHRyeSBteSBiZXN0IHRvIGF2b2lkIHN1Y2ggbGFzdCBtaW51dGUgY29uZmxpY3QuCgpSZWdhcmRz
LApBbnVwCgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUFoU2R5MndGemsw
aDVNaU01eTlGaWowSHlXYWtlPTd2TnVWMU1FeFV4a0V0TVdTaHdAbWFpbC5nbWFpbC5jb20KPiBb
Ml0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMzA3MTQ1OTQ2LjdlMDE0MjI1QGNh
bmIuYXV1Zy5vcmcuYXUKPgo+ID4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBDaGFuZ2Ug
dmNwdV9oYXNfZXh0IHRvIGEgY29tbW9uIGZ1bmN0aW9uCj4gPiAgICAgICBLVk06IHJpc2N2OiBz
ZWxmdGVzdHM6IEFkZCBzc3RjIHRpbWVyIHRlc3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
