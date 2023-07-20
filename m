Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8D7EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 17:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ViwkPNwcR12H65Z9k+1IDeskgfuN7N/ejgsHCPtcko=; b=xpytsqm9tGZNCA
	6aSnSjz+7m6UG3qopZxOmmyrLH7CLsvJHAyXAuGaleecEI9aPzEvJ8Vt376AA5pmR/z+wmiSNhE/U
	sGQSlAXmkq/AMiRcB5rbuUboFaaiEI5Z+4AXH8o5KUQ4WtcTU0NuXG06YHM0j4dFuVykZWDjcxEFJ
	3Nrvsy0VKNYuQUTH2ea4nQbNbRpnPD7Oqet0pKPkEWgvArW/wG1gmCMq2SLLVC3cmDzPD84+e2eC/
	+uYHpmzAYjCJJaUQAxZkWZwA6WhdEsMAu91No6yNOdWTtb/Yq80Nn6Jaz1Vt8nBAhaD1/ALZx7/Dm
	I9L9/uCJ0fHrR9XeN5YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXkx-00BpF8-0Y;
	Thu, 20 Jul 2023 17:48:03 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXkq-00BpE2-0p
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 17:47:57 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-52cb8e5e9f5so789390a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 10:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689875272; x=1690480072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeRtmaYTAPyRY4aCeM38ToCVz+RzHutrGkJCqmGIdOc=;
        b=VN4kSEn7Ij6Jb7Boit8qxzz8hu77UOlfTYQHpith3ypcF9dbr8xWuknkAmP8IvhxBt
         LSx9B51i2TsdB+RUriiJWHvSRCwVRBNb/OI0bv4fZ/ddJi9e7EqZDdUFRo7TczeEC+of
         URUI2buBPQWpMuUbL5yFNjv3VfjFHoK6KfHtE3V0FBlLSVS1/fJkaVvbpoFsooaHkONk
         IiFE6+Rr2ppLX1fM4YPj6b3txnVsbIyOeLireIiBSPXqxXZkVMydnEz+QuohTe2sTnjg
         S5IjI4CkxDg5Hq6JKbejvTXX4S9QbaToU/WxyTcuWJ+ESMkC7DDIWj4BZafziobkSX7k
         soOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689875272; x=1690480072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JeRtmaYTAPyRY4aCeM38ToCVz+RzHutrGkJCqmGIdOc=;
        b=ajVwch5KAx1AMcLuCGSeytxMDKw5PJAIId4vFXINCg/NCOTOJ32EJowgjYq7CRNrQs
         8XEAv06qGvI2mufCYR242CUBFhaSyvybeMxgL1KzT8v9AUogEwkXUGczjqAxl4ORCPZo
         mkr570zaLJ93ACyE67CBrchVYFrKu3pekd5aU8lBfZEIr2vHhJyFxqiUR/piY5aL8deP
         4sjmkrHchtFvsFmnYuXEpzqZNsYlX20G8oih9Lpb5ailuGVVpHb8YnjEhfJWvJIoFlCP
         CSDosaAO0PE6gCcWrJvOADD7OtrRc8Z2qv+NR6IrLzIvowr+rRS+js6x821DTp5FmXJ0
         9Yog==
X-Gm-Message-State: ABy/qLY56RdYgFHd0miOFkb3DfXG6TInqUOGWeWBX7ssxbT5STskzP6v
	A1J7LU6ChxG0PC8FapHHEGlKrsbpLqkgwpDTATynEQ==
X-Google-Smtp-Source: APBJJlHy5UEy2yIQNNS3I4ewj2XdSdHRI6Php31TNjCHwslBISu4YslmtmapMSbRvm/h863Rb7ly70c0/Q+NZJYe7/k=
X-Received: by 2002:a17:90a:8b81:b0:256:675f:1d49 with SMTP id
 z1-20020a17090a8b8100b00256675f1d49mr120295pjn.0.1689875271671; Thu, 20 Jul
 2023 10:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689792825.git.tjeznach@rivosinc.com> <610abe685f90870be52bc7c2ca45ab5235bd8eb4.1689792825.git.tjeznach@rivosinc.com>
 <2556751a-c439-bb69-a102-583dd985fc5e@linux.intel.com>
