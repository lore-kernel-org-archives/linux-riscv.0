Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E80DC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 15:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9NfE/MwrbUiUUGCFaWV2Cux+GfEDngO6NMF9ZE41+w8=; b=Wy/3TxZnYzQpsT
	EfeWNbjkLWL5R9hCQEEKE3OSnsb3pMI8p5gkpLZ640+ul7DtmtBf/LFcDN/h6lMkBKq9DK0r047z3
	lhZwlhKw4hfCRWXoN2zIOcmSVqqSlG5iaQfg95CM/5bog9xSmpYFKlPC6ntkydIAvLLD4E/R3Mv4U
	Unt6LETxW8W0HGRhgeI+Ah7v+2BlUxLG1xrtof09kHFz6Jba4W6YrYf9ZBcArK1MuJtQyhF5w9gEj
	H8nl1oN2gM5SGHPUK3vdMjPhiaFDAoQOhur8amliQvC94cTRS18oWZdLUmMM/af5Bu+lSbhjp6ION
	ygethWGEG3sHLZSlkGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7zLz-00000008EYS-2iCR;
	Fri, 17 May 2024 15:18:39 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7zLv-00000008EW9-3Bj7
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 15:18:37 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-36c7b7b995fso4971075ab.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1715959113; x=1716563913; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m4CFwHLpmZnHQVhxg9Ce7GcAxeNjySCi2dNUZGyOug=;
        b=OdJdAg6Q4cUwI296GOjJ05FnLfO+oRcwaqG4YSYmOnLTBbpJy88YqxapNVUYa3gXjJ
         Yp+IKlSR8nHwNtsLf3potpqPNf1ueWRYCSAc4id9If4lNgBAoOKgzw+H01zeZiHfR3qA
         RFrHULtHzDqFubUpmwUKGXdAOjHzJLd3hvSixAOoQ6krLAixCUugXCV4fc0vCBBCy8IK
         3AXuzU6UH2R6CEMfbu5zUVqB9IAmRWskd3Cwn2uHpQ4mrz5Tjr1ndNmrIYIoZBIrwsXo
         kzp/OuEfqUTOFrthPzjmSpOUCxH6Cf5jbp6SyfRgMdVARtq3TKTVT36mXrP7DGMjA9T/
         /UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715959113; x=1716563913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1m4CFwHLpmZnHQVhxg9Ce7GcAxeNjySCi2dNUZGyOug=;
        b=TTXEQhrDMyVWm/kOFh5dCty+EyZKTYBda4vw1Kt+L+gz4a2wcSDA/2czCCApCtuiJD
         oauU1LWayePATvVk6s/fOaXrgf+9MHt7QovkqbZAIAzhh5kQGWDCyH5TLnSRoiyCEDLh
         ehITRa12ewCrBqgfQVWQCBWg+fq6dzbliaPRBnLrRT4ckV0VAt6JUPXVBPJEcNSJ361d
         ylLg04QdWkoWvZZXo4Yc6UrB2XafzvtxOI7YxJOOZ4+LbYLw9X0vSPvvWLGKzYCt7nis
         5GM40L93D/k1zYuI+J8IU74/T/rzy+e3wRit2ckzW4T4F2aLazG6n50vOKLl+GP+at4L
         j/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkZ79piH4YU8ocMSNNyJZDsQSdUs3uRjg8I1C423JYtD2v5bDnEV+3SS7fBZrejXE0pzUu7v2RjOmxDc3tjla7JDoLAg1w3dafWwCmMU/q
X-Gm-Message-State: AOJu0YzGTmM7mn2nYvNiB4O3RktMUfixUDyijQdAccw6bj8x2QIqVGST
	74czxYsyhjI8ijSyeeTepoiBGwU8CEVOiTqJzz/LMb9Dwiu2a+9Cf1XAEPKxLsVba9VqbqzFrlr
	AsUzFDyqQLSwpYc3CZXzuAWDPvi2z9MIQ0vBezg==
X-Google-Smtp-Source: AGHT+IGJK8XCJzTVXEsiGdlO5wjVs7wX6BOSuvwLSEKG+jooZHMnH9FoE3Bzx4WPWeKRmsJRiTZQBEo5qN0POnnENhQ=
X-Received: by 2002:a05:6e02:16cf:b0:36d:b398:aa92 with SMTP id
 e9e14a558f8ab-36db398ac57mr108119485ab.8.1715959113504; Fri, 17 May 2024
 08:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240517145302.971019-1-cleger@rivosinc.com> <20240517145302.971019-6-cleger@rivosinc.com>
