Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6415DC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 03:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XInNITewbOHSbrGpgSmPTBxvakW0qkuNHuDAVOLMAc=; b=nzBZP+JZ1VC/Fz
	cL7zXzkNjmwk5GO/kwQ63iiPGK32aYIKHdt5krKHB/D0Ng8pWXD1tde+UKLP/T8d53Ag3f+ikXowp
	pyLrT6jo6I4V6adjwd60SFxXNrHxVOM75W5Tmbg2r5DlcDQtv+vB/yyVj8PYvX97x8pqapW4Nf+oQ
	y7ocdYrv321ErPFufMSpi6Gn62EqVErYSkCTKbTrwxvhzv/ITVXRFHb4Z9zF5C0IRYycaIuNTNNla
	S4g02ce3F6nwPEIbPIU/aRcMAVgmXYVM6y9gCTZGr0kvUqMaogdqpvW7Ov7VlMRky15dpNLI4Ay8d
	7GFpUp7iHVIYGjXZE7lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy2cV-004A0y-Jy; Thu, 24 Nov 2022 03:09:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy2cR-0049xO-FY
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 03:09:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id k7so304695pll.6
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 19:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4p5Gx8CNV7c00YAWsz5Qh2wQkyKnAcz7nfw8EBTc62k=;
        b=cP9pgP63hO9qaGyGyeGTxU5xQXkPubj6XNgjkWNsPQXUySPMG2OqZtxokk9qZoj7cx
         Sole6gn3xGirLEX4eCz8J95YrEHc17tn6K3d7Byo/4+65VSPJjtT9CyCjhxCvWhl58c3
         UUFOjeRRt167P6QaKliNHjIOLhSgZdigI88pXrx/A/7djjWNjrWn/qbsmfl+Q1k/g3G7
         5yfkpsShRMnmNnCOcnCdlwyRLFO9Tx8uEJRzKhfPLCWFW9NZ0euCli1m4Ao+uXvnfcGM
         wXoM9VApm2YvmQr1z9Ohc6ZLhwWZHMnwExYfkTOl3qHLln3HGAi8PjB+CkYwu1Md2rn1
         P75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4p5Gx8CNV7c00YAWsz5Qh2wQkyKnAcz7nfw8EBTc62k=;
        b=KN4CdHP/aOpfjUyeNR+s/6QLaLY3SaBu6kzUJXT704CIp29PlqzC8afGzKoI2kazYP
         7n61KNuYMjuoipzWFfNhJqOUsd9eja3r0TgmXTBJ6QERKHaETLSrQqa/ZiTxt4KBnztU
         khW47YdQ7dnZkdXh5AtmfyIwPH0GgpT2Yt7qPPcaylZWhMiHotOpwOOjI03e19z9FvA/
         3AmwN8mQf/3QHL4AalXruTl9GLAPxdbedOls5BCWv2B5vSzFGnc2eAg/Yy3f3VQaTM3j
         oepVyQwkioSQBJjFcztIk/CM94HrC7QhV4PFbnlKiwgENABK01obDFPpr2pGjR9G5VE3
         NZIw==
X-Gm-Message-State: ANoB5pksBRR4lCcc03iifPJ5v0vwk7WsgVTvko1n3CWed+aWKrAPjhI+
	bo4QRwqUKEV5YcskeEf6dlAAUTX8PZ/0K3u8rqg=
