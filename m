Return-Path: <SRS0=MvPY=LZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E69C11F64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 05:42:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A34361468
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jul 2021 05:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A34361468
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Dijkytuj1CGociOP6k2e+DRxOOvdfucKsoL3K4obfRs=; b=0sY53tkOT15oXLmPKHaH/Ti1zS
	G8KzK8yLd0UcREUiwFZSq4owUGy93OxFf4dcwg/5Bkm4Ay+t5dsT9Va2skT6ZrOPOBl9hEQlLCli7
	z3vGic8zFBJub8XYneSSJiXQ/t9pupRgfgZPZ2HoSxwHppbA7/p77VjKChLFl1s25NB17plqTv3TX
	lTSjEf9RWvJTZZn2IugtGAM+aNFgiITyCzrGoqP19yQ9kzA+Q12SeTqNjBb9L8Afn87BWQE2Y39ZP
	7X06+/KWwqPN9nal90pI6dj1R9JjS9S2v9lWsI9AD2ZeYTCFjaDBhZ6Ype3mavGKqqKXUsykdMVxR
	oyuPg+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lypT2-00GBdw-3u; Thu, 01 Jul 2021 05:42:28 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lypSz-00GBdV-LY
 for linux-riscv@lists.infradead.org; Thu, 01 Jul 2021 05:42:27 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so5257264pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 30 Jun 2021 22:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=TucwKz+v5DlXjwmmM09NetwoftkA7mGQQBXI3b6dl+k=;
 b=Kkm76Z2lV470qVfLtyiUDLmtQKzei2APSV0thxaZrOKiSAhzdzTDzpgblm5sGDRt3o
 CI0hm8v6tY+7Jwvw6YFPRuQkyFM7maNMPlsDY4yqNsxpYMF/3w00QiIIJwbfPgMw4nXR
 RGR+pbYdqeDcqI2vrI9z4XObeIbcXeiEUKM9FSnglLqKSCXHvFN/X1E87Nj5miGh7VSC
 8VFlUCRFgmJxzQfd0W+UDSnDD7k5PQEoqBO06dk2hXrFloh7Dln7zT80qolzcOe1i5tB
 RAbGrCCLfXhbUoDygscLB4ChVwqCH3BcGyMJElvunlqbOA3Y+lKVfG67OhDae1qtRUlg
 SW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=TucwKz+v5DlXjwmmM09NetwoftkA7mGQQBXI3b6dl+k=;
 b=cDQK8qfAqBYrTBeY1cB/4useIOZgbVMZ4FFbeAufr+X0as0DxuccSVu5PU54FBZdbN
 TgnAc+6Fdt81nuGsiPz9mmLRatCqPuiDtittGX4mSgEfuQ6cLkiys/n+NB2MG3tZLeLi
 PeWuu2xX5NOHx4J4iaKYg56+z7UAbF44edO0yUPEohn9IRlqlwbYIwHTmTOasVNetKhb
 KtvEvqEQEiMD5pNYNJaL5+VBXw1wxkPmI3aOEwFnzX9aEVjH9flqd8tDZYPn6pa2kwEK
 QVBtoh/xG1SnwdbZJh8Ry45WdWORbL6TtgQr0w1WKwRsXO9cNKUVkhCujJ+Q2ss9Ja9V
 VWbA==
X-Gm-Message-State: AOAM531DCTAT7zFQj5R8hpD/Gi4q4SWZ4HDxlxRpXSsPMH3nKeQJ5mx9
 QhcEFD13y0F/KH22oFo71ZsAqA==
X-Google-Smtp-Source: ABdhPJzFry+rk3YDXS83UNhrZJ0tdLKvFcOJCxCk7WjA8qJLoODDQpCXWaDL9EydHVYOHi7ol68qhQ==
X-Received: by 2002:a17:902:988f:b029:114:12d2:d548 with SMTP id
 s15-20020a170902988fb029011412d2d548mr35586726plp.73.1625118144478; 
 Wed, 30 Jun 2021 22:42:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m4sm8383520pjv.41.2021.06.30.22.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 22:42:24 -0700 (PDT)
