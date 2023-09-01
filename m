Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E3FCA0FF6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 21:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4RG7pmcZRnYjK3liWZ4otth0cjacP11ykK/bJokfE4=; b=Uk39nQwfKk1dFc
	AxhsTnxE8nzt3HNtYyI60C6tQxJD137OUXoOSmDhzzWIMnLA1aIxR7306IE8BBrKEM350SxeTqsBa
	ekngVil06UBwDvpaKcAynkBzyBOtrfEdMTRKqdTPALooMZsDlNHM5gp+G4KjsogWriSSfRkfFhh1s
	/Mkepj1aHNzN98AixycUB3JKl5unkwenfpX2P1m7ZAtG27fg4fjuDvPLec8TFPCUhAGMWhBuagXss
	on34mQaZ9XH9eO1wnUlc1/r0Zj9tExiovikyiqox3jsDPIFok7uI6Joay6Tker38vAU80NUn7FTHs
	4WRekxcRG8FwGLvgToQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcBSV-000P4s-14;
	Fri, 01 Sep 2023 21:13:39 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcBSR-000P4F-2v
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 21:13:37 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7927f24140eso87302339f.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 14:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693602814; x=1694207614; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrM57ibCVE1vPyfYNR7KfD9pKOSb0WIIoAK4UJ07VUc=;
        b=Eeq5liJAYvggUxB6LMZUxOFq/X9GNM1IxzX4Kax/RyDYKtFIqHqPmVoB/D5BjzcpRL
         kCGxbb7+BbJm7nXyXR3uVpTrS2Z7UW9FPq+q1h5zm9hYuABCYC/OB+8nhxKSWMrEBL0Z
         I4QqJI2koZT7yzEmltomUp/KLoZAOOXRCqrrq9duRU0f+vjSqgKUoAMRKAuQysRsSpcA
         0ZtwVo4gVaYTAHwcVi2Ia1dGD1r6HOeAlvKieOyDzNiRffzPhJnJ0+VVH7uJMcsK2HQU
         s/0e81wFvzWZK0RfUkE1ct9iWQg1U5ClTYMzQcNtZXw2vFE40KlLw3o2C1zVa/wPuo5T
         BKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693602814; x=1694207614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xrM57ibCVE1vPyfYNR7KfD9pKOSb0WIIoAK4UJ07VUc=;
        b=RXt60N52tleWQIPp17r1UdtDEXiV93WBWdfhtCqdTQ53a3zurN70oPCG1WvjUnOKnL
         Tzi5EXrFGmFk/zQWAFgfc2Kqnbsze7wmMSoBr1YZlNonL9p+/3Y3gt/SCHliMA1fv1RF
         0UcoKTSTtmo5TsuCrr01ZhhX2Zs4SK//emHrJ1BL8UD7yYAgEbB3Cp6n3nnTFSLmbMZ/
         OGd9q2aEW6T02zND/2CxzoINGOhUmQUweYneAHgZV4ESVCiF+s3c4evkHQfM+sBeyB0u
         sGDmj7zwdEuMsOcQz+rfHAH4t3ve/jzxkvrB/RP6eBtjJcZHMUvGBAgOT9YIrG+NNddE
         3Ppw==
X-Gm-Message-State: AOJu0Yyr7Yi9SeElqWApI/ya//aZoJe3pSOQWF5wSOmnKA5nzomzvfKV
	syEWUI6e+uHtwEUe1WfLBqvz+b87RmDBzMjH//QUKNTNSUGZLw==
X-Google-Smtp-Source: AGHT+IEwH9jqCPrF4EwMbxbghsphucND1JEWN9TIvBzRB5VYc4FotGYNgxPoBh3Ap/wslpCrq3VZ+EmAXOm+532S1P0=
X-Received: by 2002:a5d:8f94:0:b0:786:7389:51d7 with SMTP id
 l20-20020a5d8f94000000b00786738951d7mr4532869iol.5.1693602814209; Fri, 01 Sep
 2023 14:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <c9da6ffe-7a58-1efa-f625-41d73346d6a2@infradead.org>
In-Reply-To: <c9da6ffe-7a58-1efa-f625-41d73346d6a2@infradead.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 1 Sep 2023 22:12:41 +0100
Message-ID: <CA+V-a8tyUpgDSBrpHBBfWfie4xnR7iKCZben3U5dX1puFu3_1A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Kconfig.errata: Add dependency for RISCV_SBI in
 ERRATA_ANDES config
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_141335_943890_199971CA 
X-CRM114-Status: GOOD (  19.66  )
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

