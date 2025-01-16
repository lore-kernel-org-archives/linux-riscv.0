Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8370EC02180
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pM53TjYnunJ3KiB+zdCqMWnHUv6HQoi8SBpFYo2l6no=; b=pXtihBO7MliEyB
	1XkHlSPjir0ZH7wq20VG+PJzBODRfFwNtMgAb6WGv5DTKGCneZLbY3XqfKoxkqtmm8H8LmYWXz0bt
	3OM0DTLjQQn7R+DPBVx95CiM6Snj4jjw+1s7PP0C1dLMNXrb84n7ZnkYQT09IhTGpKeFbe7n+8BjY
	PfX7U3lt0PXLZLCXl1VwDrE5s+nf7Ut9Is4zd6mlliU44w1HsHKJP3Yb+mlpDONHkyReRJhKmWqh0
	gLLUtDUWt+B9QGYe7Udxkl4kfKbcitMaVUu4AXBsGSqVv9l0n+2BcrMbHetSpoQgbO/DUkUk7+sS+
	l/aUPcJAHnHZmfiZjCTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYN1l-0000000EU6N-0eZ0;
	Thu, 16 Jan 2025 10:23:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYN1j-0000000EU5Z-0c6u
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 10:23:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3862a999594so31030f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 02:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737022981; x=1737627781; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZkvdDnyLVGp1IEy4txVMz8RNqPNLFiF+bNPBLcxx30=;
        b=YY5XjJqrgnY5YjThPnA0IEEYGH/TX5KSMZPlNhBqYT8g/HDIYs/QB9Ra5U5L1UkC9z
         0E7GPe0dRS2+YgJeLOfialPSBqgaD3oEopiUCkFsIOIHC8wHqtSUViGzeyzV05MnLiV4
         UKpO1ws2YqKCLNYGMomaqlGrNhpLNtZXxVhsf/3l+pghZorSkoUVYG1WRXh8vpXIMLQS
         XVj5r5NrvGJNvNntA8Lk0B2mvLgRu0C03Rnqax7oXSHsm0iKVjOeGg84x6segK7so/wA
         nCOBLH7dS+Vx6jzZOZCiUWfjkxp0gnJ+oTlpBQ2p0cxQFtj+UTgP5wG0BrRp0m9BO8RZ
         G85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737022981; x=1737627781;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ZkvdDnyLVGp1IEy4txVMz8RNqPNLFiF+bNPBLcxx30=;
        b=JN9pLCUZZQFyOuAwGV4JoogjNIi4MiLhBqlYP87JbfORIlj1e+/WymsRRUTU1Y5oGa
         if7wAcU7Yz0+Am5q40klZNRQG23qxmUulMyLdQcLlePwzqYbzCyNlfpN30rnj6SDUX8n
         3NNZyQLTNXw75XvbxrffmtUXaiaFbc+g/K/mnx5V0OGJnWMYvbzP+Ny0zP8vmrQCGd/x
         pCgNPwY1pHfkn6MqL+7hTthBReAh9wjcE0uQZH7OZu+Mg27mRDx28+bkDLwiuKho5nGt
         7uTRBRGcbTWoOkMmL/AAQppI2AXehGk12Rg6A8BfiVXYR3fgj+u6gtLmMziuX7FpVLVx
         KLKQ==
X-Gm-Message-State: AOJu0Yz35ekLyia2dW9T/9uDYglYTag+NSRTOMvFtBETwPmc+Pu27BCy
	27i+vrVC3Kuq6YyhE9tOVHiTHOxRGXW9v+5UMIpvfG1R1hvZweHVqKxbLymR4E8=
