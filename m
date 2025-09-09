Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5346BCAC589
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 07:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2HFR/vuCuwAkBwlF0aATyaRyqGLiWTPJ6q2Bx8dqWVw=; b=rV8FtJR7NaKjgi
	IwSng9aLiH7XER+xAMJumx6qXzbTgI7Zyx1IBHG3HGtWIDau1V9bhH7zia7J48c0w46SxULsPKxwa
	MQSQfjcpW8LN1pJuG2JZmAtxXK/iFttvvuFwSHfnwFitSUlqI+10tkTbeDnhxs5GU1DQaxosroEU7
	Qem3zkEPjg03OXat13Wr5tNfFG0DFZrsSrXE/ylmqCOIRLIEU1bpzKjrla6lfHRHMQOoRbGvDuIU7
	8p9guqtnbU7Y3fub/V+JfC7LbMo4mdhzoiEnPfHbOS59W4EZGnmx6lqhNoW0UI8kDl3qkVeuirAaP
	Bst3XcLj5WRvIHFVCA+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsv9-00000005EDW-1p9m;
	Tue, 09 Sep 2025 07:37:43 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsAu-00000004oF0-42kQ
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 06:49:58 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-40a8f56e59eso4604565ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Sep 2025 23:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757400595; x=1758005395; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tMGMIIAM6sHy/Zxv5pxoK3ri8eUb3ls0915OVi+tjo=;
        b=NcSiIUhl2yz9t5g1g23quNpah6M5poSCxk08TqSXaKuby3zgPhdg8lPSpUe7q5Bw1D
         4b9VH4S9sX94HlTLUWidGqxUdI5w12IUhd+o76GOUehJMseRT084pPG5q2bgK7uqtpY7
         ypKMcVWKTOJh+keniaY/txgXoVROmOCGAGwXUxqaUbuRzk/ujpwkDs6rdvTZ23M1Acyo
         aK8wFfys5+tc0lgHI3SjUyqt0yGn8ucqwwl/rdxGr//XtjHbgn0vA82HVwzhNI39tneF
         Q6PKIV2fFpbUn7N8kgVngs5KyN9me0NVDN2Y7PiWGEmb71WCnBDmEmJT2TgRABgA9OkA
         pFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757400595; x=1758005395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4tMGMIIAM6sHy/Zxv5pxoK3ri8eUb3ls0915OVi+tjo=;
        b=OTG5xrFQx5fWF/Pu1+6zRvbGjtFnGHHzf+sUUWRlKNCgHMnVyCW7KOMtRkcQt9Axe6
         V4onmGF5pZZyayUd6B71pZjP8gtpKme/l8gLMKDfILMb8DXu2xfJH7BMrka4XNQucQoB
         8Xd/gj4QDcm5LRxJnQYnq8FdvCLyyFUryfx44GDjsfGjkELvI2Emm2cIH7ktyXGzC/Li
         Rem1gNWM9vETvDTPHrPrs/UZUWVKwhoowHegU8Sc9mu2JXWY9EFgjvC0jgW01oHsBJ/F
         rattX8KDVkliVMH733EQhRv9umAM1oJByAefovMXNwzChNopq7zVL+r47s8p/wjq0I0d
         OI0g==
X-Forwarded-Encrypted: i=1; AJvYcCW2IYWuzoP3cbcKLANjcItWyEXt5na0YfR6iQRrUTyWPYxBskVbuFNeQDUQ2CZGpZxXCrPmPUQijS9RSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWIxNV8NozNNmynSzwSmc0vAPy+bymtXHGWcCIEc2fMhcpQQZM
	nzmtMXIOzPctUtkhEBE+H1pr9bQYGBeOpFBuViLlwQfqQHzR9AmGwczwsGZYZput3QDuUgpv1cs
	z5yGSzhIHauW6GwI61/ZukgCvrXWYc2IENYCLOKf+0g==
