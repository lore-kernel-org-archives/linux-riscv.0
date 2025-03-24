Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC65DC28B30
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 01:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyHaK0RQRPr5lG0pSdau1FxA8l4XVeVPUhUyXzRu/RA=; b=FZnhVESdV3lJqo
	fJJa/SiyM+PRqSDpaHzIjJAIQ21x9uyc3hlkGhLYhiWNU2oFziqYGDXA3SbQW4WLhezP6DyWPbSPm
	lbnBbQrm2YqyiKL5zkGCjBTU3QMcHpXt79koxgR69KV5AM61rxTmqOTsT56aVgf5zRp3IEVGfaZiq
	LI3k3/ZPv6cZthyzpE0iVr4pvH0wckfmjJFFCk2NbplbzG4pqablM8+lYXZXQK6hz0XLYGZJuO7Wu
	BuaN1/ejn0cdWEJcpWyLZvWDn/d8lGfTpjI9QnP/8yNajMDo+4xwGCdT6KWDSOVSqi0aFwSjBau8w
	zxR525OOudOwGrrXMvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twWeH-000000021Oh-3fkn;
	Mon, 24 Mar 2025 01:30:41 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twWeF-000000021OJ-0hFY
	for linux-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 01:30:40 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-72bceb93f2fso2669239a34.0
        for <linux-riscv@lists.infradead.org>; Sun, 23 Mar 2025 18:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1742779833; x=1743384633; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHaMaSyKiahGNcCRdsRhprtY7QyJpJpkUE40EirSGDI=;
        b=M9FVJuP5j4OYgxBJZ3rOwLCR2tvkr4Ztgt+s75wtRjBAPmX2l40A0FGauRqT4FFz8J
         qPcNkwnEnBSSeRvYp4zVSwufIvu9mF1gVHFi/GQiEVwKdqFqe0wGUemU0bSkhFLBswFa
         vFoepVfb0hvxBE7rK9wsFNFQjAj+OHVSZgs49dtKtzBLi1iGO3i7kx0j+YRdYYPEm3RT
         wqEyi7pY5BYSO8qC1GV3/d8dijzdgU+LaBuLkuFW+ZIEl+qMwUxncnhU0KeU/hsWHigg
         4qU8L/hYkryYtlzCwq4GIuAN3EkioV3qDbzqBHf3xskMvf/s+g5xlptevfqWJIYYk2IY
         YOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742779833; x=1743384633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHaMaSyKiahGNcCRdsRhprtY7QyJpJpkUE40EirSGDI=;
        b=vdqJdf1LzfA4t5bZll3vAtJqqraSI670wqZQTRh07O6LZs0eNFJTQwc62a6Imqbnrk
         OvZ/K4Q+zZrXsz0raSHrNBBB/DLND0xuCPiovDXRVwURfR2gS9fRz/k8TpCMKI5UXnZF
         +YoyoiJvzkHvU/F/oash74nnPg6FCXChZHzKMSYaxjpKMeX3X4+jnuL4J+1CcN36NFIG
         Dowa9L53esAL0ARwJKjM0rgcWlsGcBjffoIoZ+8LArVZ6HiegEYhiyfaENqq+x/BT+ho
         +MkpS4bWjNOtXV8F4N9XXKo8hoS8wcNTshsS8uzS+8IjXTOQXMVznDPwo03FO7gtFdsi
         Lljg==
X-Forwarded-Encrypted: i=1; AJvYcCVgAxyNfNDCxgxp78qHeIrRoonKnNJSEFh8mLX43wRwf1MGWznYfZ5aNJVaW8YGCrsKIvk5iaNvHM0ZGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQIwiZ6ugYStpHqdQx7hXSQIVqqMvcWYYDESh1VISyWpgFzWxb
	ik1a1NvFH7Qfe+RPX/l6dHjajbwqmTPA9Fe/Ta+gfTwr4uHk9ZJWeBRyjhcdMd9c96sEEkXk/aw
	RDpYkFQyoDbD8OUyYQX3Ojd4/S77bq4jXFrJR6Q==
X-Gm-Gg: ASbGncsWxhEqj3TFXatxifuj/GDdUT3Rx0ppPP0BD7J+OVu2Jl+5HOGkyZOSrYqmU6J
	483twEAWBbWYesle4aiNyspJO0tZBEE0MX1+pBdiAwHWTKt8WtURMRpUkyC3rP6sbk1vyLM1NjA
	0InHWd9AMhZhRCmsAd8OEG+0JzRpks