X-Google-Smtp-Source: AA0mqf54dv7umnaUcFN2mCJ1/swrOTVRoadMME8UYKM0s0Co8F4PJtO+MOQJH8/kgFlYuxPFS0ZO/oviZsxgCq8LYuc=
X-Received: by 2002:a17:903:130c:b0:186:85c3:98af with SMTP id
 iy12-20020a170903130c00b0018685c398afmr15165713plb.101.1669259380623; Wed, 23
 Nov 2022 19:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20221123142025.1504030-1-suagrfillet@gmail.com>
 <20221123142025.1504030-2-suagrfillet@gmail.com> <CAJF2gTTwvApRaGhZJxOrdcjWUC9DN-WF_7EKcHXx5HZ9Jkd5EA@mail.gmail.com>
 <CAAYs2=ghhMmmrM4Bktvw9iGiajS5PLd1=Z61j2ZfhbhGUi4ekg@mail.gmail.com>
 <CAJF2gTTgTfGAYTWbqqrdZg9bMjbpQfx8GzFzxoq3C4r9HDpz8Q@mail.gmail.com> <CAAYs2=iJM3d6tqwLjCoE7S1p3JURMYVj54Vry8KiSz1bZakxcA@mail.gmail.com>
In-Reply-To: <CAAYs2=iJM3d6tqwLjCoE7S1p3JURMYVj54Vry8KiSz1bZakxcA@mail.gmail.com>
From: Song Shuai <suagrfillet@gmail.com>
Date: Thu, 24 Nov 2022 03:09:29 +0000
Message-ID: <CAAYs2=gAOHQs2mCHYmjniJ5i8fQS1wNzeMzTx0fW-s3Z0bu_sg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	peterz@infradead.org, jolsa@redhat.com, bp@suse.de, jpoimboe@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_190943_554586_506B1DF4 
X-CRM114-Status: GOOD (  33.46  )
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

