Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99F2EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 02:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvFQ+EG460d9fQuy0xkrHelDZMrEVtj9BE3xyXrwnPk=; b=fXXOQGfBzyyUPE
	5vflI32n9RkHbz3O1mhB42jqD0P/oxYXGt0UZ3rJc/LcdVpmaWiLY2Q4y31OnGceImmnRQaReQ8Hz
	8NG+Kibw34EuoCht8QQJ1ElBskherJ6bi+oanUqpPUvzEYbQ/KH1Svu+HozyJkaHHbtiu3eTlbPOy
	rhQPHr41NRNpuy+unGRVJyBLJoF/KznvOPxjeG1b5g2+VtHM4f0EmEYA/ThOqyWW82Uy31GXLi+y8
	QhWUjY0up7ckPGTxWUFZENZGjt4G/E6hcxrE/IUlxm3/5Mnm9QFDEsl8R/tn2lOlrZcHCyOGfjqNs
	9qtAt67byZGrhXJ/JOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR1Ay-003kH8-0s;
	Wed, 02 Aug 2023 02:01:24 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR1Av-003kFO-1i;
	Wed, 02 Aug 2023 02:01:22 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b703a0453fso96971801fa.3;
        Tue, 01 Aug 2023 19:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690941676; x=1691546476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfJe9BpFl8b7JDGf91rp83jhgS2ZS1vO2M4ah8lJAhM=;
        b=h3VdRHTBZt3cAaKjjOGTTnH7QUnbMtm6Pfq3stfPGTm4mGpcTwULiRKf3CaYovDR20
         8BFdQiehASCHuPW0FD8aYP7gdkn0vMPjanuhskZDiKWWWq6EW0I4yFlEJXP0AdsttVU+
         sUkCi6wjzSV6FSARA9S45ckqy0Co2jFZs4AQGD9eyYwYlwN6AUpwfQpuHjGYbch1gesZ
         lMrRztTovO3MgPL1ioeEYBTRgp7uVk72WX0WEz99HSmBUE9P6ecI20k8Zu/T+R2D/u44
         1zu6DFOuvA+Uj8GnL6IoZvBklZun6O4VnzRr4+dQTWBTyF+m9jXmQvIGH+Ij769R4eBX
         BUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690941676; x=1691546476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfJe9BpFl8b7JDGf91rp83jhgS2ZS1vO2M4ah8lJAhM=;
        b=Gf3tcAp9tGQuusTqaJ17YKWuTqGnHjqSiXt86076WVZfpVfi8Ju293N34s8j+Q2VeL
         nA6T4xzardkrjco16PdAyt5PLn0bVEIC2hdNeAJwOI9iN4JlgGcHT4WiVuEDdX8KBQEc
         YUKvVpEWtb/KmPQibkYuQj44n7qtqA+9efmFWHCmlP8o9VN1lA5c6ZwsVQseH0uWn1Li
         sqWfz4Ainv5NCzeg3u7VGOhNe5/lctpSWUdDC2HH1NmqKFmkzKdl49Kyvqo2TWCsZOux
         aP/NL3bKbhegNdiG8cZe2DgivSCqLn6uYDxoysyqxQ3Hy6jSRGy5PBSlZ71UUwF8bIhn
         5dXA==
X-Gm-Message-State: ABy/qLZYmWSOAq/ib0088IX79KMqNZaD8URkvyRsbF9W5gAhBWzdc1vl
	kpTI1HAN+NUNf8lOteM8tqeL0tLdytayNgm9zU8=
X-Google-Smtp-Source: APBJJlFSc5EC10ZCdUzxQha4Ci3cTcn+L8pZloh77cez7PrKQIQzj4fBTNpduGray2L9IMoboiVn+AIBhCwewb9HLIM=
X-Received: by 2002:a2e:b001:0:b0:2b6:c2e4:a57a with SMTP id
 y1-20020a2eb001000000b002b6c2e4a57amr4186390ljk.38.1690941676288; Tue, 01 Aug
 2023 19:01:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <ZMKI8RknjjZBOaxf@google.com>
 <CAJve8o=GZnLLedT7TvCLvgd5Z3ZxJNfM6gG03Eyc+7krtMY--g@mail.gmail.com> <20230728-5b0f530eba70ad08e8f4a67d@orel>