X-Gm-Gg: ASbGnctBIz14HyVuqXmFVjEBfOSsxIHke4gN9tK2ePJDgIBcwyHQwoLX/O5UtxuavFs
	cCQbYXbD3g+Q6L4dH8uGXx9vIDu5UoFZr+R5U6VKOczJ0/RIGpXKxwqpo8xl3t01ZziEUxYnTr7
	ZKFF8TKxB4GVXr6M6nQpz0ciUYK5tf1qQzj4lyFY4d2xtzrPSiCAhoy+XqkX+5I3I0uuYiSs4Vz
	lNLqAe4w3IQn4IbP4TdZhhugFYdXvfzXeyRLAStivYoYjR/dU4=
X-Google-Smtp-Source: AGHT+IHApbelfKr9iZjlbPLT4hrwWMN2zK90Qp74CPK8qggzSmBY3zhKklG8kN1niPRcRUYYEKR1Dn+Se41EF7a7fAk=
X-Received: by 2002:a05:6e02:1a2e:b0:3f6:5f12:2905 with SMTP id
 e9e14a558f8ab-3fd8672ce38mr131687095ab.23.1757400595369; Mon, 08 Sep 2025
 23:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250825121411.86573-1-tjytimi@163.com>
In-Reply-To: <20250825121411.86573-1-tjytimi@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Sep 2025 12:19:43 +0530
X-Gm-Features: Ac12FXxC3F2KfRE7z4xEWUZppWNrpTWEFb52_Lgv63sTz9df23xVkubP9_GJqjA
Message-ID: <CAAhSdy27hnGS3HOazwnR4Y+SCk94RLnz5CA1kDkzsx7QH3dmwA@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: skip csr restore if vcpu preempted reload
To: Jinyu Tang <tjytimi@163.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_234957_266396_D028BB16 
X-CRM114-Status: GOOD (  27.24  )
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

