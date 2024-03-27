Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444F3C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 08:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJnoDIDbzftMlyjgSNZ04EZ2o2vTMr4oPllNmCAjFfw=; b=btZRePLvDoSZyC
	c4lUbtdgz/auVyx1mVuitUgGf4+hhmcEB6F+zAGhUFkQK2HvelZgsDCmm/pM1OAAfiecH43dLYs/K
	7EzBPJ380w9YffJX3gYBREtc/jo1NNHnPCK39CCnwvvVLfh3CkiS0Cw237Qykg4L7Nt1iO98PdcEi
	7FtlVrgJta+1pgY9V2VqkqQJgJ+0ol5P3fBd/dH5R+7lLIwzMPfj4pcVHYCfGqHfT95C29nO/0bac
	XYbBFRsdyZuB4qbb9iOU/dIeGmyOck2mJopKcqOLWPgQRRmEK2sVB83c1D4/kXg8dcgEpPPs78hLi
	/bFtjb98heE7kzlvxKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOst-000000085gv-2BqM;
	Wed, 27 Mar 2024 08:43:47 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOsq-000000085gE-1aA7
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 08:43:46 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-22a1065594bso168097fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 01:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711529023; x=1712133823; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3qO0JEdl7yey5VJivO7+ugI6ufutpwhPOlblQnG63I=;
        b=ehLUI7MymzcgtQaTLM4OTFbpZSxIYVCD+RKfaJtVEd/PnntxqwGvLhntFN6vlUU3Xt
         jVGfcZu/l7SY+6KbJlKxC3+loPXCvnSkd3IaLJGPdhl46Ee5uPqmwiB83U9BWPlanjS4
         1KvCv0y9NpQbPr8B7LGnruWN7j+G3Er0cos9Cni4zuMB2obJ/LLe+WeSkPLcStjAP++U
         jp736KUlzkN6w7qvBS020CWYojcqtHghloVOcB23HlyMpl07p9O611VFxYw7HhykyJ4G
         TCRNOgVZjzWm5obHwXZR6kJIFj8wwCIZSPg1wePb9uemRomxpLUelpFi9C5r6cu0ut5p
         Bq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711529023; x=1712133823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3qO0JEdl7yey5VJivO7+ugI6ufutpwhPOlblQnG63I=;
        b=YXttrBtnOklmXPcvUN20IKH8V4zULT2S78vWncs9zT9QXMfjcBavdK+05PGkbfF9Dt
         Y4jQCXT8GRdPA5DmyKQRAsE1dd1dgUh5Tmpthr31PtRq2d6XG8HIO9o60s32SfIHRKVm
         NskciWjqHyU1dDNHjpDKgLShv3nQCs6pSoH0bLlnbMMHm547yPnrOJMpBa5ImidJJFg1
         kVwtpDPhYa4dQy2GYnmlJb46A54H1rQPD9nLNm+5yNg9E2gnrts9k4B+UTryGjBEX0Zz
         RQUBfoDQUQhDPd0JMnpzBz03pF5oQ8cMxN08eDgofPBHmO44LWQ4tyXZsTz6F4cQvA/W
         w7Qg==
X-Gm-Message-State: AOJu0Yy3eo/gvZtRju4SyTziJ9A+7sRVlDlHazmmTdL8FY95SWQaPzVv
	N78GC+SaEmbT+JQudmBd+bKYghV8wYy6c9PIds4ZlW32pAlu3dss4qfgYvyrnxcfkCYggWfvbY/
	EDyCEUiZiECUcL/4xU4zg+u9BUj8dgOpDYNrnXg==
X-Google-Smtp-Source: AGHT+IGkPnqj9OAHDB4ILzxWBgIirYzZWguS0X+Pc8OG1EelaK0HdCGJm3in13IBnzJdHiWHjq/npy//nSX6h+p9k0g=
X-Received: by 2002:a05:6870:9713:b0:22a:7541:d9d6 with SMTP id
 n19-20020a056870971300b0022a7541d9d6mr1132397oaq.3.1711529022761; Wed, 27 Mar
 2024 01:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240327061258.2370291-1-sorear@fastmail.com>
In-Reply-To: <20240327061258.2370291-1-sorear@fastmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 27 Mar 2024 16:43:31 +0800
Message-ID: <CAEEQ3w=yNEktgUucmKuUvqfwDYYztVX+jofi5Q7hG-yQWcLbTA@mail.gmail.com>
Subject: Re: [External] [PATCH] riscv: process: Fix kernel gp leakage
To: "Stefan O'Rear" <sorear@fastmail.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_014344_516480_A2416AD7 
X-CRM114-Status: GOOD (  17.27  )
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

