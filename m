Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961F1C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 03:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OCq9p+WDdjpzf7mbvlKEtYuk7E2/yFCdMiwz26OyuyY=; b=UgsgxNSCsVViSKxi9o0+lPcVlQ
	Y7wi9sWqJ/3SVuQQ8NHnZEPUZbk2lUpePvsICs1o2mggvsnQbSLeuzu+jWZPEExP3JELVU3vQOict
	wBzJXogKrFHUu0MbhLI01ukMHy7e+0bbD2zzV7yueVtGFxz2V56vnfmvnClfcppXdy9kkbJYcEE1B
	36hEx+fnydKOG/DEXx++Iw6fWCJ4Q4xaoEViJMM8+XLLsvyWnD8w3An7TdbVDttRNd3++iAS3Z/KI
	qPDxtFUxdQW2sZURP+fXc4WFRfYsYJxiGy+k5HK3tTU0pfr3HiHesLjO0b98Up2NF3ja0ss6Wi/EI
	oCmt4omw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNPLO-00AEDY-32;
	Wed, 10 Jan 2024 03:33:30 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNPLL-00AED7-2M
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 03:33:29 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-7baa8da5692so157506439f.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jan 2024 19:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704857605; x=1705462405; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTJAAReDmCgeUKZ+956Wk5F3FplJWRu8shC9LpiGkOg=;
        b=hZY1KOZx/vG8dHufTytqfobVNaUOSQp3y9onz9oMiUDv0mSSiSd9FWKdx1y8yCBJHR
         vXroWBWX2WDWAQU3xckA5QkP3WiDPx3ZzLlaMKaGtsb6zV4tRNxzXd3Nn4Xvw1Jb/yNm
         YC+rptZd9ijLYl5DzNSL9uR6I7CAwa3mRI0M0f/vnbw4v83HXzirzA3L8nZiHwyAydDd
         S6vvlIbTJ1eO19rGQ5Dctcer1rIkoZNCoYHe4pRHMYbVY5YrZ7/kEd8kFplnqfghgWIR
         sdBdALAaOUTFvM3gxmu7Zm0N2KO4dfQG+tw559odQEMLWAZiBrRRDlZxvcfeGu90tqqe
         EvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704857605; x=1705462405;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTJAAReDmCgeUKZ+956Wk5F3FplJWRu8shC9LpiGkOg=;
        b=J6s/DDXTnZODnvfj74H6kxqh1jxF6/1ltESVMR5R+0KS0zXfWTArIEOVSfq3VTlyoY
         bB9kQTJXCK3xelt63WHGDceSGPkGOdezntGq2bhloTmXLARXTyyxbCRVOnm/cnR4MjXi
         h5HFYIqcJL98Nh9ioHgN6AJalBAGxAmW9SU1vGgW8pZgdKQGZ8vmruaAKT6ZRxKJxj8T
         VjKkHfB+Z9KrounbV6b5mjHp/Qv3326sBoBL2kct3q8L3X+5MYAGe+kF+jvBMa4h2nqX
         waL36d/k0kWI4nuLISQmM0fT1A5G4kwiBb7OfBV+ZW0eAbRS2Uz0sN5sPtIFZv835pLH
         BDCw==
X-Gm-Message-State: AOJu0YxWEohE58UDeyCxNNcN8C4x+S2++OQElfO3HTkMHsaUVSD6rxq6
	pOSBGoNBbQluio4gN7BF3CBss9LvReqkHBRwEzyXpW4Ikw1IQw==
X-Google-Smtp-Source: AGHT+IE+Q4lCxj83n8dzXZtXItlsHWcdYJuMOSNLQ15/SAx2kBai8iiFDS0hL5lBmDAKIsyRm/GyFDDg66IIJLFk4kI=
X-Received: by 2002:a6b:5f05:0:b0:7be:d961:6b0a with SMTP id
 t5-20020a6b5f05000000b007bed9616b0amr107497iob.18.1704857604934; Tue, 09 Jan
 2024 19:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20231205085959.32177-1-zong.li@sifive.com> <CANXhq0r6A48q+ehayaURLO6snDEjzVJO6Ti+1we-57i0ORT9yg@mail.gmail.com>
In-Reply-To: <CANXhq0r6A48q+ehayaURLO6snDEjzVJO6Ti+1we-57i0ORT9yg@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 10 Jan 2024 11:33:14 +0800
Message-ID: <CANXhq0qqv3MBEt8zsWBT+gkdyt1PD4ZjDSrznEotdFM7M7K+yQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: add CALLER_ADDRx support
To: palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_193327_813164_C4627AB2 
X-CRM114-Status: GOOD (  28.24  )
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

