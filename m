Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D83CC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0bNtWuRkUWlSKxtWpBWtl86oA7lMbullqdifivFj2M=; b=bL/FCXCv/Ydavy
	flxLnj58kHq7o7CkIrD53l73uniz/glvgvk3R5/+9JlYeBwEWlbFjAId1dSd0eYKJLGXCr5cO6z0e
	BAihcg9kwIwtaGUmrk4iBe3K8JIJyQIQDc7Q8KuW8lA/pd1W7IjYyE5D2Ii26H7okoq36HsYQ9FEV
	h+04aSeROv/kVVypBaNNDVKZWrS1UAztizi9tNwvI4T6d7PUWeyOgFAvMHWcEmkejU3RM1VqIkrgq
	nEqb67tRQWesq1e7iIiJzMZyi6H1HjxI3NKRHSbheB9LpOXr2l6Zq2TEmMgjHBySgDZFA4NLt5IuZ
	cVO4QE+YB6rQTwc0A1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4Ob-002cDg-0B;
	Fri, 15 Dec 2023 09:22:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4OY-002cCW-14
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 09:22:11 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6ce939ecfc2so380728b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 01:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702632125; x=1703236925; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAbH1XjkuKAQeNjFuhosk36+OO0YVuHDGozy0cI8OmU=;
        b=Z3rF9x76VSl0vAmCSj9ItBNfEkv3x5CWVCFtBLyQzMz7+GprINPMyxNUTslDslX0X+
         HrFypSwk0Z2mgid5W4b5BsXNuyO2ptPC30meRjaSCThZVXyFI1JKM2pGjZsCt4+ohlJi
         ZD7DgjIA1Cz4Mu4RJlDqOLJSyhTA6jOlsbU9IxRS+iFHVn00duLqPL6vHN4DFozt6ON9
         FGYAqCU8x2wKj/WKUTRWasmu9OyqaMVByMQ7sEDPPROYljStdWL/RUatJSig33Y5F8Sr
         8IwUEPG7x2OhW80IHtkhbSMyewdwLB3D1kEpACsTXh/IIu59CSB7mJQwW5vBJmckEs4l
         N4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702632125; x=1703236925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAbH1XjkuKAQeNjFuhosk36+OO0YVuHDGozy0cI8OmU=;
        b=RGzLm4A8MgijmfZhp/eBYdbTeat9/gSNnY8nq14OEnpta0MEbbIQCXIv4+Ot1ud2jr
         a9B1jSYe9rJIN0f67KFiAkchesyUWoNK0tLeWQk6tEyvG3ACAKVsdqYHxXn7lITRhrLX
         T3DgQnn5mblvmyeGbbusW+N6NjNzx1RYp65BkdkIinQSu/XgJb40bHFYve5B3b13vE6o
         Z2SKxfvHy85VwkbeHKUFb2UQDhBMZ4HyMEye+KmdCbDzQt+eJMkfm08TTLtayQe9A1TS
         zSoq6srEd2XlQbOKCIn6Q0RDEHe6oOA+ttHV9zh3u2oYhUnVj4J+C6nyUK1bYuh4UZ4D
         RhSA==
X-Gm-Message-State: AOJu0YwF4i2WEgU9N6crRZFhVzpHON9yhsI0Er9MY7OJ58u/M+f0Gpkd
	P8Vke+Gv+/+B37qktIBfTYnZbj780duk3EB8lQrUiLvc8VJiC7mGiEk=
X-Google-Smtp-Source: AGHT+IEivqz1Ru0ihRRp2JOPBdzO3cralWqI2XAtdMOT19Ynm8jHLjx3Kk2xK+N1a0MV4Lia/LBevSgec+5/RZ0syAo=
X-Received: by 2002:a05:6a20:5648:b0:18f:97c:617e with SMTP id
 is8-20020a056a20564800b0018f097c617emr11157689pzc.123.1702632125595; Fri, 15
 Dec 2023 01:22:05 -0800 (PST)
