Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8F9C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 03:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nl6ThV/wFBnjg3Fh51bKC/4eizKtPlY8DhGQ1/sZyBY=; b=Oy1gZRTvRb2K26
	fQKlJsJqUMd6JVvI6ob0KFrlGvzdulAbdWIY70RkaLpnvUtVRvt6oLJamHF7lQ6jRj4Ja9t9MDUOb
	Rn2X1ZL/WhTEUPjiDdk2FMwsRQQZ0ap8oHa7SZXMeancg8rmCWgw8BtgdjqUM2skk+IULm4y+qxKN
	ii3gNs6mcK5+Rz6iyzNVmStVP+aga6x3vnAY8DgBZTadHrGsWcDb6mo/PNugriuCuiXZ7Jzg2Zhx2
	0quxa3FuUcmpbGbDDegUiyKF6zai/ieXJryAMxqyNT3g2ItPK8KnFQmADyLhLXsLKOjkhZAKO+So/
	yGWATTM0Gu6Uq8leXTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwvmA-0000000EYfW-1uSz;
	Wed, 17 Apr 2024 03:15:58 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwvm7-0000000EYeF-1K2X
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 03:15:57 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-22edbb5dd40so135226fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713323749; x=1713928549; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9Z++jv9thhXwuK9ebCXoyfu1FayJyWXQhF4Y4dqH70=;
        b=NpfGp2FtNIKqWtauorD+uDmVHf8ho9TZokyvGsIiRkDFT+kPEN9mTp5lgpF9Mh2ukP
         XyY1KJD4nlAZRKQeTC5qh3W7aRCHHx3eAHMrKu8e+7yIMoz7tsM3gFNpiIIN+9S4kwrg
         v5rsqUEMApx3G+NCeRwmtEJnUktF8UPZkQJcg+9nYfYomy+RSZ4j3swzdljIUdnV9vmr
         8ocEkGSt7BsuFTe41r1kA1QQdltDCaTL21suSAvYPwvaXoz0jPxpjRecIN0v7BwFDc0I
         75js6vlA5VFx4doGbyBUPBEwaLBeOAM/vQH+bfEi86iQzsUTSkuGV+kQofKD6GZd6Qqh
         zNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713323749; x=1713928549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9Z++jv9thhXwuK9ebCXoyfu1FayJyWXQhF4Y4dqH70=;
        b=M8eLU5RYLNcKGYK3H5SL1KS3mOU9pFyU/GVBahJ4mir/X3Dp2KXzMONOd2qI60mVTV
         EsDGnU3KfdChn0E2zM4BrdcXDF27R2lIjZcz8cGQlTNeFxh34JBzbSiF/rMv67Babpld
         e7/ibe8+GqDs4l9N3EKX40mRKTH5EM6Xym+bk8f2/1UR61qDL6m+ohB1QrNpgUXGyRXH
         HFVWzGJhXmCDdhw37wbW9txVnDrTycO9RKzEpFyHb7BOEvsEGgae/MmxTcryHXQ9eadw
         BTAWEkPgGST0pSXnF51t5dOlkWIuIb/N8E0+iywbo/ReL+TSOxJLHQmwZqGXmUSOv+Nk
         0Qng==
X-Forwarded-Encrypted: i=1; AJvYcCU4GqcxqLN99I6l/+wHmlA+yI2rpsNsuHaXtigvbBxmHv1DvndPZqiZuJyrYcP59KWuetzu/KiW3Ut5+9k3udGFo/Qnnbf+ZaVriBUGFOd9
X-Gm-Message-State: AOJu0Yy3qQ69XN+xJl1aUpSzeRtEDI5HO0aJyd+4bMiWxWuIeWtvrdPm
	23Qt5Aqdom5oq9Y5n675Petp5aeIZoUg77OjkIVBhEYebD1l4XFm5b/SYfZBAQlo2hskrLrnbyK
	w0R6cHcQM8RgolfwK2Uv5QTsxIpT2UbPoS4vAAw==
