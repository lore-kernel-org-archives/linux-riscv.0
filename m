Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F90EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 14:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6oIpPx5BghswQUc5w2/iCGYSw5cazGz7eQHMB27P9k=; b=ZJnj3JsQ/0n2x2
	OwxtgqNgmlo5hR+bwsLcASjDWeXyoiaZ+RRKiTGzP9PlkSiXC6lwrffxFF47HAfYO6plmlGAn9kMd
	BkgB1V2l+4AClnUJnqemvSh+4Vd8rghZAbJdO9wUDqCPPT8Yma5JEPOMrudVniYhtMuU04S/YfY2u
	GeEnvM9uL+abE9uWnEw2/KFMlP8JmvPXGa/h6naf56msg61c17SHcrD1sMWEmLmo9xkaEQz0xsIRq
	kXvaqVRMCML9hg/SrF5Inmr5AvjA1bCwrZvh3IOjv10LPojLsTx3ytI9ddECLAH2Zv6iDxrVa4fAN
	ml93Rn3V1j5JCqoqh8Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCL55-000vuq-0o;
	Thu, 22 Jun 2023 14:14:39 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCL4n-000vjA-2O
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 14:14:23 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-763e968b7feso127262885a.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1687443260; x=1690035260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6spyBZyWO4AHmsv4yQ35oicbOidV3jFa5d/DVSHDx8=;
        b=NDjv7zb4FD1kSqdgP0ZYZN6Yl8N/0PWyQw8ao0OdR1vRORSJq2zfYu1aIt3cl4LwXK
         2QCCHPD9nxnVSDtjn7Du03Vx/zndKc7kvLE21flOf/zD8e1eO22Da4aTSYsoUqRA1N/5
         Gkg/CchVue2Kl2hi/80hfbWAzWAuqMdIpZAsanReiCfcDw3i2STQO3O0EiJFyCQshgbj
         ng8vG+wL1rMILAc28uiBAQWi8XmC3G4vbzz/L3ZJcskB5018cGKkth5KHbxM8OKF0Ap7
         X1ez1jJ4ysCPkD5YTOe+mRCgYKRz3Ax9z0HCDRhpWAqTmS+mlFGNzjGHwsdG/ibflIdV
         sdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687443260; x=1690035260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6spyBZyWO4AHmsv4yQ35oicbOidV3jFa5d/DVSHDx8=;
        b=huWDdVOJ5XPb11Wak2+3nxxWfJtQTSgUnzgzHDmSOa09v7WyOdyh5xsodmvN7XMefS
         RZq9QFwc3BlEMiNjWKUBb2tTfz1SfE/31adAUwLgGUfGTw24yt9Gi5wce/WIOhXcoFRq
         gYu9HRbiI6/ArdVZDUcht33evODMRELB47jYSlxXVCVBz9/re478s3BmVzYdO1c9arAE
         64n8DWtoMqj1vFtcG0q0VY79EhsdgQpFEVut5lz7G08nyaWeb5+FqCJL/bD23n+kv5ca
         LHuXgPzMw3LF+huJrtvV65QFxWXMFSyhMLamgsUfCwXe8k+eqRAgsp1ykN1r2hapkS2V
         fGQA==
X-Gm-Message-State: AC+VfDxH03mwBPTXjTmFYI4KqK7qmINFpA/OTnJ7mOdmY7/Jzf9lVR5M
	LRqcsOXNqmDGN9O7fqKc668icmcLTmSlIjGRFhJM9g==
X-Google-Smtp-Source: ACHHUZ6wuHeyHxGN/VyrGAU7ppgz/7sh5hUTCsErOIpf7dEKUhKY3T0VINiKO1etVDb0HGsHNJ3NlB54ixmmA3WrETg=
X-Received: by 2002:a05:620a:468c:b0:763:c1d0:f823 with SMTP id
 bq12-20020a05620a468c00b00763c1d0f823mr5623472qkb.52.1687443258926; Thu, 22
 Jun 2023 07:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230621124133.779572-1-mchitale@ventanamicro.com>
 <20230621124133.779572-2-mchitale@ventanamicro.com> <20230621-ca3ea20b1717d7bbf44cb836@orel>
