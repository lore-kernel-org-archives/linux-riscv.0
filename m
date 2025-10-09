Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6123CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 02:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YamemZegIn7vn34MQ90at4U+LMxjvlvd6Wasf1dQOj8=; b=TlsmfvaDDQZqpr
	tBffuYK5BwD27K7BuTYkNFgY/G9Elm1RUQr876vN0VXdsvVdQcyfDHZwTNAPI0Zw44fEEkJ5Ocr71
	zX6vz3GTxTngZOUgt2FNrNqLioJT73/gKRJ5OWni+/Yc2j9o7ndUftESlbTrxS9+Mo8zxCDvo9FHG
	dkqjTW68mrhMNG5ZbXHjcMotTGEsn5ri6p7hwkja/kNB410L40h/OowBYyOhovRZdRaFnBzKJKVwE
	O8L0keBdggfmhO0YYvIqZzlPxyr0i90GWJvzPvnyP2/Ph9uOOzK0oTKZ5UNsT9CY1RHSbv3nz48bl
	EGHFQs8C0w1Kq7LZai7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6g8v-000000052Oe-40zu;
	Thu, 09 Oct 2025 02:12:33 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6g8t-000000052OK-1eOv
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 02:12:32 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-424da17e309so4804705ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 19:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975950; x=1760580750; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbPu2XGEyV84O7ceajb+hSEcv9NBBUMvNPxDk1syPXo=;
        b=e8zYZz44poMyfchct2nxtG4SiSibdoqal6lGe1Ln0iR+fv5lXDq6aQClJcrQPvwa9x
         CRrKsriV8x0nWRjMY5UQEC12Uu/sKYN3RdQjGQk0LRpAwjZrh7St/Idr8si1xGSo9Ju5
         h3KmrU95YNKdKT5GIpK8wjG+vt5s455+SateC4P4cXWA3kHnzpzV+B+G812DiSIgfGR7
         UrB+d9Pv7MVX7Z81zTH1z3CQFXyBWIITcYmZhMEmGW6jIhPoucy/AUHsUcArE+mWiKxN
         XKaeve7VLPLqZBdfQksbD0XeS4nLANVW8LcecZap6asgBuMoBbhG9fVoECL9d+RwO2lN
         KKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975950; x=1760580750;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbPu2XGEyV84O7ceajb+hSEcv9NBBUMvNPxDk1syPXo=;
        b=p/gl7AHn4AXbfDG4iLZUDJdcrouSgsTG31+S3fCV+eddPMmbFG3qAOmlJIadPYDPrF
         1X81iDF6lpJE224unwDDD4P/3bxjixBlcW/6XmOvVVV3Yexma12Tps3VoyNO44F1zroe
         pAzta01B8iL7VHv05/CfUdddvjQh67DxQRvZnDAiziTGcP+DAnNtk2r1q4Ba733vxtXM
         ovMI4ixPAIJZIo1lt6dLxu3KVhtSsUEHAtlbcfEkX8PvJQ63fNCCXXi/Ly1oTaEWGvMJ
         J1dJPoxl7sL55itPe3XVdNyErPqR1Gf1A53/Th4N3zd13NuZdUOasVV9MXO6wBPSGJD2
         e2bA==
X-Forwarded-Encrypted: i=1; AJvYcCVqoV/aVsDgZ3jVLO9/Msc7xp3A+K799YlYnx1nBOitAwCD6E/PJ8KNMDf/mWnf1eH+edm/liqruQhMjg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyef8SrIIzVOkyAVKJHP+BuWNuHpAyb1MPQWsiCwju+QxyoTkf
	NkS1phgMikzEEuIaqJiNbMYPPiZkp/EnKbD15UTrGdHzV8yNaBI105zUXKeKVtF6ab8=
