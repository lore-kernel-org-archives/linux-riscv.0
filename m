Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB72BC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 03:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xtjuqus7E9jmRDXE1LKXAupZ/9zJx+cpTEpoS+SzHQE=; b=QSPghUkE//TJ/L
	UosH/sd5l92rHkE+T1Z1ngOQ9B1NV3pU5IsTHtcPIqU9vDdKoBm1BGlUpYWM4LKWmhPGepKj7PB0M
	rH0PBWGikYAgYa4TfQRU/1RkzU/E3vukp4yjIru5vYI9BQw09J/Mr1UENZSYY5tsiAo3fIse5mjOB
	sfCao4EtFSsGroGGsRFR9r6tfmUFwnLHHW8mgPypEE752WK/rMevyfCzbT8Sfdbuw6PdmEV79J+ny
	imQVaMAUtcE1Tzio9RnxwidvMJBNfALT9FBZE6Tuootoz3IQDUrxBlsw6h6y6tf7DO9HWRI2wBeGh
	LRVEwuf5yJidC589VjPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykoB-0000000Buvt-1mFs;
	Mon, 22 Apr 2024 03:57:35 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryko7-0000000BurK-2qGj
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 03:57:33 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-36a15df0f8cso17893735ab.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Apr 2024 20:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713758243; x=1714363043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EFW9+m2geC2plcNu4ooEHsTuQPopye1HlQhXkbIiQ4=;
        b=hljyFuJA9G/a9f00C2ZTFGhVYWSt7mksf0ZBObCfuC4Zcq0LZZaBTAredcwYXRq18p
         TEa1BGSAcISGLGBXuvW4hk5xduGJ0kcS93dn1hu4aH6j3fyZDPgHzyDAPR2LSyR/Zxno
         Hx1UB5mFFtfVHNOlRwNMFQn+699oh1C8uExdhdvOuyPbzAUEoTb35vT9a/QVq91bhVr7
         oh28As8+qKHcgmzEoP3liYRfwEfYMcr5gsBM4DbZdj4NpKojCd90UNsMJr5+TWrN5D3t
         HIVu7DUGl4Ru7Fd5Idg0N4RjI9hZgdM9k1B44+0oA5nJBRPtjASHpdXoDqEGAiTl32Uv
         htjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713758243; x=1714363043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EFW9+m2geC2plcNu4ooEHsTuQPopye1HlQhXkbIiQ4=;
        b=dlDweOdFcbF4ekvXp7oaNYTX/bsTDqP9Ln58BGP1ZQ+ZoVZXIktB4bpiYh4CK+2QaC
         WQ6PZEsT6ElQNdU5xk89lg2btg0EaiblwIj2ZuN9kyVZ0qHfirhg645mtG/xuUkSKysG
         INWphdGCj3wN2RYwFUBukygcGkR3Bq+mHDqcqSFaMROtRdmRDZTvNLWdhAKhTf8m9qM0
         VGFSVRKHxP6WNqkuS72MMWDdG0mRup5QQVtiatA0zIOBKFVktSUF7oV/shi1D9/Vyjgp
         U933Dcf+na5jzrQarC3pd43FcNKlJ9BLrKTDhuCygzB4+oQzHWHs4i9p5ou5sT7OmfTI
         j92Q==
X-Gm-Message-State: AOJu0YzCEiXfa2GmVYxSeLf1i+fRN1c9ygygINRH0w8GzYIU5zyBsIo3
	bGXd6Cl6wgYb3h1Cm6CkfiaIba0BzzXGA4wMzGINkrkjxE44xUV5LO7PHzyCZkf0xYGkUHsftD9
	ikupY+F0MtJkZeNGYYSQIDfEqhiokuXGncxEn9A==
X-Google-Smtp-Source: AGHT+IGZzRb71Y0EGdw0Xd6AXtKJ8jm8+FBKvsdhUIBFBj/iamSZ6HZ9Y892uZ7oJdYMgnoSnZprLgbiXRIFLsXAgYE=
X-Received: by 2002:a05:6e02:1d0a:b0:36a:3c07:9cdc with SMTP id
 i10-20020a056e021d0a00b0036a3c079cdcmr11903727ila.31.1713758243560; Sun, 21
 Apr 2024 20:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240417074528.16506-1-yongxuan.wang@sifive.com> <20240417074528.16506-3-yongxuan.wang@sifive.com>
