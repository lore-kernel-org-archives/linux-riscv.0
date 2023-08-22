Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEDDEE4993
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nY/6/GRx/2Q5IenBZYam5y/gCmbf/aNAQxib6Z9Qa38=; b=bRBSZ5taeSy0h5
	6C5edhJ2G4CEb+xKxhnZj7TdVQGkJnW6pKqxmg6hFPNU9sW2dKoBeTxSpuNh1ENbHd1sjGsl++WJ+
	LFsvlJxN46cTxEuwBKgrbPRbdXLTasV0ZPtOdpsG9GiPoZQQMidYl6FFfnxH2hP8ML6k5cjoh3IxP
	ljnhN53OjKuybhmFHH8WIM3rzLlkXGVOwIf1kchahkyZvYHvkuUBrc3DV25zd0ytCN+lRhJ7SbBZQ
	B7tXlzCIAyizlaxmDayIDRQ9IH9mE2qaZ8UR7cIyWAUJKyhNcFWkqNjipIdF24gn03SzEgXzp4Tji
	F00DQwAUjApyKGskpMdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYNVt-00FXW0-11;
	Tue, 22 Aug 2023 09:17:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYNVq-00FXVL-0J
	for linux-riscv@lists.infradead.org;
	Tue, 22 Aug 2023 09:17:24 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99d937b83efso544959166b.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Aug 2023 02:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1692695838; x=1693300638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CWoG7qRKl6509z+iJcRCAg2R0UyuGwnsqPdw/VQlf8=;
        b=dDq3dcvsvTrkw8/fTjwFtJVU4wCg0C0KBDymZYe3rP6YCK+rEG8TzF5WjW8twjm7kE
         mDg4Ozm0gJ0SMY217KSmOWmua63FKrcppJ+d8ihWM5KizM4jBzb/yf337O6ADCxdM/kc
         ZvMV/czt73eHwYJrFfQftwmMdlmr1lkVOL38wFwxSGI+QUsenerFQ9JTxlV5djvGxGMH
         aW2sXu57HD+9kk4AOY/EH+ojEA/qKE3j42RTnUF4SMicGWIGxBYQJjbq4Ps8ofbefQHM
         yfB42oO0rcdAUCVteDvwyNbER7r34QSQCIyuULnmd1Sq26m6dNfWkWuJEYA9BoREmDmz
         ughA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692695838; x=1693300638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CWoG7qRKl6509z+iJcRCAg2R0UyuGwnsqPdw/VQlf8=;
        b=Ygz8i/BXMnb5J3uRpobjPAHqOByfMHMxEYcU6OP148hBWcM1DtTToheKmEnPChFQh+
         fYL76GHAOAvaXB0F+QKMVS1kRYrKL3DbXLtDYrkKK1jhjUtk7dqsNttTf2srpzC1KBk9
         ghTkTotQFm7ETnCnG3+QLABro2t3ZUO6YvY1JZVcFYtbC0XnquBcMQ53akTZQUUk5ifb
         c2yLX0GzZQ+ybLA0PBTQf0GPHWI/Nln8HBfHgyt/BTPEX3+q08Qh5w7dwBaWGQVLJm4d
         iQGgM5Ri63plHbrVvklpaJmAQmrC3m7mxkKG4ylnjXTIGvI8DiwpafNGlt9Mr9QqCy2n
         /FFQ==
X-Gm-Message-State: AOJu0YzsWVhKSZoHV2TsUUgmLlLTVHftFJxQTV1u86spXJ594KW+2dkL
	IEsk70Q9kms2y/PS95B4fTP1wiCTU5s7Nvc1q399rA==
X-Google-Smtp-Source: AGHT+IHxPQErliFw+rDoGut7BPctC5862/YdpkZCfUimLQfKm6GTLGZRh4PuERYr+rzciy17JW5MeeQkK65KyJNX52c=
X-Received: by 2002:a17:906:748a:b0:9a1:697e:4bb7 with SMTP id
 e10-20020a170906748a00b009a1697e4bb7mr7276530ejl.73.1692695837666; Tue, 22
 Aug 2023 02:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230822054739.33552-1-nick.hu@sifive.com> <CAAhSdy32DYoHpBKS3TF1SapM5fuMF5K00oqRxw8JF05v=DrUuw@mail.gmail.com>
 <CAKddAkDohdZqhjZKSawTg5NLMs0AXkL9SyYQr1q6vM1vm4Csfw@mail.gmail.com>
In-Reply-To: <CAKddAkDohdZqhjZKSawTg5NLMs0AXkL9SyYQr1q6vM1vm4Csfw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Aug 2023 14:47:06 +0530
Message-ID: <CAAhSdy0Yt-xcDYWz9BJCUgErpC2xM97yMXw4Wto078DKNk1nUg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: suspend: Add syscore ops for suspend
To: Nick Hu <nick.hu@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	leyfoon.tan@starfivetech.com, mason.huo@starfivetech.com, 
	conor.dooley@microchip.com, jeeheng.sia@starfivetech.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	zong.li@sifive.com, Andy Chiu <andy.chiu@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_021722_373667_6E776D67 
