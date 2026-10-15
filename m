Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED34CCA464
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCr3hFYpJxWVomZ4QAxBjTdJO3nESra1t5AeNQH2OzA=; b=b358iv5QJqXMyg
	jmFnoKSRiglTmkXkVH+pOVK4yuAIo4Ewv0b/zn7eUCNx6/PIBHQUVeMkAhAqLq0S++UVriltN6AKV
	e2q95oWrcplQBFTeCTC8qlmj/LJm9diYywKi99yz2CwQ4xgC/BZUtg7euI99T4rabkrr8oWhAb903
	HxChUOc+tT3VVbbOvAgK312ar7B/Pj10XNwIjztQc3EgbE8NJABdVRW2eQTVpAziEGfhfbc4GVsN4
	RiS9nUwNbNKMaeiPOcHTEZ2aDoVIMkNje8jzdoY1tXRuvxCn/plK3e+3njPgB+5ALxQz/nLYlFE0+
	PI2Mr+HxGeCxUcJyCuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOlc-00000000upE-1ooa;
	Thu, 15 Oct 2026 16:57:20 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHOlZ-00000000uo2-0xUV
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 16:57:18 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-885cf67963eso46736217b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 09:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792083433; cv=none;
        d=google.com; s=arc-20260327;
        b=Hec0jPkGFUBIAcCujfCDf2WWjCaBnWx6MJseIv2EgvIJcxOWhEMNwc5ws2ZKRD0W8H
         FGFgtCCCPO2YrAw2HkqqHVv/acwG0Atha+pfKHUenMVgen8vtTdLwhz5G48xSpBBQBBk
         +qnrLCvWChkT5qrecfobRDniLkQL4QSpBRKv1Ns4s3IrsFA2rRGKpyYz9d5oJe/Fl/QI
         FYzFkjmsHYklz4vHPXOLF9bHfsx49o5Jo9qj62FNL9AvT2/dBBZgPmITXn/07SJ6IXW+
         ixRAitFWspDhmuHhuG3pGmvbe0f7JboFvHBH/o7h6OGy2qgFbG6Xv7clpKkOgRF7Yi62
         SV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        fh=c3jfY5cAtKTkJEGsJcxA02GB87fjVeYRF9Zo7Q4nwrA=;
        b=EquIyfnMex+Fchqtn4YKHNz2YRWp3GLll3QdaYYDgE79TrZJyPgPo8UIYBrkjJGQWw
         Vq+YdObpHcdYrQE+PEWE7vzBO8OrfQF7l2wWAKxwso0uDhBo4umkVVkaw6ImOasg9EtH
         ysGmN7y2c7GiyR183TwaWapWLN1aszkXdOoX5Yu+ekfphebn0drR9TzWp8696IccqKDY
         x3ajNsNHMnPHcneG6DgXhLgwyaHD54TfAcqykacNQJguqVxJO0WyI6s89N9CAN90tlpu
         fbaS9DOD/ysd0K1vs2Q/B4XSjjgLJvzK+wKjMLcVwpgOVonaplTisQQKdubUEKLMuhtC
         PEgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792083433; x=1792688233; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        b=SoEN+akqcUVETViz60yDVz2ZrDejmkoS99z62IwKl4qATrei63AjQekxHJ9tcVRxnE
         o42cz8aqRYTYdtBzOK9fO0BFau7bwcmzlDMUlhAKuBVzMpWdxQ2h+taOQT4NNE6uyZLA
         8IyTXjX4KhRuq5pJx8H4mMFFmGErJJsWjSbFuOTtO7n22QpTyLQQW1G4teDh+jCP8HiH
         YGEmZMgZGetdLyqlpPDDBnmmrG90fWNdaFpgQQCwGH3MBlfwDNKuK6xA+yIylnYYHJmB
         Y4B7fhhTiJX2jymNBfRbTwqTbuUFH3JBjWJoervgHa6XhMnEEjg2XXDkes7Xjxy2hkb8
         a8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083433; x=1792688233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J5kIW+tQBMxGbCV/MEEhu0uSXSHsdNy5FmgcKXwebA=;
        b=FOip7Z8dc8nYnkKTI9WF0juyP/kvdhse7Zs1lF2kv//+WT/wETuSFVDapmyzwsBzwH
         jkpvd8H7s03NcbD8kiLxbmhjRFAX6NNQY4MEEA1lKNcf254srmCivF46CSEgQvjd6ztD
         SH+IChJBr9JTFNIPqYsPctkKJLvxOLvNNhxwNlYbyZunkgYIUhXxEzkqpvXDCm5/ViJT
         lITXn4/PYov5jFIduGI6JENPVuUCoA/aAx2Roti7LoAt0HpORV4871F753E9Um7iPNOV
         vnGOkGTNaedREr1abCLKpzySC7kmKulCn6kv/+vqsh49az0kuCBRCKblEC0nEAyzarxn
         PB/g==
