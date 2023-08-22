Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240AAEE49A5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 06:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sAAdPHc8HTsCQYmYq+qZEtg2cTB0FM/SWMVyPfkqKw=; b=uRahP5dhr/j4M7
	J8b3Y2bDn+5ubVcqyJw6fTNTaKumrc5Uiqq0rz9mqv7SeIQqRztIFHxjRb4LvU94uxHZu+L0lMbB2
	QSm90L6FYRHUykx842DbvuHWF67O1kY2Cal/sKitLqqXI7OnJC9lXZzUV1SoTzbUuQjQX+UaIpm7O
	NSZu5jJPCULz/m4Pvt2EpwTHckhQzi2Ao2hC+QWj+3+fv8ABjfJlaxs/0mq7VYvrBlkzZp/tUEbkS
	g8QgShWlBc/+7EZKa+7uDB77ZeQgtJnmUgHOkiKPAQ1wGAo0n6Of8S2MPJbrrFkIWhrWfP4uoCF2z
	jtSzO4711XvgTJDZaPdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYKgx-00FDhf-2Y;
	Tue, 22 Aug 2023 06:16:39 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYKgu-00FDg5-1n
	for linux-riscv@lists.infradead.org;
	Tue, 22 Aug 2023 06:16:38 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5280ef23593so4859646a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Aug 2023 23:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1692684994; x=1693289794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Etm+is1Vk1OwDhQBIivpxr/NaVYXAexKvYiz/4v9WQ0=;
        b=hnvji7WGGO1c3o007SYql5xd9g063Oin/FtbXmcNNt+bhkBhgs9G3s6YBU4NcfgwLi
         BUtrVlZ51MWSPiE2FN7YKLqo1rgjFh5nwRUz/TKltIRtPSnisRBi3rjCu6+94lMsJnL9
         HDQP/Sbzcoi8D2tCLzHS+oHSLv/P2Q1dybK4gxAtjKXDM6KYX/QkWdGLY1yqc1ZuQm/m
         M/IJQhXbXvK6czGCFzmCjOEMiuPLqRicNreDn85Ku4YHdgYFGUDtjjC3Zgr65uSHgNAe
         jslmA+Qr1i+OP4dyO2zvbtDT8RCNqzsJJ4piCsVy5Rae8MJvEi0qnhQeg3YUKNNLDraG
         FxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692684994; x=1693289794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Etm+is1Vk1OwDhQBIivpxr/NaVYXAexKvYiz/4v9WQ0=;
        b=BBvDJrWB99WcW5akLMvtBDcGnPGmvit0CuolkWUb1oFFQiQUm+xoBboQhhHATQRA61
         IqNgdOO6izj8sesW4NJI28L2Qj9mgwzvSwy6Jg1DEvqMMAeY5JgN84aWKVE0GOM1TG93
         HAS4Y6ngAZDvKifkRZfAWSy7VUHK1JUfEj9Qb0cItrJ7uKPWt/mbMR4OaxeotcbouaTL
         22y951fNDy78QlEZelBQj0wa+ZwsmRq5wSWuTJlHtVQ8fpf0g62e42IB6FyB8Rfs/rIF
         ZsbL5G/VGGfnDOIpIts44m7W+/ODqb8gZjKthFts4YSIZuBr466Xrc6HhsJ2GmP9KhTM
         94Xg==
X-Gm-Message-State: AOJu0YyFhtPNLWduGx77s3Z94MfMPC9tclVtpOkR03x0+LLzhVEGsyI2
	0vCBfrF57RJhWQOZYG9KB2L2ax0m27yyL2tNyL0wpA==
X-Google-Smtp-Source: AGHT+IED6jSpdp0uBNdtBG9rgNloUIIG/FgjpAiBY9v7dmhpX1qTswjR6JdQcrlQLJ239YUFyanJLxo/y/E6FCdSAvU=
X-Received: by 2002:a17:906:2d1:b0:98d:e605:2bce with SMTP id
 17-20020a17090602d100b0098de6052bcemr7413238ejk.46.1692684993483; Mon, 21 Aug
 2023 23:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230822054739.33552-1-nick.hu@sifive.com>
In-Reply-To: <20230822054739.33552-1-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Aug 2023 11:46:22 +0530
Message-ID: <CAAhSdy32DYoHpBKS3TF1SapM5fuMF5K00oqRxw8JF05v=DrUuw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: suspend: Add syscore ops for suspend
To: Nick Hu <nick.hu@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	conor.dooley@microchip.com, jeeheng.sia@starfivetech.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, Andy Chiu <andy.chiu@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_231636_775781_0874BEEE 
X-CRM114-Status: GOOD (  21.91  )
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

