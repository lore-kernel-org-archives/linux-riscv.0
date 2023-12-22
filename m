Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5D0C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HaUp/76OW0GCjJdk5e+JS/LV4YmMR6GTHju26xfDdg=; b=yiiKhVvpzmckXA
	b5suZulddxmW+eS3vH0xXc55SPKd8Qd7F71B6IV0ZNqrvOIngpzrpYYVl+U5+70+6z6KYEQHuz8EY
	Npt+qbkuPmRDJkvvRwCmC3OuWjNfjWefclcPipkPBjjK5izjrNK5h6Z1rvzzCEnLFzboJVsVSzDp8
	njDPxuVtD+dNSHa/sbu3PZ3ewSnMovE2yQBLrHWsoqye02CyYuGe5y+EDsOHhvAMP3YK32KCCY+O5
	rD7pcoluQT7DdVDf2/f/byJ4CYlR0N93RUdUBs6sThmlu5Z5gb312rraxaOiHh9xMiOBggvxCoMNH
	Jr6tJFUJyPU9lj4Wy9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGZrk-0058kq-1o;
	Fri, 22 Dec 2023 07:22:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGZrg-0058k4-31
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 07:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703229753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTt+9iUZa1ry1u7dZuMvANKr2dvD8bziPbEHXPTEpgk=;
	b=N90IZcopE8qaU+s7HXei4fj1KNuNG6R/uHizEgQqt2DebhpxmFCivwo/FnGdl5PoLAjjq5
	po41Zx6ZVCASUJWUhy7gaVnjtz0oW6tlnQvNnOcVmZP7TQTPiElH5eXUgS3w5Pz6vJpqRF
	D7jdzvJhmxZQMwga3L29aUXBMTWJUgw=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-FFKnivbWP-u6mxd7D8U4BQ-1; Fri, 22 Dec 2023 02:22:31 -0500
X-MC-Unique: FFKnivbWP-u6mxd7D8U4BQ-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-203437c6092so2004393fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 23:22:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703229751; x=1703834551;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTt+9iUZa1ry1u7dZuMvANKr2dvD8bziPbEHXPTEpgk=;
        b=vuUTXjeysjkRJk67qz8HtxmrBkQ0krkMCyhcwlfaDUl0mVDSksl1FEEJURI4GxXUxo
         553bMdq+gI1za1cWBczmO31pviTp869uSQjScRgLQDMgta071OB0EIi3oUraxqYiDPrH
         oGMSWXjtDT4YC//KdWIJnsYTJCp516qx5iBYWVgnG5q7iBwNf1mOAk1jmJQAZVt8GYM9
         7WfU/aTEO39/0JjfYMpYa0Wj9iqshPBT+UCqpSrSloZZEHkBEUwWnnMShGvfhZEqSnL6
         T6APfeqnEkykXO+MkVq8dOopp6vVAfIgPsxNyKR7col6le/eEPMistRFdEjtlk0tHjjs
         eFog==
X-Gm-Message-State: AOJu0YzqRkAIhonFZcOgM7+pdnorqZzLHOYLOYLsbydTKVl+xdN50qkn
	/1Ea9mj8PItuqXGIE28D5oWzc3C0OKFvz2cxvmHBeCflMwOO0ESUPfCQ2OkqTfbt6EU8ZO00IOT
	FMEwg9ajmeoj87HKIE85JLk4lKawmiLY0Iit2
X-Received: by 2002:a05:6870:1686:b0:203:cb22:9758 with SMTP id j6-20020a056870168600b00203cb229758mr1303897oae.50.1703229750959;
        Thu, 21 Dec 2023 23:22:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/JSRJPFXgXyRgxXvKFED2AMV+29LOtLLqALCr/cz7qUisEfaTUszvi8YE4qAHtSRnGnvgWw==
X-Received: by 2002:a05:6870:1686:b0:203:cb22:9758 with SMTP id j6-20020a056870168600b00203cb229758mr1303889oae.50.1703229750744;
        Thu, 21 Dec 2023 23:22:30 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id v21-20020a634815000000b005c1ce3c960bsm2615943pga.50.2023.12.21.23.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 23:22:30 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2 3/4] riscv: mm: Remove unused TASK_SIZE_MIN
