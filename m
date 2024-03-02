Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD360C54798
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Mar 2024 15:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k3G2vxru6x2FZR0IjqMQl3lE5tlgvjPjWdd9wKeU9mk=; b=Adz/Ni4x4yBt10QPiDMneOpwsH
	dvFOBAvFhehT7H8umve7o3fBvc6hLxnlYeIkCDeULaKosA+7MMcB1T9HxAaNKCwJ6xEUF4E8gz3iD
	w53buv4vYbwAH6hpT0HcxcTyTAtpbqOqzVNmOrMfZzKcEO8zutYierD7MZLaplTww1maanFQK57D2
	7XhX/MQzhRU8BFo/KTGUg9CnoyXh5J6ZgvU8wS9ljtr1c47/8DmksVkO9or/B4Rn6T8ZE6I6B7KIk
	6+ySLYs4y4yKULEVKyMfu9p1JgCt8q32nY21Q1JsypBLSVyRrvdU7r/ctJ2y3mjIHhLeztfKzIkQ4
	rGl3DDOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgQwZ-00000003nt0-1pH5;
	Sat, 02 Mar 2024 15:06:31 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgQwW-00000003nrq-1fZG;
	Sat, 02 Mar 2024 15:06:29 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-60978e6f9a3so27174837b3.3;
        Sat, 02 Mar 2024 07:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709391987; x=1709996787; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrSAlaPh6y0XeZbwLQygm09FiBVmDsRwj6kIPbpO+ac=;
        b=MUvx+q3c93YBtNCygje7X0hcGOPRYIIo9SL3C1mPiLSVvJs+bJ79DywMFn3edjcEWo
         mteI4ukhavycDGyjowjCf8eMw/BXSGOauLfrKGpjRtk+Q7niBtYv9WUM8OaVM7m9Rm2u
         524sl9fm8Zte3LBm9TDxz1QW1JLp+iYdwB7MWS32UzBbMcEJY4VMp1Jx77ddbjG8GAK6
         V94hgBn3dsLg9mMfkMu1HWyABkhs+/XdSVIjT5rT9nJHAwH7zsoBekGC3xplXkTN2ctP
         hMPXlSp2Med5zrTcLVXlZiV6OyxYese1LEYykKVJ8T/kDWA035jxYdKc7IXWeqIqNI8k
         e78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709391987; x=1709996787;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrSAlaPh6y0XeZbwLQygm09FiBVmDsRwj6kIPbpO+ac=;
        b=uQK9Fb/GX4mpAzbhkybciINyp7DZnhd9Wn5WFm2pqE2K8yAHEDA5ntG0sTb0vv1MIF
         33P+8cMVGRR5/zdSw5068fbnvSFe0j6JN9EfFimr43GMrl8m7mGV/43vV+YfrMcl6w7O
         lFQ+E8T6iULWkP/4zD3mEg1jSJyOEv2kgNoi+MtX8CRwFJcNX+ebqvlcSrZp1n1wvW3k
         TPYlmIDN1cD22+HqG7pp67lUggTGbe/HiGV45KQT2kHVBwRoVtCRjGmCarbeeXxRaKzc
         OraBQ1pwi3mbnYyDB3Y0laWoVAE6BZoAyZVamwrdKaU1aGw8bZ5tgs1ir4jinTJ6nQGl
         Iivg==
X-Forwarded-Encrypted: i=1; AJvYcCW6kGei6MVXJZ4dzG/VgMlL6yQDzxSF7DtvAdddWDR/UGWQBpuGQ08WzBV317xdDwBrxjE5DugjTgJnBFtLzrgR5wJ3yyOpyWymWeqmL4mMnz94dG+0MYgMsMy9m4WobxgZ6cdazyTDnHsm3GIODscG9xHmIPQ=
X-Gm-Message-State: AOJu0YwW1FUbASIrMBEebn4FmLYX4t6NKi5uA5EdPgzflTJQatdRiejQ
	/WS3l+Ow/O9AJNZv1nG4VFd+sqMvFCifOUL2YU6uQ4bIY9Ul3JASKTpFQlr1XrG8N5CNHXFF/T0
	wRpxG7lAOEtL7BVUNMcunYAt4Feo=
X-Google-Smtp-Source: AGHT+IEaoJ0EIEJMr1Auv9LAe6hd3ruRGKQaWswy7UXoWRUhb+BsZa3cljQHfsjmVp7ROvTWXxlriSX3h2quvblOfsc=
X-Received: by 2002:a81:6f03:0:b0:608:7a9c:9a82 with SMTP id
 k3-20020a816f03000000b006087a9c9a82mr4546852ywc.47.1709391985893; Sat, 02 Mar
 2024 07:06:25 -0800 (PST)