X-Forwarded-Encrypted: i=1; AKwUvBy6kO1rQTNWIJwnfj3snUUWj6Gln934FqYREuLBK2uBpEXLHkdFDjsXAMRqTHb2XYME9M1z7akry7s1KA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLw0vNg13Nmu8v4sggb3QzSoaDJz6tjQLt+JAzA+q8Z7WdbYY6u
	9vfNzMtQc07h7w1P4cri0zJd2B8A18h5TozPjo2ucwIERD8lNqZIb2qPVPCX0DM+zARpDMX5gtd
	PrepP3QuHy9w9Dn0LkO9PnU8SvLID2qs=
X-Gm-Gg: AYBFou1FNZ8KeR4G2Z/QvQ481npG0JxyGJMteRuOnLq0WMB3b0G3z35Pd4h6m+eUUV5
	azRftETInj68+40tsOPx4YzTQV60NaViKcmTiwWq76H+tb2G6LftTvSCIUQOeP43s6qkfJVeHEx
	K0KL7Ld8tpfwsLRYIk3ptXjo4El63wqoF40xuSODA0CM0Hu/R9DW7U9/e8+4IeYEy88siXUi49r
	p1e13gfrwjoJk8rkp/UlUiMXMZE966vyh8aGYTpDC+znWSzCmLCTGksT1oJTCHZoo6EQWiW6qbc
	1CURe9mqtSw17TXbRckwlyN6miZKT38KzVcbTOxzdzJZaOye/QandzNf
X-Received: by 2002:a05:690c:fd1:b0:8b0:dc44:9258 with SMTP id
 00721157ae682-8b0dc44944amr6439537b3.10.1792083432951; Thu, 15 Oct 2026
 09:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org> <20261008-04-k3-clk-pm-aux-v1-1-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-1-8372d7307694@kernel.org>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 18:57:00 +0200
