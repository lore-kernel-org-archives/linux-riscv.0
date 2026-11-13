Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C98606B22F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 17:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y3m6mb3N;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUr6ZmrB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tbPBtLFjHg0kIud3cMOgEaTLaXf8e9aYY4QJR5p7jaM=; b=Y3m6mb3NlhH8YDK2MGPFsnLJga
	2FjQ2uGPr/h/7nP8+MDMqD1cdVNwN3XHNLAT+bmBI3M777uSE7fsF9E3t3wZdycSatn1retTJt2E4
	kOsLM/zsolJxFL6lLikYNqo/yIiJ7GZ/3khwIfHUiJ3Q32bDUrmKJXpazA1O/YThT+aoHsu12r6vV
	nQqsjZzmLBBKa5paJ5a7jOKLmRMMuISakZ6FfyTuTmRdP/3482VzvUrlNM6YLbmJweUkQnNCbrpXS
	ELaqLFfAacunwUi8AU6aT0BTAiNpBeWFk9XGWTKnj67TUj2v5gfpC9z5lBi7I0utzILyY2hP1MbdR
	HxgwjL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvP0-0000000DnTu-0iPt;
	Fri, 13 Nov 2026 17:49:30 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvOx-0000000DnS4-0i8h
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 17:49:28 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c5067a2411bso241729966b.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 09:49:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592165; cv=none;
        d=google.com; s=arc-20260327;
        b=JQMiBJA77gY6ZaTw4RAOtB2iO/gO6s5xHq7P8QsO9t820CCuijyBctqU/Co9HkHo2R
         1oLrPXGBthYeDBocwFb2ao3pnV/5DhBUrb3Qe851699ARFKaFioU7WmJVFwe/y9ISLXF
         cz+N5RtLc/oTDNObSuwEaDTc4v1jOsKS100SIrUt30PicazFicXj6ykHgRZIPNxel2H9
         gLoJNvUyahw0jyxhzwG3ITGiEgwHNJpNO1YszUbNhyU60qIn7BLmU1yGSUBqjKSv1FTc
         DzBP8uRWaWXAUjXKKudpWlucbDMziOHlIDY6s3mi8Pqn7TWbUrCHok45CST72UzytcH3
         Ecdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
        fh=DsT6pvN0zMWU+blm0uSN398nnVvvC0t5BSkH0DD15M8=;
        b=E+m97XygAsagyDIuiDhhY0NRyQiQSM7T+hqgeQOgPKudeDWVmdwPB5JxPp89oU4fF6
         ERywUZjPZEM8PQTnlroDZuBd0/vsjEoA09gDkLLJbsoWP75dUd86XjBfnoYrS7G427AT
         iGRsQ9W85EF9B/cLiBvjKUkPrpen/KduCfxyiJGDs905G2LNMOTMhaSLtnjJ/p+Tr+Me
         cLsfKIqTLaZJ4U3aQRULL1057EMEuDXgbgN9/Dwu4qNr14yZ5PZxxyEcEZq7T2qkB2AW
         jPKXPjGfNiadblq8PkIeU5SslpzUm2Vs8sFJg4nsRyPGVPs58vr4EOUmVuWbWB1fpqCL
         PqQA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794592165; x=1795196965; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
        b=mUr6ZmrBEaVJrbCnypGeQThDzvyPyPeeq1xI6lidl21I0DI/YPbaWjBuoTrDMzeCcU
         cTzLIeHbQ1avMgnbUp4FnRsopnPCRZ7gf6gD/unCLiLJ0QWjJtSGm9F3BBIT4zmCE/YG
         FSGAJxd6ly091Xku8BPl3Atr2oGqe0+XAMdIghGx7fNWyarWwMzcf1g27RcbfuCSq8W+
         5hlaPR6r9nrLGDRCURlL7IRuFqzKiHWlouQZteTqw2iL/1rM4Nb2govW3U8rRbgTjwbp
         R1P97p3yPOJcCXHB0PPUNGz8Eai/T0E6uiAd0LuXx6wqq3BbPAMhRC75dvUgt7qEuc82
         TqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592165; x=1795196965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qoAEFZuoRKNKj+7J8hCXBIt3RIFn5aoPyFdLTSqWQ4=;
        b=hFGvsGlSrpcp4AHbu8ZWz/B+MfOfj6A4uoBKu4/9rOMPccwmJy2o9u7bUCBctzMtKP
         GI8O+hIYFTT2tOZ/ARoZ6yjYNVgzL1Fp1M6m2zpCgNvAQeWM6HkMx9I3QQp8QUDEQ7tR
         JfBzLoy/FhOWt3Yk9N5YRQStKqIedpWZJUzrxIAycwEU+kjtYhK1Gnit97t5rdyuTa40
         0XelBZyFXW7DE09POtyV8l3pVCOBTqyN4m3U1sICkcf+/HIurTbKUeRjfG7DUnwVrj4d
         IkGgxnbe9xNNlKRi/vWC5s2KpXPMVDdUQ5CcNLlP85MIRiE6XjTFHYbLo+4n+rmKmFyP
         KtOw==
