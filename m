Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14480C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Dec 2021 22:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSiIA0hVa7POMfUHMppem9bxdzqOubUSq5QWogLINeQ=; b=4ou15F/XgYoP93
	+r0a2ik4xh8MVyml4HZluRVVYCN4DoobmnzjtoDTfjHhI5NOGDNMe0X+2hDMNkL7EIS/9EVXqkRe1
	qg9QNDO7v+IoRDofb1CRtlHa9V0CID2Fx47rfrH+4aVU8A8JKFPbzTm4dJt6uQ9skuBOn8EzIWgOu
	fYP+0n9Gb7iMh+LjeAiRQhhF/T7xCYZc4vga8otRDXStx5Iivcdhnhoi0RpYbcWftRdEdXqGFKbo4
	H36+pVv3QongCZWWo86g9yIGVUfa6OByEE1q7dauTAMr5T3gS2DqYjulU1Xy2Hk+lKtf9h6ea4CKz
	wHiv2pDuqOqqhYo0kg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mz4S4-00HAq7-5P; Sun, 19 Dec 2021 22:14:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mz4S0-00HAou-Pm
 for linux-riscv@lists.infradead.org; Sun, 19 Dec 2021 22:14:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 50356B80DD8
 for <linux-riscv@lists.infradead.org>; Sun, 19 Dec 2021 22:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A92FC36AEF
 for <linux-riscv@lists.infradead.org>; Sun, 19 Dec 2021 22:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639952076;
 bh=HP6D72vHsJz+3SuMHStuOjCwZz6yni1egGdsYKfvtq4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iiCliS8rlxSpK7ZSKsMXG5TOY01duolI0vZcIKl1SnkM6nRqvR/2jPddBn/7+AeXx
 Smcf+kaWWG1xMUhj1vntFKglBvJb7JH6RHuDweKnoGmVDcCprb9FNVEECdWveW20Is
 DylQo4hVwC9jVPap/qNpI+Tpp1oL0wcTckOP934LMeePVAdaetWgW+FV291lgczbqH
 QGrwIELRQOTuLoDqg4fppCrF9gq5k7GGww1J734rS+sMsLlBygntCDhQlXgy3U4QuW
 F1Svn+JnrqmCD6eXLblQdaQso/sSe0Py44/PeSMtOaX/dDQQbVEnCNnrRzj0uin86y
 /nuwlHKioUF0Q==
Received: by mail-ed1-f45.google.com with SMTP id x15so30961770edv.1
 for <linux-riscv@lists.infradead.org>; Sun, 19 Dec 2021 14:14:36 -0800 (PST)
X-Gm-Message-State: AOAM532hPUV8iJhrSH7wq2D8mvnruNGh9PYqNgpeARQpgPXgdC5pMzIP
 FxTe75ZL/oHZvRN5AczqIpSglmUQMOxLFGHY8Q==
X-Google-Smtp-Source: ABdhPJzjQht3KyJniv0l0LSkFmt4saIEjVinWkcMnkDmDIZzEJnLyrHD6/sdsWN5qF36bqcU9AjNEi3K1AM91x8jBB0=
X-Received: by 2002:a17:906:229b:: with SMTP id
 p27mr10683673eja.264.1639952074754; 
 Sun, 19 Dec 2021 14:14:34 -0800 (PST)
MIME-Version: 1.0
References: <mhng-854afd5f-800b-4b58-af68-cdc6afdc0a4a@palmer-ri-x1c9>
 <5471232.RFuYXYORHR@diego>
In-Reply-To: <5471232.RFuYXYORHR@diego>
From: Rob Herring <robh+dt@kernel.org>
Date: Sun, 19 Dec 2021 16:14:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKWZL42A8G4y3J3uyC5n+Md70rnJjZz2Tt8eJkSPPuAPw@mail.gmail.com>
Message-ID: <CAL_JsqKWZL42A8G4y3J3uyC5n+Md70rnJjZz2Tt8eJkSPPuAPw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: sifive unmatched: Expose the FU740
 core supply regulator
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Vincent Pelletier <plr.vincent@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 qiuwenbo@kylinos.com.cn, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_141441_254163_44777488 
X-CRM114-Status: GOOD (  19.81  )
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