Date: Wed, 30 Jun 2021 22:42:24 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Jun 2021 22:42:22 PDT (-0700)
Subject: Re: [PATCH v6 0/3] Introduce 64b relocatable kernel
In-Reply-To: <8512c6b0-3dff-5485-b5d8-638044594973@ghiti.fr>
CC: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-dd5e2fdf-d349-4114-9cbf-6041e2cd2b27@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_224225_757968_6427C9ED 
X-CRM114-Status: GOOD (  27.34  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxNyBKdW4gMjAyMSAwNjozMzo0OCBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBMZSAxOC8wNS8yMDIxIMOgIDEyOjEyLCBBbGV4YW5kcmUgR2hpdGkgYSDDqWNyaXTC
oDoKPj4gQWZ0ZXIgbXVsdGlwbGUgYXR0ZW1wdHMsIHRoaXMgcGF0Y2hzZXQgaXMgbm93IGJhc2Vk
IG9uIHRoZSBmYWN0IHRoYXQgdGhlCj4+IDY0YiBrZXJuZWwgbWFwcGluZyB3YXMgbW92ZWQgb3V0
c2lkZSB0aGUgbGluZWFyIG1hcHBpbmcuCj4+Cj4+IFRoZSBmaXJzdCBwYXRjaCBhbGxvd3MgdG8g
YnVpbGQgcmVsb2NhdGFibGUga2VybmVscyBidXQgaXMgbm90IHNlbGVjdGVkCj4+IGJ5IGRlZmF1
bHQuIFRoYXQgcGF0Y2ggc2hvdWxkIGVhc2UgS0FTTFIgaW1wbGVtZW50YXRpb24gYSBsb3QuCj4+
IFRoZSBzZWNvbmQgYW5kIHRoaXJkIHBhdGNoZXMgdGFrZSBhZHZhbnRhZ2Ugb2YgYW4gYWxyZWFk
eSBleGlzdGluZyBwb3dlcnBjCj4+IHNjcmlwdCB0aGF0IGNoZWNrcyByZWxvY2F0aW9ucyBhdCBj
b21waWxlLXRpbWUsIGFuZCB1c2VzIGl0IGZvciByaXNjdi4KPgo+IEBQYWxtZXIsIGFueSB0aG91
Z2h0IGFib3V0IHRoYXQ/IFRoZXJlIGFyZSBubyB1c2VycyBmb3Igbm93LCBkbyB5b3Ugd2FudAo+
IHRvIHdhaXQgZm9yIGEgS0FTTFIgaW1wbGVtZW50YXRpb24gdG8gdXNlIGl0IGJlZm9yZSBtZXJn
aW5nIHRoaXM/IElmIHNvLAo+IEkgY2FuIHdvcmsgb24gYSBLQVNMUiBpbXBsZW1lbnRhdGlvbiBi
YXNlZCBvbiBvbGRlciBpbXBsZW1lbnRhdGlvbiBmcm9tCj4gWm9uZy4KClNvcnJ5LCBJIG11c3Qg
aGF2ZSBtaXNzZWQgdGhpcyBwYXRjaCBzZXQgdGhlIGZpcnN0IHRpbWUgdGhyb3VnaC4gIEkgCmRv
bid0IHNlZSBhbnkgcmVhc29uIHRvIHdhaXQgZm9yIEtBU0xSIGJlZm9yZSB0YWtpbmcgc3VwcG9y
dCBmb3IgCnJlbG9jYXRhYmxlIGtlcm5lbHMsIGFzIHJlbG9jYXRhYmxlIGtlcm5lbHNhIGFyZSB1
c2VmdWwgb24gdGhlaXIgb3duLgoKSSdtIG5vdCBzdXJlIEknbGwgaGF2ZSB0aW1lIHRvIGxvb2sg
YXQgdGhpcyBmb3IgdGhpcyBjeWNsZSwgYnV0IEknbGwgdHJ5IAp0byBmaW5kIHNvbWUgdGltZSB0
byBnaXZlbiB0aGF0IGl0IHdhcyBwb3N0ZWQgYSB3aGlsZSBhZ28uCgo+Cj4gVGhhbmtzLAo+Cj4+
Cj4+IFRoaXMgcGF0Y2hzZXQgd2FzIHRlc3RlZCBvbjoKPj4KPj4gKiBrZXJuZWw6Cj4+IC0gcnYz
MjogT0sKPj4gLSBydjY0IHdpdGggUkVMT0NBVEFCTEU6IE9LIGFuZCBjaGVja2VkIHRoYXQgInN1
c3BpY2lvdXMiIHJlbG9jYXRpb25zIGFyZSBjYXVnaHQuCj4+IC0gcnY2NCB3aXRob3V0IFJFTE9D
QVRBQkxFOiBPSwo+PiAtIHBvd2VycGM6IGJ1aWxkIG9ubHkgYW5kIGNoZWNrZWQgdGhhdCAic3Vz
cGljaW91cyIgcmVsb2NhdGlvbnMgYXJlIGNhdWdodC4KPj4KPj4gKiB4aXBrZXJuZWw6Cj4+IC0g
cnYzMjogYnVpbGQgb25seQo+PiAtIHJ2NjQ6IE9LCj4+Cj4+ICogbm9tbXVrZXJuZWw6Cj4+IC0g
cnY2NDogYnVpbGQgb25seQo+Pgo+PiBDaGFuZ2VzIGluIHY2Ogo+PiAgICAqIFJlbW92ZSB0aGUg
a2VybmVsIG1vdmUgdG8gdm1hbGxvYyB6b25lCj4+ICAgICogUmViYXNlZCBvbiB0b3Agb2YgZm9y
LW5leHQKPj4gICAgKiBSZW1vdmUgcmVsb2NhdGFibGUgcHJvcGVydHkgZnJvbSAzMmIga2VybmVs
IGFzIHRoZSBrZXJuZWwgaXMgbWFwcGVkIGluCj4+ICAgICAgdGhlIGxpbmVhciBtYXBwaW5nIGFu
ZCB3b3VsZCB0aGVuIG5lZWQgdG8gYmUgY29waWVkIHBoeXNpY2FsbHkgdG9vCj4+ICAgICogQ09O
RklHX1JFTE9DQVRBQkxFIGRlcGVuZHMgb24gIVhJUF9LRVJORUwKPj4gICAgKiBSZW1vdmUgUmV2
aWV3ZWQtYnkgZnJvbSBmaXJzdCBwYXRjaCBhcyBpdCBjaGFuZ2VkIGEgYml0Cj4+Cj4+IENoYW5n
ZXMgaW4gdjU6Cj4+ICAgICogQWRkICJzdGF0aWMgX19pbml0IiB0byBjcmVhdGVfa2VybmVsX3Bh
Z2VfdGFibGUgZnVuY3Rpb24gYXMgcmVwb3J0ZWQgYnkKPj4gICAgICBLYnVpbGQgdGVzdCByb2Jv
dAo+PiAgICAqIEFkZCByZXZpZXdlZC1ieSBmcm9tIFpvbmcKPj4gICAgKiBSZWJhc2Ugb250byB2
NS43Cj4+Cj4+IENoYW5nZXMgaW4gdjQ6Cj4+ICAgICogRml4IEJQRiByZWdpb24gdGhhdCBvdmVy
bGFwcGVkIHdpdGgga2VybmVsJ3MgYXMgc3VnZ2VzdGVkIGJ5IFpvbmcKPj4gICAgKiBGaXggZW5k
IG9mIG1vZHVsZSByZWdpb24gdGhhdCBjb3VsZCBiZSBsYXJnZXIgdGhhbiAyR0IgYXMgc3VnZ2Vz
dGVkIGJ5IFpvbmcKPj4gICAgKiBGaXggdGhlIHNpemUgb2YgdGhlIHZtIGFyZWEgcmVzZXJ2ZWQg
Zm9yIHRoZSBrZXJuZWwgYXMgd2UgY291bGQgbG9zZQo+PiAgICAgIFBNRF9TSVpFIGlmIHRoZSBz
aXplIHdhcyBhbHJlYWR5IGFsaWduZWQgb24gUE1EX1NJWkUKPj4gICAgKiBTcGxpdCBjb21waWxl
IHRpbWUgcmVsb2NhdGlvbnMgY2hlY2sgcGF0Y2ggaW50byAyIHBhdGNoZXMgYXMgc3VnZ2VzdGVk
IGJ5IEFudXAKPj4gICAgKiBBcHBsaWVkIFJldmlld2VkLWJ5IGZyb20gWm9uZyBhbmQgQW51cAo+
Pgo+PiBDaGFuZ2VzIGluIHYzOgo+PiAgICAqIE1vdmUga2VybmVsIG1hcHBpbmcgdG8gdm1hbGxv
Ywo+Pgo+PiBDaGFuZ2VzIGluIHYyOgo+PiAgICAqIE1ha2UgUkVMT0NBVEFCTEUgZGVwZW5kIG9u
IE1NVSBhcyBzdWdnZXN0ZWQgYnkgQW51cAo+PiAgICAqIFJlbmFtZSBrZXJuZWxfbG9hZF9hZGRy
IGludG8ga2VybmVsX3ZpcnRfYWRkciBhcyBzdWdnZXN0ZWQgYnkgQW51cAo+PiAgICAqIFVzZSBf
X3BhX3N5bWJvbCBpbnN0ZWFkIG9mIF9fcGEsIGFzIHN1Z2dlc3RlZCBieSBab25nCj4+ICAgICog
UmViYXNlZCBvbiB0b3Agb2YgdjUuNi1yYzMKPj4gICAgKiBUZXN0ZWQgd2l0aCBzdjQ4IHBhdGNo
c2V0Cj4+ICAgICogQWRkIFJldmlld2VkL1Rlc3RlZC1ieSBmcm9tIFpvbmcgYW5kIEFudXAKPj4K
Pj4gQWxleGFuZHJlIEdoaXRpICgzKToKPj4gICAgcmlzY3Y6IEludHJvZHVjZSBDT05GSUdfUkVM
T0NBVEFCTEUKPj4gICAgcG93ZXJwYzogTW92ZSBzY3JpcHQgdG8gY2hlY2sgcmVsb2NhdGlvbnMg
YXQgY29tcGlsZSB0aW1lIGluIHNjcmlwdHMvCj4+ICAgIHJpc2N2OiBDaGVjayByZWxvY2F0aW9u
cyBhdCBjb21waWxlIHRpbWUKPj4KPj4gICBhcmNoL3Bvd2VycGMvdG9vbHMvcmVsb2NzX2NoZWNr
LnNoIHwgMTggKystLS0tLS0tLQo+PiAgIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgfCAxMiArKysrKysrCj4+ICAgYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgICAgICAgICAgICB8
ICA1ICsrLQo+PiAgIGFyY2gvcmlzY3YvTWFrZWZpbGUucG9zdGxpbmsgICAgICAgfCAzNiArKysr
KysrKysrKysrKysrKysrKwo+PiAgIGFyY2gvcmlzY3Yva2VybmVsL3ZtbGludXgubGRzLlMgICAg
fCAgNiArKysrCj4+ICAgYXJjaC9yaXNjdi9tbS9NYWtlZmlsZSAgICAgICAgICAgICB8ICA0ICsr
Kwo+PiAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgICAgfCA1MyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0KPj4gICBhcmNoL3Jpc2N2L3Rvb2xzL3JlbG9jc19jaGVjay5z
aCAgIHwgMjYgKysrKysrKysrKysrKysrCj4+ICAgc2NyaXB0cy9yZWxvY3NfY2hlY2suc2ggICAg
ICAgICAgICB8IDIwICsrKysrKysrKysrCj4+ICAgOSBmaWxlcyBjaGFuZ2VkLCAxNjIgaW5zZXJ0
aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlz
Y3YvTWFrZWZpbGUucG9zdGxpbmsKPj4gICBjcmVhdGUgbW9kZSAxMDA3NTUgYXJjaC9yaXNjdi90
b29scy9yZWxvY3NfY2hlY2suc2gKPj4gICBjcmVhdGUgbW9kZSAxMDA3NTUgc2NyaXB0cy9yZWxv
Y3NfY2hlY2suc2gKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