X-Google-Smtp-Source: AGHT+IG7+SlzZiYgUQUE9mnnio01KvFFZXX0TXlXW4MiCLJOo1mTdXknFxGrqYT18e/8jaVZSK+07OkTH2bc9Zfj+IE=
X-Received: by 2002:a05:6870:51b:b0:22a:a34a:c995 with SMTP id
 j27-20020a056870051b00b0022aa34ac995mr1355278oao.17.1713323749172; Tue, 16
 Apr 2024 20:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240416031438.7637-1-cuiyunhui@bytedance.com>
 <20240416031438.7637-2-cuiyunhui@bytedance.com> <9f36bedd-1a68-43a9-826d-ce56caf01c52@arm.com>
In-Reply-To: <9f36bedd-1a68-43a9-826d-ce56caf01c52@arm.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 17 Apr 2024 11:15:38 +0800
Message-ID: <CAEEQ3w=W+xLGP3WsyAQmRNaHm1xVRtqcGJ+t0TnZvJdCTR4v6w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com, 
	james.morse@arm.com, jhugo@codeaurora.org, john.garry@huawei.com, 
	Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, sudeep.holla@arm.com, 
	tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_201555_693665_65FF1A59 
X-CRM114-Status: GOOD (  21.91  )
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

SGkgSmVyZW15LAoKT24gV2VkLCBBcHIgMTcsIDIwMjQgYXQgNDowNOKAr0FNIEplcmVteSBMaW50
b24gPGplcmVteS5saW50b25AYXJtLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+Cj4gT24gNC8xNS8y
NCAyMjoxNCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IEJlZm9yZSBjYWNoZWluZm8gY2FuIGJlIGJ1
aWx0IGNvcnJlY3RseSwgd2UgbmVlZCB0byBpbml0aWFsaXplIGxldmVsCj4gPiBhbmQgdHlwZS4g
U2luY2UgUlNJQy1WIGN1cnJlbnRseSBkb2VzIG5vdCBoYXZlIGEgcmVnaXN0ZXIgZ3JvdXAgdGhh
dAo+ID4gZGVzY3JpYmVzIGNhY2hlLXJlbGF0ZWQgYXR0cmlidXRlcyBsaWtlIEFSTTY0LCB3ZSBj
YW5ub3Qgb2J0YWluIHRoZW0KPiA+IGRpcmVjdGx5LCBzbyBub3cgd2Ugb2J0YWluIGNhY2hlIGxl
YXZlcyBmcm9tIHRoZSBBQ1BJIFBQVFQgdGFibGUKPiA+IChhY3BpX2dldF9jYWNoZV9pbmZvKCkp
IGFuZCBzZXQgdGhlIGNhY2hlIHR5cGUgdGhyb3VnaCBzcGxpdF9sZXZlbHMuCj4gPgo+ID4gU3Vn
Z2VzdGVkLWJ5OiBKZXJlbXkgTGludG9uIDxqZXJlbXkubGludG9uQGFybS5jb20+Cj4gPiBTdWdn
ZXN0ZWQtYnk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4g
ICBhcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyB8IDIwICsrKysrKysrKysrKysrKysrKysr
Cj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY2Fj
aGVpbmZvLmMKPiA+IGluZGV4IDMwYTY4NzgyODdhZC4uZGM1ZmI3MDM2MmYxIDEwMDY0NAo+ID4g
LS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL2NhY2hlaW5mby5jCj4gPiBAQCAtNiw2ICs2LDcgQEAKPiA+ICAgI2luY2x1ZGUgPGxp
bnV4L2NwdS5oPgo+ID4gICAjaW5jbHVkZSA8bGludXgvb2YuaD4KPiA+ICAgI2luY2x1ZGUgPGFz
bS9jYWNoZWluZm8uaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvYWNwaS5oPgo+ID4KPiA+ICAgc3Rh
dGljIHN0cnVjdCByaXNjdl9jYWNoZWluZm9fb3BzICpydl9jYWNoZV9vcHM7Cj4gPgo+ID4gQEAg
LTc4LDYgKzc5LDI1IEBAIGludCBwb3B1bGF0ZV9jYWNoZV9sZWF2ZXModW5zaWduZWQgaW50IGNw
dSkKPiA+ICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcHJldiA9IE5VTEw7Cj4gPiAgICAgICBp
bnQgbGV2ZWxzID0gMSwgbGV2ZWwgPSAxOwo+ID4KPiA+ICsgICAgIGlmICghYWNwaV9kaXNhYmxl
ZCkgewo+ID4gKyAgICAgICAgICAgICBpbnQgcmV0LCBpZHgsIGZ3X2xldmVscywgc3BsaXRfbGV2
ZWxzOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICByZXQgPSBhY3BpX2dldF9jYWNoZV9pbmZvKGNw
dSwgJmZ3X2xldmVscywgJnNwbGl0X2xldmVscyk7Cj4gPiArICAgICAgICAgICAgIGlmIChyZXQp
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsKPiA+ICsgICAgICAg
ICAgICAgZm9yIChpZHggPSAwOyBsZXZlbCA8PSB0aGlzX2NwdV9jaS0+bnVtX2xldmVscyAmJgo+
ID4gKyAgICAgICAgICAgICAgICAgIGlkeCA8IHRoaXNfY3B1X2NpLT5udW1fbGVhdmVzOyBpZHgr
KywgbGV2ZWwrKykgewo+Cj4gQUZBSUsgdGhlIHB1cnBvc2Ugb2YgaWR4IGhlcmUgaXQgdG8gYXNz
dXJlIHRoYXQgdGhlIG51bWJlciBvZiBjYWNoZQo+IGxlYXZlcyBpcyBub3Qgb3ZlcmZsb3dpbmcu
IEJ1dCByaWdodCBiZWxvdyB3ZSBhcmUgdXRpbGl6aW5nIHR3byBvZiB0aGVtCj4gYXQgb25jZSwg
c28gdGhpcyBjaGVjayBpc24ndCBjb3JyZWN0LiBPVE9ILCBzaW5jZSBpdHMgYWxsb2NhdGVkIGFz
Cj4gbGV2ZWxzICsgc3BsaXRfbGV2ZWxzIEkgZG9uJ3QgdGhpbmsgaXRzIGFjdHVhbGx5IHBvc3Np
YmxlIGZvciB0aGlzIHRvCj4gY2F1c2UgYSBwcm9ibGVtLiBNaWdodCBiZSB3b3J0aHdoaWxlIHRv
IGp1c3QgaG9pc3QgaXQgYmVmb3JlIHRoZSBsb29wCj4gYW5kIHJldmFsaWRhdGUgdGhlIHRvdGFs
IGxlYXZlcyBhYm91dCB0byBiZSB1dGlsaXplZC4KPgoKRG8geW91IG1lYW4gdG8gbW9kaWZ5IHRo
ZSBsb2dpYyBhcyBmb2xsb3dzIHRvIG1ha2UgaXQgbW9yZSBjb21wbGV0ZT8KZm9yIChpZHggPSAw
OyBsZXZlbCA8PSB0aGlzX2NwdV9jaS0+bnVtX2xldmVscyAmJgogICAgICBpZHggPCB0aGlzX2Nw
dV9jaS0+bnVtX2xlYXZlczsgbGV2ZWwrKykgewogICAgICAgIGlmIChsZXZlbCA8PSBzcGxpdF9s
ZXZlbHMpIHsKICAgICAgICAgICAgICAgY2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9U
WVBFX0RBVEEsIGxldmVsKTsKICAgICAgICAgICAgICAgaWR4Kys7CiAgICAgICAgICAgICAgIGNp
X2xlYWZfaW5pdCh0aGlzX2xlYWYrKywgQ0FDSEVfVFlQRV9JTlNULCBsZXZlbCk7CiAgICAgICAg
ICAgICAgIGlkeCsrOwogICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgICAgY2lfbGVhZl9pbml0
KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX1VOSUZJRUQsIGxldmVsKTsKICAgICAgICAgICAgICAg
aWR4Kys7CiAgICAgIH0KfQoKClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
