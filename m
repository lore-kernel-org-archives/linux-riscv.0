Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C471C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 08:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTfdWh+uWLkYIFKIne4Fk4AtNBkl0PI6QLaFloeHXLw=; b=hgfu+B6TLLCw/1
	zm4hjDjdpi2NLCCoinvSUJ4c5HeKsZccR/i+NjF5J3UuKX5VPfcTxXTMOtiQaI8sPy0Rqs9cdfPJr
	/6NGKGxqIa/yzEosjpqFKGsKjbMs+2TNlw26m9zESpAJEf9wPdtwdxZS3jePbnggbCDCPj3g0BOg9
	zm5mayctTO8dbFakdzFyjcTkmH9BqYyziJF8SgIDg71tu4ejun2BXcH2b/Ercl2IczkqWU8a4skb/
	nEkYwtcyx5Tf0eKQ+n/YZHrLeMLgdYJD3mNpP9GJDrmWDTkqPfPWeT9hLtKOA4gNzqnDPJTty8KDX
	RoU/6po1dKbzIv45PAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzYQR-00000003NE4-2PFR;
	Wed, 24 Apr 2024 08:56:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzYQN-00000003NBY-1XOe
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 08:56:21 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-34bddecd63eso7868f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713948976; x=1714553776; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=suMY4XPa/kbnbsuNKp6g91hkITSOa8LGQNMIO3m9tW4=;
        b=EAm3z6x36vcSP98w5O4EgY3r/SoKBF2NAbz77zGEOv4/w2bcjp3c00yPbgDbarQVzL
         O/a8RtgEydEKw/2XI2SyJ4LN6HuLZu69Ads3Ts91E9lPMqsnNNRBnRR8hojeldGgpgRJ
         buiTNlQeh7rOIWw2X0FW6Wszskzig3NIFLcfoWqlt5FX5QcsoTn2hoLvZ4M5tpraoxlp
         89QCJlrnCdOMaiMcrFGGZ42eJGtSnMija4ZchbFp7XpgJbn2YTcDSSP+Ift2t/E0+F5v
         5lUwDrbXK2q/NZkXO09VumxJCc5wgdbn2Y+9P9iLt1cr8qGseC05QJEl6NDn5+mSs84U
         LFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713948976; x=1714553776;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suMY4XPa/kbnbsuNKp6g91hkITSOa8LGQNMIO3m9tW4=;
        b=ki+wfbHFFJFOLZhfOqBGTlEgeBVv4shFGepAGAHFKf8KXPDBE1A8XEeERd2tUPuHTB
         2BA890utpYaCYtKe1W7AYcXlsGUkmPR4jzBGN/p6s4mHYeipdJgOUsmmVZ1RDQMOumKP
         GcvyJ5HNMW8/tHkDQfD8hxBvDfDEhvZmJoQaLnayE6wCacKpgGS/s8vhlj8kLhCaZ9tH
         CCbTXWCW9xA8rMvHx3Ab6tvBJNAnFG52+LQi1gPkpJNgzWiIoRRGHuG6UuVG/tY3cOHE
         uXa0SlFWoIiy9S7tYjXDjQCQg8/B4pRJfp0QwAb2W8BAf68yL5SBh/pkwnjFKk044PZ0
         P1TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD+a7XdPrnxelsola/t6qBonseG7FHehGqpOfPIeGKZhkazf+BZgeUprvLrzQT+MEUe6UyM7o6IfDB2Lc9XFphiHVlr2drKHv8mdo9uJ3x
X-Gm-Message-State: AOJu0YzRo/CvaTeTqdWjJ8NgnefGsWxO68FYQBu8xxZRn13RTjAzojJL
	a6r5HZg2NTadzs/1qK5M3+B4P4vZm6C8lQsvkPUap3ZwtIRVoiA2EdqNdMZFusw=
