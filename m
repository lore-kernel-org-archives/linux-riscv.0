Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D4FEB64D0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 14:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcg0UcSMxumghqS6D/2Jr8Qm0wmRk6TCKveFNMUsLNw=; b=mGjg2pqDJ73c+N
	V6/DtkGiOH3BHocoPwf6Qb0ttQ5Hlu2LV2FsfQaZ+of0TGbttMkE0fQz3I3y7FzWTTzI+HjD1FxXf
	+r5Q12RUcxhYNt9+Oen+O4jQFiBWbfp0DzGY+7PDmiReQgJqixtxmdjgMQTSNSvmmvq3Fqyp09sdP
	8QpKy1e6tURUf88k+EVh1rktXLyHJP3yofVnRiHAAaZ0xOS+9r+1fby0gC0AVkyzfuRH8EtIETj6J
	WYwJy6a5HE8VTVCK7ZaFUb7zXswqjIFuvkaA8EsCom83tCIUHMknjCQbIHVkbJ328D6JeWCURmQYs
	9stLWjNzOcAkdktFxPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q94rm-008IWd-2Y;
	Tue, 13 Jun 2023 14:19:26 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q94rh-008IVL-37
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 14:19:24 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1a66e71f9so68576551fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 07:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1686665959; x=1689257959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G7WISwn9s1FAbksaD2ySHTKgO7VUIhbMY1jTirXvrw=;
        b=VwH3fqs2X4hcxz6P+8fjA8T2eB93MGDJrzwV+fuJx5r1AR922Z3dnYtUInF3o7UlnE
         X7+bKD75xNkz9hJqiEuVe8nN6RINGfW+BK5VBqODTD5SwWKdr7y1gBcuK2PxO+C3FYx4
         8pxhUH1DV/pzAf2RyTJ+WUS9BDENMJZxB4WUWSLlPFSZ08CDMDJsLNe89tXxiIKndnS8
         ByuLMLDx9WWGc17i2/O+GaBpTIeRY7wwzc0IkuzcNG9VnlqVD0LVeEcFXl0f3wYPvLiE
         JUW1XhF3HrhotH3379iETRcTPWjPqTM3YHGH4Chj/UhqYlZMUn5mXe3gukNDtLkxoDQz
         t4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686665959; x=1689257959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7G7WISwn9s1FAbksaD2ySHTKgO7VUIhbMY1jTirXvrw=;
        b=ABTJ2W4SuspKUPjoMafvb6zz/7VGSxYqViiUhnubPn+/S9ioOa/CeDLUxWR/lqEvgy
         p2DVM0PLU/UlxQNvGoFI47vnI9CCRi+W0i7AWQVL6U08isRK28quxzgpAqrB4qidWqDw
         7WuMGBAmD3OX8by9UCWPOLsEubxCrvfhSqCc948jC4lE824DemXen+giseJRXCcIYYco
         jxfGMPdVe5yKcqiBEsyMlwbO7K87puFEPlMj//CCyd29LeUYmwbB0Edms21IvNU6yG6Y
         BwbC7ttBE9fQpg4svVKE6VoEHHSda9ghbzMfonge2V2lXKYOdlpGrCgY9oZybhpXLMZ9
         3/fA==
X-Gm-Message-State: AC+VfDyv726bNof6NpyjP/u624Sj1zw/Oa178UUSo14Q4ZzO3PsLlpI9
	3usdWmoNyw1R2e2NETDu+irKLkFPFEvjhUM+NESB9w==
X-Google-Smtp-Source: ACHHUZ7lZwSYwjLPUf/5y6/cdfw7eI2TX61GvfBndGuTtP3wWsH9igBCJ8KOiFMdgB8yD4ANBNRyCka1/8jg1s3VVPA=
X-Received: by 2002:a05:651c:14f:b0:2af:2871:9a66 with SMTP id
 c15-20020a05651c014f00b002af28719a66mr5183509ljd.39.1686665959080; Tue, 13
 Jun 2023 07:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230605110724.21391-1-andy.chiu@sifive.com> <20230605110724.21391-10-andy.chiu@sifive.com>
 <5271851.rBgCu3BfMA@basile.remlab.net>
