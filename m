Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC93C0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kajdxe5GFgkPkMFAuOT1iURrARuwlzSUvHiChfwxsTs=; b=0fR8uwFMTunrhn
	d0LTArc7ALQ7hCi+ZIc26InHN5BEF/VfvdjveIw24T0Ao+pHml+D9+chQV8U8mL2kmY5njaQzUYLb
	hoCtGrpcELWKSFG3pt+2SnXFvRBHKGtUOKGomQunKFRbeilLo+yCNamjgaAjB1/OiI5+3Sb6KxdCO
	aYu8J15VFjJq0kPgIGSZaLq4gzLDxUuVdTi7sdlrZRsBaiqvubl8BZ5QgdN1wKfEv1ZH0V+H/bXDY
	DPLa3PDacIp9xWqf0HxIn6TTxbb6KSuOS995Vd4JW8gOM4knPVs0DEy+qlAeucXQ3adCSwDyhB8ez
	INkfbxDwckKnrBPA6eQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlI1-00000002w2d-1Hq3;
	Tue, 11 Feb 2025 08:06:41 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlH2-00000002voX-0Qmq
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 08:05:41 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-71e565708beso3394178a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Feb 2025 00:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739261139; x=1739865939; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IeqYOaXyL41LitLer0dZtBcS1jjNXgv26uGc68W2ZXA=;
        b=a4EDav0Xpq1H5Xj4AjYb2cTOajbio8SW9FEzDAb2Vq1vU+r//wogIS3h5k3133F62p
         sqtS2cFrbn4F+O5VQEfo0W5g1Vot7kxMHBEaKVBhhKkrKfKYuO27ZZeiD2/BWYBx+X1L
         ANQ7Cokh+CkStHi68x7HfhAV6CQxFw2qxDe6ztUGleslTMzvhIAsb5FTe6KwxqNjYRbO
         1f22ekmQ5e3Y2yXe45czZokjvfOug279AFkdyNL+VNqtjX7WAfxm6yyE0NLCLLyYJBST
         cUUqNMS7WNN0C3ClhK7VwzrDwLpgh66rxDErsCdV0TukPzBnnzjijfvDcXrnG2+BDXpX
         MJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261139; x=1739865939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeqYOaXyL41LitLer0dZtBcS1jjNXgv26uGc68W2ZXA=;
        b=B4j3cdTBS42kcFRwKw6MNCB2azwyY7pvndSkNxXsKrHma+klFSngLtOFd9Cosg6nIz
         ObQglUsJRAa0KCLhMYtHtCHLmLrtfwhyeE84VppiqSJZeDXzZYlzfMFC+p3aIxwhSG7E
         ncD8/LBB7HayMjPR0OEO4wZca3Z29CJs535x8jfxvXSquguzfrZc/G4qBpXc/gl4WkeO
         T4kfV2HlzySBeQlIjEHnyxMBH2qpHuuIHL0bAqhS9a+nZUditwcYJ8F+O5ns3YcnjJ0P
         XDrasMc38dyyO3E509zwlJFUVWo8a80hz4LT4YLnniLS+xJhDU3rQk4dHmFU1yDxZM1U
         SywA==
X-Forwarded-Encrypted: i=1; AJvYcCXoxhdC8mXEhK/dpRmWUwGjyrGc45Bo5LTku/BtVa+Ldy4Ht6hRZF600X/mevS9UM6QELajScfq6nzetA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywevo6MvFFEyKy7VSosSVAArHQF45DSfiAYjySV86RDZqBqJmeH
	WrEGQ7nCDHYf7DUkN8dpPjNypKKVolPdZTjJ++fuWFduN5twq/6gMQd2VLkJh/6Bj5X3zhDKK49
	tdEXfTCKmRtHxOgcQgnwDJWfCoH8=
X-Gm-Gg: ASbGncvNYbkylD/HCa5Kl+HIVJoclaFzEXZGtWokvcq3hQ3DusfaiRlIvSrBCN2Veyh
	9RLQJI+3K1py8KJDuT61DvZx3w9vZWNO4ZwYg8xw56QFZ8981SV5JqVnyDxf9ShXxWUiqlW+Zwk
	8I+8Os9cdmL+L7uKvjXRR6Z0YtvcOk
X-Google-Smtp-Source: AGHT+IH1yYjBDq+fpIs2910Udi8BvvFKAuL4iL47+8Y/BbUeB+wz+UXTXrj23xSjcuh9pdg/bHLlXJsGj0VslDrI/G8=
X-Received: by 2002:a05:6830:3497:b0:71e:4fc:6ee1 with SMTP id
 46e09a7af769-726e79e202cmr1547852a34.9.1739261138277; Tue, 11 Feb 2025
 00:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
 <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn> <87frl0snf6.fsf@all.your.base.are.belong.to.us>
 <CAAfSe-tRFEXiXJ=tHVnXy4Kb6O7-E2Sr_xybLYxma=ypMhqz9w@mail.gmail.com> <Z6rLlkphtv99+bH3@debug.ba.rivosinc.com>
