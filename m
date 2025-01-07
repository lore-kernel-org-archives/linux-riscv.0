Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3126E77197
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 08:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OvTy0H5FOeX94j/roGIze39ghJsIO2ECzPpHjOQrt9U=; b=SRLoSaUbaBEV0T
	QhQLGytf9HwVsrgUdY1Iy44yzZUGdXIoMlxhcayRvKLubL8aikb6IrrqWiN1XQu09W4qT+dn22dcz
	l7MGSX/Nt2F7RiQYgl+HY+YNZZtps5MUzt7tiEHqbqVng+axjxu44s3wj5lzmO0o+8i+jwbJWvwMs
	+eD6CFtc3cYhLTaM45TC42emfcyxm/jCbIkpgHtTrVNA1KQPRGO0b39s0wh9/e8H175PjXvsXR8Ox
	Qy7FAk8DVVuy+yBhlMq/6cDRw4CT++hWvEoZrvM20758zLKjS5DdpduZDDRo6lN1gdL9yhyBmPm95
	wZ6hYa8QvXtjTlh3tD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV50t-00000003wf0-2fzD;
	Tue, 07 Jan 2025 08:32:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV50q-00000003weY-3nFj
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 08:32:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43635796b48so91769305e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jan 2025 00:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736238751; x=1736843551; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bu2VZ1vDW/uI8Rfw7EAtvRn3NpKhRLd/XB967dfr6Cg=;
        b=f2GJ0OR/dyJbREWDRNnFrOWl+DfWLlX3lQXa7P8vC7ivPuk+rTMxa7o0SAvDt/tEWQ
         gVWjEfWIJKNBHL46kyCKK3IecAXFbqYq9yxpYFpMa70pAO1AUJjtxkB4xGNIAuNqlKcX
         BpWl5IRBIMthxmHd3DySfQxoK1+rGlox53mnTNTzKiimJjdXuxny4FxRCwfIzQRo6Jkw
         Z7H6EDRlU96BrWl04IhC9H22N/DJBaZgkwW+XFD3Lz8Hu9dDo9zSXKvT5Q4GySCLuOvz
         zTYD5ryfpEzuG27YWTA/hnW9cCJey+PImNNzz96M4qLVD2aR7VZ9pAHNA6ZknWfarhBk
         BiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736238751; x=1736843551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu2VZ1vDW/uI8Rfw7EAtvRn3NpKhRLd/XB967dfr6Cg=;
        b=YtB5mxfHujxU+IQvmB7aKx2PtTydzLZexhzI8moIFs9PkTusUbj42+5TU/3UvchgCY
         76Hgy/SZ6jIOyuWElQKPCz7a0h2fTzKEUMnKRTjgvaBJsX/p9f9SrTgwlxjaF+VWou6h
         ba0XDn9KPkciqXhh2xhHRMt2talHVluULLwwCTLNwnNefxGOhNG1BoWOv5F7yBQDygPH
         6x7G+QWIiwfimYt+dcmKCOw/9BW4H/o/Q+6t8tTSqZmWNbvXjk04F1y3BuAschMmosYm
         d59FAeF9sTZpHbdFaYXHpGJfRmqLQpWaHXZEI6TysWgqQjsMQBwQJeBvK278ZuJJw7/R
         swdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSpqrutI2BBVVWDyyy9HgDHOjdirGcIccKsLQgCGK3fwzwO2icFFp6SBSUq/EOcrNjAMyak54Zbxst0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxruIwO8QOc83/D6N8yAARKPI6/MgVtSSMBNsp6Xy8d8svasGHK
	kuPfSwhZ2tly7jZlRbl2Iabgc3SC5VyiLcWG5MQkn3CDG1DCNhsCDuwjWbDD/y/51nNW0AjfI7y
	L
X-Gm-Gg: ASbGncs39b2VZNElwQLX/PbCqdPNUM7cbPwxqOhkIfngpxbDz0tj2txXT7PBM4u6puk
	siRRizliLAFazAPgLJhOVQxQWWl2FIktgzp/FaB35c5IosQba4G8+RGPawHaJ0IAovEhld74mQs
	oUgWJtoBiX2yR2EnvElVkkv0hGeq0Nf5szKz1Y8lcnI6ahCIVp4tGRoLchhFSoNJfHrwqZOgLdZ
	ol4a1BUFSrXkLnO/5KVWBFEvaC8pdRRJbWdj8HqpT3UTDAQ5Ub5kXQvPx3j9teBaTaCA6us7q6e
	I64WwMlr8t1RgsZ0gtIygVR5Tw==
