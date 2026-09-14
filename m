Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB90C88E72
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 21:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIrgvpeX9ycf5kg44a6VQcHLFeDfe1cdrTye97iGQRQ=; b=Tjrm43QODbb7xk
	6tSa6W+hpRnW+nrG1kaMa9+u/hsLCseb6cBZvsKZlVEUgLSimuF9gIpnoiuPjUdWtqk+9QVJAJs5U
	aJw5X1StZUtZa/1/Vzg9T6/Bj6x73tV9ivsvm7ia7TubXid6NuQlc/f/GAx6yOYKmgJsXqx0a0Ltq
	B+aEDgBU7600PLcSA90JC6TJV4N5vfXX0udNC0Ok2Qbp63O399MB9GFUo2/swZPvlr2QBz7jUTqF2
	bYB1NVdeOPRfYGi82N9nNH/A7V3gHEx4PRfzIHOQlfBFQV8FeaMOenZ/IvXpRz9HFKWNjj2H6iwki
	3ZatF3HKC0pPNgCZp+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ETu-00000004jZv-3bQg;
	Mon, 14 Sep 2026 21:44:54 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ETq-00000004jY7-0Tmh
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 21:44:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49e78adf099so20513435e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 14:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789422288; x=1790027088; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MMWuFoZNpTbVauKFWQOZe8Q8+oQNvVLrh3IMG7Y4F/I=;
        b=d3EFWHC6a0nDItJv45vgxDIhbdsQrNXrwWi3bDhTVtvAbw5NHnbeL/ss6zaEEZbCMU
         zjWZ6GGu23jjvKmuzawcwlioB6DhFzF8n40BmX9sfn+bqiTfRv5r1/J5I4eyrONwShiC
         B+4x/+RA+A10TWQYW69MECi57AFalOAvzaQfLwDTsx7HSqZaq0tdXNri5h4V3LVgrwfg
         od+e6X/HDi2IeupzQIhf8hd8Q1qRvg3iXurjGW2hfZFlspJoJHOoe7Vfz7JPBAMmD6Q9
         8TMG3ugoCDLanwZ9CzpNf43bhHOphC8z5e0okEYCl0O+0vgSWlpXR1hL/sJJim8o/Zmq
         V2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789422288; x=1790027088;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMWuFoZNpTbVauKFWQOZe8Q8+oQNvVLrh3IMG7Y4F/I=;
        b=s+ojazy4G3K1XeGHGpK73Mq0ADJhccg5egawcCa6xppbW1VI3DNGKPpwpNg5n9zh7d
         q+UEW8fgtBOs5JFMjqn314drJVQyT9iEu+o0OECmtENwj9K43ZWMxuV71Sd7wieltWhD
         n11E6uiNvLDh/TNwl6FvnubFfMcBh4EJ3o9i9JEApU06li3BbkJhch6weJbbZpdpthQT
         Df0SOP+mG0Lj76d0dfcjmVcM2F77usxnU8txWyUp0XbGdP+rotDZT3qWvMiBPR/k75qQ
         8gm6nWDsEzPuFptRDX2KX0R9TsXT3wW3kS1/IVapH/X6GpO1VQC13eYutvHsEOKwLMy7
         wXTw==
X-Forwarded-Encrypted: i=1; AKwUvBxHue96e6iQ1F+usmqW9bGY30GuSWoEPe7KERpDg0zVxucEohjyO7naoC2I6aF0SN5ybpFCfMooZU534g==@lists.infradead.org
X-Gm-Message-State: AFuF++lpOjM+rpjhzxYDO6VdYy+qanwXm2vpmnz8rOb7O3hW45CHPdB1
	W8Gxfg71fpooguDX1e+bEzL4FccjoSFfJFtLqkzSwOxqr5XTP4vvXKIW
X-Gm-Gg: AYBFou0tCGoFKqgav1IfpGS+uBnu3rZeJ/DmxoOMbNsce7Lnw63iRu2BFtYh+WVKNK8
	42ikKUt25mMKmZyGh2Zb3K6X2rLaRfOdhzf9olunuv1UmiqDzKUpLl8XEJQWtw/w8b4dfuKlHDQ
	KvMgEPIirJcjUN8znWcrJKodlWq0RmGtYLJGkOGNXa6vvcTYe3bTkOt4OkkaFOHJUHXPFMrmTzl
	WiXaPkY5I48Emad8rx1oQmPopiOfkvBFKKASdWYKrOwtPTWbnScE6/erAuSznvAHUeDW8cuA394
	EkCYyGJQ3Sh2bJdbJUtLe9KfLqGJOPPQzY98f0qGsJjPE3A6Wz0nqokJuWf3PyQC0btiNxsd8y3
	RTHb8YzNM2PBm80DMReeVwA9XMkOw1PWxiecHiHfrnxQNW7vswSvV4q6CvbtwNAPCFANWYA66W1
	do3xazBApxeDw3hRggZuEgBJC3NfbJ+J+Ukr5qCOso5PLo+EI3lqbu1jLimCdLC6Sd56vs0xbjP
	uuNQxP3cnG7/jFVJ6BZ1ChAATlyNeH2BCAC
