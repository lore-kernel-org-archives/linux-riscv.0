Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1072AF33A8E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 17:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuJrscuQ5yJvHK1y5yg4QWkB6/Bc4R+HJ8qmNVueJRc=; b=xsiUZJ+SRXHqXm
	AHeX+6We+ZHU1x0Kx1oMiIulrSlTSsT/YyfS/ou/Sgid5zlIXKkheMyL9nwrnGdLKhN8wLXpKtHgB
	QTXyqmROfivoJfm5CB/m4NBfbu78RmCkkE1dXsYKbJr3IOuXMWYKOS+55NdrYgboTnmYyJVa5hyTX
	7LZ23RpNaYf8IbUIVirHUaJcWgsfMnb1t7Z8PveZj50m3yExXM/KzxDvkqEv3KQ9+9KLPXjvI/ceN
	/PmXiobcyQL6qT4VrYPfgM9fCZqEi3Ud3tQMM8xNws8/hFgGQO/MLMGZfWsE3iAUEsSRmGeeLdPde
	kXgtbe4erQDEFS9u/Umg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTR-00000002IkL-3L9y;
	Thu, 05 Mar 2026 17:26:57 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTN-00000002Iib-3SsS
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 17:26:56 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a126c8aab9so1584731e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 09:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731611; cv=none;
        d=google.com; s=arc-20240605;
        b=LDNyDD6rCkYr5qTy1o70EnTqO4aK2kX+GX1RsF0idk5du5p9UXhCszpS9ownuYq3aw
         W8ZaaLIq67cw70kzlRfDpz4vK2WCUexKUn+d1HsDaWWUQsoGKbQInH8KxCJ0MSK/9Za3
         iRB+GWDh6oYhyDyXITgMvz01x0re55MrKvZC2YHzyoMlm95VT8UgDMPSSqejaj+rup5n
         nAGSvc1F6czoiYwQnthc9k4YZHyg0ZWo1/lEvwhzWuBoOKmFGMwu3vWyylFKJ9Ty/w6K
         6EF2RZjaba12DtmdmeLOlkhssRmXVPJaXPk5gbF37wK8nZdwQWl9ndkWMZPeqz/CINfp
         VZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        fh=3Dhx86xWPv82ln2YE76oZ9ZxXFjtf1xbc1d9p+iCFm4=;
        b=D1DeD694JEhUR4sN1tJk6kDxoM47STIbW7L1DItwg9uzv7X93oj5t3EK8ArUT5QY+c
         kwcFjx/cznf0lakp4WPY8ZLG9U2f9AHWErcWzhNFsP4FxXFm3KMDaMDiYju/+2BfxLwQ
         YXerEYscVj+2V04QJ5BPHqsmIY+2ku93YlurT7HCbYwJhmxxvoj4TH71+tRj6wKMPOtR
         RruI0vzuu71SXgJTB2wnfIuylpZfdGNnaJIEctbt0e1Ofq5oVOBba/8remXpw5GpJ8R9
         o0yw2RU7cqh3JNBDFZSrsZBXk/gWHZoPq+OyMHeM8I7Ti0KqQ2BkKpr8WCSXjIvaarR6
         de3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731611; x=1773336411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        b=tJM+5WiyXHIkTBItRsVXNII23tawwOogmqTUCQyeg90SQCR9hJ2YpPdHzIAK+xQMNM
         u064CrnRw0O6dCcKQtTZMhcXO1NHIHro9SkxNjFHaAVq7SY4igNFoAq/bmNucfQZJlhQ
         AAfIXFfYJLkgG1nL+J20HFEPkGziDWHcOyY6C02n+kIMYn/eETzH9vu5TNfxW3GbIckn
         FxC1AvpAbNmLlZlKz1D5g7TuUQtta07P2MPow9dxmRXb27THEDvLxdrx7eBKLyUTzQeL
         5VwRtdgTVub1BJdzByzE0POK3raTwhkBsaD6k4HkMRk+pF0fvj/fGimfOh+IS5MBfjJf
         aNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731611; x=1773336411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        b=WXadUauY5kvIVosOibSNtcEAB8CJ3LI46I5nBZFscLkR4qasx41Q2ChUY6q/p/FJoE
         LUML5Q55h8dAosLXN3FuC+Devs4Y3P2KC5qT4QztvT6FgNa3fBOCbDN74hSwyxj7lG/O
         Cx77anbqdOiTUsp9hZIENvDo7ege8MF4PiDlPg5mx33AT4lBGeIx5si2RofW2gfALLZW
         P6wNNNrcUkxoTwdVFdRQYkZI3/X5VJ7+1VYOEhEhpInMW5zCRRcVcI6EER5HWu/+gsKd
         GSdHx3KtH4yBkVNEI9j/IlKgUEpt9rOKhkq+u6ZoSqiT4ERis5VKrhk0rWECOdlKm04b
         9FEg==
X-Forwarded-Encrypted: i=1; AJvYcCVHrugEqe7JR2KhuGpdoKcKRrdf9GTR0G9FtloXgJy9l2qMxdon56MbeGFCs+SbwqJ/2oNq3phs+HqcwA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi6BZzdtMMpEaJGNCCmWnilVp3rfa9ucBmZJgqu8M4CRHwfTN8
	2VUVUTMmKCmNlUvXlDmAyQetieVpCdZJM7YykX3R0EAf5fzB8P6sB0QIB8E6H49R1OooNl6SU2B
	3zKfurf6Pl0E43kFn12xjQZG1vTYv04ZOw05Ziqtw
