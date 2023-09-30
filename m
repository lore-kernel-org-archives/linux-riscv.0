Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504DEE748E6
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 21:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKS5wQhfg8c8DDdwmTI1H9frGZ0MxErJ0QLmgTvkL7g=; b=OGd+icUZtTCgTv
	lYqsI/YtpLsi1b/tDhCbhh8LeuOcsdCheW843gx+eVhMYGSngONCO/YW+I6nnYQMbkdP4hesUHbXt
	WCObwW/LEbDZv/Qx6XPpZHyI41Rr4QxbmiNhzyYqUU2bZt1tzpT3UE1zif6/6+QOzvUTIVIe6aufJ
	y9SzEKTTEE4qHZORHaq2lEjdpmTra9sOlbkNnIpyKqNQkmuzdElYKTHO8PkKjINgLLborhgJml4mQ
	ZfTrc2DBH61h7SP8MtVf2NnyesPFL916NA2Qc7TrwdAollX6axC+PWmxMpHOtMOyM7CfU4WuBeF5C
	oOy3ETyPCY1OrGTRtVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmh5T-00A7UF-1G;
	Sat, 30 Sep 2023 21:01:19 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmh5Q-00A7Tt-07
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 21:01:17 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6c4d625da40so7640111a34.1
        for <linux-riscv@lists.infradead.org>; Sat, 30 Sep 2023 14:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696107674; x=1696712474; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=27IFQu1p2zMt99rhR1KNh/9hYoodXsLNJNCuaLad3CU=;
        b=EALxhwH07Q3Utifmr3LdmiM5bx9BEcfqnMfQ/ffG996sKoqJrSTD31uU+8bAZn1hY9
         9qgUZJnxMxYrYsOUeRh7aKzz49wFA1PD3wDtzFqR4PaJLjOPBGiHNjRUNGmdl16R44sS
         SO2m+c/3kJAVzfpH12O+zlaBljCFxpTIa3Tgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696107674; x=1696712474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27IFQu1p2zMt99rhR1KNh/9hYoodXsLNJNCuaLad3CU=;
        b=TuhNn995C4duDNGUUxpQpQgr2roKHcsNgx+RbiyHdyvjlU6EGqlgq2WTyMQ8NyOTk5
         QyqlcGzwND9jQVhP9kz4dlLZKeDtZSL8eB+5IoFQo0IP84hAhQMWCfeOIt/pIeExFgSX
         aqKiU9OvARap1pu6rcQZbcYN9zHzOAnB0c4mZAaKnQhjqcl8NK2yHK0j6H7PZ2rRtPsR
         IhK/8Qkag3B5oiU4ERKcLVJXaGVGzGfmNw+87op07jC13rI522PdQpt4wZ0dPcMEK2iR
         ORc2tPu/Q2BpaI/1f2wZQrnm3mZEgr44kB5OEHt0QU/CvVsqgG9d5pxtgtpcCPEVbRpx
         vn7Q==
X-Gm-Message-State: AOJu0Yz5LLeaT6rBLOZ1RmYtzz27n/YRaQ7R1t/hoUZtkvaj5V1HBPyP
	kLGiwvirZ9Pw2JfO2qNCiaw30Q==
X-Google-Smtp-Source: AGHT+IFeOcxaHIbtr3OOPjBvPc8vpAIKWTbtjxf4uBFCfxJieFURN+yasje/os/U6MRlxkFgpLgoBg==
X-Received: by 2002:a05:6830:2091:b0:6c4:c607:7346 with SMTP id y17-20020a056830209100b006c4c6077346mr8189210otq.23.1696107674143;
        Sat, 30 Sep 2023 14:01:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ey1-20020a056a0038c100b0068a13b0b300sm17483758pfb.11.2023.09.30.14.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 14:01:13 -0700 (PDT)
Date: Sat, 30 Sep 2023 14:01:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Conor Dooley <conor@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
Message-ID: <202309301400.4E1AD87@keescook>
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com>
 <202309291452.66ED9B4D83@keescook>
 <CABCJKufxUVoO+yJ+513W5FOFu6u45N=6wZe6a69u+8LU6A_N2Q@mail.gmail.com>
 <20230930-emporium-share-2bbdf7074e54@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930-emporium-share-2bbdf7074e54@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_140116_080787_EA21E27B 