X-Google-Smtp-Source: AGHT+IHnTgfP+JDtD0YJ4PuDZHL4ehlhBpneum41qUwKsi79yBLH+oHzokV5rqNn+u3SkD6GnzG1Ig==
X-Received: by 2002:adf:dd8a:0:b0:34a:a754:eb51 with SMTP id x10-20020adfdd8a000000b0034aa754eb51mr1004111wrl.3.1713948975675;
        Wed, 24 Apr 2024 01:56:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:6057:6f32:d1e5:d4d7? ([2a01:e0a:999:a3a0:6057:6f32:d1e5:d4d7])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c4f1000b0041a1fee2854sm12481710wmq.17.2024.04.24.01.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 01:56:15 -0700 (PDT)
Message-ID: <5b3f9017-b107-4de1-ab0d-854de160a5f6@rivosinc.com>
Date: Wed, 24 Apr 2024 10:56:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/7] riscv: add double trap driver
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Ved Shanbhogue <ved@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
 <20240418142701.1493091-6-cleger@rivosinc.com>
 <20240423-headsman-arrival-16a2d13342b2@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20240423-headsman-arrival-16a2d13342b2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_015619_818344_43536321 
X-CRM114-Status: GOOD (  30.21  )
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

CgpPbiAyMy8wNC8yMDI0IDE4OjM5LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gVGh1LCBBcHIg
MTgsIDIwMjQgYXQgMDQ6MjY6NDRQTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgYSBzbWFsbCBkcml2ZXIgdG8gcmVxdWVzdCBkb3VibGUgdHJhcCBlbmFibGluZyBhcyB3ZWxs
IGFzCj4+IHJlZ2lzdGVyaW5nIGEgU1NFIGhhbmRsZXIgZm9yIGRvdWJsZSB0cmFwLiBUaGlzIHdp
bGwgYWxzbyBiZSB1c2VkIGJ5IEtWTQo+PiBTQkkgRldGVCBleHRlbnNpb24gc3VwcG9ydCB0byBk
ZXRlY3QgaWYgaXQgaXMgcG9zc2libGUgdG8gZW5hYmxlIGRvdWJsZQo+PiB0cmFwIGluIFZTLW1v
ZGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5j
LmNvbT4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oICAgIHwgIDEgKwo+
PiAgZHJpdmVycy9maXJtd2FyZS9LY29uZmlnICAgICAgICB8ICA3ICsrKwo+PiAgZHJpdmVycy9m
aXJtd2FyZS9NYWtlZmlsZSAgICAgICB8ICAxICsKPj4gIGRyaXZlcnMvZmlybXdhcmUvcmlzY3Zf
ZGJsdHJwLmMgfCA5NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gIGluY2x1
ZGUvbGludXgvcmlzY3ZfZGJsdHJwLmggICAgfCAxOSArKysrKysrCj4+ICA1IGZpbGVzIGNoYW5n
ZWQsIDEyMyBpbnNlcnRpb25zKCspCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9maXJt
d2FyZS9yaXNjdl9kYmx0cnAuYwo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgv
cmlzY3ZfZGJsdHJwLmgKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4+IGluZGV4IDc0NGFhMTc5NmM5
Mi4uOWNkNGNhNjY0ODdjIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ni
aS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKPj4gQEAgLTMxNCw2ICsz
MTQsNyBAQCBlbnVtIHNiaV9zc2VfYXR0cl9pZCB7Cj4+ICAjZGVmaW5lIFNCSV9TU0VfQVRUUl9J
TlRFUlJVUFRFRF9GTEFHU19TUElFCSgxIDw8IDIpCj4+ICAKPj4gICNkZWZpbmUgU0JJX1NTRV9F
VkVOVF9MT0NBTF9SQVMJCTB4MDAwMDAwMDAKPj4gKyNkZWZpbmUgU0JJX1NTRV9FVkVOVF9MT0NB
TF9ET1VCTEVfVFJBUAkweDAwMDAwMDAxCj4+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfR0xPQkFM
X1JBUwkweDAwMDA4MDAwCj4+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfUE1VCQkweDAw
MDEwMDAwCj4+ICAjZGVmaW5lIFNCSV9TU0VfRVZFTlRfTE9DQUxfU09GVFdBUkUJMHhmZmZmMDAw
MAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9LY29uZmlnIGIvZHJpdmVycy9maXJt
d2FyZS9LY29uZmlnCj4+IGluZGV4IDU5ZjYxMTI4ODgwNy4uYTAzN2Y2ZTg5OTQyIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2Zpcm13YXJlL0tjb25maWcKPj4gKysrIGIvZHJpdmVycy9maXJtd2Fy
ZS9LY29uZmlnCj4+IEBAIC0xOTcsNiArMTk3LDEzIEBAIGNvbmZpZyBSSVNDVl9TU0VfVEVTVAo+
PiAgCSAgU2VsZWN0IGlmIHlvdSB3YW50IHRvIGVuYWJsZSBTU0UgZXh0ZW5zaW9uIHRlc3Rpbmcg
YXQgYm9vdCB0aW1lLgo+PiAgCSAgVGhpcyB3aWxsIHJ1biBhIHNlcmllcyBvZiB0ZXN0IHdoaWNo
IHZlcmlmaWVzIFNTRSBzYW5pdHkuCj4+ICAKPj4gK2NvbmZpZyBSSVNDVl9EQkxUUlAKPj4gKwli
b29sICJFbmFibGUgRG91YmxlIHRyYXAgaGFuZGxpbmciCj4+ICsJZGVwZW5kcyBvbiBSSVNDVl9T
U0UgJiYgUklTQ1ZfU0JJCj4+ICsJZGVmYXVsdCBuCj4+ICsJaGVscAo+PiArCSAgU2VsZWN0IGlm
IHlvdSB3YW50IHRvIGVuYWJsZSBTU0UgZG91YmxlIHRyYXAgaGFuZGxlci4KPj4gKwo+PiAgY29u
ZmlnIFNZU0ZCCj4+ICAJYm9vbAo+PiAgCXNlbGVjdCBCT09UX1ZFU0FfU1VQUE9SVAo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9NYWtlZmlsZSBiL2RyaXZlcnMvZmlybXdhcmUvTWFr
ZWZpbGUKPj4gaW5kZXggZmI3YjBjMDhjNTZkLi5hZDY3YTE3MzhjMGYgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZmlybXdhcmUvTWFrZWZpbGUKPj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9NYWtl
ZmlsZQo+PiBAQCAtMTgsNiArMTgsNyBAQCBvYmotJChDT05GSUdfUkFTUEJFUlJZUElfRklSTVdB
UkUpICs9IHJhc3BiZXJyeXBpLm8KPj4gIG9iai0kKENPTkZJR19GV19DRkdfU1lTRlMpCSs9IHFl
bXVfZndfY2ZnLm8KPj4gIG9iai0kKENPTkZJR19SSVNDVl9TU0UpCQkrPSByaXNjdl9zc2Uubwo+
PiAgb2JqLSQoQ09ORklHX1JJU0NWX1NTRV9URVNUKQkrPSByaXNjdl9zc2VfdGVzdC5vCj4+ICtv
YmotJChDT05GSUdfUklTQ1ZfREJMVFJQKQkrPSByaXNjdl9kYmx0cnAubwo+IAo+IEFzIHByZXZp
b3VzbHkgbWVudGlvbmVkLCBJJ2QgbGlrZSB0byBzZWUgYWxsIG9mIHRoZXNlIHJpc2N2IHNwZWNp
ZmljCj4gdGhpbmdzIGluIGEgcmlzY3YgZGlyZWN0b3J5LgoKQWNrZWQsIEkgd2FzIG5vdCBhd2Fy
ZSBvZiB0aGF0LgoKPiAKPj4gIG9iai0kKENPTkZJR19TWVNGQikJCSs9IHN5c2ZiLm8KPj4gIG9i
ai0kKENPTkZJR19TWVNGQl9TSU1QTEVGQikJKz0gc3lzZmJfc2ltcGxlZmIubwo+PiAgb2JqLSQo
Q09ORklHX1RJX1NDSV9QUk9UT0NPTCkJKz0gdGlfc2NpLm8KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZmlybXdhcmUvcmlzY3ZfZGJsdHJwLmMgYi9kcml2ZXJzL2Zpcm13YXJlL3Jpc2N2X2RibHRy
cC5jCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzJmOWEw
NjdlODdhCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvZHJpdmVycy9maXJtd2FyZS9yaXNjdl9k
Ymx0cnAuYwo+PiBAQCAtMCwwICsxLDk1IEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vbmx5Cj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDIzIFJpdm9zIElu
Yy4KPj4gKyAqLwo+PiArCj4+ICsjZGVmaW5lIHByX2ZtdChmbXQpICJyaXNjdi1kYmx0cnA6ICIg
Zm10Cj4+ICsKPj4gKyNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9p
bml0Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvcmlzY3ZfZGJsdHJwLmg+Cj4+ICsjaW5jbHVkZSA8
bGludXgvcmlzY3Zfc3NlLmg+Cj4+ICsKPj4gKyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4+ICsKPj4g
K3N0YXRpYyBib29sIGRvdWJsZV90cmFwX2VuYWJsZWQ7Cj4+ICsKPj4gK3N0YXRpYyBpbnQgcmlz
Y3Zfc3NlX2RibHRycF9oYW5kbGUodWludDMyX3QgZXZ0LCB2b2lkICphcmcsCj4+ICsJCQkJICAg
c3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+ICt7Cj4+ICsJX19zaG93X3JlZ3MocmVncyk7Cj4+ICsJ
cGFuaWMoIkRvdWJsZSB0cmFwICFcbiIpOwo+PiArCj4+ICsJcmV0dXJuIDA7Cj4+ICt9Cj4+ICsK
Pj4gK3N0cnVjdCBjcHVfZGJsdHJwX2RhdGEgewo+PiArCWludCBlcnJvcjsKPj4gK307Cj4+ICsK
Pj4gK3N0YXRpYyB2b2lkCj4+ICtzYmlfY3B1X2VuYWJsZV9kb3VibGVfdHJhcCh2b2lkICpkYXRh
KQo+IAo+IFRoaXMgc2hvdWxkIGVhc2lseSBmaXQgb24gb25lIGxpbmUuCj4gCj4+ICt7Cj4+ICsJ
c3RydWN0IHNiaXJldCByZXQ7Cj4+ICsJc3RydWN0IGNwdV9kYmx0cnBfZGF0YSAqY2RkID0gZGF0
YTsKPj4gKwo+PiArCXJldCA9IHNiaV9lY2FsbChTQklfRVhUX0ZXRlQsIFNCSV9FWFRfRldGVF9T
RVQsCj4+ICsJCQlTQklfRldGVF9ET1VCTEVfVFJBUF9FTkFCTEUsIDEsIDAsIDAsIDAsIDApOwo+
PiArCj4+ICsJaWYgKHJldC5lcnJvcikgewo+PiArCQljZGQtPmVycm9yID0gMTsKPiAKPiBJZiB0
aGlzIGlzIGEgYm9vbGVhbiwgbWFrZSBpdCBhIGJvb2xlYW4gcGxlYXNlLiBBbGwgdGhlIGNvZGUg
aW4gdGhpcwo+IHBhdGNoIHRyZWF0cyBpdCBhcyBvbmUuCj4gCj4+ICsJCXByX2VycigiRmFpbGVk
IHRvIGVuYWJsZSBkb3VibGUgdHJhcCBvbiBjcHUgJWRcbiIsIHNtcF9wcm9jZXNzb3JfaWQoKSk7
Cj4+ICsJfQo+PiArfQo+PiArCj4+ICtzdGF0aWMgaW50IHNiaV9lbmFibGVfZG91YmxlX3RyYXAo
dm9pZCkKPj4gK3sKPj4gKwlzdHJ1Y3QgY3B1X2RibHRycF9kYXRhIGNkZCA9IHswfTsKPj4gKwo+
PiArCW9uX2VhY2hfY3B1KHNiaV9jcHVfZW5hYmxlX2RvdWJsZV90cmFwLCAmY2RkLCAxKTsKPj4g
KwlpZiAoY2RkLmVycm9yKQo+PiArCQlyZXR1cm4gLTE7Cj4gCj4gQ2FuIHRoaXMgYmUgYW4gZXJy
bm8gcGxlYXNlPwo+IAo+PiArCj4+ICsJZG91YmxlX3RyYXBfZW5hYmxlZCA9IHRydWU7Cj4+ICsK
Pj4gKwlyZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArYm9vbCByaXNjdl9kb3VibGVfdHJhcF9lbmFi
bGVkKHZvaWQpCj4+ICt7Cj4+ICsJcmV0dXJuIGRvdWJsZV90cmFwX2VuYWJsZWQ7Cj4+ICt9Cj4+
ICtFWFBPUlRfU1lNQk9MKHJpc2N2X2RvdWJsZV90cmFwX2VuYWJsZWQpOwo+IAo+IENhbiB3ZSBq
dXN0IHVzZSBkb3VibGVfdHJhcCBldmVyeXdoZXJlPyBkYmx0cnAgcmVhZHMgbGlrZSBzb3VuZCB0
aGF0IGEKPiBiZWF0Ym94ZXIgd291bGQgbWFrZSBhbmQgdGhpcyBsb29rcyBhIGxvdCBuaWNlciB0
aGFuIHRoZSBvdGhlciBmdW5jdGlvbnMKPiBpbiB0aGUgZmlsZS4uLgoKQWhhaCB5b3UgZ2F2ZSBt
ZSBhIGdvb2QgbGF1Z2ggOkQKCj4gCj4+ICsKPj4gK3N0YXRpYyBpbnQgX19pbml0IHJpc2N2X2Ri
bHRycCh2b2lkKQo+IAo+IEkgdGhpbmsgdGhpcyBmdW5jdGlvbiBpcyBtaXNzaW5nIGFuIGFjdGlv
biB3b3JrIC0gaW5pdCBvciBwcm9iZT8KPiAKPj4gK3sKPj4gKwlzdHJ1Y3Qgc3NlX2V2ZW50ICpl
dnQ7Cj4+ICsKPj4gKwlpZiAoIXJpc2N2X2hhc19leHRlbnNpb25fdW5saWtlbHkoUklTQ1ZfSVNB
X0VYVF9TU0RCTFRSUCkpIHsKPj4gKwkJcHJfZXJyKCJTc2RibHRycCBleHRlbnNpb24gbm90IGF2
YWlsYWJsZVxuIik7Cj4+ICsJCXJldHVybiAxOwo+PiArCX0KPj4gKwo+PiArCWlmICghc2JpX3By
b2JlX2V4dGVuc2lvbihTQklfRVhUX0ZXRlQpKSB7Cj4+ICsJCXByX2VycigiQ2FuIG5vdCBlbmFi
bGUgZG91YmxlIHRyYXAsIFNCSV9FWFRfRldGVCBpcyBub3QgYXZhaWxhYmxlXG4iKTsKPj4gKwkJ
cmV0dXJuIDE7Cj4+ICsJfQo+PiArCj4+ICsJaWYgKHNiaV9lbmFibGVfZG91YmxlX3RyYXAoKSkg
ewo+PiArCQlwcl9lcnIoIkZhaWxlZCB0byBlbmFibGUgZG91YmxlIHRyYXAgb24gYWxsIGNwdXNc
biIpOwo+PiArCQlyZXR1cm4gMTsKPiAKPiBXaHkgZG8gd2UgcmV0dXJuIDFzIGhlcmUsIGJ1dCBh
biBlcnJubyB2aWEgUFRSX0VSUigpIGJlbG93Pwo+IFNob3VsZG4ndCBhbGwgb2YgdGhlc2UgYmUg
cmV0dXJuaW5nIGEgbmVnYXRpdmUgZXJyb25vPwo+IFRoaXMgcGFydGljdWxhciBvbmUgc2hvdWxk
IHByb2JhYmx5IHByb3BhZ2F0ZSB0aGUgZXJyb3IgaXQgZ290IGZyb20KPiBzYmlfZW5hYmxlX2Rv
dWJsZV90cmFwKCkuCgpJbmRlZWQsIEknbGwgdXNlIHNvbWUgZXJybm8gZXZlcnl3aGVyZS4KClRo
YW5rcywKCkNsw6ltZW50Cgo+IAo+IENoZWVycywKPiBDb25vci4KPiAKPj4gKwl9Cj4+ICsKPj4g
KwlldnQgPSBzc2VfZXZlbnRfcmVnaXN0ZXIoU0JJX1NTRV9FVkVOVF9MT0NBTF9ET1VCTEVfVFJB
UCwgMCwKPj4gKwkJCQkgcmlzY3Zfc3NlX2RibHRycF9oYW5kbGUsIE5VTEwpOwo+PiArCWlmIChJ
U19FUlIoZXZ0KSkgewo+PiArCQlwcl9lcnIoIlNTRSBkb3VibGUgdHJhcCByZWdpc3RlciBmYWls
ZWRcbiIpOwo+PiArCQlyZXR1cm4gUFRSX0VSUihldnQpOwo+PiArCX0KPj4gKwo+PiArCXNzZV9l
dmVudF9lbmFibGUoZXZ0KTsKPj4gKwlwcl9pbmZvKCJEb3VibGUgdHJhcCBoYW5kbGluZyByZWdp
c3RlcmVkXG4iKTsKPj4gKwo+PiArCXJldHVybiAwOwo+PiArfQo+PiArZGV2aWNlX2luaXRjYWxs
KHJpc2N2X2RibHRycCk7Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3Jpc2N2X2RibHRy
cC5oIGIvaW5jbHVkZS9saW51eC9yaXNjdl9kYmx0cnAuaAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjZkZTRmNDNmYWU2Ygo+PiAtLS0gL2Rldi9udWxsCj4+
ICsrKyBiL2luY2x1ZGUvbGludXgvcmlzY3ZfZGJsdHJwLmgKPj4gQEAgLTAsMCArMSwxOSBAQAo+
PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPj4gKy8qCj4+ICsgKiBD
b3B5cmlnaHQgKEMpIDIwMjMgUml2b3MgSW5jLgo+PiArICovCj4+ICsKPj4gKyNpZm5kZWYgX19M
SU5VWF9SSVNDVl9EQkxUUlBfSAo+PiArI2RlZmluZSBfX0xJTlVYX1JJU0NWX0RCTFRSUF9ICj4+
ICsKPj4gKyNpZiBkZWZpbmVkKENPTkZJR19SSVNDVl9EQkxUUlApCj4+ICtib29sIHJpc2N2X2Rv
dWJsZV90cmFwX2VuYWJsZWQodm9pZCk7Cj4+ICsjZWxzZQo+PiArCj4+ICtzdGF0aWMgaW5saW5l
IGJvb2wgcmlzY3ZfZG91YmxlX3RyYXBfZW5hYmxlZCh2b2lkKQo+PiArewo+PiArCXJldHVybiBm
YWxzZTsKPj4gK30KPj4gKyNlbmRpZgo+PiArCj4+ICsjZW5kaWYgLyogX19MSU5VWF9SSVNDVl9E
QkxUUlBfSCAqLwo+PiAtLSAKPj4gMi40My4wCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
