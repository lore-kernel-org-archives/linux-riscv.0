Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D99C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 04:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4f/DpvIO9qBlzgWEXacnNLEUKIKoHevOuJ2BdBKu2s=; b=EF+UIH2qieo7Uy
	ADhOyHDYWxI+f3FjWzcg0UfbmTuezm1WdzgKdcP43v0mZiu2CRGLX6UIuv/OPrjgVR0qw38uG88dU
	L2x96otuSSxn354yGKK3fRrdFHs7fucArL+WLV1e/GX15aA0mowk+uWQI088pFdqTi8xR9qNLsTtL
	bh909MHHrraauGj5VowJcszehZ0oee1s9QD/KRFPSc4k6qFpnBAN6Q+6Bnf1h9fGxpx2PDfkUEbVH
	oC38oRG53l2Gd3hFTvzglX/ui0ROg8+E6qhyXKbgv31cviJB+gxq3rgTxg+lp6xqA65oy4OXi2FJG
	mMeMpaRnhObAdxVR2ZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIJt-00CE83-15;
	Wed, 15 Mar 2023 04:00:57 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIJq-00CE6W-0l
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 04:00:55 +0000
Received: by mail-yb1-xb33.google.com with SMTP id v196so10512069ybe.9
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 21:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1678852847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WrhLd5JpQXyC1TC5SJTwH36/6Kisk6CvI+ttYQeoGw=;
        b=aNJEfZ9wDlkkKLtCBaMQVsBAtRZxjQ6xiRPe7YfCYJFAY9BMHJtSDFcx0Wl5mt+thO
         Mna9rA+BruhqE4HZdv/PxiS0AepZkEkzcSaAoOSaOxGYBExMnNg8cC08VzrMnvn7mCa5
         HJO/7FiE+7t57r/EoEgY57ahklGk61AWCYcAOG/pnHxUlwTsoAZHiiIIFwRt6A33IVIc
         wCFcEIjTjpx32xfKk4fXxr2Z5HwR2/Cu3ExURQtHGWEIFka4qELu1yGOSHxgrlmaCjm5
         XmTrWdQb/BtX+P8flotDE1Wn2vpMzDQTcqR4Fbl/WRzC+m5MnMR5fgifAdUwdJJZbToJ
         E44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678852847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WrhLd5JpQXyC1TC5SJTwH36/6Kisk6CvI+ttYQeoGw=;
        b=0O18fMtWsKl9LPW1tI6xt/Aj2GCc/NKYW+7sMoXlpYEZqsVr/br58pUdumOsgQ0vbi
         pOZN5qlW+L+hLrtm9wS3KPJgfyfAAmAII/SG4uw5hfD1M/lRlZt7zBBWnzTQQEl9q+qr
         AslyQb1/RLz2dUywnzddaxtxVc6y0SmIQZ+90QoQNN/irIKvCXX/7nQE4DIMmjWvtbir
         BWMgJngtAIMcBIsZruHFFY1NtNyvYF99ZThGtUrEwsvCSyFDzomhrVH/Vwt0apCJn7o4
         SaA9tAphYcUPQkYVpCEIX/AgVVfPyuvI8FGLGJJJZz232fitVL+ptnuNS0LHzAPXApwW
         bm1w==
X-Gm-Message-State: AO0yUKUFbDLPm4lb7E2ZpTxGB4Nwy52wGYot/XrnfatZqVFaVwpR8dw0
	7vnRXYfBTSVSSaVyeOnnPpYU77Nh0o4TxPANbviX8g==
X-Google-Smtp-Source: AK7set8FN7Fl+EdfStWhaZjOKKUlUjOUuyD6IGOXuU2yOmG7x+jOvErH2Y6sTBDP51O3X1FdharwIQFn38dF6rP1Pw4=
X-Received: by 2002:a5b:2cc:0:b0:a02:a3a6:78fa with SMTP id
 h12-20020a5b02cc000000b00a02a3a678famr19780355ybp.12.1678852847167; Tue, 14
 Mar 2023 21:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230224170118.16766-1-andy.chiu@sifive.com> <20230224170118.16766-9-andy.chiu@sifive.com>
 <Y/6HmORLbsFWsEbu@spud>
