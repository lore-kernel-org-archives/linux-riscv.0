Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F179C369D3
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 11:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUzye/PVRbB+zeNG7D9IDNSQkn0qi3g735T7gGFuoBU=; b=25iccNLtjVH0IE
	GRrUKJGG5vpDUTY7eEAgBHK9afmBDwNhU4DOnwhI0LZ4j+Ia5ohC2ba8FSNxes6LCbUDbH1UHTVbI
	do2nJXas7PF7qaLVDaEbcYvdjf9vAj0Z1kAgGMh2E2CzUeN3UPjW60dz1UJJb2sgwSqfURDpeXBm7
	h1dpUyjB0L+Hp1Cl1bJh+2wGH7fG/CnEdPeB4wv2KmOooVSOsCFAmJyjXpRibdwlvN9DWDLOGZao1
	HpgHJUXynYMTXgvBIzVw8Mhc5P317eifh1oh0ee/xrTJXU8/w06Q3wb1FTiCuL4+8ImGTuA6XVt0d
	clLYqQLViGn5h6kubzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BPf-00000006s2M-2ECK;
	Tue, 22 Apr 2025 11:03:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AhM-00000006ijY-0tB4
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 10:17:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-225477548e1so47878425ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Apr 2025 03:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745317071; x=1745921871; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X00I2bs07xTT0JGn+iRC8lIN0+rPW4VodnvME71Mc4w=;
        b=S7BRh3Wk3JVGtJMJ0sM+qLIL8jvX8tUhXKhXaxlhwWTPFHCVjyjtLSjS7RYnWqPpbh
         BGPekgk6HhAgMsOhoCDz9RO7eW/ICV1yOxRXcLKrBpa0N1l+U9k24me0giFlqLAIEvP2
         w/4gKAqtWJC5Ft6LQ768TTEsVsej9liYj8if0GR5ABFMg2OfAa8e+nd2/O/0WyPc4jZl
         zdYDFDNv8HOnWZZ2s8LlovWBeZemZyA9cYX2hKHMx5RWT6QjzYVwWvKT+YJTTXb7Ux8H
         DBwLyEZ7yp4RR0lG50IPDyUMRsVbBL4R6xy8xvpGkAWGu2vVSp6upTTZnvRR0k9caBrf
         TWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317071; x=1745921871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X00I2bs07xTT0JGn+iRC8lIN0+rPW4VodnvME71Mc4w=;
        b=UpeP4DO/2p7HjfaG/UvmqpvUY2p9nLkTaV8ml2zrqJXJJeOOscrimAZH0cOIJLgnfi
         3JGqreIuEH+W9sHtcvX/cu1gCYQ2mLBF5qooGiSEM9HX9oX/WPNjyb0zVd/LRK6gAEZC
         ryXoRBgLcAy7DHVkHLkQyzCbUh/kbcOOdWtjy/XPj9EMSB8pAfuPy5w87kM4RDrW92zv
         /JOPr6e16UpOvzr9A4JQVlHUajFi4dKNck9E0VPqt1skOqwRr1Cl3xB9FTkR3MVc4CKs
         uFwtSBjjQBftP2d6E3vaQk7rhTCYIdEjhx86SgGuhWzxyv1zyCVVbnWp5j40T50aU1/R
         4TVA==
X-Forwarded-Encrypted: i=1; AJvYcCVlnU93Uxhu1o6e5rpmY66IHhaL+0JO2UGQr8TH93wAh8UXc7YQl3r9Kug2PITb8PYDp6DVsbGl7k3OFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO2MQfnQx13dXN7YFO7ee9508buxzYwyRJbLUIGxzq5Jb4XHgw
	HpOIAAJybUxfBK5rckQ2VinONElTlIdnN8sth0oiExXcawpCvbqm3n9AuaZYxHMvUmqXfgyC8Qc
	kTcs=
