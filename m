Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB94C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 30 May 2022 18:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Hi4vpR0j+OHayiUESJQkp2rsBzg4VL2E8ToOKEqydXU=; b=Ujrqdn9MKLleCbQXnIQ0eUWj30
	VyVXPsSCBhpTn2y9x0HKEN7C12oJacvaD06bIQU2nnXqub9YAN6tOoZZFjgV9jrMwu3LtSt5dKUsm
	rBv0n1u/gL5x/ACyvh+zaEhm326yCfeir2p99qzidE9uXNq7kz9HYRyUmy1JOLtzsKKhKKDlSjsdy
	M6sC/0vgAegOl4nSoJ0T6CP2r8KO4GF7lD0o6pBGA7EyqXL3wfAoyL4ftepcegiMo7syM4JRj7ptn
	v0VkPPSkbDtLw2ks+tmWThQ1Xxj5hITzeM4PIg8Lm89D0LhJ+VvKr2aUZZf1e4e7QhmxDING2CM4A
	cEaB26uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvkaq-007xQU-Qy; Mon, 30 May 2022 18:58:20 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvkan-007xPB-Ln
	for linux-riscv@lists.infradead.org; Mon, 30 May 2022 18:58:19 +0000
Received: by mail-pf1-x431.google.com with SMTP id j6so11196408pfe.13
        for <linux-riscv@lists.infradead.org>; Mon, 30 May 2022 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=FFd5J9hlrCh2QSfJ0U9Wq/vsfh13pMH0ZkFo1eZIXtA=;
        b=G2A0nuMRKJztXPtT1GUrPx85rUqGPGHpsq6URvVAWa2fAqIkqlfU4RngPrGYBoa1Ni
         M6NJlw8gvJTBgkCc39LSTpamjbz9roIDkZlQnC9RO7k8Rc/xTX31a3GgYujadTBpfIga
         JQwSMuZ1HKoUjn6bSrBPFJvBaAnJAoYYH3EqEdZ9ex71cFuQ884I0tNEZG45hvUsKFSe
         SdW5ZEoZd6rbSNFsE45uC0UD8kqMIeKOTMqVLl/EmGGsbxPQhZqogmDjAeWQ19R+ngDM
         5BxwPho/sCen5YkWBuTX+8h/WXJiDTTq1gmrRwjtIax6oHnLs3pgInlqG/tnWA3am8JP
         E8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=FFd5J9hlrCh2QSfJ0U9Wq/vsfh13pMH0ZkFo1eZIXtA=;
        b=gHZ1YeW8NHE6qK3LBx+Z26mWUU15MvAhtM0wbARiNWTWHbMP3NYy+EXBGY/dfq1BaY
         ojFEjJBem5AJfoZG16/q43ots+OiBDdRrvbyIZnAfcmyVPw5KR0LZxJ226F0aAAzX/ow
         EQxzMXi5CsURxhsUwOUrQOl8+0r2MsUc5xWrWVuXq2zMn/vU7Apvuee/pEf4BgtqnMGA
         rNr8idwr4hZo5jYxh8FpwVUv+/n1J4J+GK4TD6qBKmtds4s/wFYEUD6PQvhzaFH1g5Al
         t4sDLIvwYvu5dINklwoSxNWb+Gp+2N+YzzrK6nUHNETuPzi3SD6nDDDb6ENFQGInX2Pp
         VEzQ==
X-Gm-Message-State: AOAM532eFa11mJuzRRU+sEmhezklOuyKIKUZ019+M8IpUnNIHxU0zMBD
	ijyKYNN5ectdGG5j2zuZ4SxGwvuytFecGA==
X-Google-Smtp-Source: ABdhPJxxJ8lgOI/t/BS91nMmuF/AA3XEFbCsJdbzVlMXQCjM93kfvxRGwUywbXar5ejrleDbO2A5Hg==
X-Received: by 2002:a63:2026:0:b0:3fa:cefb:e408 with SMTP id g38-20020a632026000000b003facefbe408mr25103264pgg.57.1653937096823;
        Mon, 30 May 2022 11:58:16 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id n16-20020aa79050000000b00518c6887217sm9107889pfo.58.2022.05.30.11.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 11:58:16 -0700 (PDT)
