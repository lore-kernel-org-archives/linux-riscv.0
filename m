Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254DCCF6BF1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 06:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kM5DRENvleqPHLN5H5Slt2PYepui7SGAH46NiOKUu7A=; b=eadFR4mpZY7FGx
	1LnvafxaUV9jpJ1oTZXs+IeauFILO/x2IK0GLKMDxl8qEA4hn4t2ABjVdZilgvRtQeFgrJNQiuZxs
	X0qFZscrMMona2MTL81ScgRo+Yc2EPhF3Bt+KMUesiiNqIssJq57TH+50OJIgLPa769dAKWAyiLEF
	vPBoZpEX/1gYGzp1NlUg5x6IJe949Odgs0uDQQR0dguBssvErqntpcGzJ9XWA4IIzu50SXD36kF4k
	QYwAGzBsesR7l7dXbyBCXwc0PQDn290Wyi2J3dj+tBk5OrWUjc6wAdcMjZMQV17if4oKt1ZzfO9iX
	XeiOdfRT0DNk8nHrVFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdNMZ-0000000EEbl-40KM;
	Wed, 07 Jan 2026 06:49:47 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdNMX-0000000EEb2-2Xme
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 06:49:46 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b8052725de4so242586266b.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Jan 2026 22:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767768584; x=1768373384; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MruzDPuPyjqMG02vzzn+jTHVU5DsjGJw4xgCMw81cH0=;
        b=cHPH8HUiA05XhRwVCIaSacnCA65DarHauaGBBC7v6iJXpDl4F1Qk+tEXfxskqSSdOI
         QMZ4wSyOzn8x52Qm6Fefgtj720/jCUloClprSaOWlMre//Kf1QoLReDekQijGRCwtugL
         7PUMPY5sQz9LLpSsqe6OIxfpLxiSnwI8BpwHp+BxpHmc/VvS6ePfP9zVKkW5uDh67c5q
         1X0jQF+CDRx/Gmyy1kGD7ZoJZttsC8XSSKKFnS5b/PeOSMWfcsVB1mmkmjhEd05DUVW7
         H34qUjga+Dtjh8ASYSWRpumM2uHflydSDTCmFwNL7TsSlbAB4cMgOudmGQxIyd9Yea9N
         DAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767768584; x=1768373384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MruzDPuPyjqMG02vzzn+jTHVU5DsjGJw4xgCMw81cH0=;
        b=OZoH1dPLZ+7STi//cfJtwGQu0ZIJDu/D/PLkDSNRVUcD8RlPuOcL9DuYx09fdPhQB5
         D4u7wFdB9Afz15sXQZf/684bWOaRNyguGZkWWF2LkWzmcVtgE8E/2uP3j2RXtf+SXUfw
         onrCQosXPbo2L5QxegnnjSInPJpD8KXpmMzexW/czwOB+QKUTrEfV/KCsXRKiFcxC9Dy
         XqlTz62ECPIvxeXanp7B+bTpDhBCo0Nf3KIA+rOHPSN8BBsM2y7Cp+IGBl/WwyYmL6ut
         BNMGmkduk/L5KrXJJ/6VbAxqyFfVf+YKC2b+/I7czIr7mTwpVdU1WUL0WdWtEY/UpFum
         J3tQ==
X-Gm-Message-State: AOJu0Yxz7TSUZj4fGg6uafuGXe7TTHgVSMezBpPQMrYTZK/yxZlWS4GD
	XU5+MwqQQhTXT/iE8tM9o2fRUL25niIwmPEr+W8xuaT5WKXwIjCRCe83nCo8CwJzb3DoZGRziKr
	Pv85iu8oKdBRo3ApLJZL1iV38MGV1f98=