X-Gm-Gg: ASbGncsiEv6jCII7TZ+AoPRpZ4XFmHBNe0ATT/+rQcDky9rqQO3kx/5/Se4N0S+mzmV
	MwjpDV9ejLELAjBKxWv8Hxjcr0RAsUKAPiTBCC50iZjv6vgS5S2QsPebT3ZI2N2WsuZWWh00kpx
	ho5l6lX2Hotk06ZRyXnpejDJhXAQNZ92e4apMUuxiGRH62lFD/dQGEEHRuvXa4J1b7s/TSEefJK
	GFiMe3Ro5OOFQxuRduS2Ze67xjD7TvhIqClKhxmWfdrQpHv1aCL2iEyUCtmyJkXMcTGX9XVxMvJ
	g0Qlae+DglXIHdgUeikzS2bEukNCVU7eyYSOta8aEVWJGAt4HA03qCfLf5sytiGy/9ZCrS4w70w
	OooCIJ2iNVQ==
X-Google-Smtp-Source: AGHT+IF66lPXUZ8d1HsX69+jyxVc1Jh9SjZT766uy6dI5gqKQ1najh//E0HYQ7PJOsBvmK715VAAPg==
X-Received: by 2002:a17:902:d489:b0:224:e33:8896 with SMTP id d9443c01a7336-22c53285bbbmr210518825ad.11.1745317071386;
        Tue, 22 Apr 2025 03:17:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8bf794sm8493042b3a.10.2025.04.22.03.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:17:50 -0700 (PDT)
Message-ID: <6e2ed6a9-aed0-4727-b1e3-903d3a7751b5@rivosinc.com>
Date: Tue, 22 Apr 2025 12:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] riscv: misaligned: factorize trap handling
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
 <20250414123543.1615478-2-cleger@rivosinc.com>
 <ba11b910-9959-4845-b3a3-dd9a52466823@ghiti.fr>
 <2c4f4422-d9c9-4d36-b0ef-f68779b91ee9@rivosinc.com>
 <20250422094419.GC14170@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250422094419.GC14170@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_031752_513670_3459DB3B 
X-CRM114-Status: GOOD (  24.23  )
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