In-Reply-To: <20230621-ca3ea20b1717d7bbf44cb836@orel>
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Thu, 22 Jun 2023 19:43:42 +0530
Message-ID: <CAN37VV4Drr4iU825cxyr3hPoQjFMvCoD5wbfSk1u-o_2cmC-0Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] riscv: mm: use svinval instructions instead of sfence.vma
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "=Atish Patra" <atishp@atishpatra.org>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_071421_782099_666FD7E8 
X-CRM114-Status: GOOD (  28.16  )
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

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgNzo0NOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMDY6MTE6
MzNQTSArMDUzMCwgTWF5dXJlc2ggQ2hpdGFsZSB3cm90ZToKPiA+IFdoZW4gc3ZpbnZhbCBpcyBz
dXBwb3J0ZWQgdGhlIGxvY2FsX2ZsdXNoX3RsYl9wYWdlKgo+ID4gZnVuY3Rpb25zIHdvdWxkIHBy
ZWZlciB0byB1c2UgdGhlIGZvbGxvd2luZyBzZXF1ZW5jZQo+ID4gdG8gb3B0aW1pemUgdGhlIHRs
YiBmbHVzaGVzIGluc3RlYWQgb2YgYSBzaW1wbGUgc2ZlbmNlLnZtYToKPiA+Cj4gPiBzZmVuY2Uu
dy5pbnZhbAo+ID4gc3ZpbnZhbC52bWEKPiA+ICAgLgo+ID4gICAuCj4gPiBzdmludmFsLnZtYQo+
ID4gc2ZlbmNlLmludmFsLmlyCj4gPgo+ID4gVGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbnNlY3V0
aXZlIHN2aW52YWwudm1hIGluc3RydWN0aW9ucwo+ID4gdGhhdCBjYW4gYmUgZXhlY3V0ZWQgaW4g
bG9jYWxfZmx1c2hfdGxiX3BhZ2UqIGZ1bmN0aW9ucyBpcwo+ID4gbGltaXRlZCB0byBQVFJTX1BF
Ul9QVEUuIFRoaXMgaXMgcmVxdWlyZWQgdG8gYXZvaWQgc29mdAo+ID4gbG9ja3VwcyBhbmQgdGhl
IGFwcHJvYWNoIGlzIHNpbWlsYXIgdG8gdGhhdCB1c2VkIGluIGFybTY0Lgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IE1heXVyZXNoIENoaXRhbGUgPG1jaGl0YWxlQHZlbnRhbmFtaWNyby5jb20+Cj4g
PiAtLS0KPiA+ICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgfCA2MiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDU2IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0v
dGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gaW5kZXggNzdiZTU5YWFk
YzczLi5hZGUwYjVjZjhiNDcgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNo
LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+ID4gQEAgLTUsNiArNSwxMiBA
QAo+ID4gICNpbmNsdWRlIDxsaW51eC9zY2hlZC5oPgo+ID4gICNpbmNsdWRlIDxhc20vc2JpLmg+
Cj4gPiAgI2luY2x1ZGUgPGFzbS9tbXVfY29udGV4dC5oPgo+ID4gKyNpbmNsdWRlIDxhc20vaHdj
YXAuaD4KPiA+ICsjaW5jbHVkZSA8YXNtL2luc24tZGVmLmg+Cj4gPiArCj4gPiArI2RlZmluZSBo
YXNfc3ZpbnZhbCgpICAgICAgICByaXNjdl9oYXNfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lT
QV9FWFRfU1ZJTlZBTCkKPiA+ICsKPiA+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyB0bGJfZmx1c2hf
YWxsX3RocmVzaG9sZCBfX3JlYWRfbW9zdGx5ID0gUFRSU19QRVJfUFRFOwo+ID4KPiA+ICBzdGF0
aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxiX2FsbF9hc2lkKHVuc2lnbmVkIGxvbmcgYXNp
ZCkKPiA+ICB7Cj4gPiBAQCAtMjYsMTkgKzMyLDYzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2Nh
bF9mbHVzaF90bGJfcGFnZV9hc2lkKHVuc2lnbmVkIGxvbmcgYWRkciwKPiA+ICBzdGF0aWMgaW5s
aW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxiX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSwgdW5zaWduZWQgbG9uZyBzdHJpZGUpCj4g
PiAgewo+ID4gLSAgICAgaWYgKHNpemUgPD0gc3RyaWRlKQo+ID4gLSAgICAgICAgICAgICBsb2Nh
bF9mbHVzaF90bGJfcGFnZShzdGFydCk7Cj4gPiAtICAgICBlbHNlCj4gPiArICAgICBpZiAoKHNp
emUgLyBzdHJpZGUpIDw9IHRsYl9mbHVzaF9hbGxfdGhyZXNob2xkKSB7Cj4gPiArICAgICAgICAg
ICAgIGlmIChoYXNfc3ZpbnZhbCgpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgYXNtIHZv
bGF0aWxlKFNGRU5DRV9XX0lOVkFMKCkgOjo6ICJtZW1vcnkiKTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICB3aGlsZSAoc2l6ZSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YXNtIHZvbGF0aWxlKFNJTlZBTF9WTUEoJTAsIHplcm8pCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgOiA6ICJyIiAoc3RhcnQpIDogIm1lbW9yeSIpOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnQgKz0gc3RyaWRlOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNpemUgPiBzdHJpZGUpCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemUgLT0gc3RyaWRlOwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplID0gMDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4KPiBuaXQ6
IFRoZSBmb3VyIHdoaWxlIGxvb3BzIGFkZGVkIGJ5IHRoaXMgcGF0Y2ggY291bGQgYWxsIGJlIHdy
aXR0ZW4gbW9yZQo+IGNvbmNpc2VseSBhcwo+Cj4gICB1bnNpZ25lZCBsb25nIGVuZCA9IHN0YXJ0
ICsgc2l6ZTsKPgo+ICAgd2hpbGUgKHN0YXJ0IDwgZW5kKSB7Cj4gICAgIC8qIGZsdXNoIG9uZSAq
Lwo+ICAgICBzdGFydCArPSBzdHJpZGU7Cj4gICB9Cj4KPiBBbmQgd2UgY291bGQgc2hpZnQgZXZl
cnl0aGluZyBvbmUgbGV2ZWwgb2YgaW5kZW50YXRpb24gbGVmdCB3aXRoCj4KPiAgIGlmICgoc2l6
ZSAvIHN0cmlkZSkgPiB0bGJfZmx1c2hfYWxsX3RocmVzaG9sZCkgewo+ICAgICBsb2NhbF9mbHVz
aF90bGJfYWxsKCk7Cj4gICAgIHJldHVybjsKPiAgIH0KPgo+ICAgaWYgKGhhc19zdmludmFsKCkp
IHsKClRoeCBEcmV3LiBJIHdpbGwgdXBkYXRlIGluIHRoZSBuZXh0IHJldmlzaW9uCj4gICAuLi4K
Pgo+IFRoYW5rcywKPiBkcmV3Cj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICBhc20gdm9sYXRp
bGUoU0ZFTkNFX0lOVkFMX0lSKCkgOjo6ICJtZW1vcnkiKTsKPiA+ICsgICAgICAgICAgICAgfSBl
bHNlIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB3aGlsZSAoc2l6ZSkgewo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbG9jYWxfZmx1c2hfdGxiX3BhZ2Uoc3RhcnQpOwo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhcnQgKz0gc3RyaWRlOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNpemUgPiBzdHJpZGUpCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemUgLT0gc3RyaWRlOwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzaXplID0gMDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAg
ICAgICAgICAgIH0KPiA+ICsgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAgICAgICAgIGxvY2FsX2Zs
dXNoX3RsYl9hbGwoKTsKPiA+ICsgICAgIH0KPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBsb2NhbF9mbHVzaF90bGJfcmFuZ2VfYXNpZCh1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ID4g
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcgc3RyaWRlLCB1
bnNpZ25lZCBsb25nIGFzaWQpCj4gPiAgewo+ID4gLSAgICAgaWYgKHNpemUgPD0gc3RyaWRlKQo+
ID4gLSAgICAgICAgICAgICBsb2NhbF9mbHVzaF90bGJfcGFnZV9hc2lkKHN0YXJ0LCBhc2lkKTsK
PiA+IC0gICAgIGVsc2UKPiA+ICsgICAgIGlmICgoc2l6ZSAvIHN0cmlkZSkgPD0gdGxiX2ZsdXNo
X2FsbF90aHJlc2hvbGQpIHsKPiA+ICsgICAgICAgICAgICAgaWYgKGhhc19zdmludmFsKCkpIHsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUoU0ZFTkNFX1dfSU5WQUwoKSA6
OjogIm1lbW9yeSIpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHdoaWxlIChzaXplKSB7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUoU0lOVkFMX1ZNQSgl
MCwgJTEpIDogOiAiciIgKHN0YXJ0KSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiciIgKGFzaWQpIDogIm1lbW9yeSIpOwo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RhcnQgKz0gc3RyaWRlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKHNpemUgPiBzdHJpZGUpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHNpemUgLT0gc3RyaWRlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXpl
ID0gMDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgYXNtIHZvbGF0aWxlKFNGRU5DRV9JTlZBTF9JUigpIDo6OiAibWVtb3J5Iik7Cj4gPiArICAg
ICAgICAgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgd2hpbGUgKHNpemUp
IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9wYWdl
X2FzaWQoc3RhcnQsIGFzaWQpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Rh
cnQgKz0gc3RyaWRlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNpemUg
PiBzdHJpZGUpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemUg
LT0gc3RyaWRlOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplID0gMDsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsgICAgIH0gZWxzZSB7Cj4g
PiAgICAgICAgICAgICAgIGxvY2FsX2ZsdXNoX3RsYl9hbGxfYXNpZChhc2lkKTsKPiA+ICsgICAg
IH0KPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIF9faXBpX2ZsdXNoX3RsYl9hbGwodm9pZCAq
aW5mbykKPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+
ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