In-Reply-To: <20230728-5b0f530eba70ad08e8f4a67d@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 2 Aug 2023 10:01:05 +0800
Message-ID: <CAJve8onvmDtD_GsbkUChzf6Sbt37FpfNvWEd+rJr7F1NxfjnCg@mail.gmail.com>
Subject: Re: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Sean Christopherson <seanjc@google.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Vishal Annapurve <vannapurve@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_190121_574390_01F45B4D 
X-CRM114-Status: GOOD (  23.39  )
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

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgNTo1N+KAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMDk6Mzc6
MzZBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBPbiBUaHUsIEp1bCAyNywgMjAyMyBhdCAx
MToxNOKAr1BNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gVGh1LCBKdWwgMjcsIDIwMjMsIEhhaWJvIFh1IHdyb3RlOgo+ID4gPiA+
IFRoZSBzc3RjX3RpbWVyIHNlbGZ0ZXN0IGlzIHVzZWQgdG8gdmFsaWRhdGUgU3N0YyB0aW1lciBm
dW5jdGlvbmFsaXR5Cj4gPiA+ID4gaW4gYSBndWVzdCwgd2hpY2ggc2V0cyB1cCBwZXJpb2RpYyB0
aW1lciBpbnRlcnJ1cHRzIGFuZCBjaGVjayB0aGUKPiA+ID4gPiBiYXNpYyBpbnRlcnJ1cHQgc3Rh
dHVzIHVwb24gaXRzIHJlY2VpcHQuCj4gPiA+ID4KPiA+ID4gPiBUaGlzIEtWTSBzZWxmdGVzdCB3
YXMgcG9ydGVkIGZyb20gYWFyY2g2NCBhcmNoX3RpbWVyIGFuZCB0ZXN0ZWQKPiA+ID4gPiB3aXRo
IExpbnV4IHY2LjUtcmMzIG9uIGEgUWVtdSByaXNjdjY0IHZpcnQgbWFjaGluZS4KPiA+ID4KPiA+
ID4gV291bGQgaXQgYmUgcG9zc2libGUgdG8gZXh0cmFjdCB0aGUgQVJNIGJpdHMgZnJvbSBhcmNo
X3RpbWVyIGFuZCBtYWtlIHRoZSBidWxrIG9mCj4gPiA+IHRoZSB0ZXN0IGNvbW1vbiB0byBBUk0g
YW5kIFJJU0MtVj8gIEF0IGEgZ2xhbmNlLCB0aGVyZSBpcyBxdWl0ZSBhIGJpdCBvZiBjb3B5K3Bh
c3RlLgo+ID4KPiA+IFN1cmUsIEkgd2lsbCBoYXZlIGEgdHJ5IHRvIGNvbnNvbGlkYXRlIHRoZSBj
b21tb24gY29kZSBmb3IgQVJNIGFuZCBSSVNDLVYgaW4gdjIuCj4gPgo+Cj4gWWVzLCBhZmFpY3Qs
IHdlIHNob3VsZCBiZSBhYmxlIHRvIG1ha2UgYWFyY2g2NC9hcmNoX3RpbWVyLmMgYW5vdGhlciAi
c3BsaXQKPiB0ZXN0IiwgbGlrZSB3ZSBkaWQgZm9yIGFhcmNoNjQvZ2V0LXJlZy1saXN0LmMsIGJ1
dCBiZWZvcmUgd2UgZG8gdGhhdCwgSSdkCj4gbGlrZSB0byBnZXQgYW4gYWNrIGZyb20gdGhlIEFy
bSBtYWludGFpbmVycyBvbiB0aGUgZ2V0LXJlZy1saXN0IHNwbGl0IHRvCj4gYmUgc3VyZSB0aGF0
IGFwcHJvYWNoIGlzIGFjY2VwdGFibGUuCj4KClllcywgd2UgY2FuIHJlLXVzZSB0aGUgc3BsaXQg
bWV0aG9kLgoKU2luY2UgdGhlcmUgaXMgbGVzcyBjb25maWd1cmF0aW9uIGRhdGEgdGhhdCBzaG91
bGQgYmUgaGFuZGxlZCwgSSB0aGluawppdCBtYXkgYmUKZWFzaWVyIGZvciB0aGUgdGltZXIgdGVz
dCAgdG8gY29uc29saWRhdGUgdGhlIGNvZGUsIHNpbmNlIG1vc3Qgb2YgdGhlCm9wZXJhdGlvbnMK
Y2FuIGJlIG92ZXJsb2FkZWQgZm9yIGRpZmZlcmVudCBBUkNILgoKSSdsbCBoYXZlIGEgdHJ5IGFu
ZCBzZW5kIHRoZSB2MiBzb29uIQoKVGhhbmtzIQoKPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
