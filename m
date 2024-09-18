Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38EACAC5B2
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 02:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfKZlzfQnC3bVQZN4Gj+nS45aSCbLMrxOxPHAMfZCw8=; b=oN0/iXTrWitxBs
	5VyZzhaU+bEW5v3NGDEbZ9N41O8Uc8Gy5IwV0fCOLCtcv4Z1Eb/puFRh5WOkJuaXnNGDPpYQRB5Qo
	Wtdd6VoeTDT5eFkskbLzRYMgrZ7iXrRSq7wNOs90vZhjZbZYhefh1Cp4uEdA6cwgRvjReiDLU1TfE
	rejlTEjl0ATWi4WKD3hWqAR5kzox9vbihE2rA2aIwXLwHCESEJ+ZxVO577P52hhsB6Xp5n2EwtVhC
	7me0sZib3UTzFir6g97dbAlIX9NGbtY0vDrEaM54eSpldJkjE6yP1m/IsGeaWiu6zHv6C4b8rGHPl
	rVfvQ9ny9ndSVWOMx/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqkIN-00000007JNU-28Wu;
	Wed, 18 Sep 2024 02:19:55 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqkIK-00000007JN0-3FXX
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 02:19:54 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3e03c736466so3898735b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 19:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1726625986; x=1727230786; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38IQuyNYr4G9x/ownl5XlsDSTzr49ps/SxbJM8SwQFo=;
        b=flJhB+KfQMbuS1OvfhDuVlgvDffoLWuKd3dAUhe8f93/cZqql8q4fMkwEdnGJqiHTx
         P8Z7QKG46bf/LGgcsw9i7CEZv2xZnl7lCMIKbfwVh3r334yzphhBj+3W/pOeHLBKgh5I
         ctIZ1Xq6GbHUlHlaZdfzN3MbFkNm3lm1u41TYI4MfXzQOSTnDXZTiLuxj0VqF68BeQZ0
         tMRAkjPMlytWP4ysoaJymvZfjWqhlmW8DPZyIFM0HTS1mM012Gz1iYzKatKtXb/lZ4yK
         wfN2xQtbEjFIp+GOUX2xta6SQiwnRajdRHlBLW/HtHZal4UMRDy/8hrRxvGWMUFJxEXd
         THhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726625986; x=1727230786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38IQuyNYr4G9x/ownl5XlsDSTzr49ps/SxbJM8SwQFo=;
        b=PXNmHWk7FQ37HxdOJcqNRQRBqIOXmmK/Dbf+xdQQkkPn6AszkH7F9XC4qeT9aUYkYQ
         tnqd0J8j/wfTApJGZWqnnKyOrux2ZJRF6SZ2MDHDbRUVToM5Wva5pNg+Dx7ak24Yp4xX
         geXAZojk2DBZtduhXMcU1kiU4tHfx4EquJIwUMmp8sNMRMdsw+plK/UB26lagv1/xpdB
         Y7KNX4ijrBFtpf/RzGy3dRrAqB3vz+ZxM5WsXkAKWCUOS4Aw1s3Gx2AYHeBabI65FS9/
         dTLs/+GsLm8/bgop0jxOdj5GVzeNwou5Bk3BVx7bIqWIgySSLiH5/ckgqix0vgljRVAh
         BsSA==
X-Forwarded-Encrypted: i=1; AJvYcCX+/NovYM4jMYI39Vd85XVdSVobeAg6rmg/nkNkg5LS7X9ZUTo92ysNfIeMnTMd+4GHfu0eKgdxdveTWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwC4q2DMyJq4LcR8TEjBHjG7L0ya4RFz1ijJqZkIXuMYlfwhvSL
	tUlvCkF63gKBoFSYiuUWQb2vrvFnmpbL0szo0q2B8ljMB2rgLion74a5Ui3BPF4zuHYlQRvYpx1
	VV+N/qfQUchcAPnfogTYj6vTRD6FJFX13qeccIA==
X-Google-Smtp-Source: AGHT+IHOt2Ka7riRi9KlsNvxnjXNk/TzLRXNpslrLJ1cdFZAENN+p8UUfEyuX+yWYAAlor05TArp4Fyp6/Ol8vRYhnE=
X-Received: by 2002:a05:6808:1897:b0:3e0:422e:f05b with SMTP id
 5614622812f47-3e071ae3bdamr13876490b6e.29.1726625986589; Tue, 17 Sep 2024
 19:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240913080053.36636-1-mikisabate@gmail.com>
