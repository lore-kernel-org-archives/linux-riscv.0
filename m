Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4EA4C83F04
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 10:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUTln9EOIQrsJQoR4x1KHJkF65pZMkrctZCM2M/KTN8=; b=N1awHhkfFoYw3h
	yP7A0mahilSNoE1oeAzOYq0F4f6SA0lf//1Ya1GsBuYkMbvTWJMI6+fYpv2MNhCVb4sG4P2avvGTI
	dGp0tzi6dD/a2coblOIrD7Iyjoh7A8LVHZ/qVzqodP7kkXrP12XM7rldKSxbzXRVH0tlRBQHxSvvU
	DW55QRX2FfEK/Kmm81TPGXyB0ybVlLy/JUmOKefUNY4W9Ef8i+rv5ytOtPyKtAOZAjCGDCigtOImc
	YFX+khn53aZ0EXwKOjX2syXEq+QoemvJqmUsIEm7Dcnzoh1oHpNjw8Yvrer6ez8siW0W11Pz/tQtO
	kKb7lstbVdLVP5O0yyLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWv9f-0000000829d-19LG;
	Wed, 02 Jul 2025 10:57:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWuRQ-00000007uOB-4B4f
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 10:11:50 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a365a6804eso3552985f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751451107; x=1752055907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EXIKYt3Y003wfDpZ6+F8d2uM2XWqrreiBlGE5vL5FA=;
        b=Xh+oEonRGxk3PbgPWPXmxK5OiDZtve5TO0LjrkSTSJnlnVeitoNZXIe0q8iZfh/Y4a
         rGTTWhPq9mMO9Q17zqZYro1mODcsdLL9cFp7zY8HrnlqHz7hLZ1bq395DhUejii5iRZJ
         DaBIL7DNsSzsH2IKjCBmp8nHADf14L5cZD2hFIEs41XNtd3msVIQnvIAcvqRUFhUossH
         W9q6k6SE9RU5EEhxZgXSi0uFrTzw+yUxvCOGLusSsR0OAilLS+5RvVBXHI7jj0rLlrPO
         VVKlJAtxMtGgsy4gfcKInkUrDp/BWmSJgljTMdqVcTa5XD4VZZ5OinDlFkGLOBtaBdDR
         edRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451107; x=1752055907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EXIKYt3Y003wfDpZ6+F8d2uM2XWqrreiBlGE5vL5FA=;
        b=Ez//GdPvB9YsTK8CmStyz5yF53WGoTjp9UyAORM9Wp8wzhEtjdjwq2Yv+ZkMs/e8KG
         eHEX+a9Awxm/Lseow7xt5u9VFzyMPHkqmMcwB6ahUK5yd+zuEuQuY7u3+e/UAw6OCmUC
         I8dtYvaeP+ZrmqnOApJff9G5k43pERbOvL8tlv3Csavm25YsgImLvIVxzuw6tqIj36Yr
         PBcAhxKXz3LfwPi9jcNzubNO0Ilgxggm89ZGRnuY2amfvq+O1UHzGx80gZrDQlRPHv6+
         wiGIOVE/+s6oZEh28HTY0ni8IYtLh5jS7xvinHJ/J2ji7qpmtEMa4wfd80abaY+s9EfN
         SEAg==
X-Forwarded-Encrypted: i=1; AJvYcCUvjdjIRcBGlfXNcl0gcrua1fXq20Rewn0c8I7/NIsHqtscSW7oCXC1sxL/2UunXK5T/OOwJtrqQftFpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwT2HtedZn+nz+Qm8cTV+AOVc2/fcst12eGqe9iL02GP+g7tNzN
	ePGEtk6MvWPKctEEeAj+Xmr4pn2BVjdup8zyr1YvxstUipp7sG9TMUYr
