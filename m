Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CDCC02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 21:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IE/wvHR0qa80eYcrk/dulB1RiC006hr7zt8SJHYyC0=; b=sfaNuzlPI81tgt
	DYRdSwQnf5RV2Q6SZYWPJQanFWlsEV4Hzmb388rT2NKCzdywuFqR9eG3Erm9820MYHb1XhvIgPuYg
	XFfwBQX2IShVd/TPMcpVgVO+6OW8svPyng6MjM5sBupmJ4PIbyyz4alSmh0Fo2jQlYB/c2E7lmhix
	V9tmURMDdh3aXJYxP8Y0viaGJmi6eFxDaCJLLuFUcq9hxdmXAvG4lyj8d0JQjVM0I3mnoAf9OllU4
	cf034+jxAFNRUkeJoBHfV2IK1+zn+3RtQmI6ziGMEL2wE4JLkYv9cXszxHr4ZoOqgFpGgOTpUQCjt
	0ljioNXrj7xym010IJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3wS-0000000Gegn-3nRD;
	Mon, 03 Feb 2025 21:25:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3wP-0000000Geg0-45zH
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 21:25:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so49162505e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 13:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738617912; x=1739222712; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbKbU/bqlOpQtMaXcZ1AxNL8WEdNxKO/z7RXdei3kBA=;
        b=PjjaWp6NeZIdtclJGrdluJsfLqV+e7T8k1y64524NxlXDM72PXh+YksnLTaPSWqOwF
         cjem3cQG9uDQKRUaW5IJmSAkogTFN+GX3ygHAkA5Uvdh7eafsHjpnPWO+IHHYGOv/pd5
         33OYcoAn5hrf9DCIiListXucg1mv8EF1aeoj1KwRs6y4l+cFXwkv/HYgcsu/nQhCUgio
         EG74vt3b/HRjrHb/+Yv7c3AqBXHYnAw8WiSmgQH6eNOE06Z/KXaDCtk7OeXKO5rleXFM
         e2Gb93levJYEGBAB5WzAtc0ofK7Phuu3pRlrnpEfJk8diN6pP1aCN3Lp3cevuxR9pk8X
         unhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738617912; x=1739222712;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbKbU/bqlOpQtMaXcZ1AxNL8WEdNxKO/z7RXdei3kBA=;
        b=YhMEjfNTwPHTh745PeSyJQiswlowfIzjy4+yExQqD0g1rjWQa/036hUuLimQKGTeHK
         80LvLgomS6x+WFsLE0PJcYGQtF0rdsbVgbRTR2l9ks573Qew8D2GAhFHz6h6broZ6xIE
         vL/SraO3RJDRUPuGq2qYUpNck6NZpUluMkrkyUXWW+mRgEymsvnrVZsIeNn+pDD85il4
         0UGlANVGRzWgv1FXJ8hm3bhkiIBXKKixdgAc0Sr7JkXsAYCu4Hmyvje5yXrAfjD5W6+x
         auujZHCmwXZmMxx0LWSIrShd4y0Rd6f1K+Ddu/n42sL+vDiSt56pFgFNHlWOhHgD02Y4
         mBOA==
X-Gm-Message-State: AOJu0YwbrwsugIPQqQHh0WwarifUhviLTMbymmvXnJk1qYJhylaw71KK
	yKz8v5oflySMjDMQUDUbqaY/o+l+cNNFY55Y3EI5GlnZipONy1z7oIF4xc7C2COCkcslILgpCzj
	i
X-Gm-Gg: ASbGncv7v2t6kiP9vwHcIlXijGns73vM3bzkaDhOAcNjboUgXxcpqJhcG3ySvcFaXcM
	YOTnrBps99fdoK5p8q2N/6CcaZDb2F+ouMn/Hoe2Wo8kRVTalQPvpjFAdKqh+U4jqKDtBpyYTUf
	ghoKsCH/+ejsgRsYpxvKEZ9UMqLVqJ21caZg1pqybeLPkU2YK6FuM4F0mNxusOe+nOM1EbpU9Y3
	wv+YSvXUD3qfDGJ14tBL8y/br1YUKkDnR6v9BxFw6hr8I5s739pKWCzvaggro4s+RfnmlKPTsQq
	7s+LXAcJ49ttK10rBbJBUctNPawU
X-Google-Smtp-Source: AGHT+IELM/Kalt3oJfQk1rk/oSLFELbF/EGfEM6vZ+8Wv94UQU4wednyhkpRtjOQFeZ0eXJ+Qn77sA==
X-Received: by 2002:a05:6000:1562:b0:385:df73:2f18 with SMTP id ffacd0b85a97d-38c520bc36amr22323581f8f.51.1738617912049;
        Mon, 03 Feb 2025 13:25:12 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f73asm204475025e9.24.2025.02.03.13.25.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2025 13:25:10 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <mvmfrkv2vhz.fsf@suse.de>
