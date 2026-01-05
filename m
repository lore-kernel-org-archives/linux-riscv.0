Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAC8C2A079
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6ipw5gaXKdLDZ/m1w3nuB2Efc7zDc5KjCTNH0KOD54=; b=WaDqhY/RbdeR6l
	uhcMkbMdFFzG++pUhz73pCb631ZHSAGPtasGQp9Z3K1IArqXmRWq0RnL33Gon2FZZN9rbronsR0rH
	BY3ym8mpWIkxqtOL1HbCLm5aPb0A/gF+X4ElYkcGt2xcag2F9g9EIfF/NCSoqPxKqEWhrawU5Lisk
	0SceXEkUnhBVi2SOLezB6yZGYh+XD9NeqppHI1Wo++WJHle4okSoQtcDI637NfcpNO3a76GzyQy4f
	vW8cEedletuDgwozJvliX9otWSpt0vfhjCX0/cuKrImVcul7lQ9CpRHmtvKgR3Tkb1ZqD/SdkE69W
	s1IKH3feZXuAzkUgKI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgXi-0000000B2bI-0yAQ;
	Mon, 05 Jan 2026 09:06:26 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgXf-0000000B2Zi-1uFi
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 09:06:24 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-657044fea68so853500eaf.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 01:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767603982; x=1768208782; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx0r6U43GKweZQq7AZ8Mrd0bllWyzHYWweaavwJCSZc=;
        b=tlnnQTAKZwWBtmoOs8q9hKg+Irms8K0bnbVX5kFc10orkNrS/1PtT/kQTiWrr4guuT
         ynuc1qf+7dMRbjYrbiPrBxG11Klsa3E90aXngYFhMcF7+ZQ2eFAg7hoPnmZ6obR/mldm
         VuiYnkf2WEejEn8ugGJtuG9BV7g/InV4CxFBgxf6TlbYNyoQhOtfcD6WKkWRjl5H89nf
         I7xsDIlT1ZaAbUuWUFkDyeWn1UJL9XjLGuVVZXQZkKe54ty+l5vgVN25LTRBAXKS1F2y
         yxjov6EQHVZthajQgF+JBftQsQzpeKvMaQnRMVGWuPsC28MNPHXbCj05BbMC3n+pIzSv
         fMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603982; x=1768208782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rx0r6U43GKweZQq7AZ8Mrd0bllWyzHYWweaavwJCSZc=;
        b=khlhc677uFdA/W4pgdS+3koA6Q8UUAyXmEhvWpIGdgH9BO+GnWhXmdTqeYOgblqZGd
         LbpupjVYDGbSdr9BKA/e5YZXe/CeOZQC75vByOe9U2Hf71QREc76Ty/jXYGqKweCPND5
         zcz2ZhyJSjnDm+dB4nDTNLbnR+kWR+AU/Cw8iYyoFzDS+XDKa1OQM/lIwfRW1YvRMMnV
         6dp0bGaJVmqlmYrgFBrn4+mmiI8tXVMj6aC1aoftmUbT9GzvRwGv+0Zpbsx5rQPwUa0M
         O6YzZS2x0odfzw6XoAQrwWntNvfDh5DrF1E55RZT2KMI6ZaI4oAL+NURaNjJzSxbV05y
         hiKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjE9zrsJz5g+BKEe7hYff4+8yn6WpmkwcrM45e2BgnlY4f0VQr7UHGeOl+z2UUoiQC7Vm0uNMXu7VRrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxNRBKFuOtTK3bv/uQUXfkYF/8X9W32BVVZtfoRSH2ZnBsciw9
	ArDxotK4E9JkHqjOq3uxkfJeN1hggToZpJIYy6rdbSEgNjw9od/0A0bJsvLKY3uxwKTqGU0K4nw
	Mq9dVyCKiypwwhQTgil7vVDKr+4UyqQ2na+KQ1oVu1A==
X-Gm-Gg: AY/fxX6ILm1UCCB46SWxaSfN+fXsTm5LyPn3ovJ3AvPPH56F0t+P+cY3XE93rb8uIok
	12lWoQvOUNNHSrKlRAXXJxS5olBPZWFbE/eDkig+g+Ua7fzg3pIrKidVqMfTSXh5pKI2RwAvfPp
	Oe3deZWCPlx0eoKpBhCLotDoGoBnewCPSLByXeqOpOtWWxu6T1ah8AKPppQLrI9gAsoRW2P4Yw2
	Usxs8euXs7jto6zKOaVCLT/5Sf49aX34y2iC3brO4QJWbHVjSwz+TnOJUcOR8efOeu48eB8t1qw
	uVEo/w4R87MbqRReUnxnYDtyjqBe9uIY68wrPTVdhc9KitJfQsuNcCyWpA==
X-Google-Smtp-Source: AGHT+IEmhIQ5RKOo2b6b7OL5O1/QlwNjLPOmq/Ngn48EMDTkEYgit3hHMFtHAFIg6wOswhZTAnGu6/YK4U65b6YmqR4=
X-Received: by 2002:a05:6820:a245:b0:65b:295f:ee08 with SMTP id
 006d021491bc7-65f2684a98emr2359335eaf.10.1767603982348; Mon, 05 Jan 2026
 01:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn> <20250826162939.1494021-6-pincheng.plct@isrc.iscas.ac.cn>
