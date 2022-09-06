Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6317ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 01:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xo0N4pw6B+no3e6FzyzAYWTyDi8/wiBVZdYw804TrVw=; b=h8fPqXlEhGtthu
	dQm/cCjB+Wcgoy3tXZa5kQtXvgmwXuFveGnLWWCHKVdgSjGP9NuatBTkRzlag6dNZZKJro6cnBTIx
	lHZxYeMfn0lmyEtaKhT+tmoGLQYsBe1CyQmeBdMxzINXp5/yA/RxT5740Un3sATbLFoNahsClmFUo
	hfqSLgJ6pNg0BtNHEovi5cVKACOCPG7GVakis5ltVty5EcOzgiIzGa4i0bin88gBnTTERe21SD+G4
	R5h40SaPVx0b6STDPw4sUOdw68xZX0HRUdI+mYwF9BHp3LoEZuETiDWalvgNgd/qDPfDuFzqbxOCh
	D79pp/KXWo064yQO0mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNZi-001NHU-Db; Tue, 06 Sep 2022 01:40:26 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVNZf-001NAg-22
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 01:40:24 +0000
Received: by mail-il1-x135.google.com with SMTP id s11so5298336ilt.7
        for <linux-riscv@lists.infradead.org>; Mon, 05 Sep 2022 18:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=BLCIYXFzxz6s1/j3ZB3Rou7Ui9yNjgppVcQ6BAlU/1M=;
        b=iN5/LTKj7WXSBoAPfOm+dizqeEH3nd3bz8F9PsnSjjQLO/p85YuXMHNlLSMsjUhY0o
         BzFK4uN56yXTXp6yJSvBhTJNI5TW8TeoF76QkeXZP9yY/1gdf1hqej9TQQgSlarAdNKS
         0b+/hMzE2O9+c8SaMMaauZim7mlPpkwwKGJM3qy+3N7tGi5cs4N0sQpdMTCZiT7ctRvD
         rOyLo89XGsThjyv57I3y/gyf/ZBrDNVGITxxVwj+5FSnZm7bCHwePiA4u9CgJWd/RERv
         3LttJiXM8CO8tCpO6LElOPIpoGA8XpmrPxo2x+fPsUieIrSOd/qmD1qBSOv2MkmMF5R/
         M6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BLCIYXFzxz6s1/j3ZB3Rou7Ui9yNjgppVcQ6BAlU/1M=;
        b=yjuOCHucX+fAPlVFe4QZcvZOXiIF/NBHJJrxQPKI1Bz36IJqDs2e8PxtJJwKoNlYaE
         mmtJ7X6dOIj/3NHsmvewCaK8MPvot+b15IkG9gf0QSvYLuCjyAhBuHE3CAPUUukk6E24
         Arasuv7Z5+jx+EqBzJwVfIpKyB+OkvkizTK+2cNRsteXhfiDt/PH9Sj5MUNkoau6vGeT
         ZwrWLIehMCF2r61fZWXQdra1tKRi5DTHKv/iUTUaSON+MYGQ+N5vAMZmgHECGSAFHcjH
         TVXFFohefm43TXMjeGs8l/0wOUlwGTwcon8Ewc8Z6pxlJOBG6UF5BwFl9CrFGmsT4WBp
         RpQA==
X-Gm-Message-State: ACgBeo0FOON69Xa8xL2ZKSawdMcqCsJGaA65iO9Oy+dufxz46UhWK/li
	O3/ht9wlbzzdcKeF55Z4sK5PKaA1a/ZkHtxFF5I=
X-Google-Smtp-Source: AA6agR4eBl0Sp41QNwnOSoe9ia/irlsn0OpEr0CLRY8Gg8i8RT5dVJIdLkrElwQcDzWSvKyr6N+dmyy34ht87oRs1+Q=
X-Received: by 2002:a05:6e02:1645:b0:2f1:574e:a862 with SMTP id
 v5-20020a056e02164500b002f1574ea862mr4544828ilu.163.1662428420973; Mon, 05
 Sep 2022 18:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220905083125.29426-1-zong.li@sifive.com> <20220905083125.29426-5-zong.li@sifive.com>
 <490336f2-5028-499f-d78f-620e083b3c61@microchip.com>