MIME-Version: 1.0
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-26-ajones@ventanamicro.com>
In-Reply-To: <20231214101552.100721-26-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 14:51:53 +0530
Message-ID: <CAAhSdy26X3Ou_+df=dcUhW80JwmR5R_SORyc38pqMx378PaF6A@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] RISC-V: KVM: selftests: Add guest_sbi_probe_extension
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_012210_367322_B357B8DA 
X-CRM114-Status: GOOD (  15.69  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMzo0NuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQWRkIGd1ZXN0X3NiaV9wcm9iZV9leHRlbnNpb24o
KSwgYWxsb3dpbmcgZ3Vlc3QgY29kZSB0byBwcm9iZSBmb3IKPiBTQkkgZXh0ZW5zaW9ucy4gQXMg
Z3Vlc3Rfc2JpX3Byb2JlX2V4dGVuc2lvbigpIG5lZWRzCj4gU0JJX0VSUl9OT1RfU1VQUE9SVEVE
LCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBicmluZyBpbiBhbGwgU0JJCj4gZXJyb3IgY29kZXMu
IFdlIGRvbid0IGJyaW5nIGluIGFsbCBjdXJyZW50IGV4dGVuc2lvbiBJRHMgb3IgYmFzZQo+IGV4
dGVuc2lvbiBmdW5jdGlvbiBJRHMgdGhvdWdoLCBldmVuIHRob3VnaCB3ZSBuZWVkIG9uZSBvZiBl
YWNoLAo+IGJlY2F1c2Ugd2UnZCBwcmVmZXIgdG8gYnJpbmcgdGhvc2UgaW4gYXMgbmVjZXNzYXJ5
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
ClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIC4uLi9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3Yv
cHJvY2Vzc29yLmggICB8IDIxICsrKysrKysrKysrKysrKysrKysKPiAgLi4uL3NlbGZ0ZXN0cy9r
dm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysKPiAg
MiBmaWxlcyBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggYi90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+IGluZGV4IGU3
MGNjZGEyMDExYi4uZGM1MGFkNjJlMTUwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4gKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiBAQCAtMTA4LDYgKzEw
OCwxNyBAQCBzdGF0aWMgaW5saW5lIHVpbnQ2NF90IF9fa3ZtX3JlZ19pZCh1aW50NjRfdCB0eXBl
LCB1aW50NjRfdCBzdWJ0eXBlLAo+ICAjZGVmaW5lIFNBVFBfQVNJRF9TSElGVCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgNDQKPiAgI2RlZmluZSBTQVRQX0FTSURfTUFTSyAgICAgICAg
ICAgICAgICAgICAgICAgICBfQUMoMHhGRkZGLCBVTCkKPgo+ICsvKiBTQkkgcmV0dXJuIGVycm9y
IGNvZGVzICovCj4gKyNkZWZpbmUgU0JJX1NVQ0NFU1MgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMAo+ICsjZGVmaW5lIFNCSV9FUlJfRkFJTFVSRSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLTEKPiArI2RlZmluZSBTQklfRVJSX05PVF9TVVBQT1JURUQgICAgICAgICAgICAgICAg
ICAtMgo+ICsjZGVmaW5lIFNCSV9FUlJfSU5WQUxJRF9QQVJBTSAgICAgICAgICAgICAgICAgIC0z
Cj4gKyNkZWZpbmUgU0JJX0VSUl9ERU5JRUQgICAgICAgICAgICAgICAgICAgICAgICAgLTQKPiAr
I2RlZmluZSBTQklfRVJSX0lOVkFMSURfQUREUkVTUyAgICAgICAgICAgICAgICAgICAgICAgIC01
Cj4gKyNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX0FWQUlMQUJMRSAgICAgICAgICAgICAgLTYKPiAr
I2RlZmluZSBTQklfRVJSX0FMUkVBRFlfU1RBUlRFRCAgICAgICAgICAgICAgICAgICAgICAgIC03
Cj4gKyNkZWZpbmUgU0JJX0VSUl9BTFJFQURZX1NUT1BQRUQgICAgICAgICAgICAgICAgICAgICAg
ICAtOAo+ICsKPiAgI2RlZmluZSBTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFSVCAgICAgICAgICAg
ICAweDA4MDAwMDAwCj4gICNkZWZpbmUgU0JJX0VYVF9FWFBFUklNRU5UQUxfRU5EICAgICAgICAg
ICAgICAgMHgwOEZGRkZGRgo+Cj4gQEAgLTExNSw2ICsxMjYsMTQgQEAgc3RhdGljIGlubGluZSB1
aW50NjRfdCBfX2t2bV9yZWdfaWQodWludDY0X3QgdHlwZSwgdWludDY0X3Qgc3VidHlwZSwKPiAg
I2RlZmluZSBLVk1fUklTQ1ZfU0VMRlRFU1RTX1NCSV9VQ0FMTCAgICAgICAgICAwCj4gICNkZWZp
bmUgS1ZNX1JJU0NWX1NFTEZURVNUU19TQklfVU5FWFAgICAgICAgICAgMQo+Cj4gK2VudW0gc2Jp
X2V4dF9pZCB7Cj4gKyAgICAgICBTQklfRVhUX0JBU0UgPSAweDEwLAo+ICt9Owo+ICsKPiArZW51
bSBzYmlfZXh0X2Jhc2VfZmlkIHsKPiArICAgICAgIFNCSV9FWFRfQkFTRV9QUk9CRV9FWFQgPSAz
LAo+ICt9Owo+ICsKPiAgc3RydWN0IHNiaXJldCB7Cj4gICAgICAgICBsb25nIGVycm9yOwo+ICAg
ICAgICAgbG9uZyB2YWx1ZTsKPiBAQCAtMTI1LDQgKzE0NCw2IEBAIHN0cnVjdCBzYmlyZXQgc2Jp
X2VjYWxsKGludCBleHQsIGludCBmaWQsIHVuc2lnbmVkIGxvbmcgYXJnMCwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzMsIHVuc2lnbmVkIGxvbmcgYXJnNCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzUpOwo+Cj4gK2Jvb2wgZ3Vl
c3Rfc2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0aWQsIGxvbmcgKm91dF92YWwpOwo+ICsKPiAg
I2VuZGlmIC8qIFNFTEZURVNUX0tWTV9QUk9DRVNTT1JfSCAqLwo+IGRpZmYgLS1naXQgYS90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jIGIvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IGluZGV4IDY5MDVhNDM0
ODM4MC4uN2NhNzM2ZmI0MTk0IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gQEAgLTM5MywzICszOTMsMjIgQEAgc3RydWN0
IHNiaXJldCBzYmlfZWNhbGwoaW50IGV4dCwgaW50IGZpZCwgdW5zaWduZWQgbG9uZyBhcmcwLAo+
Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gKwo+ICtib29sIGd1ZXN0X3NiaV9wcm9iZV9l
eHRlbnNpb24oaW50IGV4dGlkLCBsb25nICpvdXRfdmFsKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3Qg
c2JpcmV0IHJldDsKPiArCj4gKyAgICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9CQVNFLCBT
QklfRVhUX0JBU0VfUFJPQkVfRVhULCBleHRpZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAw
LCAwLCAwLCAwLCAwKTsKPiArCj4gKyAgICAgICBfX0dVRVNUX0FTU0VSVCghcmV0LmVycm9yIHx8
IHJldC5lcnJvciA9PSBTQklfRVJSX05PVF9TVVBQT1JURUQsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAicmV0LmVycm9yPSVsZCwgcmV0LnZhbHVlPSVsZFxuIiwgcmV0LmVycm9yLCByZXQudmFs
dWUpOwo+ICsKPiArICAgICAgIGlmIChyZXQuZXJyb3IgPT0gU0JJX0VSUl9OT1RfU1VQUE9SVEVE
KQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsgICAgICAgaWYgKG91dF92
YWwpCj4gKyAgICAgICAgICAgICAgICpvdXRfdmFsID0gcmV0LnZhbHVlOwo+ICsKPiArICAgICAg
IHJldHVybiB0cnVlOwo+ICt9Cj4gLS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
