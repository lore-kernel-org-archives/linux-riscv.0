Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56030C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2GKIsXYsYmyYEZ8NeiLdJihnvZ7Ji1ghtn3s1Q6UaQ=; b=HOc7uR7AqIdnP4
	3FGA5krV8iGajRLS0F9qz4Q1F3LSKWUFGXoRVMdiFWBLBpzksmguyqgr0z15YSgaFGSmn5JiNzeuP
	tv4x56EVhCgWsb+hM4ZSvM05a45Z44I5oHuI9MPP2ynBbrDuYAUiAJN4kYDJay/ot9ihxON2Go2X9
	75+WWRROYL41MT4yHGWweh+JWJ9jeoiFr6/BTgUREaw4TNHjIBON1kbkaUvcnB9n2BFbXJDzzCh7e
	449z0nL5DQe+E6xCKYdz1A6KwIrBpEFDOgyLvMkPvTU9YYlMEASKplXIAeHYw7WajY5Z3MWbjIY0x
	/n/Cf/UsyZrH6dkSll5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwL4B-000000087mo-2n68;
	Mon, 15 Apr 2024 12:04:07 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwL40-000000087jj-3Ia8
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 12:04:07 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-2331bef249eso1302661fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 05:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713182630; x=1713787430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUM9SS9JNPHB2GD0yvR5K/5tFBuL0BhdH0M+pWpbQJA=;
        b=g+4g+9VKF/KqW19dnR+LcqAONIanqjEd7BAywWf7oRFeDjrgvZrh+91svWmL/IzBmh
         YZzHGMZLkT6WjKvemph7BJW17c0CRShVLwFNDbMSqs5TwjBoKgvWlxwGoAzIY+7eWQ6f
         hgfkp7Ee8ll6fGmi19Vy5RmHiZLqylMrb/RaV/J/5OIOEyrpcotLQyuih2eQU4J7PzJS
         rCy717LjDdoQUg2GxSi7rBd93V5/IQc3YKbTx6e6Ik0mndS3lSYlOCX5W4j+vPlMEbGK
         qFoRLCMLtn7E15sddoRRSn9s1ohVk0ecHbRjZbe0PxLidXm4ZD09q9FuVRJxUCphd6zJ
         7EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713182630; x=1713787430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUM9SS9JNPHB2GD0yvR5K/5tFBuL0BhdH0M+pWpbQJA=;
        b=TEuABtZSfZctz1bw+34zSG6BG4Juv/5SrFa5LAfthyAkqX2xYH27uua6LIZW75uYwK
         EihRSeF7PySGycVRADQpCQlLxdP5ATBeySmVoxqj/J20aJcY7Hi8I1X/rcoX4DBimahk
         nb+UXPH4NBPNyxYC/Y2Winb+qZywHRSgq8CHQxWkwMJJn699ebdSpQ9s9EcZuKbPoiTk
         LSauxXX39J//D+KI3l053NpiTtou92/Xf9VeXJz6N8FAigKNNK0jYJwrUBAaY6cOPhlQ
         N9NlsN3C5ThMVQJs9S90Z7Tk7cyn3HXqWcZh4xgZShVYYmBzFMvWfyBAriFxcsyi4Lp5
         Qz9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUu8PyaI08rxE8IQTQAmu8T0KQwS1Pf3oZsQA2xnQSIUSGYR3pRnA3NVYcldzKAN00puCpchZtBWZxfWnSpZncb66wEbTs6W5luo1SRywX4
X-Gm-Message-State: AOJu0YyFwRNnmmBonB+1ZoRcq5Bui51japFpSeFPtsr9iamagLVI4Eis
	9stUGUxbIjwGxknzVPxhh2SacA2rPAZwzaggBVlL+tZHTl5J1574RQJn7OzhWzn5i1LL9j3A4Qx
	41NhqndU2YmJVBFnJU6huo7sfLnS7Wp+u9oyFNQ==