In-Reply-To: <Z6rLlkphtv99+bH3@debug.ba.rivosinc.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 11 Feb 2025 16:05:02 +0800
X-Gm-Features: AWEUYZmR3vcC-5RUc00Y8UvIfNPJCSy9ifpTouB9LReWy6id2n5cEvTpBNFA-9k
Message-ID: <CAAfSe-sf+4QY9eif_XaRGXEUn1JyPn_Jj+k2MOq9mfDR2Bd6yg@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
To: Deepak Gupta <debug@rivosinc.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_000540_144145_80513736 
X-CRM114-Status: GOOD (  17.50  )
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

T24gVHVlLCAxMSBGZWIgMjAyNSBhdCAxMjowMSwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMTEsIDIwMjUgYXQgMDk6MjA6MjJBTSArMDgw
MCwgQ2h1bnlhbiBaaGFuZyB3cm90ZToKPiA+T24gVGh1LCAzMCBKYW4gMjAyNSBhdCAxNjo0Miwg
QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBDaHVueWFu
IFpoYW5nIDx6aGFuZ2NodW55YW5AaXNjYXMuYWMuY24+IHdyaXRlczoKPiA+Pgo+ID4+ID4gVGhl
IFBURSBiaXQoOSkgb24gUklTQy1WIGlzIHJlc2VydmVkIGZvciBzb2Z0d2FyZSwgaXQgaXMgdXNl
ZCBieSBkZXZtYXAKPiA+PiA+IG5vdyB3aGljaCBoYXMgdG8gYmUgZGlzYWJsZWQgaWYgd2Ugd2Fu
dCB0byB1c2UgYml0KDkpIGZvciBvdGhlciBmZWF0dXJlcywKPiA+PiA+IHNpbmNlIHRoZXJlJ3Mg
bm8gbW9yZSBmcmVlIFBURSBiaXQgb24gUklTQy1WIG5vdy4KPiA+PiA+Cj4gPj4gPiBTbyB0byBt
YWtlIEFSQ0hfSEFTX1BURV9ERVZNQVAgc2VsZWN0YWJsZSwgdGhpcyBwYXRjaCB1c2VzIGl0IGFz
Cj4gPj4gPiB0aGUgYnVpbGQgY29uZGl0aW9uIG9mIGRldm1hcCBkZWZpbml0aW9ucy4KPiA+Pgo+
ID4+IEhlYWRzLXVwOiBJdCBzZWVtcyBsaWtlIEFsaXN0YWlyJ3Mgc2VyaWVzIFsxXSB0aGF0IHJl
bW92ZXMgdGhlIGRldm1hcAo+ID4+IFBURSBiaXQgd2lsbCBtb3N0IGxpa2VseSBsYW5kIGluIDYu
MTUuCj4gPgo+ID5ZZXMsIEkndmUgYmVlbiBrZWVwaW5nIGFuIGV5ZSBvbiBBbGlzdGFpcidzIHNl
cmllcywgaW50ZW5kZWQgdG8gdXBkYXRlCj4gPnRoaXMgcGF0Y2hzZXQgYWZ0ZXIgQWxpc3RhaXIn
cyBwYXRjaCB0aGF0IHJlbW92ZXMgdGhlIGRldm1hcCBQVEUgYml0Cj4gPmdvdCBtZXJnZWQuCj4K
PiBQbGVhc2Uga2VlcCBpbiBtaW5kIHRoYXQgZXZlbiBhZnRlciBjbGFpbWluZyBiYWNrIGRldm1h
cCBQVEUgU1cgYml0LCBhIGNvbXBpbGUKPiB0aW1lIGRlY2lzaW9uIHRvIHNlbGVjdCBiZXR3ZWVu
IHVmZmQtd3AgYW5kIHNvZnQtZGlydHkgaXMgbm90IGRlc2lyYWJsZS4KClllcywgSSBhZ3JlZS4g
SSd2ZSByZWFkIHlvdXIgYW90aGVyIGVtYWlsLiBJIGFsc28gaG9wZSB3ZSBjYW4gaGF2ZQptb3Jl
IFJTVyBiaXRzIHRvIHVzZS4gU28gc2hvdWxkIHdlIGFkZCB1ZmZkLXdwIGFuZCBzb2Z0LWRpcnR5
IHN1cHBvcnQKb24gUklTQy1WIHVudGlsIHdlIGhhdmUgdHdvIFJTVyBiaXRzIGZvciB0aGVzZSB0
d28gZnVuY3Rpb25zPyBJcyBhbgp1bmRlc2lyYWJsZSBzb2x1dGlvbiBiZXR0ZXIgdGhhbiBubyBz
b2x1dGlvbiBmb3Igbm93PyBJIGNhbiBvcHRpbWl6ZQp0aGUgY29kZSB3aGVuIHdlIGhhdmUgbW9y
ZSBmcmVlIFJTVyBiaXRzLCB0aGF0J3Mgbm90IGhhcmQuCgpUaGFua3MsCkNodW55YW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