In-Reply-To: <20250826162939.1494021-6-pincheng.plct@isrc.iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Jan 2026 14:36:11 +0530
X-Gm-Features: AQt7F2o7aUCslFOKh9Z8QzWPpfr1ehdXhDGDtgLd_0uBy1pmifoh4VGOHYQoZdM
Message-ID: <CAAhSdy3OXBexhB_csqJasQoQJ8QnsE=q7dHXgWtyig28eJGL3g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] KVM: riscv: selftests: add Zilsd and Zclsd
 extension to get-reg-list test
To: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, cyan.yang@sifive.com, 
	cleger@rivosinc.com, charlie@rivosinc.com, cuiyunhui@bytedance.com, 
	samuel.holland@sifive.com, namcao@linutronix.de, jesse@rivosinc.com, 
	inochiama@gmail.com, yongxuan.wang@sifive.com, ajones@ventanamicro.com, 
	parri.andrea@gmail.com, mikisabate@gmail.com, yikming2222@gmail.com, 
	thomas.weissschuh@linutronix.de, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_010623_500838_105C14D0 
X-CRM114-Status: GOOD (  13.13  )
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

T24gVHVlLCBBdWcgMjYsIDIwMjUgYXQgMTA6MDDigK9QTSBQaW5jaGVuZyBXYW5nCjxwaW5jaGVu
Zy5wbGN0QGlzcmMuaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gVGhlIEtWTSBSSVNDLVYgYWxsb3dz
IFppbHNkIGFuZCBaY2xzZCBleHRlbnNpb25zIGZvciBHdWVzdC9WTSBzbyBhZGQKPiB0aGlzIGV4
dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QgdGVzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBpbmNoZW5n
IFdhbmcgPHBpbmNoZW5nLnBsY3RAaXNyYy5pc2Nhcy5hYy5jbj4KPiAtLS0KPiAgdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIHwgNiArKysrKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+IGluZGV4IGEwYjdkYWJiNTA0MC4uNDc3
YmQzODYyNjVmIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNj
di9nZXQtcmVnLWxpc3QuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNj
di9nZXQtcmVnLWxpc3QuYwo+IEBAIC03OCw3ICs3OCw5IEBAIGJvb2wgZmlsdGVyX3JlZyhfX3U2
NCByZWcpCj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklT
Q1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pDQjoKPiAgICAgICAgIGNhc2UgS1ZN
X1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NW
X0lTQV9FWFRfWkNEOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1f
UkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Y6Cj4gKyAgICAgICBj
YXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtW
TV9SSVNDVl9JU0FfRVhUX1pDTFNEOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9F
WFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ01PUDoK
PiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0Ff
U0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWklMU0Q6CgpLVk1fUklTQ1ZfSVNBX0VYVF9aSUxT
RCBjYXNlIG11c3QgYmUgaW5zZXJ0ZWQgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLgoKPiAgICAgICAg
IGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwg
S1ZNX1JJU0NWX0lTQV9FWFRfWkZBOgo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9F
WFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aRkg6Cj4g
ICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJ
TkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pGSE1JTjoKPiBAQCAtNTMwLDcgKzUzMiw5IEBAIHN0
YXRpYyBjb25zdCBjaGFyICppc2FfZXh0X3NpbmdsZV9pZF90b19zdHIoX191NjQgcmVnX29mZikK
PiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpDQiksCj4gICAgICAgICAgICAgICAg
IEtWTV9JU0FfRVhUX0FSUihaQ0QpLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIo
WkNGKSwKPiArICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpDTFNEKSwKPiAgICAgICAg
ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpDTU9QKSwKPiArICAgICAgICAgICAgICAgS1ZNX0lT
QV9FWFRfQVJSKFpJTFNEKSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpGQSks
Cj4gICAgICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaRkgpLAo+ICAgICAgICAgICAgICAg
ICBLVk1fSVNBX0VYVF9BUlIoWkZITUlOKSwKCktWTV9JU0FfRVhUX0FSUihaSUxTRCkgbXVzdCBi
ZSBpbnNlcnRlZCBpbiBhbHBoYWJldGljYWwgb3JkZXIuCgo+IEBAIC0xMTk5LDcgKzEyMDMsOSBA
QCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7Cj4gICAgICAgICAmY29u
ZmlnX3pjYiwKPiAgICAgICAgICZjb25maWdfemNkLAo+ICAgICAgICAgJmNvbmZpZ196Y2YsCj4g
KyAgICAgICAmY29uZmlnX3pjbHNkLAo+ICAgICAgICAgJmNvbmZpZ196Y21vcCwKPiArICAgICAg
ICZjb25maWdfemNsc2QsCgpCb3RoIGNvbmZpZ196Y2xzZCBhbmQgY29uZmlnX3pjbHNkIG11c3Qg
YmUgZGVmaW5lZCBiZWZvcmUKdmNwdV9jb25maWdzW10gdXNpbmcgS1ZNX0lTQV9FWFRfU0lNUExF
X0NPTkZJRygpLgoKQWxzbywgY29uZmlnX3ppbHNkIGlzIG5vdCBhZGRlZCBpbiBhbHBoYWJldGlj
YWwgb3JkZXIuCgo+ICAgICAgICAgJmNvbmZpZ196ZmEsCj4gICAgICAgICAmY29uZmlnX3pmaCwK
PiAgICAgICAgICZjb25maWdfemZobWluLAo+IC0tCj4gMi4zOS41Cj4KCkkgaGF2ZSB0YWtlbiBj
YXJlIG9mIHRoZSBhYm92ZSBjb21tZW50cyBhdCB0aGUgdGltZSBvZiBtZXJnaW5nLgoKUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBwYXRj
aCBmb3IgTGludXgtNi4yMAoKVGhhbmtzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
