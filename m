Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5293C46CD4
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMTqAnOXKo/brUCL7mQNNrZaCiAaRnzf8P06OqDuNkE=; b=c7IxrLSMYBpnO1
	6uYat3gvZzzdYDNZhaQcxCvWDkr4192WN7ge/prgluPbKsO5Ap1DE0OD8mmIPvHlJkcIAwWvZXiyY
	lgRY1SNVheBFwKuZR1zclCJBHob1dUeHbImG3gVzLk90LAiZ/bqNamvlG7I1Ljtc0dEvWibZTCSiY
	qGRVYsRICDf2ffss+/XAKAAUYAgm8gl0ZthwF+PATnCrPk0EPYxNAwIAGkpjxTkyMyKUt4VpDd9wB
	ho2wTarJdfUTpXuQvbcRSqrjesWFUvrTpO1m59H8E+lq0ozok7ajRgjykOoUKcG8zpC1/pXbH1Yen
	pR6HPBFzKwt80D7M/Qeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGath-005Jbt-20;
	Fri, 22 Dec 2023 08:28:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGate-005Ja0-1e
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 08:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703233721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMjkb+AdlxKmri3rBtLZlSDUhTOTefSe341Yp/i+K78=;
	b=UYeZcfL/cyueZWgU9e/XJgrmYF2nKbCpRQkmThUKsNDu6Yg403FJLfTLLlOdr2HeOBDycF
	THq2b20z+jK6WvXtMdycJcKsyI3KKWa+Cxu7uISd9INob8RSau6u2bBdKYrPEnvxLPgYZa
	ZwF6d3g3B8PNyyHkwrIBAiOGebHZWkU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-PK21pDZ8PlG7moA-RrgaxQ-1; Fri, 22 Dec 2023 03:28:40 -0500
X-MC-Unique: PK21pDZ8PlG7moA-RrgaxQ-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5cda0492c8eso1549707a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 00:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703233719; x=1703838519;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UMjkb+AdlxKmri3rBtLZlSDUhTOTefSe341Yp/i+K78=;
        b=XY31SO24weQbtC61l5NPSw75otZFCf5/ehyGh0ubxWl1Ofxnfsmmq3vZauSUFXSKv1
         nJ8wWK2Cl0bvF+i5Iqk+4/HiQ5rAhmyQCrM92TXKvXG8/VwL0fn4DhNtBi1jpXpdLILM
         /Idcw2yz1vamDpfJZxi1CKDokViK3HtrQFrVP0qZ6jIlYatWjiB4ME6z7w74rRa2N9OY
         e8a0T2j7Hgowrjg/oW2UTwOemyCsBJ3evkOfLJAe++UD3/wiTgRVfJwf2VmbQXO9ltuU
         9Xpg27739ColIamjfSWHCQMeszQWJo0qGOoQXewn3R8w/A+qj8pf4KhV01VlAMDZEJ79
         +L9g==
X-Gm-Message-State: AOJu0YyQPVwIjyq2Qh/owBJegI1KLfQzyb+Mn7IF3b2ra7T0DJI9m6hQ
	AxGIgO08pAAQZkNgkdVDzhblmslFZwQlofw9Z7EMvlAnw3RA6j5JVobmswIAmXnp9EfUcZDrTWo
	xPVU2P8YYC8s7uaSBG1FX7FvNeCFqbSaUVeZ2
X-Received: by 2002:a05:6a21:19a:b0:195:4690:863 with SMTP id le26-20020a056a21019a00b0019546900863mr45070pzb.78.1703233718832;
        Fri, 22 Dec 2023 00:28:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG33qrfp2fIVx3SmQWmemCX48oeiSybC38vfzm6VdXRQ5wpTERAGty1KgAqNyi4XHyHs8U0kQ==
X-Received: by 2002:a05:6a21:19a:b0:195:4690:863 with SMTP id le26-20020a056a21019a00b0019546900863mr45061pzb.78.1703233718549;
        Fri, 22 Dec 2023 00:28:38 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id r19-20020aa78b93000000b006d98ba05776sm657875pfd.67.2023.12.22.00.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 00:28:38 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Greg Ungerer <gerg@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 4/4] riscv: Introduce set_compat_task() in asm/compat.h