T24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgMTE6MTfigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gSWYgYSB0YXNrIGlzIHRoZSBvbmUgd2hvIHBlcmZvcm1zIHRoZSBz
dXNwZW5kIGZsb3cgYW5kIGl0IGFsc28gZG8gc29tZQo+IGZsb2F0aW5nIG9yIHZlY3RvciBvcGVy
YXRpb25zIGJlZm9yZSB0aGUgc3VzcGVuZCwgd2UgbWlnaHQgbG9zZSB0aGUgRlBVCj4gYW5kIHZl
Y3RvciBzdGF0ZXMgd2hlbiBpdCBnb2VzIHRvIHRoZSBub24tcmV0ZW50aW9uIHN5c3RlbSBzdXNw
ZW5kIHN0YXRlLgo+IEFkZCBzeXNjb3JlIG9wcyB0byBzYXZlIGFuZCByZXN0b3JlIHRoZSBGUFUg
YW5kIHZlY3RvciBzdGF0ZXMgb2YgdGhlCj4gY3VycmVudCB0YXNrIHRvIGZpeCB0aGUgaXNzdWUg
YWJvdmUuCgpUaGlzIG9ubHkgYXBwbGllcyB0byBub24tcmV0ZW50aXZlIHN5c3RlbSBzdXNwZW5k
IHNvIHdoeSBkbyB3ZSBuZWVkCnRoaXMgYmVmb3JlIFNCSSBzeXN0ZW0gc3VzcGVuZCBpcyBtZXJn
ZWQgPwoKUmVnYXJkcywKQW51cAoKCj4KPiBDby1kZXZlbG9wZWQtYnk6IEFuZHkgQ2hpdSA8YW5k
eS5jaGl1QHNpZml2ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVA
c2lmaXZlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+
Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiBhKSBBZGQgQ28tZGV2ZWxvcGVkLWJ5IGFuZCBhZGp1
c3QgdGhlIG9yZGVyIG9mIHNpZ25lZC1vZmYKPiBiKSBSZXBocmFzZSB0aGUgY29tbWl0IG1lc3Nh
Z2UKPgo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zdXNwZW5kLmMgfCA0NSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3VzcGVuZC5jCj4gaW5kZXggM2M4OWI4ZWM2OWM0Li5mZjY5ZmY4YTE5NzQgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jCj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvc3VzcGVuZC5jCj4gQEAgLTQsOSArNCwxNCBAQAo+ICAgKiBDb3B5cmlnaHQgKGMp
IDIwMjIgVmVudGFuYSBNaWNybyBTeXN0ZW1zIEluYy4KPiAgICovCj4KPiArI2luY2x1ZGUgPGxp
bnV4L2NwdV9wbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvZnRyYWNlLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC90aHJlYWRfaW5mby5oPgo+ICsjaW5jbHVkZSA8bGludXgvc3lzY29yZV9vcHMuaD4KPiAg
I2luY2x1ZGUgPGFzbS9jc3IuaD4KPiAgI2luY2x1ZGUgPGFzbS9zdXNwZW5kLmg+Cj4gKyNpbmNs
dWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4gKyNpbmNsdWRlIDxhc20vdmVjdG9yLmg+Cj4KPiAgdm9p
ZCBzdXNwZW5kX3NhdmVfY3NycyhzdHJ1Y3Qgc3VzcGVuZF9jb250ZXh0ICpjb250ZXh0KQo+ICB7
Cj4gQEAgLTg1LDMgKzkwLDQzIEBAIGludCBjcHVfc3VzcGVuZCh1bnNpZ25lZCBsb25nIGFyZywK
Pgo+ICAgICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gKwo+ICtzdGF0aWMgaW50IHJpc2N2X2NwdV9z
dXNwZW5kKHZvaWQpCj4gK3sKPiArICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqY3VyX3Rhc2sg
PSBnZXRfY3VycmVudCgpOwo+ICsgICAgICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MgPSB0YXNrX3B0
X3JlZ3MoY3VyX3Rhc2spOwo+ICsKPiArICAgICAgIGlmIChoYXNfZnB1KCkpIHsKPiArICAgICAg
ICAgICAgICAgaWYgKHVubGlrZWx5KHJlZ3MtPnN0YXR1cyAmIFNSX1NEKSkKPiArICAgICAgICAg
ICAgICAgICAgICAgICBmc3RhdGVfc2F2ZShjdXJfdGFzaywgcmVncyk7Cj4gKyAgICAgICB9Cj4g
KyAgICAgICBpZiAoaGFzX3ZlY3RvcigpKSB7Cj4gKyAgICAgICAgICAgICAgIGlmICh1bmxpa2Vs
eShyZWdzLT5zdGF0dXMgJiBTUl9TRCkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmlzY3Zf
dl92c3RhdGVfc2F2ZShjdXJfdGFzaywgcmVncyk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
cmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIHJpc2N2X2NwdV9yZXN1bWUodm9pZCkK
PiArewo+ICsgICAgICAgc3RydWN0IHRhc2tfc3RydWN0ICpjdXJfdGFzayA9IGdldF9jdXJyZW50
KCk7Cj4gKyAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncyA9IHRhc2tfcHRfcmVncyhjdXJfdGFz
ayk7Cj4gKwo+ICsgICAgICAgaWYgKGhhc19mcHUoKSkKPiArICAgICAgICAgICAgICAgZnN0YXRl
X3Jlc3RvcmUoY3VyX3Rhc2ssIHJlZ3MpOwo+ICsgICAgICAgaWYgKGhhc192ZWN0b3IoKSkKPiAr
ICAgICAgICAgICAgICAgcmlzY3Zfdl92c3RhdGVfcmVzdG9yZShjdXJfdGFzaywgcmVncyk7Cj4g
K30KPiArCj4gK3N0YXRpYyBzdHJ1Y3Qgc3lzY29yZV9vcHMgcmlzY3ZfY3B1X3N5c2NvcmVfb3Bz
ID0gewo+ICsgICAgICAgLnN1c3BlbmQgICAgICAgID0gcmlzY3ZfY3B1X3N1c3BlbmQsCj4gKyAg
ICAgICAucmVzdW1lICAgICAgICAgPSByaXNjdl9jcHVfcmVzdW1lLAo+ICt9Owo+ICsKPiArc3Rh
dGljIGludCBfX2luaXQgcmlzY3ZfY3B1X3N1c3BlbmRfaW5pdCh2b2lkKQo+ICt7Cj4gKyAgICAg
ICByZWdpc3Rlcl9zeXNjb3JlX29wcygmcmlzY3ZfY3B1X3N5c2NvcmVfb3BzKTsKPiArICAgICAg
IHJldHVybiAwOwo+ICt9Cj4gK2FyY2hfaW5pdGNhbGwocmlzY3ZfY3B1X3N1c3BlbmRfaW5pdCk7
Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