In-Reply-To: <20240417074528.16506-3-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 09:27:12 +0530
Message-ID: <CAAhSdy2na-+4DrZm7W8ZD2zGMF7J3VVL235Wx2_QVPr1AfuFVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISCV: KVM: Introduce vcpu->reset_cntx_lock
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_205731_772358_9F4BF08C 
X-CRM114-Status: GOOD (  19.28  )
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

T24gV2VkLCBBcHIgMTcsIDIwMjQgYXQgMToxNeKAr1BNIFlvbmctWHVhbiBXYW5nIDx5b25neHVh
bi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gT3JpZ2luYWxseSwgdGhlIHVzZSBvZiBrdm0t
PmxvY2sgaW4gU0JJX0VYVF9IU01fSEFSVF9TVEFSVCBhbHNvIGF2b2lkcwo+IHRoZSBzaW11bHRh
bmVvdXMgdXBkYXRlcyB0byB0aGUgcmVzZXQgY29udGV4dCBvZiB0YXJnZXQgVkNQVS4gU2luY2Ug
dGhpcwo+IGxvY2sgaGFzIGJlZW4gcmVwbGFjZSB3aXRoIHZjcHUtPm1wX3N0YXRlX2xvY2ssIGFu
ZCB0aGlzIG5ldyBsb2NrIGFsc28KPiBwcm90ZWN0cyB0aGUgdmNwdS0+bXBfc3RhdGUuIFdlIGhh
dmUgdG8gYWRkIGEgc2VwYXJhdGUgbG9jayBmb3IKPiB2Y3B1LT5yZXNldF9jbnR4Lgo+Cj4gU2ln
bmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KCkxH
VE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2Fy
ZHMsCkFudXAKCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAx
ICsKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAgICAgICAgIHwgNiArKysrKysKPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfaHNtLmMgICAgIHwgMyArKysKPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4gaW5kZXgg
NjRkMzVhOGM5MDhjLi42NjRkMWJiMDAzNjggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oCj4gQEAgLTIxMSw2ICsyMTEsNyBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfYXJjaCB7Cj4KPiAgICAg
ICAgIC8qIENQVSBjb250ZXh0IHVwb24gR3Vlc3QgVkNQVSByZXNldCAqLwo+ICAgICAgICAgc3Ry
dWN0IGt2bV9jcHVfY29udGV4dCBndWVzdF9yZXNldF9jb250ZXh0Owo+ICsgICAgICAgc3Bpbmxv
Y2tfdCByZXNldF9jbnR4X2xvY2s7Cj4KPiAgICAgICAgIC8qIENQVSBDU1IgY29udGV4dCB1cG9u
IEd1ZXN0IFZDUFUgcmVzZXQgKi8KPiAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9jc3IgZ3Vlc3Rf
cmVzZXRfY3NyOwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jp
c2N2L2t2bS92Y3B1LmMKPiBpbmRleCA3MDkzN2Y3MWMzYzQuLjFhMjIzNmU0YzdmMyAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1
LmMKPiBAQCAtNjQsNyArNjQsOSBAQCBzdGF0aWMgdm9pZCBrdm1fcmlzY3ZfcmVzZXRfdmNwdShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4KPiAgICAgICAgIG1lbWNweShjc3IsIHJlc2V0X2Nzciwg
c2l6ZW9mKCpjc3IpKTsKPgo+ICsgICAgICAgc3Bpbl9sb2NrKCZ2Y3B1LT5hcmNoLnJlc2V0X2Nu
dHhfbG9jayk7Cj4gICAgICAgICBtZW1jcHkoY250eCwgcmVzZXRfY250eCwgc2l6ZW9mKCpjbnR4
KSk7Cj4gKyAgICAgICBzcGluX3VubG9jaygmdmNwdS0+YXJjaC5yZXNldF9jbnR4X2xvY2spOwo+
Cj4gICAgICAgICBrdm1fcmlzY3ZfdmNwdV9mcF9yZXNldCh2Y3B1KTsKPgo+IEBAIC0xMjEsMTIg
KzEyMywxNiBAQCBpbnQga3ZtX2FyY2hfdmNwdV9jcmVhdGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+ICAgICAgICAgc3Bpbl9sb2NrX2luaXQoJnZjcHUtPmFyY2guaGZlbmNlX2xvY2spOwo+Cj4g
ICAgICAgICAvKiBTZXR1cCByZXNldCBzdGF0ZSBvZiBzaGFkb3cgU1NUQVRVUyBhbmQgSFNUQVRV
UyBDU1JzICovCj4gKyAgICAgICBzcGluX2xvY2tfaW5pdCgmdmNwdS0+YXJjaC5yZXNldF9jbnR4
X2xvY2spOwo+ICsKPiArICAgICAgIHNwaW5fbG9jaygmdmNwdS0+YXJjaC5yZXNldF9jbnR4X2xv
Y2spOwo+ICAgICAgICAgY250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X3Jlc2V0X2NvbnRleHQ7Cj4g
ICAgICAgICBjbnR4LT5zc3RhdHVzID0gU1JfU1BQIHwgU1JfU1BJRTsKPiAgICAgICAgIGNudHgt
PmhzdGF0dXMgPSAwOwo+ICAgICAgICAgY250eC0+aHN0YXR1cyB8PSBIU1RBVFVTX1ZUVzsKPiAg
ICAgICAgIGNudHgtPmhzdGF0dXMgfD0gSFNUQVRVU19TUFZQOwo+ICAgICAgICAgY250eC0+aHN0
YXR1cyB8PSBIU1RBVFVTX1NQVjsKPiArICAgICAgIHNwaW5fdW5sb2NrKCZ2Y3B1LT5hcmNoLnJl
c2V0X2NudHhfbG9jayk7Cj4KPiAgICAgICAgIGlmIChrdm1fcmlzY3ZfdmNwdV9hbGxvY192ZWN0
b3JfY29udGV4dCh2Y3B1LCBjbnR4KSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfaHNtLmMKPiBpbmRleCAxMTVhNmM2NTI1ZmQuLmNjNTAzOGI5MGUwMiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20uYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX2hzbS5jCj4gQEAgLTMxLDYgKzMxLDcgQEAgc3RhdGljIGludCBr
dm1fc2JpX2hzbV92Y3B1X3N0YXJ0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgICAg
ICAgICAgZ290byBvdXQ7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIHNwaW5fbG9jaygmdGFyZ2V0
X3ZjcHUtPmFyY2gucmVzZXRfY250eF9sb2NrKTsKPiAgICAgICAgIHJlc2V0X2NudHggPSAmdGFy
Z2V0X3ZjcHUtPmFyY2guZ3Vlc3RfcmVzZXRfY29udGV4dDsKPiAgICAgICAgIC8qIHN0YXJ0IGFk
ZHJlc3MgKi8KPiAgICAgICAgIHJlc2V0X2NudHgtPnNlcGMgPSBjcC0+YTE7Cj4gQEAgLTM4LDYg
KzM5LDggQEAgc3RhdGljIGludCBrdm1fc2JpX2hzbV92Y3B1X3N0YXJ0KHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKPiAgICAgICAgIHJlc2V0X2NudHgtPmEwID0gdGFyZ2V0X3ZjcHVpZDsKPiAgICAg
ICAgIC8qIHByaXZhdGUgZGF0YSBwYXNzZWQgZnJvbSBrZXJuZWwgKi8KPiAgICAgICAgIHJlc2V0
X2NudHgtPmExID0gY3AtPmEyOwo+ICsgICAgICAgc3Bpbl91bmxvY2soJnRhcmdldF92Y3B1LT5h
cmNoLnJlc2V0X2NudHhfbG9jayk7Cj4gKwo+ICAgICAgICAga3ZtX21ha2VfcmVxdWVzdChLVk1f
UkVRX1ZDUFVfUkVTRVQsIHRhcmdldF92Y3B1KTsKPgo+ICAgICAgICAgX19rdm1fcmlzY3ZfdmNw
dV9wb3dlcl9vbih0YXJnZXRfdmNwdSk7Cj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
