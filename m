Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BE1EEB570
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 21:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfs2NE6wBkAiUw47FiaSaue/8BbXp1OqZbmSntY9mIM=; b=1kXPYSgjlnUmHc
	omgnyR9ta7+joyaf7bR/9PLfFKAD60u2xcpE3utEUFH8wSJ+C5UmWta0EZTgQXBj1mEwOntO3VMaZ
	hEm7Ex22kxpp8f1GoKqgQ5EmiBLcFFHkhFEDtnNRovpTu2ovZl21JnTp+n2lL8esZER4kNEeh6BnT
	Gn4VnPj6QYx6pYEEctFfWVdKths0FXV/0Iq3C7IBQYqNWtBnOKH4X1hTPiFcF706tD3CD319VdtHC
	HI1FQLC6a1VfOxLt0IMV73k0ZgCOfKOMsqYvGtA2HBG/A/s+dZau5gIcviCWoVATa7fv90pawWNrQ
	xpFAFaMpZXqcU//MdB6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qejOt-00EZ0o-1q;
	Fri, 08 Sep 2023 21:52:27 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qejOq-00EYzJ-0c
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 21:52:26 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4935f2d6815so1509975e0c.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 14:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694209942; x=1694814742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m43PrEMsLZP2EQdS/bT6AbnWiwNqqhpPB/h3QciEWyw=;
        b=d9zPd1SbNQ0n54840tzpo3Z9cZunW6HBLivlRJbpwwgDutIx8zzsKvMbCoKcubUBD/
         XU/YBPjfNUdWBf1eAQGhvsF13h0s3KStq24stW18iMCqK7KIeCmGlxRO1AhDTEqPOCnF
         Be9uBBPPOGzcvfGICETyRNCtOd1jG6oViPw18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694209942; x=1694814742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m43PrEMsLZP2EQdS/bT6AbnWiwNqqhpPB/h3QciEWyw=;
        b=AMudclosO8lofjS8SS8pfmOC1DZpOQDR+LHYsdjK6VjbsMhIYSnobfX3YW017nKffI
         qNH++8goCBe7JKhGP93NxVaTG9RskQtuWfIqu1PnZX4ElQGhjrK8iFzgUzXqCyKTdCGu
         L/Oa7fageyP4IeO6tOpDJhxE6nV25tMgGKaQczoSYGVEww4KxhiET7521V/RN8c1aalU
         ZVUKpXObYjSGsIP+hkCA4OydcjWXAtHwAxYyR2ZzzKU5aY4pLIy/CoQ4MO16ANDher7o
         91f170uv1WQK6zq1y6FsoBXatc0Pv2SDCOKIWeyKq2kIDgqFTeAs5RcZh4tsncuA2WGC
         f3eA==
X-Gm-Message-State: AOJu0Yy5ilxQe4L8l1c9SiVPWzNiDrBy6O+A9zMVzCnfDyQyrPQYMhK7
	VMEu0APL7gMwyRiQsEHD4JEoGYsIw0rls0VUOOY=
X-Google-Smtp-Source: AGHT+IGCuWHCjP5h1oUhV8lU5YeknES8cgig0+HafnmQk8JZKomxrPc/cZCBQL2j2aG++sSnbonbyQ==
X-Received: by 2002:a05:6122:250d:b0:48d:969:af8b with SMTP id cl13-20020a056122250d00b0048d0969af8bmr4631327vkb.1.1694209942624;
        Fri, 08 Sep 2023 14:52:22 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id n15-20020a9f314f000000b00786fd01f05bsm474169uab.24.2023.09.08.14.52.22
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 14:52:22 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-44ee1123667so2204474137.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 14:52:22 -0700 (PDT)
X-Received: by 2002:ad4:5f0d:0:b0:651:6604:bee6 with SMTP id
 fo13-20020ad45f0d000000b006516604bee6mr9638376qvb.30.1694209920738; Fri, 08
 Sep 2023 14:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
 <CAPhsuW5_qAvV0N3o+hOiAnb1=buJ1pLzqYW9D+Bwft6hxJvAeQ@mail.gmail.com>
 <CANiDSCu2YLaXv2DkfzN0GbTF1b79HnqPG=GWqodDr4X9krGjUA@mail.gmail.com> <CAPhsuW5JDPk7ZEthu7cowqp6emQOXsWgSvPM+kvnERPq4RR83w@mail.gmail.com>
In-Reply-To: <CAPhsuW5JDPk7ZEthu7cowqp6emQOXsWgSvPM+kvnERPq4RR83w@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 8 Sep 2023 23:51:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCtbo1ws7hTgeha8+V8g198GN1_NAdWV+9Hi5UZgk0cfUA@mail.gmail.com>
Message-ID: <CANiDSCtbo1ws7hTgeha8+V8g198GN1_NAdWV+9Hi5UZgk0cfUA@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] kexec: Fix kexec_file_load for llvm16 with PGO
To: Song Liu <song@kernel.org>
Cc: Eric Biederman <ebiederm@xmission.com>, Philipp Rudo <prudo@linux.vnet.ibm.com>, 
	Dave Young <dyoung@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Baoquan He <bhe@redhat.com>, 
	Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ross Zwisler <zwisler@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_145224_229392_41EF8F70 