In-Reply-To: <2556751a-c439-bb69-a102-583dd985fc5e@linux.intel.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Thu, 20 Jul 2023 10:47:40 -0700
Message-ID: <CAH2o1u7WO=Kpki1qMGoq3uJ2vVqhCvffvX0hLGc7o9op2vTCbw@mail.gmail.com>
Subject: Re: [PATCH 05/11] RISC-V: drivers/iommu/riscv: Add sysfs interface
To: Baolu Lu <baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_104756_302544_FC60B7E9 
X-CRM114-Status: GOOD (  12.48  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMjAsIDIwMjMgYXQgNTo1MeKAr0FNIEJhb2x1IEx1IDxiYW9sdS5sdUBsaW51
eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gMjAyMy83LzIwIDM6MzMsIFRvbWFzeiBKZXpuYWNo
IHdyb3RlOgo+ID4gKyNkZWZpbmUgc3lzZnNfZGV2X3RvX2lvbW11KGRldikgXAo+ID4gKyAgICAg
Y29udGFpbmVyX29mKGRldl9nZXRfZHJ2ZGF0YShkZXYpLCBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2
aWNlLCBpb21tdSkKPiA+ICsKPiA+ICtzdGF0aWMgc3NpemVfdCBhZGRyZXNzX3Nob3coc3RydWN0
IGRldmljZSAqZGV2LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNl
X2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCByaXNj
dl9pb21tdV9kZXZpY2UgKmlvbW11ID0gc3lzZnNfZGV2X3RvX2lvbW11KGRldik7Cj4gPiArICAg
ICByZXR1cm4gc3ByaW50ZihidWYsICIlbGx4XG4iLCBpb21tdS0+cmVnX3BoeXMpOwo+Cj4gVXNl
IHN5c2ZzX2VtaXQoKSBwbGVhc2UuCj4KCmFjay4gVGhhbmtzLCB3aWxsIHVwZGF0ZS4KCj4gPiAr
fQo+ID4gKwo+ID4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhhZGRyZXNzKTsKPiA+ICsKPiA+ICsj
ZGVmaW5lIEFUVFJfUkRfUkVHMzIobmFtZSwgb2Zmc2V0KSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiArICAgICBzc2l6ZV90IHJlZ18gIyMgbmFtZSAjIyBfc2hvdyhzdHJ1
Y3QgZGV2aWNlICpkZXYsICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLCBjaGFyICpidWYpICAgICAgIFwKPiA+ICt7
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gPiArICAgICBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSA9
IHN5c2ZzX2Rldl90b19pb21tdShkZXYpOyAgICAgXAo+ID4gKyAgICAgcmV0dXJuIHNwcmludGYo
YnVmLCAiMHgleFxuIiwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICByaXNjdl9pb21tdV9yZWFkbChpb21tdSwgb2Zmc2V0KSk7ICAg
ICAgICAgICAgICBcCj4gPiArfQo+ID4gKwo+ID4gKyNkZWZpbmUgQVRUUl9SRF9SRUc2NChuYW1l
LCBvZmZzZXQpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIHNz
aXplX3QgcmVnXyAjIyBuYW1lICMjIF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwgICAgICAgICAg
ICAgICBcCj4gPiArICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUg
KmF0dHIsIGNoYXIgKmJ1ZikgICAgICAgXAo+ID4gK3sgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIHN0
cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11ID0gc3lzZnNfZGV2X3RvX2lvbW11KGRldik7
ICAgICBcCj4gPiArICAgICByZXR1cm4gc3ByaW50ZihidWYsICIweCVsbHhcbiIsICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJpc2N2
X2lvbW11X3JlYWRxKGlvbW11LCBvZmZzZXQpKTsgICAgICAgICAgICAgIFwKPiA+ICt9Cj4gPiAr
Cj4gPiArI2RlZmluZSBBVFRSX1dSX1JFRzMyKG5hbWUsIG9mZnNldCkgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgc3NpemVfdCByZWdfICMjIG5hbWUgIyMgX3N0
b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgICAgICAgICAgICAgICAgICBc
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgbGVuKSAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gK3sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIHN0cnVjdCBy
aXNjdl9pb21tdV9kZXZpY2UgKmlvbW11ID0gc3lzZnNfZGV2X3RvX2lvbW11KGRldik7ICAgICBc
Cj4gPiArICAgICB1bnNpZ25lZCBsb25nIHZhbDsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgaW50IHJldDsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIHJldCA9IGtz
dHJ0b3VsKGJ1ZiwgMCwgJnZhbCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiArICAgICBpZiAocmV0KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICByZXR1cm4gcmV0OyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIHJpc2N2X2lv
bW11X3dyaXRlbChpb21tdSwgb2Zmc2V0LCB2YWwpOyAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiArICAgICByZXR1cm4gbGVuOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gK30KPiA+ICsKPiA+ICsjZGVmaW5lIEFUVFJfV1JfUkVH
NjQobmFtZSwgb2Zmc2V0KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAr
ICAgICBzc2l6ZV90IHJlZ18gIyMgbmFtZSAjIyBfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LCAg
ICAgICAgICAgICAgXAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0
cmlidXRlICphdHRyLCAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBjaGFyICpidWYsIHNpemVfdCBsZW4pICAgICAgICAgICAgICAgICAgICBcCj4gPiAr
eyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gKyAgICAgc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUg
PSBzeXNmc19kZXZfdG9faW9tbXUoZGV2KTsgICAgIFwKPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcg
bG9uZyB2YWw7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAr
ICAgICBpbnQgcmV0OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gKyAgICAgcmV0ID0ga3N0cnRvdWxsKGJ1ZiwgMCwgJnZhbCk7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIGlmIChyZXQpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAr
ICAgICAgICAgICAgIHJldHVybiByZXQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gKyAgICAgcmlzY3ZfaW9tbXVfd3JpdGVxKGlvbW11LCBvZmZzZXQs
IHZhbCk7ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIHJldHVybiBsZW47ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAr
fQo+Cj4gU28gdGhpcyBhbGxvd3MgdXNlcnMgdG8gY2hhbmdlIHRoZSByZWdpc3RlcnMgdGhyb3Vn
aCBzeXNmcz8gSG93IGRvZXMKPiBpdCBzeW5jaHJvbml6ZSB3aXRoIHRoZSBpb21tdSBkcml2ZXI/
Cj4KClRoZSBvbmx5IHdyaXRhYmxlIHJlZ2lzdGVycyBhcmUgZm9yIGRlYnVnIGludGVyZmFjZSBh
bmQgcGVyZm9ybWFuY2UKbW9uaXRvcmluZyBjb3VudGVycywgd2l0aG91dCBhbnkgc3luY2hyb25p
emF0aW9uIHJlcXVpcmVtZW50cyBiZXR3ZWVuCnVzZXIgLyBkcml2ZXIuICBJbiBmb2xsb3cgdXAg
cGF0Y2ggc2VyaWVzIHBlcmZvcm1hbmNlIGNvdW50ZXJzIHdpbGwgYmUKYWxzbyByZW1vdmVkIGZy
b20gc3lzZnMsIHJlcGxhY2VkIGJ5IGludGVncmF0aW9uIHdpdGggcGVyZm1vbgpzdWJzeXN0ZW0u
IFRoZSBvbmx5IHJlbWFpbmluZyB3aWxsIGJlIGEgZGVidWcgYWNjZXNzLCBwcm92aWRpbmcgdXNl
cgphY2Nlc3MgdG8gYWRkcmVzcyB0cmFuc2xhdGlvbiwgaW4gc2hvcnQgaXQgcHJvdmlkZXMgYW4g
aW50ZXJmYWNlIHRvCnF1ZXJ5IFNQQSBiYXNlZCBvbiBwcm92aWRlZCBJT1ZBL1JJRC9QQVNJRC4g
VGhlcmUgd2FzIGEgZGlzY3Vzc2lvbiBpbgpSVkkgSU9NTVUgVEcgZm9ydW0gaWYgaXQncyBhY2Nl
cHRhYmxlIHRvIGV4cG9zZSBzdWNoIGFuIGludGVyZmFjZSB0bwp0aGUgcHJpdmlsZWdlZCB1c2Vy
LCBhbmQgdGhlIGNvbmNsdXNpb24gd2FzIHRoYXQgaXQncyB2ZXJ5IGxpa2VseSBub3QKZXhwb3Np
bmcgbW9yZSBpbmZvIHRoYW4gcHJpdmlsZWdlZCB1c2VycyBhbHJlYWR5IGFyZSBhYmxlIHRvIGFj
cXVpcmUKYnkgbG9va2luZyBhdCBpbi1tZW1vcnkgZGF0YSBzdHJ1Y3R1cmVzLgoKUmVhZC1vbmx5
IHJlZ2lzdGVycyBhcmUgdG8gcHJvdmlkZSBkZWJ1ZyBhY2Nlc3MgdG8gdHJhY2sgcXVldWUKaGVh
ZC90YWlsIHBvaW50ZXJzIGFuZCBpbnRlcnJ1cHQgc3RhdGVzLgoKPiBCZXN0IHJlZ2FyZHMsCj4g
YmFvbHUKCnJlZ2FyZHMsCi0gVG9tYXN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
