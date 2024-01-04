Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E1FC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0j4pehhKaKPXhwf6B0eAllYDBM00bs7aHmocAUAD0A4=; b=EUUfmdntg9UbQp
	yCu4Lwl4h33/KSyoPe/XD4TVBS6U5ChFvNSjb0QPRvjvtpxnb23CWLW3p41bKPo0sKvN/tAsZBpOK
	yu1bvrNBXB/jzzDyvbhgxSuBbztSIlcRtKEhLshmTuwDSjxtIiIvstk/83rEDkhEDvBJR1F3soliK
	xywzGjaRCqdP+TBNkMOkakrrggHfZqlkOe5yu8/t6R5CFSgRjqTqT10UO8qJcUqZEVeqIbdFsGHyM
	KDDaMhbQjkMNWmFOfLPIJfJLlN7LYA7pprufxB3ISKCrl2Pjr2C1TwGkM1KDWcLt/8sPNxm6xCHOw
	OPyvQL8OQ8lAgN3TZfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLN0c-00E00p-36;
	Thu, 04 Jan 2024 12:39:38 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLN0Z-00Dzy9-28
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 12:39:37 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a26f73732c5so50845566b.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 04:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704371971; x=1704976771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzvOTQrYsC64lRjX0Rt7BbitXgRl8QC6qZq6acvuD1g=;
        b=sJdhW1mr0sYhqZ7G0JVvep+1tUiWoJJThDO8yZZZLbVu1KuZbi7P1phQz+8ihbEKk7
         jVIo0awldbwotYlykoEU0hKLzVyw3qmUI60iqc35Pdgo5GeKMSKDqRru/mVtIzPOb5Yk
         l9UxpUq5QK3f6OYbzqApoDjofeN8X945yY+k7fn7bxe2co45eKTKUAcaAVIr+V5t5f48
         7DMDM7eThNcr45begxVvF68D5KqwIRrVZ9QywkvtKkNXNQSn1AK6v0ByFUP/L5u9QJRG
         YiNRwxG+KxCyhvDk8Dr6X5YUWpcIWaHSlSRrrK3Y1rn+API1JCuqv5VButD3rXXPiz7L
         imBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371971; x=1704976771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzvOTQrYsC64lRjX0Rt7BbitXgRl8QC6qZq6acvuD1g=;
        b=lDf4ff7JDXfpfIk7RuipuNi5QUPoBFRF+mDcE5NDShNQ0OgYjNy0fqessJ7Vg4w7f8
         YKNx71lgrI80P25mk8GYMomtqsb1BhOixYD4pwyMxZ7RilGsLE+e84WygFTKVsRjpnMI
         w4pcA2cci5fT9zuNl1MnlGXxx8HvnJKhPCDDFYBsypcs7dzxFz7kaI3cNjlQgDOoRagM
         SAUbzOcgSJDeRjB7WDWdg/Nn/EcqPj0bRQFUgDaw02WGpKixfx+i4hX8JFg3uV80CMNA
         t1m4/Jj6u4zXEzVgn5J+V8JF//sUiKvrHnPb1V2NjcYnchEXglNWVlCQSiXWz/iOHstM
         TdPg==
X-Gm-Message-State: AOJu0YwVVknI+TykH+4/nfWxGmGHCpQUj27Eimgl2jYoKlCVdZvp+li7
	NBwE/nWRbGHwBmjZO5YMn67VwNL2XPoVsQ3+GCICwlxOChc86CTlRL3BnTKk6Zo=
X-Google-Smtp-Source: AGHT+IEeRR4I3uWL5TxDjZ3qrupVtXYMaBZuKr0o+l32Kjda9sN5IKWIaRFz0g22rzETebnGyfVZeFTdsQogwR+pnjM=
X-Received: by 2002:a17:907:76a8:b0:a26:9916:a46b with SMTP id
 jw8-20020a17090776a800b00a269916a46bmr317729ejc.33.1704371971601; Thu, 04 Jan
 2024 04:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20240102220134.3229156-1-samuel.holland@sifive.com> <20240102220134.3229156-9-samuel.holland@sifive.com>
