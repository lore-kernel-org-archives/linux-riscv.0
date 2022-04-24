Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584DEC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Apr 2022 08:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cluynx8Uf5+HTMLMV46atCbzxBIOS7zijaKx4xAWOh4=; b=unK2RV3QYh+rBg
	FMkxsVzxjn4pDDH6+5a1tXLSEtVArVAXgeVAczZT3uG56/tti12MVXW7EJvZ6YvCRNGXimw/6qug1
	vk8eAle8wSsWW6I/OwiawRZp5+UGG2F9hCAhsCm1jh0zVQyCXAOrEm2v6xnT+oHDj1ICX4ik8a3YT
	nR4bW+5FwQZI8usMj/tbmG2GQMPegKYaUV91zoDmo/3pUiWQu8/NYQZblYo9GPGn25qExuYS21AaO
	iER7aUlwbPFxM2zzdyFjW8PyuBzrV7FPkVXL+DA3wu6F7P2BzGd/XIAKWuI/mp81u+gjcpM9vMMHP
	OICLtKiszTGqG+JG3Qjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niXh4-00693I-VR; Sun, 24 Apr 2022 08:34:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niXh0-00692S-Jn
 for linux-riscv@lists.infradead.org; Sun, 24 Apr 2022 08:34:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D21E76132C
 for <linux-riscv@lists.infradead.org>; Sun, 24 Apr 2022 08:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FAFC385A7
 for <linux-riscv@lists.infradead.org>; Sun, 24 Apr 2022 08:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650789245;
 bh=VBSF6OfCXyq/qFgIFmHw1LXm8G8dn5Qpf0kuDkNzkoY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VyrGb7RmjZ/m3PrgRGTO4hkq23FmuPb4mOhueAxqIIP8Wg8Z2sP1Uv9CiJY4xbpH/
 6dYTbbNkWsvEcSZ/ykCzh/qglPIyGQs8moONruVra4MA/ayS2U6DX8ty+FsLqiEiQG
 xg9XsAR+hzW94aZYPptxWnu7aP9/6WDWCxhS0iGv2aCxWWFZThvbWJYDhlDLVyDRCw
 T+ivvFRsd/FzcKqIrKy71VF+mw55d5rEo0p4xUf/njFTLH3loeLSMwYr9mNWRWUb4t
 OclbAYqcdo3g3mAtn6wzI00pF/UgBB5dMGqEfrCul8PNcajRCd6X+lLPzqGKZ8MBAz
 sWfZNA6sIrzPw==
Received: by mail-vs1-f50.google.com with SMTP id j2so807695vsp.5
 for <linux-riscv@lists.infradead.org>; Sun, 24 Apr 2022 01:34:05 -0700 (PDT)
X-Gm-Message-State: AOAM530bpKVd6xoyurbwXSObJOWPS63kwiUEqRHgPA9sSfoKMFHphQE+
 tp9ppH304UWeS2fQgcS+W26u8zXhMn8Rt1FAHCE=
X-Google-Smtp-Source: ABdhPJwVCdLHAdmPAHqMT9jcEXMpjHlkGiSxCuK7cYlVO2V1eSnQq6vhZMsZjwSaOylGwPAKFZtH+DwvJizy3g0PNn0=
X-Received: by 2002:a67:10c7:0:b0:32c:c621:7d27 with SMTP id
 190-20020a6710c7000000b0032cc6217d27mr228483vsq.59.1650789244202; Sun, 24 Apr
 2022 01:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220412034957.1481088-1-guoren@kernel.org>
 <YlbwOG46mCR8Q5tJ@tardis>
 <CAJF2gTRws6RqKmJHBdKsycWSkFgYna_MocJ+qp3Z9r1v7mQzsg@mail.gmail.com>
 <20220418234137.GA444607@anparri>
In-Reply-To: <20220418234137.GA444607@anparri>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 24 Apr 2022 16:33:53 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSmVa9iKzojvrrQghkzBZao4eQwKBTKQfSPFqSR667bTg@mail.gmail.com>
Message-ID: <CAJF2gTSmVa9iKzojvrrQghkzBZao4eQwKBTKQfSPFqSR667bTg@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] riscv: atomic: Optimize AMO instructions usage
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Daniel Lustig <dlustig@nvidia.com>, 
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_013408_728317_72D9635A 
X-CRM114-Status: GOOD (  16.12  )
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