T24gRnJpLCBEZWMgMjksIDIwMjMgYXQgMjozNOKAr1BNIFpvbmcgTGkgPHpvbmcubGlAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyA1LCAyMDIzIGF0IDU6MDDigK9QTSBab25nIExp
IDx6b25nLmxpQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IENBTExFUl9BRERSeCByZXR1cm5z
IGNhbGxlcidzIGFkZHJlc3MgYXQgc3BlY2lmaWVkIGxldmVsLCB0aGV5IGFyZSB1c2VkCj4gPiBm
b3Igc2V2ZXJhbCB0cmFjZXJzLiBUaGVzZSBtYWNyb3MgZXZlbnR1YWxseSB1c2UKPiA+IF9fYnVp
bHRpbl9yZXR1cm5fYWRkcmVzcyhuKSB0byBnZXQgdGhlIGNhbGxlcidzIGFkZHJlc3MgaWYgYXJj
aCBkb2Vzbid0Cj4gPiBkZWZpbmUgdGhlaXIgb3duIGltcGxlbWVudGF0aW9uLgo+ID4KPiA+IElu
IFJJU0MtViwgX19idWlsdGluX3JldHVybl9hZGRyZXNzKG4pIG9ubHkgd29ya3Mgd2hlbiBuID09
IDAsIHdlIG5lZWQKPiA+IHRvIHdhbGsgdGhlIHN0YWNrIGZyYW1lIHRvIGdldCB0aGUgY2FsbGVy
J3MgYWRkcmVzcyBhdCBzcGVjaWZpZWQgbGV2ZWwuCj4gPgo+ID4gZGF0YS5sZXZlbCBzdGFydGVk
IGZyb20gJ2xldmVsICsgMycgZHVlIHRvIHRoZSBjYWxsIGZsb3cgb2YgZ2V0dGluZwo+ID4gY2Fs
bGVyJ3MgYWRkcmVzcyBpbiBSSVNDLVYgaW1wbGVtZW50YXRpb24uIElmIHdlIGRvbid0IGhhdmUg
YWRkaXRpb25hbAo+ID4gdGhyZWUgaXRlcmF0aW9uLCB0aGUgbGV2ZWwgaXMgY29ycmVzcG9uZGlu
ZyB0byBmb2xsb3dzOgo+ID4KPiA+IGNhbGxzaXRlIC0+IHJldHVybl9hZGRyZXNzIC0+IGFyY2hf
c3RhY2tfd2FsayAtPiB3YWxrX3N0YWNrZnJhbWUKPiA+IHwgICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICB8Cj4gPiBsZXZlbCAzICAgICBsZXZlbCAyICAgICAg
ICAgICBsZXZlbCAxICAgICAgICAgICAgbGV2ZWwgMAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFpv
bmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZnRyYWNlLmggICAgfCAgNSArKysrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZp
bGUgICAgICAgICB8ICAyICsrCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvcmV0dXJuX2FkZHJlc3Mu
YyB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgNTUgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2tl
cm5lbC9yZXR1cm5fYWRkcmVzcy5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vZnRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gPiBp
bmRleCAyYjJmNWRmN2VmMmMuLjQyNzc3ZjkxYTljNSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZnRyYWNlLmgKPiA+IEBAIC0yNSw2ICsyNSwxMSBAQAo+ID4KPiA+ICAjZGVmaW5lIEFSQ0hfU1VQ
UE9SVFNfRlRSQUNFX09QUyAxCj4gPiAgI2lmbmRlZiBfX0FTU0VNQkxZX18KPiA+ICsKPiA+ICtl
eHRlcm4gdm9pZCAqcmV0dXJuX2FkZHJlc3ModW5zaWduZWQgaW50IGxldmVsKTsKPiA+ICsKPiA+
ICsjZGVmaW5lIGZ0cmFjZV9yZXR1cm5fYWRkcmVzcyhuKSByZXR1cm5fYWRkcmVzcyhuKQo+ID4g
Kwo+ID4gIHZvaWQgTUNPVU5UX05BTUUodm9pZCk7Cj4gPiAgc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBsb25nIGZ0cmFjZV9jYWxsX2FkanVzdCh1bnNpZ25lZCBsb25nIGFkZHIpCj4gPiAgewo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvTWFrZWZpbGUKPiA+IGluZGV4IGZlZTIyYTNkMWI1My4uNDBkMDU0OTM5YWUyIDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL01ha2VmaWxlCj4gPiBAQCAtNyw2ICs3LDcgQEAgaWZkZWYgQ09ORklHX0ZUUkFDRQo+
ID4gIENGTEFHU19SRU1PVkVfZnRyYWNlLm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkKPiA+ICBDRkxB
R1NfUkVNT1ZFX3BhdGNoLm8gID0gJChDQ19GTEFHU19GVFJBQ0UpCj4gPiAgQ0ZMQUdTX1JFTU9W
RV9zYmkubyAgICA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ID4gK0NGTEFHU19SRU1PVkVfcmV0dXJu
X2FkZHJlc3MubyA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ID4gIGVuZGlmCj4gPiAgQ0ZMQUdTX3N5
c2NhbGxfdGFibGUubyArPSAkKGNhbGwgY2Mtb3B0aW9uLC1Xbm8tb3ZlcnJpZGUtaW5pdCwpCj4g
PiAgQ0ZMQUdTX2NvbXBhdF9zeXNjYWxsX3RhYmxlLm8gKz0gJChjYWxsIGNjLW9wdGlvbiwtV25v
LW92ZXJyaWRlLWluaXQsKQo+ID4gQEAgLTQ2LDYgKzQ3LDcgQEAgb2JqLXkgKz0gaXJxLm8KPiA+
ICBvYmoteSAgKz0gcHJvY2Vzcy5vCj4gPiAgb2JqLXkgICs9IHB0cmFjZS5vCj4gPiAgb2JqLXkg
ICs9IHJlc2V0Lm8KPiA+ICtvYmoteSAgKz0gcmV0dXJuX2FkZHJlc3Mubwo+ID4gIG9iai15ICAr
PSBzZXR1cC5vCj4gPiAgb2JqLXkgICs9IHNpZ25hbC5vCj4gPiAgb2JqLXkgICs9IHN5c2NhbGxf
dGFibGUubwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3JldHVybl9hZGRyZXNz
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9yZXR1cm5fYWRkcmVzcy5jCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jMjAwOGQ0YWE2ZTUKPiA+IC0tLSAvZGV2
L251bGwKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3JldHVybl9hZGRyZXNzLmMKPiA+IEBA
IC0wLDAgKzEsNDggQEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5Cj4gPiArLyoKPiA+ICsgKiBUaGlzIGNvZGUgY29tZSBmcm9tIGFyY2gvYXJtNjQva2VybmVs
L3JldHVybl9hZGRyZXNzLmMKPiA+ICsgKgo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBTaUZp
dmUuCj4gPiArICovCj4gPiArCj4gPiArI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgo+ID4gKyNp
bmNsdWRlIDxsaW51eC9rcHJvYmVzLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3N0YWNrdHJhY2Uu
aD4KPiA+ICsKPiA+ICtzdHJ1Y3QgcmV0dXJuX2FkZHJlc3NfZGF0YSB7Cj4gPiArICAgICAgIHVu
c2lnbmVkIGludCBsZXZlbDsKPiA+ICsgICAgICAgdm9pZCAqYWRkcjsKPiA+ICt9Owo+ID4gKwo+
ID4gK3N0YXRpYyBib29sIHNhdmVfcmV0dXJuX2FkZHIodm9pZCAqZCwgdW5zaWduZWQgbG9uZyBw
YykKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCByZXR1cm5fYWRkcmVzc19kYXRhICpkYXRhID0g
ZDsKPiA+ICsKPiA+ICsgICAgICAgaWYgKCFkYXRhLT5sZXZlbCkgewo+ID4gKyAgICAgICAgICAg
ICAgIGRhdGEtPmFkZHIgPSAodm9pZCAqKXBjOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBm
YWxzZTsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAtLWRhdGEtPmxldmVsOwo+ID4g
Kwo+ID4gKyAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ICt9Cj4gPiArTk9LUFJPQkVfU1lNQk9MKHNh
dmVfcmV0dXJuX2FkZHIpOwo+ID4gKwo+ID4gK3ZvaWQgKnJldHVybl9hZGRyZXNzKHVuc2lnbmVk
IGludCBsZXZlbCkKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCByZXR1cm5fYWRkcmVzc19kYXRh
IGRhdGE7Cj4gPiArCj4gPiArICAgICAgIGRhdGEubGV2ZWwgPSBsZXZlbCArIDM7Cj4gPiArICAg
ICAgIGRhdGEuYWRkciA9IE5VTEw7Cj4gPiArCj4gPiArICAgICAgIGFyY2hfc3RhY2tfd2Fsayhz
YXZlX3JldHVybl9hZGRyLCAmZGF0YSwgY3VycmVudCwgTlVMTCk7Cj4gPiArCj4gPiArICAgICAg
IGlmICghZGF0YS5sZXZlbCkKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZGF0YS5hZGRyOwo+
ID4gKyAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gPiArCj4g
PiArfQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BMKHJldHVybl9hZGRyZXNzKTsKPiA+ICtOT0tQUk9C
RV9TWU1CT0wocmV0dXJuX2FkZHJlc3MpOwo+ID4gLS0KPiA+IDIuMTcuMQo+ID4KPgo+IEhpIFBh
bG1lciBhbmQgYWxsLAo+IEkgd2FzIHdvbmRlcmluZyB3aGV0aGVyIHRoaXMgcGF0Y2ggaXMgZ29v
ZCBmb3IgZXZlcnlvbmU/IFRoYW5rcwoKSGkgUGFsbWVyLApJcyB0aGVyZSBhbnkgY2hhbmNlIHRv
IGluY2x1ZGUgdGhpcyBwYXRjaCBpbiA2LjgtcmMxPyBUaGFua3MKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
