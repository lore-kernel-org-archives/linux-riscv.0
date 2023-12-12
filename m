Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A37C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 20:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHqCjPu+anJmW9ufjqaQ1m3jazmTm6OQwn5448PeWhg=; b=GfOpZZEZ+D8Ss9
	W/ZnjFk86mhY4VxYCtUjOhD3aDCL8tsKvNYMTKqS494Xve8Q4Eu+L4wbwA7OkevtQV1S9I/Q0ivOy
	LqAid1b9Nq5oaoGObn5u85+oqMd0djqi+qmaVdhXohz+UMpUtubpVZieTJTSTZc6TSTe/H/Jvav8J
	YfV4uIOWdms1qgmXNBPA1fQTf3JK0mNED5vUHR3oD4CWcCM2x/eg28gXRLvv/RSbqyn1blqjVBNnY
	K42ILalv6QeJlWNq+RcEZ11YcgPeFfjSiawI7aFitygJ6GH53W3xY5aLQu9NTnVH50vJSN4lyjTCJ
	POBo2fl9BMiRPkxIqyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD90V-00CfJz-2w;
	Tue, 12 Dec 2023 20:05:31 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD90S-00CfJA-2A;
	Tue, 12 Dec 2023 20:05:30 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5908b15f43eso484457eaf.1;
        Tue, 12 Dec 2023 12:05:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702411525; x=1703016325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BOtCilKMUNbBasgq0UMjLFqZa8aCDvdPUV0gfbYhOc=;
        b=iwWZ9nX7QDQ3kTKhFH/6sEicJ2JWpGrV1jZNl3YGbsWw5LpEy8lBXB36nhtQJysdVu
         Ig63QnTamFfa0KrLrk8FaPG7SsHGGtOjePOyJB2y8L5QkfvVXJsmgwcI/O1BYmd1rZur
         VEUGNyapPXXHiq8WlAo9xp8S+1WbuOF5ciDhgOrTGOBW63NZdC3+k1WYgAXgZFfYDiMA
         MfPMgODQG78yhKeRWogbaXQ211eLr/v4ts3J/kuO6NLS9seT1UDoVeIi+6ZceaMZa2xN
         1/mnq+mKRGk9TbVwOgAwxTxt4xtTP2BuqMI5Hw+FY/iT7rz/GrD+lvmDpuwhFb69ZsyJ
         ZfyQ==
X-Gm-Message-State: AOJu0YxEm4VWnp1fNzQC1OLh6eNpuPA6NHjMGJN9cZ8foVV6hxteunGJ
	4fAAhASY+PX4sn2dJ11cKmq3h3rFR2AgS1FJcRhNwpAXCzA=
X-Google-Smtp-Source: AGHT+IG/zOKPoXX+KUgHRd1YwPymLrSadLIsRID5FYaIOT9/r8DyzvG7YUYiYl28l7KFo0FotJK25IwKa9Ys4XqQUjg=
X-Received: by 2002:a05:6820:220d:b0:58d:5302:5b18 with SMTP id
 cj13-20020a056820220d00b0058d53025b18mr13982416oob.1.1702411525380; Tue, 12
 Dec 2023 12:05:25 -0800 (PST)
MIME-Version: 1.0
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk> <CAJZ5v0j-73_+9U3ngDAf9w1ADDhBTKctJdWboqUk-okH2TQGyg@mail.gmail.com>
 <ZW4ZBkj2oCmxv55T@shell.armlinux.org.uk> <ZXi7do4mVfdsz/k0@shell.armlinux.org.uk>
In-Reply-To: <ZXi7do4mVfdsz/k0@shell.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 12 Dec 2023 21:05:14 +0100
Message-ID: <CAJZ5v0jOU4Re2g5QtxpG0RjP3MYBxqz5Z+TtfXq2dz8HTq9A0A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/39] ACPI/arm64: add support for virtual cpuhotplug
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_120528_734913_85B4FB97 
X-CRM114-Status: GOOD (  48.65  )
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