X-CRM114-Status: GOOD (  28.87  )
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

T24gVHVlLCBBdWcgMjIsIDIwMjMgYXQgMToyOOKAr1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwCj4KPgo+IE9uIFR1ZSwgQXVnIDIyLCAyMDIzIGF0IDI6
MTbigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+Cj4gPiBP
biBUdWUsIEF1ZyAyMiwgMjAyMyBhdCAxMToxN+KAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IElmIGEgdGFzayBpcyB0aGUgb25lIHdobyBwZXJmb3Jt
cyB0aGUgc3VzcGVuZCBmbG93IGFuZCBpdCBhbHNvIGRvIHNvbWUKPiA+ID4gZmxvYXRpbmcgb3Ig
dmVjdG9yIG9wZXJhdGlvbnMgYmVmb3JlIHRoZSBzdXNwZW5kLCB3ZSBtaWdodCBsb3NlIHRoZSBG
UFUKPiA+ID4gYW5kIHZlY3RvciBzdGF0ZXMgd2hlbiBpdCBnb2VzIHRvIHRoZSBub24tcmV0ZW50
aW9uIHN5c3RlbSBzdXNwZW5kIHN0YXRlLgo+ID4gPiBBZGQgc3lzY29yZSBvcHMgdG8gc2F2ZSBh
bmQgcmVzdG9yZSB0aGUgRlBVIGFuZCB2ZWN0b3Igc3RhdGVzIG9mIHRoZQo+ID4gPiBjdXJyZW50
IHRhc2sgdG8gZml4IHRoZSBpc3N1ZSBhYm92ZS4KPiA+Cj4gPiBUaGlzIG9ubHkgYXBwbGllcyB0
byBub24tcmV0ZW50aXZlIHN5c3RlbSBzdXNwZW5kIHNvIHdoeSBkbyB3ZSBuZWVkCj4gPiB0aGlz
IGJlZm9yZSBTQkkgc3lzdGVtIHN1c3BlbmQgaXMgbWVyZ2VkID8KPiA+Cj4gPiBSZWdhcmRzLAo+
ID4gQW51cAo+ID4KPiA+Cj4gSG93IGFib3V0IGhpYmVybmF0aW9uPwoKSWYgdGhpcyBpcyBmb3Ig
aGliZXJuYXRpb24gdGhlbiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIHNob3VsZCBzYXkgc28uCgpB
ZGRpbmcgc3lzY29yZV9vcHMgd291bGQgbWVhbiB0aGVzZSBjYWxsYmFja3Mgd2lsbCBiZSBjYWxs
ZWQgZm9yCmJvdGggc3VzcGVuZC10by1yYW0gYW5kIGhpYmVybmF0ZSBjYXNlcy4gT3RoZXIgYXJj
aGl0ZWN0dXJlcyBkb24ndApoYXZlIHRoaXMgc2F2ZS9yZXN0b3JlIGZvciBzdXNwZW5kLXRvLXJh
bSBiZWNhdXNlIGl0IGlzIGdlbmVyYWxseQpjYWxsZWQgZnJvbSBpZGxlIHRhc2suCgpXaHkgbm90
IGRvIHRoZSBzYXZlL3Jlc3RvcmUgaW4gc2F2ZV9wcm9jZXNzb3Jfc3RhdGUoKSBhbmQKcmVzdG9y
ZV9wcm9jZXNzb3Jfc3RhdGUoKSBqdXN0IGxpa2UgYXJjaC9taXBzL3Bvd2VyL2NwdS5jID8KClJl
Z2FyZHMsCkFudXAKCgo+Cj4gUmVnYXJkcywKPiBOaWNrCj4gPiA+Cj4gPiA+IENvLWRldmVsb3Bl
ZC1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTog
TmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+ID4gPiAtLS0KPiA+ID4gQ2hhbmdlcyBpbiB2
MjoKPiA+ID4gYSkgQWRkIENvLWRldmVsb3BlZC1ieSBhbmQgYWRqdXN0IHRoZSBvcmRlciBvZiBz
aWduZWQtb2ZmCj4gPiA+IGIpIFJlcGhyYXNlIHRoZSBjb21taXQgbWVzc2FnZQo+ID4gPgo+ID4g
PiAgYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKykK
PiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYwo+ID4gPiBpbmRleCAzYzg5YjhlYzY5YzQuLmZmNjlm
ZjhhMTk3NCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3VzcGVuZC5jCj4g
PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N1c3BlbmQuYwo+ID4gPiBAQCAtNCw5ICs0LDE0
IEBACj4gPiA+ICAgKiBDb3B5cmlnaHQgKGMpIDIwMjIgVmVudGFuYSBNaWNybyBTeXN0ZW1zIElu
Yy4KPiA+ID4gICAqLwo+ID4gPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2NwdV9wbS5oPgo+ID4g
PiAgI2luY2x1ZGUgPGxpbnV4L2Z0cmFjZS5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3RocmVh
ZF9pbmZvLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvc3lzY29yZV9vcHMuaD4KPiA+ID4gICNp
bmNsdWRlIDxhc20vY3NyLmg+Cj4gPiA+ICAjaW5jbHVkZSA8YXNtL3N1c3BlbmQuaD4KPiA+ID4g
KyNpbmNsdWRlIDxhc20vc3dpdGNoX3RvLmg+Cj4gPiA+ICsjaW5jbHVkZSA8YXNtL3ZlY3Rvci5o
Pgo+ID4gPgo+ID4gPiAgdm9pZCBzdXNwZW5kX3NhdmVfY3NycyhzdHJ1Y3Qgc3VzcGVuZF9jb250
ZXh0ICpjb250ZXh0KQo+ID4gPiAgewo+ID4gPiBAQCAtODUsMyArOTAsNDMgQEAgaW50IGNwdV9z
dXNwZW5kKHVuc2lnbmVkIGxvbmcgYXJnLAo+ID4gPgo+ID4gPiAgICAgICAgIHJldHVybiByYzsK
PiA+ID4gIH0KPiA+ID4gKwo+ID4gPiArc3RhdGljIGludCByaXNjdl9jcHVfc3VzcGVuZCh2b2lk
KQo+ID4gPiArewo+ID4gPiArICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqY3VyX3Rhc2sgPSBn
ZXRfY3VycmVudCgpOwo+ID4gPiArICAgICAgIHN0cnVjdCBwdF9yZWdzICpyZWdzID0gdGFza19w
dF9yZWdzKGN1cl90YXNrKTsKPiA+ID4gKwo+ID4gPiArICAgICAgIGlmIChoYXNfZnB1KCkpIHsK
PiA+ID4gKyAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShyZWdzLT5zdGF0dXMgJiBTUl9TRCkp
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGZzdGF0ZV9zYXZlKGN1cl90YXNrLCByZWdz
KTsKPiA+ID4gKyAgICAgICB9Cj4gPiA+ICsgICAgICAgaWYgKGhhc192ZWN0b3IoKSkgewo+ID4g
PiArICAgICAgICAgICAgICAgaWYgKHVubGlrZWx5KHJlZ3MtPnN0YXR1cyAmIFNSX1NEKSkKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmlzY3Zfdl92c3RhdGVfc2F2ZShjdXJfdGFzaywg
cmVncyk7Cj4gPiA+ICsgICAgICAgfQo+ID4gPiArCj4gPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4g
PiA+ICt9Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyB2b2lkIHJpc2N2X2NwdV9yZXN1bWUodm9pZCkK
PiA+ID4gK3sKPiA+ID4gKyAgICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKmN1cl90YXNrID0gZ2V0
X2N1cnJlbnQoKTsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncyA9IHRhc2tfcHRf
cmVncyhjdXJfdGFzayk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpZiAoaGFzX2ZwdSgpKQo+ID4g
PiArICAgICAgICAgICAgICAgZnN0YXRlX3Jlc3RvcmUoY3VyX3Rhc2ssIHJlZ3MpOwo+ID4gPiAr
ICAgICAgIGlmIChoYXNfdmVjdG9yKCkpCj4gPiA+ICsgICAgICAgICAgICAgICByaXNjdl92X3Zz
dGF0ZV9yZXN0b3JlKGN1cl90YXNrLCByZWdzKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3Rh
dGljIHN0cnVjdCBzeXNjb3JlX29wcyByaXNjdl9jcHVfc3lzY29yZV9vcHMgPSB7Cj4gPiA+ICsg
ICAgICAgLnN1c3BlbmQgICAgICAgID0gcmlzY3ZfY3B1X3N1c3BlbmQsCj4gPiA+ICsgICAgICAg
LnJlc3VtZSAgICAgICAgID0gcmlzY3ZfY3B1X3Jlc3VtZSwKPiA+ID4gK307Cj4gPiA+ICsKPiA+
ID4gK3N0YXRpYyBpbnQgX19pbml0IHJpc2N2X2NwdV9zdXNwZW5kX2luaXQodm9pZCkKPiA+ID4g
K3sKPiA+ID4gKyAgICAgICByZWdpc3Rlcl9zeXNjb3JlX29wcygmcmlzY3ZfY3B1X3N5c2NvcmVf
b3BzKTsKPiA+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ID4gK30KPiA+ID4gK2FyY2hfaW5pdGNh
bGwocmlzY3ZfY3B1X3N1c3BlbmRfaW5pdCk7Cj4gPiA+IC0tCj4gPiA+IDIuMzQuMQo+ID4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