SGkgU3RlZmFuLAoKT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMjoxNOKAr1BNIFN0ZWZhbiBPJ1Jl
YXIgPHNvcmVhckBmYXN0bWFpbC5jb20+IHdyb3RlOgo+Cj4gY2hpbGRyZWdzIHJlcHJlc2VudHMg
dGhlIHJlZ2lzdGVycyB3aGljaCBhcmUgYWN0aXZlIGZvciB0aGUgbmV3IHRocmVhZAo+IGluIHVz
ZXIgY29udGV4dC4gRm9yIGEga2VybmVsIHRocmVhZCwgY2hpbGRyZWdzLT5ncCBpcyBuZXZlciB1
c2VkIHNpbmNlCj4gdGhlIGtlcm5lbCBncCBpcyBub3QgdG91Y2hlZCBieSBzd2l0Y2hfdG8uIEZv
ciBhIHVzZXIgbW9kZSBoZWxwZXIsIHRoZQo+IGdwIHZhbHVlIGNhbiBiZSBvYnNlcnZlZCBpbiB1
c2VyIHNwYWNlIGFmdGVyIGV4ZWN2ZSBvciBwb3NzaWJseSBieSBvdGhlcgo+IG1lYW5zLgo+Cj4g
Rml4ZXM6IDdkYjkxZTU3YTBhYyAoIlJJU0MtVjogVGFzayBpbXBsZW1lbnRhdGlvbiIpCj4gU2ln
bmVkLW9mZi1ieTogU3RlZmFuIE8nUmVhciA8c29yZWFyQGZhc3RtYWlsLmNvbT4KPiAtLS0KPiAg
YXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIHwgMyAtLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gaW5kZXggOTI5MjJkYmQ1YjVjLi41MTA0
MmY0OGRhMTcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gQEAgLTI3LDggKzI3LDYgQEAKPiAgI2lu
Y2x1ZGUgPGFzbS92ZWN0b3IuaD4KPiAgI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4KPiAt
cmVnaXN0ZXIgdW5zaWduZWQgbG9uZyBncF9pbl9nbG9iYWwgX19hc21fXygiZ3AiKTsKPiAtCj4g
ICNpZiBkZWZpbmVkKENPTkZJR19TVEFDS1BST1RFQ1RPUikgJiYgIWRlZmluZWQoQ09ORklHX1NU
QUNLUFJPVEVDVE9SX1BFUl9UQVNLKQo+ICAjaW5jbHVkZSA8bGludXgvc3RhY2twcm90ZWN0b3Iu
aD4KPiAgdW5zaWduZWQgbG9uZyBfX3N0YWNrX2Noa19ndWFyZCBfX3JlYWRfbW9zdGx5Owo+IEBA
IC0yMDcsNyArMjA1LDYgQEAgaW50IGNvcHlfdGhyZWFkKHN0cnVjdCB0YXNrX3N0cnVjdCAqcCwg
Y29uc3Qgc3RydWN0IGtlcm5lbF9jbG9uZV9hcmdzICphcmdzKQo+ICAgICAgICAgaWYgKHVubGlr
ZWx5KGFyZ3MtPmZuKSkgewo+ICAgICAgICAgICAgICAgICAvKiBLZXJuZWwgdGhyZWFkICovCj4g
ICAgICAgICAgICAgICAgIG1lbXNldChjaGlsZHJlZ3MsIDAsIHNpemVvZihzdHJ1Y3QgcHRfcmVn
cykpOwo+IC0gICAgICAgICAgICAgICBjaGlsZHJlZ3MtPmdwID0gZ3BfaW5fZ2xvYmFsOwo+ICAg
ICAgICAgICAgICAgICAvKiBTdXBlcnZpc29yL01hY2hpbmUsIGlycXMgb246ICovCj4gICAgICAg
ICAgICAgICAgIGNoaWxkcmVncy0+c3RhdHVzID0gU1JfUFAgfCBTUl9QSUU7Cj4KPiAtLQo+IDIu
NDAuMQo+Cj4KQ2FuIHlvdSBoZWxwIGV4cHJlc3MgaW4gbW9yZSBkZXRhaWwgd2hhdCB0aGUgcHJv
YmxlbSB3YXMgYmVmb3JlIGZpeGluZyBpdD8KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
