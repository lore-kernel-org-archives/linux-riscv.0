Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FF0C25B74
	for <linux-riscv@archiver.kernel.org>; Thu, 16 May 2024 20:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSaO+m6uV/Lo0qDfZKpVC9TN61WUSEBwft1k6l/BxE4=; b=yvBAiBe7zAxO9R
	Y4GQiUudY0Ij+5IKh8JfNLE9kEF6DJGZPw+7AzE/XHdFIE29RZ6SfnNaOYVMSW7supplojWSDIFQN
	ECZ7h8i8JWe30SyCU6Y72Qup9P2p20m3kq/r5ig1vZ8DVXdLkOBX2H4QEtGXHwxsZRXmDpomLbB5N
	OIQfpIPtqIBxiLVMneph/i1lEWMv1cG0zD3MFywbUFlbztFvMEqaa6uffT4ntXsjEGiByio/6yn+o
	S/gfdvpjvjI9wGbx7oMZdeDkdl8JerpgDfrSqK6KLRXqImEELDWvxAkauMeP9xxU+iVBRSaeDiwSJ
	eTDnkxEifFi9Ibg5DdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7hih-0000000649B-2XtJ;
	Thu, 16 May 2024 20:28:55 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7hie-0000000647f-0Gdc
	for linux-riscv@lists.infradead.org;
	Thu, 16 May 2024 20:28:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2b4952a1b51so523162a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 May 2024 13:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715891329; x=1716496129; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y4kKN9JX8nIOafaZ0J8qaWRBKY02LqUa/O7jwO2X8Tk=;
        b=hcFh+T2UEDJM3VaWYfdmtR70WTMTzY9o0jQOdOLmXzb6Vy2M9GSQLr+lSuvxrTyANA
         NxyGP18dSoqQJ/UIqk2vpfIjtbdCxNFI1sC7RcsuUklqN/1amk3lG34A+nT03GSZyBo9
         Wpxu88PzB/xrgW9LLlFp9UTw2EbcW1b6Is4Vww+FwMLT+0HRFIxMZGT3OellGYLeWvDI
         T17r0dw6nPLDu/FG/P20/aVUlI6R6qKpfVJWV5hRRkJFsJTQ9uNZrL8obP9D9/ML0C5u
         YidmgVVm3PY/0964rVV9zWWQHxSem6vxvXAnK9oRPDUVbRsywqXgHk8pEGetL26xaZd4
         dhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715891329; x=1716496129;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4kKN9JX8nIOafaZ0J8qaWRBKY02LqUa/O7jwO2X8Tk=;
        b=LA7++yMurkepYt12UXfevnk8bjX70EdJ7x3gj+q55MIcNZCbgVcCtmPwp4N7VqnzTz
         HN4ZX1d9mN5fE4MPiqQMnMCKC5PPLkvJt+Bd5pTaG1I3+J8PZ1NirA+4ZF895tRCkcra
         C1ERZuq3WzZ/7KziyfaCo8EKiDVQHfQheseDJKU6S2rwrs0TiijdlN8khAesygc4+mIp
         GYq957oHUW9uvo0ii5+SL3LcZq6OOndj44/PqMDEUm/GRlD04PQPbR6wWo1Wjk6o3LNN
         g+AtfslIyA5Xg+RSIT8jsj7HcJmKe6dt/vkvsBYSzrHOSuqXANEF8vFtky02uLzOaX2M
         iuyA==
X-Forwarded-Encrypted: i=1; AJvYcCUEuCjEMxlYoW+E4b+MYyNYsJCn4MUwM8Ykkha1lwLhCvNNBx2S3D4P9mu9sIxtxYA9CMANj+J/IO9az3lTsHJPyukhtAUYv6gAxKgA4ksO
X-Gm-Message-State: AOJu0YxVmOe2wpZ336h/r5wbJF/6V8jFv5Bg53u0ukDeYXXHhxKRGc9B
	pOEBZZIN0WNubTkpV3ul0lnN945OcoVDRyhkFNqc1aT6QwgowMdCPMQ+O+FrlVk=
X-Google-Smtp-Source: AGHT+IHTvY9bDUnWjwEIw7wiu0tFvYg1zAisbkSsd1SW/ziLhl1A+ZDZh7r1nudePVmEtMwYFsaJKg==
X-Received: by 2002:a17:90a:db54:b0:2b6:3034:4ae9 with SMTP id 98e67ed59e1d1-2b6ccd6bceemr16825092a91.35.1715891329488;
        Thu, 16 May 2024 13:28:49 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b671782dcesm15524206a91.53.2024.05.16.13.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 13:28:48 -0700 (PDT)