Date: Mon, 30 May 2022 11:58:16 -0700 (PDT)
X-Google-Original-Date: Mon, 30 May 2022 11:58:13 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Prepare dropping week attribute from arch_kexec_apply_relocations[_add]
In-Reply-To: <20220530074202.pydmbbgvbtaugw5j@pengutronix.de>
CC: lizhengyu3@huawei.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
  Bjorn Topel <bjorn.topel@gmail.com>, guoren@linux.alibaba.com, jszhang@kernel.org, kexec@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mick@ics.forth.gr,
  Paul Walmsley <paul.walmsley@sifive.com>, penberg@kernel.org, sunnanyong@huawei.com, wangkefeng.wang@huawei.com,
  christophe.leroy@csgroup.eu, liaochang1@huawei.com, Stephen Rothwell <sfr@canb.auug.org.au>,
  akpm@linux-foundation.org, ebiederm@xmission.com, kernel@pengutronix.de, naveen.n.rao@linux.vnet.ibm.com,
  linuxppc-dev@lists.ozlabs.org, lizhengyu3@huawei.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: u.kleine-koenig@pengutronix.de
Message-ID: <mhng-5872aea0-6f64-4685-8f8d-fdeb42e4c972@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_115817_756696_DFCCD498 
X-CRM114-Status: GOOD (  30.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAzMCBNYXkgMjAyMiAwMDo0MjowMiBQRFQgKC0wNzAwKSwgdS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlIHdyb3RlOgo+IFdpdGhvdXQgdGhpcyBjaGFuZ2UgYXJjaC9yaXNjdi9r
ZXJuZWwvZWxmX2tleGVjLmMgZmFpbHMgdG8gY29tcGlsZSBvbmNlCj4gY29tbWl0IDIzM2MxZTZj
MzE5YyAoImtleGVjX2ZpbGU6IGRyb3Agd2VhayBhdHRyaWJ1dGUgZnJvbQo+IGFyY2hfa2V4ZWNf
YXBwbHlfcmVsb2NhdGlvbnNbX2FkZF0iKSBpcyBhbHNvIGNvbnRhaW5lZCBpbiB0aGUgdHJlZS4K
PiBUaGlzIGN1cnJlbnRseSBoYXBwZW5zIGluIG5leHQtMjAyMjA1MjcuCj4KPiBQcmVwYXJlIHRo
ZSBSSVNDLVYgc2ltaWxhciB0byB0aGUgczM5MCBhZGFwdGlvbiBkb25lIGluIDIzM2MxZTZjMzE5
Yy4KPiBUaGlzIGlzIHNhZmUgdG8gZG8gb24gdG9wIG9mIHRoZSByaXNjdiBjaGFuZ2UgZXZlbiB3
aXRob3V0IHRoZSBjaGFuZ2UgdG8KPiBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zLgo+Cj4g
Rml4ZXM6IDgzOGIzZTI4NDg4ZiAoIlJJU0MtVjogTG9hZCBwdXJnYXRvcnkgaW4ga2V4ZWNfZmls
ZSIpCj4gTG9va3MtZ29vZC10bzogbGlhb2NoYW5nIChBKSA8bGlhb2NoYW5nMUBodWF3ZWkuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+Cj4gLS0tCj4KPiBPbiBNb24sIE1heSAzMCwgMjAyMiBhdCAwOTo0MzoyNkFN
ICswODAwLCBsaWFvY2hhbmcgKEEpIHdyb3RlOgo+PiA+IEkgY2FuIGNvbmZpcm0gdGhhdCBkb2lu
Zwo+PiA+IAo+PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmgKPj4gPiBpbmRleCAyMDYyMTdiMjMzMDEu
LmVlZTI2MGU4YWIzMCAxMDA2NDQKPj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tl
eGVjLmgKPj4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmgKPj4gPiBAQCAt
NTUsNiArNTUsMTMgQEAgZXh0ZXJuIHJpc2N2X2tleGVjX21ldGhvZCByaXNjdl9rZXhlY19ub3Jl
bG9jYXRlOwo+PiA+ICAKPj4gPiAgI2lmZGVmIENPTkZJR19LRVhFQ19GSUxFCj4+ID4gIGV4dGVy
biBjb25zdCBzdHJ1Y3Qga2V4ZWNfZmlsZV9vcHMgZWxmX2tleGVjX29wczsKPj4gPiArCj4+ID4g
K3N0cnVjdCBwdXJnYXRvcnlfaW5mbzsKPj4gPiAraW50IGFyY2hfa2V4ZWNfYXBwbHlfcmVsb2Nh
dGlvbnNfYWRkKHN0cnVjdCBwdXJnYXRvcnlfaW5mbyAqcGksCj4+ID4gKwkJCQkgICAgIEVsZl9T
aGRyICpzZWN0aW9uLAo+PiA+ICsJCQkJICAgICBjb25zdCBFbGZfU2hkciAqcmVsc2VjLAo+PiA+
ICsJCQkJICAgICBjb25zdCBFbGZfU2hkciAqc3ltdGFiKTsKPj4gPiArI2RlZmluZSBhcmNoX2tl
eGVjX2FwcGx5X3JlbG9jYXRpb25zX2FkZCBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zX2Fk
ZAo+PiA+ICAjZW5kaWYKPj4gPiAgCj4+ID4gICNlbmRpZgo+PiAKPj4gTEdUTSwgeW91IGNvdWxk
IHNlbmQgYSBmaXh1cCBwYXRjaCB0byByaXNjdiwgdGhhbmtzLgo+PiAKPj4gPiAKPj4gPiBvbiB0
b3Agb2YgODM4YjNlMjg0ODhmIHJlc3VsdHMgaW4gYSBjb21waWxhYmxlIHRyZWUuIEFuZCB3aGVu
IG1lcmdpbmcKPj4gPiAyMzNjMWU2YzMxOWMgaW50byB0aGlzLCBpdCBpcyBzdGlsbCBidWlsZGlu
Zy4KPj4gPiAKPj4gPiBJJ20gbm90IGVub3VnaCBpbnRvIGtleGVjIChhbmQgcmlzY3YpIHRvIGp1
ZGdlIGlmIHRoaXMgaXMgc2Vuc2libGUsIG9yCj4+ID4gY3JlYXRlIGEgdXNlZnVsIGNvbW1pdCBs
b2cgYnV0IHRoZSBvYnZpb3VzIHdheSBmb3J3YXJkIGlzIHRvIGFwcGx5IHRoZQo+PiA+IGFib3Zl
IHBhdGNoIHRvIHRoZSByaXNjdiB0cmVlIGJlZm9yZSBpdCBoaXRzIExpbnVzJyB0cmVlLgo+Cj4g
T2ssIGhlcmUgY29tZXMgYSBwYXRjaCB3aXRoIGEgZ2VuZXJpYyBjb21taXQgbG9nLiAKPgo+IEBy
aXNjdiBwZW9wbGU6IElmIHlvdSBwcmVmZXIsIHNxdWFzaCBpdCBpbnRvIDgzOGIzZTI4NDg4Zi4K
ClNvcnJ5LCBqdXN0IHNhdyB0aGlzIGFmdGVyIEkgc2VudCBteSB2ZXJzaW9uIG9mIHRoZSBmaXgu
ICBUaGV5J3JlIHRoZSAKc2FtZSwgYnV0IGRvIHlvdSBtaW5kIHNlbmRpbmcgYSBmdWxsLW9uIHBh
dGNoIHNvIEkgY2FuIG1lcmdlIGl0PwoKPgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+Cj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20va2V4ZWMuaCB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
ZXhlYy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhlYy5oCj4gaW5kZXggMjA2MjE3YjIz
MzAxLi5lZWUyNjBlOGFiMzAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
ZXhlYy5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZXhlYy5oCj4gQEAgLTU1LDYg
KzU1LDEzIEBAIGV4dGVybiByaXNjdl9rZXhlY19tZXRob2QgcmlzY3Zfa2V4ZWNfbm9yZWxvY2F0
ZTsKPiAgCj4gICNpZmRlZiBDT05GSUdfS0VYRUNfRklMRQo+ICBleHRlcm4gY29uc3Qgc3RydWN0
IGtleGVjX2ZpbGVfb3BzIGVsZl9rZXhlY19vcHM7Cj4gKwo+ICtzdHJ1Y3QgcHVyZ2F0b3J5X2lu
Zm87Cj4gK2ludCBhcmNoX2tleGVjX2FwcGx5X3JlbG9jYXRpb25zX2FkZChzdHJ1Y3QgcHVyZ2F0
b3J5X2luZm8gKnBpLAo+ICsJCQkJICAgICBFbGZfU2hkciAqc2VjdGlvbiwKPiArCQkJCSAgICAg
Y29uc3QgRWxmX1NoZHIgKnJlbHNlYywKPiArCQkJCSAgICAgY29uc3QgRWxmX1NoZHIgKnN5bXRh
Yik7Cj4gKyNkZWZpbmUgYXJjaF9rZXhlY19hcHBseV9yZWxvY2F0aW9uc19hZGQgYXJjaF9rZXhl
Y19hcHBseV9yZWxvY2F0aW9uc19hZGQKPiAgI2VuZGlmCj4gIAo+ICAjZW5kaWYKPgo+IGJhc2Ut
Y29tbWl0OiA4MzhiM2UyODQ4OGY3MDJlMmI1NDc3YjM5M2YwMDliMjYzOWQyYjFhCj4gLS0gCj4g
Mi4zNi4xCj4KPiAtLSAKPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwKPiBJbmR1c3RyaWFsIExpbnV4IFNv
bHV0aW9ucyAgICAgICAgICAgICAgICAgfCBodHRwczovL3d3dy5wZW5ndXRyb25peC5kZS8gfAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
