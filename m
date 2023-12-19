Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ABFC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 21:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xl/GwIwc6dRlEs26aFmXnetvpvBwU4PAgaxKgvT3L1A=; b=XZlv++cxmP/wIP
	yj8uhsrR+YFORRprr2osA6+Q783XRftoeyIaQfdsE5m86lVANEiXCgUdA65PN+KkWD+PmuPQYTnNK
	SSX7TbX/GFXerqQigJU3YknAq32m++FKTcbGHgSbu486PHHlkFMODjjNE17uH1fLJoHNfDep4rq/c
	wS3thqLP256e9n+odI1X41catzDMgN/eFnWnkWq3bMxdLJqd+d9h1RnXt6TIEP4BjpOz30dcPP9kW
	te3KeHkPzsgtxXLPjjlXHqocrLElYKX7fWHEaVwr5Ol1cx/txWtAkoClmGEkTZesV9mYvvAk6gL1J
	pS9R5iXM66HkLd2Q90aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFi5v-00FXXn-0p;
	Tue, 19 Dec 2023 21:57:43 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFi5s-00FXV4-1a
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 21:57:41 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2cc6c028229so38300261fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 13:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1703023052; x=1703627852; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flfYg+kGL4SvX7qyMdFuJAdPbCDixB8UEJxEUpxAFlw=;
        b=IFcmQnbZzulkbESEb8fNz+EaqrDViyfdrAhNwypGv67dtXkw/uful+mRjZkvxe3YLV
         c+oW3uKbx0KJlzpwpPAUeXEfaRtBPh5L2t/FeEb9HS+hhMB716WoIkoBPYLt7L6AxO3N
         SZOusnx5ysVFZUOb0cjVN5uLBlFupaJYNGreQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703023052; x=1703627852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flfYg+kGL4SvX7qyMdFuJAdPbCDixB8UEJxEUpxAFlw=;
        b=O7mCs5ARj5vd7aCK9iuBAMaSccJUUr/0Db9Ipk5KdpybCtzPDS3uKUC80b5ISWnDSE
         XM63sPuUfsKscmMaKbuqZJnHaQbNoqMusJjBb+k5gywr11qA9KCXA60aXMeKHZrmHEqo
         FsZskTFpqnzxcUSSU0Krz13J3NiOYc1ZKkqOoAdTKNYA6UK0nA3cmtg15OCpUXtaUw4k
         GhBPWtTFXvPdX0fvb4jO10J9vRCzX5Jdq1qveTZ/oAr1T2JaTJgnxHhOcHXLVQXi1puC
         5Kgi4hLPN/OaEQWFj8F4V6IkVByWpsZXrdh2dbKFAbPtCRHPq/yihvkmzWS2lrstvp0l
         Nb7Q==
X-Gm-Message-State: AOJu0Yzw3RaH9gXxAND15aOAM5SDhV5Ea0c/+b+I6QeB+JWIE12gMpeU
	4cutLcOJWJQ7RJ9M+qbH8WtbKsmuZKKkZiQ8ha87
X-Google-Smtp-Source: AGHT+IG2Ctyaf7+tPjnLU31qpHDga5y6EAeSS7g74aovcwiQNTS85vE9NtWDgEl1DtJ8skzrB9XXgJpoZHJP/aQkxIM=
X-Received: by 2002:a2e:a453:0:b0:2cc:8472:c97c with SMTP id
 v19-20020a2ea453000000b002cc8472c97cmr617988ljn.26.1703023052424; Tue, 19 Dec
 2023 13:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20231217204019.36492-15-ajones@ventanamicro.com> <20231217204019.36492-26-ajones@ventanamicro.com>
In-Reply-To: <20231217204019.36492-26-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Dec 2023 13:57:21 -0800
Message-ID: <CAOnJCUKu1069YXRWopFDjRobF4jjskdFJMQH1oD2wPc+9JoBmg@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] RISC-V: KVM: selftests: Add guest_sbi_probe_extension
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_135740_529809_C31C78ED 
X-CRM114-Status: GOOD (  16.02  )
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