X-Google-Smtp-Source: AGHT+IF+ysnzqvijegluvjiwQKxRcx13O9ZDpCztSQtH8QXKxsIagGyKK5PKiNKWo1TCoNguxXwOTSWqBx38mQ3RLEE=
X-Received: by 2002:a05:6871:28a9:b0:220:8bd2:cd09 with SMTP id
 bq41-20020a05687128a900b002208bd2cd09mr12160806oac.32.1713182629917; Mon, 15
 Apr 2024 05:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240414025826.64025-1-cuiyunhui@bytedance.com>
 <20240414025826.64025-2-cuiyunhui@bytedance.com> <Zhzo_gWFiURs_geD@bogus>
In-Reply-To: <Zhzo_gWFiURs_geD@bogus>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 15 Apr 2024 20:03:38 +0800
Message-ID: <CAEEQ3wkzvOpahzPuoD7=aMG3srjdyCA21tnh-j9PvY3Qerk_hg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 2/3] riscv: cacheinfo: initialize
 cacheinfo's level and type from ACPI PPTT
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, bhelgaas@google.com, 
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com, 
	john.garry@huawei.com, Jonathan.Cameron@huawei.com, pierre.gondois@arm.com, 
	tiantao6@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_050356_873595_B2F85936 
X-CRM114-Status: GOOD (  24.11  )
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