X-CRM114-Status: GOOD (  20.18  )
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

T24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMTA6MDI6MzVBTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIEZyaSwgU2VwIDI5LCAyMDIzIGF0IDAzOjUyOjIyUE0gLTA3MDAsIFNhbWkgVG9s
dmFuZW4gd3JvdGU6Cj4gPiBPbiBGcmksIFNlcCAyOSwgMjAyMyBhdCAyOjU04oCvUE0gS2VlcyBD
b29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIFNl
cCAyOSwgMjAyMyBhdCAwOToxMTo1OFBNICswMDAwLCBTYW1pIFRvbHZhbmVuIHdyb3RlOgo+ID4g
PiA+IEFSQ0hfTU1BUF9STkRfQklUU19NQVggaXMgYmFzZWQgb24gU3YzOSwgd2hpY2ggbGVhdmVz
IGEgZmV3Cj4gPiA+ID4gcG90ZW50aWFsIGJpdHMgb2YgbW1hcCByYW5kb21uZXNzIG9uIHRoZSB0
YWJsZSBpZiB3ZSBlbmQgdXAgZW5hYmxpbmcKPiA+ID4gPiA0LzUtbGV2ZWwgcGFnaW5nLiBVcGRh
dGUgbW1hcF9ybmRfYml0c19tYXggdG8gdGFrZSB0aGUgZmluYWwgYWRkcmVzcwo+ID4gPiA+IHNw
YWNlIHNpemUgaW50byBhY2NvdW50LiBUaGlzIGluY3JlYXNlcyBtbWFwX3JuZF9iaXRzX21heCBm
cm9tIDI0IHRvCj4gPiA+ID4gMzMgd2l0aCBTdjQ4LzU3Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZhbmVuQGdvb2dsZS5jb20+Cj4gPiA+Cj4g
PiA+IEkgbGlrZSB0aGlzLiBJcyBSSVNDViB0aGUgb25seSBhcmNoIHdoZXJlIHRoZSBwYWdpbmcg
bGV2ZWwgY2FuIGJlIGNob3Nlbgo+ID4gPiBhdCBib290IHRpbWU/Cj4gPiAKPiA+IEkgaGF2ZW4n
dCBzZWVuIHRoaXMgZWxzZXdoZXJlLCBidXQgSSBhbHNvIGhhdmVuJ3QgbG9va2VkIGF0IGFsbCB0
aGUKPiA+IG90aGVyIGFyY2hpdGVjdHVyZXMgdGhhdCBjbG9zZWx5LiBhcm02NCBkb2VzIHNvbWV0
aGluZyBpbnRlcmVzdGluZwo+ID4gd2l0aCBBUk02NF9WQV9CSVRTXzUyLCBidXQgSSB0aGluayB3
ZSBjYW4gc3RpbGwgaGFuZGxlIHRoYXQgaW4KPiA+IEtjb25maWcuCj4gCj4gQUZBSVUsIHg4Ni02
NCBjYW4gZG8gdGhpcyBhbHNvOgo+IAo+IAlubzRsdmwJCVtSSVNDVl0gRGlzYWJsZSA0LWxldmVs
IGFuZCA1LWxldmVsIHBhZ2luZyBtb2Rlcy4gRm9yY2VzCj4gCQkJa2VybmVsIHRvIHVzZSAzLWxl
dmVsIHBhZ2luZyBpbnN0ZWFkLgo+IAo+IAlubzVsdmwJCVtYODYtNjQsUklTQ1ZdIERpc2FibGUg
NS1sZXZlbCBwYWdpbmcgbW9kZS4gRm9yY2VzCj4gCQkJa2VybmVsIHRvIHVzZSA0LWxldmVsIHBh
Z2luZyBpbnN0ZWFkLgoKQWgtaGEhIE9rYXksIHdlbGwsIHRoZW4gbGV0J3MgdHJhY2sgdGhpcyBp
ZGVhOgpodHRwczovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvMzQ2CgoKLS0gCktlZXMg
Q29vawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