X-Google-Smtp-Source: AGHT+IFCGxrTJrhT5MB5IOTghrbVeSGsI5XQoqx6jtpjztRs6A8CS68jdaM9ZFZEnhypc3g0B8SAFNDAdFEbCLeVMjs=
X-Received: by 2002:a05:6808:6b48:b0:3f4:bc5:d47a with SMTP id
 5614622812f47-3febee94fbemr7494467b6e.13.1742779833340; Sun, 23 Mar 2025
 18:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250320084428.51151-1-cuiyunhui@bytedance.com> <9256ca10-323d-41b4-b935-5281f925d50c@app.fastmail.com>
In-Reply-To: <9256ca10-323d-41b4-b935-5281f925d50c@app.fastmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 24 Mar 2025 09:30:22 +0800
X-Gm-Features: AQ5f1JqdDkB23zUxFSv44PCGpKGeQD7bhYahZkOrkx_S49DgGP7FcuHlvQMshis
Message-ID: <CAEEQ3wk95SMxbKQqD08ACaErG9bvUNQ9QOK6KsZSc5xGHRj+pQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv: introduce the ioremap_prot() function
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ingo Molnar <mingo@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Nam Cao <namcao@linutronix.de>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Stuart Menefy <stuart.menefy@codasip.com>, Xu Lu <luxu.kernel@bytedance.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dawei Li <dawei.li@shingroup.cn>, 
	Mike Rapoport <rppt@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_183039_317200_EB7F685B 
X-CRM114-Status: GOOD (  25.11  )
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

