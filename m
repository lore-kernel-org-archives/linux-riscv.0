Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9C8E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 15:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ijRKArWtY2C4aUKl46ocSx7EeGWTdapUVZIkVSitmBA=; b=P1xiQKCXyMl5cU
	bn6P6twq1GuD52SnBKy280PcwBcDVxm2bP8yfJEi4FswWXB/6+Y/ibEjr2f1ol9uH491UmR84uFOa
	Ai/wLDQ/ZfC9o/fZOJq1Vmlx90EU/THLrzy58klRAOjKfZutSd3YUr+jz4ZJO3lXqtbLeufAbMGW4
	PCXmSZOxpgHXz11Cburyp9qK4pmGnFwSM77EQ+upCpXo4QG937nCS4UY4x5oMz1/jRN1pfX2qADv1
	a6TDVaO7aLAAJGq86yrKMA6lt9hgYOCf7kD0ZDsF3xK3WkJdO59OlgeftZcO/KH0DfWInbtQ0heTD
	a25X2FOF6S0uo5yT3TlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPk0W-0000000AFe4-48cp;
	Mon, 23 Dec 2024 15:06:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPisV-0000000A5qs-31gy
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Dec 2024 13:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hnkagdjwjgNIPob+6WBvRRH+hXkhhZ41YnFLVb4sL9g=; b=o9iWF9U4MIQHWPm+QFvbplg7PF
	r6PrO+6SarPGZFFaUi0SL/J96uMVFUxOPScuEitGkSIGWlOugtXA1fBcXUrEyE9z8ZrAZLzIuOara
	jPsjBu4hc47AZojJCzMvTyraxPJ63CLzj/aBcAIdHHzE77eSh3QdsA+ZjSKYo6Zdi78wqfHs9EyHi
	zbPg3gLcDqIin/oFl0IX19WGPiSOZPGR/dyulmmgdH/Svl5PenqTWWAAgY8pTKqlgrVBvH1UkVWhh
	aHNBL2wIwKu+lBb7l5VBqt8E85g9nC5RlQnLQc+ul6XHRsx0PQEGZjTej+gp4jKOVbEeEPuARmAW9
	PUPjadIg==;
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPisS-00000006MuK-3hWn
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 13:53:46 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-844dae6a0caso123330039f.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 05:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734962021; x=1735566821; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnkagdjwjgNIPob+6WBvRRH+hXkhhZ41YnFLVb4sL9g=;
        b=V2Su2WTRtZoit0b4eLj5qEpVXwcFJ2CTTTw2Jh4ON39UWir+YMXr/Pjf/M+UQhvbS4
         A07c0+MSznCDkt3j/RnskT6h2YpsQoLoVnr+hWZ/IJkN0Qz57fFM4n0YNgtI38HxZ3KC
         ZLp+k48/SecWtg8B9SLuchMfldPPWJ3S53xTeGvLhZ7Zkixj8PuFADZkw65b6Zl4Davk
         QGw3PHvgtaur1k1BWj56sORmtC+8b7K6VAnvSrTa7O3RUqlwRYFq6RolMqNgVYVFFdLa
         NXmzBcGoxSDVeLaer/kIlPMYu0qPBYozDSxCxvoyv/yBe2298pwFgortoIuEAJV8iheu
         ae0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734962021; x=1735566821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnkagdjwjgNIPob+6WBvRRH+hXkhhZ41YnFLVb4sL9g=;
        b=HZ3aUHz223OZC7Lt0syTJaJx9yHqznr9i9lkiJFGoolYdT9Q3pQChmZY8UdZubN+W3
         h/qlgjiVa6tYqno1OBUtKsiRmWbIh+ZXhxpHOGRtAbtEp5B37TNjZrrCpO8YGNDCR62n
         qRSp1AAtKGXXoUmHekM4+paKZtHVPrl7xHexU4q4Ql2NQKYNtY12/2DbmvNZ/64hk6V9
         vADraxRh/fK+Ur5HpucEGABB1csHMX9jyuVKTeEGFfFHmqLBjt/W7oyAapzqmiSm3f9c
         F6AF0WJGCQW03BzDAPosrvqjIwhC6zJa6FSU0mliwX534+z5vooqmEizZxrznBpQ4fCJ
         mtiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz1M0i6sJwCOUyOpy8xhBzHT8IAyoc/YYAcWbZFM1nOtm3GZQA+DYFd1oHB0Euz6aqxBZfnXvatYDhxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+zgqiTTmyp0gaffSjp2u2ashyDSHA7Xk3M54wJ90qaT46GCp6
	zR5oBTd+2zjS7iEhBl/B3FtThvd6rteu2RS4bvXW4WWZhbiUiRJ6dW9L1qppnMGolrHA2uELa36
	2Sd0XCsWfSdouqP+WrKgTi+UPZozwCpckW70h8Q==
X-Gm-Gg: ASbGncsd0ODik4im+ciLtdC4pkvS9bxd24LPW9JQNphfhr/j+iw1Ocr1Sn41fCcUb2G
	ogwzR6IhFljQ/o6VfIW8DkDhgtuBpYm6J83V29mE=
X-Google-Smtp-Source: AGHT+IEwvacBcq9kn3WJJuHdSOtxROX9WlmJfaZm50Reex04d1j/d8xnGQEJRsPYoiEuXLYBTkoaA6s0B8KwuzpOaHE=
X-Received: by 2002:a92:cda6:0:b0:3a7:a738:d9c8 with SMTP id
 e9e14a558f8ab-3c2d14d1839mr94678015ab.2.1734962021044; Mon, 23 Dec 2024
 05:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20241212-kvm_guest_stat-v1-0-d1a6d0c862d5@rivosinc.com> <20241212-kvm_guest_stat-v1-2-d1a6d0c862d5@rivosinc.com>