T24gTW9uLCBBdWcgMjUsIDIwMjUgYXQgNTo0NOKAr1BNIEppbnl1IFRhbmcgPHRqeXRpbWlAMTYz
LmNvbT4gd3JvdGU6Cj4KPiBUaGUga3ZtX2FyY2hfdmNwdV9sb2FkKCkgZnVuY3Rpb24gaXMgY2Fs
bGVkIGluIHR3byBjYXNlcyBmb3IgcmlzY3Y6Cj4gMS4gV2hlbiBlbnRlcmluZyBLVk1fUlVOIGZy
b20gdXNlcnNwYWNlIGlvY3RsLgo+IDIuIFdoZW4gYSBwcmVlbXB0ZWQgVkNQVSBpcyBzY2hlZHVs
ZWQgYmFjay4KPgo+IEluIHRoZSBzZWNvbmQgY2FzZSwgaWYgbm8gb3RoZXIgS1ZNIFZDUFUgaGFz
IHJ1biBvbiB0aGlzIENQVSBzaW5jZSB0aGUKPiBjdXJyZW50IFZDUFUgd2FzIHByZWVtcHRlZCwg
dGhlIGd1ZXN0IENTUiAoaW5jbHVkaW5nIEFJQSBDU1JTIGFuZCBIR1RBUCkKPiB2YWx1ZXMgYXJl
IHN0aWxsIHZhbGlkIGluIHRoZSBoYXJkd2FyZSBhbmQgZG8gbm90IG5lZWQgdG8gYmUgcmVzdG9y
ZWQuCj4KPiBUaGlzIHBhdGNoIGlzIHRvIHNraXAgdGhlIENTUiB3cml0ZSBwYXRoIHdoZW46Cj4g
MS4gVGhlIFZDUFUgd2FzIHByZXZpb3VzbHkgcHJlZW1wdGVkCj4gKHZjcHUtPnNjaGVkdWxlZF9v
dXQgPT0gMSkuCj4gMi4gSXQgaXMgYmVpbmcgcmVsb2FkZWQgb24gdGhlIHNhbWUgcGh5c2ljYWwg
Q1BVCj4gKHZjcHUtPmFyY2gubGFzdF9leGl0X2NwdSA9PSBjcHUpLgo+IDMuIE5vIG90aGVyIEtW
TSBWQ1BVIGhhcyB1c2VkIHRoaXMgQ1BVIGluIHRoZSBtZWFudGltZQo+ICh2Y3B1ID09IF9fdGhp
c19jcHVfcmVhZChrdm1fZm9ybWVyX3ZjcHUpKS4KPgo+IFRoaXMgcmVkdWNlcyBtYW55IENTUiB3
cml0ZXMgd2l0aCBmcmVxdWVudCBwcmVlbXB0aW9uIG9uIHRoZSBzYW1lIENQVS4KCkN1cnJlbnRs
eSwgSSBzZWUgdGhlIGZvbGxvd2luZyBpc3N1ZXMgd2l0aCB0aGlzIHBhdGNoOgoKMSkgSXQncyBt
YWtpbmcgR3Vlc3QgdXNhZ2Ugb2YgSU1TSUMgVlMtZmlsZXMgb24gdGhlIFFFTVUgdmlydAogICAg
bWFjaGluZSB2ZXJ5IHVuc3RhYmxlIGFuZCBHdWVzdCBuZXZlciBib290cy4gSXQgY291bGQgYmUK
ICAgIHNvbWUgUUVNVSBpc3N1ZSBidXQgSSBkb24ndCB3YW50IHRvIGluY3JlYXNlIGluc3RhYmls
aXR5CiAgICBvbiBRRU1VIHNpbmNlIGl0IGlzIG91ciBwcmltYXJ5IGRldmVsb3BtZW50IHZlaGlj
bGUuCgoyKSBXZSBoYXZlIENTUnMgbGlrZSBoZWRlbGVnIHdoaWNoIGNhbiBiZSB1cGRhdGVkIGJ5
IEtWTQogICAgdXNlciBzcGFjZSB2aWEgc2V0X2d1ZXN0X2RlYnVnKCkgaW9jdGwuCgpUaGUgZGly
ZWN0aW9uIG9mIHRoZSBwYXRjaCBpcyBmaW5lIGJ1dCBpdCBpcyB2ZXJ5IGZyYWdpbGUgYXQgdGhl
IG1vbWVudC4KClJlZ2FyZHMsCkFudXAKCj4KPiBTaWduZWQtb2ZmLWJ5OiBKaW55dSBUYW5nIDx0
anl0aW1pQDE2My5jb20+Cj4gUmV2aWV3ZWQtYnk6IE51dHR5IExpdSA8bnV0dHkubGl1QGhvdG1h
aWwuY29tPgo+IC0tLQo+ICB2MiAtPiB2MzoKPiAgdjIgd2FzIG1pc3NpbmcgYSBjcml0aWNhbCBj
aGVjayBiZWNhdXNlIEkgZ2VuZXJhdGVkIHRoZSBwYXRjaCBmcm9tIG15Cj4gIHdyb25nIChleHBl
cmltZW50YWwpIGJyYW5jaC4gVGhpcyBpcyBmaXhlZCBpbiB2My4gU29ycnkgZm9yIG15IHRyb3Vi
bGUuCj4KPiAgdjEgLT4gdjI6Cj4gIEFwcGx5IHRoZSBsb2dpYyB0byBhaWEgY3NyIGxvYWQuIFRo
YW5rcyBmb3IKPiAgQW5kcmV3IEpvbmVzJ3MgYWR2aWNlLgo+Cj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHUuYyB8IDEzICsrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5j
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggZjAwMWU1NjQwLi42NmJkM2RkZDUgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdS5jCj4gQEAgLTI1LDYgKzI1LDggQEAKPiAgI2RlZmluZSBDUkVBVEVfVFJBQ0VfUE9JTlRT
Cj4gICNpbmNsdWRlICJ0cmFjZS5oIgo+Cj4gK3N0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3Qg
a3ZtX3ZjcHUgKiwga3ZtX2Zvcm1lcl92Y3B1KTsKPiArCj4gIGNvbnN0IHN0cnVjdCBfa3ZtX3N0
YXRzX2Rlc2Mga3ZtX3ZjcHVfc3RhdHNfZGVzY1tdID0gewo+ICAgICAgICAgS1ZNX0dFTkVSSUNf
VkNQVV9TVEFUUygpLAo+ICAgICAgICAgU1RBVFNfREVTQ19DT1VOVEVSKFZDUFUsIGVjYWxsX2V4
aXRfc3RhdCksCj4gQEAgLTU4MSw2ICs1ODMsMTAgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X2xvYWQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgY3B1KQo+ICAgICAgICAgc3RydWN0IGt2bV92Y3B1
X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOwo+ICAgICAgICAgc3RydWN0IGt2bV92
Y3B1X2NvbmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwo+Cj4gKyAgICAgICBpZiAodmNwdS0+
c2NoZWR1bGVkX291dCAmJiB2Y3B1ID09IF9fdGhpc19jcHVfcmVhZChrdm1fZm9ybWVyX3ZjcHUp
ICYmCj4gKyAgICAgICAgICAgICAgIHZjcHUtPmFyY2gubGFzdF9leGl0X2NwdSA9PSBjcHUpCj4g
KyAgICAgICAgICAgICAgIGdvdG8gY3NyX3Jlc3RvcmVfZG9uZTsKPiArCj4gICAgICAgICBpZiAo
a3ZtX3Jpc2N2X25hY2xfc3luY19jc3JfYXZhaWxhYmxlKCkpIHsKPiAgICAgICAgICAgICAgICAg
bnNoID0gbmFjbF9zaG1lbSgpOwo+ICAgICAgICAgICAgICAgICBuYWNsX2Nzcl93cml0ZShuc2gs
IENTUl9WU1NUQVRVUywgY3NyLT52c3N0YXR1cyk7Cj4gQEAgLTYyNCw2ICs2MzAsOSBAQCB2b2lk
IGt2bV9hcmNoX3ZjcHVfbG9hZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBjcHUpCj4KPiAg
ICAgICAgIGt2bV9yaXNjdl9tbXVfdXBkYXRlX2hnYXRwKHZjcHUpOwo+Cj4gKyAgICAgICBrdm1f
cmlzY3ZfdmNwdV9haWFfbG9hZCh2Y3B1LCBjcHUpOwo+ICsKPiArY3NyX3Jlc3RvcmVfZG9uZToK
PiAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3RpbWVyX3Jlc3RvcmUodmNwdSk7Cj4KPiAgICAgICAg
IGt2bV9yaXNjdl92Y3B1X2hvc3RfZnBfc2F2ZSgmdmNwdS0+YXJjaC5ob3N0X2NvbnRleHQpOwo+
IEBAIC02MzMsOCArNjQyLDYgQEAgdm9pZCBrdm1fYXJjaF92Y3B1X2xvYWQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBpbnQgY3B1KQo+ICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfZ3Vlc3RfdmVjdG9y
X3Jlc3RvcmUoJnZjcHUtPmFyY2guZ3Vlc3RfY29udGV4dCwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZjcHUtPmFyY2guaXNhKTsKPgo+IC0gICAgICAga3Zt
X3Jpc2N2X3ZjcHVfYWlhX2xvYWQodmNwdSwgY3B1KTsKPiAtCj4gICAgICAgICBrdm1fbWFrZV9y
ZXF1ZXN0KEtWTV9SRVFfU1RFQUxfVVBEQVRFLCB2Y3B1KTsKPgo+ICAgICAgICAgdmNwdS0+Y3B1
ID0gY3B1Owo+IEBAIC02NDUsNiArNjUyLDggQEAgdm9pZCBrdm1fYXJjaF92Y3B1X3B1dChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICB2b2lkICpuc2g7Cj4gICAgICAgICBzdHJ1Y3Qg
a3ZtX3ZjcHVfY3NyICpjc3IgPSAmdmNwdS0+YXJjaC5ndWVzdF9jc3I7Cj4KPiArICAgICAgIF9f
dGhpc19jcHVfd3JpdGUoa3ZtX2Zvcm1lcl92Y3B1LCB2Y3B1KTsKPiArCj4gICAgICAgICB2Y3B1
LT5jcHUgPSAtMTsKPgo+ICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfYWlhX3B1dCh2Y3B1KTsKPiAt
LQo+IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
