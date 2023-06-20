Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058A9EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 20:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjSUSHgN+FocBMxMow/bv+lbeG6GyBq147hvHGmY8bk=; b=0mTSvO5zonACoV
	o5pasO4aUkjS6MMagKmF9bFHHDX7aKaGbeR+/ul7pWGA4dahhwpRCVZNBfERqD/fqWR+tUZu8NEO4
	AxT15dC5oaCiWfmDjZN+eMl0nspvkHHswKQ8LIiWWhhlr3B/cAJKLwAyMEzhKLAdoQ+3YQ3MLbole
	PxpnfeQuA/jcFPyCZhGfzTcCtOClR9i315RdOVbYh3FHfICjAmbnamDhFwAJhWAuN05A5OZqKOh5P
	ecTp5bGLkt30uvesRjILy4F0uFzHlcYjRIA49MOGkfaU6HscQvTAsln4GD8Da4uD0m+iIzQ8dLy4Y
	LqpkRKmF99LMSa9QoJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBiG7-00CKNW-05;
	Tue, 20 Jun 2023 20:47:27 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBiG4-00CKM1-12
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 20:47:25 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-62fe6773c4fso37444976d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 13:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687294039; x=1689886039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rA3i2opblg9AHF1F2rlGv1v4lotXDt+23xIwyDkolDY=;
        b=mo8QWb4ccpQbDOhOajnjX4GpXsPkN6vj8KMB45EVj+cKZ9yB/OmK8Q8efQ55ZiK52z
         kAUSB2YNV6eb6Ss6jDDLA6a/3qyELGXwYF+eb2Q7i1KCtaxQTJ3dj1B3NWIoF7Squ0Ke
         CSHYdQQbTT4oFSDOJAgGkzIY1H8H1YVeiEbxrPo5ye9BlG8awpkWXWhd0JC7gpQxVac9
         9NmEVDglP1v7F+PRA8cx6t8vAVZqHzWIXw1H6bnk9CHvm7EGWjS/V9TEs/eYjXcw3+AL
         QOTiuwMTQZFk2pvbVkwihO44E6CKg1mmFu+0U0yRqsMjeAunPeYLBUXN0mNyY1x3sbX1
         YDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687294039; x=1689886039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rA3i2opblg9AHF1F2rlGv1v4lotXDt+23xIwyDkolDY=;
        b=ZvXEtZyo7I43Kwn98UkNv6ROvH5+pw048dXiBG8G9OHkmTMHQqbM+CVIF64VnuS+71
         +0eHbkfd/IGJcq4AsrM8LYaKqpUszOCzc1MiM1dHDLMRNKub5LAQVZpESO75C+761XAE
         HZO1F7+Wo1EpTq5Yz1h4daD9b4/QNQxHYP7RUNj7mpedvBKlZdhChqIQqiErIJCKE6q+
         UG5EIPtKyr/GHiyiO9+PBIH/dnlcbkBWGcVkR0OfOFTg7gO7zgX+HMAN8Uu+XEkXdSky
         j27dRRT/AIP1iR51UxVe9dPKF7boIsUVTiSdV8scNPY8BLXcOpebpzO74wKkjnLk71G8
         clLA==
X-Gm-Message-State: AC+VfDzRhyl2C9X4H9QSkldHqEWbY83xxWZdfl32K7paQ+Gs6e6FhWI+
	zxYsJBZ6cxjk0m1tghp/t4b+LI+LFEV7uDBfeUtsyw==
X-Google-Smtp-Source: ACHHUZ6UItpw2LPCk1xMc27GiRDBKedo6AyfjmO6DAgYOkoG5EFO12A+M83vVJshZiaOHJI8CRKa8frMLgIu+Nenrlk=
X-Received: by 2002:a05:6214:27cb:b0:626:e55:dfb2 with SMTP id
 ge11-20020a05621427cb00b006260e55dfb2mr15688866qvb.39.1687294039262; Tue, 20
 Jun 2023 13:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdn_U+yjFBn6pq5XwP1rTEKA1MWBkd0f2N8wB_nuS1_sWw@mail.gmail.com>
 <mhng-16f1b957-5cf5-4786-a760-e4ab1fbe83ce@palmer-ri-x1c9a>