X-Google-Smtp-Source: AGHT+IG6spBFNnEMfh7XosVGH+/IEd0bPSGzBdG7QLVnc35t9cj4MHCAoJXsb6lGwkDUXX3hbUj/tQ==
X-Received: by 2002:a7b:c8da:0:b0:436:51ff:25de with SMTP id 5b1f17b1804b1-436dc1c7f41mr16861285e9.7.1736238750957;
        Tue, 07 Jan 2025 00:32:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832c45sm49352300f8f.32.2025.01.07.00.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 00:32:30 -0800 (PST)
Message-ID: <af6dde21-39de-4142-acd6-0f2db931b257@rivosinc.com>
Date: Tue, 7 Jan 2025 09:32:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: misaligned: disable pagefault before accessing
 user memory
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
References: <20250103160214.657508-1-cleger@rivosinc.com>
 <e68e8c3a-2d22-4385-9de5-e167974604fd@ghiti.fr>
 <e155b489-e511-4a8a-948c-c6838fc7a679@rivosinc.com>
 <alpine.DEB.2.21.2501070143250.18889@angie.orcam.me.uk>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <alpine.DEB.2.21.2501070143250.18889@angie.orcam.me.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_003233_223205_4544A2EC 
X-CRM114-Status: GOOD (  19.55  )
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