In-Reply-To: <20240517145302.971019-6-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 May 2024 20:48:21 +0530
Message-ID: <CAAhSdy0XADKcLS_iFdTzpYDY+KAL2+v91xFcjWUu8LofknQWMA@mail.gmail.com>
Subject: Re: [PATCH v5 05/16] KVM: riscv: selftests: Add Zimop extension to
 get-reg-list test
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_081835_911817_748AB0D8 
X-CRM114-Status: GOOD (  13.31  )
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

T24gRnJpLCBNYXkgMTcsIDIwMjQgYXQgODoyM+KAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBUaGUgS1ZNIFJJU0MtViBhbGxvd3MgWmltb3AgZXh0
ZW5zaW9uIGZvciBHdWVzdC9WTSBzbyBhZGQgdGhpcwo+IGV4dGVuc2lvbiB0byBnZXQtcmVnLWxp
c3QgdGVzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9z
aW5jLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRz
LApBbnVwCgo+IC0tLQo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJl
Zy1saXN0LmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxp
c3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+
IGluZGV4IGI4ODJiN2I5Yjc4NS4uNDAxMDdiYjYxOTc1IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ICsrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+IEBAIC02Nyw2ICs2Nyw3
IEBAIGJvb2wgZmlsdGVyX3JlZyhfX3U2NCByZWcpCj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklT
Q1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhU
X1pJSElOVE5UTDoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JF
R19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UUEFVU0U6Cj4gICAg
ICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdM
RSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJSFBNOgo+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NW
X0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9a
SU1PUDoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVND
Vl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWktORDoKPiAgICAgICAgIGNhc2UgS1ZN
X1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NW
X0lTQV9FWFRfWktORToKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZN
X1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWktOSDoKPiBAQCAtNDMy
LDYgKzQzMyw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICppc2FfZXh0X3NpbmdsZV9pZF90b19zdHIo
X191NjQgcmVnX29mZikKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpJSElOVE5U
TCksCj4gICAgICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaSUhJTlRQQVVTRSksCj4gICAg
ICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaSUhQTSksCj4gKyAgICAgICAgICAgICAgIEtW
TV9JU0FfRVhUX0FSUihaSU1PUCksCj4gICAgICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUiha
S05EKSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpLTkUpLAo+ICAgICAgICAg
ICAgICAgICBLVk1fSVNBX0VYVF9BUlIoWktOSCksCj4gQEAgLTk1NSw2ICs5NTcsNyBAQCBLVk1f
SVNBX0VYVF9TSU1QTEVfQ09ORklHKHppZmVuY2VpLCBaSUZFTkNFSSk7Cj4gIEtWTV9JU0FfRVhU
X1NJTVBMRV9DT05GSUcoemloaW50bnRsLCBaSUhJTlROVEwpOwo+ICBLVk1fSVNBX0VYVF9TSU1Q
TEVfQ09ORklHKHppaGludHBhdXNlLCBaSUhJTlRQQVVTRSk7Cj4gIEtWTV9JU0FfRVhUX1NJTVBM
RV9DT05GSUcoemlocG0sIFpJSFBNKTsKPiArS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6aW1v
cCwgWklNT1ApOwo+ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHprbmQsIFpLTkQpOwo+ICBL
Vk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHprbmUsIFpLTkUpOwo+ICBLVk1fSVNBX0VYVF9TSU1Q
TEVfQ09ORklHKHprbmgsIFpLTkgpOwo+IEBAIC0xMDEwLDYgKzEwMTMsNyBAQCBzdHJ1Y3QgdmNw
dV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7Cj4gICAgICAgICAmY29uZmlnX3ppaGludG50
bCwKPiAgICAgICAgICZjb25maWdfemloaW50cGF1c2UsCj4gICAgICAgICAmY29uZmlnX3ppaHBt
LAo+ICsgICAgICAgJmNvbmZpZ196aW1vcCwKPiAgICAgICAgICZjb25maWdfemtuZCwKPiAgICAg
ICAgICZjb25maWdfemtuZSwKPiAgICAgICAgICZjb25maWdfemtuaCwKPiAtLQo+IDIuNDMuMAo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
