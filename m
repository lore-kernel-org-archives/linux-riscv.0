Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CD6C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 19:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3HiVjOiXkh7YmxQgMQUyk8TcKLMVJuPhgtCHnLVSZw=; b=uEmHaAEFO/i71e
	PcXAkNXycwKwghvKJaYTsgSxxqThskCJXk38+iwgl/UKhCwW4d/A5cRWZBPdCS/MWPMqG7ZIgXUjC
	ASbQ61sQ6CH9sZvnDxurHp4Vth+t+BkRZDY8f58EeKGeYalpWvzf9+bYxrOcHyD3ChjKcsn2hGcR0
	Q+AcGUC5qx96cmZ1d+w2eiyoRxSpeQKqKpciZI0c6Xg8J3zIbddwhkIIk78teTtwCS4l86pxBYmXm
	hRKhx91sEVpDXe0JuRLliC57bMEeppRwvSA6ewLBv1l7SxfXZ4cII4YI12AzWLJ/VGN81Qiuq/t7i
	OEoWDQCfiP6RVMmhLkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxXTv-00000003Sd9-2ka0;
	Thu, 18 Apr 2024 19:31:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxXTq-00000003Saw-255W;
	Thu, 18 Apr 2024 19:31:35 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3465921600dso1071782f8f.3;
        Thu, 18 Apr 2024 12:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713468691; x=1714073491; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps3ERSaJ3Nubf413Mgm5+5UAMdezoWO525AtmvS7hLg=;
        b=SbZlCta6moTxhlJrvDjrlmCewGwhgtDuJjcOtOig8yTL09jJAu/H5uZLLcrMCMOfoT
         NmCsnBor3RXnQOCcn9KFR9Oc7vScRC54kZUYkjnVw9eiBHYMXALWEthFw1VZe4FCmNY4
         IFJUcEQBJwr23iVlnbG33fY897vyKrVTouOqGRQhf8KHzoIB8CrErqKs7irAO5k2y7ge
         Dcu37U8qb+G/Hc/OvxV1Bj0nRYbL9AIxacmHB8zVTJynJXcX+hZVKBKNZzPYqDyyVRRc
         YbED96X+me2kvDBDM/wx7WRtY8XAaqYPAQ1nSJ9Wqbr86eAtpQgUMP5q++C99u1JaK59
         VYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468691; x=1714073491;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ps3ERSaJ3Nubf413Mgm5+5UAMdezoWO525AtmvS7hLg=;
        b=nMXvdHFoPx0buSJ8o2qXRUanU5GwD0diEcNdNBJztDEQFtZ0Vj9H5tXkFoSLkGKJ9H
         /RWoezyk0QrENTjVxF29pnXuvJ8asKyiVKF+DW4iTQnvDdpvPdIJymLczgSjnTkEFIbR
         ZmYNc+Pf+hU3vzqWFQEBltKz82T/Tvb3hTqphH/JhINX1cIwq/7egQKczPajIfZzyThi
         0eJnBhFRIy0421Ji87HeDJCsdb0lTiol/5fIhVzqVEzNhF9WAXClbSm9kN5BFOSqoLgX
         8UTmU0a5r7Xl51Sz+TYcQVVD+Vn1qLTa6WJ0hoF4M07H+Hp+jMicXG3Gx9SOSmFDGNB/
         yk0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXlTWJCtnd1GJnE0FT23iONFpNMBDbY+Xe8usPD0nNfBF7ywcnAl6rOOIitLF8yd64ynJ0ulhyv03HV6uXmOGyS7ez2kmrVCqvxveLQqF5fyetS64nA8dipPW+/X7XiSUR98l4/M3XzYq+aCpiVPvlFKBZGb0I=
X-Gm-Message-State: AOJu0YxNrdma+Jpoy28jWX6HhutOcOOMswdsxWJPcaoh62gfgBRywwrS
	mFQdF8N+AA9RxkFhu75+Y2xjSGqGkak2T+y8KY7sV1EvEt42ea/T
X-Google-Smtp-Source: AGHT+IH0u8bsjFHZqemZxrgoGwtoIHFPdCVNpm0ysNZP2RZZazFU1pUbMRvZ+DfZhHxeIo/1VeVn9Q==
X-Received: by 2002:adf:e58f:0:b0:349:eb59:c188 with SMTP id l15-20020adfe58f000000b00349eb59c188mr2213684wrm.5.1713468690932;
        Thu, 18 Apr 2024 12:31:30 -0700 (PDT)