In-Reply-To: <490336f2-5028-499f-d78f-620e083b3c61@microchip.com>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 6 Sep 2022 09:40:09 +0800
Message-ID: <CA+ZOyah2Sw4vO5nDbOGHr_cP+VDh6JWH8A-82YBFkDnM5ks3+A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] soc: sifive: ccache: reduce printing on init
To: Conor.Dooley@microchip.com
Cc: zong.li@sifive.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	greentime.hu@sifive.com, ben.dooks@sifive.com, bp@alien8.de, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_184023_148244_B9580408 
X-CRM114-Status: GOOD (  19.81  )
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

PENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tPiDmlrwgMjAyMuW5tDnmnIg25pelIOmAseS6jCDl
h4zmmagzOjE45a+r6YGT77yaCj4KPiBPbiAwNS8wOS8yMDIyIDA5OjMxLCBab25nIExpIHdyb3Rl
Ogo+ID4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gPgo+ID4gRnJvbTogQmVu
IERvb2tzIDxiZW4uZG9va3NAc2lmaXZlLmNvbT4KPiA+Cj4gPiBUaGUgZHJpdmVyIHByaW50cyBv
dXQgNiBsaW5lcyBvbiBzdGFydHVwLCB3aGljaCBjYW4gZWFzaWx5IGJlIHJlZGN1ZWQKPiA+IHRv
IHR3byBsaW5lcyB3aXRob3V0IGxvc2luZyBhbnkgaW5mb3JtYXRpb24uCj4gPgo+ID4gTm90ZSwg
dG8gbWFrZSB0aGUgdHlwZXMgd29yayBiZXR0ZXIsIHVpbnQ2NF90IGhhcyBiZWVuIHJlcGxhY2Vk
IHdpdGgKPiA+IFVMTCB0byBtYWtlIHRoZSB1bnNpZ25lZCBsb25nIGxvbmcgbWF0Y2ggdGhlIGZv
cm1hdCBpbiB0aGUgcHJpbnQKPiA+IHN0YXRlbWVudC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBC
ZW4gRG9va3MgPGJlbi5kb29rc0BzaWZpdmUuY29tPgo+Cj4gSGV5IFpvbmcsCj4gTWlzc2luZyB5
b3VyIFNvQiBhZnRlciBCZW4ncyBoZXJlIGJ0dy4KPgoKT2ssIEkgd291bGQgYWRkIGl0IGluIFYz
LgoKPiA+IC0tLQo+ID4gIGRyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfY2NhY2hlLmMgfCAyNSAr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9z
aWZpdmUvc2lmaXZlX2NjYWNoZS5jIGIvZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9jY2FjaGUu
Ywo+ID4gaW5kZXggMGUwZWI4NWM5NGQ4Li40MDFjNjdhNDg1ZTIgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL3NvYy9zaWZpdmUvc2lmaXZlX2NjYWNoZS5jCj4gPiArKysgYi9kcml2ZXJzL3NvYy9z
aWZpdmUvc2lmaXZlX2NjYWNoZS5jCj4gPiBAQCAtODEsMjAgKzgxLDE3IEBAIHN0YXRpYyB2b2lk
IHNldHVwX3NpZml2ZV9kZWJ1Zyh2b2lkKQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBjY2FjaGVfY29u
ZmlnX3JlYWQodm9pZCkKPiA+ICB7Cj4gPiAtICAgICAgIHUzMiByZWd2YWwsIHZhbDsKPiA+IC0K
PiA+IC0gICAgICAgcmVndmFsID0gcmVhZGwoY2NhY2hlX2Jhc2UgKyBTSUZJVkVfQ0NBQ0hFX0NP
TkZJRyk7Cj4gPiAtICAgICAgIHZhbCA9IHJlZ3ZhbCAmIDB4RkY7Cj4gPiAtICAgICAgIHByX2lu
Zm8oIkNDQUNIRTogTm8uIG9mIEJhbmtzIGluIHRoZSBjYWNoZTogJWRcbiIsIHZhbCk7Cj4gPiAt
ICAgICAgIHZhbCA9IChyZWd2YWwgJiAweEZGMDApID4+IDg7Cj4gPiAtICAgICAgIHByX2luZm8o
IkNDQUNIRTogTm8uIG9mIHdheXMgcGVyIGJhbms6ICVkXG4iLCB2YWwpOwo+ID4gLSAgICAgICB2
YWwgPSAocmVndmFsICYgMHhGRjAwMDApID4+IDE2Owo+ID4gLSAgICAgICBwcl9pbmZvKCJDQ0FD
SEU6IFNldHMgcGVyIGJhbms6ICVsbHVcbiIsICh1aW50NjRfdCkxIDw8IHZhbCk7Cj4gPiAtICAg
ICAgIHZhbCA9IChyZWd2YWwgJiAweEZGMDAwMDAwKSA+PiAyNDsKPiA+IC0gICAgICAgcHJfaW5m
bygiQ0NBQ0hFOiBCeXRlcyBwZXIgY2FjaGUgYmxvY2s6ICVsbHVcbiIsICh1aW50NjRfdCkxIDw8
IHZhbCk7Cj4gPiAtCj4gPiAtICAgICAgIHJlZ3ZhbCA9IHJlYWRsKGNjYWNoZV9iYXNlICsgU0lG
SVZFX0NDQUNIRV9XQVlFTkFCTEUpOwo+ID4gLSAgICAgICBwcl9pbmZvKCJDQ0FDSEU6IEluZGV4
IG9mIHRoZSBsYXJnZXN0IHdheSBlbmFibGVkOiAlZFxuIiwgcmVndmFsKTsKPiA+ICsgICAgICAg
dTMyIGNmZzsKPiA+ICsKPiA+ICsgICAgICAgY2ZnID0gcmVhZGwoY2NhY2hlX2Jhc2UgKyBTSUZJ
VkVfQ0NBQ0hFX0NPTkZJRyk7Cj4gPiArCj4gPiArICAgICAgIHByX2luZm8oIkNDQUNIRTogJXUg
YmFua3MsICV1IHdheXMsIHNldHMvYmFuaz0lbGx1LCBieXRlcy9ibG9jaz0lbGx1XG4iLAo+ID4g
KyAgICAgICAgICAgICAgIChjZmcgJiAweGZmKSwgKGNmZyA+PiA4KSAmIDB4ZmYsCj4gPiArICAg
ICAgICAgICAgICAgQklUX1VMTCgoY2ZnID4+IDE2KSAmIDB4ZmYpLAo+ID4gKyAgICAgICAgICAg
ICAgIEJJVF9VTEwoKGNmZyA+PiAyNCkgJiAweGZmKSk7Cj4KPiBDb3VsZCB3ZSB1c2UgZGVmaW5l
cyBwbGVhc2UgZm9yIHRoZSByZWdpc3RlciBzaGlmdHMgcGxlYXNlPwo+CgpZZXMsIGxldCBtZSBk
ZWZpbmUgdGhlbSBpbiBWMwoKPiA+ICsKPiA+ICsgICAgICAgY2ZnID0gcmVhZGwoY2NhY2hlX2Jh
c2UgKyBTSUZJVkVfQ0NBQ0hFX1dBWUVOQUJMRSk7Cj4gPiArICAgICAgIHByX2luZm8oIkNDQUNI
RTogSW5kZXggb2YgdGhlIGxhcmdlc3Qgd2F5IGVuYWJsZWQ6ICVkXG4iLCBjZmcpOwo+Cj4gJXUg
aGVyZSBubz8KClRoYW5rcyBmb3IgcG9pbnQgaXQgb3V0LiBJIHdvdWxkIGNoYW5nZSBpdCBpbiBW
My4KCj4gVGhhbmtzLAo+IENvbm9yLgo+Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG9mX2RldmljZV9pZCBzaWZpdmVfY2NhY2hlX2lkc1tdID0gewo+ID4gLS0KPiA+IDIuMTcu
MQo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
