Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D8CC2A072
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFa8sLSY09KEWhlJZEbu4kKjGuzokxI46FRpRvpvvBY=; b=X3X609+w6S508w
	1BW7XViIalK+gLNK7zdgGq8gUH6q1u3ihHMZRIsxCNHbjcHC189lLXrz4t7sHmMmGJlWwbXRm33jd
	WBhfrXhMuLg/RNRnGOij/IUetXkrxwyLPpgEv/n9tDzYdg8XvqN7xOn/aS//B3ojz8j1smT/dx9DQ
	Au6qlwSNaJKWd3ckRhvdq6dJbkGkmC03L6+nMNP96OHQTfKJY69UMqDDK7TuJSBA8uxSQJOXJEuIa
	dR5ifi11bsF0iNlo6Lw9n2ZF4hcVks9J+zt+FNwqgWbkAsO+PDuuAIsw7JQHumnjnsugvdd1XiRuC
	IDgFS0Uo0xaRqGMZFgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgTl-0000000B1y8-2X0o;
	Mon, 05 Jan 2026 09:02:21 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgTi-0000000B1x6-3o8s
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 09:02:20 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-65ecd7fcf36so4665027eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jan 2026 01:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767603738; x=1768208538; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLgzGv5fLc8fsHoh6HgxliKmTiWU9X2CeR3QczQ/WzU=;
        b=luJ0YTEfhm7VWnYiN9/fP07jXGjfUgkVzh9PcCHdtMU+5jbN73CsLC3BlLLWi1hVjQ
         /IT5XbUnQOobCEKPUS+z21qHOoUQVf7OsgvqqC3QhsEKy2LNUPBDujQrG7rExvSofMOh
         tPi0h2quIAt4+SZ4/WBPoZ/RLUsKByyIBV3LNAfv2VHAx33NMkbrS/1NdL75cc9zd05n
         7qNY5RFk/KozSLM/Bf2E2NSRTeF2GNXhq6HNU8T4VyrdKE4puMultJV9tZd1xGNv1FjV
         MPErmszTokQ9rzGXNzBzlZDBbFC/01Omu+MSBi95YTJRRge2r++FAIesyRkzrHeQdnG5
         9ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603738; x=1768208538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLgzGv5fLc8fsHoh6HgxliKmTiWU9X2CeR3QczQ/WzU=;
        b=QZJap1uHQK9J+tEW9oSdMnDP9J5g3WgysheyoMEcUST2FAucNwl6PSYKhSkxJ6Jfi6
         FE+BwGixyfw4+fd/az9A+wKJwG5kBjOmEjhLdf9Fmxb3/LwmVWGLCVawJrQ66u1VW7Bw
         ByNKpQJ0Irj35OTui2rfB+iVOIiWCecAodRChMv6SZrzKNzdmKYSvRF1kJqJlIG47JGX
         dRIEsE4i78E9LBXjtAadL+bx2HL6soLkmaNtnWT+PPVkGXIV0qQWAX72ZRl0w+3M3NKP
         SLuxcp5tLu3nYwivcNaY9uqM9g43E0Zyy3vXJxnKA5x8H15EZyefTLYVapSON3uHTz3m
         nbyA==
X-Forwarded-Encrypted: i=1; AJvYcCUlR4ynD2JlHs6ZcsE5gNhH0/nGL6MRM8r5IVF6kKNx5x1EqFWnNHfTyONI78pSJZXE9ozUq0ZcHXOyOA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHk852IxLrnf9FDEqLfV6wejqbhVF+ZaJL3mIMKUoYk+69Qz9q
	eXLVUGTM4EvxdP3H7yVApp+jRVGaqPgs4ies5FW9vwhxlMSnPXMsTbddBGed09CpI7FtLeN4zL6
	ayv6mzx8O8QReHF6kUQUqjQPy1+epCcSYxKHbbHUInQ==
X-Gm-Gg: AY/fxX7oI+SXzFyH7NOxhwBL+8WYKIXE8NiD2yF1LmtAaPric9tf9WsmGjAL+PpivhD
	xKG0NKzsarDMC/gaUt/q4BM0E7mrgwzc04D/yy26TA8FTWTAsMq1XWDCrBozKkDxchnN5DeebYR
	lnHejmeMBFMzizuSzOS9bY2pB8MoxauwyVIJYiwAyeLEEArDN14MxKykwI+3y+Go6c5r3oEB6so
	j7wQIQuQNgDlJn5/UPXfBAzdauFRO8m/tg/V/qkg3Xd4hx5x2svnxJrS+urIfHFTAK85TnA3Sf+
	q3VKSnG9J545wcQjV/owsmJ7djIprGL0LG0SlyNAUXlT+nh4/YLk3iAafw==
