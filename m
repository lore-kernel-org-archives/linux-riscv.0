Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5405EEEC08
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 04:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cac29gpIjT8wGZiwZo/IJhR8LKCTDSGoGJO0gZOE/3U=; b=mpGCTY2N2KUzTl
	eO7nSxP7gLjgauj9FjFKT+oEfOunZLz8d5PQrNEh7JDh9AaN1TgnC537bqbgjq9CtReba4ZPxQ1Tv
	fo0057Qo1p0fGFAdIjw/KFeQXyXUrltOQjd+Cps+Lw3JgtX0Hy553GLecoGJyx+mqGz688GHzuD5h
	ti1aI9mQh+zp8F8O/Ee/A+vUCmETRHXBNDBCCCXEJofez4WTNRIWO/lqEZPV0H0m68n2TWvzhhjPp
	q4eYVaMQu+eFm9B+nTFKCRPIGkOFp1P8Bo4XO4xRi0AIWXO3OA5ps7r9Oh467FQp4JtQN/DPCodnu
	mG0P6WH3Y/xz5vbaAaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soxzA-0000000EtzS-3Rfk;
	Fri, 13 Sep 2024 04:32:44 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soxz7-0000000Etyf-00m6
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 04:32:43 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3a08c5a2b93so789615ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 21:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1726201959; x=1726806759; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w54pp7KLxKfAIPY5581fcuCi0omX1JlS2WnZJ/hN1G4=;
        b=S0p2LOKlhSx26ORcBzBHr5feaAoHcjYTyDqruqgNLSqLGMYddUagZHNCtbbORHN/L0
         OzMzu7UK4ld1Q+IQ/vl0hkeu0KZgEurNWubYiiLuY7WtuqKPI4DFOrOx7fhBIXffKQ4/
         W6O1HxwADa6NexL2ATRryr0GjE0gfdwmVerX8/Fui4orVF38Ua7QBBmBl7eTEoUMC7p3
         wSZxcN/lRa3i8EEg4F0X2jAPkXjr19r2/iLM2t2OnRyNGsGrE64pwzQ/G8dwqacoTiTR
         a1uUtJh/NtfnZi8c5o5ZdxVcAp03mSCZ3KbpwJUMN3/caqvLvKKmOQkz9NdWVIyAd9Zr
         xXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726201959; x=1726806759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w54pp7KLxKfAIPY5581fcuCi0omX1JlS2WnZJ/hN1G4=;
        b=Rgkl3BKBb3YWTMgUv3vbFCWf6dqLhTbtUHhrDdIgiQH6LlS2CqNF3uSkP6yb2ZeBKJ
         mduUwMgnYIhS2OKbYoLzXTdyONksnOAb9X7rMDUIkEGrlYCbUW9zT0eAQheouZWMvF4I
         YBytvl0O9jg6PyCtfTGaDWYKXKkRvuFH9WbiZYdpMIymgdFx0C9Adfx6dHFv8WSkrTzI
         3zVUVVQbkOAzfayE3Aw6lLjZ/cuaWUAGX/O4AMXWNOQbfMAOxQC1CDioZ20fHeLEb0bQ
         ucURE/b617QV2djFjx6xXnAZVDzhkqSmP9m1j7k2RgHk1LYKFewE5WsQGA2L5WMJTCZY
         QhTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj8eZ8OlP+atV5Vqxal6FejzL5SU5bdoUV4u899+TCCEZCn0vkYUWATw1G6FERYXu/vEn11BFUfgJ++A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxtOhogKXaP6WE0R8Y+5rLdSyhHoQoBa5cEpgJV5g8wHy6DHvi
	XAdgIccWnYD2TpYw4MoXlv/CJ4BfEWeIwpnsnGK4ekyZVy28nPk2MWzeJanOgQNOoBUhuAGKMIT
	+7o6msqZ1Kj66Ul8aRbhXveD+zgtSzBP5et37fQ==
