Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D2BC04AA5
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 12:55:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C672054F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 12:55:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sxx25BvR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CXkABTqV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOy0swf3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C672054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BR714ffFDcpVQ0Fxwt403iPI4WD/sKGM0iR1zE/OVOw=; b=Sxx25BvRZKZULN
	+z151kS3wTcoiBqdzDoy3mU/K5XTjyrIVftPQkuUDsJ60RZnmklDRdKEtK8HA4zbxwc47XprlCxBY
	TzDfjepyHqJ7adYAF7VkQYZlxHj943BXfA3Vysa/NNtAsygk4xj//CeuB0ckGQFsCbS5RdsEQBGaH
	cM097/sOltkpH9VGsqorivsuAfkgAJ2jJ85Bw0JoEy07SlNcCPpY5bObYp3Kvj/gX/Ge5Ju+x32Qn
	1QxZuLBR5fjAhaUBuLweRxz0hFQDuzNx6shoX1ZgyO5UY1aJcz5p+oV1W9ctYed46dKt5mEbHk+0G
	Uapdp/DqInDzne1WQRbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gC2P7-00048l-8A; Mon, 15 Oct 2018 12:55:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC2Jm-0000CP-9z
 for linux-riscv@bombadil.infradead.org; Mon, 15 Oct 2018 12:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4dgj23StcuwzC1A1qsnwn8fhe0rQJE0yVYC2T+UkJ2w=; b=CXkABTqVf21PKFACMVpFelEjo7
 zQibHrz0xEwBDCEwGMVSmWMJzMuJCgrHMvAXIy2dczn9I+UVHNwdY5wUnazE+h9dLRg6O2ovsnm4i
 ZVOjVGjqalnbcJUxKFXl0VPh3o4CW+HEBGV7Tg/6LGtnpVDJxsbioebh+QIeDwG/d/qe2pIlvXg3P
 3p4Gt1KQr8nS8yhd5Qcwz1X+D2rwOL6mQ07wnotcxl3G6/GfOObuzzy5hF2IRc/0IEsp2kaXW0DXA
 NommnoUwgdPhW2pkI8RbpsmpLR8hm/zt7/s10ymjptR/zVEb39gJVk8FDBO8r+APtRluv9QaBmJJ2
 c5/i7QPQ==;
Received: from mail-it1-x141.google.com ([2607:f8b0:4864:20::141])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC244-0000wp-BK
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 12:33:41 +0000
Received: by mail-it1-x141.google.com with SMTP id e74-v6so27377384ita.2
 for <linux-riscv@lists.infradead.org>; Mon, 15 Oct 2018 05:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4dgj23StcuwzC1A1qsnwn8fhe0rQJE0yVYC2T+UkJ2w=;
 b=AOy0swf3r2apx1xmdR3ch3bzqFr+gPkDSTdZLqtOlP9CFEsyKoqti//kJv02tQrxA9
 AK5vWyX2n/nMrnUtUPs8Z+BYjkNkK50W6yUXSw3F51M0VAvUjoygJQl0I4gEMfUl253q
 bzyhczwsdqIxyGzEngjbeLpEfpXyzN30hu0wEv2gh7IpV8F/dnyRpkqEP9YPao3H8ypO
 1u/fB2MijpIIeI4hk0cS5H6xHVdWrwC0YWu0mOeds0SwqC2XGcFFy+ZLRTQ71CCIXI8t
 HgHlULji6SPDcnmrO/5pjg08JhKIa1CZHWsAVY3YgUnVN6N/NV2LxjEabkrrjpGFh4tS
 d+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4dgj23StcuwzC1A1qsnwn8fhe0rQJE0yVYC2T+UkJ2w=;
 b=KPm6vDWBa+ym451q+0hIT0ZMhlP+0kR55IZ4qOnPhXNemOve9tfXw9P+/KLAW4US9z
 XZMhxrGtAGEnM5VNoI9LvonNQZODiHzltNxv66nxNltwjPW5TbywZ5/H+furVG/TJDLl
 /qnEzPVyj+3+Sji6Ar8DHbOjcO7M+6gTJqWf9D/oIZgMgUxxoLTaH96eAdIDJl+DEyRo
 2VZMVTX3I7jTUecGM7rkWUBhaSfydYxaf1gHy+/Fff+QnARPgbH86Niy6UA52gdlOQjI
 lhpWRpCqMdUSQ8BV9w2NBdyLCcZFAgIkNWxbPZSYTn5knmDqGvReOv00wRYOFeb/1nDa
 Jw7w==
X-Gm-Message-State: ABuFfohWLERoUKYBi1dCyA7UNgrF2odLB5tj7dZHUsDX6OsWf2NqDvgK
 DVkUNeu6GqszjUvN6Ncrf/K9N5Gvpkzb3poEl7U=
X-Google-Smtp-Source: ACcGV62JVu0nwY6fN3LW6Psm0vzlSpwoMFjUSQMWd1G7tZwdnPWymNs5gL6ZtY9Osfq383xXFjQq1KxUbJYMUE35dEQ=
X-Received: by 2002:a05:660c:14e:: with SMTP id
 r14mr280507itk.136.1539606808030; 
 Mon, 15 Oct 2018 05:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1538535527.git.zongbox@gmail.com>