X-Gm-Gg: ASbGncsQgcExrTEEmbF/p9jhabYWteBONWqdSBwwQO816VBwJtn+OuBOlrkDmqVsgeh
	5EOnq0NrQ4bxF6TZlyeFkemtaPAxh1vZKPHupXSmgqYO/HzMAxrx5aF8HkCgwD7jFIehYWf5WGm
	vFHj74+7CWfddO8ls3WmLF1uGok9oZnaBsPPRsuFEBP+MsfMttPpq/1jBFqy0J2blk6vWdz83nL
	RrZomdmH9SAn/YLdnOsEYORNuikB7cbvwlQndShO9aa6OBbG7GQ+qajGoWYCmpxzh3btTYh2aOv
	NOvT8rez1aIubSxkZHfV5JsbsLnymFUS05RM7dmPNC0JLio64JF5w0bO8CHDwH2xKgRaJrMGqvv
	g5Eo3RuYmQSki97kRMA==
X-Google-Smtp-Source: AGHT+IE5o/lCRhHaBkNRDZxdR5z+1LVjickMfAb9sK5WBxxBVNG0nGn1OFJE4sJnm4XT7L9Mxa4FVw==
X-Received: by 2002:a05:6000:41dc:b0:3a4:e387:c0bb with SMTP id ffacd0b85a97d-3b2012f7f91mr1677072f8f.59.1751451106691;
        Wed, 02 Jul 2025 03:11:46 -0700 (PDT)