In-Reply-To: <mhng-16f1b957-5cf5-4786-a760-e4ab1fbe83ce@palmer-ri-x1c9a>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 20 Jun 2023 16:47:07 -0400
Message-ID: <CAKwvOdm4FLSq41WTzmPqCeNh-WBX1_rtKpT3zwyGez7bZ-jE7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor@kernel.org>, jszhang@kernel.org, llvm@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_134724_361845_4CAAF858 
X-CRM114-Status: GOOD (  28.29  )
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgNDo0MeKAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAyMCBKdW4gMjAyMyAxMzozMjozMiBQRFQg
KC0wNzAwKSwgbmRlc2F1bG5pZXJzQGdvb2dsZS5jb20gd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biAy
MCwgMjAyMyBhdCA0OjEz4oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90
ZToKPiA+Pgo+ID4+IE9uIFR1ZSwgSnVuIDIwLCAyMDIzIGF0IDA0OjA1OjU1UE0gLTA0MDAsIE5p
Y2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4gPj4gPiBPbiBNb24sIEp1biAxOSwgMjAyMyBhdCA2OjA2
4oCvUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4gPj4gPiA+
IE9uIFRodSwgMTUgSnVuIDIwMjMgMDY6NTQ6MzMgUERUICgtMDcwMCksIFBhbG1lciBEYWJiZWx0
IHdyb3RlOgo+ID4+ID4gPiA+IE9uIFdlZCwgMTQgSnVuIDIwMjMgMDk6MjU6NDkgUERUICgtMDcw
MCksIGpzemhhbmdAa2VybmVsLm9yZyB3cm90ZToKPiA+PiA+ID4gPj4gT24gV2VkLCBKdW4gMTQs
IDIwMjMgYXQgMDc6NDk6MTdBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gPj4gPiA+
ID4+PiBPbiBUdWUsIDIzIE1heSAyMDIzIDA5OjU0OjU4IFBEVCAoLTA3MDApLCBqc3poYW5nQGtl
cm5lbC5vcmcgd3JvdGU6Cj4gPj4KPiA+PiA+ID4gPj4gQ29tbWl0IDNiOTBiMDlhZjViZSAoInJp
c2N2OiBGaXggb3JwaGFuIHNlY3Rpb24gd2FybmluZ3MgY2F1c2VkIGJ5Cj4gPj4gPiA+ID4+IGtl
cm5lbC9waSIpIHRvdWNoZXMgdm1saW51eC5sZHMuUywgc28gdG8gbWFrZSB0aGUgbWVyZ2UgZWFz
eSwgdGhpcwo+ID4+ID4gPiA+PiBzZXJpZXMgaXMgYmFzZWQgb24gNi40LXJjMi4KPiA+PiA+ID4g
Pgo+ID4+ID4gPiA+IFRoYW5rcy4KPiA+PiA+ID4KPiA+PiA+ID4gU29ycnkgdG8gYmUgc28gc2xv
dyBoZXJlLCBidXQgSSB0aGluayB0aGlzIGlzIGNhdXNpbmcgTExEIHRvIGhhbmcgb24KPiA+PiA+
ID4gYWxsbW9kY29uZmlnLiAgSSdtIHN0aWxsIGdldHRpbmcgdG8gdGhlIGJvdHRvbSBvZiBpdCwg
dGhlcmUncyBhIGZldwo+ID4+ID4gPiBvdGhlciB0aGluZ3MgSSBoYXZlIGluIGZsaWdodCBzdGls
bC4KPiA+PiA+Cj4gPj4gPiBDb25maXJtZWQgd2l0aCB2MyBvbiBtYWlubGluZSAobGludXgtbmV4
dCBpcyBwcmV0dHkgcmVkIGF0IHRoZSBtb21lbnQpLgo+ID4+ID4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtcmlzY3YvMjAyMzA1MTcwODI5MzYuMzc1NjMtMS1mYWxjb25AdGlueWxhYi5v
cmcvCj4gPj4KPiA+PiBKdXN0IEZZSSBOaWNrLCB0aGVyZSdzIGJlZW4gc29tZSBjb25jdXJyZW50
IHdvcmsgaGVyZSBmcm9tIGRpZmZlcmVudAo+ID4+IHBlb3BsZSB3b3JraW5nIG9uIHRoZSBzYW1l
IHRoaW5nICYgdGhlIHYzIHlvdSBsaW5rZWQgKGZyb20gWmhhbmdqaW4pIHdhcwo+ID4+IHN1cGVy
c2VkZWQgYnkgdGhpcyB2MiAoZnJvbSBKaXNoZW5nKS4KPiA+Cj4gPiBBaCEgSSd2ZSBiZWVuIHRl
c3RpbmcgdGhlIGRlcHJlY2F0ZWQgcGF0Y2ggc2V0LCBzb3JyeSBJIGp1c3QgbG9va2VkIG9uCj4g
PiBsb3JlIGZvciAiZGVhZCBjb2RlIiBvbiByaXNjdi1saW51eCBhbmQgZ3JhYmJlZCB0aGUgZmly
c3QgdGhyZWFkLAo+ID4gd2l0aG91dCBub3RpY2luZyB0aGUgZGlmZmVyZW5jZSBpbiBhdXRob3Jz
IG9yIG5ldyB2ZXJzaW9uIG51bWJlcnMgZm9yCj4gPiBkaXN0aW5jdCBzZXJpZXMuIG9rLCBuZXZl
cm1pbmQgbXkgbm9pc2UuICBJJ2xsIGZvbGxvdyB1cCB3aXRoIHRoZQo+ID4gY29ycmVjdCBwYXRj
aCBzZXQsIHNvcnJ5IQo+Cj4gWWEsIEkgaGFkbid0IGV2ZW4gbm90aWNlZCB0aGUgdjMgYmVjYXVz
ZSBJIHByZXR0eSBtdWNoIG9ubHkgbG9vayBhdAo+IHBhdGNod29yayB0aGVzZSBkYXlzLiAgTGlr
ZSB3ZSB0YWxrZWQgYWJvdXQgaW4gSVJDLCBJJ20gZ29pbmcgdG8gZ28gdGVzdAo+IHRoZSBtZXJn
ZSBvZiB0aGlzIG9uZSBhbmQgc2VlIHdoYXQncyB1cCAtLSBJJ3ZlIGdvdCBpdCBzdGFnZWQgYXQK
PiA8aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGFsbWVy
L2xpbnV4LmdpdC9jb21taXQvP2g9Zm9yLW5leHQmaWQ9MWJkMjk2M2IyMTc1OGE3NzMyMDZhMWNi
NjdjOTNlN2E4YWU4YTE5NT4sCj4gdGhvdWdoIHRoYXQgd29uJ3QgYmUgYSBzdGFibGUgaGFzaCBp
ZiBpdCdzIGFjdHVhbGx5IGJyb2tlbi4uLgoKT2ssIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjMwNTIzMTY1NTAyLjI1OTItMS1qc3poYW5nQGtlcm5lbC5vcmcvCmJ1aWx0
IGZvciBtZS4gIElmIHlvdSdyZSBzZWVpbmcgYSBoYW5nLCBwbGVhc2UgbGV0IG1lIGtub3cgd2hh
dAp2ZXJzaW9uIG9mIExMRCB5b3UncmUgdXNpbmcgYW5kIEknbGwgYnVpbGQgdGhhdCB0YWcgZnJv
bSBzb3VyY2UgdG8gc2VlCmlmIEkgY2FuIHJlcHJvZHVjZSwgdGhlbiBiaXNlY3QgaWYgc28uCgok
IEFSQ0g9cmlzY3YgTExWTT0xIC91c3IvYmluL3RpbWUgLXYgbWFrZSAtajEyOCBhbGxtb2Rjb25m
aWcgdm1saW51eAouLi4KICAgICAgICBFbGFwc2VkICh3YWxsIGNsb2NrKSB0aW1lIChoOm1tOnNz
IG9yIG06c3MpOiAyOjM1LjY4Ci4uLgoKVGVzdGVkLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVz
YXVsbmllcnNAZ29vZ2xlLmNvbT4gIyBidWlsZAoKPgo+ID4KPiA+Pgo+ID4+IENoZWVycywKPiA+
PiBDb25vci4KPiA+Cj4gPgo+ID4KPiA+IC0tCj4gPiBUaGFua3MsCj4gPiB+TmljayBEZXNhdWxu
aWVycwoKCgotLSAKVGhhbmtzLAp+TmljayBEZXNhdWxuaWVycwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
