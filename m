Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A882DC27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 17:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUj/YNykSJqUl9jDZwtT9/mVG+TJnV7m/rToDcU+lqQ=; b=EqGgDqhEqN1EGX
	C07IHi4SC0WST0p4evk/KX7YaAdcl6gh1LUYMGhaxA0cL4g/3+BR0xHlV0JQXKz7iItgxGMl1sIB2
	TXNgi6Kd2q2cehD0MtFOezsJxEQtkLOyc1UTl047sQIjOzs0ZNAUdQTuKYnb+am9NkhaBpQC9sS4g
	I+K8t32y8xaTjHTOwkDyKs4guG6XkOTi3e25FwmnhJVPCl5jv2ZWKeNW7q0PsODR0mtBkJUh+d1po
	g892GE/Ib9/ZQwlfWSD091ShYoxGutscj9Wsswy9zvXsxstX/DWBbR591LauysZ+WP77kIwp8MilJ
	+JZjk5W4miG/5+3XnP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGjBk-000000062jl-3Zpa;
	Mon, 10 Jun 2024 17:52:12 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGjBh-000000062j7-3xOw
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 17:52:11 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-52c4b92c09bso263643e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jun 2024 10:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1718041928; x=1718646728; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWkRgN4oixQz2NDH8nagYU0C/GTWILi37MSJzJ0VQmc=;
        b=MeI0U5xR6/izvxgWgHHxA0+wDrg2zJWAKVuAeT2MzHS4D2KVGBrYDTdn8MufmV4H3w
         0eIT2tTI+upLF024bdkBHH9Wx8ir3j08JAq7WIyaI8io/+5Bd5Q67F/hVgQy9ZwgdUTy
         3oyx+iK5bCneZnJwyQicXNSH4kaE9VLh5wfanKDLpIF5r9Xvo7KuxMxocW9oc5oWn+3n
         yAxcon2fX+Pr6H4IGSxNlpoS4XA5EBAAoByuzOUhTUbrQJDzzkvpo/6UQ+dV8PnvWPWD
         O6IPJhUIbpydon2CyAG1V2oqFvv7RiXCZxjZXpkPsC+36UZ1tXzSRt6gcdE63qI3RUmd
         cp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718041928; x=1718646728;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWkRgN4oixQz2NDH8nagYU0C/GTWILi37MSJzJ0VQmc=;
        b=ZV5S47PIjZMV/1YKfhrQ35CnJ57qj+jC5nCMpe29RIvwxUNaAU+V1kHyRFEWr/+3/k
         nZAr1/PI4H3rYYjEsL6PAUx+AzLJsYO+K6IEyTZTwSqoZlfOecW6/HcdTHl6hw7J7dci
         JutWjzZA5HnPYDHtWLZX08ki4A7I90AbkBnsNxOQP9ZL3djh5QwU3Go6v+yuEfIDDioA
         /+BUO1PpnzFctQJH7iUYxjbk+iGsYGocylNLqF8idkhhjHTH/BF3btSLMK3ITDJ2Pjsm
         WtWg2e8+4kgt8TrfjxTPSO14CgceqvJq1Fs+GF9+J/oF4Y+UPHttr76N+u7b57fI/woV
         xsAw==
X-Forwarded-Encrypted: i=1; AJvYcCUZNEd18aMqAS6+CWwZs1yAtu/zqRUVYeVh+SApu12nPAf/c0sS7Q4Zfc6ZhBnKHuZ+eqWUAZ0kwBJx2CYX4a31hA1huMz+uCmKSyprz800
X-Gm-Message-State: AOJu0YzuEGNC7ZWS38oDmEbk4vKzddBg4i586FLvTuHproAf/dSTbQ+Z
	NlI1f5aqqQzbUWwTzvGHWaJFdZSp7Lln0gZNEPWD0FlsIGRizzJ0qq+oUK7rLYQ=
X-Google-Smtp-Source: AGHT+IH5OdYzcnTJ6D+zS8aIAAaJJTXjxs59RqwCSCJ2ph2wWmR2x/JtfntC1ryqtH5pn476yLkmFg==
X-Received: by 2002:a05:6512:3baa:b0:52c:8ea3:1aea with SMTP id 2adb3069b0e04-52c8ea31d06mr2106714e87.34.1718041927588;
        Mon, 10 Jun 2024 10:52:07 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2598ac1esm2762915f8f.93.2024.06.10.10.52.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2024 10:52:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 05/13] riscv: vector: Use vlenb from DT for thead
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20240609-xtheadvector-v1-5-3fe591d7f109@rivosinc.com>
Date: Mon, 10 Jun 2024 18:51:56 +0100
Cc: Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 Evan Green <evan@rivosinc.com>,
 Andy Chiu <andy.chiu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-sunxi@lists.linux.dev,
 linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Message-Id: <0944414F-321F-4159-AB85-C4B66AE9550B@jrtc27.com>