X-Gm-Gg: ATEYQzyqjPr0tr6qFrEH/9NdixPwY0EhomF666yra+LSGVbsVyJqifQxrj9o9bydxJe
	CqULPcvBE9r9BVPXXmm+8b3Qj737bUxFw8HRxbmNjc8tGUALe7wBMiFF9OwWYjqvpEItEhC7e3Z
	SbQ7Jmb2JvBKPpT450z3YPJ4OKhNIWitz+CfkV2kbL2dMTQpXoL2mqACjEHtUO15as6yUgMXRlt
	l/GSQubXS5fj+R1gjVt26jiQT+F6VcpitmHABck8Oxp/vRWbUUquneMgRDQ01FJyZdLc4MKmMB7
	h7wrSGXG
X-Received: by 2002:a05:6512:696:b0:5a1:2f18:5e19 with SMTP id
 2adb3069b0e04-5a12f185e8bmr1324271e87.22.1772731610293; Thu, 05 Mar 2026
 09:26:50 -0800 (PST)
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <aam77t8fe5RKSr2Q@google.com>
In-Reply-To: <aam77t8fe5RKSr2Q@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 09:26:22 -0800
X-Gm-Features: AaiRm52LsX1aPJ2JM5xqUBPHr_QH0uBSIJaRMA7nyUfm3apWkfHV7m2i8095U3w
Message-ID: <CALzav=etzo9A7FNQrbLCmj=pNLN5fO-a5isP1k6MuTDkJw1bqQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] KVM: selftests: Use kernel-style integer and
 g[vp]a_t types
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092653_889472_FF25E660 
X-CRM114-Status: GOOD (  14.84  )
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

T24gVGh1LCBNYXIgNSwgMjAyNiBhdCA5OjIy4oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgMjAsIDIwMjYsIERhdmlkIE1h
dGxhY2sgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyByZW5hbWVzIHR5cGVzIGFjcm9zcyBhbGwgS1ZN
IHNlbGZ0ZXN0cyB0byBtb3JlIGFsaWduIHdpdGgKPiA+IHR5cGVzIHVzZWQgaW4gdGhlIGtlcm5l
bDoKPiA+Cj4gPiAgIHZtX3ZhZGRyX3QgLT4gZ3ZhX3QKPiA+ICAgdm1fcGFkZHJfdCAtPiBncGFf
dAo+ID4KPiA+ICAgdWludDY0X3QgLT4gdTY0Cj4gPiAgIHVpbnQzMl90IC0+IHUzMgo+ID4gICB1
aW50MTZfdCAtPiB1MTYKPiA+ICAgdWludDhfdCAgLT4gdTgKPiA+Cj4gPiAgIGludDY0X3QgLT4g
czY0Cj4gPiAgIGludDMyX3QgLT4gczMyCj4gPiAgIGludDE2X3QgLT4gczE2Cj4gPiAgIGludDhf
dCAgLT4gczgKPiA+Cj4gPiBUaGUgZ29hbCBvZiB0aGlzIHNlcmllcyBpcyB0byBtYWtlIHRoZSBL
Vk0gc2VsZnRlc3RzIGNvZGUgbW9yZSBjb25jaXNlCj4gPiAodGhlIG5ldyB0eXBlIG5hbWVzIGFy
ZSBzaG9ydGVyKSBhbmQgbW9yZSBzaW1pbGFyIHRvIHRoZSBrZXJuZWwsIHNpbmNlCj4gPiBzZWxm
dGVzdHMgYXJlIGRldmVsb3BlZCBieSBrZXJuZWwgZGV2ZWxvcGVycy4KPiA+Cj4gPiB2MjoKPiA+
ICAtIFJlYXBwbHkgdGhlIHNlcmllcyBvbiB0b3Agb2Yga3ZtL3F1ZXVlCj4gPgo+ID4gdjE6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS8yMDI1MDUwMTE4MzMwNC4yNDMzMTkyLTEtZG1hdGxh
Y2tAZ29vZ2xlLmNvbQo+Cj4gU29ycnksIEkgd2FzIHRvbyBzbG93IGFuZCBtaXNzZWQgdGhlIHdp
bmRvdyB0byBnZXQgdGhpcyBpbnRvIGt2bS9uZXh0IHdpdGhvdXQKPiBjYXVzaW5nIGEgZGlzYXN0
ZXIgb2YgbWVyZ2UgY29uZmxpY3RzLgo+Cj4gSSBkb24ndCB0aGluayB5b3UgbmVlZCB0byBzZW5k
IGEgdjMgdGhvdWdoLiAgSSdsbCBwcmVwIGEgdjMsIGEgYnJhbmNoLCBhbmQgc2VuZAo+IFBhb2xv
IGEgcHVsbCByZXF1ZXN0IGR1cmluZyB0aGUgbmV4dCBtZXJnZSB3aW5kb3cuCgpTb3VuZHMgZ29v
ZCwgdGhhbmtzIFNlYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