T24gU3VuLCBEZWMgMTksIDIwMjEgYXQgMzo1NyBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEFtIEZyZWl0YWcsIDE3LiBEZXplbWJlciAyMDIxLCAwNjozNTow
MCBDRVQgc2NocmllYiBQYWxtZXIgRGFiYmVsdDoKPiA+IE9uIEZyaSwgMTkgTm92IDIwMjEgMTQ6
NTU6NDAgUFNUICgtMDgwMCksIHBsci52aW5jZW50QGdtYWlsLmNvbSB3cm90ZToKPiA+ID4gUHJv
dmlkZXMgbW9uaXRvcmluZyBvZiBjb3JlIHZvbHRhZ2UgYW5kIGN1cnJlbnQ6Cj4gPiA+IHRwczU0
NGIyMC1pMmMtMC0xZQo+ID4gPiBBZGFwdGVyOiBpMmMtb2NvcmVzCj4gPiA+IHZvdXQxOiAgICAg
ICA5MDYuMDAgbVYKPiA+ID4gdGVtcDE6ICAgICAgICAtNDAuMMKwQyAgKGhpZ2ggPSArMTI1LjDC
sEMsIGNyaXQgPSArMTUwLjDCsEMpCj4gPiA+IGlvdXQxOiAgICAgICAgIDUuMDYgQSAgKG1heCA9
ICsyMC4wMCBBLCBjcml0IG1heCA9ICsyNi4wMCBBKQo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBWaW5jZW50IFBlbGxldGllciA8cGxyLnZpbmNlbnRAZ21haWwuY29tPgo+ID4gPgo+ID4gPiAt
LS0KPiA+ID4gTm90ZTogY2hlY2twYXRjaC5wbCBjb21wbGFpbnMgYWJvdXQgdW5kb2N1bWVudGVk
IGRldmljZXRyZWUgYmluZGluZywKPiA+ID4gd2hpY2ggaXMgZml4ZWQgYnk6Cj4gPiA+ICAgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS8yMDIxMTExNjExMDIwNy42ODQ5
NC0xLWtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNvbS9ULyN1Cj4gPiA+Cj4gPiA+IENo
YW5nZXMgc2luY2UgdjI6Cj4gPiA+IC0gRml4IGVuZC1vZi1jb21taXQtbWVzc2FnZSBzZXBhcmF0
b3Igc28gY2hhbmdlIGxpc3RzIGRvIG5vdCBlbmQgdXAgaW4gdGhlbS4KPiA+ID4gQ2hhbmdlcyBz
aW5jZSB2MToKPiA+ID4gLSBBZGRlZCBtaXNzaW5nICJ0aSwiIHByZWZpeCBpbiBjb21wYXRpYmxl
IHN0cmluZy4KPiA+ID4gLSBSZW1vdmUgdHJhaWxpbmcgIi4iIG9uIHN1YmplY3QgbGluZS4KPiA+
ID4gLSBSZW5hbWUgdHJlZSBub2RlLgo+ID4KPiA+IEkgc2VlIHRoaXMgaW4gUm9iJ3MgZm9yLW5l
eHQgYXMgNzYxZGU3OWFkYzJjICgiZHQtYmluZGluZ3M6IGh3bW9uOiBhZGQKPiA+IFRJIERDLURD
IGNvbnZlcnRlcnMiKSwgc28gSSdtIGdvaW5nIHRvIGhvbGQgb2ZmIG9uIHRoaXMgb25lIHVudGls
IHRoZQo+ID4gYmluZGluZ3MgbGFuZC4KPgo+IENhbid0IHRoaXMgcGF0Y2ggdGhlbiBzaW1wbHkg
Z28gaW50byB5b3VyIGZvci1uZXh0IGJyYW5jaCB0aGVuPwoKWWVzLgoKPiBUaGUgc3BsaXQgaXMg
bW9zdCB0aW1lcyBiaW5kaW5nIGdvZXMgdGhyb3VnaCB0aGUgZHJpdmVyLXRyZWUKPiAob3IgUm9i
J3MgZHQgdHJlZSkgYW5kIHRoZSBkdHMgcGF0Y2ggdGhyb3VnaCBhbiBhcmNoIG9yIHNvYyB0cmVl
Lgo+Cj4gQnV0IGluIGdlbmVyYWwgb25jZSBhIG1haW50YWluZXIgYWNjZXB0cyB0aGUgYmluZGlu
ZyBpdCBpcyBvawo+IHRvIGFsc28gYXBwbHkgdGhlIGR0cyBwYXRjaCBmb3IgdGhlIHNhbWUgY3lj
bGUgKGFrYSBtZXJnZSB3aW5kb3cpCj4gdGhlIGJpbmRpbmcgd2lsbCBiZSBpbi4KClVudGlsIHRo
ZXJlJ3MgaXNzdWVzIHdpdGggc2NoZW1hIHdhcm5pbmdzIHNob3dpbmcgdXAgaW4gc3BlY2lmaWMK
YnJhbmNoZXMsIGdvaW5nIHRocnUgZGlmZmVyZW50IHRyZWVzIGlzbid0IGFuIGlzc3VlLiBUaGVy
ZSdzIGEgbG90IG9mCndhcm5pbmdzIHRvIGZpeCBmaXJzdC4KClJvYgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