In-Reply-To: <Y/6HmORLbsFWsEbu@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 15 Mar 2023 12:00:00 +0800
Message-ID: <CABgGipWBGgs-enRr=_HToW4wxTVGeUnJ4imLagdwThFiQ4xG2w@mail.gmail.com>
Subject: Re: [PATCH -next v14 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_210054_316850_EEF3BB8B 
X-CRM114-Status: GOOD (  24.86  )
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

T24gV2VkLCBNYXIgMSwgMjAyMyBhdCA3OjAw4oCvQU0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgRmViIDI0LCAyMDIzIGF0IDA1OjAxOjA3UE0gKzAw
MDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+IEZyb206IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1
QHNpZml2ZS5jb20+Cj4gPgo+ID4gQWRkIHZlY3RvciBzdGF0ZSBjb250ZXh0IHN0cnVjdCB0byBi
ZSBhZGRlZCBsYXRlciBpbiB0aHJlYWRfc3RydWN0LiBBbmQKPiA+IHByZXBhcmUgbG93LWxldmVs
IGhlbHBlciBmdW5jdGlvbnMgdG8gc2F2ZS9yZXN0b3JlIHZlY3RvciBjb250ZXh0cy4KPiA+Cj4g
PiBUaGlzIGluY2x1ZGUgVmVjdG9yIFJlZ2ZpbGUgYW5kIENTUnMgaG9sZGluZyBkeW5hbWljIGNv
bmZpZ3VyYXRpb24gc3RhdGUKPiA+ICh2c3RhcnQsIHZsLCB2dHlwZSwgdmNzcikuIFRoZSBWZWMg
UmVnaXN0ZXIgd2lkdGggY291bGQgYmUgaW1wbGVtZW50YXRpb24KPiA+IGRlZmluZWQsIGJ1dCBz
YW1lIGZvciBhbGwgcHJvY2Vzc2VzLCBzbyB0aGF0IGlzIHNhdmVkIHNlcGFyYXRlbHkuCj4gPgo+
ID4gVGhpcyBpcyBub3QgeWV0IHdpcmVkIGludG8gZmluYWwgdGhyZWFkX3N0cnVjdCAtIHdpbGwg
YmUgZG9uZSB3aGVuCj4gPiBfX3N3aXRjaF90byBhY3R1YWxseSBzdGFydHMgZG9pbmcgdGhpcyBp
biBsYXRlciBwYXRjaGVzLgo+ID4KPiA+IEdpdmVuIHRoZSB2YXJpYWJsZSAoYW5kIHBvdGVudGlh
bGx5IGxhcmdlKSBzaXplIG9mIHJlZ2ZpbGUsIHRoZXkgYXJlCj4gPiBzYXZlZCBpbiBkeW5hbWlj
YWxseSBhbGxvY2F0ZWQgbWVtb3J5LCBwb2ludGVkIHRvIGJ5IGRhdGFwIHBvaW50ZXIgaW4KPiA+
IF9fcmlzY3Zfdl9leHRfc3RhdGUuCj4gPgo+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBWaW5jZW50IENo
ZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBD
aGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEdyZWVudGlt
ZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5lZXQg
R3VwdGEgPHZpbmVldGdAcml2b3NpbmMuY29tPgo+ID4gW3ZpbmVldGc6IG1lcmdlZCBiaXRzIGZy
b20gMiBkaWZmZXJlbnQgcGF0Y2hlc10KPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5k
eS5jaGl1QHNpZml2ZS5jb20+Cj4gPiBbYW5keS5jaGl1OiB1c2UgaW5saW5lIGFzbSB0byBzYXZl
L3Jlc3RvcmUgY29udGV4dCwgcmVtb3ZlIGFzbSB2YWlhbnRdCj4gPiAtLS0KPiA+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oICAgICAgfCA4NCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3B0cmFjZS5oIHwgMTcgKysr
KysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS92ZWN0b3IuaAo+ID4gaW5kZXggNjkyZDNlZTJkMmQzLi45YzAyNWYyZWZkYzMgMTAw
NjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gPiBAQCAtMTIsNiArMTIsOSBAQAo+ID4K
PiA+ICAjaW5jbHVkZSA8YXNtL2h3Y2FwLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS9jc3IuaD4KPiA+
ICsjaW5jbHVkZSA8YXNtL2FzbS5oPgo+ID4gKwo+ID4gKyNkZWZpbmUgQ1NSX1NUUih4KSBfX0FT
TV9TVFIoeCkKPgo+IFRCSCwgSSdtIG5vdCByZWFsbHkgc3VyZSB3aGF0IHRoaXMgZGVmaW5pdGlv
biBhZGRzLgo+CgpBZ3JlZSwgSSdtIGdvaW5nIHRvIGRyb3AgdGhpcyAjZGVmaW5lIGFuZCB1c2Ug
X19BU01fU1RSIGRpcmVjdGx5LgpIb3dldmVyLCB3ZSBzaG91bGQgbm90IHJlcGxhY2UgdGhlIGlu
bGluZSBhc20gdG8gY3NyX3JlYWQgYmVjYXVzZQpjc3JfcmVhZCBjbG9iYmVycyBtZW1vcnkgYW5k
IHdlIGRvbid0LgoKPiA+ICBleHRlcm4gdW5zaWduZWQgbG9uZyByaXNjdl92X3ZzaXplOwo+ID4g
IHZvaWQgcmlzY3Zfdl9zZXR1cF92c2l6ZSh2b2lkKTsKPiA+IEBAIC0yMSw2ICsyNCwyNiBAQCBz
dGF0aWMgX19hbHdheXNfaW5saW5lIGJvb2wgaGFzX3ZlY3Rvcih2b2lkKQo+ID4gICAgICAgcmV0
dXJuIHJpc2N2X2hhc19leHRlbnNpb25fbGlrZWx5KFJJU0NWX0lTQV9FWFRfdik7Cj4gPiAgfQo+
ID4KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPiA+ICt7Cj4gPiArICAgICByZWdzLT5zdGF0dXMgPSAocmVncy0+c3Rh
dHVzICYgfihTUl9WUykpIHwgU1JfVlNfQ0xFQU47Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBp
bmxpbmUgdm9pZCByaXNjdl92X3ZzdGF0ZV9vZmYoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gPiAr
ewo+ID4gKyAgICAgcmVncy0+c3RhdHVzID0gKHJlZ3MtPnN0YXR1cyAmIH5TUl9WUykgfCBTUl9W
U19PRkY7Cj4KPiBJbmNvbnNpc3RlbnQgdXNlIG9mIGJyYWNrZXRzIGhlcmUgY29tcGFyZWQgdG8g
dGhlIG90aGVyIGl0ZW1zLgo+IFRoZXkncmUgbm90IGFjdHVhbGx5IG5lZWRlZCBhbnl3aGVyZSBo
ZXJlLCBhcmUgdGhleT8KPgoKWWVzLCB0aGVyZSBpcyBubyBuZWVkIGZvciBicmFja2V0cyBhdCBT
Ul9WUyBiZWNhdXNlIGl0IGV4cGFuZHMgdG8gb25lCmNvbnN0YW50IHZhbHVlLgoKCgoKPiA+ICt9
Cj4gPiArCj4gPiArc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX29uKHN0cnVjdCBw
dF9yZWdzICpyZWdzKQo+ID4gK3sKPiA+ICsgICAgIHJlZ3MtPnN0YXR1cyA9IChyZWdzLT5zdGF0
dXMgJiB+KFNSX1ZTKSkgfCBTUl9WU19JTklUSUFMOwo+ID4gK30KPgo+IE90aGVyIHRoYW4gdGhh
dCwgdGhpcyBzZWVtcyBmaW5lPyBJIG9ubHkgcmVhbGx5IGhhZCBhIHF1aWNrIGNoZWNrIG9mIHRo
ZQo+IGFzbSB0aG91Z2gsIHNvIHdpdGggdGhlIGJyYWNrZXRzIHRoaW5nIGZpeGVkIHVwOgo+IEFj
a2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