X-Forwarded-Encrypted: i=1; AL+hErE5WXKqpoziZaHorRIS4NhqeNuciHz1YgMvGHnObpw9tqKUsH8fVGs4HtJkVb3/kwHcEMCjMuSNCaQ5Bg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9GVy1jWTTIQKydjYWxjFuRR77WycFA8jMF0ItTv4v9Kmuo/2Ib
	SEk1DgK4O4cQ6W+lj0MDi/LvqqbhgrKScc4V/mGErhlRLFM1MVAAU+jZ/93cpJ/zm75GW3joSMo
	zmXreldPXOgQJe9CfKAUhZ3ABC9HqSj4=
X-Gm-Gg: AYBFou0Krt2vfs7lnzKK9/1XoHxSWq9d9kZ/2uEtrrCkZn53m5ZbZUg1MKuYbQiBmzw
	qlZ0UgXKQfBLIqAGxJ4/43OcR10qXISpTGQoIyVSoOqsvjoaybqjrnmde/2t4tqnluJo+uRIZgB
	DCRMQmn2N5QD/r+LQOl8/IWVRB+lRFqHMCojLsxQdHox6ssetrYg5OPHvpHrgPsdd6VMEcO7Olq
	gIQs79tQiT5In5oP4nXUcdAcuYzqvn4PH7Ny7gpnBby1xXZBqHhimekrYRLOTCBdoZP2fIUidib
	3mysdCFgf/WuEKj0ekHOziYGyWr4Svp3pNhUZiZwKYuCwU3gCorBbeLT7WLQ+NcvmHU3mGHST82
	7qKcRyN/OPUBZqKQdrmXZcM7YDqutiZrtRP4fxZRboCyCX96VFuISCblQHq+UVlFE5asCSK+IRX
	52HChGjtp5cF4xvXwq/zfCMQ==
X-Received: by 2002:a17:907:ea8e:b0:c50:9439:bffe with SMTP id
 a640c23a62f3a-c509684d717mr313677166b.47.1794592165236; Fri, 13 Nov 2026
 09:49:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113132435.434615-1-alitariq45892@gmail.com> <20261113132435.434615-3-alitariq45892@gmail.com>
In-Reply-To: <20261113132435.434615-3-alitariq45892@gmail.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Fri, 13 Nov 2026 22:49:13 +0500
X-Gm-Features: AclHuK9vLFuFj8StJfQb0gQfm2zMdlEC8vjTlUvEUXwD7gdAHCOcMYM38gGZrFA
Message-ID: <CADqcGBmdLC9jaK4HSECeSO=DtyZ3t-aoaBRUYV2cEQRBPOwuow@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: spacemit: Hold RTNL lock in emac_resume()
 and emac_suspend()
