Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A35D2F7C5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4V6Biq+tV8XdkzX05J8m3tZcDOqETdmXl+QXEh4OQg=; b=MlkNKHY/6ZvNed
	9rXry/TWsOJZ5tsLzhNN6cbW8gybbz3xHzEaOz8nHHLIdCvnE1p+H9N3/upRq4AslEWmimZc3+cjA
	x9Gt5kaumiTpWSqFv4QBBnf7+P7IWlHa0DGG9qmEazfWM88WaUSX4zO6ljP63fJjydrBQmTzSsgYI
	suNv3xaBF3FCroFij96HmoKYwHynPtmLkAN5cdHcyqcEPVAJtTyhwGxgH2D+2qZ93s5hNXCl08Yrs
	p/QomOwk8ejFfSXMYINs1OO3YLa4wx4b2gCSa0X+d+roLF2m6oFTAdL82TIss4I9OkSlLXufhTcn0
	udVygU5EJkJMPEsAEOdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1BhX-0000000D3zR-1Q1H;
	Wed, 16 Oct 2024 21:37:03 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1BhU-0000000D3ya-2G9R
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 21:37:02 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539e13375d3so315113e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 14:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1729114618; x=1729719418; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzevpsck3dJoJhpaLAHlTvmXlx+875anP82T3kvIZwQ=;
        b=Iu8d5ffGPt0glkh3Ax57zDcgZFMVKOtOTV2NaVebAArW6Pe2+VUFLQlnQnKVBTyG8s
         /wVuRZa66NVZZED/9qqkGlvFkto4Fif5QqcyEcm7eg1rBEewHqPxFfRG8Cmjj/tSHG58
         LLhLFppftG2GGs5uryHJbqtMDBf4GXHP12uQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729114618; x=1729719418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzevpsck3dJoJhpaLAHlTvmXlx+875anP82T3kvIZwQ=;
        b=iZ18kwBRnwajHbniy56xy+CZCChs7u3WryI95DaeCJrQl1brFulMnPv5bxhmWvl+fx
         SG1DjQtQXvEtUxU9icSKziFEcGNrCwXBR+FvvjgIhazKWTQipXjaM06rpGIXsO8oicnc
         6mn9PeRfeFl+NefpBJW9tvkSajb5EOLC5oeyyYqupFjaborsdf5VMZiXgKTA0OKH81OW
         7SVEggEoC/E+SrL+wAUxJowlZm1T3ZRzpPF0OwKBejN4VT7sdtqNuFSFjPZq3AQngyNQ
         MY8AlNtswkcXN/4LCLtV+untqMXuTzMEl0yjj2+9+6HhVprEs/uEoWizv6ZD5Dn7sfF+
         2QCg==
X-Forwarded-Encrypted: i=1; AJvYcCXHk9DGwHv7tFQUqvtWMFZXCiOm5mYW+cvbvwIMZLozs5G8t4iR5jjKUp004uBcekKvExdp59r0snaCHA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9DArwyexP1ahqqxkxOMt6lVFhUv6daYKsfmPFMrRM/qyh4s5Q
	qspDUVVNNiVD4nggEFIpX2PER9pvGES9OdZ2Io2X4AbD4PREFyFa622i4KmeM2dUzeBlxugOngu
	hVuj+loIzwwRP4nxR2sshJ2lIikNK1awshrOz
X-Google-Smtp-Source: AGHT+IE1H4Vh/DlQoBbaP9HRN6riUp4Ff1MfsEWkMbRb+vmeg9cRWkPijr7gnhfFeB7b6BVoGnjUIALJ+uIMkqdeJoY=
X-Received: by 2002:a05:6512:1044:b0:530:ae4a:58d0 with SMTP id
 2adb3069b0e04-539da3c1d9bmr9797869e87.8.1729114617980; Wed, 16 Oct 2024
 14:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240719160913.342027-1-apatel@ventanamicro.com> <20240719160913.342027-4-apatel@ventanamicro.com>
In-Reply-To: <20240719160913.342027-4-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 16 Oct 2024 14:36:46 -0700
Message-ID: <CAOnJCUKMf4a0KQaiK5g8nAngqCKFtbnc38kQVu_nMb9ujwif1g@mail.gmail.com>
Subject: Re: [PATCH 03/13] RISC-V: KVM: Save/restore SCOUNTEREN in C source
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_143700_711024_A0A93EF7 
X-CRM114-Status: GOOD (  14.30  )
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

