Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719CDC54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 04:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kym+XN1oEvgAvueV8M7BBVYptsMkFgIb2Lb0B+msoZ4=; b=Svc8T0Z0qh/0VO
	amBnq3Lbnpd4DMQTCbazN7T84qVIKZwD6ztrJY3NskI10v94HRqJ3g+SYoRKwARt3vO0/EPfmAKgl
	Zf2fkuhRixJJFwBaUMIQfcCbK6NUZoarCEkJFbWui6Mtx7/owCPaSO8tXoWIaAGLOVU1TJG4zgG5I
	M7EsJY4Rnoro+AGvZhMeCpRoCagX/edNBTDF5GRrSDZqNmiDYbcOPm2Xm5HWAiYekGvRvSSYn9+zD
	HQdihAgGCkNh0i7GEprNB6vAdM2L5jS6XgSncHQsg7q/qvkXmfTlknzCz+byeeBi0gBWvKlCKaSr5
	0pX/g054bamqpu04175w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkGKb-00000008poN-3kgl;
	Wed, 13 Mar 2024 04:35:09 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkGKY-00000008pnL-1vX6
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 04:35:07 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3663c6fba33so31482925ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 21:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1710304504; x=1710909304; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+ojfhId1+LThxcC+VoZJPeAkhUw8IvP6nZWtFu7M50=;
        b=VgNih8ndSmMVTITCVxZnJyaUhjskqQAoO3n+yf/JZAnagkFsqyet/impPwsYs9JnNT
         1/1LM0T4DAycZ6lwPLYp/9bzgnIE9I1Ho/F8LPSALK59aHliDM2+O4ap485aOieEAgaC
         LzfbROaDfbFHKXsBetWb7Ncfhitae0ulSHMdezzSSwhrDHT8J28xSQKH0K6syu90/Et2
         i7F6wcvQtArHrgPRE8p676wyIAuTfR5OxA8VMHdC49rNk3t2mkgqqDSWKtOr1JcbHqFD
         fU7MbhbYYWvKqiFHb3bG5Zsni4Zd7hW11EvBrc1SfBvoX192Cf1RUFLkeUx7uP8rs8t5
         LUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710304504; x=1710909304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+ojfhId1+LThxcC+VoZJPeAkhUw8IvP6nZWtFu7M50=;
        b=Ie2Vb+5CmnIyWUq3oh5K+LdVMrDseUjg0N5mf6zvYsYpHVx2PXbbRoiV0zScjhR/Qq
         QQn/a6wkpcNhzj1qjXe60Ym2IuTIpswEtoWKW/CvaSiYmaOOJuUlQE/cyFsIIDDUV4UI
         ySeM4vmsbkduahHcjNAdjN8VZUy/2EdmtBTHFVkUnIObp0dnji4qVVi7Plld+dA1PUTv
         hdscCfnElToBERdcFUyArWjDUbnqWbU4ZAeD8cvDnmc2pxWj6udIrO42oj3D4M9oYt1L
         GILBtvfg29qCZBNl02Z3dFXqPSCTAUdzAL2g3bccDmmDsrbQz/XJ/UdivYcL2e3YB1Go
         x1og==
X-Forwarded-Encrypted: i=1; AJvYcCXtyTkRV1jBYigXHjfznpDVTa+n869Xvr2pKiCr03CdVxd1hEgHaW01UnP0UTfIxS7NLjrUKUwKphKo3ex9dx80Wy0m6UlNBSmWwcepUZPy
X-Gm-Message-State: AOJu0YwU0pmOj/F0TcDAtEx0NYatj7Y7xbnlQp1f8Hu3sVG+5NMwZJvF
	yu/nwAInEXehtwvAYF/MjjYj8vCEJqRuPqzsiZJmjBB5jIphxkjlFHlED0vMVKiJGu//CC9LDt2
	S6WTjr5TjCfCCAHZz7jwFyLlviPhWfMVhnAj3Aw==