MIME-Version: 1.0
References: <22a53b78-10d7-4a5a-a01e-b2f3a8c22e94@app.fastmail.com>
 <4c7bdf8fde9cc45174f10b9221fa58ffb450b755.camel@intel.com>
 <20240220185714.GO4163@brightrain.aerifal.cx> <9fc9c45ff6e14df80ad023e66ff7a978bd4ec91c.camel@intel.com>
 <20240220235415.GP4163@brightrain.aerifal.cx> <a57d6c7eada4b9a7c35addbc8556f5b53a0c3e6f.camel@intel.com>
 <20240221012736.GQ4163@brightrain.aerifal.cx> <d18f060d-37ac-48b1-9f67-a5c5db79b34e@sirena.org.uk>
 <20240221145800.GR4163@brightrain.aerifal.cx> <4a3809e8-61b2-4341-a868-292ba6e64e8a@sirena.org.uk>
 <20240302145702.GD1884416@port70.net>
In-Reply-To: <20240302145702.GD1884416@port70.net>
From: "H.J. Lu" <hjl.tools@gmail.com>
Date: Sat, 2 Mar 2024 07:05:49 -0800
Message-ID: <CAMe9rOoVNZ+q0MAcpW-HDuptD8WDEDddZjOycy7G=P48nJ=DSA@mail.gmail.com>
Subject: Re: [musl] Re: [PATCH v8 00/38] arm64/gcs: Provide support for GCS in userspace
To: Mark Brown <broonie@kernel.org>, "dalias@libc.org" <dalias@libc.org>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>, 
	"musl@lists.openwall.com" <musl@lists.openwall.com>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "debug@rivosinc.com" <debug@rivosinc.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "shuah@kernel.org" <shuah@kernel.org>, 
	"arnd@arndb.de" <arnd@arndb.de>, "maz@kernel.org" <maz@kernel.org>, "oleg@redhat.com" <oleg@redhat.com>, 
	"fweimer@redhat.com" <fweimer@redhat.com>, "keescook@chromium.org" <keescook@chromium.org>, 
	"james.morse@arm.com" <james.morse@arm.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>, 
	"will@kernel.org" <will@kernel.org>, "brauner@kernel.org" <brauner@kernel.org>, 
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "ardb@kernel.org" <ardb@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"thiago.bauermann@linaro.org" <thiago.bauermann@linaro.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "sorear@fastmail.com" <sorear@fastmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_070628_478154_2A7CCCED 
X-CRM114-Status: GOOD (  25.47  )
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

