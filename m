Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13207CA601E
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAdhV9783IKZTK30igU5pXxVGMxyTbBYpKEqjLKBCBU=; b=bjPIeFADQtIhDn
	urxpjTbbIihGXLwELE2bZebdhTf7El9MYVgi/MwZYCQXl3H08lzizAUwGL4nlDQjssSFlEs1Sh4b8
	HIEj30Adv9I0S7P7KjfuiTesRawHvWD2JWcj4XOcMWm/wn/rhg49p0TbKS74rG85nF3mkS6oSQW/9
	zhm2/bz63XYdMC92JyvZwrBeqBpBaXSU5k3sSwg5ysyylB5C2sWTuLclJfXvdwHiQdPnMZppx8d2u
	SpAnrdK/ylP3WOsH6ZaaONP1T2VqAvvpEtkBhwlzG0cP8RlGvnZrzCt/V/6XSzUorS/06uu0b/p7z
	EozKjMMFgj+DkkY7PEFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF92f-00000006De8-3aY8;
	Fri, 09 Oct 2026 11:45:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF92d-00000006DdH-2GFy
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 11:45:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48c14a06c95so3221293f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 04:45:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791546333; cv=none;
        d=google.com; s=arc-20260327;
        b=nl1/HMlswgUWWa5V6rEbBYlQSuVbKLu+1+Pu3AMz61Usk/r9sVmVbz4Z2YZ9QZDFpW
         TS9hek1rfgpnozsj46MJxc+8lX9QXUgIROwKZrKEpbiZDbgytc4z3mH7dCaY/1CivuF2
         tSIz4BYQg0PYI/YwuUPyM0g0dvB6udbHtoe0RswIgHAJCWBIA5NgkhRZfmS31TBrpCMW
         PltTuhr2b0ZKw509ju3yLD4wW4NLWj88tmdiF6c/vSHQbfHbWQyFF6BN4S9Z5UvEMLMh
         JVUYdyttm/aVQPCdmwdcfRAV7StUYhrEDvykBXJoIhMxBfmyYuOLOeZTiidXNz/3BABQ
         DCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7MO9vjywSNkYUu5MtJSespV1dEQA8yEju3SiQ+MpGec=;
        fh=IXbIJNpcRBaK1aNVVJ85Mze4rVA+jxGzztn9JeRaNMA=;
        b=YqNxSXD9ng3zMcqVdhaFisii2X7woYLg9Gbk2Cs1ekYKdvSAVy3vMYtgsPVqroOHYM
         kkRMAYsjylADWxCmiaGlK1qhXiU/3sp6yh18Y/dwvVF0X6u9ALsONtC/tNAhbUbWt+Dz
         sKdVEqSnTK6SEesCCq877sr9KD9d9EXj1+Nc0fcbsN99bbl3Bx2Dfz6pMMOBoaDPLo2N
         kgggbBl7rvtaINQMQ/UQZUqvU4njz4uMN5I6sfvzViwFMuFRy7osj7A3IsMXdaF05KXU
         5K6msWmbKqO6WDJDqru++aT/kXdvWPIQoYg/2d08rqKDWvqV1i8FIueu9hSvoLjGxESg
         2W8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791546333; x=1792151133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MO9vjywSNkYUu5MtJSespV1dEQA8yEju3SiQ+MpGec=;
        b=Mc/W+z9ASpLsAjhMwOXKlFh06rRnPGPJ9SJp8iXEL/qItv4KntLt72c1/P0EAg4qCD
         IaPF6WyrzSsRMTt/0tsVkrtD0+tTIdINmwhwJzuwA2UXWcFwz7Rs4jTTwuDpST3cKMk9
         i8V5JuuTPheaedoioIxLpNsPpLceRJi1VVTw3kDyFJEJZhk1HiAFSg30SYUO5fEf8pWY
         ZXAHcxR5yIeUtOdS8kM0sooD3/b0XN1ZcMikENCB3SYSwYTL7taDfF94rRrXz6ILU07Q
         qH9EQCvL/3HtlcL+NSIVO18HL4YXsfeiY4SbWCeKTRRkhtneNVnB6NVl3cA1ryb+mNea
         HhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791546333; x=1792151133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MO9vjywSNkYUu5MtJSespV1dEQA8yEju3SiQ+MpGec=;
        b=ZuPaQEvbMEmkGsV0svHGwkVdS35lQY5FCj99l7GABTIGHPoJFkye05AEiYFjHVgU9S
         vR0MPvbQ+I1kL+flcSMJvjASyXMPL/hoOZRottTW493rwXzefAXZU4gQQNxz1jbvKhEo
         kr0fspfb+tU7PEXAwhs5aXKqRwpvHKD4KLfWn8BvbVOutpgnIhYtjmwufJlkvZEqgM8d
         rMz+ppw2sVJPBoa9/AGTzJNS4bfQn+AGzu/n8RZovYgzBALjirIjLgzXlyrRRe1iuhQH
         MpfyqkM9xtqr8pnqcHm+VEH5FHq7j8q3mpD3kQnjy7VlMK63MXThnyNfoxezA14Bnj9D
         mIvw==
