Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422C3C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 06:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/+WPzwOjyzUkq8AlOs7F3ZjASrXk5SzepxliMz4lFQ=; b=WEzKMmkbCSg99I
	OTkhWL/GjNSjZbKu57VyY4m4vtLNqcpkgleMRtp5ZZ94MymKDsXgnsx81t7o3ozA8OtV+fWM03quk
	MyBxEdVD09+ZZn2FEKQmbgoRQhwouMJHwWD/obhC3nC4zgIvsksqKFWBRkDlXNQ1Zc9yQygXB/RWK
	ERAMaoHQwamOBLZFnkfT6WBvzO9IcqXKwJD/5DRWsWLsAOXlRcD1fRZSaTZsTuQNjkIEcfbCDs1rX
	K4A+bfLgB5Cw93eh4MoIbE+eDVoQCpiQ5QNdNyIwBLy5XZppgpV2V2S20SkVRO2rmCyIL3cflBneD
	fjYk/gT318iJfSeAtcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHqk-00000009GYl-2q0x;
	Thu, 17 Jul 2025 06:12:10 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHpn-00000009GQY-0cvN
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 06:11:12 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-86cfa53d151so10780839f.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 23:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752732670; x=1753337470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFXDSElKOOqp2lhmXXGsXGr9VDCoQ/FfrBr7vY0pwQs=;
        b=gHbOG18vMJTSr6bdKjmIfJ363Os7rJ4ZaMRh8c8DbZ60hSEcTmKbHzAVLcQZK8v0Zq
         zEO5MNZ7PO0u6BYjhJS4rSMfMmraVReTr15tTJAoC4Snsx1aLZHTPeNnY3Jl77mYXeQH
         esNwBNFibs6zGn0JcrGGV5g7pir5cb/wtqHz3WUdq2WNjbFrP/tsHYc9NGDkpDJgU15I
         U6o6I/dbyMVWxV767sfhwRU/cDvDfcTQ2/DE673WIm3My1etAZ+w7JCFc1U8KCtGPtAr
         GL7M9Mx+hBMROEP0Sk4oATmMTBxXKh8PQeWEicpVlxddzcN8eNg62mVsDohrGBhShunj
         N9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752732670; x=1753337470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFXDSElKOOqp2lhmXXGsXGr9VDCoQ/FfrBr7vY0pwQs=;
        b=sOEO5kau3u4pLWwJ87V5E27npuLgbDDUJJVR+eAs3mMnmu0qiITsZPBcc71Le9Eqtp
         8IUZ6raF/39TEZDi4snbTcMcXCW/V19Go7sTXZfzO4uv8MFSQnLwkQaeOSfz9w/Qsj2z
         rne4+t6Wv1dnXZVETq3tcpa3YSMO0XeyZ0XwYlb3BgJ6ypE2Hs1GYfLJBd1wcR/+An7L
         sKHyjUzNf6UtlvEmljkR8vU5ZUHg1vy9VgLiHBGGll6tYOCEuJgukVEiCY9OF8IOTOOm
         rPOgb1ad4xX5bA+vZ8RtiMbOHF3MHjE43KxLz2Gj3G4VPlfSbmBHrC998D+2Plr3Jy4c
         Y9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWCuoUyraPYyFt1uGbaT3qlzNqg0rx/piXnSJELvXvfrt24RNVE9zJXifp0yfE7HotbfCrG62t+FZfjRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5emyIAADS2yuZaNmIolKR9UIr1HCKR/WAP/4XQhZwAjJZTV8A
	wnvB22Xl6Zlse6T0ybf8JL54pADosTgtMBln9TGwTghvm3cKAfAcMnPcU4JaQ8e4dr3MZd01+71
	do3B8IboGOYFKtuAtj8E767vmClCxcw4fW5246qljWA==
X-Gm-Gg: ASbGncvwcjDrelNCUSHCRW6E4GDjV779Ess2DyyyZCbLJ2Rx4CXn95dm0d+9j+Q7JmC
	TRQ2L9DN0cZZBJpBrIWnBvIyGzp9rFLU2i3+vSOX3rFrqxKHDpBHrffWgi/VoIchtxb8ikZVfEj
	QiEsywtdPBEYqkOrM3zgcGKZVX2xPnerkKyuIbgYvQ7VhVRmxjb6kJwwCh2u9Pl5j3LDU5hIdLK
	CgljA==
