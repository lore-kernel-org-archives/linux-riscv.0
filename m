Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9DDC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 06:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/0XH02w3hTjmpW7jeiHnMXGrGK2Y7LH6y6DjZaqpIs=; b=V/nL3jqBCJoJfy
	240woLctBgMfCEixgHrw/YzUlyKlh4mDpxUkuRoroRBjLBQnBmKUfRogqqesHftmXmuzEKNR77426
	zbRTud7SOXEA8ysCAJpdxKj5o+adC0rAIc1aR9AgBy6QA6A6U5AvCDfDAn/H0U5TWL3QrpcXKtW2a
	6qQoCeOAXPYb1E0Uyl+n78MMHbimGPWYqFKV09wd9g8lk7CtkZ6exegjY3+cdCqlKEL9a4oc9GxUL
	lf2G/AoYHMASy8d+vge59Td9KP2Mv931DTUjt6gVPvRX4c7tCA4CKqPz5clSonWUgIUYb6Kes5ppC
	xlVWrFKhRR624Ep+IVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMhn-00000007eQi-31EL;
	Wed, 27 Mar 2024 06:24:11 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMhl-00000007eQ3-0RbZ
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 06:24:10 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-22200c78d4fso3006167fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 23:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711520647; x=1712125447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8oWEwBijHMiAPbYhHlQ1tO5hUF/k22snxI3OcFkt4Sg=;
        b=ZWDhZB7ce4/kbd9+30/bBI/8ywFHgxQJZXDG25va+MFW1JsPNBVFoIZgYXMzM5KuSk
         UbTUkz+xt+sy/JSPqofETL952HJ1qXaULnk5jq16epN/Bvo1yfDv0l+7xYlVDu5H/Pl5
         P6oJiT6kybqfPiZxzvwruQG6MAw2vKIk8KYVJ90uU6v0tAhT8sUKECJMj9V5kOdn5HvA
         RpJ8CaPi3SnfseZbhFOQwAF89pCfbO/hqC/byTq66j6BQkQJc28D7cB1MUEo8prm2Oau
         ondrlsYD7Y7Avwi5rLFZmihyHDMbAHsbIsr/qwKX+PYP1zGfTBxg8ZJ+dQyKqrkaX0gH
         M5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711520647; x=1712125447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oWEwBijHMiAPbYhHlQ1tO5hUF/k22snxI3OcFkt4Sg=;
        b=jMqk0MeZ1FYDdBuCQDPWZ/fA7DQI48Da+pvpXosrSdTU2ejsoZ30Gq29XC3xTUaRpg
         U6d6WUOYBpxJgHpST/AdB5qNF4reJjUQ12NbTK7tnue4opFkUUI/EdgesHrif9prukd2
         Lg81+f+xXrsU+3PIC2LOwqcx9SaLuSp9ObpcuUVvNR5ie00YBxq1wykvhI81LKf2NK8X
         4E6McGKA6O57uWPoSy3ivpY/mCCSaBO6YVV/IgGDKEyGDNt5UBqIG1+o9pfkZ/eEje6i
         cR44aBExi+GmsCanJLFk3M8PmEBZWOLVVOmKs6Hw2j4gUwH5nb4qgG7UKwMQJb5xGufX
         OCvw==
X-Forwarded-Encrypted: i=1; AJvYcCUymgbTMJcnv/x+wTQrGN6IdlM6XmIySIl3AY0yrHv9+CLivZRJT/uIp45++1fuyBpuT7qB+rq0Igw1uT0uVCey1bUbjVD0S6V6qkNVqgde
X-Gm-Message-State: AOJu0YwB9reDC7TFZ06KH+Y6Ap4R6sKvnLtTXRyg3eSLDcmInyU6l1WT
	ZhQSXNqntYIaiPAMpM2p4NOF6P6oi0XsKlhQzC7HPL0ilqt35biG1IOV4Ebxen5x2wNjagxaENZ
	1oBdNHmhYFAuDKkeQqJ6GQUlYOSZ8cnTuTTQI2ZB7vBFuwiYZO04hpg==