X-Google-Smtp-Source: AGHT+IE+2QF6HwF17VErmVADwVFkI6DzAjV6r3QI8XJIUdFcDK2edj5QNTbv9dEzH2k7P2s7H77k2KRWduAraPSF2Sg=
X-Received: by 2002:a05:6e02:154f:b0:3a0:4250:165f with SMTP id
 e9e14a558f8ab-3a0847d0c17mr55015385ab.0.1726201959580; Thu, 12 Sep 2024
 21:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <83c2234d582b7e823ce9ac9b73a6bbcf63971a29.1724911120.git.zhouquan@iscas.ac.cn>
 <b5128162-278a-4284-8271-b2b91dc446e1@iscas.ac.cn> <380f4da9-50e9-4632-bdc8-b1723eb19ca5@sifive.com>
In-Reply-To: <380f4da9-50e9-4632-bdc8-b1723eb19ca5@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Sep 2024 10:02:28 +0530
Message-ID: <CAAhSdy1zSTWuTW1KohUDXr9UXUx-QL1A30AUkTGoL7W2L7JWLQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Redirect instruction access fault trap to guest
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Quan Zhou <zhouquan@iscas.ac.cn>, ajones@ventanamicro.com, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_213241_338849_F71672A6 
X-CRM114-Status: GOOD (  27.78  )
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