In-Reply-To: <20241212-kvm_guest_stat-v1-2-d1a6d0c862d5@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 23 Dec 2024 19:23:29 +0530
X-Gm-Features: AbW1kvZ80UCq3C-ao5tldPIkaQ5px9K8zD2jwUzYIr5JIMryNiwwWqsoNWNGfbo
Message-ID: <CAAhSdy065Gk9jiMns+NMED4nOR20=ii0_rVrJZc+_EJ1DmkXVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: KVM: Update firmware counters for various events
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_135345_013799_7680835A 
X-CRM114-Status: GOOD (  17.78  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgMjoyN+KAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFNCSSBQTVUgc3BlY2lmaWNhdGlvbiBkZWZpbmVzIGZldyBm
aXJtd2FyZSBjb3VudGVycyB3aGljaCBjYW4gYmUKPiB1c2VkIGJ5IHRoZSBndWVzdHMgdG8gY29s
bGVjdCB0aGUgc3RhdHN0aWNzIGFib3V0IHZhcmlvdXMgdHJhcHMKPiBvY2N1cnJlZCBpbiB0aGUg
aG9zdC4KPgo+IFVwZGF0ZSB0aGVzZSBjb3VudGVycyB3aGVuZXZlciBhIGNvcnJlc3BvbmRpbmcg
dHJhcCBpcyB0YWtlbgo+Cj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVs
dC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQu
YyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDI3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vdmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4
IGM5ZjhiMjA5NDU1NC4uYWNkY2Q2MTk3OTdlIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfZXhpdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiBAQCAtMTY1
LDYgKzE2NSwxNyBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X3RyYXBfcmVkaXJlY3Qoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LnNzdGF0dXMg
fD0gU1JfU1BQOwo+ICB9Cj4KPiArc3RhdGljIGlubGluZSBpbnQgdmNwdV9yZWRpcmVjdChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fY3B1X3RyYXAgKnRyYXApCj4gK3sKPiArICAg
ICAgIGludCByZXQgPSAtRUZBVUxUOwo+ICsKPiArICAgICAgIGlmICh2Y3B1LT5hcmNoLmd1ZXN0
X2NvbnRleHQuaHN0YXR1cyAmIEhTVEFUVVNfU1BWKSB7Cj4gKyAgICAgICAgICAgICAgIGt2bV9y
aXNjdl92Y3B1X3RyYXBfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gKyAgICAgICAgICAgICAgIHJl
dCA9IDE7Cj4gKyAgICAgICB9Cj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICAvKgo+
ICAgKiBSZXR1cm4gPiAwIHRvIHJldHVybiB0byBndWVzdCwgPCAwIG9uIGVycm9yLCAwIChhbmQg
c2V0IGV4aXRfcmVhc29uKSBvbgo+ICAgKiBwcm9wZXIgZXhpdCB0byB1c2Vyc3BhY2UuCj4gQEAg
LTE4MywxNSArMTk0LDI3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9leGl0KHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgICAgICAgIHJ1bi0+ZXhpdF9yZWFzb24g
PSBLVk1fRVhJVF9VTktOT1dOOwo+ICAgICAgICAgc3dpdGNoICh0cmFwLT5zY2F1c2UpIHsKPiAg
ICAgICAgIGNhc2UgRVhDX0lOU1RfSUxMRUdBTDoKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2
X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19JTExFR0FMX0lOU04pOwo+ICsgICAg
ICAgICAgICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+ICsgICAgICAgICAg
ICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRVhDX0xPQURfTUlTQUxJR05FRDoKPiArICAgICAg
ICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19NSVNB
TElHTkVEX0xPQUQpOwo+ICsgICAgICAgICAgICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUs
IHRyYXApOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRVhDX1NUT1JF
X01JU0FMSUdORUQ6Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3BtdV9pbmNyX2Z3
KHZjcHUsIFNCSV9QTVVfRldfTUlTQUxJR05FRF9TVE9SRSk7Cj4gKyAgICAgICAgICAgICAgIHJl
dCA9IHZjcHVfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+
ICAgICAgICAgY2FzZSBFWENfTE9BRF9BQ0NFU1M6Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNj
dl92Y3B1X3BtdV9pbmNyX2Z3KHZjcHUsIFNCSV9QTVVfRldfQUNDRVNTX0xPQUQpOwo+ICsgICAg
ICAgICAgICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXApOwo+ICsgICAgICAgICAg
ICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRVhDX1NUT1JFX0FDQ0VTUzoKPiArICAgICAgICAg
ICAgICAga3ZtX3Jpc2N2X3ZjcHVfcG11X2luY3JfZncodmNwdSwgU0JJX1BNVV9GV19BQ0NFU1Nf
U1RPUkUpOwo+ICsgICAgICAgICAgICAgICByZXQgPSB2Y3B1X3JlZGlyZWN0KHZjcHUsIHRyYXAp
Owo+ICsgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgRVhDX0lOU1RfQUNDRVNT
Ogo+IC0gICAgICAgICAgICAgICBpZiAodmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0LmhzdGF0dXMg
JiBIU1RBVFVTX1NQVikgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1
X3RyYXBfcmVkaXJlY3QodmNwdSwgdHJhcCk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0
ID0gMTsKPiAtICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICByZXQgPSB2Y3B1X3Jl
ZGlyZWN0KHZjcHUsIHRyYXApOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNh
c2UgRVhDX1ZJUlRVQUxfSU5TVF9GQVVMVDoKPiAgICAgICAgICAgICAgICAgaWYgKHZjcHUtPmFy
Y2guZ3Vlc3RfY29udGV4dC5oc3RhdHVzICYgSFNUQVRVU19TUFYpCj4KPiAtLQo+IDIuMzQuMQo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