X-Gm-Gg: ASbGncunX43wg6J6KXEtEgxRaxwzgDkB4bgqdBHNeJziAJGHHVEvqQiGlwjZlPdb2gu
	LVuDtONISBnKOhTjxywdJfEn0RNr2iQY8ttQu/5/bx+RB8dibHuXMae5MhumsjcTPqn/lx6eqx7
	+xvWyovN+ff6FEqDkYfay5cR4p5Pa0b2LGkelhLFbJeX9E3jeZjjK9lmW+q8qP2yN9E6w91XkEW
	VLkRvZuC30XszsXkMLWz3I0SaGNiJQsJA8v3ZfVpC1LL3OrAH9Dz4IhBARfd67wobfWC8alxeNk
	I8hnhyVAPezFqTmu
X-Google-Smtp-Source: AGHT+IGRoCDvefbFzC6jI8eoiyaJwQY+MVagscMSk1SQP59pQNBBzH+/Z2VgQqY5H4m/ta4tZ/nIKw==
X-Received: by 2002:a5d:5848:0:b0:385:f7a3:fec1 with SMTP id ffacd0b85a97d-38a872dc81dmr10932658f8f.3.1737022980865;
        Thu, 16 Jan 2025 02:23:00 -0800 (PST)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac207sm54165545e9.12.2025.01.16.02.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 02:23:00 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 16 Jan 2025 11:22:59 +0100
Message-Id: <D73F98QBJ4S9.3CN2ZUQ0GSMT6@ventanamicro.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-V
Cc: <linux-riscv@lists.infradead.org>, <jgross@suse.com>,
 <aou@eecs.berkeley.edu>, <Milan.Djokic@rt-rk.com>,
 <rafael.j.wysocki@intel.com>, <linux-kernel@vger.kernel.org>,
 <oleksandr_tyshchenko@epam.com>, <iommu@lists.linux.dev>,
 <sstabellini@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
 <xen-devel@lists.xenproject.org>, <Slavisa.Petrovic@rt-rk.com>,
 <takakura@valinux.co.jp>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Andrew Jones" <ajones@ventanamicro.com>,
 =?utf-8?q?Milan_=C4=90oki=C4=87?= <milandjokic1995@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com> <20250114-316084c962eb867c0b681043@orel> <CAKp59VFkW8F2xHsgAxiw138ZrpQJL8R5cTkF8f9vY40iEoRbWg@mail.gmail.com> <20250116-aa9eadde9279e66dbc01c705@orel>
In-Reply-To: <20250116-aa9eadde9279e66dbc01c705@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_022303_182717_23D61DC9 
X-CRM114-Status: GOOD (  17.07  )
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