Date: Mon, 3 Feb 2025 21:25:00 +0000
Cc: linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <A31D967F-B057-4C6D-B403-B4FB3973F185@jrtc27.com>
References: <mvmfrkv2vhz.fsf@suse.de>
To: Andreas Schwab <schwab@suse.de>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_132514_015400_10D001E4 
X-CRM114-Status: GOOD (  17.76  )
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

T24gMyBGZWIgMjAyNSwgYXQgMTA6MDYsIEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAc3VzZS5kZT4g
d3JvdGU6Cj4gCj4gTWFrZSBzdXJlIHRoZSBjb21wYXJlIHZhbHVlIGluIHRoZSBsci9zYyBsb29w
IGlzIHNpZ24gZXh0ZW5kZWQgdG8gbWF0Y2gKPiB3aGF0IGxyLncgZG9lcy4gIEZvcnR1bmF0ZWx5
LCBkdWUgdG8gdGhlIGNvbXBpbGVyIGtlZXBpbmcgdGhlIHJlZ2lzdGVyCj4gY29udGVudHMgc2ln
biBleHRlbmRlZCBhbnl3YXkgdGhlIGxhY2sgb2YgdGhlIGV4cGxpY2l0IGV4dGVuc2lvbiBkaWRu
J3QKPiByZXN1bHQgaW4gd3JvbmcgY29kZSBzbyBmYXIsIGJ1dCB0aGlzIGNhbm5vdCBiZSByZWxp
ZWQgdXBvbi4KCkdDQyBtYXkgZ3VhcmFudGVlIHRoaXMgdG9kYXksIGJ1dCBMTFZNIGRvZXMgbm90
LCBhbmQgZGVmaW5pdGVseQpnZW5lcmF0ZXMgY29kZSB0aGF0IGRvZXMgbm90IGRvIHNvLiBXaGV0
aGVyIHRoYXQgaGFwcGVucyBmb3IgYW55IG9mIHRoZQpjb25zdW1lcnMgb2YgdGhpcyBBUEkgdG9k
YXkgSSBkb27igJl0IGtub3csIGJ1dCBpdCBpcyBkZWZpbml0ZWx5IHJlbHlpbmcKb24gdGhpbmdz
IHRoYXQgYXJlbuKAmXQgdHJ1ZSBmb3IgTExWTSwgYW5kIGFyZSBub3Qgc3BlY2lmaWVkIGluIHRo
ZSBwc0FCSS4KCkplc3MKCj4gRml4ZXM6IGI5MGVkYjMzMDEwYiAoIlJJU0MtVjogQWRkIGZ1dGV4
IHN1cHBvcnQuIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1c2Uu
ZGU+Cj4gLS0tCj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdXRleC5oIHwgMiArLQo+IDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z1dGV4LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2Z1dGV4LmgKPiBpbmRleCBmYzgxMzBmOTk1YzEuLjY5MDdjNDU2YWM4YyAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z1dGV4LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Z1dGV4LmgKPiBAQCAtOTMsNyArOTMsNyBAQCBmdXRleF9hdG9taWNfY21weGNoZ19p
bmF0b21pYyh1MzIgKnV2YWwsIHUzMiBfX3VzZXIgKnVhZGRyLAo+IF9BU01fRVhUQUJMRV9VQUND
RVNTX0VSUigxYiwgM2IsICVbcl0pIFwKPiBfQVNNX0VYVEFCTEVfVUFDQ0VTU19FUlIoMmIsIDNi
LCAlW3JdKSBcCj4gOiBbcl0gIityIiAocmV0KSwgW3ZdICI9JnIiICh2YWwpLCBbdV0gIittIiAo
KnVhZGRyKSwgW3RdICI9JnIiICh0bXApCj4gLSA6IFtvdl0gIkpyIiAob2xkdmFsKSwgW252XSAi
SnIiIChuZXd2YWwpCj4gKyA6IFtvdl0gIkpyIiAoKGxvbmcpKGludClvbGR2YWwpLCBbbnZdICJK
ciIgKG5ld3ZhbCkKPiA6ICJtZW1vcnkiKTsKPiBfX2Rpc2FibGVfdXNlcl9hY2Nlc3MoKTsKPiAK
PiAtLSAKPiAyLjQ4LjEKPiAKPiAKPiAtLSAKPiBBbmRyZWFzIFNjaHdhYiwgU1VTRSBMYWJzLCBz
Y2h3YWJAc3VzZS5kZQo+IEdQRyBLZXkgZmluZ2VycHJpbnQgPSAwMTk2IEJBRDggMUNFOSAxOTcw
IEY0QkUgIDE3NDggRTRENCA4OEUzIDBFRUEgQjlENwo+ICJBbmQgbm93IGZvciBzb21ldGhpbmcg
Y29tcGxldGVseSBkaWZmZXJlbnQuIgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