X-CRM114-Status: GOOD (  34.75  )
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

SGkgU29uZwoKT24gRnJpLCA4IFNlcHQgMjAyMyBhdCAyMzo0OCwgU29uZyBMaXUgPHNvbmdAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSBSaWNhcmRvLAo+Cj4gVGhhbmtzIGZvciB5b3VyIGtpbmQg
cmVwbHkuCj4KPiBPbiBGcmksIFNlcCA4LCAyMDIzIGF0IDI6MTjigK9QTSBSaWNhcmRvIFJpYmFs
ZGEgPHJpYmFsZGFAY2hyb21pdW0ub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBTb25nCj4gPgo+ID4g
T24gRnJpLCA4IFNlcHQgMjAyMyBhdCAwMTowOCwgU29uZyBMaXUgPHNvbmdAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIFJpY2FyZG8gYW5kIGZvbGtzLAo+ID4gPgo+ID4gPiBPbiBG
cmksIE1heSAxOSwgMjAyMyBhdCA3OjQ44oCvQU0gUmljYXJkbyBSaWJhbGRhIDxyaWJhbGRhQGNo
cm9taXVtLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBXaGVuIHVwcmV2aW5nIGxsdm0gSSBy
ZWFsaXNlZCB0aGF0IGtleGVjIHN0b3BwZWQgd29ya2luZyBvbiBteSB0ZXN0Cj4gPiA+ID4gcGxh
dGZvcm0uCj4gPiA+ID4KPiA+ID4gPiBUaGUgcmVhc29uIHNlZW1zIHRvIGJlIHRoYXQgZHVlIHRv
IFBHTyB0aGVyZSBhcmUgbXVsdGlwbGUgLnRleHQgc2VjdGlvbnMKPiA+ID4gPiBvbiB0aGUgcHVy
Z2F0b3J5LCBhbmQga2V4ZWMgZG9lcyBub3Qgc3VwcG9ydHMgdGhhdC4KPiA+ID4gPgo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IFJpY2FyZG8gUmliYWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+Cj4g
PiA+Cj4gPiA+IFdlIGFyZSBzZWVpbmcgV0FSTklOR3MgbGlrZSB0aGUgZm9sbG93aW5nIHdoaWxl
IGtleGVjJ2luZyBhIFBHTyBhbmQKPiA+ID4gTFRPIGVuYWJsZWQga2VybmVsOgo+ID4gPgo+ID4g
PiBXQVJOSU5HOiBDUFU6IDI2IFBJRDogMTEwODk0IGF0IGtlcm5lbC9rZXhlY19maWxlLmM6OTE5
Cj4gPiA+IGtleGVjX2xvYWRfcHVyZ2F0b3J5KzB4MzdmLzB4MzkwCj4gPiA+Cj4gPiA+IEFGQUlD
VCwgdGhlIHdhcm5pbmcgd2FzIGFkZGVkIGJ5IHRoaXMgc2V0LCBhbmQgaXQgd2FzIHRyaWdnZXJl
ZCB3aGVuCj4gPiA+IHdlIGhhdmUgbWFueSAudGV4dCBzZWN0aW9ucwo+ID4gPiBpbiBwdXJnYXRv
cnkucm8uIFRoZSBrZXhlYyB3YXMgYWN0dWFsbHkgc3VjY2Vzc2Z1bC4gU28gSSB3b25kZXIKPiA+
ID4gd2hldGhlciB3ZSByZWFsbHkgbmVlZCB0aGUKPiA+ID4gV0FSTklORyBoZXJlLiBJZiB3ZSBk
aXNhYmxlIExUTyAoUEdPIGlzIHN0aWxsIGVuYWJsZWQpLCB3ZSBkb24ndCBzZWUKPiA+ID4gdGhl
IFdBUk5JTkcgYW55IG1vcmUuCj4gPiA+Cj4gPiA+IEkgYWxzbyB0ZXN0ZWQgYW4gb2xkZXIga2Vy
bmVsICg1LjE5IGJhc2VkKSwgd2hlcmUgd2UgYWxzbyBzZWUgbWFueQo+ID4gPiAudGV4dCBzZWN0
aW9ucyB3aXRoIExUTy4gSXQKPiA+ID4ga2V4ZWMoKSdlZCBmaW5lLiAoSXQgZG9lc24ndCBoYXZl
IHRoZSBXQVJOX09OKCkgaW4KPiA+ID4ga2V4ZWNfcHVyZ2F0b3J5X3NldHVwX3NlY2hkcnMpLgo+
ID4KPiA+IFlvdSBoYXZlIGJlZW4gImx1Y2t5IiB0aGF0IHRoZSBjb2RlIGhhcyBjaG9zZW4gdGhl
IGNvcnJlY3Qgc3RhcnQKPiA+IGFkZHJlc3MsIHlvdSBuZWVkIHRvIG1vZGlmeSB0aGUgbGlua2Vy
IHNjcmlwdCBvZiB5b3VyIGtlcm5lbCB0bwo+ID4gZGlzYWJsZSBQR08uCj4gPiBZb3UgbmVlZCB0
byBiYWNrcG9ydCBhIHBhdGNoIGxpa2UgdGhpczoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xrbWwvQ0FQaHN1VzVfcUF2VjBOM28raE9pQW5iMT1idUoxcEx6cVlXOUQrQndmdDZoeEp2QWVR
QG1haWwuZ21haWwuY29tL1QvI21kNjhiN2Y4MzIyMTZiMGM1NmJiZWMwYzliMDczMzJlMTgwYjli
YTJiCj4KPiBXZSBhbHJlYWR5IGhhdmUgdGhpcyBjb21taXQgaW4gb3VyIGJyYW5jaC4gQUZBSUNU
LCB0aGUgaXNzdWUgd2FzCj4gdHJpZ2dlcmVkIGJ5IExUTy4gU28gc29tZXRoaW5nIGxpa2UgdGhl
IGZvbGxvd2luZyBzZWVtcyBmaXhlcyBpdAo+IChJIGhhdmVuJ3QgZmluaXNoZWQgdGhlIGVuZC10
by1lbmQgdGVzdCB5ZXQpLiBEb2VzIHRoaXMgY2hhbmdlIG1ha2UKPiBzZW5zZSB0byB5b3U/Cgpp
ZiB0aGUgZW5kLXRvLWVuZCB3b3JrcywgcGxlYXNlIHNlbmQgaXQgYXMgYSBwYXRjaCB0byB0aGUg
bWFpbGluZyBsaXN0LgoKVGhhbmtzISA6KQoKPgo+IFRoYW5rcyBhZ2FpbiwKPiBTb25nCj4KPiBk
aWZmIC0tZ2l0IGkvYXJjaC94ODYvcHVyZ2F0b3J5L01ha2VmaWxlIHcvYXJjaC94ODYvcHVyZ2F0
b3J5L01ha2VmaWxlCj4gaW5kZXggOGY3MWFhYTA0Y2MyLi5kYzMwNmZhNzE5N2QgMTAwNjQ0Cj4g
LS0tIGkvYXJjaC94ODYvcHVyZ2F0b3J5L01ha2VmaWxlCj4gKysrIHcvYXJjaC94ODYvcHVyZ2F0
b3J5L01ha2VmaWxlCj4gQEAgLTE5LDYgKzE5LDEwIEBAIENGTEFHU19zaGEyNTYubyA6PSAtRF9f
RElTQUJMRV9FWFBPUlRTCj4gICMgb3B0aW1pemF0aW9uIGZsYWdzLgo+ICBLQlVJTERfQ0ZMQUdT
IDo9ICQoZmlsdGVyLW91dCAtZnByb2ZpbGUtc2FtcGxlLXVzZT0lCj4gLWZwcm9maWxlLXVzZT0l
LCQoS0JVSUxEX0NGTEFHUykpCj4KPiArIyBXaGVuIExUTyBpcyBlbmFibGVkLCBsbHZtIGVtaXRz
IG1hbnkgdGV4dCBzZWN0aW9ucywgd2hpY2ggaXMgbm90IHN1cHBvcnRlZAo+ICsjIGJ5IGtleGVj
LiBSZW1vdmUgLWZsdG89KiBmbGFncy4KPiArS0JVSUxEX0NGTEFHUyA6PSAkKGZpbHRlci1vdXQg
LWZsdG89JSwkKEtCVUlMRF9DRkxBR1MpKQo+ICsKPiAgIyBXaGVuIGxpbmtpbmcgcHVyZ2F0b3J5
LnJvIHdpdGggLXIgdW5yZXNvbHZlZCBzeW1ib2xzIGFyZSBub3QgY2hlY2tlZCwKPiAgIyBhbHNv
IGxpbmsgYSBwdXJnYXRvcnkuY2hrIGJpbmFyeSB3aXRob3V0IC1yIHRvIGNoZWNrIGZvciB1bnJl
c29sdmVkIHN5bWJvbHMuCj4gIFBVUkdBVE9SWV9MREZMQUdTIDo9IC1lIHB1cmdhdG9yeV9zdGFy
dCAteiBub2RlZmF1bHRsaWIKCgoKLS0gClJpY2FyZG8gUmliYWxkYQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