X-Google-Smtp-Source: AGHT+IFhEeq410DvQa9oQZkS0m0EYwn1s+oHwhpUn2R8jvumRu2oImrFD/ysHx9vuZwjm+EIqRm8Kd2Z30d1RvDrk8A=
X-Received: by 2002:a05:6870:788c:b0:22a:107c:4dd6 with SMTP id
 hc12-20020a056870788c00b0022a107c4dd6mr3948186oab.40.1711520646891; Tue, 26
 Mar 2024 23:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240327045035.368512-1-samuel.holland@sifive.com> <20240327045035.368512-7-samuel.holland@sifive.com>
In-Reply-To: <20240327045035.368512-7-samuel.holland@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 27 Mar 2024 14:23:56 +0800
Message-ID: <CAEEQ3wk=0+_vofamg=UWoxFXbH5wZ722vcm5+QuwSdUT6998yw@mail.gmail.com>
Subject: Re: [External] [PATCH v6 06/13] riscv: mm: Combine the SMP and UP TLB
 flush code
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_232409_174637_1ECF765C 
X-CRM114-Status: GOOD (  19.19  )
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

SGkgU2FtdWVsLAoKT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMTI6NTHigK9QTSBTYW11ZWwgSG9s
bGFuZAo8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBJbiBTTVAgY29uZmln
dXJhdGlvbnMsIGFsbCBUTEIgZmx1c2hpbmcgbmFycm93ZXIgdGhhbiBmbHVzaF90bGJfYWxsKCkK
PiBnb2VzIHRocm91Z2ggX19mbHVzaF90bGJfcmFuZ2UoKS4gRG8gdGhlIHNhbWUgaW4gVVAgY29u
ZmlndXJhdGlvbnMuCj4KPiBUaGlzIGFsbG93cyBVUCBjb25maWd1cmF0aW9ucyB0byB0YWtlIGFk
dmFudGFnZSBvZiByZWNlbnQgaW1wcm92ZW1lbnRzCj4gdG8gdGhlIGNvZGUgaW4gdGxiZmx1c2gu
Yywgc3VjaCBhcyBzdXBwb3J0IGZvciBodWdlIHBhZ2VzIGFuZCBmbHVzaGluZwo+IG11bHRpcGxl
LXBhZ2UgcmFuZ2VzLgo+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRp
QHJpdm9zaW5jLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4KPiAtLS0KPgo+IChubyBjaGFuZ2VzIHNpbmNlIHY0KQo+Cj4gQ2hh
bmdlcyBpbiB2NDoKPiAgLSBNZXJnZSB0aGUgdHdvIGNvcGllcyBvZiBfX2ZsdXNoX3RsYl9yYW5n
ZSgpIGFuZCByZWx5IG9uIHRoZSBjb21waWxlcgo+ICAgIHRvIG9wdGltaXplIG91dCB0aGUgYnJv
YWRjYXN0IHBhdGggKGJvdGggY2xhbmcgYW5kIGdjYyBkbyB0aGlzKQo+ICAtIE1lcmdlIHRoZSB0
d28gY29waWVzIG9mIGZsdXNoX3RsYl9hbGwoKSBhbmQgcmVseSBvbiBjb25zdGFudCBmb2xkaW5n
Cj4KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIE1vdmUgdGhlIFNNUC9VUCBtZXJnZSBlYXJsaWVyIGlu
IHRoZSBzZXJpZXMgdG8gYXZvaWQgYnVpbGQgaXNzdWVzCj4gIC0gTWFrZSBhIGNvcHkgb2YgX19m
bHVzaF90bGJfcmFuZ2UoKSBpbnN0ZWFkIG9mIGFkZGluZyBpZmRlZnMgaW5zaWRlCj4gIC0gbG9j
YWxfZmx1c2hfdGxiX2FsbCgpIGlzIHRoZSBvbmx5IGZ1bmN0aW9uIHVzZWQgb24gIU1NVSAoc21w
Ym9vdC5jKQo+Cj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICB8ICAyICstCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDMxICsrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9tbS9NYWtlZmlsZSAgICAgICAgICAgIHwgIDUg
Ky0tLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zwo+IGluZGV4IGJlMDljODgzNmQ1Ni4uNDQyNTMyODE5YTQ0IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+IEBAIC02MCw3ICs2MCw3
IEBAIGNvbmZpZyBSSVNDVgo+ICAgICAgICAgc2VsZWN0IEFSQ0hfVVNFX01FTVRFU1QKPiAgICAg
ICAgIHNlbGVjdCBBUkNIX1VTRV9RVUVVRURfUldMT0NLUwo+ICAgICAgICAgc2VsZWN0IEFSQ0hf
VVNFU19DRklfVFJBUFMgaWYgQ0ZJX0NMQU5HCj4gLSAgICAgICBzZWxlY3QgQVJDSF9XQU5UX0JB
VENIRURfVU5NQVBfVExCX0ZMVVNIIGlmIFNNUCAmJiBNTVUKPiArICAgICAgIHNlbGVjdCBBUkNI
X1dBTlRfQkFUQ0hFRF9VTk1BUF9UTEJfRkxVU0ggaWYgTU1VCj4gICAgICAgICBzZWxlY3QgQVJD
SF9XQU5UX0RFRkFVTFRfVE9QRE9XTl9NTUFQX0xBWU9VVCBpZiBNTVUKPiAgICAgICAgIHNlbGVj
dCBBUkNIX1dBTlRfRlJBTUVfUE9JTlRFUlMKPiAgICAgICAgIHNlbGVjdCBBUkNIX1dBTlRfR0VO
RVJBTF9IVUdFVExCIGlmICFSSVNDVl9JU0FfU1ZOQVBPVAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZs
dXNoLmgKPiBpbmRleCA0MTEyY2M4ZDFkNjkuLjRmODY0MjRiMWJhNSAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3RsYmZsdXNoLmgKPiBAQCAtMjcsMTIgKzI3LDcgQEAgc3RhdGljIGlubGluZSB2b2lk
IGxvY2FsX2ZsdXNoX3RsYl9wYWdlKHVuc2lnbmVkIGxvbmcgYWRkcikKPiAgewo+ICAgICAgICAg
QUxUX0ZMVVNIX1RMQl9QQUdFKF9fYXNtX18gX192b2xhdGlsZV9fICgic2ZlbmNlLnZtYSAlMCIg
OiA6ICJyIiAoYWRkcikgOiAibWVtb3J5IikpOwo+ICB9Cj4gLSNlbHNlIC8qIENPTkZJR19NTVUg
Ki8KPiAtI2RlZmluZSBsb2NhbF9mbHVzaF90bGJfYWxsKCkgICAgICAgICAgICAgICAgICBkbyB7
IH0gd2hpbGUgKDApCj4gLSNkZWZpbmUgbG9jYWxfZmx1c2hfdGxiX3BhZ2UoYWRkcikgICAgICAg
ICAgICAgZG8geyB9IHdoaWxlICgwKQo+IC0jZW5kaWYgLyogQ09ORklHX01NVSAqLwo+Cj4gLSNp
ZiBkZWZpbmVkKENPTkZJR19TTVApICYmIGRlZmluZWQoQ09ORklHX01NVSkKPiAgdm9pZCBmbHVz
aF90bGJfYWxsKHZvaWQpOwo+ICB2b2lkIGZsdXNoX3RsYl9tbShzdHJ1Y3QgbW1fc3RydWN0ICpt
bSk7Cj4gIHZvaWQgZmx1c2hfdGxiX21tX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNp
Z25lZCBsb25nIHN0YXJ0LAo+IEBAIC01NCwyOCArNDksOCBAQCB2b2lkIGFyY2hfdGxiYmF0Y2hf
YWRkX3BlbmRpbmcoc3RydWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0Y2ggKmJhdGNoLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHVhZGRyKTsKPiAgdm9p
ZCBhcmNoX2ZsdXNoX3RsYl9iYXRjaGVkX3BlbmRpbmcoc3RydWN0IG1tX3N0cnVjdCAqbW0pOwo+
ICB2b2lkIGFyY2hfdGxiYmF0Y2hfZmx1c2goc3RydWN0IGFyY2hfdGxiZmx1c2hfdW5tYXBfYmF0
Y2ggKmJhdGNoKTsKPiAtCj4gLSNlbHNlIC8qIENPTkZJR19TTVAgJiYgQ09ORklHX01NVSAqLwo+
IC0KPiAtI2RlZmluZSBmbHVzaF90bGJfYWxsKCkgbG9jYWxfZmx1c2hfdGxiX2FsbCgpCj4gLSNk
ZWZpbmUgZmx1c2hfdGxiX3BhZ2Uodm1hLCBhZGRyKSBsb2NhbF9mbHVzaF90bGJfcGFnZShhZGRy
KQo+IC0KPiAtc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwKPiAtICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5z
aWduZWQgbG9uZyBlbmQpCj4gLXsKPiAtICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGwoKTsKPiAt
fQo+IC0KPiAtLyogRmx1c2ggYSByYW5nZSBvZiBrZXJuZWwgcGFnZXMgKi8KPiAtc3RhdGljIGlu
bGluZSB2b2lkIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiAt
ICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kKQo+IC17Cj4gLSAgICAgICBsb2NhbF9mbHVzaF90bGJf
YWxsKCk7Cj4gLX0KPiAtCj4gLSNkZWZpbmUgZmx1c2hfdGxiX21tKG1tKSBmbHVzaF90bGJfYWxs
KCkKPiAtI2RlZmluZSBmbHVzaF90bGJfbW1fcmFuZ2UobW0sIHN0YXJ0LCBlbmQsIHBhZ2Vfc2l6
ZSkgZmx1c2hfdGxiX2FsbCgpCj4gLSNkZWZpbmUgbG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5n
ZShzdGFydCwgZW5kKSBmbHVzaF90bGJfYWxsKCkKPiAtI2VuZGlmIC8qICFDT05GSUdfU01QIHx8
ICFDT05GSUdfTU1VICovCj4gKyNlbHNlIC8qIENPTkZJR19NTVUgKi8KPiArI2RlZmluZSBsb2Nh
bF9mbHVzaF90bGJfYWxsKCkgICAgICAgICAgICAgICAgICBkbyB7IH0gd2hpbGUgKDApCj4gKyNl
bmRpZiAvKiBDT05GSUdfTU1VICovCj4KPiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfVExCRkxVU0hf
SCAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9t
bS9NYWtlZmlsZQo+IGluZGV4IDJjODY5ZjgwMjZhOC4uY2JlNGQ3NzVlZjU2IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvbW0vTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L21tL01ha2VmaWxl
Cj4gQEAgLTEzLDE0ICsxMywxMSBAQCBlbmRpZgo+ICBLQ09WX0lOU1RSVU1FTlRfaW5pdC5vIDo9
IG4KPgo+ICBvYmoteSArPSBpbml0Lm8KPiAtb2JqLSQoQ09ORklHX01NVSkgKz0gZXh0YWJsZS5v
IGZhdWx0Lm8gcGFnZWF0dHIubyBwZ3RhYmxlLm8KPiArb2JqLSQoQ09ORklHX01NVSkgKz0gZXh0
YWJsZS5vIGZhdWx0Lm8gcGFnZWF0dHIubyBwZ3RhYmxlLm8gdGxiZmx1c2gubwo+ICBvYmoteSAr
PSBjYWNoZWZsdXNoLm8KPiAgb2JqLXkgKz0gY29udGV4dC5vCj4gIG9iai15ICs9IHBtZW0ubwo+
Cj4gLWlmZXEgKCQoQ09ORklHX01NVSkseSkKPiAtb2JqLSQoQ09ORklHX1NNUCkgKz0gdGxiZmx1
c2gubwo+IC1lbmRpZgo+ICBvYmotJChDT05GSUdfSFVHRVRMQl9QQUdFKSArPSBodWdldGxicGFn
ZS5vCj4gIG9iai0kKENPTkZJR19QVERVTVBfQ09SRSkgKz0gcHRkdW1wLm8KPiAgb2JqLSQoQ09O
RklHX0tBU0FOKSAgICs9IGthc2FuX2luaXQubwo+IC0tCj4gMi40My4xCj4KClRoaXMgaXMgY2xl
YW5lciB0aGFuIG15IHByZXZpb3VzIG1vZGlmaWNhdGlvbiB0byBzdXBwb3J0IFVQIF9fZmx1c2hf
dGxiX3JhbmdlLgpTbzoKUmV2aWV3ZWQtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFu
Y2UuY29tPgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