Received: from pumpkin (host-92-21-58-28.as13285.net. [92.21.58.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a407743sm192874035e9.33.2025.07.02.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:11:46 -0700 (PDT)
Date: Wed, 2 Jul 2025 11:11:35 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: cp0613@linux.alibaba.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
 arnd@arndb.de, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux@rasmusvillemoes.dk,
 palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb
 extension
Message-ID: <20250702111135.37854d1b@pumpkin>
In-Reply-To: <aGQprv3HTplw9r-q@yury>
References: <aGLA78usaJOnpols@yury>
	<20250701124737.687-1-cp0613@linux.alibaba.com>
	<aGQprv3HTplw9r-q@yury>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_031149_037512_B637D520 
X-CRM114-Status: GOOD (  39.75  )
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

T24gVHVlLCAxIEp1bCAyMDI1IDE0OjMyOjE0IC0wNDAwCll1cnkgTm9yb3YgPHl1cnkubm9yb3ZA
Z21haWwuY29tPiB3cm90ZToKCj4gT24gVHVlLCBKdWwgMDEsIDIwMjUgYXQgMDg6NDc6MDFQTSAr
MDgwMCwgY3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tIHdyb3RlOgo+ID4gT24gTW9uLCAzMCBKdW4g
MjAyNSAxMjo1MzowMyAtMDQwMCwgeXVyeS5ub3JvdkBnbWFpbC5jb20gd3JvdGU6Cj4gPiAgIAo+
ID4gPiA+ID4gMS4gVGhlIG1vc3QgdHJpdmlhbCBjb21waWxlLWNhc2UgaXMgYWN0dWFsbHkgZXZh
bHVhdGVkIGF0IGNvbXBpbGUgdGltZTsgYW5kCj4gPiA+ID4gPiAyLiBBbnkgYXJjaC1zcGVjaWZp
YyBjb2RlIGlzIHdlbGwgZXhwbGFpbmVkOyBhbmQKPiA+ID4gPiA+IDMuIGxlZ2FjeSBjYXNlIG9w
dGltaXplZCBqdXN0IGFzIHdlbGwgYXMgbm9uLWxlZ2FjeS4gIAo+ID4gPiA+IAo+ID4gPiA+IDEu
IEFzIGluIHRoZSBhYm92ZSByZXBseSwgdXNlIHRoZSBnZW5lcmljIGltcGxlbWVudGF0aW9uIHdo
ZW4gY29tcGlsZS10aW1lIGV2YWx1YXRpb24KPiA+ID4gPiAgICBpcyBwb3NzaWJsZeOAggo+ID4g
PiA+IDIuIEkgd2lsbCBpbXByb3ZlIHRoZSBjb21tZW50cyBsYXRlci4gIAo+ID4gPiAKPiA+ID4g
SSdtIHBhcnRpY3VsYXJseSBpbnRlcmVzdGVkIGluIHJvcjgvcm9sOCBjYXNlOgo+ID4gPiAKPiA+
ID4gICAgICAgICB1MzIgd29yZDMyID0gKCh1MzIpd29yZCA8PCAyNCkgfCAoKHUzMil3b3JkIDw8
IDE2KSB8ICgodTMyKXdvcmQgPDwgOCkgfCB3b3JkOwo+ID4gPiAKPiA+ID4gV2hlbiB5b3UgZXhw
YW5kIGl0IHRvIDMyLWJpdCB3b3JkLCBhbmQgd2FudCB0byByb3RhdGUsIHlvdSBvYnZpb3VzbHkK
PiA+ID4gbmVlZCB0byBjb3B5IGxvd2VyIHF1YXJ0ZXJ3b3JkIHRvIHRoZSBoaWdoZXIgb25lOgo+
ID4gPiAKPiA+ID4gICAgICAgICAweGFiID4+IDB4YWIwMDAwYWIKPiA+ID4gCj4gPiA+IFRoYXQg
d2F5IGdlbmVyaWMgKHU4KXJvcjMyKDB4YWIsIHNoaWZ0KSB3b3VsZCB3b3JrLiBCdXQgSSBkb24n
dCB1bmRlcnN0YW5kCj4gPiA+IHdoeSB5b3UgY29weSB0aGUgbG93ZXIgOCBiaXRzIHRvIGlubmVy
IHF1YXJ0ZXJ3b3Jkcy4gSXMgdGhhdCBhIGhhcmR3YXJlCj4gPiA+IHJlcXVpcmVtZW50PyBDYW4g
eW91IHBvaW50IHRvIGFueSBhcmNoIGRvY3VtZW50YXRpb24gCj4gPiA+ICAgCj4gPiA+ID4gMy4g
QXMgbWVudGlvbmVkIGJlZm9yZSwgb25seSA4LWJpdCByb3RhdGlvbiBzaG91bGQgaGF2ZSBubyBv
cHRpbWl6YXRpb24gZWZmZWN0LCBhbmQKPiA+ID4gPiAgICAxNi1iaXQgYW5kIGFib3ZlIHdpbGwg
aGF2ZSBzaWduaWZpY2FudCBvcHRpbWl6YXRpb24uICAKPiA+ID4gCj4gPiA+IEkgYXNrZWQgeW91
IGFib3V0IHRoZSBhc20gZ290byAoImxlZ2FjeSIpIHRoaW5nOiB5b3UgY2FsY3VsYXRlIHRoYXQK
PiA+ID4gY29tcGxleCB3b3JkMzIgX2JlZm9yZV8gZXZhbHVhdGluZyB0aGUgZ290by4gU28gdGhp
cyB3b3JkMzIgbWF5IGdldAo+ID4gPiB1bnVzZWQsIGFuZCB5b3Ugd2FzdGUgY3ljbGVzLiBJIHdh
bnQgdG8gbWFrZSBzdXJlIHRoaXMgaXNuJ3QgdGhlIGNhc2UuICAKPiA+IAo+ID4gVGhhbmsgeW91
IGZvciB5b3VyIHN1Z2dlc3Rpb24gYW5kIHJlbWluZGVyLiBUaGlzIGlzIG5vdCBhIGhhcmR3YXJl
IHJlcXVpcmVtZW50LCBidXQgaXQgIAo+IAo+IFN1cmUuIFBsZWFzZSBhZGQKPiAKPiBTdWdnZXN0
ZWQtYnk6IFl1cnkgTm9yb3YgKE5WSURJQSkgPHl1cnkubm9yb3ZAZ21haWwuY29tPgo+IAo+ID4g
aXMgc29tZXdoYXQgcmVsYXRlZCBiZWNhdXNlIHRoZSB6YmIgaW5zdHJ1Y3Rpb24gb25seSBzdXBw
b3J0cyB3b3JkLXNpemVkIHJvdGF0ZSBbMV0uCj4gPiBDb25zaWRlcmluZyB0aGUgY2FzZSB3aGVy
ZSB0aGUgc2hpZnQgaXMgZ3JlYXRlciB0aGFuIDgsIGlmIHRoZSBtb2R1bHVzIG9mIHRoZSBzaGlm
dCBpcwo+ID4gbm90IHRha2VuLCBpdCBpcyByZXF1aXJlZCB0byBjb250aW51b3VzbHkgY29uY2F0
ZW5hdGUgOC1iaXQgZGF0YSBpbnRvIDMyIGJpdHMuCgpJJ2Qgbm90IHdvcnJ5IGFib3V0IHJvdGF0
ZXMgb2YgOCBiaXRzIG9yIG1vcmUgKGZvciByb3I4KS4KVGhleSBjYW4gYmUgdHJlYXRlZCBhcyAn
dW5kZWZpbmVkIGJlaGF2aW91cicgdW5kZXIgdGhlIGFzc3VtcHRpb24gdGhleSBkb24ndCBoYXBw
ZW4uClRoZSAnZ2VuZXJpYycgdmVyc2lvbiBuZWVkcyB0aGVtIHRvIGdldCBnY2MgdG8gZ2VuZXJh
dGUgYSAncm9yYicgb24geDg2LgpUaGUgbmVnYXRlZCBzaGlmdCBuZWVkcyBtYXNraW5nIHNvIHRo
YXQgY2xhbmcgZG9lc24ndCB0aHJvdyB0aGUgY29kZSBhd2F5IHdoZW4KdGhlIHZhbHVlIGlzIGNv
bnN0YW50LgoKPiA+IAo+ID4gU28sIEkgY29uc2lkZXJlZCB0aGUgY2FzZSBvZiB0YWtpbmcgdGhl
IHJlbWFpbmRlciBvZiBzaGlmdCBhbmQgZm91bmQgdGhhdCB0aGlzCj4gPiBpbXBsZW1lbnRhdGlv
biB3b3VsZCBoYXZlIG9uZSBsZXNzIGluc3RydWN0aW9uLCBzbyB0aGUgZmluYWwgaW1wbGVtZW50
YXRpb24gaXMgYXMgZm9sbG93czoKPiA+IGBgYAo+ID4gc3RhdGljIGlubGluZSB1OCB2YXJpYWJs
ZV9yb2w4KHU4IHdvcmQsIHVuc2lnbmVkIGludCBzaGlmdCkgIAo+IAo+IE5vdyB0aGF0IGl0IGhh
cyBhc3NlbWJsZXIgaW5saW5lcywgd291bGQgaXQgaGVscCB0byBhZGQgdGhlIF9fcHVyZQo+IHF1
YWxpZmllcj8KPiAKPiA+IHsKPiA+IAl1MzIgd29yZDMyOwo+ID4gCj4gPiAJYXNtIGdvdG8oQUxU
RVJOQVRJVkUoImogJWxbbGVnYWN5XSIsICJub3AiLCAwLAo+ID4gCQkJCSAgICAgIFJJU0NWX0lT
QV9FWFRfWkJCLCAxKQo+ID4gCQkJICA6IDogOiA6IGxlZ2FjeSk7Cj4gPiAKPiA+IAl3b3JkMzIg
PSAoKHUzMil3b3JkIDw8IDI0KSB8IHdvcmQ7Cj4gPiAJc2hpZnQgPSBzaGlmdCAlIDg7ICAKPiAK
PiAgICAgICAgIHNoaWZ0ICU9IDg7Cj4gCj4gPiAKPiA+IAlhc20gdm9sYXRpbGUoCj4gPiAJCSIu
b3B0aW9uIHB1c2hcbiIKPiA+IAkJIi5vcHRpb24gYXJjaCwremJiXG4iCj4gPiAJCSJyb2x3ICUw
LCAlMSwgJTJcbiIKPiA+IAkJIi5vcHRpb24gcG9wXG4iCj4gPiAJCTogIj1yIiAod29yZDMyKSA6
ICJyIiAod29yZDMyKSwgInIiIChzaGlmdCkgOik7Cj4gPiAKPiA+IAlyZXR1cm4gKHU4KXdvcmQz
MjsKPiA+IAo+ID4gbGVnYWN5Ogo+ID4gCXJldHVybiBnZW5lcmljX3JvbDgod29yZCwgc2hpZnQp
Owo+ID4gfQo+ID4gCj4gPiBzdGF0aWMgaW5saW5lIHU4IHZhcmlhYmxlX3JvcjgodTggd29yZCwg
dW5zaWduZWQgaW50IHNoaWZ0KQo+ID4gewo+ID4gCXUzMiB3b3JkMzI7Cj4gPiAKPiA+IAlhc20g
Z290byhBTFRFUk5BVElWRSgiaiAlbFtsZWdhY3ldIiwgIm5vcCIsIDAsCj4gPiAJCQkJICAgICAg
UklTQ1ZfSVNBX0VYVF9aQkIsIDEpCj4gPiAJCQkgIDogOiA6IDogbGVnYWN5KTsKPiA+IAo+ID4g
CXdvcmQzMiA9ICgodTMyKXdvcmQgPDwgOCkgfCB3b3JkOwo+ID4gCXNoaWZ0ID0gc2hpZnQgJSA4
Owo+ID4gCj4gPiAJYXNtIHZvbGF0aWxlKAo+ID4gCQkiLm9wdGlvbiBwdXNoXG4iCj4gPiAJCSIu
b3B0aW9uIGFyY2gsK3piYlxuIgo+ID4gCQkicm9ydyAlMCwgJTEsICUyXG4iCj4gPiAJCSIub3B0
aW9uIHBvcFxuIgo+ID4gCQk6ICI9ciIgKHdvcmQzMikgOiAiciIgKHdvcmQzMiksICJyIiAoc2hp
ZnQpIDopOwo+ID4gCj4gPiAJcmV0dXJuICh1OCl3b3JkMzI7Cj4gPiAKPiA+IGxlZ2FjeToKPiA+
IAlyZXR1cm4gZ2VuZXJpY19yb3I4KHdvcmQsIHNoaWZ0KTsKPiA+IH0KPiA+IGBgYCAgCj4gCj4g
T0ssIHRoaXMgbG9va3MgYmV0dGVyLgo+IAo+ID4gSSBjb21wYXJlZCB0aGUgcGVyZm9ybWFuY2Ug
b2Ygcm9yOCAoemJiIG9wdGltaXplZCkgYW5kIGdlbmVyaWNfcm9yOCBvbiB0aGUgWFVBTlRJRSBD
OTA4Cj4gPiBieSBsb29waW5nIHRoZW0uIHJvcjggaXMgYmV0dGVyLCBhbmQgdGhlIGFkdmFudGFn
ZSBvZiByb3I4IGJlY29tZXMgbW9yZSBvYnZpb3VzIGFzIHRoZQo+ID4gbnVtYmVyIG9mIGl0ZXJh
dGlvbnMgaW5jcmVhc2VzLiBUaGUgdGVzdCBjb2RlIGlzIGFzIGZvbGxvd3M6Cj4gPiBgYGAKPiA+
IAl1OCB3b3JkID0gMHg1YTsKPiA+IAl1MzIgc2hpZnQgPSA5Owo+ID4gCXUzMiBpLCBsb29wID0g
MTAwOwo+ID4gCXU4IHJldDEsIHJldDI7Cj4gPiAKPiA+IAl1NjQgdDEgPSBrdGltZV9nZXRfbnMo
KTsKPiA+IAlmb3IgKGkgPSAwOyBpIDwgbG9vcDsgaSsrKSB7Cj4gPiAJCXJldDIgPSBnZW5lcmlj
X3Jvcjgod29yZCwgc2hpZnQpOwo+ID4gCX0KPiA+IAl1NjQgdDIgPSBrdGltZV9nZXRfbnMoKTsK
PiA+IAlmb3IgKGkgPSAwOyBpIDwgbG9vcDsgaSsrKSB7Cj4gPiAJCXJldDEgPSByb3I4KHdvcmQs
IHNoaWZ0KTsKPiA+IAl9Cj4gPiAJdTY0IHQzID0ga3RpbWVfZ2V0X25zKCk7Cj4gPiAKPiA+IAlw
cl9pbmZvKCJ0Mi10MT0lbGxkIHQzLXQyPSVsbGRcbiIsIHQyIC0gdDEsIHQzIC0gdDIpOwo+ID4g
YGBgICAKPiAKPiBQbGVhc2UgZG8gdGhlIGZvbGxvd2luZzoKPiAKPiAxLiBEcm9wIHRoZSBnZW5l
cmljX3JvcjgoKSBhbmQga2VlcCBvbmx5IHJvci9sOCgpCj4gMi4gQWRkIHJvci9sMTYsIDM0IGFu
ZCA2NCB0ZXN0cy4KPiAzLiBBZGp1c3QgdGhlICdsb29wJyBzbyB0aGF0IGVhY2ggc3VidGVzdCB3
aWxsIHRha2UgMS0xMCBtcyBvbiB5b3VyIGh3LgoKVGhhdCBpcyBmYXIgdG9vIG1hbnkgaXRlcmF0
aW9ucy4KWW91J2xsIGdldCBpbnRlcnJ1cHRzIGRvbWluYXRpbmcgdGhlIHRlc3RzLgpUaGUgYmVz
dCB0aGluZyBpcyB0byBkbyAnanVzdCBlbm91Z2gnIGl0ZXJhdGlvbnMgdG8gZ2V0IGEgbWVhbmlu
Z2Z1bCByZXN1bHQsCmFuZCB0aGVuIHJlcGVhdCBhIGZldyB0aW1lcyBhbmQgcmVwb3J0IHRoZSBm
YXN0ZXN0IChvciBhdmVyYWdlIGV4Y2x1ZGluZwphbnkgbGFyZ2Ugb3V0bGllcnMpLgoKWW91IGFs
c28gbmVlZCB0byBlbnN1cmUgdGhlIGNvbXBpbGVyIGRvZXNuJ3QgKG9yIGlzbid0IGFsbG93ZWQg
dG8pIHB1bGwKdGhlIGNvbnRlbnRzIG9mIHRoZSBpbmxpbmVkIGZ1bmN0aW9uIG91dHNpZGUgdGhl
IGxvb3AgLSBhbmQgdGhlbiB0aHJvdwp0aGUgbG9vcCBhd2F5LAoKVGhlIG90aGVyIHF1ZXN0aW9u
IGlzIHdoZXRoZXIgYW55IG9mIGl0IGlzIHdvcnRoIHRoZSBlZmZvcnQuCkhvdyBtYW55IHJvcjgo
KSBhbmQgcm9yMTYoKSBjYWxscyBhcmUgdGhlcmU/Ckkgc3VzcGVjdCBub3QgbWFueS4KCkltcHJv
dmluZyB0aGUgZ2VuZXJpYyBvbmVzIG1pZ2h0IGJlIHdvcnRoIHdoaWxlLgpQZXJoYXBzIG1vdmlu
ZyB0aGUgY3VycmVudCB2ZXJzaW9ucyB0byB4ODYgb25seS4KKEkgc3VzcGVjdCB0aGUgb25seSBv
dGhlciBjcHUgd2l0aCBieXRlL3Nob3J0IHJvdGF0ZXMgaXMgbTY4aykKCglEYXZpZAoKCgo+IDQu
IE5hbWUgdGhlIGZ1bmN0aW9uIGxpa2UgdGVzdF9yb3JsKCksIGFuZCBwdXQgaXQgbmV4dCB0byB0
aGUgdGVzdF9mbnMoKQo+ICAgIGluIGxpYi90ZXN0X2JpdG9wcy5jLiBSZWZlciB0aGUgMGEyYzY2
NjRlNTZmMCBmb3IgaW1wbGVtZW50YXRpb24uCj4gNS4gUHJlcGVuZCB0aGUgc2VyaWVzIHdpdGgg
dGhlIGJlbmNobWFyayBwYXRjaCwganVzdCBhcyB3aXRoIGNvbnN0LWV2YWwKPiAgICBvbmUsIGFu
ZCByZXBvcnQgYmVmb3JlL2FmdGVyIGZvciB5b3VyIHNlcmllcy4gCj4gCj4gPiA+IFBsZWFzZSBm
aW5kIGF0dGFjaGVkIGEgdGVzdCBmb3IgY29tcGlsZS10aW1lIHJvci9yb2wgZXZhbHVhdGlvbi4K
PiA+ID4gUGxlYXNlIGNvbnNpZGVyIHByZXBlbmRpbmcgeW91ciBzZXJpZXMgd2l0aCBpdC4gIAo+
ID4gCj4gPiBPa2F5LCBJJ2xsIGJyaW5nIGl0IHRvIHRoZSBuZXh0IHNlcmllcy4gIAo+IAo+IFN0
aWxsIHdhaXRpbmcgZm9yIGJsb2F0LW8tbWV0ZXIgcmVzdWx0cy4KPiAKPiBUaGFua3MsCj4gWXVy
eQo+IAo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWJpdG1hbmlw
ICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