In-Reply-To: <5271851.rBgCu3BfMA@basile.remlab.net>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 13 Jun 2023 22:19:08 +0800
Message-ID: <CABgGipX95PsavJ-Wrpc2ziJ5xj6nRTJ9QjddOyCp6Bn=fwP3mw@mail.gmail.com>
Subject: Re: [PATCH -next v21 09/27] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Guo Ren <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_071922_004308_39509E66 
X-CRM114-Status: GOOD (  13.66  )
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

T24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMTA6MzbigK9QTSBSw6ltaSBEZW5pcy1Db3VybW9udCA8
cmVtaUByZW1sYWIubmV0PiB3cm90ZToKPgo+IExlIG1hYW5hbnRhaW5hIDUuIGtlc8Oka3V1dGEg
MjAyMywgMTQuMDcuMDYgRUVTVCBBbmR5IENoaXUgYSDDqWNyaXQgOgo+ID4gQEAgLTMyLDEzICs1
NCw4NiBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgcmlzY3Zfdl9kaXNhYmxlKHZvaWQp
Cj4gPiAgICAgICBjc3JfY2xlYXIoQ1NSX1NTVEFUVVMsIFNSX1ZTKTsKPiA+ICB9Cj4gPgo+ID4g
K3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBfX3ZzdGF0ZV9jc3Jfc2F2ZShzdHJ1Y3QgX19y
aXNjdl92X2V4dF9zdGF0ZQo+ID4gKmRlc3QpICt7Cj4gPiArICAgICBhc20gdm9sYXRpbGUgKAo+
ID4gKyAgICAgICAgICAgICAiY3NyciAgICUwLCAiIF9fc3RyaW5naWZ5KENTUl9WU1RBUlQpICJc
blx0Igo+ID4gKyAgICAgICAgICAgICAiY3NyciAgICUxLCAiIF9fc3RyaW5naWZ5KENTUl9WVFlQ
RSkgIlxuXHQiCj4gPiArICAgICAgICAgICAgICJjc3JyICAgJTIsICIgX19zdHJpbmdpZnkoQ1NS
X1ZMKSAiXG5cdCIKPiA+ICsgICAgICAgICAgICAgImNzcnIgICAlMywgIiBfX3N0cmluZ2lmeShD
U1JfVkNTUikgIlxuXHQiCj4gPiArICAgICAgICAgICAgIDogIj1yIiAoZGVzdC0+dnN0YXJ0KSwg
Ij1yIiAoZGVzdC0+dnR5cGUpLCAiPXIiIChkZXN0LQo+ID52bCksCj4gPiArICAgICAgICAgICAg
ICAgIj1yIiAoZGVzdC0+dmNzcikgOiA6KTsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIF9fYWx3
YXlzX2lubGluZSB2b2lkIF9fdnN0YXRlX2Nzcl9yZXN0b3JlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0
X3N0YXRlCj4gPiAqc3JjKSArewo+ID4gKyAgICAgYXNtIHZvbGF0aWxlICgKPiA+ICsgICAgICAg
ICAgICAgIi5vcHRpb24gcHVzaFxuXHQiCj4gPiArICAgICAgICAgICAgICIub3B0aW9uIGFyY2gs
ICt2XG5cdCIKPiA+ICsgICAgICAgICAgICAgInZzZXR2bCAgeDAsICUyLCAlMVxuXHQiCj4gPiAr
ICAgICAgICAgICAgICIub3B0aW9uIHBvcFxuXHQiCj4gPiArICAgICAgICAgICAgICJjc3J3ICAg
IiBfX3N0cmluZ2lmeShDU1JfVlNUQVJUKSAiLCAlMFxuXHQiCj4gPiArICAgICAgICAgICAgICJj
c3J3ICAgIiBfX3N0cmluZ2lmeShDU1JfVkNTUikgIiwgJTNcblx0Igo+ID4gKyAgICAgICAgICAg
ICA6IDogInIiIChzcmMtPnZzdGFydCksICJyIiAoc3JjLT52dHlwZSksICJyIiAoc3JjLT52bCks
Cj4gPiArICAgICAgICAgICAgICAgICAiciIgKHNyYy0+dmNzcikgOik7Cj4gPiArfQo+ID4gKwo+
ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUoc3RydWN0IF9fcmlz
Y3Zfdl9leHRfc3RhdGUKPiA+ICpzYXZlX3RvLCArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdm9pZCAqZGF0YXApCj4gPiArewo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyB2bDsK
PiA+ICsKPiA+ICsgICAgIHJpc2N2X3ZfZW5hYmxlKCk7Cj4gPiArICAgICBfX3ZzdGF0ZV9jc3Jf
c2F2ZShzYXZlX3RvKTsKPiA+ICsgICAgIGFzbSB2b2xhdGlsZSAoCj4gPiArICAgICAgICAgICAg
ICIub3B0aW9uIHB1c2hcblx0Igo+ID4gKyAgICAgICAgICAgICAiLm9wdGlvbiBhcmNoLCArdlxu
XHQiCj4gPiArICAgICAgICAgICAgICJ2c2V0dmxpICAgICAgICAlMCwgeDAsIGU4LCBtOCwgdGEs
IG1hXG5cdCIKPiA+ICsgICAgICAgICAgICAgInZzZTgudiAgICAgICAgIHYwLCAoJTEpXG5cdCIK
PiA+ICsgICAgICAgICAgICAgImFkZCAgICAgICAgICAgICUxLCAlMSwgJTBcblx0Igo+ID4gKyAg
ICAgICAgICAgICAidnNlOC52ICAgICAgICAgdjgsICglMSlcblx0Igo+ID4gKyAgICAgICAgICAg
ICAiYWRkICAgICAgICAgICAgJTEsICUxLCAlMFxuXHQiCj4gPiArICAgICAgICAgICAgICJ2c2U4
LnYgICAgICAgICB2MTYsICglMSlcblx0Igo+ID4gKyAgICAgICAgICAgICAiYWRkICAgICAgICAg
ICAgJTEsICUxLCAlMFxuXHQiCj4gPiArICAgICAgICAgICAgICJ2c2U4LnYgICAgICAgICB2MjQs
ICglMSlcblx0Igo+ID4gKyAgICAgICAgICAgICAiLm9wdGlvbiBwb3Bcblx0Igo+ID4gKyAgICAg
ICAgICAgICA6ICI9JnIiICh2bCkgOiAiciIgKGRhdGFwKSA6ICJtZW1vcnkiKTsKPiA+ICsgICAg
IHJpc2N2X3ZfZGlzYWJsZSgpOwo+ID4gK30KPgo+IFNob3VsZG4ndCB0aGlzIHVzZSBgdnM4ci52
YCByYXRoZXIgdGhhbiBgdnNlOC52YCwgYW5kIGRvIGF3YXkgd2l0aCBgdnNldHZsaWA/Cj4gVGhp
cyBzZWVtcyBsaWtlIGEgdGV4dGJvb2sgdXNlIGNhc2UgZm9yIHRoZSB3aG9sZS1yZWdpc3RlciBz
dG9yZSBpbnN0cnVjdGlvbiwKPiBubz8KClllcywgSSB0aGluayBpdCBpcyB3b3J0aCBjaGFuZ2lu
ZyB0byB3aG9sZS1yZWdpc3RlciBsb2FkL3N0b3JlCmluc3RydWN0aW9uLiBMZXQgbWUgZm9ybSBh
IGZvbGxvdy11cCBwYXRjaCB0byBpbXByb3ZlIGl0IGEgYml0LgoKPgo+ID4gKwo+ID4gK3N0YXRp
YyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUoc3RydWN0IF9fcmlzY3Zfdl9l
eHRfc3RhdGUKPiA+ICpyZXN0b3JlX2Zyb20sICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2b2lkCj4gKmRhdGFwKQo+ID4gK3sKPiA+ICsgICAgIHVuc2lnbmVkIGxv
bmcgdmw7Cj4gPiArCj4gPiArICAgICByaXNjdl92X2VuYWJsZSgpOwo+ID4gKyAgICAgYXNtIHZv
bGF0aWxlICgKPiA+ICsgICAgICAgICAgICAgIi5vcHRpb24gcHVzaFxuXHQiCj4gPiArICAgICAg
ICAgICAgICIub3B0aW9uIGFyY2gsICt2XG5cdCIKPiA+ICsgICAgICAgICAgICAgInZzZXR2bGkg
ICAgICAgICUwLCB4MCwgZTgsIG04LCB0YSwgbWFcblx0Igo+ID4gKyAgICAgICAgICAgICAidmxl
OC52ICAgICAgICAgdjAsICglMSlcblx0Igo+ID4gKyAgICAgICAgICAgICAiYWRkICAgICAgICAg
ICAgJTEsICUxLCAlMFxuXHQiCj4gPiArICAgICAgICAgICAgICJ2bGU4LnYgICAgICAgICB2OCwg
KCUxKVxuXHQiCj4gPiArICAgICAgICAgICAgICJhZGQgICAgICAgICAgICAlMSwgJTEsICUwXG5c
dCIKPiA+ICsgICAgICAgICAgICAgInZsZTgudiAgICAgICAgIHYxNiwgKCUxKVxuXHQiCj4gPiAr
ICAgICAgICAgICAgICJhZGQgICAgICAgICAgICAlMSwgJTEsICUwXG5cdCIKPiA+ICsgICAgICAg
ICAgICAgInZsZTgudiAgICAgICAgIHYyNCwgKCUxKVxuXHQiCj4gPiArICAgICAgICAgICAgICIu
b3B0aW9uIHBvcFxuXHQiCj4gPiArICAgICAgICAgICAgIDogIj0mciIgKHZsKSA6ICJyIiAoZGF0
YXApIDogIm1lbW9yeSIpOwo+ID4gKyAgICAgX192c3RhdGVfY3NyX3Jlc3RvcmUocmVzdG9yZV9m
cm9tKTsKPiA+ICsgICAgIHJpc2N2X3ZfZGlzYWJsZSgpOwo+ID4gK30KPiA+ICsKPgo+IERpdHRv
IGJ1dCBgdmw4ci52YC4KPgo+ID4gICNlbHNlIC8qICEgQ09ORklHX1JJU0NWX0lTQV9WICAqLwo+
ID4KPiA+ICBzdHJ1Y3QgcHRfcmVnczsKPiA+Cj4gPiAgc3RhdGljIGlubGluZSBpbnQgcmlzY3Zf
dl9zZXR1cF92c2l6ZSh2b2lkKSB7IHJldHVybiAtRU9QTk9UU1VQUDsgfQo+ID4gIHN0YXRpYyBf
X2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfdmVjdG9yKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9Cj4g
PiArc3RhdGljIGlubGluZSBib29sIHJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHN0cnVjdCBwdF9yZWdz
ICpyZWdzKSB7IHJldHVybgo+ID4gZmFsc2U7IH0gI2RlZmluZSByaXNjdl92X3ZzaXplICgwKQo+
ID4gKyNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb2ZmKHJlZ3MpICAgICAgICAgICAgIGRvIHt9IHdo
aWxlICgwKQo+ID4gKyNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb24ocmVncykgICAgICAgICAgICAg
ICAgICAgICAgZG8ge30gd2hpbGUgKDApCj4gPgo+ID4gICNlbmRpZiAvKiBDT05GSUdfUklTQ1Zf
SVNBX1YgKi8KPiA+Cj4KPgo+IC0tCj4g0KDQtdC80Lgg0JTRkdC90Lgt0JrRg9GA0LzQvtC9Cj4g
aHR0cDovL3d3dy5yZW1sYWIubmV0Lwo+Cj4KPgoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