Date: Fri, 22 Dec 2023 05:28:21 -0300
Message-ID: <ZYVIpSVzJYGMYPD2@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTTzOS+16d2sqLnRnw_bxVnE9Gudtf4nu69XbSsvcsQCfw@mail.gmail.com>
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-5-leobras@redhat.com> <CAJF2gTTzOS+16d2sqLnRnw_bxVnE9Gudtf4nu69XbSsvcsQCfw@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_002842_926897_5356F8B7 
X-CRM114-Status: GOOD (  20.82  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDQ6MTE6MTBQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCAzOjQ34oCvUE0gTGVvbmFyZG8gQnJhcyA8bGVvYnJh
c0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBJbiBvcmRlciB0byBoYXZlIGFsbCB0YXNrIGNv
bXBhdCBiaXQgYWNjZXNzIGRpcmVjdGx5IGluIGNvbXBhdC5oLCBpbnRyb2R1Y2UKPiA+IHNldF9j
b21wYXRfdGFzaygpIHRvIHNldC9yZXNldCB0aG9zZSB3aGVuIG5lZWRlZC4KPiA+Cj4gPiBBbHNv
LCBzaW5jZSBpdCdzIG9ubHkgdXNlZCBvbiBhbiBpZi9lbHNlIHNjZW5hcmlvLCBzaW1wbGlmeSB0
aGUgbWFjcm8gdXNpbmcKPiA+IGl0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExlb25hcmRvIEJy
YXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY29tcGF0LmggfCA4ICsrKysrKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYu
aCAgICB8IDUgKy0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9j
b21wYXQuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmgKPiA+IGluZGV4IGRhNGIy
OGNkMDFhOTUuLmFhMTAzNTMwYTVjODMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2NvbXBhdC5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5o
Cj4gPiBAQCAtMjgsNiArMjgsMTQgQEAgc3RhdGljIGlubGluZSBpbnQgaXNfY29tcGF0X3RocmVh
ZChzdHJ1Y3QgdGhyZWFkX2luZm8gKnRocmVhZCkKPiA+ICAgICAgICAgcmV0dXJuIHRlc3RfdGlf
dGhyZWFkX2ZsYWcodGhyZWFkLCBUSUZfMzJCSVQpOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIGlu
bGluZSB2b2lkIHNldF9jb21wYXRfdGFzayhib29sIGlzX2NvbXBhdCkKPiA+ICt7Cj4gPiArICAg
ICAgIGlmIChpc19jb21wYXQpCj4gPiArICAgICAgICAgICAgICAgc2V0X3RocmVhZF9mbGFnKFRJ
Rl8zMkJJVCk7Cj4gPiArICAgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgICBjbGVhcl90aHJl
YWRfZmxhZyhUSUZfMzJCSVQpOwo+ID4gK30KPiA+ICsKPiA+ICBzdHJ1Y3QgY29tcGF0X3VzZXJf
cmVnc19zdHJ1Y3Qgewo+ID4gICAgICAgICBjb21wYXRfdWxvbmdfdCBwYzsKPiA+ICAgICAgICAg
Y29tcGF0X3Vsb25nX3QgcmE7Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9lbGYuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgKPiA+IGluZGV4IDJlODgyNTdj
YWZhZWEuLmM3YWVhNzg4NmQyMmEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2VsZi5oCj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCj4gPiBAQCAt
MTM1LDEwICsxMzUsNyBAQCBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+ICAjaWZkZWYgQ09ORklHX0NPTVBBVAo+ID4KPiA+ICAj
ZGVmaW5lIFNFVF9QRVJTT05BTElUWShleCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gPiAtZG8geyAgICBpZiAoKGV4KS5lX2lkZW50W0VJX0NMQVNTXSA9PSBFTEZDTEFT
UzMyKSAgICAgICAgICAgICAgXAo+ID4gLSAgICAgICAgICAgICAgIHNldF90aHJlYWRfZmxhZyhU
SUZfMzJCSVQpOyAgICAgICAgICAgICAgICAgICAgIFwKPiA+IC0gICAgICAgZWxzZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAtICAgICAg
ICAgICAgICAgY2xlYXJfdGhyZWFkX2ZsYWcoVElGXzMyQklUKTsgICAgICAgICAgICAgICAgICAg
XAo+ID4gK2RvIHsgICBzZXRfY29tcGF0X3Rhc2soKGV4KS5lX2lkZW50W0VJX0NMQVNTXSA9PSBF
TEZDTEFTUzMyKTsgIFwKPiA+ICAgICAgICAgaWYgKHBlcnNvbmFsaXR5KGN1cnJlbnQtPnBlcnNv
bmFsaXR5KSAhPSBQRVJfTElOVVgzMikgICBcCj4gPiAgICAgICAgICAgICAgICAgc2V0X3BlcnNv
bmFsaXR5KFBFUl9MSU5VWCB8ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgKGN1cnJlbnQtPnBlcnNvbmFsaXR5ICYgKH5QRVJfTUFTSykpKTsgIFwKPiA+
IC0tCj4gPiAyLjQzLjAKPiA+Cj4gTEdUTQo+IAo+IFJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4KClRoYW5rcyEKTGVvCgo+IAo+IC0tIAo+IEJlc3QgUmVnYXJkcwo+ICBH
dW8gUmVuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