T24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgODo1OOKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIE1vbiwgRGVjIDA0LCAyMDIzIGF0
IDA2OjIzOjAyUE0gKzAwMDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiA+IE9uIFR1
ZSwgT2N0IDI0LCAyMDIzIGF0IDA4OjI2OjU4UE0gKzAyMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdy
b3RlOgo+ID4gPiBPbiBUdWUsIE9jdCAyNCwgMjAyMyBhdCA1OjE14oCvUE0gUnVzc2VsbCBLaW5n
IChPcmFjbGUpCj4gPiA+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gPiA+Cj4g
PiA+ID4gSGksCj4gPiA+ID4KPiA+ID4gPiBJJ20gcG9zdGluZyBKYW1lcycgcGF0Y2ggc2V0IHVw
ZGF0ZWQgd2l0aCBtb3N0IG9mIHRoZSByZXZpZXcgY29tbWVudHMKPiA+ID4gPiBmcm9tIGhpcyBS
RkMgdjIgc2VyaWVzIGJhY2sgaW4gU2VwdGVtYmVyLiBJbmRpdmlkdWFsIHBhdGNoZXMgaGF2ZSBh
Cj4gPiA+ID4gY2hhbmdlbG9nIGF0dGFjaGVkIGF0IHRoZSBib3R0b20gb2YgdGhlIGNvbW1pdCBt
ZXNzYWdlLiBUaG9zZSB3aGljaAo+ID4gPiA+IEkgaGF2ZSBmaW5pc2hlZCB1cGRhdGluZyBoYXZl
IG15IFMtby1iIG9uIHRoZW0sIHRob3NlIHdoaWNoIHN0aWxsIGhhdmUKPiA+ID4gPiBvdXRzdGFu
ZGluZyByZXZpZXcgY29tbWVudHMgZnJvbSBSRkMgdjIgZG8gbm90LiBJbiBzb21lIG9mIHRoZXNl
IGNhc2VzCj4gPiA+ID4gSSd2ZSBhc2tlZCBxdWVzdGlvbnMgYW5kIGFtIHdhaXRpbmcgZm9yIHJl
c3BvbnNlcy4KPiA+ID4gPgo+ID4gPiA+IEknbSBwb3N0aW5nIHRoaXMgYXMgUkZDIHYzIGJlY2F1
c2UgdGhlcmUncyBzdGlsbCBzb21lIHVuYWRkcmVzc2VkCj4gPiA+ID4gY29tbWVudHMgYW5kIGl0
J3MgY2xlYXJseSBub3QgcmVhZHkgZm9yIG1lcmdpbmcuIEV2ZW4gaWYgaXQgd2FzIHJlYWR5Cj4g
PiA+ID4gdG8gYmUgbWVyZ2VkLCBpdCBpcyB0b28gbGF0ZSBpbiB0aGlzIGRldmVsb3BtZW50IGN5
Y2xlIHRvIGJlIHRha2luZwo+ID4gPiA+IHRoaXMgY2hhbmdlIGluLCBzbyB0aGVyZSB3b3VsZCBi
ZSBsaXR0bGUgcG9pbnQgcG9zdGluZyBpdCBub24tUkZDLgo+ID4gPiA+IEFsc28gSmFtZXMgc3Rh
dGVkIHRoYXQgaGUncyB3YWl0aW5nIGZvciBjb25maXJtYXRpb24gZnJvbSB0aGUKPiA+ID4gPiBL
dWJlcm5ldGVzL0thdGEgZm9sayAtIEkgaGF2ZSBubyBpZGVhIHdoYXQgdGhlIHN0YXR1cyBpcyB0
aGVyZS4KPiA+ID4gPgo+ID4gPiA+IEkgd2lsbCBiZSBzZW5kaW5nIGVhY2ggcGF0Y2ggaW5kaXZp
ZHVhbGx5IHRvIGEgd2lkZXIgYXVkaWVuY2UKPiA+ID4gPiBhcHByb3ByaWF0ZSBmb3IgdGhhdCBw
YXRjaCAtIGFwb2xvZ2llcyB0byB0aG9zZSBtaXNzaW5nIG91dCBvbiB0aGlzCj4gPiA+ID4gY292
ZXIgbWVzc2FnZS4gSSBoYXZlIGFkZGVkIG1vcmUgbWFpbGluZyBsaXN0cyB0byB0aGUgc2VyaWVz
IHdpdGggdGhlCj4gPiA+ID4gZXhjZXB0aW9uIG9mIHRoZSBhY3BpY2EgbGlzdCBpbiBhIGhvcGUg
b2YgdGhpcyBjb3ZlciBtZXNzYWdlIGFsc28KPiA+ID4gPiByZWFjaGluZyB0aG9zZSBmb2xrLgo+
ID4gPiA+Cj4gPiA+ID4gVGhlIGNoYW5nZXMgdGhhdCBhcmVuJ3QgaW5jbHVkZWQgYXJlOgo+ID4g
PiA+Cj4gPiA+ID4gMS4gVXBkYXRlcyBmb3IgbXkgcGF0Y2ggdGhhdCB3YXMgbWVyZ2VkIHZpYSBU
aG9tYXMgKHRoYW5rcyEpOgo+ID4gPiA+ICAgIGM0ZGQ4NTRmNzQwYyBjcHUtaG90cGx1ZzogUHJv
dmlkZSBwcm90b3R5cGVzIGZvciBhcmNoIENQVSByZWdpc3RyYXRpb24KPiA+ID4gPiAgICByYXRo
ZXIgdGhhbiBoYXZpbmcgdGhpcyBjaGFuZ2Ugc3ByZWFkIHRocm91Z2ggSmFtZXMnIHBhdGNoZXMu
Cj4gPiA+ID4KPiA+ID4gPiAyLiBOZXcgcGF0Y2ggLSBzaW1wbGlmaWNhdGlvbiBvZiBQQS1SSVND
J3Mgc21wX3ByZXBhcmVfYm9vdF9jcHUoKQo+ID4gPiA+Cj4gPiA+ID4gMy4gTW92ZWQgIkFDUEk6
IFVzZSB0aGUgYWNwaV9kZXZpY2VfaXNfcHJlc2VudCgpIGhlbHBlciBpbiBtb3JlIHBsYWNlcyIK
PiA+ID4gPiAgICBhbmQgIkFDUEk6IFJlbmFtZSBhY3BpX3NjYW5fZGV2aWNlX25vdF9wcmVzZW50
KCkgdG8gYmUgYWJvdXQKPiA+ID4gPiAgICBlbnVtZXJhdGlvbiIgdG8gdGhlIGJlZ2lubmluZyBv
ZiB0aGUgc2VyaWVzIC0gdGhlc2UgdHdvIHBhdGNoZXMgYXJlCj4gPiA+ID4gICAgYWxyZWFkeSBx
dWV1ZWQgdXAgZm9yIG1lcmdpbmcgaW50byA2LjcuCj4gPiA+ID4KPiA+ID4gPiA0LiBNb3ZlZCAi
YXJtNjQsIGlycWNoaXAvZ2ljLXYzLCBBQ1BJOiBNb3ZlIE1BRFQgR0lDQyBlbmFibGVkIGNoZWNr
IGludG8KPiA+ID4gPiAgICBhIGhlbHBlciIgdG8gdGhlIGJlZ2lubmluZyBvZiB0aGUgc2VyaWVz
LCB3aGljaCBoYXMgYmVlbiBzdWJtaXR0ZWQsCj4gPiA+ID4gICAgYnV0IGFzIHlldCB0aGUgZmF0
ZSBvZiB0aGF0IHBvc3RpbmcgaXNuJ3Qga25vd24uCj4gPiA+ID4KPiA+ID4gPiBUaGUgZmlyc3Qg
Zm91ciBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGFyZSBwcm92aWRlZCBmb3IgY29tcGxldG5lc3Mg
b25seS4KPiA+ID4gPgo+ID4gPiA+IFRoZXJlIGlzIGFuIGFkZGl0aW9uYWwgcGF0Y2ggaW4gSmFt
ZXMnIGdpdCB0cmVlIHRoYXQgaXNuJ3QgaW4gdGhlIHNldAo+ID4gPiA+IG9mIHBhdGNoZXMgdGhh
dCBKYW1lcyBwb3N0ZWQ6ICJBQ1BJOiBwcm9jZXNzb3I6IE9ubHkgY2FsbAo+ID4gPiA+IGFyY2hf
dW5yZWdpc3Rlcl9jcHUoKSBpZiBIT1RQTFVHX0NQVSBpcyBzZWxlY3RlZCIgd2hpY2ggbG9va3Mg
dG8gbWUgdG8KPiA+ID4gPiBiZSBhIHdvcmthcm91bmQgZm9yIGFyY2hfdW5yZWdpc3Rlcl9jcHUo
KSBiZWluZyB1bmRlciB0aGUgaWZkZWYuIEkndmUKPiA+ID4gPiBjb21tZW50ZWQgb24gdGhpcyBv
biB0aGUgUkZDIHYyIHBvc3RpbmcgbWFraW5nIGEgc3VnZ2VzdGlvbiwgYnV0IGFzIHlldAo+ID4g
PiA+IGhhdmVuJ3QgaGFkIGFueSByZXNwb25zZS4KPiA+ID4gPgo+ID4gPiA+IEkndmUgaW5jbHVk
ZWQgYWxtb3N0IGFsbCBvZiBKYW1lcycgb3JpZ2luYWwgY292ZXJpbmcgYm9keSBiZWxvdyB0aGUK
PiA+ID4gPiBkaWZmc3RhdC4KPiA+ID4gPgo+ID4gPiA+IFRoZSByZWFzb24gdGhhdCBJJ20gZG9p
bmcgdGhpcyBpcyB0byBoZWxwIG1vdmUgdGhpcyBjb2RlIGZvcndhcmQgc28KPiA+ID4gPiBob3Bl
ZnVsbHkgaXQgY2FuIGJlIG1lcmdlZCAtIHdoaWNoIGlzIHdoeSBJIGhhdmUgYmVlbiBrZWVuIHRv
IGRpZyBvdXQKPiA+ID4gPiBmcm9tIEphbWVzJyBwYXRjaGVzIGFueXRoaW5nIHRoYXQgY2FuIGJl
IG1lcmdlZCBhbmQgc3VibWl0IGl0Cj4gPiA+ID4gc2VwYXJhdGVseSwgc2luY2UgdGhpcyBpcyBh
IGZlYXR1cmUgZm9yIHdoaWNoIHNvbWUgdXNlcnMgaGF2ZSBhCj4gPiA+ID4gZGVmaW5pdGUgbmVl
ZCBmb3IuCj4gPiA+Cj4gPiA+IEkndmUgZ29uZSB0aHJvdWdoIHRoZSBzZXJpZXMgYW5kIHRoZXJl
IGlzIGF0IGxlYXN0IG9uZSB0aGluZyBpbiBpdAo+ID4gPiB0aGF0IGNvbmNlcm5zIG1lIGEgbG90
IGFuZCBzb21lIG90aGVycyB0aGF0IGF0IGxlYXN0IGFwcGVhciB0byBiZQo+ID4gPiByZWFsbHkg
cXVlc3Rpb25hYmxlLgo+ID4gPgo+ID4gPiBJIG5lZWQgbW9yZSB0aW1lIHRvIHNlbmQgY29tbWVu
dHMgd2hpY2ggSSdtIG5vdCBnb2luZyB0byBkbyBiZWZvcmUgdGhlCj4gPiA+IDYuNyBtZXJnZSB3
aW5kb3cgKHNvcnJ5KSwgYnV0IGZyb20gd2hhdCBJIGNhbiBzYXkgcmlnaHQgbm93LCB0aGlzIGlz
Cj4gPiA+IG5vdCBsb29raW5nIGdvb2QuCj4gPgo+ID4gSGkgUmFmYWVsLAo+ID4KPiA+IFdpbGwg
eW91IGJlIGFibGUgdG8gc2VuZCB5b3VyIGNvbW1lbnRzLCBzbyB0aGF0IHdlIGNhbiBmaW5kIG91
dCB3aGF0Cj4gPiB5b3VyIG90aGVyIGNvbmNlcm5zIGFyZSBwbGVhc2U/IEknbSBnZXR0aW5nIHF1
ZXN0aW9ucyBmcm9tIGludGVyZXN0ZWQKPiA+IHBhcnRpZXMgd2hvIHdhbnQgdG8ga25vdyB3aGF0
IHlvdXIgY29uY2VybnMgYXJlLgo+ID4KPiA+IE5vdGhpbmcgbXVjaCBoYXMgY2hhbmdlZCB0byB0
aGUgQUNQSSBjaGFuZ2VzLCBzbyBJIHRoaW5rIGl0J3Mgc3RpbGwKPiA+IHZhbGlkIHRvIGhhdmUg
dGhlIGNvbW1lbnRzIGJhY2sgZm9yIHRoaXMuCj4KPiBIaSBSYWZhZWwsCj4KPiBBbm90aGVyIGdl
bnRsZSBwcm9kIG9uIHRoaXMuLi4KClRoZXJlIHdhcyBhIHNlbGVjdGlvbiBvZiB0aGUgcGF0Y2hl
cyBpbiB0aGUgc2VyaWVzIHNlbnQgc2VwYXJhdGVseSBhbmQKSSBiZWxpZXZlIHRoYXQgc29tZSBv
ZiB0aGVtIGhhdmUgYmVlbiBhcHBsaWVkIGFscmVhZHkuCgpDYW4geW91IHBsZWFzZSBzZW5kIHRo
ZSByZW1haW5pbmcgcGF0Y2hlcyBhZ2FpbiBzbyBpdCBpcyBjbGVhciB3aGF0J3MKc3RpbGwgb3V0
c3RhbmRpbmc/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