MjAyNS0wMS0xNlQwOTo1MToyNSswMTowMCwgQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1p
Y3JvLmNvbT46Cj4gT24gV2VkLCBKYW4gMTUsIDIwMjUgYXQgMDg6MDQ6MDVQTSArMDEwMCwgTWls
YW4gxJBva2nEhyB3cm90ZToKPj4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgNzoxOOKAr1BNIEFu
ZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiA+IE9uIFR1ZSwg
SmFuIDE0LCAyMDI1IGF0IDA1OjA5OjM2UE0gKzAxMDAsIE1pbGFuIERqb2tpYyB3cm90ZToKPj4g
PiA+ICsjZGVmaW5lIFNCSV9FQ0FMTCAweEUKPj4gPgo+PiA+IFNob3VsZG4ndCB0aGlzIGJlIDB4
QTAwMDAwNywgaS5lLiB0aGUgU0JJIGZpcm13YXJlIHNwZWNpZmljIGV4dGVuc2lvbgo+PiA+IGZv
ciBYZW4uIE90aGVyd2lzZSB3aHkgcmVmZXIgdG8gU0JJPyBOb3RlLCAnMHhFJyBpcyBhbiBpbnZh
bGlkLCBsZWdhY3kKPj4gPiBleHRlbnNpb24gSUQgaW4gU0JJLgo+PiA+Cj4+IEh5cGVyY2FsbCBp
cyB0cmlnZ2VyZWQgdGhyb3VnaCBTQkkgYW5kIHdlIGRlZmluZWQgMHhFIGp1c3QgYXMgYW4KPj4g
U0JJX0VDQUxMIElEIG9uIFhlbiBzaWRlIGZvciBoeXBlcmNhbGwgaGFuZGxpbmcgKGFtb25nIG90
aGVyIG9wZXJhdGlvbgo+PiBJRHMpLCBzbyB3ZSdyZSBub3QgcmVmZXJyaW5nIHRvIHNvbWUgc3Rh
bmRhcmQgL2xlZ2FjeSBJRCBoZXJlLCBqdXN0Cj4+IHV0aWxpemluZyBTQkkgZm9yIGh5cGVyY2Fs
bCBoYW5kbGluZy4KPgo+IElmIHRoZSBTQkkgc3BlY2lmaWVkIEVJRHMgYW5kIGJpbmFyeSBlbmNv
ZGluZyBhcmVuJ3QgdXNlZCwgdGhlbiB0aGUKPiBoeXBlcmNhbGxzIGFyZW4ndCAidHJpZ2dlcmVk
IHRocm91Z2ggU0JJIiwgWGVuIGlzIGp1c3QgZG9pbmcgaXRzIG93bgo+IHRoaW5nIG9uIGFuIGVj
YWxsLiBYZW4gZG9lc24ndCBoYXZlIHRvIGltcGxlbWVudCBTQkkgYXQgYWxsLCBidXQgaWYKPiBp
dCB3YW50cyB0byBwcm92aWRlIFNCSSBzZXJ2aWNlcywgYXMgd2VsbCBhcyBpdHMgb3duIGh5cGVy
Y2FsbHMsIHRoZW4KPiB0aGUgaHlwZXJjYWxscyBzaG91bGQgYmUgZW5jb2RlZCBpbiB0aGUgc2Ft
ZSB3YXkgYXMgU0JJIGZ1bmN0aW9ucyBhbmQKPiBhbiBFSUQgYWxsb3dlZCBieSB0aGUgU0JJIHNw
ZWNpZmljYXRpb24gZm9yIGh5cGVydmlzb3Itc3BlY2lmaWMKPiBmdW5jdGlvbnMgc2hvdWxkIGJl
IHVzZWQuIEZvciBYZW4sIHRoYXQgRUlEIGlzIGFscmVhZHkgc3BlY2lmaWVkIGFuZAo+IGl0J3Mg
MHhBMDAwMDA3LgoKU0JJIHNwZWNpZmllcyBhIGNvbXBsZXRlIGNhbGxpbmcgY29udmVudGlvbiwg
YnV0IGl0J3Mgbm90IG5lY2Vzc2FyeSBmb3IKYmluYXJ5IGNvbXBhdGliaWxpdHkuICBTQkkgYWxz
byBhaW1zIHRvIHNpbXBsaWZ5IGNhbGxlciBBUEkuCgpMaW51eCBtYWludGFpbmVycyB3aWxsIHdh
bnQgYSBnb29kIHJlYXNvbiBmb3IgaW50cm9kdWNpbmcgc2VwYXJhdGUgWGVuClNCSSBjYWxsIGZ1
bmN0aW9ucy9tYWNyb3MgKGxpbnV4IGFscmVhZHkgaGFzIHNiaV9lY2FsbCwgc28gcGxlYXNlIHRy
eSB0bwp1c2UgYW5kIHBvdGVudGlhbGx5IGltcHJvdmUgaXQpLCBidXQgdGhlIEVDQUxMIGlzIGd1
YXJhbnRlZWQgdG8gYmUgU0JJCmNvbXBhdGlibGUgYXMgbG9uZyBhcyBhNz0weEEwMDAwMDcuCgph
NyBpcyBuZWVkZWQgdG8gZGVub3RlIFhlbidzIGV4dGVuc2lvbiBzcGFjZSBhbmQgdGhlIHJlbWFp
bmluZwppbnB1dC9vdXRwdXQgcmVnaXN0ZXJzIGNhbiBiZSBpbXBsZW1lbnRlZCBpbiBhbnkgd2F5
IFhlbiB3YW50cy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