X-Google-Smtp-Source: AGHT+IGNHY6yALXc0HHKiXAFJ/gCo5nkoSqgcYH+W8nW6RbXOtlAqWcFNeEuBtNCAB/bi676z5bhdsaNAz18dXYhQgU=
X-Received: by 2002:a05:6e02:11a9:b0:366:4ad5:a066 with SMTP id
 9-20020a056e0211a900b003664ad5a066mr7558070ilj.23.1710304504474; Tue, 12 Mar
 2024 21:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240312212813.2323841-1-samuel.holland@sifive.com>
In-Reply-To: <20240312212813.2323841-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Mar 2024 10:04:52 +0530
Message-ID: <CAAhSdy1TtGEVHG1GzeJGvA8yHvFmwWqvMZPCvh0wQuGExY8rKw@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-intc: Fix use of AIA IRQs 32-63 on riscv32
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_213506_749815_0830265A 
X-CRM114-Status: GOOD (  20.91  )
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

T24gV2VkLCBNYXIgMTMsIDIwMjQgYXQgMjo1OOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IHJpc2N2X2ludGNfY3VzdG9tX2Jhc2UgaXMg
aW5pdGlhbGl6ZWQgdG8gQklUU19QRVJfTE9ORywgc28gdGhlIHNlY29uZAo+IGNoZWNrIHBhc3Nl
cyBldmVuIHRob3VnaCBBSUEgcHJvdmlkZXMgNjQgSVJRcy4gQWRqdXN0IHRoZSBjb25kaXRpb24g
dG8KPiBvbmx5IGNoZWNrIHRoZSBjdXN0b20gSVJRIHJhbmdlIGZvciBJUlFzIG91dHNpZGUgdGhl
IHN0YW5kYXJkIHJhbmdlLCBhbmQKPiBhZGp1c3QgdGhlIHN0YW5kYXJkIHJhbmdlIHdoZW4gQUlB
IGlzIGF2YWlsYWJsZS4KPgo+IEZpeGVzOiBiYjc5MjFjZGVhMTIgKCJpcnFjaGlwL3Jpc2N2LWlu
dGM6IEFkZCBzdXBwb3J0IGZvciBSSVNDLVYgQUlBIikKPiBGaXhlczogZTZiZDliOTY2ZGM4ICgi
aXJxY2hpcC9yaXNjdi1pbnRjOiBGaXggbG93LWxldmVsIGludGVycnVwdCBoYW5kbGVyIHNldHVw
IGZvciBBSUEiKQo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFu
ZEBzaWZpdmUuY29tPgoKSSBtaXNzZWQgYWRqdXN0aW5nIHJpc2N2X2ludGNfbnJfaXJxcyBpbiBj
b21taXQgZTZiZDliOTY2ZGM4LgpUaGFua3MgZm9yIGNhdGNoaW5nLgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+Cj4g
IGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIHwgMTMgKysrKysrKystLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIGIvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbnRjLmMKPiBpbmRleCBmODdhZWFiNDYwZWIuLjllNzFjNDQyODgxNCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ICsrKyBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gQEAgLTE0OSw4ICsxNDksOSBAQCBzdGF0aWMg
aW50IHJpc2N2X2ludGNfZG9tYWluX2FsbG9jKHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sCj4g
ICAgICAgICAgKiBPbmx5IGFsbG93IGh3aXJxIGZvciB3aGljaCB3ZSBoYXZlIGNvcnJlc3BvbmRp
bmcgc3RhbmRhcmQgb3IKPiAgICAgICAgICAqIGN1c3RvbSBpbnRlcnJ1cHQgZW5hYmxlIHJlZ2lz
dGVyLgo+ICAgICAgICAgICovCj4gLSAgICAgICBpZiAoKGh3aXJxID49IHJpc2N2X2ludGNfbnJf
aXJxcyAmJiBod2lycSA8IHJpc2N2X2ludGNfY3VzdG9tX2Jhc2UpIHx8Cj4gLSAgICAgICAgICAg
KGh3aXJxID49IHJpc2N2X2ludGNfY3VzdG9tX2Jhc2UgKyByaXNjdl9pbnRjX2N1c3RvbV9ucl9p
cnFzKSkKPiArICAgICAgIGlmIChod2lycSA+PSByaXNjdl9pbnRjX25yX2lycXMgJiYKPiArICAg
ICAgICAgICAoaHdpcnEgPCByaXNjdl9pbnRjX2N1c3RvbV9iYXNlIHx8Cj4gKyAgICAgICAgICAg
IGh3aXJxID49IHJpc2N2X2ludGNfY3VzdG9tX2Jhc2UgKyByaXNjdl9pbnRjX2N1c3RvbV9ucl9p
cnFzKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiAgICAgICAgIGZvciAo
aSA9IDA7IGkgPCBucl9pcnFzOyBpKyspIHsKPiBAQCAtMTgzLDEwICsxODQsMTIgQEAgc3RhdGlj
IGludCBfX2luaXQgcmlzY3ZfaW50Y19pbml0X2NvbW1vbihzdHJ1Y3QgZndub2RlX2hhbmRsZSAq
Zm4sIHN0cnVjdCBpcnFfY2gKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTlhJTzsKPiAgICAg
ICAgIH0KPgo+IC0gICAgICAgaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEws
IFN4QUlBKSkKPiArICAgICAgIGlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxM
LCBTeEFJQSkpIHsKPiArICAgICAgICAgICAgICAgcmlzY3ZfaW50Y19ucl9pcnFzID0gNjQ7Cj4g
ICAgICAgICAgICAgICAgIHJjID0gc2V0X2hhbmRsZV9pcnEoJnJpc2N2X2ludGNfYWlhX2lycSk7
Cj4gLSAgICAgICBlbHNlCj4gKyAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICByYyA9
IHNldF9oYW5kbGVfaXJxKCZyaXNjdl9pbnRjX2lycSk7Cj4gKyAgICAgICB9Cj4gICAgICAgICBp
ZiAocmMpIHsKPiAgICAgICAgICAgICAgICAgcHJfZXJyKCJmYWlsZWQgdG8gc2V0IGlycSBoYW5k
bGVyXG4iKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+IEBAIC0xOTUsNyArMTk4LDcg
QEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50Y19pbml0X2NvbW1vbihzdHJ1Y3QgZndub2Rl
X2hhbmRsZSAqZm4sIHN0cnVjdCBpcnFfY2gKPiAgICAgICAgIHJpc2N2X3NldF9pbnRjX2h3bm9k
ZV9mbihyaXNjdl9pbnRjX2h3bm9kZSk7Cj4KPiAgICAgICAgIHByX2luZm8oIiVkIGxvY2FsIGlu
dGVycnVwdHMgbWFwcGVkJXNcbiIsCj4gLSAgICAgICAgICAgICAgIHJpc2N2X2lzYV9leHRlbnNp
b25fYXZhaWxhYmxlKE5VTEwsIFN4QUlBKSA/IDY0IDogcmlzY3ZfaW50Y19ucl9pcnFzLAo+ICsg
ICAgICAgICAgICAgICByaXNjdl9pbnRjX25yX2lycXMsCj4gICAgICAgICAgICAgICAgIHJpc2N2
X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIFN4QUlBKSA/ICIgdXNpbmcgQUlBIiA6ICIi
KTsKPiAgICAgICAgIGlmIChyaXNjdl9pbnRjX2N1c3RvbV9ucl9pcnFzKQo+ICAgICAgICAgICAg
ICAgICBwcl9pbmZvKCIlZCBjdXN0b20gbG9jYWwgaW50ZXJydXB0cyBtYXBwZWRcbiIsIHJpc2N2
X2ludGNfY3VzdG9tX25yX2lycXMpOwo+IC0tCj4gMi40My4xCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