X-Gm-Features: AclHuK_UaTV6-y66kPO6og4udDg5dfC89mcLvyhiRip0upObtlxnkinWliLQi1M
Message-ID: <CABdCQ=P3bTmc=DX9zG6ELV=zsTmzDFsZyWhLCWnSwSeHP101og@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: spacemit: rename to generic ccu aux register function
To: Yixun Lan <dlan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_095717_291276_8F384981 
X-CRM114-Status: GOOD (  17.73  )
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
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>, Alex Elder <elder@riscstar.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Brian Masney <bmasney+clk@redhat.com>, spacemit@lists.linux.dev, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGVzdGVkIG9uIE9yYW5nZVBpIFJWMi4KClRlc3RlZC1ieTogSWtlciBQZWRyb3NhIDxpa2VycGVk
cm9zYW1AZ21haWwuY29tPgpSZXZpZXdlZC1ieTogSWtlciBQZWRyb3NhIDxpa2VycGVkcm9zYW1A
Z21haWwuY29tPgoKRWwganVlLCA4IG9jdCAyMDI2IGEgbGFzIDQ6NTgsIFlpeHVuIExhbiAoPGRs
YW5Aa2VybmVsLm9yZz4pIGVzY3JpYmnDszoKPgo+IFRoZSBBUE1VIChBcHBsaWNhdGlvbiBTdWJz
eXN0ZW0gUG93ZXIgTWFuYWdlbWVudCBVbml0KSByZWdpc3RlciByZWdpb24KPiBibG9jayBub3Qg
b25seSBwcm92aWRlcyBjbG9jayBhbmQgcmVzZXQgc3VwcG9ydCwgYnV0IGFsc28gdGhlIHBtIGRv
bWFpbgo+IG1hbmFnZW1lbnQgY2FwYWJpbGl0aWVzLCBzbyBmdW5jdGlvbiBvZiBhdXggcmVnaXN0
cmF0aW9uIGlzIGJlaW5nIHJlbmFtZWQKPiB0byBhIG1vcmUgZ2VuZXJpYyBvbmUsIGluIG9yZGVy
IHRvIHByZXBhcmUgZm9yIGZ1dHVyZSBhZGRpdGlvbiBvZiBwbQo+IGRvbWFpbiBkcml2ZXIuCj4K
PiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpcyBpbnRyb2R1Y2VkIHRoZXJlZm9yZS4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBrZXJuZWwub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2Ns
ay9zcGFjZW1pdC9jY3VfY29tbW9uLmMgfCAxMiArKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Nsay9zcGFjZW1pdC9jY3VfY29tbW9uLmMgYi9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3Vf
Y29tbW9uLmMKPiBpbmRleCA4Njk2YmI5Y2JhMmQuLjU2ZjNkMDgxODU3ZSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2Nsay9zcGFjZW1pdC9jY3VfY29tbW9uLmMKPiArKysgYi9kcml2ZXJzL2Nsay9z
cGFjZW1pdC9jY3VfY29tbW9uLmMKPiBAQCAtNzksMTYgKzc5LDE2IEBAIHN0YXRpYyB2b2lkIHNw
YWNlbWl0X2FkZXZfdW5yZWdpc3Rlcih2b2lkICpkYXRhKQo+ICAgICAgICAgYXV4aWxpYXJ5X2Rl
dmljZV91bmluaXQoYWRldik7Cj4gIH0KPgo+IC1zdGF0aWMgaW50IHNwYWNlbWl0X2NjdV9yZXNl
dF9yZWdpc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gK3N0YXRpYyBpbnQgc3BhY2VtaXRfY2N1
X2F1eF9yZWdpc3RlcihzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwLAo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKnJlc2V0X25hbWUpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbmFtZSkKPiAgewo+
ICAgICAgICAgc3RydWN0IHNwYWNlbWl0X2NjdV9hZGV2ICpjYWRldjsKPiAgICAgICAgIHN0cnVj
dCBhdXhpbGlhcnlfZGV2aWNlICphZGV2Owo+ICAgICAgICAgaW50IHJldDsKPgo+IC0gICAgICAg
LyogTm90aGluZyB0byBkbyBpZiB0aGUgQ0NVIGRvZXMgbm90IGltcGxlbWVudCBhIHJlc2V0IGNv
bnRyb2xsZXIgKi8KPiAtICAgICAgIGlmICghcmVzZXRfbmFtZSkKPiArICAgICAgIC8qIE5vdGhp
bmcgdG8gZG8gaWYgdGhlIENDVSBkb2VzIG5vdCBpbXBsZW1lbnQgYSByZXNldC9wbSBjb250cm9s
bGVyICovCj4gKyAgICAgICBpZiAoIW5hbWUpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+
Cj4gICAgICAgICBjYWRldiA9IGt6YWxsb2Nfb2JqKCpjYWRldik7Cj4gQEAgLTk4LDcgKzk4LDcg
QEAgc3RhdGljIGludCBzcGFjZW1pdF9jY3VfcmVzZXRfcmVnaXN0ZXIoc3RydWN0IGRldmljZSAq
ZGV2LAo+ICAgICAgICAgY2FkZXYtPnJlZ21hcCA9IHJlZ21hcDsKPgo+ICAgICAgICAgYWRldiA9
ICZjYWRldi0+YWRldjsKPiAtICAgICAgIGFkZXYtPm5hbWUgPSByZXNldF9uYW1lOwo+ICsgICAg
ICAgYWRldi0+bmFtZSA9IG5hbWU7Cj4gICAgICAgICBhZGV2LT5kZXYucGFyZW50ID0gZGV2Owo+
ICAgICAgICAgYWRldi0+ZGV2LnJlbGVhc2UgPSBzcGFjZW1pdF9jYWRldl9yZWxlYXNlOwo+ICAg
ICAgICAgYWRldi0+ZGV2Lm9mX25vZGUgPSBkZXYtPm9mX25vZGU7Cj4gQEAgLTE2NSw3ICsxNjUs
NyBAQCBpbnQgc3BhY2VtaXRfY2N1X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYs
IGNvbnN0IGNoYXIgKmNvbXBhdCkKPiAgICAgICAgIGlmIChyZXQpCj4gICAgICAgICAgICAgICAg
IHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIGNsb2Nr
c1xuIik7Cj4KPiAtICAgICAgIHJldCA9IHNwYWNlbWl0X2NjdV9yZXNldF9yZWdpc3RlcihkZXYs
IGJhc2VfcmVnbWFwLCBkYXRhLT5yZXNldF9uYW1lKTsKPiArICAgICAgIHJldCA9IHNwYWNlbWl0
X2NjdV9hdXhfcmVnaXN0ZXIoZGV2LCBiYXNlX3JlZ21hcCwgZGF0YS0+cmVzZXRfbmFtZSk7Cj4g
ICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShk
ZXYsIHJldCwgImZhaWxlZCB0byByZWdpc3RlciByZXNldHNcbiIpOwo+Cj4KPiAtLQo+IDIuNTYu
MAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
