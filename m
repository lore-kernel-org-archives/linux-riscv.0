Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CED8D17151
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 01:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gf07fphGEmuObE4MqvFvx80XybakeN7QzDdOOmExtIY=; b=Nu9YmU23f1jv4POyH4EzSu2Y9T
	6BXB4JzX9bnBIdXNDZsKtmf08rojkCXnrHTgFmEcbAWeh7HMqsnnKTBCbqLWT0S3XRZM1oKH/MlAv
	qT1E31mhN1I1YpztHOJyPjkHzhFzBgJ6Vij4Ltt89HVZg7f5hJkaHqaGNhK2MAyGEHuHk7R50N+gk
	gVTHl1r8/UCYReRT1HVkstf0TzZaEfLiR7fGAk96cGlnntaqhl9aHTCmYgjZn6ELctbLNdrYTvno+
	moux3tLj7hnwe8khIWUoCBjxfseJ616QGPAufF9QH5NUwwRx4R+9eUomiNL5mwUhBC5EjopwlkuYG
	A3QX0gog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t33Id-000000098ru-3feQ;
	Tue, 22 Oct 2024 01:03:03 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t32iI-000000093cl-0JuI
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 00:25:32 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0b8fa94718so8131789276.0
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 17:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729556727; x=1730161527; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsmHAIiTKT1PsAHJrcn3wc4lWOtEN6U6cuZlArYcGvA=;
        b=UxrE7+E9NrxVM8sCIENJV5N5VAJkDJSnFwCF+AihPUHX+tE1VRtYw6FkQ4l3a4kzAM
         HwsSMQ2o54r3od83tUFqbrdhsMD+XPl1FMRChKBs5n09Vjh5pwWG+Q/MzGgYWlMOe9+B
         p0oiYSN7Q1d2KQVl9DBh/4WSNQIbnCZ8hW2p9pSpnRzsl6Q3IeQOsUUwnpYTkziaIbj7
         0rGrGIsapSAeIHuQGWGBqLL4dxLpuBl7dmYf7Epo18lzMp8S9Mdt3+sombzZpZmdz1Id
         aFAq1ChD7J9MdBMZOD7ABgVkh8ei1ufI4L+sHR1AcswpeaXEzd6gfvBim7IrxAdLm1pk
         0NLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729556727; x=1730161527;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MsmHAIiTKT1PsAHJrcn3wc4lWOtEN6U6cuZlArYcGvA=;
        b=QVkboZGnX5sw/oG6MzkvbQOv2JKbThaBQ4LHWXfo7YcRfUvCTzdjOPzdsn3EHILgfL
         BZE2jkF9VGCIr+4M5V2ebxI72oFGpJ9u3VX+Pa4vKSDI6UYFR4wKB9ujH/EtZaxw9nAf
         39iqlzdkfvlRl973Q8edH9A+cOzB0B4eQV9siczRir6SqDEah2DGf6I5SAYTFYVQVN1J
         I7VY4Oh5vFyNyt1PzeJiMoOTvxng6hZbV6kfGxnj/UBf8wZwglsyXZgwH2Gtqlgdw/eA
         dqQl+5iKt1tPau/x3Sc3MCThcSLliW92XsN9fJQo78Ak/WInSoeW+UnEXxe3VSwWgi3w
         e/Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVTArrnz0GPqqnJaLUVPmiJgWg0YyG31O+hliPYuL6K3+VYrWGF37MRFzUfKo2AX647v2ttGXK72BEq0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXK7ANTG2KwTxqVP2RDDoZcow1FA/q4OQUFqTryct3HnPzWFWf
	/Oo/n1YA4n6vEW6XfRy36xFwVNnAlVG9zqPhw1wmqt1gGZzw3GXsFksNzMJfEG306AowooM9oQN
	Rzw==
X-Google-Smtp-Source: AGHT+IFt751p/7pq+BSWT0h/wj8dy6pof7dpapFjoV1RFsMPc4iJ6WxDdC7RwTVAow0VYtv4igk8p4vJkHM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:aae9:0:b0:e29:1893:f461 with SMTP id
 3f1490d57ef6-e2bb0feddc7mr22594276.0.1729556726690; Mon, 21 Oct 2024 17:25:26
 -0700 (PDT)
Date: Mon, 21 Oct 2024 17:25:25 -0700
In-Reply-To: <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
Message-ID: <Zxbw9XcFCHYR1Ald@google.com>
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Alex =?utf-8?Q?Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_172530_132136_B201895A 
X-CRM114-Status: GOOD (  14.07  )
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