X-Forwarded-Encrypted: i=1; AKwUvBw1rze8eEKclQsWavyXJV+ui+cTcM5wUg1+udGa8ibN46I8xCtDivihn0ly9mZsM5fekOUI+hpZpz671A==@lists.infradead.org
X-Gm-Message-State: AFq9FYKowjBwBQftxuW5vgHwmqGDAy7oOR50D3erFC2gyxJe66OCm/S8
	20IzkV83dv8UlCWGRhmA/ntnvf0lk+UrLi5Dhkz/CdWqIOZE6cIOAWYcEdzAE6AtYnVXxIt8ekv
	EvQxfYk50qxN54GQKuNjHjOgjXCiK5kQFjnDJMsuhluHj3VUpuHfq01i0axWzjhodLw==
X-Gm-Gg: AYBFou00Ru14+dFM+tUb5t863lzx4mB0YsIlrRXofOTGEZUEqTu19dE5Kxno+peB6Jh
	E4UAXI6Syk0KfosUSAm7fPBMZG/GlkCyl9UbyLFG5DcQfTjESCaSCLfzLbSPahM3gTXsmENgZFS
	FhZrv763ppt3rGXWjB4f1mK4s25f/n64n3A7+c81PDV7nwhyVr2/q48KEt+oIqrMicnj+HWP1um
	I4ykKU1oSFTkQvbR2qmREVCjCuqmsHFpd40WrB5j2V0tlXmfYtV9GNWMwJUQIC5P6MmgnfsqNBP
	MNSgD/h+etCt91CvDyfgWUrWNGxp1luLTKiDmATeyEjbdQnzKPfex1ae7HIys3W1EV3MLy3xpMA
	TOVA3cGAzV9Xizr5mdS7341UsJ1Ab/kVK2Chh3RX0P2bg8Y5buyIaGVsCmaM3jOc6qQLFtyLL9Q
	==
X-Received: by 2002:a05:6000:4687:b0:487:36b:1816 with SMTP id
 ffacd0b85a97d-48dba7877f0mr2127579f8f.7.1791546333358; Fri, 09 Oct 2026
 04:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 13:45:20 +0200