To: Ali Tariq <alitariq45892@gmail.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Tomas Hlavacek <tmshlvck@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, leitao@debian.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_094927_326101_3E3369A3 
X-CRM114-Status: GOOD (  20.15  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGFraW5nIFJUTkwgYmVmb3JlIHRoZSBuZXRpZl9ydW5uaW5nKCkgY2hlY2tzIGlzIHRoZSBpbXBv
cnRhbnQgcGFydApvZiB2Miwgb3RoZXJ3aXNlIHRoZSBjaGVjayB3b3VsZCByYWNlIHdpdGggYSBj
b25jdXJyZW50IGNsb3NlLgpEZXBlbmRzIG9uIHBhdGNoIDEsIGFzIG5vdGVkLgoKUmV2aWV3ZWQt
Ynk6IE11aGFtbWFkIEJpbGFsIDxtZWF0dW5pMDAxQGdtYWlsLmNvbT4KCk9uIEZyaSwgTm92IDEz
LCAyMDI2IGF0IDY6MjjigK9QTSBBbGkgVGFyaXEgPGFsaXRhcmlxNDU4OTJAZ21haWwuY29tPiB3
cm90ZToKPgo+IFRoZSBlbWFjX3Jlc3VtZSgpIGNhbGxzIHRoZSBlbWFjX29wZW4oKSBhbmQgZW1h
Y19zdXNwZW5kKCkgY2FsbHMKPiBlbWFjX3N0b3AoKSBmdW5jdGlvbnMgZGlyZWN0bHkgd2l0aG91
dCBob2xkaW5nIHRoZSBsb2NrIHRocm91Z2gKPiBydG5sX2xvY2soKS4gVGhlc2UgZnVuY3Rpb25z
IHJlbHkgb24gcGh5X2Rpc2Nvbm5lY3QoKSB3aGljaCByZWFkcyBwb2ludGVyCj4gd2l0aCBydG5s
X2RlcmVmZXJlbmNlKCkuIEJ1dCBzaW5jZSBubyBsb2NrIGlzIGJlaW5nIGhlbGQsCj4gcnRubF9k
ZXJlZmVyZW5jZSB0aHJvd3MgYSBzdXNwaWNpb3VzIFJDVSB1c2FnZSBvbgo+IE9yYW5nZSBQaSBS
VjIgKFNwYWNlbWlUIEsxKSB3YXJuaW5nIHdoZW4gbG9ja2RlcCBpcyBlbmFibGVkLgo+Cj4gV0FS
TklORzogc3VzcGljaW91cyBSQ1UgdXNhZ2UKPiBkcml2ZXJzL25ldC9waHkvcGh5X2RldmljZS5j
OjE4MzEgc3VzcGljaW91cyByY3VfZGVyZWZlcmVuY2VfcHJvdGVjdGVkKCkgdXNhZ2UhCj4gQ2Fs
bCBUcmFjZToKPiBwaHlfZGV0YWNoX2ludGVybmFsKzB4NDkwLzB4NWYyCj4gcGh5X2Rpc2Nvbm5l
Y3QrMHg5MC8weGMwCj4gZW1hY19zdG9wKzB4MTE0LzB4NjI2Cj4gZW1hY19zdXNwZW5kKzB4YWMv
MHgxMjYKPiBwbGF0Zm9ybV9wbV9zdXNwZW5kKzB4NzIvMHhlNAo+Cj4gVGFrZSBSVE5MIGluIGVt
YWNfc3VzcGVuZCgpIGFuZCBlbWFjX3Jlc3VtZSgpIGJlZm9yZSB0aGUgbmV0aWZfcnVubmluZygp
Cj4gY2hlY2tzLCBzbyB0aGUgaW50ZXJmYWNlIGNhbid0IGJlIG9wZW5lZCBvciBjbG9zZWQgYmV0
d2VlbiB0aGUgY2hlY2sgYW5kCj4gZW1hY19zdG9wKCkgb3IgZW1hY19vcGVuKCkuCj4KPiBGb3Vu
ZCBieSBDSSBzdXNwZW5kIHRlc3RzIG9uIE9yYW5nZSBQaSBSVjIgKFNwYWNlbWlUIEsxKS4gVGVz
dGVkIG9uIHRoZQo+IHNhbWUgYm9hcmQgd2l0aCBsb2NrZGVwIGVuYWJsZWQ6IDEyIHN1c3BlbmQv
cmVzdW1lIGN5Y2xlcyB3aXRob3V0IHRoZQo+IHdhcm5pbmcsIGFuZCBrc2VsZnRlc3Qgd2l0aCBu
byBuZXcgZmFpbHVyZXMuCj4KPiBGaXhlczogYmZlYzZkN2YyMDAxICgibmV0OiBzcGFjZW1pdDog
QWRkIEsxIEV0aGVybmV0IE1BQyIpCj4gU2lnbmVkLW9mZi1ieTogQWxpIFRhcmlxIDxhbGl0YXJp
cTQ1ODkyQGdtYWlsLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gTW92ZWQgdGhlIHJ0
bmxfbG9jaygpIGJlZm9yZSB0aGUgJ3J1bm5pbmcnIGZsYWcgY2hlY2sKPiBXYXJuaW5nIExvZzog
aHR0cHM6Ly9rZXJuZWxjaS5jbG91ZC12LmNvL3NjaGVkdWxlci9qb2IvNTQ5I0wyMTY4Cj4gRml4
ZWQgTG9nOiBodHRwczovL2tlcm5lbGNpLmNsb3VkLXYuY28vc2NoZWR1bGVyL2pvYi81ODkKPiAt
LS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3BhY2VtaXQvazFfZW1hYy5jIHwgMTEgKysrKysr
KysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zcGFjZW1pdC9rMV9lbWFjLmMg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zcGFjZW1pdC9rMV9lbWFjLmMKPiBpbmRleCA1MWVkYzk1
ZjU0YzguLmQwN2Q4YTFhYTVlZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
cGFjZW1pdC9rMV9lbWFjLmMKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zcGFjZW1pdC9r
MV9lbWFjLmMKPiBAQCAtMjAzMSwxMSArMjAzMSwxNiBAQCBzdGF0aWMgaW50IGVtYWNfcmVzdW1l
KHN0cnVjdCBkZXZpY2UgKmRldikKPiAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWls
ZWQgdG8gZW5hYmxlIGJ1cyBjbG9jazogJWRcbiIsIHJldCk7Cj4gICAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7Cj4gICAgICAgICB9Cj4gKyAgICAgICBydG5sX2xvY2soKTsKPgo+IC0gICAgICAg
aWYgKCFuZXRpZl9ydW5uaW5nKG5kZXYpKQo+ICsgICAgICAgaWYgKCFuZXRpZl9ydW5uaW5nKG5k
ZXYpKSB7Cj4gKyAgICAgICAgICAgICAgIHJ0bmxfdW5sb2NrKCk7Cj4gICAgICAgICAgICAgICAg
IHJldHVybiAwOwo+ICsgICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBlbWFjX29wZW4obmRldik7
Cj4gKyAgICAgICBydG5sX3VubG9jaygpOwo+ICsKPiAgICAgICAgIGlmIChyZXQpIHsKPiAgICAg
ICAgICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHByaXYtPmJ1c19jbGspOwo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Owo+IEBAIC0yMDU1LDEyICsyMDYwLDE2IEBAIHN0YXRpYyBp
bnQgZW1hY19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPgo+ICAgICAgICAgZGlzYWJsZV93
b3JrX3N5bmMoJnByaXYtPnR4X3RpbWVvdXRfdGFzayk7Cj4KPiArICAgICAgIHJ0bmxfbG9jaygp
Owo+ICsKPiAgICAgICAgIGlmICghbmRldiB8fCAhbmV0aWZfcnVubmluZyhuZGV2KSkgewo+ICsg
ICAgICAgICAgICAgICBydG5sX3VubG9jaygpOwo+ICAgICAgICAgICAgICAgICBjbGtfZGlzYWJs
ZV91bnByZXBhcmUocHJpdi0+YnVzX2Nsayk7Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+
ICAgICAgICAgfQo+Cj4gICAgICAgICBlbWFjX3N0b3AobmRldik7Cj4gKyAgICAgICBydG5sX3Vu
bG9jaygpOwo+Cj4gICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+YnVzX2Nsayk7
Cj4gICAgICAgICBuZXRpZl9kZXZpY2VfZGV0YWNoKG5kZXYpOwo+IC0tCj4gMi4zNC4xCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