CgpPbiAyMi8wNC8yMDI1IDExOjQ0LCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiBPbiBUdWUsIEFw
ciAyMiwgMjAyNSBhdCAwOTo1NzoxMkFNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+
Cj4+Cj4+IE9uIDIxLzA0LzIwMjUgMDk6MDYsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+IEhp
IENsw6ltZW50LAo+Pj4KPj4+Cj4+PiBPbiAxNC8wNC8yMDI1IDE0OjM0LCBDbMOpbWVudCBMw6ln
ZXIgd3JvdGU6Cj4+Pj4gbWlzYWxpZ25lZCBhY2Nlc3NlcyB0cmFwcyBhcmUgbm90IG5taSBhbmQg
c2hvdWxkIGJlIHRyZWF0ZWQgYXMgbm9ybWFsCj4+Pj4gb25lIHVzaW5nIGlycWVudHJ5X2VudGVy
KCkvZXhpdCgpLgo+Pj4KPj4+Cj4+PiBBbGwgdGhlIHRyYXBzIHRoYXQgY29tZSBmcm9tIGtlcm5l
bCBtb2RlIGFyZSB0cmVhdGVkIGFzIG5taSBhcyBpdCB3YXMKPj4+IHN1Z2dlc3RlZCBieSBQZXRl
ciBoZXJlOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8KPj4+IFl5aHY0VVVY
dVNmdk1PdytAaGlyZXoucHJvZ3JhbW1pbmcua2lja3MtYXNzLm5ldC8KPj4+Cj4+PiBJIGRvbid0
IGtub3cgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gaXJxX25taV9lbnRyeS9leGl0KCkgYW5kIGly
cV9lbnRyeS8KPj4+IGV4aXQoKSwgc28gaXMgdGhhdCBzdGlsbCBjb3JyZWN0IHRvIG5vdyB0cmVh
dCB0aGUga2VybmVsIHRyYXBzIGFzIG5vbi1ubWk/Cj4+Cj4+IEhpIEFsZXgsCj4+Cj4+IEFjdHVh
bGx5LCB0aGlzIGRpc2N1c3Npb24gd2FzIHJhaXNlZCBvbiBhIHByZXZpb3VzIHNlcmllcyBbMV0g
YnkgTWFjaWVqCj4+IHdoaWNoIHJlcGxpZWQgdGhhdCB3ZSBzaG91bGQgYWN0dWFsbHkgcmVlbmFi
bGUgaW50ZXJydXB0IGRlcGVuZGluZyBvbgo+PiB0aGUgc3RhdGUgdGhhdCB3YXMgaW50ZXJydXB0
ZWQuIExvb2tpbmcgYXQgb3RoZXIgYXJjaGl0ZWN0dXJlL2NvZGUsIGl0Cj4+IHNlZW1zIGxpa2Ug
dHJlYXRpbmcgbWlzYWxpZ25lZCBhY2Nlc3NlcyBhcyBOTUkgaXMgcHJvYmFibHkgbm90IHRoZSBy
aWdodAo+PiB3YXkuIEZvciBpbnN0YW5jZSwgbG9vbmdhcmNoIHRyZWF0cyB0aGVtIGFzIG5vcm1h
bCBJUlEgdXNpbmcgYQo+PiBpcnFlbnRyeV9lbnRlcigpL2V4aXQoKSBhbmQgcmVlbmFibGluZyBJ
UlFTIGlmIHBvc3NpYmxlLgo+IAo+IFNvLCBhIHRyYXAgdGhhdCBoYXBwZW5zIGluIGtlcm5lbCBz
cGFjZSB3aGlsZSBJUlFzIGFyZSBkaXNhYmxlZCwgU0hPVUxECj4gcmVhbGx5IGJlIE5NSS1saWtl
Lgo+IAo+IFlvdSB0aGVuIGhhdmUgYSBjaG9pY2UsIG1ha2UgYWxsIHN1Y2ggdHJhcHMgZnJvbSBr
ZXJuZWwgc3BhY2UgTk1JLWxpa2U7Cj4gdGhpcyBtYWtlcyBpdCBlYXN5IG9uIHRoZSB0cmFwIGhh
bmRsZXIsIHNpbmNlIHRoZSBjb250ZXh0IGlzIGFsd2F5cyB0aGUKPiBzYW1lLiBNaXN0YWtlcyBh
cmUgJ2Vhc3knIHRvIGZpbmQuCj4gCj4gT3IsLi4gZG8gZnVubnkgc3R1ZmYgYW5kIG9ubHkgbWFr
ZSBpdCBOTUkgbGlrZSBpZiBJUlFzIHdlcmUgZGlzYWJsZWQuCj4gV2hpY2ggZ2l2ZXMgaW5jb25z
aXN0ZW50IGNvbnRleHQgZm9yIHRoZSBoYW5kbGVyIGFuZCB5b3UnbGwgZmluZAo+IHlvdXJzZWxm
IHNjcmF0Y2hpbmcgeW91ciBoZWFkIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZSB3b25kZXJp
bmcgd2h5Cj4gdGhpcyBvbmUgcmFyZSBvY2Nhc2lvbiBnb2VzIEJPT00uCgpIaSBQZXRlciwKClll
YWggYWdyZWVkLCB0aGF0IG1pZ2h0IGJlIGhhemFyZG91cy4KCj4gCj4geDg2IG1vc3RseSBkb2Vz
IHRoZSBmaXJzdCwgYW55IHRyYXAgdGhhdCBjYW4gaGFwcGVuIHdpdGggSVJRcyBkaXNhYmxlZAo+
IGlzIHRyZWF0ZWQgdW5jb25kaXRpb25hbGx5IGFzIE5NSSBsaWtlLiBUaGUgb2J2aW91cyBleGNl
cHRpb24gaXMKPiBwYWdlLWZhdWx0LCBidXQgdGhhdCBhbHJlYWR5IGhhcyBhIGZyb20tbm9uLXBy
ZWVtcHRpYmxlLWNvbnRleHQgYnJhbmNoCj4gdGhhdCBpcyAnY2FyZWZ1bCcuCj4gCj4gQXMgdG8g
dW5hbGlnbmVkIHRyYXBzIGZyb20ga2VybmVsIHNwYWNlLCBJIHdvdWxkIGltYWdpbmUgdGhleSBt
b3N0bHkgQlVHCj4gdGhlIGtlcm5lbCwgZXhjZXB0IHdoZW4gdGhlcmUncyBhbiBleGNlcHRpb24g
ZW50cnkgZm9yIHRoYXQgbG9jYXRpb24sIGluCj4gd2hpY2ggY2FzZSBpdCBtaWdodCBkbyBhIGZp
eHVwPwoKVGhlIG1pc2FsaWduZWQgYWNjZXNzIGV4Y2VwdGlvbiBoYW5kbGluZyBjdXJyZW50bHkg
aGFuZGxlcyBtaXNhbGlnbmVkCmFjY2VzcyBmb3IgdGhlIGtlcm5lbCBhcyB3ZWxsIChleGNlcHQg
aWYgZXhwbGljaXRseSBkaXNhYmxlZCkuCgo+IAo+IAo+IEFueXdheSwgdGhlIHJlYXNvbiB0aGVz
ZSBleGNlcHRpb25zIHNob3VsZCBiZSBOTUkgbGlrZSwgaXMgYmVjYXVzZQo+IGludGVycnVwdHMg
YXJlIG5vdCBhbGxvd2VkIHRvIG5lc3QuIE5vdGFibHkgc29tZXRoaW5nIGxpa2U6Cj4gCj4gCj4g
ICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmZvbyk7Cj4gICA8SVJRPgo+ICAgICByYXdfc3Bpbl9s
b2NrX2lycXNhdmUoJmZvbyk7Cj4gICAgIC4uLgo+IAo+IElzIGFuIG9idmlvdXMgcHJvYmxlbS4g
RXhjZXB0aW9ucyB0aGF0IGNhbiBydW4gd2hpbGUgSVJRcyBhcmUgZGlzYWJsZWQsCj4gbXVzdCBu
b3QgdXNlIGxvY2tzIC0tIHRyZWF0aW5nIHRoZW0gYXMgTk1JLWxpa2UgKHRoZXkgYXJlIG5vbi1t
YXNrYWJsZQo+IGFmdGVyIGFsbCksIGVuc3VyZXMgdGhpcy4KCkFzIHNhaWQgaW4gbXkgcHJldmlv
dXMgcmVwbHksIHRoZSBtaXNhbGlnbmVkIGhhbmRsaW5nIGNvZGUgZG9lcyBub3QKY3VycmVudGx5
IGFjY2VzcyBhbnkgbG9ja3MgKHdoZW4gaGFuZGxpbmcga2VybmVsIG1pc2FsaWduZWQgYWNjZXNz
ZXMpCmFuZCBpcyBzZWxmIGNvbnRhaW5lZC4gVGhhdCBiZWluZyBzYWlkLCB0aGF0IGFzc3VtcHRp
b24gbWlnaHQgbm90IGJlCnRydWUgaW4gZnV0dXJlIHNvIHRoYXQgbWlnaHQgYmUgYmV0dGVyIHRv
IHRha2UgeW91ciBhcHByb2FjaCBhbmQgdHJlYXQKdGhlIG1pc2FsaWduZWQgYWNjZXNzIGxpa2Ug
YW4gTk1JLgoKVGhhbmtzLAoKQ2zDqW1lbnQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