X-Gm-Gg: AY/fxX5uLC/iqgny4XGozbDPvOw8wSBHpJqzQi3u6QUdHwYdyXX/hdbKk4JokjMnPJj
	L+9uLli8UtBVDWMOSdZZBtUji96EuFsqxLRMZXEMZoIy++HPvExggOZz08Zz3smyZCFMKzKiNuo
	qFqh0qm4RJh6HduYyGcDeSCzaPenwLPeUVZeMLfsbMWWdMv6PaGTReKtYd96P3uQ7zkFY5CjKK/
	tsO4HCARnI8Kas80uH9ap2xiaktQEdbYTzS9zpNfPDT9IA554fASwzxHE7SKx+oHI+G4UlLmCZB
	mB0=
X-Google-Smtp-Source: AGHT+IGXtnZX3Swzs9B+00UHoAzzviOLssA0wkACNyEJ5yFA3/knUSfykJRhk38tEfAOVp6ApFlsUl5OhL93K4wP718=
X-Received: by 2002:a17:907:72cf:b0:b73:9368:ad5e with SMTP id
 a640c23a62f3a-b8444f7084emr133346866b.34.1767768583459; Tue, 06 Jan 2026
 22:49:43 -0800 (PST)
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com> <20251214163537.1054292-3-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-3-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 7 Jan 2026 00:49:31 -0600
X-Gm-Features: AQt7F2ozAc5Va5NPuQD8aSTCr0IKOoMt4EUoI_SUlzkZUzaEwNcuXeVhPJX-CK4
Message-ID: <CAFTtA3MdoL5XjcjTrNhZ27UXZe4Mxot-rttc8cQ-K=E-Mh164A@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] riscv: vector: init vector context with proper vlenb
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_224945_662618_A28860F0 
X-CRM114-Status: GOOD (  18.75  )
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