In-Reply-To: <20240102220134.3229156-9-samuel.holland@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 4 Jan 2024 13:39:20 +0100
Message-ID: <CAHVXubhKrC_7DEBXR_wCP9g7-KfWg9nuyim7+X1Ja2gh8s9+HA@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] riscv: mm: Introduce cntx2asid/cntx2version
 helper macros
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_043935_698107_F7265D23 
X-CRM114-Status: GOOD (  22.88  )
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

T24gVHVlLCBKYW4gMiwgMjAyNCBhdCAxMTowMeKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFdoZW4gdXNpbmcgdGhlIEFTSUQgYWxsb2Nh
dG9yLCB0aGUgTU0gY29udGV4dCBJRCBjb250YWlucyB0d28gdmFsdWVzOgo+IHRoZSBBU0lEIGlu
IHRoZSBsb3dlciBiaXRzLCBhbmQgdGhlIGFsbG9jYXRvciB2ZXJzaW9uIG51bWJlciBpbiB0aGUK
PiByZW1haW5pbmcgYml0cy4gVXNlIG1hY3JvcyB0byBtYWtlIHRoaXMgc2VwYXJhdGlvbiBtb3Jl
IG9idmlvdXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxh
bmRAc2lmaXZlLmNvbT4KPiAtLS0KPgo+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+Cj4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vbW11LmggfCAgMyArKysKPiAgYXJjaC9yaXNjdi9tbS9jb250ZXh0
LmMgICAgICB8IDEyICsrKysrKy0tLS0tLQo+ICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgICAg
IHwgIDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vbW11LmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL21tdS5oCj4gaW5kZXggMzU1NTA0YjM3ZjhlLi5hNTUwZmJmNzcw
YmUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbXUuaAo+ICsrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vbW11LmgKPiBAQCAtMjYsNiArMjYsOSBAQCB0eXBlZGVmIHN0
cnVjdCB7Cj4gICNlbmRpZgo+ICB9IG1tX2NvbnRleHRfdDsKPgo+ICsjZGVmaW5lIGNudHgyYXNp
ZChjbnR4KSAgICAgICAgICAgICAgICAoKGNudHgpICYgYXNpZF9tYXNrKQo+ICsjZGVmaW5lIGNu
dHgydmVyc2lvbihjbnR4KSAgICAgKChjbnR4KSAmIH5hc2lkX21hc2spCgpOb3QgYSBiaWcgZmFu
IG9mIHRoZSBuYW1pbmcsIEkgd291bGQgaGF2ZSBzb21ldGhpbmcgbGlrZQpnZXRfYXNpZF9mcm9t
X2NvbnRleHQoKSBhbmQgZ2V0X3ZlcnNpb25fZnJvbV9jb250ZXh0KCkgb3Igc29tZXRoaW5nCmxp
a2UgdGhhdCwgYnV0IHVwIHRvIHlvdSBvZiBjb3Vyc2UuCgo+ICsKPiAgdm9pZCBfX2luaXQgY3Jl
YXRlX3BnZF9tYXBwaW5nKHBnZF90ICpwZ2RwLCB1aW50cHRyX3QgdmEsIHBoeXNfYWRkcl90IHBh
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaHlzX2FkZHJfdCBzeiwgcGdwcm90
X3QgcHJvdCk7Cj4gICNlbmRpZiAvKiBfX0FTU0VNQkxZX18gKi8KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9tbS9jb250ZXh0LmMgYi9hcmNoL3Jpc2N2L21tL2NvbnRleHQuYwo+IGluZGV4IDIx
N2ZkNGRlNjEzNC4uNDNkMDA1ZjYzMjUzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vY29u
dGV4dC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPiBAQCAtODEsNyArODEsNyBA
QCBzdGF0aWMgdm9pZCBfX2ZsdXNoX2NvbnRleHQodm9pZCkKPiAgICAgICAgICAgICAgICAgaWYg
KGNudHggPT0gMCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBjbnR4ID0gcGVyX2NwdShyZXNl
cnZlZF9jb250ZXh0LCBpKTsKPgo+IC0gICAgICAgICAgICAgICBfX3NldF9iaXQoY250eCAmIGFz
aWRfbWFzaywgY29udGV4dF9hc2lkX21hcCk7Cj4gKyAgICAgICAgICAgICAgIF9fc2V0X2JpdChj
bnR4MmFzaWQoY250eCksIGNvbnRleHRfYXNpZF9tYXApOwo+ICAgICAgICAgICAgICAgICBwZXJf
Y3B1KHJlc2VydmVkX2NvbnRleHQsIGkpID0gY250eDsKPiAgICAgICAgIH0KPgo+IEBAIC0xMDIs
NyArMTAyLDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgX19uZXdfY29udGV4dChzdHJ1Y3QgbW1f
c3RydWN0ICptbSkKPiAgICAgICAgIGxvY2tkZXBfYXNzZXJ0X2hlbGQoJmNvbnRleHRfbG9jayk7
Cj4KPiAgICAgICAgIGlmIChjbnR4ICE9IDApIHsKPiAtICAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBuZXdjbnR4ID0gdmVyIHwgKGNudHggJiBhc2lkX21hc2spOwo+ICsgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIG5ld2NudHggPSB2ZXIgfCBjbnR4MmFzaWQoY250eCk7Cj4KPiAgICAg
ICAgICAgICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICogSWYgb3VyIGN1cnJlbnQgQ09OVEVY
VCB3YXMgYWN0aXZlIGR1cmluZyBhIHJvbGxvdmVyLCB3ZQo+IEBAIC0xMTUsNyArMTE1LDcgQEAg
c3RhdGljIHVuc2lnbmVkIGxvbmcgX19uZXdfY29udGV4dChzdHJ1Y3QgbW1fc3RydWN0ICptbSkK
PiAgICAgICAgICAgICAgICAgICogV2UgaGFkIGEgdmFsaWQgQ09OVEVYVCBpbiBhIHByZXZpb3Vz
IGxpZmUsIHNvIHRyeSB0bwo+ICAgICAgICAgICAgICAgICAgKiByZS11c2UgaXQgaWYgcG9zc2li
bGUuCj4gICAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICBpZiAoIV9fdGVzdF9h
bmRfc2V0X2JpdChjbnR4ICYgYXNpZF9tYXNrLCBjb250ZXh0X2FzaWRfbWFwKSkKPiArICAgICAg
ICAgICAgICAgaWYgKCFfX3Rlc3RfYW5kX3NldF9iaXQoY250eDJhc2lkKGNudHgpLCBjb250ZXh0
X2FzaWRfbWFwKSkKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gbmV3Y250eDsKPiAg
ICAgICAgIH0KPgo+IEBAIC0xNjgsNyArMTY4LDcgQEAgc3RhdGljIHZvaWQgc2V0X21tX2FzaWQo
c3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGludCBjcHUpCj4gICAgICAgICAgKi8KPiAg
ICAgICAgIG9sZF9hY3RpdmVfY250eCA9IGF0b21pY19sb25nX3JlYWQoJnBlcl9jcHUoYWN0aXZl
X2NvbnRleHQsIGNwdSkpOwo+ICAgICAgICAgaWYgKG9sZF9hY3RpdmVfY250eCAmJgo+IC0gICAg
ICAgICAgICgoY250eCAmIH5hc2lkX21hc2spID09IGF0b21pY19sb25nX3JlYWQoJmN1cnJlbnRf
dmVyc2lvbikpICYmCj4gKyAgICAgICAgICAgKGNudHgydmVyc2lvbihjbnR4KSA9PSBhdG9taWNf
bG9uZ19yZWFkKCZjdXJyZW50X3ZlcnNpb24pKSAmJgo+ICAgICAgICAgICAgIGF0b21pY19sb25n
X2NtcHhjaGdfcmVsYXhlZCgmcGVyX2NwdShhY3RpdmVfY29udGV4dCwgY3B1KSwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkX2FjdGl2ZV9jbnR4LCBjbnR4KSkK
PiAgICAgICAgICAgICAgICAgZ290byBzd2l0Y2hfbW1fZmFzdDsKPiBAQCAtMTc3LDcgKzE3Nyw3
IEBAIHN0YXRpYyB2b2lkIHNldF9tbV9hc2lkKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25l
ZCBpbnQgY3B1KQo+Cj4gICAgICAgICAvKiBDaGVjayB0aGF0IG91ciBBU0lEIGJlbG9uZ3MgdG8g
dGhlIGN1cnJlbnRfdmVyc2lvbi4gKi8KPiAgICAgICAgIGNudHggPSBhdG9taWNfbG9uZ19yZWFk
KCZtbS0+Y29udGV4dC5pZCk7Cj4gLSAgICAgICBpZiAoKGNudHggJiB+YXNpZF9tYXNrKSAhPSBh
dG9taWNfbG9uZ19yZWFkKCZjdXJyZW50X3ZlcnNpb24pKSB7Cj4gKyAgICAgICBpZiAoY250eDJ2
ZXJzaW9uKGNudHgpICE9IGF0b21pY19sb25nX3JlYWQoJmN1cnJlbnRfdmVyc2lvbikpIHsKPiAg
ICAgICAgICAgICAgICAgY250eCA9IF9fbmV3X2NvbnRleHQobW0pOwo+ICAgICAgICAgICAgICAg
ICBhdG9taWNfbG9uZ19zZXQoJm1tLT5jb250ZXh0LmlkLCBjbnR4KTsKPiAgICAgICAgIH0KPiBA
QCAtMTkxLDcgKzE5MSw3IEBAIHN0YXRpYyB2b2lkIHNldF9tbV9hc2lkKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLCB1bnNpZ25lZCBpbnQgY3B1KQo+Cj4gIHN3aXRjaF9tbV9mYXN0Ogo+ICAgICAgICAg
Y3NyX3dyaXRlKENTUl9TQVRQLCB2aXJ0X3RvX3BmbihtbS0+cGdkKSB8Cj4gLSAgICAgICAgICAg
ICAgICAgKChjbnR4ICYgYXNpZF9tYXNrKSA8PCBTQVRQX0FTSURfU0hJRlQpIHwKPiArICAgICAg
ICAgICAgICAgICAoY250eDJhc2lkKGNudHgpIDw8IFNBVFBfQVNJRF9TSElGVCkgfAo+ICAgICAg
ICAgICAgICAgICAgIHNhdHBfbW9kZSk7Cj4KPiAgICAgICAgIGlmIChuZWVkX2ZsdXNoX3RsYikK
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90
bGJmbHVzaC5jCj4gaW5kZXggNzZiMjRkNGVkNGFiLi41ZWM2MjE1NDVjNjkgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVz
aC5jCj4gQEAgLTg1LDcgKzg1LDcgQEAgc3RhdGljIHZvaWQgX19mbHVzaF90bGJfcmFuZ2Uoc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuOwo+Cj4gICAgICAgICAgICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX3Vu
bGlrZWx5KCZ1c2VfYXNpZF9hbGxvY2F0b3IpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGFz
aWQgPSBhdG9taWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCkgJiBhc2lkX21hc2s7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYXNpZCA9IGNudHgyYXNpZChhdG9taWNfbG9uZ19yZWFkKCZt
bS0+Y29udGV4dC5pZCkpOwo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgY21h
c2sgPSBjcHVfb25saW5lX21hc2s7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjQyLjAKPgoKWW91IGNh
biBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMu
Y29tPgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