T24gU2F0LCBNYXIgMiwgMjAyNCBhdCA2OjU34oCvQU0gU3phYm9sY3MgTmFneSA8bnN6QHBvcnQ3
MC5uZXQ+IHdyb3RlOgo+Cj4gKiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IFsyMDI0
LTAyLTIxIDE3OjM2OjEyICswMDAwXToKPgo+ID4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMDk6
NTg6MDFBTSAtMDUwMCwgZGFsaWFzQGxpYmMub3JnIHdyb3RlOgo+ID4gPiBPbiBXZWQsIEZlYiAy
MSwgMjAyNCBhdCAwMTo1MzoxMFBNICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOgo+ID4gPiA+IE9u
IFR1ZSwgRmViIDIwLCAyMDI0IGF0IDA4OjI3OjM3UE0gLTA1MDAsIGRhbGlhc0BsaWJjLm9yZyB3
cm90ZToKPiA+ID4gPiA+IE9uIFdlZCwgRmViIDIxLCAyMDI0IGF0IDEyOjM1OjQ4QU0gKzAwMDAs
IEVkZ2Vjb21iZSwgUmljayBQIHdyb3RlOgo+ID4KPiA+ID4gPiA+ID4gKElOQ1NTUCwgUlNUT1JT
U1AsIGV0YykuIFRoZXNlIGFyZSBhIGNvbGxlY3Rpb24gb2YgaW5zdHJ1Y3Rpb25zIHRoYXQKPiA+
ID4gPiA+ID4gYWxsb3cgbGltaXRlZCBjb250cm9sIG9mIHRoZSBTU1AuIFdoZW4gc2hhZG93IHN0
YWNrIGdldHMgZGlzYWJsZWQsCj4gPiA+ID4gPiA+IHRoZXNlIHN1ZGRlbmx5IHR1cm4gaW50byAj
VUQgZ2VuZXJhdGluZyBpbnN0cnVjdGlvbnMuIFNvIGFueSBvdGhlcgo+ID4gPiA+ID4gPiB0aHJl
YWRzIGV4ZWN1dGluZyB0aG9zZSBpbnN0cnVjdGlvbnMgd2hlbiBzaGFkb3cgc3RhY2sgZ290IGRp
c2FibGVkCj4gPiA+ID4gPiA+IHdvdWxkIGJlIGluIGZvciBhIG5hc3R5IHN1cnByaXNlLgo+ID4K
PiA+ID4gPiA+IFRoaXMgaXMgdGhlIGtlcm5lbCdzIHByb2JsZW0gaWYgdGhhdCdzIGhhcHBlbmlu
Zy4gSXQgc2hvdWxkIGJlCj4gPiA+ID4gPiB0cmFwcGluZyB0aGVzZSBhbmQgcmV0dXJuaW5nIGlt
bWVkaWF0ZWx5IGxpa2UgYSBOT1AgaWYgc2hhZG93IHN0YWNrCj4gPiA+ID4gPiBoYXMgYmVlbiBk
aXNhYmxlZCwgbm90IGdlbmVyYXRpbmcgU0lHSUxMLgo+ID4KPiA+ID4gPiBJJ20gbm90IHN1cmUg
dGhhdCdzIGdvaW5nIHRvIHdvcmsgb3V0IHdlbGwsIGFsbCBpdCB0YWtlcyBpcyBzb21lIGNvZGUK
PiA+ID4gPiB0aGF0J3MgbG9va2luZyBhdCB0aGUgc2hhZG93IHN0YWNrIGFuZCBleHBlY3Rpbmcg
c29tZXRoaW5nIHRvIGhhcHBlbiBhcwo+ID4gPiA+IGEgcmVzdWx0IG9mIHRoZSBpbnN0cnVjdGlv
bnMgaXQncyBleGVjdXRpbmcgYW5kIHdlIHJ1biBpbnRvIHRyb3VibGUuICBBCj4gPgo+ID4gPiBJ
IHNhaWQgTk9QIGJ1dCB0aGVyZSdzIG5vIHJlYXNvbiBpdCBzdHJpY3RseSBuZWVkcyB0byBiZSBh
IE5PUC4gSXQKPiA+ID4gY291bGQgaW5zdGVhZCBkbyBzb21ldGhpbmcgcmVhc29uYWJsZSB0byBj
b252ZXkgdGhlIHN0YXRlIG9mIHJhY2luZwo+ID4gPiB3aXRoIHNoYWRvdyBzdGFjayBiZWluZyBk
aXNhYmxlZC4KPiA+Cj4gPiBUaGlzIGZlZWxzIGxpa2UgaXQncyBnZXR0aW5nIGNvbXBsaWNhdGVk
IGFuZCBJIGZlYXIgaXQgbWF5IGJlIGFuIHVwaGlsbAo+ID4gc3RydWdnbGUgdG8gZ2V0IHN1Y2gg
Y29kZSBtZXJnZWQsIGF0IGxlYXN0IGZvciBhcm02NC4gIE15IGluc3RpbmN0IGlzCj4KPiB0aGUg
YWFyY2g2NCBiZWhhdmlvdXIgaXMgYWxyZWFkeSBub3AKPiBmb3IgZ2NzIGluc3RydWN0aW9ucyB3
aGVuIGdjcyBpcyBkaXNhYmxlZC4KPiB0aGUgaXNhIHdhcyBkZXNpZ25lZCBzbyBhc3luYyBkaXNh
YmxlIGlzCj4gcG9zc2libGUuCj4KPiBvbmx5IHg4NiBsaW51eCB3b3VsZCBoYXZlIHRvIGVtdWxh
dGUgdGhpcy4KCk9uIExpbnV4L3g4Niwgbm9ybWFsIGluc3RydWN0aW9ucyBhcmUgdXNlZCB0byB1
cGRhdGUgU1NQIGFmdGVyCmNoZWNraW5nIFNIU1RLIGlzIGVuYWJsZWQuICAgSWYgU0hTVEsgaXMg
ZGlzYWJsZWQgaW4gYmV0d2VlbiwKcHJvZ3JhbSBiZWhhdmlvciBtYXkgYmUgdW5kZWZpbmVkLgoK
LS0gCkguSi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