In-Reply-To: <20240913080053.36636-1-mikisabate@gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 18 Sep 2024 10:19:35 +0800
Message-ID: <CAEEQ3w=H7X0yeNg_qwbf0MxTO8gmXRaD0wJFv=xCKjqH-WNA_w@mail.gmail.com>
Subject: Re: [External] [PATCH] riscv: Prevent a bad reference count on CPU nodes
To: =?UTF-8?B?TWlxdWVsIFNhYmF0w6kgU29sw6A=?= <mikisabate@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_191953_246688_C5FDC89F 
X-CRM114-Status: GOOD (  26.92  )
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
Cc: aou@eecs.berkeley.edu, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, palmer@dabbelt.com, sudeep.holla@arm.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgNDowMuKAr1BNIE1pcXVlbCBTYWJh
dMOpIFNvbMOgIDxtaWtpc2FiYXRlQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIHBvcHVsYXRp
bmcgY2FjaGUgbGVhdmVzIHdlIHByZXZpb3VzbHkgZmV0Y2hlZCB0aGUgQ1BVIGRldmljZSBub2Rl
Cj4gYXQgdGhlIHZlcnkgYmVnaW5uaW5nLiBCdXQgd2hlbiBBQ1BJIGlzIGVuYWJsZWQgd2UgZ28g
dGhyb3VnaCBhCj4gc3BlY2lmaWMgYnJhbmNoIHdoaWNoIHJldHVybnMgZWFybHkgYW5kIGRvZXMg
bm90IGNhbGwgJ29mX25vZGVfcHV0JyBmb3IKPiB0aGUgbm9kZSB0aGF0IHdhcyBhY3F1aXJlZC4K
Pgo+IFNpbmNlIHdlIGFyZSBub3QgdXNpbmcgYSBDUFUgZGV2aWNlIG5vZGUgZm9yIHRoZSBBQ1BJ
IGNvZGUgYW55d2F5cywgd2UKPiBjYW4gc2ltcGx5IG1vdmUgdGhlIGluaXRpYWxpemF0aW9uIG9m
IGl0IGp1c3QgcGFzc2VkIHRoZSBBQ1BJIGJsb2NrLCBhbmQKPiB3ZSBhcmUgZ3VhcmFudGVlZCB0
byBoYXZlIGFuICdvZl9ub2RlX3B1dCcgY2FsbCBmb3IgdGhlIGFjcXVpcmVkIG5vZGUuCj4gVGhp
cyBwcmV2ZW50cyBhIGJhZCByZWZlcmVuY2UgY291bnQgb2YgdGhlIENQVSBkZXZpY2Ugbm9kZS4K
Pgo+IE1vcmVvdmVyLCB0aGUgcHJldmlvdXMgZnVuY3Rpb24gZGlkIG5vdCBjaGVjayBmb3IgZXJy
b3JzIHdoZW4gYWNxdWlyaW5nCj4gdGhlIGRldmljZSBub2RlLCBzbyBhIHJldHVybiAtRU5PRU5U
IGhhcyBiZWVuIGFkZGVkIGZvciB0aGF0IGNhc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwg
U2FiYXTDqSBTb2zDoCA8bWlraXNhYmF0ZUBnbWFpbC5jb20+Cj4gLS0tCj4gSSB3YXMgd29uZGVy
aW5nIGlmIHRoaXMgc2hvdWxkIGFsc28gYmUgc2VudCB0byBzdGFibGUsIGJ1dCAgSSBoYXZlIG5v
dCBzZWVuCj4gYSByZXBvcnQgb24gaXQsIGFuZCB0aGlzIGlzIG5vdCByZXNwb25zaWJsZSBmb3Ig
YW4gb29wcyBvciBhbnl0aGluZyBsaWtlIHRoYXQuCj4gU28gaW4gdGhlIGVuZCBJIGRlY2lkZWQg
bm90IHRvLCBidXQgbWF5YmUgeW91IGNvbnNpZGVyIG90aGVyd2lzZS4KPgo+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9jYWNoZWluZm8uYyB8IDcgKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL2NhY2hlaW5mby5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPiBpbmRleCBk
NmMxMDhjNTBjYmEuLmQzMmRmZGJhMDgzZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jYWNoZWluZm8uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4gQEAg
LTc1LDggKzc1LDcgQEAgaW50IHBvcHVsYXRlX2NhY2hlX2xlYXZlcyh1bnNpZ25lZCBpbnQgY3B1
KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgY3B1X2NhY2hlaW5mbyAqdGhpc19jcHVfY2kgPSBnZXRf
Y3B1X2NhY2hlaW5mbyhjcHUpOwo+ICAgICAgICAgc3RydWN0IGNhY2hlaW5mbyAqdGhpc19sZWFm
ID0gdGhpc19jcHVfY2ktPmluZm9fbGlzdDsKPiAtICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAgPSBvZl9jcHVfZGV2aWNlX25vZGVfZ2V0KGNwdSk7Cj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNl
X25vZGUgKnByZXYgPSBOVUxMOwo+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCwgKnBy
ZXY7Cj4gICAgICAgICBpbnQgbGV2ZWxzID0gMSwgbGV2ZWwgPSAxOwo+Cj4gICAgICAgICBpZiAo
IWFjcGlfZGlzYWJsZWQpIHsKPiBAQCAtMTAwLDYgKzk5LDEwIEBAIGludCBwb3B1bGF0ZV9jYWNo
ZV9sZWF2ZXModW5zaWduZWQgaW50IGNwdSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4g
ICAgICAgICB9Cj4KPiArICAgICAgIG5wID0gb2ZfY3B1X2RldmljZV9ub2RlX2dldChjcHUpOwo+
ICsgICAgICAgaWYgKCFucCkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gKwoK
SXQgaXMgbmVjZXNzYXJ5IGJlY2F1c2UgdGhlIGNhbGxlciBvZiBwb3B1bGF0ZV9jYWNoZV9sZWF2
ZXMgaGFzIGEKcmV0dXJuIHZhbHVlIGp1ZGdtZW50LgpTbywgIFJldmlld2VkLWJ5OiBZdW5odWkg
Q3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KCj4gICAgICAgICBpZiAob2ZfcHJvcGVydHlf
cmVhZF9ib29sKG5wLCAiY2FjaGUtc2l6ZSIpKQo+ICAgICAgICAgICAgICAgICBjaV9sZWFmX2lu
aXQodGhpc19sZWFmKyssIENBQ0hFX1RZUEVfVU5JRklFRCwgbGV2ZWwpOwo+ICAgICAgICAgaWYg
KG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImktY2FjaGUtc2l6ZSIpKQo+IC0tCj4gMi40Ni4w
Cj4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