X-Gm-Features: AclHuK8rgBU1gbsBmEn-K4KM8bdu2PbHz2NOesu5k9NjQJGHum_Uocj_Q34IYFc
Message-ID: <CAAhSdy0Y8kQ=gsiX0QX6Ntq=fL89METhA0s7G3niBBJrHpue7A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_044535_614666_2DBC282E 
X-CRM114-Status: GOOD (  20.21  )
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

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgNTo1MeKAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2lj
X3B1dCgpIGNhbiBydW4gZnJvbSB0aGUgc2NoZWR1bGVyIHByZWVtcHRpb24KPiBub3RpZmllciB3
aGlsZSB0aGUgcmF3IHJ1bnF1ZXVlIGxvY2sgaXMgaGVsZC4gVGFraW5nIHZzZmlsZV9sb2NrLCBh
bgo+IHJ3bG9ja190LCB0aGVyZSB2aW9sYXRlcyB0aGUgbG9ja2RlcCB3YWl0LWNvbnRleHQgcnVs
ZXMuCj4KPiBQcm90ZWN0IHRoZSBDUFUvSEdFSSBwYWlyIHdpdGggYSBzZXBhcmF0ZSByYXcgc3Bp
bmxvY2suIEFsbCB1cGRhdGVzIHRvCj4gdGhhdCBwYWlyIHJldGFpbiB2c2ZpbGVfbG9jayBhbmQg
dGFrZSB0aGUgbmV3IGxvY2ssIHdoaWxlIHNjaGVkdWxlci1vdXQKPiB1c2VzIG9ubHkgdGhlIG5l
dyBsb2NrIGFyb3VuZCB0aGUgSEdFSUUgdXBkYXRlLiBUaGlzIGtlZXBzIHRoZSB3YWtldXAKPiBz
ZXR1cCBzZXJpYWxpemVkIHdpdGggVlMtZmlsZSBwdWJsaWNhdGlvbiBhbmQgcmVsZWFzZSB3aXRo
b3V0IGJyaW5naW5nCj4gd2lkZXIgSU1TSUMgb3BlcmF0aW9ucyBpbnRvIGEgcmF3IGNyaXRpY2Fs
IHNlY3Rpb24uCgpJbnN0ZWFkIG9mIGludHJvZHVjaW5nIGFub3RoZXIgbG9jaywgd2h5IG5vdCBy
ZXBsYWNlCnJlYWRfbG9ja19pcnFzYXZlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKSB3aXRo
CndyaXRlX2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncykgaW4Ka3ZtX3Jp
c2N2X3ZjcHVfYWlhX2ltc2ljX3B1dCgpID8/CgpSZWdhcmRzLApBbnVwCgo+Cj4gRml4ZXM6IDRj
ZWM4OWRiODBiYSAoIlJJU0MtVjogS1ZNOiBNb3ZlIEhHRUlbRXxQXSBDU1IgYWNjZXNzIHRvIElN
U0lDIHZpcnR1YWxpemF0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJl
dy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1z
aWMuYyB8IDI1ICsrKysrKysrKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vYWlhX2ltc2ljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IGluZGV4IGMx
YWYyM2U3OWFlMC4uMWNjYjdlYWM5ZjQ1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2Fp
YV9pbXNpYy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBAQCAtNDgsNiAr
NDgsOCBAQCBzdHJ1Y3QgaW1zaWMgewo+Cj4gICAgICAgICAvKiBJTVNJQyBWUy1maWxlICovCj4g
ICAgICAgICByd2xvY2tfdCB2c2ZpbGVfbG9jazsKPiArICAgICAgIC8qIFdyaXRlcnMgaG9sZCBi
b3RoIGxvY2tzOyBzY2hlZHVsZXItb3V0IG9ubHkgdGFrZXMgaGdlaV9sb2NrLiAqLwo+ICsgICAg
ICAgcmF3X3NwaW5sb2NrX3QgaGdlaV9sb2NrOwo+ICAgICAgICAgaW50IHZzZmlsZV9jcHU7Cj4g
ICAgICAgICBpbnQgdnNmaWxlX2hnZWk7Cj4gICAgICAgICB2b2lkIF9faW9tZW0gKnZzZmlsZV92
YTsKPiBAQCAtNTgyLDYgKzU4NCwxNyBAQCBzdGF0aWMgdm9pZCBpbXNpY192c2ZpbGVfbG9jYWxf
dXBkYXRlKGludCB2c2ZpbGVfaGdlaSwgdTMyIG5yX2VpeCwKPiAgICAgICAgIGNzcl93cml0ZShD
U1JfVlNJU0VMRUNULCBvbGRfdnNpc2VsZWN0KTsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIGltc2lj
X3ZzZmlsZV9zZXRfaGdlaShzdHJ1Y3QgaW1zaWMgKmltc2ljLCBpbnQgY3B1LCBpbnQgaGdlaSkK
PiArewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCj4gKyAgICAgICAvKiBTZXJp
YWxpemUgdGhlIENQVS9IR0VJIHBhaXIgd2l0aCBzY2hlZHVsZXItb3V0J3Mgd2FrZXVwIHNldHVw
LiAqLwo+ICsgICAgICAgcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZpbXNpYy0+aGdlaV9sb2NrLCBm
bGFncyk7Cj4gKyAgICAgICBpbXNpYy0+dnNmaWxlX2NwdSA9IGNwdTsKPiArICAgICAgIGltc2lj
LT52c2ZpbGVfaGdlaSA9IGhnZWk7Cj4gKyAgICAgICByYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgmaW1zaWMtPmhnZWlfbG9jaywgZmxhZ3MpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBpbXNp
Y192c2ZpbGVfY2xlYW51cChzdHJ1Y3QgaW1zaWMgKmltc2ljKQo+ICB7Cj4gICAgICAgICBpbnQg
b2xkX3ZzZmlsZV9oZ2VpLCBvbGRfdnNmaWxlX2NwdTsKPiBAQCAtNTk2LDcgKzYwOSw3IEBAIHN0
YXRpYyB2b2lkIGltc2ljX3ZzZmlsZV9jbGVhbnVwKHN0cnVjdCBpbXNpYyAqaW1zaWMpCj4gICAg
ICAgICB3cml0ZV9sb2NrX2lycXNhdmUoJmltc2ljLT52c2ZpbGVfbG9jaywgZmxhZ3MpOwo+ICAg
ICAgICAgb2xkX3ZzZmlsZV9oZ2VpID0gaW1zaWMtPnZzZmlsZV9oZ2VpOwo+ICAgICAgICAgb2xk
X3ZzZmlsZV9jcHUgPSBpbXNpYy0+dnNmaWxlX2NwdTsKPiAtICAgICAgIGltc2ljLT52c2ZpbGVf
Y3B1ID0gaW1zaWMtPnZzZmlsZV9oZ2VpID0gLTE7Cj4gKyAgICAgICBpbXNpY192c2ZpbGVfc2V0
X2hnZWkoaW1zaWMsIC0xLCAtMSk7Cj4gICAgICAgICBpbXNpYy0+dnNmaWxlX3ZhID0gTlVMTDsK
PiAgICAgICAgIGltc2ljLT52c2ZpbGVfcGEgPSAwOwo+ICAgICAgICAgd3JpdGVfdW5sb2NrX2ly
cXJlc3RvcmUoJmltc2ljLT52c2ZpbGVfbG9jaywgZmxhZ3MpOwo+IEBAIC03MjcsMTAgKzc0MCwx
MCBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19wdXQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQo+ICAgICAgICAgaWYgKCFrdm1fdmNwdV9pc19ibG9ja2luZyh2Y3B1KSkKPiAgICAgICAg
ICAgICAgICAgcmV0dXJuOwo+Cj4gLSAgICAgICByZWFkX2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZz
ZmlsZV9sb2NrLCBmbGFncyk7Cj4gKyAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmltc2lj
LT5oZ2VpX2xvY2ssIGZsYWdzKTsKPiAgICAgICAgIGlmIChpbXNpYy0+dnNmaWxlX2NwdSA+IC0x
KQo+ICAgICAgICAgICAgICAgICBjc3Jfc2V0KENTUl9IR0VJRSwgQklUKGltc2ljLT52c2ZpbGVf
aGdlaSkpOwo+IC0gICAgICAgcmVhZF91bmxvY2tfaXJxcmVzdG9yZSgmaW1zaWMtPnZzZmlsZV9s
b2NrLCBmbGFncyk7Cj4gKyAgICAgICByYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaW1zaWMt
PmhnZWlfbG9jaywgZmxhZ3MpOwo+ICB9Cj4KPiAgdm9pZCBrdm1fcmlzY3ZfdmNwdV9haWFfaW1z
aWNfcmVsZWFzZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gQEAgLTc0Nyw3ICs3NjAsNyBAQCB2
b2lkIGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19yZWxlYXNlKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSkKPiAgICAgICAgIHdyaXRlX2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFn
cyk7Cj4gICAgICAgICBvbGRfdnNmaWxlX2hnZWkgPSBpbXNpYy0+dnNmaWxlX2hnZWk7Cj4gICAg
ICAgICBvbGRfdnNmaWxlX2NwdSA9IGltc2ljLT52c2ZpbGVfY3B1Owo+IC0gICAgICAgaW1zaWMt
PnZzZmlsZV9jcHUgPSBpbXNpYy0+dnNmaWxlX2hnZWkgPSAtMTsKPiArICAgICAgIGltc2ljX3Zz
ZmlsZV9zZXRfaGdlaShpbXNpYywgLTEsIC0xKTsKPiAgICAgICAgIGltc2ljLT52c2ZpbGVfdmEg
PSBOVUxMOwo+ICAgICAgICAgaW1zaWMtPnZzZmlsZV9wYSA9IDA7Cj4gICAgICAgICB3cml0ZV91
bmxvY2tfaXJxcmVzdG9yZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4gQEAgLTg2MSw4
ICs4NzQsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0ZShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCj4KPiAgICAgICAgIC8qIFVwZGF0ZSBuZXcgSU1TSUMgVlMtZmlsZSBkZXRh
aWxzIGluIElNU0lDIGNvbnRleHQgKi8KPiAgICAgICAgIHdyaXRlX2xvY2tfaXJxc2F2ZSgmaW1z
aWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4gLSAgICAgICBpbXNpYy0+dnNmaWxlX2hnZWkgPSBu
ZXdfdnNmaWxlX2hnZWk7Cj4gLSAgICAgICBpbXNpYy0+dnNmaWxlX2NwdSA9IHZjcHUtPmNwdTsK
PiArICAgICAgIGltc2ljX3ZzZmlsZV9zZXRfaGdlaShpbXNpYywgdmNwdS0+Y3B1LCBuZXdfdnNm
aWxlX2hnZWkpOwo+ICAgICAgICAgaW1zaWMtPnZzZmlsZV92YSA9IG5ld192c2ZpbGVfdmE7Cj4g
ICAgICAgICBpbXNpYy0+dnNmaWxlX3BhID0gbmV3X3ZzZmlsZV9wYTsKPiAgICAgICAgIHdyaXRl
X3VubG9ja19pcnFyZXN0b3JlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiBAQCAtMTEx
Miw2ICsxMTI0LDcgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19pbml0KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIC8qIFNldHVwIElNU0lDIGNvbnRleHQgICovCj4gICAg
ICAgICBpbXNpYy0+bnJfbXNpcyA9IGt2bS0+YXJjaC5haWEubnJfaWRzICsgMTsKPiAgICAgICAg
IHJ3bG9ja19pbml0KCZpbXNpYy0+dnNmaWxlX2xvY2spOwo+ICsgICAgICAgcmF3X3NwaW5fbG9j
a19pbml0KCZpbXNpYy0+aGdlaV9sb2NrKTsKPiAgICAgICAgIGltc2ljLT5ucl9laXggPSBCSVRT
X1RPX1U2NChpbXNpYy0+bnJfbXNpcyk7Cj4gICAgICAgICBpbXNpYy0+bnJfaHdfZWl4ID0gQklU
U19UT19VNjQoa3ZtX3Jpc2N2X2FpYV9tYXhfaWRzKTsKPiAgICAgICAgIGltc2ljLT52c2ZpbGVf
aGdlaSA9IGltc2ljLT52c2ZpbGVfY3B1ID0gLTE7Cj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