T24gU3VuLCBEZWMgMTQsIDIwMjUgYXQgMTA6MzXigK9BTSBTZXJnZXkgTWF0eXVrZXZpY2ggPGdl
b21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdnN0YXRlIGluIHRocmVhZF9zdHJ1Y3Qg
aXMgemVyb2VkIHdoZW4gdGhlIHZlY3RvciBjb250ZXh0IGlzCj4gaW5pdGlhbGl6ZWQuIFRoYXQg
aW5jbHVkZXMgcmVhZC1vbmx5IHJlZ2lzdGVyIHZsZW5iLCB3aGljaCBob2xkcwo+IHRoZSB2ZWN0
b3IgcmVnaXN0ZXIgbGVuZ3RoIGluIGJ5dGVzLiBaZXJvZWQgc3RhdGUgcGVyc2lzdHMgdW50aWwK
PiBtc3RhdHVzLlZTIGJlY29tZXMgJ2RpcnR5JyBhbmQgYSBjb250ZXh0IHN3aXRjaCBzYXZlcyB0
aGUgYWN0dWFsCj4gaGFyZHdhcmUgdmFsdWVzLgo+Cj4gVGhpcyBjYW4gZXhwb3NlIHRoZSB6ZXJv
IHZsZW5iIHZhbHVlIHRvIHRoZSB1c2VyLXNwYWNlIGluIGVhcmx5Cj4gZGVidWcgc2NlbmFyaW9z
LCBlLmcuIHdoZW4gcHRyYWNlIGF0dGFjaGVzIHRvIGEgdHJhY2VkIHByb2Nlc3MKPiBlYXJseSwg
YmVmb3JlIGFueSB2ZWN0b3IgaW5zdHJ1Y3Rpb24gZXhjZXB0IHRoZSBmaXJzdCBvbmUgd2FzCj4g
ZXhlY3V0ZWQuCj4KPiBGaXggdGhpcyBieSBzcGVjaWZ5aW5nIHByb3BlciB2bGVuYiBvbiB2ZWN0
b3IgY29udGV4dCBpbml0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IE1hdHl1a2V2aWNoIDxn
ZW9tYXRzaUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFp
bC5jb20+Cgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyB8IDEyICsrKysrKysr
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdmVjdG9yLmMKPiBpbmRleCAzZWQwNzFkYWI5ZDguLmIxMTIxNjZkNTFlOSAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3ZlY3Rvci5jCj4gQEAgLTExMSw4ICsxMTEsOCBAQCBib29sIGluc25faXNfdmVjdG9yKHUz
MiBpbnNuX2J1ZikKPiAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgfQo+Cj4gLXN0YXRpYyBpbnQg
cmlzY3Zfdl90aHJlYWRfemFsbG9jKHN0cnVjdCBrbWVtX2NhY2hlICpjYWNoZSwKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqY3R4
KQo+ICtzdGF0aWMgaW50IHJpc2N2X3ZfdGhyZWFkX2N0eF9hbGxvYyhzdHJ1Y3Qga21lbV9jYWNo
ZSAqY2FjaGUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IF9f
cmlzY3Zfdl9leHRfc3RhdGUgKmN0eCkKPiAgewo+ICAgICAgICAgdm9pZCAqZGF0YXA7Cj4KPiBA
QCAtMTIyLDEzICsxMjIsMTUgQEAgc3RhdGljIGludCByaXNjdl92X3RocmVhZF96YWxsb2Moc3Ry
dWN0IGttZW1fY2FjaGUgKmNhY2hlLAo+Cj4gICAgICAgICBjdHgtPmRhdGFwID0gZGF0YXA7Cj4g
ICAgICAgICBtZW1zZXQoY3R4LCAwLCBvZmZzZXRvZihzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0
ZSwgZGF0YXApKTsKPiArICAgICAgIGN0eC0+dmxlbmIgPSByaXNjdl92X3ZzaXplIC8gMzI7Cj4g
Kwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICB2b2lkIHJpc2N2X3ZfdGhyZWFkX2FsbG9j
KHN0cnVjdCB0YXNrX3N0cnVjdCAqdHNrKQo+ICB7Cj4gICNpZmRlZiBDT05GSUdfUklTQ1ZfSVNB
X1ZfUFJFRU1QVElWRQo+IC0gICAgICAgcmlzY3Zfdl90aHJlYWRfemFsbG9jKHJpc2N2X3Zfa2Vy
bmVsX2NhY2hlcCwgJnRzay0+dGhyZWFkLmtlcm5lbF92c3RhdGUpOwo+ICsgICAgICAgcmlzY3Zf
dl90aHJlYWRfY3R4X2FsbG9jKHJpc2N2X3Zfa2VybmVsX2NhY2hlcCwgJnRzay0+dGhyZWFkLmtl
cm5lbF92c3RhdGUpOwo+ICAjZW5kaWYKPiAgfQo+Cj4gQEAgLTIxNCwxMiArMjE2LDE0IEBAIGJv
b2wgcmlzY3Zfdl9maXJzdF91c2VfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAgICAg
ICAgICAqIGNvbnRleHQgd2hlcmUgVlMgaGFzIGJlZW4gb2ZmLiBTbywgdHJ5IHRvIGFsbG9jYXRl
IHRoZSB1c2VyJ3MgVgo+ICAgICAgICAgICogY29udGV4dCBhbmQgcmVzdW1lIGV4ZWN1dGlvbi4K
PiAgICAgICAgICAqLwo+IC0gICAgICAgaWYgKHJpc2N2X3ZfdGhyZWFkX3phbGxvYyhyaXNjdl92
X3VzZXJfY2FjaGVwLCAmY3VycmVudC0+dGhyZWFkLnZzdGF0ZSkpIHsKPiArICAgICAgIGlmIChy
aXNjdl92X3RocmVhZF9jdHhfYWxsb2MocmlzY3Zfdl91c2VyX2NhY2hlcCwgJmN1cnJlbnQtPnRo
cmVhZC52c3RhdGUpKSB7Cj4gICAgICAgICAgICAgICAgIGZvcmNlX3NpZyhTSUdCVVMpOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiAgICAgICAgIH0KPiArCj4gICAgICAgICByaXNj
dl92X3ZzdGF0ZV9vbihyZWdzKTsKPiAgICAgICAgIHJpc2N2X3ZfdnN0YXRlX3NldF9yZXN0b3Jl
KGN1cnJlbnQsIHJlZ3MpOwo+ICsKPiAgICAgICAgIHJldHVybiB0cnVlOwo+ICB9Cj4KPiAtLQo+
IDIuNTIuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