T24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgNjowOeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE9uIDIwMjQtMDktMTIgNDowMyBBTSwgUXVh
biBaaG91IHdyb3RlOgo+ID4KPiA+IE9uIDIwMjQvOC8yOSAxNDoyMCwgemhvdXF1YW5AaXNjYXMu
YWMuY24gd3JvdGU6Cj4gPj4gRnJvbTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4K
PiA+Pgo+ID4+IFRoZSBNLW1vZGUgcmVkaXJlY3RzIGFuIHVuaGFuZGxlZCBpbnN0cnVjdGlvbiBh
Y2Nlc3MKPiA+PiBmYXVsdCB0cmFwIGJhY2sgdG8gUy1tb2RlIHdoZW4gbm90IGRlbGVnYXRpbmcg
aXQgdG8KPiA+PiBWUy1tb2RlKGhlZGVsZWcpLiBIb3dldmVyLCBLVk0gcnVubmluZyBpbiBIUy1t
b2RlCj4gPj4gdGVybWluYXRlcyB0aGUgVlMtbW9kZSBzb2Z0d2FyZSB3aGVuIGJhY2sgZnJvbSBN
LW1vZGUuCj4gPj4KPiA+PiBUaGUgS1ZNIHNob3VsZCByZWRpcmVjdCB0aGUgdHJhcCBiYWNrIHRv
IFZTLW1vZGUsIGFuZAo+ID4+IGxldCBWUy1tb2RlIHRyYXAgaGFuZGxlciBkZWNpZGUgdGhlIG5l
eHQgc3RlcC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNj
YXMuYWMuY24+Cj4gPj4gLS0tCj4gPj4gICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYyB8IDEg
Kwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPj4KPiA+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4
aXQuYwo+ID4+IGluZGV4IGZhOThlNWMwMjRiMi4uNjk2YjYyODUwZDBiIDEwMDY0NAo+ID4+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV9leGl0LmMKPiA+PiBAQCAtMTgyLDYgKzE4Miw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9l
eGl0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0Cj4gPj4ga3ZtX3J1biAqcnVuLAo+ID4+
ICAgICAgIHJldCA9IC1FRkFVTFQ7Cj4gPj4gICAgICAgcnVuLT5leGl0X3JlYXNvbiA9IEtWTV9F
WElUX1VOS05PV047Cj4gPj4gICAgICAgc3dpdGNoICh0cmFwLT5zY2F1c2UpIHsKPiA+PiArICAg
IGNhc2UgRVhDX0lOU1RfQUNDRVNTOgo+ID4KPiA+IEEgZ2VudGxlIHBpbmcsIHRoZSBpbnN0cnVj
dGlvbiBhY2Nlc3MgZmF1bHQgc2hvdWxkIGJlIHJlZGlyZWN0ZWQgdG8KPiA+IFZTLW1vZGUgZm9y
IGhhbmRsaW5nLCBpcyBteSB1bmRlcnN0YW5kaW5nIGNvcnJlY3Q/Cj4KPiBZZXMsIHRoaXMgbG9v
a3MgY29ycmVjdC4gSG93ZXZlciwgSSBiZWxpZXZlIGl0IHdvdWxkIGJlIGVxdWl2YWxlbnQgKGFu
ZCBtb3JlCj4gZWZmaWNpZW50KSB0byBhZGQgRVhDX0lOU1RfQUNDRVNTIHRvIEtWTV9IRURFTEVH
X0RFRkFVTFQgaW4gYXNtL2t2bV9ob3N0LmguCj4KPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHNv
bWUgZXhjZXB0aW9ucyBhcmUgZGVsZWdhdGVkIHdpdGggaGVkZWxlZyBhbmQgb3RoZXJzIGFyZQo+
IGNhdWdodCBhbmQgcmVkaXJlY3RlZCBoZXJlIHdpdGggbm8gZnVydGhlciBwcm9jZXNzaW5nLiBN
YXliZSBzb21lb25lIHRob3VnaHQKPiB0aGF0IGl0IHdhc24ndCB2YWxpZCB0byBzZXQgYSBiaXQg
aW4gaGVkZWxlZyBpZiB0aGUgY29ycmVzcG9uZGluZyBiaXQgd2FzCj4gY2xlYXJlZCBpbiBtZWRl
bGVnPyBCdXQgdGhpcyBkb2Vzbid0IG1ha2Ugc2Vuc2UsIGFzIFMtbW9kZSBjYW5ub3Qga25vdyB3
aGljaAo+IGJpdHMgYXJlIHNldCBpbiBtZWRlbGVnIChtYXliZSBub25lIGFyZSEpLgo+Cj4gU28g
dGhlIGh5cGVydmlzb3IgbXVzdCBlaXRoZXI6Cj4gIDEpIGFzc3VtZSBNLW1vZGUgZmlybXdhcmUg
Y2hlY2tzIGhlZGVsZWcgYW5kIHJlZGlyZWN0cyBleGNlcHRpb25zIHRvIFZTLW1vZGUKPiAgICAg
cmVnYXJkbGVzcyBvZiBtZWRlbGVnLCBpbiB3aGljaCBjYXNlIGFsbCBmb3VyIG9mIHRoZXNlIGV4
Y2VwdGlvbnMgY2FuIGJlCj4gICAgIG1vdmVkIHRvIEtWTV9IRURFTEVHX0RFRkFVTFQgYW5kIHJl
bW92ZWQgZnJvbSB0aGlzIHN3aXRjaCBzdGF0ZW1lbnQsIG9yCj4KPiAgMikgYXNzdW1lIE0tbW9k
ZSBtaWdodCBub3QgY2hlY2sgaGVkZWxlZyBhbmQgcmVkaXJlY3QgZXhjZXB0aW9ucyB0byBWUy1t
b2RlLAo+ICAgICBhbmQgc2luY2Ugbm8gYml0cyBhcmUgZ3VhcmFudGVlZCB0byBiZSBzZXQgaW4g
bWVkZWxlZywgYW55IGJpdCBzZXQgaW4KPiAgICAgaGVkZWxlZyBtdXN0IF9hbHNvXyBiZSBoYW5k
bGVkIGluIHRoZSBzd2l0Y2ggY2FzZSBoZXJlLgo+Cj4gQW51cCwgQXRpc2gsIHRob3VnaHRzPwoK
QW55IGV4Y2VwdGlvbiBkZWxlZ2F0ZWQgdG8gVlMtbW9kZSB2aWEgaGVkZWxlZyBtZWFucyBpdCBp
cyBkaXJlY3RseSBkZWxpdmVyZWQKdG8gVlMtbW9kZSB3aXRob3V0IGFueSBpbnRlcnZlbnRpb24g
b2YgSFMtbW9kZS4gVGhpcyBhbGlnbnMgd2l0aCB0aGUgUklTQy1WCnByaXYgc3BlY2lmaWNhdGlv
biBhbmQgdGhlcmUgaXMgbm8gYWx0ZXJuYXRlIHNlbWFudGljcyBhc3N1bWVkIGJ5IEtWTSBSSVND
LVYuCgpBdCB0aGUgbW9tZW50LCBmb3IgS1ZNIFJJU0MtViB3ZSBhcmUgY29udmVyZ2luZyB0b3dh
cmRzIHRoZSBmb2xsb3dpbmcKYXBwcm9hY2g6CgoxKSBPbmx5IGRlbGVnYXRlICJzdXBlcnZpc29y
IGV4cGVjdGVkIiB0cmFwcyB0byBWUy1tb2RlIHZpYSBoZWRlbGVnCndoaWNoIHN1cGVydmlzb3Ig
c29mdHdhcmUgaXMgZ2VuZXJhbGx5IGV4cGVjdGVkIHRvIGRpcmVjdGx5IGhhbmRsZSBzdWNoCmFz
IGJyZWFrcG9pbnQsIHVzZXIgc3lzY2FsbCwgaW5zdCBwYWdlIGZhdWx0LCBsb2FkIHBhZ2UgZmF1
bHQsIGFuZCBzdG9yZQpwYWdlIGZhdWx0LgoKMikgT3RoZXIgInN1cGVydmlzb3IgdW5leHBlY3Rl
ZCIgdHJhcHMgYXJlIHJlZGlyZWN0ZWQgdG8gVlMtbW9kZSB2aWEKc29mdHdhcmUgaW4gSFMtbW9k
ZSBiZWNhdXNlIHRoZXNlIGFyZSBub3QgdHlwaWNhbGx5IGV4cGVjdGVkIGJ5IHN1cGVydmlzb3IK
c29mdHdhcmUgYW5kIEtWTSBSSVNDLVYgc2hvdWxkIGF0IGxlYXN0IGdhdGhlciBzb21lIHN0YXRz
IGZvciBzdWNoIHRyYXBzLgpQcmV2aW91c2x5LCB3ZSB3ZXJlIHJlZGlyZWN0aW5nIHN1Y2ggdW5l
eHBlY3QgdHJhcHMgdG8gS1ZNIHVzZXIgc3BhY2UKd2hlcmUgdGhlIEtWTSB1c2VyIHNwYWNlIHRv
b2wgd2lsbCBzaW1wbHkgZHVtcCB0aGUgVkNQVSBzdGF0ZSBhbmQga2lsbAp0aGUgR3Vlc3QvVk0u
CgpUaGUgaW5zdCBtaXNhbGlnbmVkIHRyYXAgd2FzIGhpc3RvcmljYWxseSBhbHdheXMgc2V0IGlu
IGhlZGVsZWcgYnV0IHdlCnNob3VsZCB1cGRhdGUgaXQgYmFzZWQgb24gdGhlIGFib3ZlIGFwcHJv
YWNoLgoKPgo+IFJlZ2FyZHMsCj4gU2FtdWVsCj4KPiA+Cj4gPj4gICAgICAgY2FzZSBFWENfSU5T
VF9JTExFR0FMOgo+ID4+ICAgICAgIGNhc2UgRVhDX0xPQURfTUlTQUxJR05FRDoKPiA+PiAgICAg
ICBjYXNlIEVYQ19TVE9SRV9NSVNBTElHTkVEOgo+ID4+Cj4gPj4gYmFzZS1jb21taXQ6IDdjNjI2
Y2U0YmFlMWFjMTRmNjAwNzZkMDBlYWZlNzFhZjMwNDUwYmEKPiA+Cj4gPgo+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+CgpSZWdh
cmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