X-Received: by 2002:a05:6000:454f:b0:487:36a:c870 with SMTP id ffacd0b85a97d-487036ac895mr3178523f8f.11.1789422288113;
        Mon, 14 Sep 2026 14:44:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed0fbsm29878025f8f.3.2026.09.14.14.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 14:44:47 -0700 (PDT)
Date: Mon, 14 Sep 2026 22:44:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-kbuild@vger.kernel.org,
 x86@kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot
 <acourbot@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>, Alexey Gladkov
 <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg
 <a.hindborg@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Benno Lossin <lossin@kernel.org>, Bill Wendling
 <morbo@google.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Boqun Feng <boqun@kernel.org>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, Gary Guo <gary@garyguo.net>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Ingo Molnar
 <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Justin Stitt <justinstitt@google.com>, Kees Cook
 <kees@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mark
 Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier
 <nsc@kernel.org>, Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Randy Dunlap <rdunlap@infradead.org>,
 Tamir Duberstein <tamird@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Will Deacon <will@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-arch@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Jens
 Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v2 03/21] kallsyms: output binary data to speed output
 and kallsyms assembly
Message-ID: <20260914224432.7ed40d48@pumpkin>
In-Reply-To: <cda4d320-599d-41c8-a37f-827688b552f9@web.de>
References: <20260914-build-speedup-v2-3-39817ec5db23@kernel.org>
	<cda4d320-599d-41c8-a37f-827688b552f9@web.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_144450_186225_AAA462A5 
X-CRM114-Status: GOOD (  20.96  )
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