X-Google-Smtp-Source: AGHT+IF01QfJyQMefqtK6K31hKuroqHVJNbfRoBUWtdmJCmhcOeVgxFHACALHAoTtmmMAVZj3g7jLJEfDcjT3Imbm5Y=
X-Received: by 2002:a05:6602:164a:b0:879:c4a1:1020 with SMTP id
 ca18e2360f4ac-879c4a1138amr581946839f.9.1752732670109; Wed, 16 Jul 2025
 23:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749810735.git.zhouquan@iscas.ac.cn> <20e116efb1f7aff211dd8e3cf8990c5521ed5f34.1749810735.git.zhouquan@iscas.ac.cn>
In-Reply-To: <20e116efb1f7aff211dd8e3cf8990c5521ed5f34.1749810735.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 11:40:58 +0530
X-Gm-Features: Ac12FXzV5Y-LW3CLzhO1n-a_ZnyRISIIMhwEfUeHXAPilMPIemTKisuILYRl6qQ
Message-ID: <CAAhSdy3yjCXHucCzQzXg2BUJM7aYrb2Fd0taJQw=AEnvfnsNAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: KVM: Enable ring-based dirty memory tracking
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_231111_188993_A5447DEF 
X-CRM114-Status: GOOD (  23.90  )
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgNTowOOKAr1BNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gRW5h
YmxlIHJpbmctYmFzZWQgZGlydHkgbWVtb3J5IHRyYWNraW5nIG9uIHJpc2N2Ogo+Cj4gLSBFbmFi
bGUgQ09ORklHX0hBVkVfS1ZNX0RJUlRZX1JJTkdfQUNRX1JFTCBhcyByaXNjdiBpcyB3ZWFrbHkK
PiAgIG9yZGVyZWQuCj4gLSBTZXQgS1ZNX0RJUlRZX0xPR19QQUdFX09GRlNFVCBmb3IgdGhlIHJp
bmcgYnVmZmVyJ3MgcGh5c2ljYWwgcGFnZQo+ICAgb2Zmc2V0Lgo+IC0gQWRkIGEgY2hlY2sgdG8g
a3ZtX3ZjcHVfa3ZtX3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHMgZm9yIGNoZWNraW5nCj4gICB3
aGV0aGVyIHRoZSBkaXJ0eSByaW5nIGlzIHNvZnQgZnVsbC4KPgo+IFRvIGhhbmRsZSB2Q1BVIHJl
cXVlc3RzIHRoYXQgY2F1c2UgZXhpdHMgdG8gdXNlcnNwYWNlLCBtb2RpZmllZCB0aGUKPiBga3Zt
X3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHNgIHRvIHJldHVybiBhIHZhbHVlIChjdXJyZW50bHkg
b25seQo+IHJldHVybnMgMCBvciAxKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhv
dXF1YW5AaXNjYXMuYWMuY24+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRjaCBmb3IgTGludXgtNi4xNwoKVGhhbmtz
LApBbnVwCgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgICAgfCAgMiAr
LQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAgMSArCj4gIGFyY2gvcmlz
Y3Yva3ZtL0tjb25maWcgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5j
ICAgICAgICAgICAgIHwgMTggKysrKysrKysrKysrKysrKy0tCj4gIDQgZmlsZXMgY2hhbmdlZCwg
MTkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QK
PiBpbmRleCAxYmQyZDQyZTY0MjQuLjVkZTBmYmZlMmZjMCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2Fw
aS5yc3QKPiBAQCAtODMxNiw3ICs4MzE2LDcgQEAgY29yZSBjcnlzdGFsIGNsb2NrIGZyZXF1ZW5j
eSwgaWYgYSBub24temVybyBDUFVJRCAweDE1IGlzIGV4cG9zZWQgdG8gdGhlIGd1ZXN0Lgo+ICA3
LjM2IEtWTV9DQVBfRElSVFlfTE9HX1JJTkcvS1ZNX0NBUF9ESVJUWV9MT0dfUklOR19BQ1FfUkVM
Cj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPgo+IC06QXJjaGl0ZWN0dXJlczogeDg2LCBhcm02NAo+ICs6QXJjaGl0ZWN0dXJlczog
eDg2LCBhcm02NCwgcmlzY3YKPiAgOlR5cGU6IHZtCj4gIDpQYXJhbWV0ZXJzOiBhcmdzWzBdIC0g
c2l6ZSBvZiB0aGUgZGlydHkgbG9nIHJpbmcKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgK
PiBpbmRleCA1ZjU5ZmQyMjZjYzUuLmVmMjdkNDI4OWRhMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20va3ZtLmgKPiBAQCAtMTgsNiArMTgsNyBAQAo+ICAjZGVmaW5lIF9fS1ZNX0hBVkVfSVJR
X0xJTkUKPgo+ICAjZGVmaW5lIEtWTV9DT0FMRVNDRURfTU1JT19QQUdFX09GRlNFVCAxCj4gKyNk
ZWZpbmUgS1ZNX0RJUlRZX0xPR19QQUdFX09GRlNFVCA2NAo+Cj4gICNkZWZpbmUgS1ZNX0lOVEVS
UlVQVF9TRVQgICAgICAtMVUKPiAgI2RlZmluZSBLVk1fSU5URVJSVVBUX1VOU0VUICAgIC0yVQo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9LY29uZmlnIGIvYXJjaC9yaXNjdi9rdm0vS2Nv
bmZpZwo+IGluZGV4IDcwNGMyODk5MTk3ZS4uNWE2MjA5MWIwODA5IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL0tjb25maWcKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9LY29uZmlnCj4gQEAg
LTI1LDYgKzI1LDcgQEAgY29uZmlnIEtWTQo+ICAgICAgICAgc2VsZWN0IEhBVkVfS1ZNX01TSQo+
ICAgICAgICAgc2VsZWN0IEhBVkVfS1ZNX1ZDUFVfQVNZTkNfSU9DVEwKPiAgICAgICAgIHNlbGVj
dCBIQVZFX0tWTV9SRUFET05MWV9NRU0KPiArICAgICAgIHNlbGVjdCBIQVZFX0tWTV9ESVJUWV9S
SU5HX0FDUV9SRUwKPiAgICAgICAgIHNlbGVjdCBLVk1fQ09NTU9OCj4gICAgICAgICBzZWxlY3Qg
S1ZNX0dFTkVSSUNfRElSVFlMT0dfUkVBRF9QUk9URUNUCj4gICAgICAgICBzZWxlY3QgS1ZNX0dF
TkVSSUNfSEFSRFdBUkVfRU5BQkxJTkcKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNw
dS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggZTBhMDFhZjQyNmZmLi4wNTAyMTI1
ZWZiMzAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9y
aXNjdi9rdm0vdmNwdS5jCj4gQEAgLTY5MCw3ICs2OTAsMTQgQEAgdm9pZCBrdm1fYXJjaF92Y3B1
X3B1dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICB9Cj4gIH0KPgo+IC1zdGF0aWMg
dm9pZCBrdm1fcmlzY3ZfY2hlY2tfdmNwdV9yZXF1ZXN0cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4gKy8qKgo+ICsgKiBjaGVja192Y3B1X3JlcXVlc3RzIC0gY2hlY2sgYW5kIGhhbmRsZSBwZW5k
aW5nIHZDUFUgcmVxdWVzdHMKPiArICogQHZjcHU6ICAgICAgdGhlIFZDUFUgcG9pbnRlcgo+ICsg
Kgo+ICsgKiBSZXR1cm46IDEgaWYgd2Ugc2hvdWxkIGVudGVyIHRoZSBndWVzdAo+ICsgKiAgICAg
ICAgIDAgaWYgd2Ugc2hvdWxkIGV4aXQgdG8gdXNlcnNwYWNlCj4gKyAqLwo+ICtzdGF0aWMgaW50
IGt2bV9yaXNjdl9jaGVja192Y3B1X3JlcXVlc3RzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAg
ewo+ICAgICAgICAgc3RydWN0IHJjdXdhaXQgKndhaXQgPSBrdm1fYXJjaF92Y3B1X2dldF93YWl0
KHZjcHUpOwo+Cj4gQEAgLTczNSw3ICs3NDIsMTIgQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X2No
ZWNrX3ZjcHVfcmVxdWVzdHMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Cj4gICAgICAgICAgICAg
ICAgIGlmIChrdm1fY2hlY2tfcmVxdWVzdChLVk1fUkVRX1NURUFMX1VQREFURSwgdmNwdSkpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfcmVjb3JkX3N0ZWFsX3RpbWUo
dmNwdSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoa3ZtX2RpcnR5X3JpbmdfY2hlY2tfcmVx
dWVzdCh2Y3B1KSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAg
IH0KPiArCj4gKyAgICAgICByZXR1cm4gMTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIGt2bV9yaXNj
dl91cGRhdGVfaHZpcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gQEAgLTkxNyw3ICs5MjksOSBA
QCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+Cj4g
ICAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2Vfdm1pZF91cGRhdGUodmNwdSk7Cj4KPiAt
ICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2NoZWNrX3ZjcHVfcmVxdWVzdHModmNwdSk7Cj4gKyAg
ICAgICAgICAgICAgIHJldCA9IGt2bV9yaXNjdl9jaGVja192Y3B1X3JlcXVlc3RzKHZjcHUpOwo+
ICsgICAgICAgICAgICAgICBpZiAocmV0IDw9IDApCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7Cj4KPiAgICAgICAgICAgICAgICAgcHJlZW1wdF9kaXNhYmxlKCk7Cj4KPiAtLQo+
IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