SGkgQXJuZCwKCgpPbiBUaHUsIE1hciAyMCwgMjAyNSBhdCA1OjIy4oCvUE0gQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1hciAyMCwgMjAyNSwgYXQgMDk6
NDQsIFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBJdCdzIGFkdmlzYWJsZSB0byBhdm9pZCBtYXBwaW5n
IG1lbW9yeSB3aXRoIHRoZSBub24tY2FjaGUgYXR0cmlidXRlLgo+ID4gVGhpcyBpcyBiZWNhdXNl
IGlzc3VlcyBtYXkgYXJpc2Ugd2hlbiB0aGUgc2FtZSBwaHlzaWNhbCBhZGRyZXNzIGlzCj4gPiBt
YXBwZWQgYXMgYm90aCBjYWNoZWFibGUgYW5kIG5vbi1jYWNoZWFibGUgc2ltdWx0YW5lb3VzbHks
IHN1Y2ggYXMKPiA+IGluIHRoZSBjYXNlIG9mIGhhcmR3YXJlIHByZWZldGNoaW5nLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+Cj4g
TWFrZXMgc2Vuc2UgdG8gbWUuIElkZWFsbHkgd2UnZCBoYXZlIHRoZSBjaGVjayBpbiBnZW5lcmlj
X2lvcmVtYXBfcHJvdCgpLAo+IGJ1dCBJIGJlbGlldmUgdGhpcyB3b3VsZCBicmVhayBvbiAoYXQg
bGVhc3QpIHg4NiBiZWNhdXNlIG9mCj4gbGVnYWN5IGNhbGxlcnMgb2YgaW9yZW1hcCgpIG9uIG1l
bW9yeS4KPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW8uaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vaW8uaAo+ID4gaW5kZXggYTBlNTE4NDBiOWRiLi43MzZjNTU1
N2JkMDYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lvLmgKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaW8uaAo+ID4gQEAgLTEzMyw2ICsxMzMsOCBAQCBf
X2lvX3dyaXRlc19vdXRzKG91dHMsIHU2NCwgcSwgX19pb19wYnIoKSwgX19pb19wYXcoKSkKPiA+
ICAjZGVmaW5lIG91dHNxKGFkZHIsIGJ1ZmZlciwgY291bnQpIF9fb3V0c3EoUENJX0lPQkFTRSAr
IChhZGRyKSwgYnVmZmVyLCBjb3VudCkKPiA+ICAjZW5kaWYKPiA+Cj4gPiArI2RlZmluZSBpb3Jl
bWFwX3Byb3QgaW9yZW1hcF9wcm90Cj4gPiArCj4gPiAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL2lv
Lmg+Cj4gPgo+ID4gICNpZmRlZiBDT05GSUdfTU1VCj4KPiBUaGlzIGZlZWxzIHNsaWdodGx5IHdy
b25nIHRvIG1lLCB0aGUgIiNkZWZpbmUgZm9vIGZvbyIgbWV0aG9kCj4gaXMgbm9ybWFsbHkgdXNl
ZCB0byBvdmVycmlkZSBhIGRlY2xhcmF0aW9uIG9yIGlubGluZSBmdW5jdGlvbiB3aXRoCj4gYW5v
dGhlciBvbmUsIGJ1dCB0aGlzIG9uZSBvbmx5IG92ZXJyaWRlcyB0aGUgaW1wbGVtZW50YXRpb24s
IG5vdAo+IHRoZSBkZWNsYXJhdGlvbi4KPgo+IEkgc2VlIHRoZSBzYW1lIGlzIGRvbmUgb24gYXJj
LCBhcm02NCwgcGFyaXNjLCBwb3dlcnBjLCBzMzkwLAo+IHNoIGFuZCB4dGVuc2EsIHNvIHdlIGNh
biBrZWVwIHRoaXMgb25lIGFzIHdlbGwsIGJ1dCBpdCB3b3VsZCBiZQo+IG5pY2UgdG8gY2hhbmdl
IGFsbCBvZiB0aGVzZSB0byBhIGxlc3Mgc3VycHJpc2luZyBhcHByb2FjaC4KPgo+IE1heWJlIHdl
IHNob3VsZCBqdXN0IHJlbW92ZSB0aGVzZSBtYWNyb3MgZnJvbSBhc20vaW8uaCBhbmQKPiB0aGUg
dHJpdmlhbCB3cmFwcGVyIGZyb20gbW0vaW9yZW1hcC5jLCBhbmQgaW5zdGVhZCBjaGFuZ2UgdGhl
Cj4gb3RoZXIgYXJjaGl0ZWN0dXJlcyB0aGF0IGhhdmUgR0VORVJJQ19JT1JFTUFQIHRvIHVzZQo+
Cj4gI2RlZmluZSBpb3JlbWFwX3Byb3QgZ2VuZXJpY19pb3JlbWFwX3Byb3QKPgo+IEl0IHNlZW1z
IHRoaXMgd291bGQgYmUgb25seSBjc2t5LCBoZXhhZ29uLCAoc29tZSkgbG9vbmdhcmNoCj4gYW5k
IG9wZW5yaXNjLgo+Cj4gICAgICBBcm5kCgpJdCBzZWVtcyB0aGF0IHdlIGNhbid0IHNpbXBseSB1
c2UgI2RlZmluZSBpb3JlbWFwX3Byb3QKZ2VuZXJpY19pb3JlbWFwX3Byb3QgYmVjYXVzZSBzb21l
IGFyY2hpdGVjdHVyZXMgaGF2ZSBjZXJ0YWluIHNwZWNpYWwKYmVoYXZpb3JzIGJlZm9yZSBjYWxs
aW5nIGdlbmVyaWNfaW9yZW1hcF9wcm90KCkuIEZvciBleGFtcGxlLCB0aGVyZSdzCnRoZSBpb3Jl
bWFwX3Byb3RfaG9vaygpIGxvZ2ljIG9uIEFSTTY0IGFuZCB0aGUgQ09ORklHX0VJU0EgbG9naWMg
b24KUEEtUklTQywgYW1vbmcgb3RoZXJzLgoKUmVnYXJkaW5nIHRoZSBjaGVjayBvZiB3aGV0aGVy
IHRoZSBhZGRyZXNzIGlzIGEgbWVtb3J5IGFkZHJlc3MsIEkKdGhpbmsgd2UgY2FuIGRpcmVjdGx5
IGluY29ycG9yYXRlIHBmbl92YWxpZCgpIGludG8KZ2VuZXJpY19pb3JlbWFwX3Byb3QuIFRoaXMg
cHJvYmFibHkgd29uJ3QgYWZmZWN0IGFyY2hpdGVjdHVyZXMgdGhhdApkaXJlY3RseSB1c2UgZ2Vu
ZXJpY19pb3JlbWFwX3Byb3QoKSwgc3VjaCBhcyBDLVNLWSwgSGV4YWdvbiwgYW5kCkxvb25nQXJj
aC4KClNvLCBteSBuZXh0IHBsYW4gaXMgdG8gYWRkIHBmbl92YWxpZCgpIHRvIGdlbmVyaWNfaW9y
ZW1hcF9wcm90KCkuCgpXaGF0J3MgeW91ciBvcGluaW9uPwoKVGhhbmtz77yMCll1bmh1aQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
