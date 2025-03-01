Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE51BC021B8
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Mar 2025 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QPx5ez37UspQgCU7UZ0wQm3yP2iEd/GzJnGDZXG658=; b=W7njEN9rZDJpMC
	cwQxMf+hzs1dmEOFtejEKRCqRFsYZ2ikQKfpsZYDvdbcUo0qNVPuHzw0ps3tmNIuRa/L6Mxp4hF9M
	xnah+PWHBzXh1ss8zqyQi7uq3YTGFpsFNXcNBE1feR9trfuHg+8K4YaXQRZOWTzih+JH7IGUFYDUv
	tmnCnh1iNSFvXjJaQjmnME4UzcIldzynlfDGra3DpvVXJZpn9XGHRmun7J/TxGbJrqP63/30Ewqza
	eAdfUtj1/gymLzFbzACDVXDk7yExKo8BEZE1so1VTT5P9C6wO/e2SrfGI+JZTif3kEFeed3NLBFcF
	Ze+wmT6jWprd+wAJVNbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toN5u-0000000EMVn-1SP4;
	Sat, 01 Mar 2025 13:41:30 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toN5r-0000000EMVJ-2zNo
	for linux-riscv@lists.infradead.org;
	Sat, 01 Mar 2025 13:41:29 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso4963285a12.3
        for <linux-riscv@lists.infradead.org>; Sat, 01 Mar 2025 05:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740836486; x=1741441286; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78FXd7H9s7OsBCpwurs18e3LRIW9gE8fGHh/i6qsJMY=;
        b=LxQ79qYdSY9QbRy5QBNULDCZrn3M9jpMpAJxg2S5pSua1xHOvsfNmhHmXwprZ8Mn6k
         XJVeOU/djvtox2SlI0+1Ue7bYZD6HfDwkdGm5jkcrQ7IsrN9oAyj6RpOl60f1OSw+2gc
         RPfjmI/fXyhgWOyqpDoq+O5WZLkplYyy74JhBav+vAdttdercEf24xMJ2Dk0XWzWsamh
         iBedxBmuBa4uk2dpcKJpeReR88S/qX7nnmBEWsCtDtJITiM5Z4rnZCNoAFpfo5gpsgUK
         vpwQlFmGK4hAIyigKmCflu9hK+NzeWN+MrHLt+RIm7nwT7aqwabsbU7hXBqx4zTkj9tq
         rpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740836486; x=1741441286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78FXd7H9s7OsBCpwurs18e3LRIW9gE8fGHh/i6qsJMY=;
        b=rXM3LoH87OUMrLC1BWeYMN1jDtoI2ZtoIYPF2Zegs+NhsB/if4XzrBYasFoyjPQafT
         tafL4QtmJDuq8661mCRtnWwLzXc90gsVbkvmg86/oKSY3CQa3l5tvc6TZJ8GPTNl9wJL
         mvUlezHzFok277e91OFEw5SaFN5+OW2zV8eEoBvXC0qBZ26VVZxX0C/yHmeQBlCpG9ev
         T/2i1lGfeMjEb+sZTzEJN+TqFU3IkHZNU1WFSmbif8SN+37rxuEbeV6CFxp5PV3cr7Vy
         9uzQ9H86xd7e4/sJ81mxnHUuaQiNm+9gKaL2I9r+jHsfkBY7ENWOnlzxpPuUgOxb/mzr
         Ny1g==
X-Forwarded-Encrypted: i=1; AJvYcCU7/ac05rJxqniAHZKTkH/xK/+iviOu2+aM5uN3W2mAURPpw6MitCxAmo5e94IsBlo1V2JEj+cXkg6yvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj6v3Ba2ugOx4dQGLd1JEwjf+uST6wMCvr+L2P1roL1vbeik2t
	vV5xdzVoQcVu02SVJlkO6XJtH3LIs0BAaBEMnsc5N3jAMDOJ6X3pVkWWP0Z5PYWM5ntpW94BwfA
	I2DunTdzDkfW1xAIfqH3iMwrzn6k=
X-Gm-Gg: ASbGncvxgH2YpnFGCGuwDk2LblKQm6821vIyitsydFlSWvO1gymM52tlNJZXTn7OKEi
	qvhuAW0VgSLUnMy5Dx0Ay98gQ8+jMgT+BUtPTC4Cx2l0ZPFz2FGE+M3CXrE5m0HE5zu9O8qBXEG
	0jbjg+hUji1/9ELfwGHbwydzHs19UCYBf4sd3+R6Xg13+psqWOklqZTBlQ