Date: Thu, 16 May 2024 13:28:45 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Andy Chiu <andy.chiu@sifive.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v6 03/17] riscv: vector: Use vlenb from DT
Message-ID: <ZkZV3yxbxab4W6I4@ghost>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-3-cb7624e65d82@rivosinc.com>
 <CABgGipXg68VEGt=oZZSENmbqs4-g3PB=CBobNwgqQjLHfxo+VQ@mail.gmail.com>
 <20240516-grandkid-monday-86c698ca4aed@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240516-grandkid-monday-86c698ca4aed@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_132852_252916_35098E80 
X-CRM114-Status: GOOD (  31.31  )
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

T24gVGh1LCBNYXkgMTYsIDIwMjQgYXQgMDU6MjQ6MjVQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFRodSwgTWF5IDE2LCAyMDI0IGF0IDEwOjAwOjEyUE0gKzA4MDAsIEFuZHkgQ2hp
dSB3cm90ZToKPiA+IE9uIFNhdCwgTWF5IDQsIDIwMjQgYXQgMjoyMeKAr0FNIENoYXJsaWUgSmVu
a2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+IAo+ID4gPiArICAgICAgICAgICAg
ICAgaWYgKGVsZl9od2NhcCAmIENPTVBBVF9IV0NBUF9JU0FfViAmJiBoYXNfcmlzY3ZfaG9tb2dl
bmVvdXNfdmxlbmIoKSA8IDApIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfd2Fy
bigiVW5zdXBwb3J0ZWQgaGV0ZXJvZ2VuZW91cyB2bGVuIGRldGVjdGVkLCB2ZWN0b3IgZXh0ZW5z
aW9uIGRpc2FibGVkLlwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZWxmX2h3Y2FwICY9
IH5DT01QQVRfSFdDQVBfSVNBX1Y7Cj4gPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiAKPiA+IFdl
IG9ubHkgdG91Y2ggQ09NUEFUX0hXQ0FQX0lTQV9WIGFuZCB0aGUgZmFpbGVkIGNhc2Ugb25seSB0
dXJucyBvZmYgdGhlCj4gPiByZWN0aWZpZWQgVi4gU28gaGVyZSB3ZSBoYXZlIG5vdGhpbmcgdG8g
ZG8gd2l0aCB0aGUgWHRoZWFkdmVjdG9yLgo+IAo+IFRoZXJlJ3Mgbm90aGluZyB0LWhlYWQgcmVs
YXRlZCBpbiB0aGUgdHJlZSBhdCB0aGlzIHBvaW50LCBzbyBkb2luZwo+IGFueXRoaW5nIHdpdGgg
aXQgd291bGQgY2F1c2UgYnVpbGQgaXNzdWVzLgo+IAo+ID4gSG93ZXZlciwgSSBhbSBzdGlsbCBj
b25mdXNlZCBiZWNhdXNlIEkgdGhpbmsgWHRoZWFkdmVjdG9yIHdvdWxkIGFsc28KPiA+IG5lZWQg
dG8gY2FsbCBpbnRvIHRoaXMgY2hlY2ssIHNvIGFzIHRvIHNldHVwIHZsZW5iLgo+IAo+IAo+ID4g
QXBhcnQgZnJvbSB0aGF0LCBpdCBzZWVtcyBsaWtlIHNvbWUgdmVuZG9yIHN0YXRpbmcgWHRoZWFk
dmVjdG9yIGlzCj4gPiBhY3R1YWxseSB2ZWN0b3ItMC43Lgo+IAo+IFRoZSBULUhlYWQgaW1wbGVt
ZW50YXRpb24gaXMgMC43LngsIGJ1dCBJIGFtIG5vdCByZWFsbHkgc3VyZSB3aGF0IHlvdQo+IG1l
YW4gYnkgdGhpcyBjb21tZW50LgoKQW5keSwgdGhlIGlkZWEgb2YgdGhpcyBwYXRjaCB3YXMgdG8g
YmUgYWJsZSB0byBzdXBwb3J0IHRoaXMgYmluZGluZyBvbgptb3JlIHRoYW4ganVzdCB4dGhlYWR2
ZWN0b3IuCgpZb3UgYXJlIGNvcnJlY3QgdGhvdWdoIEFuZHksIHRoaXMgaXMgYSBwcm9ibGVtIHRo
YXQgYSBsYXRlciBwYXRjaCBpbgp0aGlzIHNlcmllcyBkb2Vzbid0IGRpc2FibGUgeHRoZWFkdmVj
dG9yIHdoZW4gdmxlbmIgaXMgbm90IGhvbW9nZW5lb3VzLgpJIGFtIGdvaW5nIHRvIHdhaXQgdG8g
c2VuZCBvdXQgYW55IG1vcmUgdmVyc2lvbnMgdW50aWwgYWZ0ZXIgdGhpcyBtZXJnZQp3aW5kb3cg
YnV0IEkgd2lsbCBmaXggdGhpcyBpbiB0aGUgbmV4dCB2ZXJzaW9uLiBUaGFuayB5b3UhIAoKPiAK
PiA+IFBsZWFzZSBjb3JyZWN0IG1lIGlmIEkgc3BlYWsgYW55dGhpbmcgd3JvbmcuIE9uZQo+ID4g
dGhpbmcgSSBub3RpY2VkIGlzIHRoYXQgWHRoZWFkdmVjdG9yIHdvdWxkbid0IHRyYXAgb24gcmVh
ZGluZwo+ID4gdGgudmxlbmIgYnV0IHZlY3Rvci0wLjcgd291bGQuIElmIHRoYXQgaXMgdGhlIGNh
c2UsIHNob3VsZCB3ZSByZXF1aXJlCj4gPiBYdGhlYWR2ZWN0b3IgdG8gc3BlY2lmeSBgcmlzY3Ys
dmxlbmJgIG9uIHRoZSBkZXZpY2UgdHJlZT8KPiAKPiBJbiB0aGUgd29ybGQgb2YgTGludXgsICJ2
ZWN0b3ItMC43IiBpc24ndCBhIHRoaW5nLiBUaGVyZSdzIG9ubHkgMS4wLCBhbmQKPiBhZnRlciB0
aGlzIHBhdGNoc2V0LCAieHRoZWFkdmVjdG9yIi4gTXkgdW5kZXJzdGFuZGluZywgZnJvbSBkaXNj
dXNzaW9uCj4gb24gZWFybGllciB2ZXJzaW9ucyBvZiB0aGlzIHNlcmllcyB0aGUgdHJhcCBpcyBh
Y3R1YWxseSBhY2Nlc3NpbmcKPiB0aC52bGVuYiByZWdpc3RlciwgZGVzcGl0ZSB0aGUgZG9jdW1l
bnRhdGlvbiBzdGF0aW5nIHRoYXQgaXQgaXMKPiB1bnByaXZpbGVnZWQ6Cj4gaHR0cHM6Ly9naXRo
dWIuY29tL1QtaGVhZC1TZW1pL3RoZWFkLWV4dGVuc2lvbi1zcGVjL2Jsb2IvbWFzdGVyL3h0aGVh
ZHZlY3Rvci5hZG9jCj4gSSBhc3N1bWUgQ2hhcmxpZSB0cmllZCBpdCBidXQgd2FzIHRyYXBwaW5n
LCBhcyB2MSBoYWQgYSBjb21tZW50Ogo+ICsJCSAqIEFsdGhvdWdoIHh0aGVhZHZlY3RvciBzdGF0
ZXMgdGhhdCB0aC52bGVuYiBleGlzdHMgYW5kCj4gKwkJICogb3ZlcmxhcHMgd2l0aCB0aGUgdmVj
dG9yIDEuMCBleHRlbnNpb24gb3ZlcmxhcHMsIGFuIGlsbGVnYWwKPiArCQkgKiBpbnN0cnVjdGlv
biBpcyByYWlzZWQgaWYgcmVhZC4gVGhlc2Ugc3lzdGVtcyBhbGwgY3VycmVudGx5Cj4gKwkJICog
aGF2ZSBhIGZpeGVkIHZlY3RvciBsZW5ndGggb2YgMTI4LCBzbyBoYXJkY29kZSB0aGF0IHZhbHVl
LgoKT24gbXkgYm9hcmQgd2l0aCBhIGM5MDYgYXR0ZW1wdGluZyB0byByZWFkIHRoLnZsZW5iICh3
aGljaCBpcyBzdXBwb3NlZAp0byBoYXZlIHRoZSBzYW1lIGVuY29kaW5nIGFzIHZsZW5iKSByYWlz
ZXMgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbgpleGNlcHRpb24gZnJvbSBTLW1vZGUgZXZlbiB0aG91
Z2ggdGhlIGRvY3VtZW50YXRpb24gc3RhdGVzIHRoYXQgaXQKc2hvdWxkbid0LiBCZWNhdXNlIHRo
ZSBkb2N1bWVudGF0aW9uIHN0YXRlcyB0aGF0IHZsZW5iIGlzIGF2YWlsYWJsZSwgSQpoYXZlbid0
IG1hZGUgaXQgcmVxdWlyZWQgZm9yIHh0aGVhZHZlY3RvciwgSSBhbSBub3Qgc3VyZSB0aGUgcHJv
cGVyCnNvbHV0aW9uIGZvciB0aGF0LgoKLSBDaGFybGllCgo+IAo+IENoZWVycywKPiBDb25vci4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