X-Gm-Gg: ASbGncvJfw7FkfcKOsUaFe0SbzgikZFVP9MKjIyBMdLz/BVQdR98fWatfzS1NScaytG
	2nXAkW/VGpqwRGIyit26c0mD6HWpkOJF/tvhzcg4tTWIsCIak+lvMOp00Gzt2hlT8qgag4OfbUI
	HUVpEKWT0XViF8eW0/9wa+vfFXrFkhBKEMl9U8MMkr58PaOJvAz0UkmZ6zweeHfjFaxq4YyY3K3
	OYQSl/CMTWKUMvdhMfbQ4X9DWfAqwLJFYgzzkQ/gTt6BPQ3YXEiuiBwkm8E1/9Xkf/3I91tIoTb
	49LGNPthTA5r/ypn2DR/cFXsj2t8LY/24CCEkebPRFgSmuAqP0/fXz9L/oGLqCHegg0vWJ3AKPx
	X6qpR/aJi7hMESeQsJ665xKRB8b30Ixd538eGThP6HpZPdMscP3ctba7i0Im/cPc=
X-Google-Smtp-Source: AGHT+IFf3P0fMqgtIRBVPv2XsviE3jCqS0vhAVEZFCbPRNoZDag8qSCTZQOfXsXtGUnTxbVxbZkh8Q==
X-Received: by 2002:a05:6e02:18c7:b0:427:de6d:b6f3 with SMTP id e9e14a558f8ab-42f873590a0mr52309535ab.8.1759975950061;
        Wed, 08 Oct 2025 19:12:30 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.207])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42f9036cee5sm5594385ab.32.2025.10.08.19.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 19:12:29 -0700 (PDT)
Message-ID: <e155e1f8-0b54-432e-a155-eec5ca41c341@sifive.com>
Date: Wed, 8 Oct 2025 21:12:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] riscv: mm: Fix up memory types when writing page
 tables
To: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20241102000843.1301099-1-samuel.holland@sifive.com>
 <20241102000843.1301099-7-samuel.holland@sifive.com>
 <4123bd5d-33b8-4248-a03a-de784c433040@ghiti.fr>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <4123bd5d-33b8-4248-a03a-de784c433040@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_191231_440796_5107D04B 
X-CRM114-Status: GOOD (  17.09  )
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