T24gVHVlLCBBcHIgMTksIDIwMjIgYXQgNzo0MSBBTSBBbmRyZWEgUGFycmkgPHBhcnJpLmFuZHJl
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiA+IFNlZW1zIHRvIG1lIHRoYXQgeW91IGFyZSBiYXNp
Y2FsbHkgcmV2ZXJ0aW5nIDVjZTZjMWYzNTM1Zgo+ID4gPiAoInJpc2N2L2F0b21pYzogU3RyZW5n
dGhlbiBpbXBsZW1lbnRhdGlvbnMgd2l0aCBmZW5jZXMiKS4gVGhhdCBjb21taXQKPiA+ID4gZml4
ZWQgYW4gbWVtb3J5IG9yZGVyaW5nIGlzc3VlLCBjb3VsZCB5b3UgZXhwbGFpbiB3aHkgdGhlIGlz
c3VlIG5vCj4gPiA+IGxvbmdlciBuZWVkcyBhIGZpeD8KPiA+Cj4gPiBJJ20gbm90IHJldmVydGlu
ZyB0aGUgcHJpb3IgcGF0Y2gsIGp1c3Qgb3B0aW1pemluZyBpdC4KPiA+Cj4gPiBJbiBSSVNDLVYg
4oCcQeKAnSBTdGFuZGFyZCBFeHRlbnNpb24gZm9yIEF0b21pYyBJbnN0cnVjdGlvbnMgc3BlYywg
aXQgc2FpZDoKPgo+IFdpdGggcmVmZXJlbmNlIHRvIHRoZSBSSVNDLVYgaGVyZCBzcGVjaWZpY2F0
aW9uIGF0Ogo+Cj4gICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtaXNhLW1hbnVhbC5n
aXQKPgo+IHRoZSBpc3N1ZSwgYmV0dGVyLCBsci1zYy1hcXJsLXBhaXItdnMtZnVsbC1iYXJyaWVy
IHNlZW1zIHRvIF9ubyBsb25nZXJfCj4gbmVlZCBhIGZpeCBzaW5jZSBjb21taXQ6CiAgICAgICAg
ICAgICAgICAgICAgICAgICIwOiAgICAgbHIudyAlMCwgJTJcbiIgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAgICAgIiAgICAgICBibmUgICUwLCAlejMsIDFm
XG4iICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAiICAgICAg
IHNjLncucmwgJTEsICV6NCwgJTJcbiIgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAg
ICAgICAgICAgICIgICAgICAgYm5leiAlMSwgMGJcbiIgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKICAgICAgICAgICAgICAgICAgICAgICAgIiAgICAgICBmZW5jZSBydywgcndcbiIgICAgICAg
ICAgICAgICAgICAgICAgICAgXApBYm92ZSBpcyB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiwg
YW5kIHRoZSBsb2dpYyBpcyBpbiBjb25mbGljdC4gSWYKd2Ugd2FudCBmdWxsLWJhcnJpZXIsIHdl
IHNob3VsZCBpbXBsZW1lbnQgbGlrZSBiZWxvdzoKICAgICAgICAgICAgICAgICAgICAgICAgZmVu
Y2UgcncsIHcKICAgICAgICAgICAgICAgICAgICAgICAgIjA6ICAgICBsci53ICUwLCAlMlxuIiAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAiICAgICAg
IGJuZSAgJTAsICV6MywgMWZcbiIgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAg
ICAgICAgICAgICIgICAgICAgc2MudyAlMSwgJXo0LCAlMlxuIiAgICAgICAgICAgICAgICAgIFwK
ICAgICAgICAgICAgICAgICAgICAgICAgIiAgICAgICBibmV6ICUxLCAwYlxuIiAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAogICAgICAgICAgICAgICAgICAgICAgICAiICAgICAgIGZlbmNlIHJ3
LCByd1xuIiAgICAgICAgICAgICAgICAgICAgICAgICBcCkFib3ZlIHdlIGNvdWxkIGxldCBsci53
ICYgc2MudyBleGVjdXRlZCBmYXN0ZXN0LiBJZiB3ZSB0aGluayAuYXEvLnJsCndvbid0IGFmZmVj
dCBmb3J3YXJkIGd1YXJhbnRlZSwgd2Ugc2hvdWxkIGltcGxlbWVudCBsaWtlIGJlbG93OgogICAg
ICAgICAgICAgICAgICAgICAgICAiMDogICAgIGxyLncgJTAsICUyXG4iICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgICAgICAgICIgICAgICAgYm5lICAlMCwgJXoz
LCAxZlxuIiAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgICAgICAgICAgICAgICAgIiAg
ICAgICBzYy53LmFxcmwgJTEsICV6NCwgJTJcbiIgICAgICAgICAgICAgICAgICBcCiAgICAgICAg
ICAgICAgICAgICAgICAgICIgICAgICAgYm5leiAlMSwgMGJcbiIgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKClVzaW5nIC5hcXJsIGlzIGJldHRlciB0aGFuIHNjLncucmwgKyBmZW5jZSBydywg
cncsIGJlY2F1c2UgbHIvc2MucmwKcGFpciBmb3J3YXJkIGd1YXJhbnRlZSBpcyB0aGUgc2FtZSB3
aXRoIGxyL3N3LmFxcmwgYW5kIG9ubHkgc2MucmwgcGFydAp3b3VsZCBhZmZlY3QgdGhlIHNwZWVk
IG9mIGxyL3NjIHNwZWVkLiBTZWNvbmQsIGl0IGNvdWxkIHJlZHVjZSBvbmUKZmVuY2UgcncsIHJ3
IG92ZXJoZWFkLiBTbyBmb3IgcmlzY3YsIHdlIG5lZWRuJ3QgcHV0IGEgZnVsbC1iYXJyaWVyCmFm
dGVyIHNjIGxpa2UgYXJtNjQgYW5kIHVzZSAuYXFybCBpbnN0ZWFkLgoKPgo+ICAgMDNhNWU3MjJm
YzBmICgiVXBkYXRlcyB0byB0aGUgbWVtb3J5IGNvbnNpc3RlbmN5IG1vZGVsIHNwZWMiKQo+Cj4g
KGhlcmUgYSB0ZW1wbGF0ZSwgdG8gZG91YmxlIGNoZWNrOgo+Cj4gICBodHRwczovL2dpdGh1Yi5j
b20vbGl0bXVzLXRlc3RzL2xpdG11cy10ZXN0cy1yaXNjdi9ibG9iL21hc3Rlci90ZXN0cy9ub24t
bWl4ZWQtc2l6ZS9IQU5EL0xSLVNDLU5PVC1GRU5DRS5saXRtdXMgKQo+Cj4gSSBkZWZlciB0byBE
YW5pZWwvb3RoZXJzIGZvciBhICJiaS1zZWN0aW9uIiBvZiB0aGUgcHJvc2Ugc3BlY2lmaWNhdGlv
bi4KPiA7LSkKPgo+ICAgQW5kcmVhCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCk1MOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