T24gTW9uLCAxNCBTZXAgMjAyNiAyMjoxNjoxMiArMDIwMApNYXJrdXMgRWxmcmluZyA8TWFya3Vz
LkVsZnJpbmdAd2ViLmRlPiB3cm90ZToKCj4g4oCmCj4gPiArKysgYi9zY3JpcHRzL2thbGxzeW1z
LmMgIAo+IOKApgo+ID4gQEAgLTQxMywyNiArNDM4LDI0IEBAIHN0YXRpYyB2b2lkIHdyaXRlX3Ny
Yyh2b2lkKQo+ID4gIAkJLyogRW5jb2RlIGxlbmd0aCB3aXRoIFVMRUIxMjguICovCj4gPiAgCQlp
ZiAodGFibGVbaV0tPmxlbiA8PSAweDdGKSB7Cj4gPiAgCQkJLyogTW9zdCBzeW1ib2xzIHVzZSBh
IHNpbmdsZSBieXRlIGZvciB0aGUgbGVuZ3RoLiAqLwo+ID4gLQkJCXByaW50ZigiXHQuYnl0ZSAw
eCUwMngiLCB0YWJsZVtpXS0+bGVuKTsKPiA+ICsJCQlmcHV0Yyh0YWJsZVtpXS0+bGVuLCBvdXRf
YmluX2ZpbGUpOwo+ID4gIAkJCW9mZiArPSB0YWJsZVtpXS0+bGVuICsgMTsKPiA+ICAJCX0gZWxz
ZSB7Cj4gPiAgCQkJLyogIkJpZyIgc3ltYm9scyB1c2UgdHdvIGJ5dGVzLiAqLwo+ID4gLQkJCXBy
aW50ZigiXHQuYnl0ZSAweCUwMngsIDB4JTAyeCIsCj4gPiAtCQkJCSh0YWJsZVtpXS0+bGVuICYg
MHg3RikgfCAweDgwLAo+ID4gLQkJCQkodGFibGVbaV0tPmxlbiA+PiA3KSAmIDB4N0YpOwo+ID4g
KwkJCWZwdXRjKCh0YWJsZVtpXS0+bGVuICYgMHg3RikgfCAweDgwLCBvdXRfYmluX2ZpbGUpOwo+
ID4gKwkJCWZwdXRjKCh0YWJsZVtpXS0+bGVuID4+IDcpICYgMHg3Riwgb3V0X2Jpbl9maWxlKTsK
PiA+ICAJCQlvZmYgKz0gdGFibGVbaV0tPmxlbiArIDI7Cj4gPiAgCQl9Cj4gPiAtCQlmb3IgKGsg
PSAwOyBrIDwgdGFibGVbaV0tPmxlbjsgaysrKQo+ID4gLQkJCXByaW50ZigiLCAweCUwMngiLCB0
YWJsZVtpXS0+c3ltW2tdKTsKPiA+ICsJCWZ3cml0ZSh0YWJsZVtpXS0+c3ltLCAxLCB0YWJsZVtp
XS0+bGVuLCBvdXRfYmluX2ZpbGUpOwo+ID4gIAo+ID4gIAkJLyoKPiA+ICAJCSAqIE5vdyB0aGF0
IHdlIHdyb3RlIG91dCB0aGUgY29tcHJlc3NlZCBzeW1ib2wgbmFtZSwgcmVzdG9yZSB0aGUKPiA+
IC0JCSAqIG9yaWdpbmFsIG5hbWUgYW5kIHByaW50IGl0IGluIHRoZSBjb21tZW50Lgo+ID4gKwkJ
ICogb3JpZ2luYWwgbmFtZSBmb3IgdGhlIGNvbW1lbnRzIGJlbG93Lgo+ID4gIAkJICovCj4gPiAg
CQlleHBhbmRfc3ltYm9sKHRhYmxlW2ldLT5zeW0sIHRhYmxlW2ldLT5sZW4sIGJ1Zik7Cj4gPiAg
CQlzdHJjcHkoKGNoYXIgKil0YWJsZVtpXS0+c3ltLCBidWYpOwo+ID4gLQkJcHJpbnRmKCJcdC8q
ICVzICovXG4iLCB0YWJsZVtpXS0+c3ltKTsKPiA+ICAJfQo+ID4gKwl3cml0ZV9pbmNiaW4ob3V0
X2Jpbl9uYW1lLCBiaW5fc3RhcnQsIGJpbl9wb3Mob3V0X2Jpbl9maWxlKSk7Cj4gPiAgCXByaW50
ZigiLnNpemUga2FsbHN5bXNfbmFtZXMsIC4gLSBrYWxsc3ltc19uYW1lc1xuIik7Cj4gPiAgCXBy
aW50ZigiXG4iKTsKPiA+ICAgIAo+IOKApgo+IAo+IEkgc3VnZ2VzdCB0byBhdm9pZCByZXR1cm4g
dmFsdWUgaWdub3JhbmNlIGEgYml0IG1vcmUuCj4gaHR0cHM6Ly9jbXUtc2VpLmdpdGh1Yi5pby9z
ZWN1cmUtY29kaW5nLXN0YW5kYXJkcy9zZWktY2VydC1jLWNvZGluZy1zdGFuZGFyZC9ydWxlcy9l
cnJvci1oYW5kbGluZy1lcnIvZXJyMzMtYy8KPiBodHRwczovL2N3ZS5taXRyZS5vcmcvZGF0YS9k
ZWZpbml0aW9ucy8yNTIuaHRtbAoKQW5kIEkgc3VnZ2VzdCB5b3UgZG8gc29tZSByZWFsIGNvZGlu
Zy4uLgpUaGUgZXJyb3IgaXMgc3RpY2t5IGFuZCBjYW4gYmUgY2hlY2tlZCB1c2luZyBmZXJyb3Io
KS4KQ29kZSB0aGF0IGxvb2tzIGF0IHRoZSByZXR1cm4gdmFsdWUgZnJvbSBmcHJpbnRmKCkgZndy
aXRlKCkgZXRjIGlzIHZlcnkKb2Z0ZW4gYnJva2VuIGJlY2F1c2UgdGhlIG9ubHkgdGltZSB0aGV5
IGNhbiBhY3R1YWwgZmFpbCBpcyB3aGVuIHRoZQpidWZmZXIgaXMgZmx1c2hlZCBkdXJpbmcgY2xv
c2UuCkFkZGluZyBlcnJvciBjaGVja3MgdG8gZXZlcnkgY2FsbCBqdXN0IG1ha2UgdGhlIGNvZGUg
dW5yZWFkYWJsZS4KCkRhdmlkCgo+IAo+IFJlZ2FyZHMsCj4gTWFya3VzCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