T24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgMTI6NDDigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEFkZCBndWVzdF9zYmlfcHJvYmVfZXh0ZW5zaW9u
KCksIGFsbG93aW5nIGd1ZXN0IGNvZGUgdG8gcHJvYmUgZm9yCj4gU0JJIGV4dGVuc2lvbnMuIEFz
IGd1ZXN0X3NiaV9wcm9iZV9leHRlbnNpb24oKSBuZWVkcwo+IFNCSV9FUlJfTk9UX1NVUFBPUlRF
RCwgdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gYnJpbmcgaW4gYWxsIFNCSQo+IGVycm9yIGNvZGVz
LiBXZSBkb24ndCBicmluZyBpbiBhbGwgY3VycmVudCBleHRlbnNpb24gSURzIG9yIGJhc2UKPiBl
eHRlbnNpb24gZnVuY3Rpb24gSURzIHRob3VnaCwgZXZlbiB0aG91Z2ggd2UgbmVlZCBvbmUgb2Yg
ZWFjaCwKPiBiZWNhdXNlIHdlJ2QgcHJlZmVyIHRvIGJyaW5nIHRob3NlIGluIGFzIG5lY2Vzc2Fy
eS4KPgo+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0t
Cj4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggICB8IDIxICsr
KysrKysrKysrKysrKysrKysKPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nv
ci5jICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
aW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+IGluZGV4IGU3MGNjZGEyMDExYi4uZGM1MGFkNjJl
MTUwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jp
c2N2L3Byb2Nlc3Nvci5oCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1
ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiBAQCAtMTA4LDYgKzEwOCwxNyBAQCBzdGF0aWMgaW5saW5l
IHVpbnQ2NF90IF9fa3ZtX3JlZ19pZCh1aW50NjRfdCB0eXBlLCB1aW50NjRfdCBzdWJ0eXBlLAo+
ICAjZGVmaW5lIFNBVFBfQVNJRF9TSElGVCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
NDQKPiAgI2RlZmluZSBTQVRQX0FTSURfTUFTSyAgICAgICAgICAgICAgICAgICAgICAgICBfQUMo
MHhGRkZGLCBVTCkKPgo+ICsvKiBTQkkgcmV0dXJuIGVycm9yIGNvZGVzICovCj4gKyNkZWZpbmUg
U0JJX1NVQ0NFU1MgICAgICAgICAgICAgICAgICAgICAgICAgICAgMAo+ICsjZGVmaW5lIFNCSV9F
UlJfRkFJTFVSRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLTEKPiArI2RlZmluZSBT
QklfRVJSX05PVF9TVVBQT1JURUQgICAgICAgICAgICAgICAgICAtMgo+ICsjZGVmaW5lIFNCSV9F
UlJfSU5WQUxJRF9QQVJBTSAgICAgICAgICAgICAgICAgIC0zCj4gKyNkZWZpbmUgU0JJX0VSUl9E
RU5JRUQgICAgICAgICAgICAgICAgICAgICAgICAgLTQKPiArI2RlZmluZSBTQklfRVJSX0lOVkFM
SURfQUREUkVTUyAgICAgICAgICAgICAgICAgICAgICAgIC01Cj4gKyNkZWZpbmUgU0JJX0VSUl9B
TFJFQURZX0FWQUlMQUJMRSAgICAgICAgICAgICAgLTYKPiArI2RlZmluZSBTQklfRVJSX0FMUkVB
RFlfU1RBUlRFRCAgICAgICAgICAgICAgICAgICAgICAgIC03Cj4gKyNkZWZpbmUgU0JJX0VSUl9B
TFJFQURZX1NUT1BQRUQgICAgICAgICAgICAgICAgICAgICAgICAtOAo+ICsKCkFkZCBTQklfRVJS
X05PX1NITUVNIGFzIHdlbGwgPwoKPiAgI2RlZmluZSBTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFS
VCAgICAgICAgICAgICAweDA4MDAwMDAwCj4gICNkZWZpbmUgU0JJX0VYVF9FWFBFUklNRU5UQUxf
RU5EICAgICAgICAgICAgICAgMHgwOEZGRkZGRgo+Cj4gQEAgLTExNSw2ICsxMjYsMTQgQEAgc3Rh
dGljIGlubGluZSB1aW50NjRfdCBfX2t2bV9yZWdfaWQodWludDY0X3QgdHlwZSwgdWludDY0X3Qg
c3VidHlwZSwKPiAgI2RlZmluZSBLVk1fUklTQ1ZfU0VMRlRFU1RTX1NCSV9VQ0FMTCAgICAgICAg
ICAwCj4gICNkZWZpbmUgS1ZNX1JJU0NWX1NFTEZURVNUU19TQklfVU5FWFAgICAgICAgICAgMQo+
Cj4gK2VudW0gc2JpX2V4dF9pZCB7Cj4gKyAgICAgICBTQklfRVhUX0JBU0UgPSAweDEwLAo+ICt9
Owo+ICsKPiArZW51bSBzYmlfZXh0X2Jhc2VfZmlkIHsKPiArICAgICAgIFNCSV9FWFRfQkFTRV9Q
Uk9CRV9FWFQgPSAzLAo+ICt9Owo+ICsKPiAgc3RydWN0IHNiaXJldCB7Cj4gICAgICAgICBsb25n
IGVycm9yOwo+ICAgICAgICAgbG9uZyB2YWx1ZTsKPiBAQCAtMTI1LDQgKzE0NCw2IEBAIHN0cnVj
dCBzYmlyZXQgc2JpX2VjYWxsKGludCBleHQsIGludCBmaWQsIHVuc2lnbmVkIGxvbmcgYXJnMCwK
PiAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzMsIHVuc2lnbmVkIGxv
bmcgYXJnNCwKPiAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzUpOwo+
Cj4gK2Jvb2wgZ3Vlc3Rfc2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0aWQsIGxvbmcgKm91dF92
YWwpOwo+ICsKPiAgI2VuZGlmIC8qIFNFTEZURVNUX0tWTV9QUk9DRVNTT1JfSCAqLwo+IGRpZmYg
LS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5j
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IGlu
ZGV4IDY5MDVhNDM0ODM4MC4uN2NhNzM2ZmI0MTk0IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiArKysgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gQEAgLTM5MywzICszOTMs
MjIgQEAgc3RydWN0IHNiaXJldCBzYmlfZWNhbGwoaW50IGV4dCwgaW50IGZpZCwgdW5zaWduZWQg
bG9uZyBhcmcwLAo+Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gKwo+ICtib29sIGd1ZXN0
X3NiaV9wcm9iZV9leHRlbnNpb24oaW50IGV4dGlkLCBsb25nICpvdXRfdmFsKQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3Qgc2JpcmV0IHJldDsKPiArCj4gKyAgICAgICByZXQgPSBzYmlfZWNhbGwoU0JJ
X0VYVF9CQVNFLCBTQklfRVhUX0JBU0VfUFJPQkVfRVhULCBleHRpZCwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAwLCAwLCAwLCAwLCAwKTsKPiArCj4gKyAgICAgICBfX0dVRVNUX0FTU0VSVCgh
cmV0LmVycm9yIHx8IHJldC5lcnJvciA9PSBTQklfRVJSX05PVF9TVVBQT1JURUQsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAicmV0LmVycm9yPSVsZCwgcmV0LnZhbHVlPSVsZFxuIiwgcmV0LmVy
cm9yLCByZXQudmFsdWUpOwo+ICsKPiArICAgICAgIGlmIChyZXQuZXJyb3IgPT0gU0JJX0VSUl9O
T1RfU1VQUE9SVEVEKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAg
ICAgaWYgKG91dF92YWwpCj4gKyAgICAgICAgICAgICAgICpvdXRfdmFsID0gcmV0LnZhbHVlOwo+
ICsKPiArICAgICAgIHJldHVybiB0cnVlOwo+ICt9Cj4gLS0KPiAyLjQzLjAKPgoKCkFwYXJ0IGZy
b20gdGhhdCwgTEdUTS4KClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5j
LmNvbT4KCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