SGkgQWxleCwKCk9uIDIwMjQtMTEtMDUgNTowMyBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+
IE9uIDAyLzExLzIwMjQgMDE6MDgsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+PiBDdXJyZW50bHks
IExpbnV4IG9uIFJJU0MtViBoYXMgdGhyZWUgd2F5cyB0byBzcGVjaWZ5IHRoZSBjYWNoZWFiaWxp
dHkKPj4gYW5kIG9yZGVyaW5nIFBNQXMgb2YgYSBwYWdlOgo+PiDCoCAxKSBEbyBub3RoaW5nOyBh
c3N1bWUgdGhlIHN5c3RlbSBpcyBlbnRpcmVseSBjYWNoZS1jb2hlcmVudCBhbmQgcmVseSBvbgo+
PiDCoMKgwqDCoCB0aGUgaGFyZHdhcmUgZm9yIGFueSBvcmRlcmluZyByZXF1aXJlbWVudHMKPj4g
wqAgMikgVXNlIHRoZSBwYWdlIHRhYmxlIGJpdHMgc3BlY2lmaWVkIGJ5IFN2cGJtdAo+PiDCoCAz
KSBVc2UgdGhlIHBhZ2UgdGFibGUgYml0cyBzcGVjaWZpZWQgYnkgWFRoZWFkTWFlCj4+Cj4+IFRv
IHN1cHBvcnQgYWxsIHRocmVlIG1ldGhvZHMsIHRoZSBrZXJuZWwgZHluYW1pY2FsbHkgZGV0ZXJt
aW5lcyB0aGUKPj4gZGVmaW5pdGlvbnMgb2YgdGhlIF9QQUdFX05PQ0FDSEUgYW5kIF9QQUdFX0lP
IGZpZWxkcy4gSG93ZXZlciwgdGhpcwo+PiBhbG9uZSBpcyBub3Qgc3VmZmljaWVudCwgYXMgWFRo
ZWFkTWFlIHVzZXMgYSBub256ZXJvIG1lbW9yeSB0eXBlIHZhbHVlCj4+IGZvciBub3JtYWwgbWVt
b3J5IHBhZ2VzLiBTbyB0aGUga2VybmVsIGhhcyBhbiBhZGRpdGlvbmFsIGFsdGVybmF0aXZlCj4+
IHNlcXVlbmNlIChBTFRfVEhFQURfUE1BKSB0byBpbnNlcnQgdGhlIGNvcnJlY3QgbWVtb3J5IHR5
cGUgd2hlbiB3cml0aW5nCj4+IHBhZ2UgdGFibGUgZW50cmllcy4KPiAKPiAKPiBJIGhhdmUganVz
dCB0YWtlbiBhIGxvb2ssIGFuZCBpdCdzIG5vdCBleGFjdGx5IHdoZW4gdGhlIHBhZ2UgdGFibGUg
aXMgd3JpdHRlbgo+IGJ1dCByYXRoZXIgd2hlbiB0aGUgcGFnZSB0YWJsZSBlbnRyeSBpcyBiZWlu
ZyBjcmVhdGVkLgo+IAo+IEFuZCBJIGhhdmUgdG8gYWRtaXQgdGhhdCBJIGZpbmQgaXQgd2VpcmQs
IG1vdmluZyB0aGF0IHRvIHRoZSBzZXRfcFhkKCkgZnVuY3Rpb25zCj4gc2VlbXMgd2F5IG1vcmUg
cm9idXN0LiBJbmRlZWQgdGhvc2UgZnVuY3Rpb25zIG11c3QgYmUgdXNlZCB0byB3cml0ZSBhIHBh
Z2UgdGFibGUKPiBlbnRyeSBidXQgYSBwYWdlIHRhYmxlIGVudHJ5IGNhbiBiZSBjcmVhdGVkIGJ5
IG90aGVyIG1lYW5zIHRoYW4gd2l0aCB0aGUKPiBwZm5fcFhkKCkgZnVuY3Rpb25zLgo+IAo+IFRo
aXMgaXMgd2hhdCBJIGRpZCBmb3IgTkFQT1QgdG8gaGlkZSB0aGUgc2l6ZSBvZiB0aGUgbWFwcGlu
ZyBjb250YWluZWQgaW4gdGhlCj4gcGZuIGZyb20gdGhlIGdlbmVyaWMga2VybmVsIGhlcmUgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtCj4gcmlzY3YvMjAyNDA4MDIxNTE0MzAuOTkxMTQt
MS1hbGV4Z2hpdGlAcml2b3NpbmMuY29tLwoKSSd2ZSBqdXN0IHNlbnQgb3V0IGEgdjIgd2hpY2gg
Zm9sbG93cyB5b3VyIHN1Z2dlc3Rpb25bMV0uIEl0IHR1cm5zIG91dCB0aGF0IHRoZQpwWFhwX2dl
dCgpL3NldF9wWFgoKSBmdW5jdGlvbnMgYXJlbid0IDEwMCUgcm9idXN0IGVpdGhlciwgd2l0aCBz
b21lIGV4YW1wbGVzCnNob3duIGluIHBhdGNoIDUgb2YgdGhlIG5ldyBzZXJpZXNbMl0uIEFuZCB0
aGVyZSdzIHNvbWUgb25nb2luZyBkaXNjdXNzaW9uIGFib3V0CmlmIGl0J3MgYXBwcm9wcmlhdGUg
dG8gcHV0IG5vbnRyaXZpYWwgY29kZSBpbiB0aG9zZSBoZWxwZXIgZnVuY3Rpb25zWzNdLiBTbyBJ
CmRvbid0IGtub3cgd2hhdCdzIHJlYWxseSB0aGUgYmVzdCBzdHJhdGVneSBoZXJlLgoKUmVnYXJk
cywKU2FtdWVsCgpbMV06Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUx
MDA5MDE1ODM5LjM0NjAyMzEtMS1zYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tLwpbMl06Cmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUxMDA5MDE1ODM5LjM0NjAyMzEtNi1z
YW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tLwpbM106Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDI1MTAwNjA4MjIzOC5HUTMyNDUwMDZAbm9pc3kucHJvZ3JhbW1pbmcua2lja3MtYXNzLm5l
dC8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