SGkgU3VkZWVwLAoKT24gTW9uLCBBcHIgMTUsIDIwMjQgYXQgNDo0NeKAr1BNIFN1ZGVlcCBIb2xs
YSA8c3VkZWVwLmhvbGxhQGFybS5jb20+IHdyb3RlOgo+Cj4gT24gU3VuLCBBcHIgMTQsIDIwMjQg
YXQgMTA6NTg6MjVBTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IEJlZm9yZSBjYWNoZWlu
Zm8gY2FuIGJlIGJ1aWx0IGNvcnJlY3RseSwgd2UgbmVlZCB0byBpbml0aWFsaXplIGxldmVsCj4g
PiBhbmQgdHlwZS4gU2luY2UgUlNJQy1WIGN1cnJlbnRseSBkb2VzIG5vdCBoYXZlIGEgcmVnaXN0
ZXIgZ3JvdXAgdGhhdAo+ID4gZGVzY3JpYmVzIGNhY2hlLXJlbGF0ZWQgYXR0cmlidXRlcyBsaWtl
IEFSTTY0LCB3ZSBjYW5ub3Qgb2J0YWluIHRoZW0KPiA+IGRpcmVjdGx5LCBzbyBub3cgd2Ugb2J0
YWluIGNhY2hlIGxlYXZlcyBmcm9tIHRoZSBBQ1BJIFBQVFQgdGFibGUKPiA+IChhY3BpX2dldF9j
YWNoZV9pbmZvKCkpIGFuZCBzZXQgdGhlIGNhY2hlIHR5cGUgdGhyb3VnaCBzcGxpdF9sZXZlbHMu
Cj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBKZXJlbXkgTGludG9uIDxqZXJlbXkubGludG9uQGFybS5j
b20+Cj4gPiBTdWdnZXN0ZWQtYnk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFybS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4K
PiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIHwgMjMgKysrKysrKysr
KysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyBiL2FyY2gvcmlz
Y3Yva2VybmVsL2NhY2hlaW5mby5jCj4gPiBpbmRleCAzMGE2ODc4Mjg3YWQuLmVjZTkyYWE0MDRl
MyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4gPiArKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYwo+ID4gQEAgLTYsNiArNiw3IEBACj4gPiAg
I2luY2x1ZGUgPGxpbnV4L2NwdS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ID4gICNp
bmNsdWRlIDxhc20vY2FjaGVpbmZvLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KPiA+
Cj4gPiAgc3RhdGljIHN0cnVjdCByaXNjdl9jYWNoZWluZm9fb3BzICpydl9jYWNoZV9vcHM7Cj4g
Pgo+ID4gQEAgLTc4LDYgKzc5LDI4IEBAIGludCBwb3B1bGF0ZV9jYWNoZV9sZWF2ZXModW5zaWdu
ZWQgaW50IGNwdSkKPiA+ICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcHJldiA9IE5VTEw7Cj4g
PiAgICAgICBpbnQgbGV2ZWxzID0gMSwgbGV2ZWwgPSAxOwo+ID4KPiA+ICsgICAgIGlmICghYWNw
aV9kaXNhYmxlZCkgewo+ID4gKyAgICAgICAgICAgICBpbnQgcmV0LCBpZHgsIGZ3X2xldmVscywg
c3BsaXRfbGV2ZWxzOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICByZXQgPSBhY3BpX2dldF9jYWNo
ZV9pbmZvKGNwdSwgJmZ3X2xldmVscywgJnNwbGl0X2xldmVscyk7Cj4gPiArICAgICAgICAgICAg
IGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsKPiA+
ICsgICAgICAgICAgICAgLyogbXVzdCBiZSBzZXQsIHNvIHdlIGNhbiBkcm9wIG51bV9sZWF2ZXMg
YXNzaWdubWVudCBiZWxvdyAqLwo+Cj4gSSBpbnRlbnRpb25hbGx5IGFkZGVkIHRoaXMgYWJvdmUg
Y29tbWVudCB0byBjaGVjayBhbmQgZHJvcCB0aGUgYmVsb3cgc3RhdGVtZW50Cj4gaWYgaXQgaXMg
YWxyZWFkeSBzZXQuIFBsZWFzZSBjaGVjayBpZiB0aGUgdmFsdWUgaXMgYWxyZWFkeSBzZXQgd2hl
biB3ZSBjYWxsCj4gaW50byB0aGlzIGZ1bmN0aW9uKHdoaWNoIEkgdGhpbmsgaXMgdGhlIGNhc2Up
Lgo+Cj4gPiArICAgICAgICAgICAgIHRoaXNfY3B1X2NpLT5udW1fbGVhdmVzID0gZndfbGV2ZWxz
ICsgc3BsaXRfbGV2ZWxzOwoKVWgsZ290IGl0LiBJIHVuZGVyc3RhbmQgdGhhdCB0aGVyZSBpcyBu
byBuZWVkIHRvIGFkZCB0aGlzIGxpbmU6CiJ0aGlzX2NwdV9jaS0+bnVtX2xlYXZlcyA9IGZ3X2xl
dmVscyArIHNwbGl0X2xldmVsczsgIiAsIGJlY2F1c2UgaW4KdGhlIE1hc3RlciBjb3JlIGZpcnN0
IGl0IHdpbGw6CnNtcF9wcmVwYXJlX2NwdXMKICAgICAtPmluaXRfY3B1X3RvcG9sb2d5CiAgICAg
ICAgICAtPmZvcl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKICAgICAgICAgICAgICAgICBmZXRj
aF9jYWNoZV9pbmZvKGNwdSk7IC8vbnVtX2xlYXZlcyBhbmQgbnVtX2xldmVscyB3aWxsIGJlIHNl
dApUaGVuIHN0b3JlX2NwdV90b3BvbG9neS0+dXBkYXRlX3NpYmxpbmdzX21hc2tzLT5kZXRlY3Rf
Y2FjaGVfYXR0cmlidXRlcy0+cG9wdWxhdGVfY2FjaGVfbGVhdmVzKCkuCgpTbGF2ZSBjb3JlIHdp
bGwgZm9sbG93IHRoZSBsb2dpYyBvZiBzbXBfY2FsbGluLT5zdG9yZV9jcHVfdG9wb2xvZ3koKS4K
SXQncyB0aGUgc2FtZSBhZnRlciBJIHRlc3RlZCBpdCwgc28gSSBwbGFuIHRvIHJlbW92ZSB0aGF0
IGxpbmUgYW5kCnVwZGF0ZSBWMywgd2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3MsCll1bmh1aQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