T24gRnJpLCBKdWwgMTksIDIwMjQgYXQgOTowOeKAr0FNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFRoZSBTQ09VTlRFUkVOIENTUiBuZWVkIG5vdCBiZSBz
YXZlZC9yZXN0b3JlZCBpbiB0aGUgbG93LWxldmVsCj4gX19rdm1fcmlzY3Zfc3dpdGNoX3RvKCkg
ZnVuY3Rpb24gaGVuY2UgbW92ZSB0aGUgU0NPVU5URVJFTiBDU1IKPiBzYXZlL3Jlc3RvcmUgdG8g
dGhlIGt2bV9yaXNjdl92Y3B1X3N3YXBfaW5fZ3Vlc3Rfc3RhdGUoKSBhbmQKPiBrdm1fcmlzY3Zf
dmNwdV9zd2FwX2luX2hvc3Rfc3RhdGUoKSBmdW5jdGlvbnMgaW4gQyBzb3VyY2VzLgo+Cj4gQWxz
bywgcmUtYXJyYW5nZSB0aGUgQ1NSIHNhdmUvcmVzdG9yZSBhbmQgcmVsYXRlZCBHUFIgdXNhZ2Ug
aW4KPiB0aGUgbG93LWxldmVsIF9fa3ZtX3Jpc2N2X3N3aXRjaF90bygpIGxvdy1sZXZlbCBmdW5j
dGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8u
Y29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgIHwgIDIgKysKPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUyB8IDUyICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDMxIGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYwo+IGluZGV4IDkzYjFjZTA0MzQ4Mi4uOTU3ZTFhNWUwODFiIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUu
Ywo+IEBAIC02OTEsNiArNjkxLDcgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSB2b2lkIGt2bV9y
aXNjdl92Y3B1X3N3YXBfaW5fZ3Vlc3Rfc3RhdGUoc3RydWN0IGt2bV92Y3B1ICoKPiAgICAgICAg
IHN0cnVjdCBrdm1fdmNwdV9jc3IgKmNzciA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NzcjsKPiAgICAg
ICAgIHN0cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2Y3B1LT5hcmNoLmNmZzsKPgo+ICsg
ICAgICAgdmNwdS0+YXJjaC5ob3N0X3Njb3VudGVyZW4gPSBjc3Jfc3dhcChDU1JfU0NPVU5URVJF
TiwgY3NyLT5zY291bnRlcmVuKTsKPiAgICAgICAgIHZjcHUtPmFyY2guaG9zdF9zZW52Y2ZnID0g
Y3NyX3N3YXAoQ1NSX1NFTlZDRkcsIGNzci0+c2VudmNmZyk7Cj4gICAgICAgICBpZiAocmlzY3Zf
aGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NNU1RBVEVFTikgJiYKPiAgICAg
ICAgICAgICAoY2ZnLT5oc3RhdGVlbjAgJiBTTVNUQVRFRU4wX1NTVEFURUVOMCkpCj4gQEAgLTcw
NCw2ICs3MDUsNyBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQga3ZtX3Jpc2N2X3ZjcHVf
c3dhcF9pbl9ob3N0X3N0YXRlKHN0cnVjdCBrdm1fdmNwdSAqdgo+ICAgICAgICAgc3RydWN0IGt2
bV92Y3B1X2NzciAqY3NyID0gJnZjcHUtPmFyY2guZ3Vlc3RfY3NyOwo+ICAgICAgICAgc3RydWN0
IGt2bV92Y3B1X2NvbmZpZyAqY2ZnID0gJnZjcHUtPmFyY2guY2ZnOwo+Cj4gKyAgICAgICBjc3It
PnNjb3VudGVyZW4gPSBjc3Jfc3dhcChDU1JfU0NPVU5URVJFTiwgdmNwdS0+YXJjaC5ob3N0X3Nj
b3VudGVyZW4pOwo+ICAgICAgICAgY3NyLT5zZW52Y2ZnID0gY3NyX3N3YXAoQ1NSX1NFTlZDRkcs
IHZjcHUtPmFyY2guaG9zdF9zZW52Y2ZnKTsKPiAgICAgICAgIGlmIChyaXNjdl9oYXNfZXh0ZW5z
aW9uX3VubGlrZWx5KFJJU0NWX0lTQV9FWFRfU01TVEFURUVOKSAmJgo+ICAgICAgICAgICAgIChj
ZmctPmhzdGF0ZWVuMCAmIFNNU1RBVEVFTjBfU1NUQVRFRU4wKSkKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc3dpdGNoLlMK
PiBpbmRleCBmODM2NDNjNGZkYjkuLjNmOGNiYzIxYTY0NCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3N3aXRjaC5TCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2gu
Uwo+IEBAIC00MywzMCArNDMsMjUgQEAgU1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3Zfc3dpdGNo
X3RvKQo+Cj4gICAgICAgICAvKiBMb2FkIEd1ZXN0IENTUiB2YWx1ZXMgKi8KPiAgICAgICAgIFJF
R19MICAgdDAsIChLVk1fQVJDSF9HVUVTVF9TU1RBVFVTKShhMCkKPiAtICAgICAgIFJFR19MICAg
dDEsIChLVk1fQVJDSF9HVUVTVF9TQ09VTlRFUkVOKShhMCkKPiAtICAgICAgIGxhICAgICAgdDMs
IC5Ma3ZtX3N3aXRjaF9yZXR1cm4KPiAtICAgICAgIFJFR19MICAgdDQsIChLVk1fQVJDSF9HVUVT
VF9TRVBDKShhMCkKPiArICAgICAgIGxhICAgICAgdDEsIC5Ma3ZtX3N3aXRjaF9yZXR1cm4KPiAr
ICAgICAgIFJFR19MICAgdDIsIChLVk1fQVJDSF9HVUVTVF9TRVBDKShhMCkKPgo+ICAgICAgICAg
LyogU2F2ZSBIb3N0IGFuZCBSZXN0b3JlIEd1ZXN0IFNTVEFUVVMgKi8KPiAgICAgICAgIGNzcnJ3
ICAgdDAsIENTUl9TU1RBVFVTLCB0MAo+Cj4gLSAgICAgICAvKiBTYXZlIEhvc3QgYW5kIFJlc3Rv
cmUgR3Vlc3QgU0NPVU5URVJFTiAqLwo+IC0gICAgICAgY3NycncgICB0MSwgQ1NSX1NDT1VOVEVS
RU4sIHQxCj4gLQo+ICAgICAgICAgLyogU2F2ZSBIb3N0IFNUVkVDIGFuZCBjaGFuZ2UgaXQgdG8g
cmV0dXJuIHBhdGggKi8KPiAtICAgICAgIGNzcnJ3ICAgdDMsIENTUl9TVFZFQywgdDMKPiAtCj4g
LSAgICAgICAvKiBTYXZlIEhvc3QgU1NDUkFUQ0ggYW5kIGNoYW5nZSBpdCB0byBzdHJ1Y3Qga3Zt
X3ZjcHVfYXJjaCBwb2ludGVyICovCj4gLSAgICAgICBjc3JydyAgIHQyLCBDU1JfU1NDUkFUQ0gs
IGEwCj4gKyAgICAgICBjc3JydyAgIHQxLCBDU1JfU1RWRUMsIHQxCj4KPiAgICAgICAgIC8qIFJl
c3RvcmUgR3Vlc3QgU0VQQyAqLwo+IC0gICAgICAgY3NydyAgICBDU1JfU0VQQywgdDQKPiArICAg
ICAgIGNzcncgICAgQ1NSX1NFUEMsIHQyCj4gKwo+ICsgICAgICAgLyogU2F2ZSBIb3N0IFNTQ1JB
VENIIGFuZCBjaGFuZ2UgaXQgdG8gc3RydWN0IGt2bV92Y3B1X2FyY2ggcG9pbnRlciAqLwo+ICsg
ICAgICAgY3NycncgICB0MywgQ1NSX1NTQ1JBVENILCBhMAo+Cj4gICAgICAgICAvKiBTdG9yZSBI
b3N0IENTUiB2YWx1ZXMgKi8KPiAgICAgICAgIFJFR19TICAgdDAsIChLVk1fQVJDSF9IT1NUX1NT
VEFUVVMpKGEwKQo+IC0gICAgICAgUkVHX1MgICB0MSwgKEtWTV9BUkNIX0hPU1RfU0NPVU5URVJF
TikoYTApCj4gLSAgICAgICBSRUdfUyAgIHQyLCAoS1ZNX0FSQ0hfSE9TVF9TU0NSQVRDSCkoYTAp
Cj4gLSAgICAgICBSRUdfUyAgIHQzLCAoS1ZNX0FSQ0hfSE9TVF9TVFZFQykoYTApCj4gKyAgICAg
ICBSRUdfUyAgIHQxLCAoS1ZNX0FSQ0hfSE9TVF9TVFZFQykoYTApCj4gKyAgICAgICBSRUdfUyAg
IHQzLCAoS1ZNX0FSQ0hfSE9TVF9TU0NSQVRDSCkoYTApCj4KPiAgICAgICAgIC8qIFJlc3RvcmUg
R3Vlc3QgR1BScyAoZXhjZXB0IEEwKSAqLwo+ICAgICAgICAgUkVHX0wgICByYSwgKEtWTV9BUkNI
X0dVRVNUX1JBKShhMCkKPiBAQCAtMTQ1LDMxICsxNDAsMjYgQEAgU1lNX0ZVTkNfU1RBUlQoX19r
dm1fcmlzY3Zfc3dpdGNoX3RvKQo+ICAgICAgICAgUkVHX1MgICB0NiwgKEtWTV9BUkNIX0dVRVNU
X1Q2KShhMCkKPgo+ICAgICAgICAgLyogTG9hZCBIb3N0IENTUiB2YWx1ZXMgKi8KPiAtICAgICAg
IFJFR19MICAgdDEsIChLVk1fQVJDSF9IT1NUX1NUVkVDKShhMCkKPiAtICAgICAgIFJFR19MICAg
dDIsIChLVk1fQVJDSF9IT1NUX1NTQ1JBVENIKShhMCkKPiAtICAgICAgIFJFR19MICAgdDMsIChL
Vk1fQVJDSF9IT1NUX1NDT1VOVEVSRU4pKGEwKQo+IC0gICAgICAgUkVHX0wgICB0NCwgKEtWTV9B
UkNIX0hPU1RfU1NUQVRVUykoYTApCj4gLQo+IC0gICAgICAgLyogU2F2ZSBHdWVzdCBTRVBDICov
Cj4gLSAgICAgICBjc3JyICAgIHQwLCBDU1JfU0VQQwo+ICsgICAgICAgUkVHX0wgICB0MCwgKEtW
TV9BUkNIX0hPU1RfU1RWRUMpKGEwKQo+ICsgICAgICAgUkVHX0wgICB0MSwgKEtWTV9BUkNIX0hP
U1RfU1NDUkFUQ0gpKGEwKQo+ICsgICAgICAgUkVHX0wgICB0MiwgKEtWTV9BUkNIX0hPU1RfU1NU
QVRVUykoYTApCj4KPiAgICAgICAgIC8qIFNhdmUgR3Vlc3QgQTAgYW5kIFJlc3RvcmUgSG9zdCBT
U0NSQVRDSCAqLwo+IC0gICAgICAgY3NycncgICB0MiwgQ1NSX1NTQ1JBVENILCB0Mgo+ICsgICAg
ICAgY3NycncgICB0MSwgQ1NSX1NTQ1JBVENILCB0MQo+Cj4gLSAgICAgICAvKiBSZXN0b3JlIEhv
c3QgU1RWRUMgKi8KPiAtICAgICAgIGNzcncgICAgQ1NSX1NUVkVDLCB0MQo+ICsgICAgICAgLyog
U2F2ZSBHdWVzdCBTRVBDICovCj4gKyAgICAgICBjc3JyICAgIHQzLCBDU1JfU0VQQwo+Cj4gLSAg
ICAgICAvKiBTYXZlIEd1ZXN0IGFuZCBSZXN0b3JlIEhvc3QgU0NPVU5URVJFTiAqLwo+IC0gICAg
ICAgY3NycncgICB0MywgQ1NSX1NDT1VOVEVSRU4sIHQzCj4gKyAgICAgICAvKiBSZXN0b3JlIEhv
c3QgU1RWRUMgKi8KPiArICAgICAgIGNzcncgICAgQ1NSX1NUVkVDLCB0MAo+Cj4gICAgICAgICAv
KiBTYXZlIEd1ZXN0IGFuZCBSZXN0b3JlIEhvc3QgU1NUQVRVUyAqLwo+IC0gICAgICAgY3Nycncg
ICB0NCwgQ1NSX1NTVEFUVVMsIHQ0Cj4gKyAgICAgICBjc3JydyAgIHQyLCBDU1JfU1NUQVRVUywg
dDIKPgo+ICAgICAgICAgLyogU3RvcmUgR3Vlc3QgQ1NSIHZhbHVlcyAqLwo+IC0gICAgICAgUkVH
X1MgICB0MCwgKEtWTV9BUkNIX0dVRVNUX1NFUEMpKGEwKQo+IC0gICAgICAgUkVHX1MgICB0Miwg
KEtWTV9BUkNIX0dVRVNUX0EwKShhMCkKPiAtICAgICAgIFJFR19TICAgdDMsIChLVk1fQVJDSF9H
VUVTVF9TQ09VTlRFUkVOKShhMCkKPiAtICAgICAgIFJFR19TICAgdDQsIChLVk1fQVJDSF9HVUVT
VF9TU1RBVFVTKShhMCkKPiArICAgICAgIFJFR19TICAgdDEsIChLVk1fQVJDSF9HVUVTVF9BMCko
YTApCj4gKyAgICAgICBSRUdfUyAgIHQyLCAoS1ZNX0FSQ0hfR1VFU1RfU1NUQVRVUykoYTApCj4g
KyAgICAgICBSRUdfUyAgIHQzLCAoS1ZNX0FSQ0hfR1VFU1RfU0VQQykoYTApCj4KPiAgICAgICAg
IC8qIFJlc3RvcmUgSG9zdCBHUFJzIChleGNlcHQgQTAgYW5kIFQwLVQ2KSAqLwo+ICAgICAgICAg
UkVHX0wgICByYSwgKEtWTV9BUkNIX0hPU1RfUkEpKGEwKQo+IC0tCj4gMi4zNC4xCj4KClJldmll
d2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCi0tIApSZWdhcmRzLApB
dGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