References: <20240609-xtheadvector-v1-0-3fe591d7f109@rivosinc.com>
 <20240609-xtheadvector-v1-5-3fe591d7f109@rivosinc.com>
To: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_105210_009146_7405D7B6 
X-CRM114-Status: GOOD (  28.25  )
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

T24gMTAgSnVuIDIwMjQsIGF0IDA1OjQ1LCBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3Np
bmMuY29tPiB3cm90ZToKPiAKPiBJZiB0aGVhZCx2bGVuYiBpcyBwcm92aWRlZCBpbiB0aGUgZGV2
aWNlIHRyZWUsIHByZWZlciB0aGF0IG92ZXIgcmVhZGluZwo+IHRoZSB2bGVuYiBjc3IuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiAt
LS0KPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaCB8ICAyICsrCj4gYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgICAgICAgfCAx
MiArKysrKysrKystCj4gMyBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiBpbmRleCBiMDI5Y2E3
MmNlYmMuLmUwYTMxNjRjN2EwNiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2NwdWZlYXR1cmUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5o
Cj4gQEAgLTMxLDYgKzMxLDggQEAgREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCByaXNjdl9jcHVpbmZv
LCByaXNjdl9jcHVpbmZvKTsKPiAvKiBQZXItY3B1IElTQSBleHRlbnNpb25zLiAqLwo+IGV4dGVy
biBzdHJ1Y3QgcmlzY3ZfaXNhaW5mbyBoYXJ0X2lzYVtOUl9DUFVTXTsKPiAKPiArZXh0ZXJuIHUz
MiB0aGVhZF92bGVuYl9vZjsKPiArCj4gdm9pZCByaXNjdl91c2VyX2lzYV9lbmFibGUodm9pZCk7
Cj4gCj4gI2RlZmluZSBfUklTQ1ZfSVNBX0VYVF9EQVRBKF9uYW1lLCBfaWQsIF9zdWJzZXRfZXh0
cywgX3N1YnNldF9leHRzX3NpemUpIHsgXAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBpbmRleCAy
MTA3YzU5NTc1ZGQuLjBjMDFmMzNmMjM0OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBA
QCAtMzcsNiArMzcsOCBAQCBzdGF0aWMgREVDTEFSRV9CSVRNQVAocmlzY3ZfaXNhLCBSSVNDVl9J
U0FfRVhUX01BWCkgX19yZWFkX21vc3RseTsKPiAvKiBQZXItY3B1IElTQSBleHRlbnNpb25zLiAq
Lwo+IHN0cnVjdCByaXNjdl9pc2FpbmZvIGhhcnRfaXNhW05SX0NQVVNdOwo+IAo+ICt1MzIgdGhl
YWRfdmxlbmJfb2Y7Cj4gKwo+IC8qKgo+ICAqIHJpc2N2X2lzYV9leHRlbnNpb25fYmFzZSgpIC0g
R2V0IGJhc2UgZXh0ZW5zaW9uIHdvcmQKPiAgKgo+IEBAIC02MjUsNiArNjI3LDQ2IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCByaXNjdl9maWxsX3ZlbmRvcl9leHRfbGlzdChpbnQgY3B1KQo+IH0KPiB9
Cj4gCj4gK3N0YXRpYyBpbnQgaGFzX3RoZWFkX2hvbW9nZW5lb3VzX3ZsZW5iKHZvaWQpCj4gK3sK
PiArIGludCBjcHU7Cj4gKyB1MzIgcHJldl92bGVuYiA9IDA7Cj4gKyB1MzIgdmxlbmI7Cj4gKwo+
ICsgLyogSWdub3JlIHZsZW5iIGlmIHZlY3RvciBpcyBub3QgZW5hYmxlZCBpbiB0aGUga2VybmVs
ICovCj4gKyBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0lTQV9WKSkKCkl04oCZcyBub3Qg
ViB0aG91Z2guIFlvdSBwcm9iYWJseSB3YW50IHRvIHNwbGl0IG91dCDigJx2ZWN0b3LigJ0gZnJv
bSDigJxW4oCdIGluCktjb25maWcgbGFuZC4gTW9zdCBwbGFjZXMgd2FudCB0aGUgZm9ybWVyLCBJ
IGFzc3VtZSwgYnV0IHNvbWUgd2FudCB0aGUKbGF0dGVyLgoKSmVzcwoKPiArIHJldHVybiAwOwo+
ICsKPiArIGZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKPiArIHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqY3B1X25vZGU7Cj4gKwo+ICsgY3B1X25vZGUgPSBvZl9jcHVfZGV2aWNlX25vZGVfZ2V0KGNw
dSk7Cj4gKyBpZiAoIWNwdV9ub2RlKSB7Cj4gKyBwcl93YXJuKCJVbmFibGUgdG8gZmluZCBjcHUg
bm9kZVxuIik7Cj4gKyByZXR1cm4gLUVOT0VOVDsKPiArIH0KPiArCj4gKyBpZiAob2ZfcHJvcGVy
dHlfcmVhZF91MzIoY3B1X25vZGUsICJ0aGVhZCx2bGVuYiIsICZ2bGVuYikpIHsKPiArIG9mX25v
ZGVfcHV0KGNwdV9ub2RlKTsKPiArCj4gKyBpZiAocHJldl92bGVuYikKPiArIHJldHVybiAtRU5P
RU5UOwo+ICsgY29udGludWU7Cj4gKyB9Cj4gKwo+ICsgaWYgKHByZXZfdmxlbmIgJiYgdmxlbmIg
IT0gcHJldl92bGVuYikgewo+ICsgb2Zfbm9kZV9wdXQoY3B1X25vZGUpOwo+ICsgcmV0dXJuIC1F
Tk9FTlQ7Cj4gKyB9Cj4gKwo+ICsgcHJldl92bGVuYiA9IHZsZW5iOwo+ICsgb2Zfbm9kZV9wdXQo
Y3B1X25vZGUpOwo+ICsgfQo+ICsKPiArIHRoZWFkX3ZsZW5iX29mID0gdmxlbmI7Cj4gKyByZXR1
cm4gMDsKPiArfQo+ICsKPiBzdGF0aWMgaW50IF9faW5pdCByaXNjdl9maWxsX2h3Y2FwX2Zyb21f
ZXh0X2xpc3QodW5zaWduZWQgbG9uZyAqaXNhMmh3Y2FwKQo+IHsKPiB1bnNpZ25lZCBpbnQgY3B1
Owo+IEBAIC02ODksNiArNzMxLDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X2ZpbGxfaHdj
YXBfZnJvbV9leHRfbGlzdCh1bnNpZ25lZCBsb25nICppc2EyaHdjYXApCj4gcmlzY3ZfZmlsbF92
ZW5kb3JfZXh0X2xpc3QoY3B1KTsKPiB9Cj4gCj4gKyBpZiAocmlzY3ZfaXNhX3ZlbmRvcl9leHRl
bnNpb25fYXZhaWxhYmxlKFRIRUFEX1ZFTkRPUl9JRCwgWFRIRUFEVkVDVE9SKSAmJgo+ICsgICAg
aGFzX3RoZWFkX2hvbW9nZW5lb3VzX3ZsZW5iKCkgPCAwKSB7Cj4gKyBwcl93YXJuKCJVbnN1cHBv
cnRlZCBoZXRlcm9nZW5lb3VzIHZsZW5iIGRldGVjdGVkLCB2ZWN0b3IgZXh0ZW5zaW9uIGRpc2Fi
bGVkLlxuIik7Cj4gKyBlbGZfaHdjYXAgJj0gfkNPTVBBVF9IV0NBUF9JU0FfVjsKPiArIH0KPiAr
Cj4gaWYgKGJpdG1hcF9lbXB0eShyaXNjdl9pc2EsIFJJU0NWX0lTQV9FWFRfTUFYKSkKPiByZXR1
cm4gLUVOT0VOVDsKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+IGluZGV4IDY3MjdkMWQzYjhmMi4uM2JhMmYy
NDMyNDgzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiBAQCAtMzMsNyArMzMsMTcgQEAgaW50IHJpc2N2
X3Zfc2V0dXBfdnNpemUodm9pZCkKPiB7Cj4gdW5zaWduZWQgbG9uZyB0aGlzX3ZzaXplOwo+IAo+
IC0gLyogVGhlcmUgYXJlIDMyIHZlY3RvciByZWdpc3RlcnMgd2l0aCB2bGVuYiBsZW5ndGguICov
Cj4gKyAvKgo+ICsgKiBUaGVyZSBhcmUgMzIgdmVjdG9yIHJlZ2lzdGVycyB3aXRoIHZsZW5iIGxl
bmd0aC4KPiArICoKPiArICogSWYgdGhlIHRoZWFkLHZsZW5iIHByb3BlcnR5IHdhcyBwcm92aWRl
ZCBieSB0aGUgZmlybXdhcmUsIHVzZSB0aGF0Cj4gKyAqIGluc3RlYWQgb2YgcHJvYmluZyB0aGUg
Q1NScy4KPiArICovCj4gKyBpZiAodGhlYWRfdmxlbmJfb2YpIHsKPiArIHRoaXNfdnNpemUgPSB0
aGVhZF92bGVuYl9vZiAqIDMyOwo+ICsgcmV0dXJuIDA7Cj4gKyB9Cj4gKwo+IHJpc2N2X3ZfZW5h
YmxlKCk7Cj4gdGhpc192c2l6ZSA9IGNzcl9yZWFkKENTUl9WTEVOQikgKiAzMjsKPiByaXNjdl92
X2Rpc2FibGUoKTsKPiAKPiAtLSAKPiAyLjQ0LjAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