T24gVGh1LCBPY3QgMTcsIDIwMjQsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gVGh1LCBPY3Qg
MTAsIDIwMjQgYXQgODoyNOKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUu
Y29tPiB3cm90ZToKPiA+IHYxMzoKPiA+ICAtIFJlYmFzZWQgb250byB2Ni4xMi1yYzIKPiA+ICAt
IENvbGxlY3QgcmV2aWV3cy4gW0FsZXggYW5kIG90aGVyc10KPiA+ICAtIEZpeCBhIHRyYW5zaWVu
dCBidWcgaW4gYXJtNjQgYW5kIFJJU0MtViB3aGVyZSBLVk0gd291bGQgbGVhayBhIHBhZ2UKPiA+
ICAgIHJlZmNvdW50LiBbT2xpdmVyXQo+ID4gIC0gRml4IGEgZGFuZ2xpbmcgY29tbWVudC4gW0Fs
ZXhdCj4gPiAgLSBEcm9wIGt2bV9sb29rdXBfcGZuKCksIGFzIHRoZSB4ODYgdGhhdCAibmVlZGVk
IiBpdCB3YXMgc3R1cGlkIGFuZCBpcyAod2FzPykKPiA+ICAgIGVsaW1pbmF0ZWQgaW4gdjYuMTIu
Cj4gPiAgLSBEcm9wIGNoZWNrX3VzZXJfcGFnZV9od3BvaXNvbigpLiBbUGFvbG9dCj4gPiAgLSBE
cm9wIHRoZSBhcm02NCBNVEUgZml4ZXMgdGhhdCB3ZW50IGludG8gNi4xMi4KPiA+ICAtIFNsaWdo
dGx5IHJlZG8gdGhlIGd1ZXN0X21lbWZkIGludGVyYWN0aW9uIHRvIGFjY291bnQgZm9yIDYuMTIg
Y2hhbmdlcy4KPiAKPiBIZXJlIGlzIG15IG93biBzdW1tYXJ5IG9mIHRoZSBjaGFuZ2VzOgoKWWVw
LCBsb29rcyByaWdodCB0byBtZS4KCj4gcGF0Y2hlcyByZW1vdmVkIGZyb20gdjEyOgo+IDAxLzAy
IC0gYWxyZWFkeSB1cHN0cmVhbQo+IDA5IC0gbW92ZWQgdG8gc2VwYXJhdGUgQS9EIHNlcmllcyBb
MV0KPiAzNCAtIG5vdCBuZWVkZWQgZHVlIHRvIG5ldyBwYXRjaCAzNgo+IDM1IC0gZ29uZSBhZnRl
ciA2MjA1MjU3Mzk1MjEzNzZhNjVhNjkwZGY4OTllMTU5NmQ1Njc5MWY4Cj4gCj4gcGF0Y2hlcyBh
ZGRlZCBvciBzdWJzdGFudGlhbGx5IGNoYW5nZWQgaW4gdjEzOgo+IDA1LzA2LzA3IC0gbmV3LCBz
dWdnZXN0ZWQgYnkgWWFuIFpoYW8KPiAwOCAtIGNvZGUgd2FzIGZvbGRlZCBmcm9tIG1tdV9zcHRl
X2FnZSBpbnRvIGt2bV9ybWFwX2FnZV9nZm5fcmFuZ2UKPiAxNCAtIG5ldywgc3VnZ2VzdGVkIGJ5
IG1lIGluIHJlcGx5IHRvIDg0Lzg0ICh5dWNrKQo+IDE1IC0gbmV3LCBzdWdnZXN0ZWQgYnkgbWUg
aW4gcmVwbHkgdG8gODQvODQKPiAxOSAtIHNvbWV3aGF0IHJld3JpdHRlbiBmb3IgbmV3IGZvbGxv
d19wZm5tYXAgQVBJCj4gMjcgLSBzbWFsbGVyIGNoYW5nZXMgZHVlIHRvIG5ldyBmb2xsb3dfcGZu
bWFwIEFQSQo+IDM2IC0gcmV3cml0dGVuLCBzdWdnZXN0ZWQgYnkgbWUKPiA0NSAtIG5ldywgY2xl
YW51cAo+IDQ2IC0gbXVjaCBzaW1wbGlmaWVkIGR1ZSB0byBuZXcgcGF0Y2ggNDUKPiAKPiBMb29r
cyBnb29kIHRvIG1lLCB0aGFua3MgYW5kIGNvbmdyYXR1bGF0aW9ucyEhIFNob3VsZCB3ZSBtZXJn
ZSBpdCBpbgo+IGt2bS9uZXh0IGFzYXA/CgpUaGF0IGhhcyBteSB2b3RlLCB0aG91Z2ggSSdtIG9i
dmlvdXMgZXh0cmVtZWx5IGJpYXNlZCA6LSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