X-Google-Smtp-Source: AGHT+IFLxVwOp5YMLsUkpptEmA0Qd2Flk1VNPL1BruQvXJdV1T6bcBXaIIh31J/l6mfSHIbhS/PJMvsfGdt69/SIBp4=
X-Received: by 2002:a17:907:2d0b:b0:abb:9d27:290f with SMTP id
 a640c23a62f3a-abf25da236emr881207766b.9.1740836485188; Sat, 01 Mar 2025
 05:41:25 -0800 (PST)
MIME-Version: 1.0
References: <20250228-sfg-spi-v2-1-8bbf23b85d0e@gmail.com> <20250228-factual-rage-0e1e1e48b009@spud>
In-Reply-To: <20250228-factual-rage-0e1e1e48b009@spud>
From: damon <sycamoremoon376@gmail.com>
Date: Sat, 1 Mar 2025 21:41:14 +0800
X-Gm-Features: AQ5f1JpwJ3BP_PC0W0ktRvkC8fjTUkMCYP9UPIHRuRuOyqb-ZHyNsvBVo66Lwcc
Message-ID: <CAKyUbwXUPBceR1ArZeLLjs1VNyRW=DngZyLTUCDGPFvT9wKikw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: sophgo: dts: Add spi controller for SG2042
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_054127_755196_14A1BC2C 
X-CRM114-Status: GOOD (  21.69  )
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

