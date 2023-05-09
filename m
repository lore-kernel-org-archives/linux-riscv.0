Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEE0C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+382QPlQ+9ymZY32L79+lOqVHTRS0/+jynTJ0lBr5x0=; b=lQBU1j6/uI8a04
	LVXCACv8M/fwYeukqaL4mQ3CHijR3owgLxilaWGhzIfaBYMLXtAJn2QltOc6qTwKmcm7i4mNvONMJ
	077jdDZBLgFjK4xzQQw1B41ZIa0UTASqgOjgzaArr15Urql+1Aeh3CcEi5yda75aBZyx/TIu+Zyhp
	4wwKG1kDYj3uV7p5VEIHGwssXeyBrP6n2/l0e9PLsqpm5RDi+ZEnx0c2UbhvyC7MbJ8gUfY/a2rL7
	gp+XP2ZkQ4OlflKREYgWdyGT4/Hcc3r+hEfkXP8VzAm7dvRFUnSPTnQEGkyDbbfvpDpFWqW3Do/Pk
	Yvw0wbovVeayr9lVyaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwSBZ-004256-25;
	Tue, 09 May 2023 18:35:41 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwSBW-00424B-1P
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 18:35:39 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f13d8f74abso7055104e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 11:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683657333; x=1686249333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfgDkN6/vdhK2GFASgIn7d04jTTm9Lyq2tvSareDv5M=;
        b=KpurfS4qJyOfrwFAlVM7HZprLcLWA71H3L54Qea9hZnXbHY6gwnkSp+06wOd3lMs9H
         kxgtHl+tQBmEUqq1vDMZcBUEKiR14UphjE3fi1ksnz9ySqPJ5w4YwgvRwxiRcSPn0Zyt
         KMnmQiaED5pR3uRVLnIqnDv4w+uozqaX/UXBLbJ4A6bPZXs5CTLbq4hCUi4bZ7D2DbYr
         Yl2V9aUj/1i82dsLDhOqdTomJsF/4as57Q3jtpyFnKKzBEY0pbv8oHfj5nVPeUfhRBLw
         w0/x24pM3H0qus9KzNpC8iISFSF+OUKPMg5MLP1irhpVAvj/KCirPPn3SykcHrZobknf
         Dsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683657333; x=1686249333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfgDkN6/vdhK2GFASgIn7d04jTTm9Lyq2tvSareDv5M=;
        b=YfP6t97OYXL1Q+HuopYsrjlAm3u9+FVZbpsusQtUd6qCKRtgDWze/3dwKidGmgaYxp
         +jQk35XrxduhrGyfb1/+QJbAs9mVtpTl5gZx8w8leVYjH0NFYewzRGWjZnsIQi/oUj5k
         aZ1kH2GGrxVvrvVfflu+sfCSpvNi3BGHC4iUP8lZT0w3JQes7WjFvESi+X7N78/IZ/09
         1ZwllsHnvXooJsK+OLctABj8HVf1VtwmXCruOdgPAabcTP8aeN3bSlcQJpitF7GbDCVw
         h7Lm4zpFp8jztZhD3b8apP9t7UbheGLwcac9JwVwXQxvUD3K1dSpuyQPE1ZJI/0tNJQM
         2PYw==
X-Gm-Message-State: AC+VfDxldY/ANETcIxL+KD1E9iQWWnsW9zJI0Ni1JyhqoXwwjSohnuFg
	4OF0ZmMlUiSqFCEjpUHxeg6RLF6katJKIEnezVNe8g==
X-Google-Smtp-Source: ACHHUZ5xWMC38Oh7cIFm++FUUu8wZzSwfuLJnL3vTLI1qxQSqArwnAQrvV9g1jk/9UdaMqvwxY8OP1G8ZtM0cfp9QFg=
X-Received: by 2002:a19:ad48:0:b0:4f1:80cf:6194 with SMTP id
 s8-20020a19ad48000000b004f180cf6194mr882716lfd.64.1683657333000; Tue, 09 May
 2023 11:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230509182504.2997252-1-evan@rivosinc.com> <20230509182504.2997252-2-evan@rivosinc.com>
 <20230509-exclusion-crested-67dad91b7055@spud>
In-Reply-To: <20230509-exclusion-crested-67dad91b7055@spud>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 9 May 2023 11:34:57 -0700
Message-ID: <CALs-HstaQweGaz71GZXeu1gtVQ7Efb=i=Zgt4ETtmf1vJncxEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Add Zba, Zbs extension probing
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_113538_473073_BA7BFBF4 
X-CRM114-Status: GOOD (  18.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgOSwgMjAyMyBhdCAxMToyOeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1heSAwOSwgMjAyMyBhdCAxMToyNTowMUFNIC0w
NzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gQWRkIHRoZSBaYmEgYWRkcmVzcyBiaXQgbWFuaXB1
bGF0aW9uIGV4dGVuc2lvbiBhbmQgWmJzIHNpbmdsZSBiaXQKPiA+IGluc3RydWN0aW9ucyBleHRl
bnNpb24gaW50byB0aG9zZSB0aGUga2VybmVsIGlzIGF3YXJlIG9mIGFuZCBtYWludGFpbnMKPiA+
IGluIGl0cyByaXNjdl9pc2EgYml0bWFwLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEV2YW4gR3Jl
ZW4gPGV2YW5Acml2b3NpbmMuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpv
bmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiBSZXZpZXdlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBh
bG1lckByaXZvc2luYy5jb20+Cj4KPiBHaXZlbiB5b3UgYWRkZWQgdGhlIGxhZHMsIHJhdGhlciB0
aGFuIGlnbm9yaW5nIHRoZW0gZHVlIHRvIHRoZSBaYnMKPiBjaGFuZ2UsIEkgdGhpbmsgeW91IGZv
cmdvdCBteSBSLWIgZnJvbSB2MT8KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4KCldob29wcywgeWVzIEkgZGlkLiBTb3JyeSBhYm91dCB0aGF0
LCBhbmQgdGhhbmtzIGZvciB0aGUgcmV2aWV3IQoKPgo+IENoZWVycywKPiBDb25vci4KPgo+ID4K
PiA+IC0tLQo+ID4KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAgLSBBZGQgWmJzIGFzIHdlbGwKPiA+
Cj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgMiArKwo+ID4gIGFyY2gvcmlz
Y3Yva2VybmVsL2NwdS5jICAgICAgICB8IDIgKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMgfCAyICsrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiA+
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiBpbmRleCBlMGM0MGE0YzYzZDUuLjZiMmU4ZmY0
NjM4YyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ID4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiBAQCAtNDYsNiArNDYsOCBA
QAo+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aSUNCT1ogICAgICAgICAzNAo+ID4gICNkZWZp
bmUgUklTQ1ZfSVNBX0VYVF9TTUFJQSAgICAgICAgICAzNQo+ID4gICNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9TU0FJQSAgICAgICAgICAzNgo+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQkEgICAg
ICAgICAgICAzNwo+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQlMgICAgICAgICAgICAzOAo+
ID4KPiA+ICAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYICAgICAgICAgICAgNjQKPgo+IEhlaCwg
Z29ubmEgc3RhcnQgZ2V0dGluZyB0aWdodCBvbiBiaXRzIGhlcmUgc29vbmlzaCA6KQoKWWVhaCB0
aGV5J3JlIGZseWluZyBpbiwgSSBoYWQgdG8gdXBkYXRlIG1pbmUgc2luY2UgU01BSUEgc3dvb3No
ZWQgaW4uCi1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