CgpPbiAwNy8wMS8yMDI1IDAzOjMzLCBNYWNpZWogVy4gUm96eWNraSB3cm90ZToKPiBPbiBNb24s
IDYgSmFuIDIwMjUsIENsw6ltZW50IEzDqWdlciB3cm90ZToKPiAKPj4+IEknbSB3b25kZXJpbmcg
d2h5IHRoZSBpcnFzIGFyZSBkaXNhYmxlZCBoZXJlPyBXaGF0IHByZXZlbnRzIHVzIGZyb20KPj4+
IGVuYWJsaW5nIHRoZW0/IElJVUMsIGlmIGZvciBzb21lIHJlYXNvbiB0aGUgdXNlciBwYWdlIGlz
IG5vdCBpbiBtZW1vcnksCj4+PiB3ZSB3aWxsIGZhaWwgdGhlIG1pc2FsaWduZWQgYWNjZXNzIGFu
ZCBraWxsIHRoZSBwcm9jZXNzLCBzbyBzdWNoCj4+PiBmYWlsdXJlcyBjb3VsZCBiZSBjb21wbGV0
ZWx5IHJhbmRvbSByaWdodD8KPj4KPj4gSGkgQWxleCwKPj4KPj4gVGhpcyBjb2RlIGlzIGNhbGxl
ZCBmcm9tIGludGVycnVwdCBjb250ZXh0IGFzIGEgcmVzdWx0IGZyb20gYW4KPj4gZXhjZXB0aW9u
LiBBRkFJSywgaW50ZXJydXB0cyBhcmUgZGlzYWJsZWQgZHVyaW5nIHRoZSB3aG9sZSBleGNlcHRp
b24KPj4gaGFuZGxpbmcgYW5kIHJlLWVuYWJsZWQgd2hlbiByZXR1cm5pbmcgdG8gdXNlciBtb2Rl
IGluCj4+IGRvX25vdGlmeV9yZXN1bWUoKS4gU28gdGhhdCdzIHdoeSBpdCB0cmlnZ2VycyB0aGlz
IHdhcm5pbmcuCj4gCj4gIFRoaXMgZmVlbHMgb3V0cmlnaHQgd3JvbmcuICBXZSBoYXZlIGFuYWxv
Z291cyBlbXVsYXRpb24gY29kZSBpbiBBbHBoYSBhbmQgCj4gTUlQUyBwb3J0cyBhbmQgd2Ugc3Rh
eSBhd2F5IGZyb20gcXVpY2sgc2FuZHMgYnkgZW5hYmxpbmcgaW50ZXJydXB0cyBpbiB0aGUgCj4g
cmVsZXZhbnQgZXhjZXB0aW9uIGhhbmRsZXJzIGFzIHNvb24gYXMgaXQgaXMgc2FmZSB0byBkbyBz
bzsgaW4gcGFydGljdWxhciAKPiB3aGVuIGVtdWxhdGluZyB1c2VyLW1vZGUgdW5hbGlnbmVkIGFj
Y2Vzc2VzLiAgV2hhdCBjYXVzZXMgdGhlIFJJU0MtViBwb3J0IAo+IHRvIGJlIGRpZmZlcmVudCBo
ZXJlPwoKSGkgTWFjaWVqLAoKSSBwcm9iYWJseSBkaWQgbm90IGNsYXJpZnkgdGhhdCBlbm91Z2gu
IFRoZSBjdXJyZW50IHBhdGggZm9yIG1pc2FsaWduZWQKYWNjZXNzZXMgZG9lcyBub3QgcmUtZW5h
YmxlIGlycXMgKHdoYXRldmVyIHRoZSBtb2RlIHdlIGVudGVyIGZyb20pLiBTb21lCm90aGVyIHBh
dGggZG9lcyAocGFnZV9mYXVsdCkgYXMgaXQncyBpbmRlZWQgc2FmZS4KCj4gCj4gIFNlZSBlLmcu
IHRoZSBNSVBTIGV4Y2VwdGlvbiBkaXNwYXRjaGVyIGluIGFyY2gvbWlwcy9rZXJuZWwvZ2VuZXgu
UyB3aGVyZSAKPiBCVUlMRF9IQU5ETEVSIGludm9jYXRpb25zIGV4cGxpY2l0bHkgZW5hYmxlIGlu
dGVycnVwdHMgZm9yIG1vc3Qgb2YgdGhlIAo+IGhhbmRsZXJzICh2aWEgYHN0aScgLT4gYF9fYnVp
bGRfY2xlYXJfc3RpJykuICBUaGVuIHVuYWxpZ25lZCBlbXVsYXRpb24gaXMgCj4gcnVuIHdpdGgg
dGhlIGludGVycnVwdCBlbmFibGUgc2V0dGluZyBwcmVzZXJ2ZWQgZnJvbSB0aGUgY29udGV4dCB0
aGUgZmF1bHQgCj4gaGFwcGVuZWQgaW4gKHZpYSBgYWRlJyAtPiBgX19idWlsZF9jbGVhcl9hZGUn
KSwgY2xlYXJseSBiZWNhdXNlIGl0IGNhbiBpbiAKPiBwcmluY2lwbGUgdHJpZ2dlciBmcm9tIGtl
cm5lbCBjb2RlIHJ1biB3aXRoIGludGVycnVwdHMgZGlzYWJsZWQuICBCdXQgc3VjaCAKPiBjb2Rl
IGlzIG5vdCBzdXBwb3NlZCB0byBhY2Nlc3MgdXNlciBtZW1vcnkgaW4gdGhlIGZpcnN0IHBsYWNl
IGFuZCB0cmFwcyAKPiBmcm9tIHRoZSB1c2VyIG1vZGUgd2lsbCBoYXZlIGhhZCBpbnRlcnJ1cHRz
IGVuYWJsZWQuCj4gCj4gIEkgdGhpbmsgdGhlIFJJU0MtViBwb3J0IGhhcyB0byBkbyB0aGUgc2Ft
ZSwgaS5lLiBydW4gdGhlIGhhbmRsZXIgd2l0aCB0aGUgCj4gc3VwZXJ2aXNvciBpbnRlcnJ1cHQg
ZW5hYmxlIGJpdCBzZXQgYWNjb3JkaW5nIHRvIHdoZXRoZXIgaW50ZXJydXB0cyB3ZXJlIAo+IGVu
YWJsZWQgb3Igbm90IGZvciB0aGUgbW9kZSB0aGUgZmF1bHQgaGFzIHRyaWdnZXJlZCBpbi4KCkl0
IHNlZW1zIGxpa2UgYXMgeW91IHNheSwgaXQgd291bGQgYWN0dWFsbHkgYmUgc2FmZSB0byByZS1l
bmFibGUKaW50ZXJydXB0cyBpbiB0aGUgbWlzYWxpZ25lZCBsb2FkL3N0b3JlIHBhdGggYXMgd2Vs
bCBhcwpkb190cmFwKCkvZG9fdHJhcF9icmVhaygpIHdoaWNoIG1pZ2h0IGFsc28gYmVuZWZpdCBm
cm9tIHRoaXMgaW1wcm92ZW1lbnQuCgpBZnRlciByZXZpZXdpbmcsIHRoZSBjb2RlLCB0aGVyZSBp
cyBhbHNvIGEgYnVuY2ggb2YgaXJxZW50cnlfbm1pX2VudGVyKCkKdGhhdCBzZWVtcyBhIGJpdCB3
ZWlyZCwgbWF5YmUgdGhleSBjb3VsZCBiZSByZXBsYWNlZCB3aXRoIGlycWVudHJ5X2VudGVyKCku
CgpUaGFua3MgZm9yIHRoZSByZXZpZXcsCgpDbMOpbWVudAoKPiAKPiAgIE1hY2llagoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