T24gMjUvMDIvMjggMDY6MjJQTSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IE9uIEZyaSwgRmViIDI4
LCAyMDI1IGF0IDA4OjQwOjIzUE0gKzA4MDAsIFppeGlhbiBaZW5nIHdyb3RlOgo+ID4gQWRkIHNw
aSBjb250cm9sbGVycyBmb3IgU0cyMDQyLgo+ID4KPiA+IFNHMjA0MiB1c2VzIHRoZSB1cHN0cmVh
bWVkIFN5bm9wc3lzIERXIFNQSSBJUC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaXhpYW4gWmVu
ZyA8c3ljYW1vcmVtb29uMzc2QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gRm9yIHRoaXMgc3BpIGNv
bnRyb2xsZXIgcGF0Y2gsIG9ubHkgYmluZGluZ3MgYXJlIGluY2x1ZGVkLgo+Cj4gXl5eIHlvdSd2
ZSBub3QgYWN0dWFsbHkgaW5jbHVkZWQgYW55IGJpbmRpbmdzIGluIHRoaXMgcGF0Y2gsIGNvcHkt
cGFzdGUKPiBtaXN0YWtlPwo+Ck15IGJhZCwgSSB3YXMgY29uZnVzZWQgYWJvdXQgd2hhdOKAmXMg
dGhlIOKAnGJpbmRpbmfigJ0gbWVhbmluZy4gSSB3aWxsCnJlbW92ZSB0aGlzIGRlc2NyaXB0aW9u
IGluIG5leHQgcmV2aXNpb24uCj4gPiBUaGlzIGlzIHRlc3RlZCBvbiBtaWxrdi1waW9uZWVyIGJv
YXJkLiBVc2luZyBkcml2ZXIvc3BpL3NwaWRldi5jCj4gPiBmb3IgY3JlYXRpbmcgL2Rldi9zcGlk
ZXZYLlkgYW5kIHRvb2xzL3NwaS9zcGlkZXZfdGVzdCBmb3IgdGVzdGluZwo+ID4gZnVuY3Rpb25h
bGl0eS4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2MjoKPiA+IC0gcmViYXNlIHYxIHRvIHNvcGhn
by9tYXN0ZXIoZ2l0aHViLmNvbS9zb3BoZ28vbGludXguZ2l0KS4KPiA+IC0gb3JkZXIgcHJvcGVy
dGllcyBpbiBkZXZpY2Ugbm9kZS4KPiA+IC0gcmVtb3ZlIHVuZXZhbHVhdGVkIHByb3BlcnRpZXMg
YGNsb2NrLWZyZXF1ZW5jeWAuCj4gPiAtIHNldCBkZWZhdWx0IHN0YXR1cyB0byBkaXNhYmxlLgo+
ID4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwMjI4LXNmZy1z
cGktdjEtMS1iOTg5YWVkOTQ5MTFAZ21haWwuY29tCj4gPiAtLS0KPiA+ICAuLi4vcmlzY3YvYm9v
dC9kdHMvc29waGdvL3NnMjA0Mi1taWxrdi1waW9uZWVyLmR0cyB8ICA4ICsrKysrKysKPiA+ICBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaSAgICAgICAgICAgICB8IDI4ICsr
KysrKysrKysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQy
LW1pbGt2LXBpb25lZXIuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1p
bGt2LXBpb25lZXIuZHRzCj4gPiBpbmRleCBiZTU5NmQwMWZmOGQzM2JjZGJlNDMxZDk3MzFhNTVl
ZTE5MGFkNWIzLi5jNDNhODA3YWYyZjgyN2I1MjY3YWZlNWU0ZmRmNmU5ZTg1N2RmYTIwIDEwMDY0
NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25l
ZXIuZHRzCj4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3Yt
cGlvbmVlci5kdHMKPiA+IEBAIC03Miw2ICs3MiwxNCBAQCAmdWFydDAgewo+ID4gICAgIHN0YXR1
cyA9ICJva2F5IjsKPiA+ICB9Owo+ID4KPiA+ICsmc3BpMCB7Cj4gPiArICAgc3RhdHVzID0gIm9r
YXkiOwo+ID4gK307Cj4gPiArCj4gPiArJnNwaTEgewo+ID4gKyAgIHN0YXR1cyA9ICJva2F5IjsK
PiA+ICt9Owo+ID4gKwo+ID4gIC8gewo+ID4gICAgIHRoZXJtYWwtem9uZXMgewo+ID4gICAgICAg
ICAgICAgc29jLXRoZXJtYWwgewo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL3NnMjA0Mi5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0
c2kKPiA+IGluZGV4IGU2MmFjNTFhYzU1YWJkOTIyYjVlZjc5NmJhOGMyMTk2MzgzODUwYzQuLjUw
MDY0NTE0N2IxZjhlZDBhMDhhZDNjYWZiMzhlYTc5Y2Y1N2Q3MzcgMTAwNjQ0Cj4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaQo+ID4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zb3BoZ28vc2cyMDQyLmR0c2kKPiA+IEBAIC01NDUsNSArNTQ1LDMzIEBAIHNk
OiBtbWNANzA0MDAyYjAwMCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
InRpbWVyIjsKPiA+ICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsKPiA+
ICAgICAgICAgICAgIH07Cj4gPiArCj4gPiArICAgICAgICAgICBzcGkwOiBzcGlANzA0MDAwNDAw
MCB7Cj4gPiArICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic25wcyxkdy1hcGItc3Np
IjsKPgo+IEkgdGhvdWdodCB3ZXJlIHdlcmUgZHJvcHBpbmcgdGhlIHVzZSBvZiAic25wcyxkdy1h
YnAtc3NpIiBpbiBpc29sYXRpb24sCj4gYW5kIHN0YXJ0aW5nIHRvIHJlcXVpcmUgc29jLXNwZWNp
ZmljIGNvbXBhdGlibGVzIG5vdy4KPgpUaGF04oCZcyBiZXR0ZXIsIEkgd2lsbCBkbyBpdCBpbiBu
ZXh0IHJldmlzaW9uLgpCVFcsIDxodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDI0MDcwMy1nYXJiYWdlLWV4cGxpY2l0LWJkOTVmOGRlYjcxNkB3ZW5keT4KaGFzIHNpbWlsYXIg
c2l0dWF0aW9uLAp0aG9zZSBwYXRjaGVzIG9ubHkgY3JlYXRlIGJpbmRpbmcgYnV0IG5vdCBpbXBs
ZW1lbnQgdGhlIGNvbXBhdGlibGUKcHJvcGVydHkgb2YgInRoZWFkLHRoMTUyMC1zcGnigJ0gaW4g
ZHJpdmVyLgpXaGVuIGtlcm5lbCBtYXRjaGluZywgaXQgd2lsbCBmaW5kIG91dCB0aGVyZeKAmXMg
bm8gY29tcGF0aWJsZSBvZgoidGhlYWQsdGgxNTIwLXNwaeKAnSBzbyBmYWxsYmFjayB0byAic25w
cyxkdy1hcGItc3Np4oCdCgpNYXkgSSB0YWtlIHlvdSBhIGZldyBtaW51dGVzIGZvciByZWFzb24g
YmVoaW5kIGl0PyBNeSB1bmRlcnN0YW5kaW5nIGlzCnRoYXQgdXNpbmcgc29jLXNwZWNpZmljIGNv
bXBhdGlibGUgaXMgYmV0dGVyCmZvciBmdXR1cmUgbWFpbnRhaW5pbmcsIElmIHRoZSBkZXZpY2Ug
YWN0dWFsbHkgY29tZXMgd2l0aCBzb21lIHVua25vd24KcXVpcmtzIG5vdCBwcmVzZW50IGluIHRo
ZSBnZW5lcmljIElQLgpBbmQgYWxsIHdlIG5lZWQgdG8gZG8gZm9yIGZpeGluZyBpcyBpbXBsZW1l
bnRpbmcgdGhlIHNvYy1zcGVjaWZpYwpjb21wYXRpYmxlIHByb3BlcnR5LgoKPiBSb2IsIEtyenlz
enRvZj8KPgoKQmVzdCByZWdhcmRzLApaaXhpYW4gWmVuZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