Received: from smtpclient.apple ([132.69.239.36])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906d19a00b00a55662919c1sm1277105ejz.172.2024.04.18.12.31.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Apr 2024 12:31:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [RFC PATCH 3/7] module: [
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <ZiDz4YbIHEOAnpwF@kernel.org>
Date: Thu, 18 Apr 2024 22:31:16 +0300
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Helge Deller <deller@gmx.de>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Russell King <linux@armlinux.org.uk>,
 Song Liu <song@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Uladzislau Rezki <urezki@gmail.com>,
 Will Deacon <will@kernel.org>,
 bpf <bpf@vger.kernel.org>,
 linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 the arch/x86 maintainers <x86@kernel.org>
Message-Id: <A714B340-9EFB-4F27-9CD6-CFBC1BC9139F@gmail.com>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-4-rppt@kernel.org>
 <0C4B9C1A-97DE-4798-8256-158369AF42A4@gmail.com>
 <ZiDz4YbIHEOAnpwF@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_123134_560879_C1FEB8F1 
X-CRM114-Status: GOOD (  16.10  )
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

Cgo+IE9uIDE4IEFwciAyMDI0LCBhdCAxMzoyMCwgTWlrZSBSYXBvcG9ydCA8cnBwdEBrZXJuZWwu
b3JnPiB3cm90ZToKPiAKPiBPbiBUdWUsIEFwciAxNiwgMjAyNCBhdCAxMjozNjowOFBNICswMzAw
LCBOYWRhdiBBbWl0IHdyb3RlOgo+PiAKPj4gCj4+IAo+PiBJIG1pZ2h0IGJlIG1pc3Npbmcgc29t
ZXRoaW5nLCBidXQgaXQgc2VlbXMgYSBiaXQgcmFjeS4KPj4gCj4+IElJVUMsIG1vZHVsZV9maW5h
bGl6ZSgpIGNhbGxzIGFsdGVybmF0aXZlc19zbXBfbW9kdWxlX2FkZCgpLiBBdCB0aGlzCj4+IHBv
aW50LCBzaW5jZSB5b3UgZG9u4oCZdCBob2xkIHRoZSB0ZXh0X211dGV4LCBzb21lIG1pZ2h0IGRv
IHRleHRfcG9rZSgpLAo+PiBlLmcuLCBieSBlbmFibGluZy9kaXNhYmxpbmcgc3RhdGljLWtleSwg
YW5kIHRoZSB1cGRhdGUgd291bGQgYmUKPj4gb3ZlcndyaXR0ZW4uIE5vPwo+IAo+IFJpZ2h0IDoo
Cj4gRXZlbiB3b3JzZSwgZm9yIFVQIGNhc2UgYWx0ZXJuYXRpdmVzX3NtcF91bmxvY2soKSB3aWxs
ICJwYXRjaCIgc3RpbGwgZW1wdHkKPiBhcmVhLgo+IAo+IFNvIEknbSB0aGlua2luZyBhYm91dCBj
YWxsaW5nIGFsdGVybmF0aXZlc19zbXBfbW9kdWxlX2FkZCgpIGZyb20gYW4KPiBhZGRpdGlvbmFs
IGNhbGxiYWNrIGFmdGVyIHRoZSBleGVjbWVtX3VwZGF0ZV9jb3B5KCkuCj4gCj4gRG9lcyBpdCBt
YWtlIHNlbnNlIHRvIHlvdT8KCkdvaW5nIG92ZXIgdGhlIGNvZGUgYWdhaW4gLSBJIG1pZ2h0IGhh
dmUganVzdCBiZWVuIHdyb25nOiBJIGNvbmZ1c2VkIHRoZQphbHRlcm5hdGl2ZXMgYW5kIHRoZSBq
dW1wLWxhYmVsIG1lY2hhbmlzbXMgKGFzIHRoZXkgZG8gc2hhcmUgYSBsb3Qgb2YKY29kZSBhbmQg
Y2hhcmFjdGVyaXN0aWNzKS4KClRoZSBqdW1wLWxhYmVscyBhcmUgdXBkYXRlZCB3aGVuIHByZXBh
cmVfY29taW5nX21vZHVsZSgpIGlzIGNhbGxlZCwgd2hpY2gKaGFwcGVucyBhZnRlciBwb3N0X3Jl
bG9jYXRpb24oKSBbd2hpY2ggbWVhbnMgdGhleSB3b3VsZCBiZSB1cGRhdGVkIHVzaW5nCnRleHRf
cG9rZSgpIOKAnGluZWZmaWNpZW50bHnigJ0gYnV0IHNob3VsZCBiZSBzYWZlXS4KClRoZSDigJxh
bHRlcm5hdGl2ZXPigJ0gYXBwZWFyIG9ubHkgdG8gdXNlIHRleHRfcG9rZSgpIChpbiBjb250cmFz
dCBmb3IKdGV4dF9wb2tlX2Vhcmx5KCkpIGZyb20gdmVyeSBzcGVjaWZpYyBmZXcgZmxvd3MsIGUu
Zy4sIApjb21tb25fY3B1X3VwKCkgLT4gYWx0ZXJuYXRpdmVzX2VuYWJsZV9zbXAoKS4KCkFyZSB0
aG9zZSBmbG93cyBwb3NlIGEgcHJvYmxlbSBhZnRlciBib290PwoKQW55aG93LCBzb3JyeSBmb3Ig
dGhlIG5vaXNlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