In-Reply-To: <cover.1538535527.git.zongbox@gmail.com>
From: Zong Li <zongbox@gmail.com>
Date: Mon, 15 Oct 2018 20:33:17 +0800
Message-ID:
 <CA+ZOyaig6dwzfhUn5CQ92P__yay2-aAgA4Nh+VxTs50FCbECwQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Fix some bugs on RV32 build fail and issue
To: Palmer Dabbelt <palmer@sifive.com>, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_133340_382584_ABA93352 
X-CRM114-Status: GOOD (  14.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, Zong Li <zong@andestech.com>,
 linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015123317.HsHlgEa26IrRI9TzfOLoaQrBj1VF3tNpydS7GRdq2ko@z>

Wm9uZyBMaSA8em9uZ2JveEBnbWFpbC5jb20+IOaWvCAyMDE45bm0MTDmnIgz5pelIOmAseS4iSDk
uIrljYgxMToxMuWvq+mBk++8mgo+Cj4gVGhpcyBwYXRjaGVzIGNvbnRhaW4gdGhlIG1vZGlmaWNh
aW9uIGFzIGZvbGxvd3M6Cj4gMS4gRml4IHVwIHRoZSBidWlsZGluZyBmYWlsIG9uIFJWMzIuCj4g
Mi4gQWRkIHVtb2RkaTMgYW5kIHVkaXZtb2RkaTQgZnVuY3Rpb25zIGZvciBSVjMyLgo+IDMuIEZp
eCBpb3JlbWFwIHByb2JsZW0gb24gUlYzMi4KPgo+IFRoYW5rcyBhbGwgZm9yIHJldmlldyB0aGVz
ZSBjb2RlIGFuZCBtb2RpZnkgdGhlIGNvcHlyaWdodCBkZXNjcmlwdGlvbi4KPgo+IENoYW5nZXMg
aW4gdjQ6Cj4gIC0gUmV0YWluIHRoZSBjb21wbGV0ZSBjb3B5cmlnaHQgZGVzY3JpcHRpb24uCj4g
IC0gTW9kaWZ5IGNvbW1pdCBtZXNzYWdlLgo+ICAtIFJlYmFzZSB1cHN0cmVhbSBjb2RlLgo+Cj4g
Q2hhbmdlcyBpbiB2MzoKPiAgLSBDaGFuZ2UgdGhlIGNvcHlyaWdodCBub3RpY2VzIHRvIEdQTHYy
IGZyb20gIGdjYyA0LjIuMS4KPgo+IENoYW5nZXMgaW4gdjI6Cj4gIC0gUmV0YWluIHRoZSBjb3B5
cmlnaHQgbm90aWNlcyBmcm9tIGxpYmdjYyBpbiB1bW9kZGkzLmMgYW5kIHVkaXZtb2RkaTQuYy4K
Pgo+IFZpbmNlbnQgQ2hlbiAoMSk6Cj4gICBSSVNDLVY6IEF2b2lkIGNvcnJ1cHRpbmcgdGhlIHVw
cGVyIDMyLWJpdCBvZiBwaHlzX2FkZHJfdCBpbiBpb3JlbWFwCj4KPiBab25nIExpICg0KToKPiAg
IFJJU0MtVjogQnVpbGQgdGlzaGlmdCBvbmx5IG9uIDY0LWJpdAo+ICAgUklTQy1WOiBBZGQgcHJl
cHJvY2Vzc29yIGRpcmVjdGl2ZSBmb3Igc3dpb3RsYgo+ICAgbGliOiBBZGQgdW1vZGRpMyBhbmQg
dWRpdm1vZGRpNCBvZiBHQ0MgbGlicmFyeSByb3V0aW5lcwo+ICAgUklTQy1WOiBTZWxlY3QgR0VO
RVJJQ19MSUJfVU1PRERJMyBvbiBSVjMyCj4KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICB8
ICAgMSArCj4gIGFyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgfCAgIDMgKwo+ICBhcmNoL3Jpc2N2
L2xpYi9NYWtlZmlsZSAgIHwgICAzICstCj4gIGFyY2gvcmlzY3YvbW0vaW9yZW1hcC5jICAgfCAg
IDIgKy0KPiAgbGliL0tjb25maWcgICAgICAgICAgICAgICB8ICAgMyArCj4gIGxpYi9NYWtlZmls
ZSAgICAgICAgICAgICAgfCAgIDEgKwo+ICBsaWIvdWRpdm1vZGRpNC5jICAgICAgICAgIHwgMzI2
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgbGliL3Vt
b2RkaTMuYyAgICAgICAgICAgICB8ICA0OCArKysrKysrCj4gIDggZmlsZXMgY2hhbmdlZCwgMzg1
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIv
dWRpdm1vZGRpNC5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdW1vZGRpMy5jCj4KPiAtLQo+
IDIuNy40Cj4KCnBpbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