U29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiDkuo4yMDIy5bm0MTHmnIgyNOaXpeWR
qOWbmyAwMjo1MuWGmemBk++8mgo+Cj4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IOS6jjIw
MjLlubQxMeaciDI05pel5ZGo5ZubIDAyOjA45YaZ6YGT77yaCj4gPgo+ID4gT24gVGh1LCBOb3Yg
MjQsIDIwMjIgYXQgMToyNyBBTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdy
b3RlOgo+ID4gPgo+ID4gPiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4g5LqOMjAyMuW5tDEx
5pyIMjPml6XlkajkuIkgMjM6MDLlhpnpgZPvvJoKPiA+ID4gPgo+ID4gPiA+IENvb2wgam9iLCB0
aHguCj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIE5vdiAyMywgMjAyMiBhdCAxMDoyMCBQTSBTb25n
IFNodWFpIDxzdWFncmZpbGxldEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Pgo+ID4gPiA+PiBU
aGlzIHBhdGNoIGFkZHMgRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FMTFMgc3VwcG9ydCBm
b3IgUklTQy1WLgo+ID4gPiA+Pgo+ID4gPiA+PiBzZWxlY3QgdGhlIERZTkFNSUNfRlRSQUNFX1dJ
VEhfRElSRUNUX0NBTExTIHRvIHByb3ZpZGUgdGhlCj4gPiA+ID4+IHJlZ2lzdGVyX2Z0cmFjZV9k
aXJlY3RbX211bHRpXSBpbnRlcmZhY2VzIGFsbG93aW5nIHVzZXJzIHRvIHJlZ2lzdGVyCj4gPiA+
ID4+IHRoZSBjdXN0b21lZCB0cmFtcG9saW5lIChkaXJlY3RfY2FsbGVyKSBhcyB0aGUgbWNvdW50
IGZvciBvbmUgb3IKPiA+ID4gPj4gbW9yZSB0YXJnZXQgZnVuY3Rpb25zLiBBbmQgbW9kaWZ5X2Z0
cmFjZV9kaXJlY3RbX211bHRpXSBhcmUgYWxzbwo+ID4gPiA+PiBwcm92aWRlZCBmb3IgbW9kaWZ5
aW5nIGRpcmVjdF9jYWxsZXIuCj4gPiA+ID4+Cj4gPiA+ID4+IFRvIG1ha2UgdGhlIGRpcmVjdF9j
YWxsZXIgYW5kIHRoZSBvdGhlciBmdHJhY2UgaG9va3MgKGVnLiBmdW5jdGlvbi9mZ3JhcGgKPiA+
ID4gPj4gdHJhY2VyLCBrW3JldF1wcm9iZXMpIGNvLWV4aXN0LCBhIHRlbXBvcmFyeSByZWdpc3Rl
ciBpcyBub21pbmF0ZWQgdG8KPiA+ID4gPj4gc3RvcmUgdGhlIGFkZHJlc3Mgb2YgZGlyZWN0X2Nh
bGxlciBpbiBmdHJhY2VfcmVnc19jYWxsZXIuIEFmdGVyIHRoZQo+ID4gPiA+PiBzZXR0aW5nIG9m
IHRoZSBhZGRyZXNzIGRpcmVjdF9jYWxsZXIgYnkgZGlyZWN0X29wcy0+ZnVuYyBhbmQgdGhlCj4g
PiA+ID4+IFJFU1RPUkVfUkVHUyBpbiBmdHJhY2VfcmVnc19jYWxsZXIsIGRpcmVjdF9jYWxsZXIg
d2lsbCBiZSBqdW1wZWQgdG8KPiA+ID4gPj4gYnkgdGhlIGBqcmAgaW5zdC4KPiA+ID4gPj4KPiA+
ID4gPj4gU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+
ID4gPiA+PiAtLS0KPiA+ID4gPj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgfCAx
ICsKPiA+ID4gPj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmggfCA2ICsrKysrKwo+
ID4gPiA+PiAgYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TICB8IDQgKysrKwo+ID4gPiA+
PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gPiA+ID4+Cj4gPiA+ID4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+ID4g
Pj4gaW5kZXggMzllYzhkNjI4Y2Y2Li5kMDgzZWMwOGQwYjYgMTAwNjQ0Cj4gPiA+ID4+IC0tLSBh
L2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiA+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+
ID4gPj4gQEAgLTI3OCw2ICsyNzgsNyBAQCBjb25maWcgQVJDSF9SVjY0SQo+ID4gPiA+PiAgICAg
ICAgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX0lOVDEyOCBpZiBDQ19IQVNfSU5UMTI4Cj4gPiA+ID4+
ICAgICAgICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0UgaWYgIVhJUF9LRVJORUwgJiYgTU1V
ICYmICQoY2Mtb3B0aW9uLC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTgpCj4gPiA+ID4+ICAg
ICAgICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9SRUdTIGlmIEhBVkVfRFlOQU1J
Q19GVFJBQ0UKPiA+ID4gPj4gKyAgICAgICBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRI
X0RJUkVDVF9DQUxMUwo+ID4gPiA+PiAgICAgICAgIHNlbGVjdCBIQVZFX0ZUUkFDRV9NQ09VTlRf
UkVDT1JEIGlmICFYSVBfS0VSTkVMCj4gPiA+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJ
T05fR1JBUEhfVFJBQ0VSCj4gPiA+ID4+ICAgICAgICAgc2VsZWN0IEhBVkVfRlVOQ1RJT05fVFJB
Q0VSIGlmICFYSVBfS0VSTkVMICYmICFQUkVFTVBUSU9OCj4gPiA+ID4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9m
dHJhY2UuaAo+ID4gPiA+PiBpbmRleCAwMWJlYmIyOGVhYmUuLmJlNGQ1NzU2NjEzOSAxMDA2NDQK
PiA+ID4gPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaAo+ID4gPiA+PiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gPiA+ID4+IEBAIC0xMTQsNiAr
MTE0LDEyIEBAIHN0cnVjdCBmdHJhY2VfcmVnczsKPiA+ID4gPj4gIHZvaWQgZnRyYWNlX2dyYXBo
X2Z1bmModW5zaWduZWQgbG9uZyBpcCwgdW5zaWduZWQgbG9uZyBwYXJlbnRfaXAsCj4gPiA+ID4+
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGZ0cmFjZV9vcHMgKm9wLCBzdHJ1Y3QgZnRy
YWNlX3JlZ3MgKmZyZWdzKTsKPiA+ID4gPj4gICNkZWZpbmUgZnRyYWNlX2dyYXBoX2Z1bmMgZnRy
YWNlX2dyYXBoX2Z1bmMKPiA+ID4gPj4gKwo+ID4gPiA+PiArc3RhdGljIGlubGluZSB2b2lkIGFy
Y2hfZnRyYWNlX3NldF9kaXJlY3RfY2FsbGVyKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25l
ZCBsb25nIGFkZHIpCj4gPiA+ID4+ICt7Cj4gPiA+ID4+ICsgICAgICAgICAgICAgICByZWdzLT50
MSA9IGFkZHI7Cj4gPiA+ID4KPiA+ID4gPiBIb3cgYWJvdXQgcmVncy0+dDAgPSBhZGRyOyA/Cj4g
PiA+ID4gQW5kIGRlbGV0ZSBhbGwgbWNvdW50LWR5bi5TIG1vZGlmaWNhdGlvbi4KPiA+ID4gPgo+
ID4gPiBUaGUgZGlyZWN0X2NhbGxlciBoYXMgdGhlIHNhbWUgcHJvZ3JhbSBsYXlvdXQgYXMgdGhl
IGZ0cmFjZV9jYWxsZXIsIHdoaWNoIG1lYW5zCj4gPiA+IHRoZSByZWcgdDAgd2lsbCBuZXZlciBi
ZSBjaGFuZ2VkIHdoZW4gZGlyZWN0X2NhbGxlciByZXR1cm5zLgo+ID4gPgo+ID4gPiBJZiByZWdz
LT50MCBjaGFuZ2VzIGhlcmUgYW5kIGZ0cmFjZV9yZWdzX2NhbGxlciBleGVjdXRlcyBganIgdDBg
LAo+ID4gPiBkaXJlY3RfY2FsbGVyIHdpbGwgZW50ZXIgdGhlIGRlYWQgbG9vcC4KPiA+ID8KPiA+
Cj4gPiBmdHJhY2VfcmVnc19jYWxsZXItPmNhbGxfZGlyZWN0X2Z1bmNzLT4KPiA+IGFyY2hfZnRy
YWNlX3NldF9kaXJlY3RfY2FsbGVyLT4gZnRyYWNlX3JlZ3NfY2FsbGVyIGpyIHQwLgo+ID4KPiA+
IE9ubHkgY2FsbF9kaXJlY3RfZnVuY3MgY2FsbCBhcmNoX2Z0cmFjZV9zZXRfZGlyZWN0X2NhbGxl
ciAhCj4gPgo+ID4gc3RhdGljIHZvaWQgY2FsbF9kaXJlY3RfZnVuY3ModW5zaWduZWQgbG9uZyBp
cCwgdW5zaWduZWQgbG9uZyBwaXAsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgZnRyYWNlX29wcyAqb3BzLCBzdHJ1Y3QgZnRyYWNlX3JlZ3MgKmZyZWdzKQo+ID4gewo+
ID4gICAgICAgICBzdHJ1Y3QgcHRfcmVncyAqcmVncyA9IGZ0cmFjZV9nZXRfcmVncyhmcmVncyk7
Cj4gPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcjsKPiA+Cj4gPiAgICAgICAgIGFkZHIgPSBm
dHJhY2VfZmluZF9yZWNfZGlyZWN0KGlwKTsKPiA+ICAgICAgICAgaWYgKCFhZGRyKQo+ID4gICAg
ICAgICAgICAgICAgIHJldHVybjsKPiA+Cj4gPiAgICAgICAgIGFyY2hfZnRyYWNlX3NldF9kaXJl
Y3RfY2FsbGVyKHJlZ3MsIGFkZHIpOwo+ID4gfQo+ID4KPiBXaGVuIGRpcmVjdF9jYWxsZXIgYW5k
IGZ1bmN0aW9uIHRyYWNlciBjby1ob29rIGEgZnVuY3Rpb24sIHRoZSBzaW1wbGUKPiBkaWFncmFt
IGlzIGxpa2UgdGhpczoKPgo+IGBgYAo+IGZ1bmMgLT4gZnRyYWNlX3JlZ3NfY2FsbGVyIC0+IGFy
Y2hfZnRyYWNlX29wc19saXN0X2Z1bmMgLT4KPiBmdW5jdGlvbl90cmFjZV9jYWxsIC8vIHdyaXRl
IHJpbmdidWZmZXIKPiAgICAgICAgICAgICB8Cj4gICAgICAgICAgICAgICAgICAtPiBjYWxsX2Rp
cmVjdF9mdW5jcyAvLyByZWdzLT50MSA9IGRpcmVjdF9jYWxsZXIKPiAgICAgICAgICAgIC0+IHQx
ICE9MCAmJiBqciB0MSAvLyBnb3RvIGRpcmVjdF9jYWxsZXIKPiBgYGAKPgpgYGAKZiAtLSByZWdz
X2NhbGxlciAtLSBsaXN0X2Z1bmMKICAgIHwgICAgICAgICAgICAgICAgICAgICAgIHwgLS0gZnVu
Y3Rpb25fdHJhY2VfY2FsbAogICAgfCAgICAgICAgICAgICAgICAgICAgICAgfCAtLSBjYWxsX2Rp
cmVjdF9mdW5jcyAgLy8gdDEgPSBhZGRyCiAgICB8LS0gdDEgIT0wICYmIGpyIHQxIC8vIGdvdG8g
ZGlyZWN0X2NhbGxlcgpgYGAKVGhpcyBkaWFncmFtIGxvb2tzIGJldHRlci4KPiBBbmQgdGhlIGRp
cmVjdF9jYWxsZXIgaGFzIGEgc2ltaWxhciBpbXBsZW1lbnQgYXMgZnRyYWNlX2NhbGxlci4KPgo+
IGBgYAo+IGRpcmVjdF9jYWxsZXI6Cj4gYWRkIHNwLHNwLC0/Cj4gc2QgdDAsPyhzcCkKPiBzZCBy
YSw/KHNwKQo+IGNhbGwgZm9vCj4gbGQgdDAsPyhzcCkKPiBsZCByYSw/KHNwKQo+IGFkZCBzcCxz
cCw/Cj4ganIgdDAgLy8gPC0gYmFjayB0byBmdW5jdGlvbiBlbnRyeQo+IGBgYAo+Cj4gSWYgd2Ug
Y2hhbmdlIHJlZ3MtPnQwIGFzIGRpcmVjdF9jYWxsZXIgYW5kIGV4ZWN1dGUgYGpyIHQwYCBkaXJl
Y3RseSwKPiB0aGUgZGlyZWN0X2NhbGxlciB3aWxsIGFsd2F5cyBqdW1wIHRvIGl0c2VsZiBkdWUg
dG8gaXRzIGxhc3QgYGpyYCBpbnN0Lgo+Cj4gYGBgCj4gZnVuYyAtPiBmdHJhY2VfcmVnc19jYWxs
ZXIgLT4gYXJjaF9mdHJhY2Vfb3BzX2xpc3RfZnVuYyAtPgo+IGZ1bmN0aW9uX3RyYWNlX2NhbGwg
Ly8gd3JpdGUgcmluZ2J1ZmZlcgo+ICAgICAgICAgICAgIHwKPiAgICAgICAgICAgICAgICAgIC0+
IGNhbGxfZGlyZWN0X2Z1bmNzIC8vIHJlZ3MtPnQwID0gZGlyZWN0X2NhbGxlcgo+ICAgICAgICAg
ICAgLT4ganIgdDAgLy8gZ290byBkaXJlY3RfY2FsbGVyCj4KPiBkaXJlY3RfY2FsbGVyOgo+IC4u
Lgo+IHNkIHQwLD8oc3ApCj4gLi4uCj4gbGQgdDAsPyhzMCkKPiAuLi4KPiBqciB0MCAvLyBnb3Rv
IGRpcmVjdF9jYWxsZXIgYWx3YXlzCj4gYGBgCj4KPiBIb3BlIEkgbWFkZSBpdCBjbGVhci4KPiA+
ID4KPiA+ID4gQWN0dWFsbHkgdGhlIHJlZyB0MCBhbHdheXMgc2F2ZXMgdGhlIGFkZHJlc3Mgb2Yg
ZnVuY3Rpb24gZW50cnkgd2l0aCA4Qgo+ID4gPiBvZmZzZXQsIGl0IHNob3VsZCBvbmx5Cj4gPiA+
IGNoYW5nZWQgYnkgdGhlIElQTU9ESUZZIG9wcyBpbnN0ZWFkIG9mIHRoZSBkaXJlY3Rfb3BzLgo+
ID4gPiA+Pgo+ID4gPiA+PiArfQo+ID4gPiA+PiArCj4gPiA+ID4+ICAjZW5kaWYgLyogQ09ORklH
X0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyAqLwo+ID4gPiA+Pgo+ID4gPiA+PiAgI2VuZGlmIC8q
IF9fQVNTRU1CTFlfXyAqLwo+ID4gPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
bWNvdW50LWR5bi5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWNvdW50LWR5bi5TCj4gPiA+ID4+IGlu
ZGV4IDQ2NmM2ZWYyMTdiMS4uYjg5Yzg1YTU4NTY5IDEwMDY0NAo+ID4gPiA+PiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMKPiA+ID4gPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvbWNvdW50LWR5bi5TCj4gPiA+ID4+IEBAIC0yMzMsNiArMjMzLDcgQEAgRU5EUFJPQyhmdHJh
Y2VfY2FsbGVyKQo+ID4gPiA+PiAgI2Vsc2UgLyogQ09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhf
UkVHUyAqLwo+ID4gPiA+PiAgRU5UUlkoZnRyYWNlX3JlZ3NfY2FsbGVyKQo+ID4gPiA+PiAgICAg
ICAgIFNBVkVfQUJJX1JFR1MgMQo+ID4gPiA+PiArICAgICAgIFJFR19TICAgeDAsIFBUX1QxKHNw
KQo+ID4gPiA+PiAgICAgICAgIFBSRVBBUkVfQVJHUwo+ID4gPiA+Pgo+ID4gPiA+PiAgZnRyYWNl
X3JlZ3NfY2FsbDoKPiA+ID4gPj4gQEAgLTI0MSw3ICsyNDIsMTAgQEAgZnRyYWNlX3JlZ3NfY2Fs
bDoKPiA+ID4gPj4KPiA+ID4gPj4KPiA+ID4gPj4gICAgICAgICBSRVNUT1JFX0FCSV9SRUdTIDEK
PiA+ID4gPj4gKyAgICAgICBibmV6ICAgIHQxLC5MZGlyZWN0Cj4gPiA+ID4+ICAgICAgICAganIg
dDAKPiA+ID4gPj4gKy5MZGlyZWN0Ogo+ID4gPiA+PiArICAgICAgIGpyIHQxCj4gPiA+ID4+ICBF
TkRQUk9DKGZ0cmFjZV9yZWdzX2NhbGxlcikKPiA+ID4gPj4KPiA+ID4gPj4gIEVOVFJZKGZ0cmFj
ZV9jYWxsZXIpCj4gPiA+ID4+IC0tCj4gPiA+ID4+IDIuMjAuMQo+ID4gPiA+Pgo+ID4gPiA+Cj4g
PiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+IEJlc3QgUmVnYXJkcwo+ID4gPiA+ICBHdW8gUmVuCj4g
Pgo+ID4KPiA+Cj4gPiAtLQo+ID4gQmVzdCBSZWdhcmRzCj4gPiAgR3VvIFJlbgo+IFRoYW5rcywK
PiBTb25nClRoYW5rcywKU29uZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