X-Google-Smtp-Source: AGHT+IG/2dbYVAi+kE9jQKrV+b5ME2O9/wDR8akXLsA6MOvPGexAzyR6yiQetXOblpapVeFT7WzjD3+LEnqxI7rG0V0=
X-Received: by 2002:a4a:b285:0:b0:659:9a49:9023 with SMTP id
 006d021491bc7-65d0eafe372mr16492285eaf.80.1767603737633; Mon, 05 Jan 2026
 01:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn> <20250826162939.1494021-5-pincheng.plct@isrc.iscas.ac.cn>
In-Reply-To: <20250826162939.1494021-5-pincheng.plct@isrc.iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Jan 2026 14:32:06 +0530
X-Gm-Features: AQt7F2r7JOD0nswZYt1d_1RpOAVlRLQ2tRHmfthI7w40klc16h1ihmE0AFTutIc
Message-ID: <CAAhSdy1B155WWM8=FA=fvmpVHgVzXke5WjQRnv63RLyLbdpDFw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: KVM: allow Zilsd and Zclsd extensions for Guest/VM
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
X-CRM114-CacheID: sfid-20260105_010219_234684_719BEDB9 
X-CRM114-Status: GOOD (  13.33  )
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
Zy5wbGN0QGlzcmMuaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gRXh0ZW5kIHRoZSBLVk0gSVNBIGV4
dGVuc2lvbiBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBLVk0gdXNlciBzcGFjZQo+IHRvIGRl
dGVjdCBhbmQgZW5hYmxlIFppbHNkIGFuZCBaY2xzZCBleHRlbnNpb25zIGZvciBHdWVzdC9WTS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFBpbmNoZW5nIFdhbmcgPHBpbmNoZW5nLnBsY3RAaXNyYy5pc2Nh
cy5hYy5jbj4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIHwgMiAr
Kwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCAyICsrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4g
aW5kZXggNWY1OWZkMjI2Y2M1Li5iZWI3Y2UwNmRjZTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2t2bS5oCj4gQEAgLTE3NCw2ICsxNzQsOCBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lE
IHsKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDRCwKPiAgICAgICAgIEtWTV9SSVNDVl9J
U0FfRVhUX1pDRiwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAo+ICsgICAgICAg
S1ZNX1JJU0NWX0lTQV9FWFRfWkNMU0QsCj4gKyAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aSUxT
RCwKPiAgICAgICAgIEtWTV9SSVNDVl9JU0FfRVhUX1pBV1JTLAo+ICAgICAgICAgS1ZNX1JJU0NW
X0lTQV9FWFRfU01OUE0sCj4gICAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9TU05QTSwKClRoZSBL
Vk1fUklTQ1ZfSVNBX0VYVF9aQ0xTRCBhbmQgS1ZNX1JJU0NWX0lTQV9FWFRfWklMU0QKTVVTVCBC
RSBpbnNlcnRlZCBhdCB0aGUgZW5kIG9mIGVudW0gdG8gbWFpbnRhaW4gYmFja3dhcmQgY29tcGF0
aWJpbGl0eQppbiB0aGUgVUFQSSBoZWFkZXIuCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS92Y3B1X29uZXJlZy5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IGluZGV4IDJl
MWI2NDZmMGQ2MS4uODIxOTc2OWZjNGExIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfb25lcmVnLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gQEAgLTY0
LDYgKzY0LDcgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10g
PSB7Cj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkNEKSwKPiAgICAgICAgIEtWTV9JU0FfRVhU
X0FSUihaQ0YpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpDTU9QKSwKPiArICAgICAgIEtW
TV9JU0FfRVhUX0FSUihaQ0xTRCksCj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWkZBKSwKPiAg
ICAgICAgIEtWTV9JU0FfRVhUX0FSUihaRkgpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpG
SE1JTiksCj4gQEAgLTc4LDYgKzc5LDcgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3Zt
X2lzYV9leHRfYXJyW10gPSB7Cj4gICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWklISU5UUEFVU0Up
LAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJSFBNKSwKPiAgICAgICAgIEtWTV9JU0FfRVhU
X0FSUihaSU1PUCksCj4gKyAgICAgICBLVk1fSVNBX0VYVF9BUlIoWklMU0QpLAo+ICAgICAgICAg
S1ZNX0lTQV9FWFRfQVJSKFpLTkQpLAo+ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpLTkUpLAo+
ICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpLTkgpLAoKQm90aCBaQ0xTRCBhbmQgWklMU0QgbXVz
dCBiZSBpbnNlcnRlZCBpbiBhbHBoYWJldGljYWwgb3JkZXIKaW4gdGhlIGt2bV9pc2FfZXh0X2Fy
cltdIGFycmF5LgoKSSBoYXZlIHRha2VuIGNhcmUgb2YgdGhlIGFib3ZlIGNvbW1lbnRzIGF0IHRo
ZSB0aW1lIG9mIG1lcmdpbmcuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjIwCgpUaGFua3MsCkFudXAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