SGkgUmFuZHksCgpPbiBGcmksIFNlcCAxLCAyMDIzIGF0IDk6MjfigK9QTSBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDkvMS8yMyAwNDow
MywgUHJhYmhha2FyIHdyb3RlOgo+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4KPiA+IEFuZGVzIGVycmF0YSB1c2VzIHNi
aV9lY2FsbGwoKSB3aGljaCBpcyBvbmx5IGF2YWlsYWJsZSBpZiBSSVNDVl9TQkkgaXMKPiA+IGVu
YWJsZWQuIFNvIGFkZCBhbiBkZXBlbmRlbmN5IGZvciBSSVNDVl9TQkkgaW4gRVJSQVRBX0FOREVT
IGNvbmZpZyB0bwo+ID4gYXZvaWQgYW55IGJ1aWxkIGZhaWx1cmVzLgo+ID4KPiA+IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+IENsb3NlczogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDgzMTE2MTAuZWM2Ym0yRzgtbGtw
QGludGVsLmNvbS8KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvS2Nv
bmZpZy5lcnJhdGEgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJh
dGEgYi9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhCj4gPiBpbmRleCBiZWU1ZDgzODc2M2IuLjU2
NmJjZWZlYWI1MCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKPiA+
ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKPiA+IEBAIC0yLDcgKzIsNyBAQCBtZW51
ICJDUFUgZXJyYXRhIHNlbGVjdGlvbiIKPiA+Cj4gPiAgY29uZmlnIEVSUkFUQV9BTkRFUwo+ID4g
ICAgICAgYm9vbCAiQW5kZXMgQVg0NU1QIGVycmF0YSIKPiA+IC0gICAgIGRlcGVuZHMgb24gUklT
Q1ZfQUxURVJOQVRJVkUKPiA+ICsgICAgIGRlcGVuZHMgb24gUklTQ1ZfQUxURVJOQVRJVkUgJiYg
UklTQ1ZfU0JJCj4gPiAgICAgICBoZWxwCj4gPiAgICAgICAgIEFsbCBBbmRlcyBlcnJhdGEgS2Nv
bmZpZyBkZXBlbmQgb24gdGhpcyBLY29uZmlnLiBEaXNhYmxpbmcKPiA+ICAgICAgICAgdGhpcyBL
Y29uZmlnIHdpbGwgZGlzYWJsZSBhbGwgQW5kZXMgZXJyYXRhLiBQbGVhc2Ugc2F5ICJZIgo+Cj4K
PiBJJ20gc3RpbGwgc2VlaW5nIGJ1aWxkIHdhcm5pbmdzL2Vycm9ycyBhZnRlciBhcHBseWluZyBh
bGwgMyBSSVNDLVYKPiBLY29uZmlnIHBhdGNoZXMgZnJvbSB0b2RheSAoMjAyMyBTRVAgMDEpLgo+
Cj4gV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgRVJSQVRB
X0FOREVTCj4gICBEZXBlbmRzIG9uIFtuXTogUklTQ1ZfQUxURVJOQVRJVkUgWz15XSAmJiBSSVND
Vl9TQkkgWz1uXQo+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+ICAgLSBBUkNIX1I5QTA3RzA0MyBbPXld
ICYmIFNPQ19SRU5FU0FTIFs9eV0gJiYgUklTQ1YgWz15XQo+Cj4gLi4vYXJjaC9yaXNjdi9lcnJh
dGEvYW5kZXMvZXJyYXRhLmM6IEluIGZ1bmN0aW9uICdheDQ1bXBfaW9jcF9zd193b3JrYXJvdW5k
JzoKPiAuLi9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYzoyOToyMzogZXJyb3I6IHN0
b3JhZ2Ugc2l6ZSBvZiAncmV0JyBpc24ndCBrbm93bgo+ICAgIDI5IHwgICAgICAgICBzdHJ1Y3Qg
c2JpcmV0IHJldDsKPiAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefn4KPiAuLi9hcmNo
L3Jpc2N2L2VycmF0YS9hbmRlcy9lcnJhdGEuYzozNToxNTogZXJyb3I6IGltcGxpY2l0IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uICdzYmlfZWNhbGwnIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uXQo+ICAgIDM1IHwgICAgICAgICByZXQgPSBzYmlfZWNhbGwoQU5ERVNURUNI
X1NCSV9FWFRfQU5ERVMsIEFOREVTX1NCSV9FWFRfSU9DUF9TV19XT1JLQVJPVU5ELAo+ICAgICAg
IHwgICAgICAgICAgICAgICBefn5+fn5+fn4KPiAuLi9hcmNoL3Jpc2N2L2VycmF0YS9hbmRlcy9l
cnJhdGEuYzoyOToyMzogd2FybmluZzogdW51c2VkIHZhcmlhYmxlICdyZXQnIFstV3VudXNlZC12
YXJpYWJsZV0KPiAgICAyOSB8ICAgICAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgXn5+Cj4KPiBBUkNIX1I5QTA3RzA0MyBpbiBkcml2ZXJzL3Nv
Yy9yZW5lc2FzL0tjb25maWcgc2VsZWN0cyBFUlJBVEFfQU5ERVMgYW5kCj4gRVJSQVRBX0FOREVT
X0NNTyBldmVuIHRob3VnaCBSSVNDVl9TQkkgaXMgbm90IHNldC9lbmFibGVkLgo+CgpZb3UgbmVl
ZCB0byBhcHBseSBwYXRjaCBbMV0gYXN3ZWxsLgoKWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMDkwMTExMDkzNi4zMTMxNzEtMS1w
cmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20vCgpDaGVlcnMsClByYWJoYWth
cgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