Date: Fri, 22 Dec 2023 04:22:10 -0300
Message-ID: <ZYU5InA7WcpGKaRF@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTQSZSWJ7qZQckuALHkcJb8kEGTnb8wJQ9H2wgODkN56Lw@mail.gmail.com>
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-4-guoren@kernel.org> <ZYUVTFqvIIqv7D9O@LeoBras> <CAJF2gTQSZSWJ7qZQckuALHkcJb8kEGTnb8wJQ9H2wgODkN56Lw@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_232237_055870_FCA38EC2 
X-CRM114-Status: GOOD (  18.29  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDM6MTY6NDVQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCAxMjo0OeKAr1BNIExlb25hcmRvIEJyYXMgPGxlb2Jy
YXNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6
NDc6MDBBTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+IEZyb206IEd1byBS
ZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4KPiA+ID4gUmVtb3ZlIFRBU0tfU0la
RV9NSU4gYmVjYXVzZSBpdCdzIG5vdCB1c2VkIGFueW1vcmUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAyIC0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+ID4g
aW5kZXggNzRmZmIyMTc4ZjU0Li5lNDE1NTgyMjc2ZWMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oCj4gPiA+IEBAIC04NzgsNyArODc4LDYgQEAgc3RhdGljIGlubGluZSBw
dGVfdCBwdGVfc3dwX2NsZWFyX2V4Y2x1c2l2ZShwdGVfdCBwdGUpCj4gPiA+ICAgKi8KPiA+ID4g
ICNpZmRlZiBDT05GSUdfNjRCSVQKPiA+ID4gICNkZWZpbmUgVEFTS19TSVpFXzY0IChQR0RJUl9T
SVpFICogUFRSU19QRVJfUEdEIC8gMikKPiA+ID4gLSNkZWZpbmUgVEFTS19TSVpFX01JTiAgICAg
ICAgKFBHRElSX1NJWkVfTDMgKiBQVFJTX1BFUl9QR0QgLyAyKQo+ID4gPgo+ID4gPiAgI2lmZGVm
IENPTkZJR19DT01QQVQKPiA+ID4gICNkZWZpbmUgVEFTS19TSVpFXzMyIChfQUMoMHg4MDAwMDAw
MCwgVUwpKQo+ID4gPiBAQCAtODkwLDcgKzg4OSw2IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRl
X3N3cF9jbGVhcl9leGNsdXNpdmUocHRlX3QgcHRlKQo+ID4gPgo+ID4gPiAgI2Vsc2UKPiA+ID4g
ICNkZWZpbmUgVEFTS19TSVpFICAgIEZJWEFERFJfU1RBUlQKPiA+ID4gLSNkZWZpbmUgVEFTS19T
SVpFX01JTiAgICAgICAgVEFTS19TSVpFCj4gPiA+ICAjZW5kaWYKPiA+ID4KPiA+ID4gICNlbHNl
IC8qIENPTkZJR19NTVUgKi8KPiA+ID4gLS0KPiA+ID4gMi40MC4xCj4gPiA+Cj4gPgo+ID4gT24g
dG9ydmFsZHMvbWFzdGVyOgo+ID4KPiA+ICRnaXQgZ3JlcCBUQVNLX1NJWkVfTUlOCj4gPiBhcmNo
L2xvb25nYXJjaC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaDoyMzojZGVmaW5lIFRBU0tfU0laRV9N
SU4gVEFTS19TSVpFCj4gPiBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaDoz
NjojZGVmaW5lIFRBU0tfU0laRV9NSU4gVEFTS19TSVpFMzIKPiA+IGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5oOjg4MTojZGVmaW5lIFRBU0tfU0laRV9NSU4gICAgICAoUEdESVJfU0la
RV9MMyAqIFBUUlNfUEVSX1BHRCAvIDIpCj4gPiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaDo4OTM6I2RlZmluZSBUQVNLX1NJWkVfTUlOICAgICAgVEFTS19TSVpFCj4gPgo+ID4gSSBj
YW4gb25seSBzZWUgZGVmaW5pdGlvbnMsIHdpdGhvdXQgYW55IHVzYWdlLCBzbyBhZ3JlZWQgb24g
cmVtb3ZpbmcgdGhlbS4KPiA+Cj4gPiBGV0lXOgo+ID4gUmV2aWV3ZWQtYnk6IExlb25hcmRvIEJy
YXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KPiBUaHgKPiAKPiA+Cj4gPiBJIHdvdWxkIGFsc28gc2Vu
ZCBhIHBhdGNoIGZvciBsb29uZ2FyY2gsIHNpbmNlIHRoZXkgYXJlIGluIHRoZSBzYW1lIGJvYXQg
OikKPiBFaC4uLiBJJ3ZlIHNlbnQgb25lIHllc3RlcmRheSB0b2dldGhlci4KPiAKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9sb29uZ2FyY2gvMjAyMzEyMjEwNTQ2MjQuMjIwODAxOS0xLWd1b3Jl
bkBrZXJuZWwub3JnLwoKQXdlc29tZSEgOikKCj4gCj4gPgo+ID4gVGhhbmtzIQo+ID4gTGVvCj4g
Pgo+IAo+IAo+IC0tIAo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
