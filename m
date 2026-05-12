Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E236CD343F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1BdeY7bcA3vja7ScyPQ6zSZRErVxnQNz6rxaRsnL8s=; b=OMmXx7qSng555t
	TijCuBDGJGbMTAtOBnHAPFLA6kvEa4miq5zfOHAs7dxkA6a6cwuGSNu1ZKLZ9XGAmQOYlmpVrut8V
	gTCJPC/MT9meQkSyivxlpdoKtb4/RmMVRTjfmllSPKYS0DiB5nRRyu2XHp8PGn3xT94B37kwzfn+b
	TWFArlPKkr/r7zORljlcQwfEeOWzGumTYHBgFC1qGm7UZ7/ENqkkgSOCHGGTHETgHv1araiK1u6Pg
	5R/GhNunvgSTDdzptXk8S1p/FAFB64EApwOFdrsrsT4vQny4xoLNpePWEk8dxtXnqXk1ol8jE8DWU
	GN4usxWS7o1jko1ziDTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqna-0000000HXBh-2bXY;
	Tue, 12 May 2026 17:21:38 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqnX-0000000HXB4-3T9G
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 17:21:37 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-479d85152c9so2390551b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 10:21:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778606495; cv=none;
        d=google.com; s=arc-20240605;
        b=kNQWPONn3V5VTg15f81n7Pl74pJTLQ6z+W52pizZCF8Q/j/qT0z0DnK+vjSdRTnMOu
         fCGKczknyNO1JimxRvEPY5SxJzL/hs0yLNim9IOIP+qWWebK6z39iu/p9GeRG/v4Pzd0
         UU5q+1FgTV1z0AC4WnC2DeBNWFWKigAltCMnUMrkBUA3gkB8QMlJfunvLJKpr9Ttvu2z
         oVPYIKovUhHgiozFI2uoZEjd//yt7xcEpH3M4GDB+gpFBWxWpVk8kwMONc9WrCTX4kq4
         qlfFfjH56LPfTmPTdsXfrWJqn1I6/IiusskRrNlH1SPFbO9IDm52nyEZLj3E+V378Sez
         aFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w4U5nnGfyr+nTyOXf43f1pYFnCF1Xh9M/5FcKXA/LTg=;
        fh=LaslmcATxynnt3Vw77Ro3FlF1BG0XXVJREW+92oQmOY=;
        b=S0+sselph0+zvRnEwwco2gSvr0ABL3Ve2PwaV5yxysHxoysWy12LsbDKokV2OgJDaK
         PoypoGk8BkTHmj+ORkvxdnfgkNvI2aiLc/alXzyq4Cx8oDNKZUeZF8fIy95Xolt+WeYp
         jr3cSEGxJ0uYzMzgIY3QfIhAnErwkyb773PhhUgrM3Ojon2ergczN4Hs7OWDaeLbWm8S
         68jshPjzuVauRkV0SVDcVtE/d65lbe7Q3JOsb3fOP9i8y63ZhiIzhFchVP4FmLQ/tM7r
         kwFW1Saf1LakjYz85zgOVS0V4iCzE6G6ZO0GP9AiPakRy1v5wuiJ3KQrWZKhkUjUhqe8
         wU4Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1778606495; x=1779211295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4U5nnGfyr+nTyOXf43f1pYFnCF1Xh9M/5FcKXA/LTg=;
        b=WOUe/9zVa+f8KeAVPIjdVI4clP4WvfqB6yZtDc0TjdWwr9TEbRxxOWaPliyydIMsDf
         u2ab0UEVJJRLeX3YTbwn6B/+aNIkj4JtkLuUVm6Mvz72uSi/suZ2ly4VVn5AFo4t7M39
         0oUeE8m7uniAsr4KwEI6L6wYeh1LopPfsVd84iLE7orGzkNCgz9/b5lHz8Pqu41dUMpp
         J0fEHcgXkINu5dsI2pmt+FLtJPNX5IWS1SLEc6lqUVC17/M6b/zmgacypo1XTrzRw+ea
         Lskd80MDDJOgKDObRAVQJt53/vKqEQAtnQenFfYOjZdYW5PHE2u/MQraGQBhxrdM8bV1
         hTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778606495; x=1779211295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w4U5nnGfyr+nTyOXf43f1pYFnCF1Xh9M/5FcKXA/LTg=;
        b=IweNzzgPb8lWCMWDgXLdvl8Gn7Hb/63+IPePuiilDclRdz8uQwXgH/SljC43aqvtHI
         OcPgsBslh7sFFhQCY73KMem7sgS5P3zjTFwadivv+4uTxBwy+whdFhgXvIipeyCPMp6v
         1zETnwK7bOJTUyBncFbelXWpIblzh/C6YbafPfc0RBIvau1+gxIThnJKNUc9YrIZXQCn
         e+9FGR3np3J0Xhn2FjudEjvaDNNLOry2XB2WJ3GSLDsu3XVgKmnmt/uDhRUFlIbQiLc9
         noWPZVDm0gRUsoGNxMh0vxr6Mtm7PUX2SLwOcKl0ZHQ7VLkhqBrvucXUGKq9fD1mHAeM
         /UOA==
X-Gm-Message-State: AOJu0YzQLyzRF6AnAJ8UOQQQQAQaHZe0jLzVnWA1ksxMxUSYp/Sjgglc
	wYkLdXFcSj4oDxzYmNyD9euPOb5vOCAGsPK82QKbEQAZUj6Ga8MPeqpRlKOixtFDqCQXyXVHCe2
	12eBpsOZvA0Kkqa5IkhsFk/mxdVBrhMpYkxeKkVslZQ==
X-Gm-Gg: Acq92OHGuShbGjRCNfxEnAw01qEVkWLcB3VCKm58P1enKCogHggt+IXx7jPynK1S52l
	V3u34bNjurK9OI9zkTAWUbRrcebGD/3nY4+CLFeZK6DxNWouRftTXQxwpv2wrLWtVh3ZiTVcp0g
	NqupOiOizII3I1JmmmdaDd1j3NN6i4cLRpQYyrV1S18eftlKpuW/LMUNjfP7Z/dc7J8KunW27oq
	ro6wzpni44suCKQWh8z0BIRGK8H4HULtGjRo4HwtK+85+Kc9V04igkwtkM38S9s6YcjVJ096tFj
	kiVQDVM/6qI8BxKIsAo+
X-Received: by 2002:a05:6820:1b0b:b0:69b:5696:e64d with SMTP id
 006d021491bc7-69b69d1d9dbmr2025814eaf.13.1778606494741; Tue, 12 May 2026
 10:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260508212339.381933-1-andrew.jones@oss.qualcomm.com> <20260508212339.381933-2-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260508212339.381933-2-andrew.jones@oss.qualcomm.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 12 May 2026 10:21:22 -0700
X-Gm-Features: AVHnY4I6ENcqXOAeNBceyRtARGuUtboM3f4VQYc2dWNjFI_AlpyEsoddY8VIUj0
Message-ID: <CAH2o1u4kUFyJqzRVOH4W0NxC0znabvi4V8VTQsURgBDErC8hTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/riscv: Map IMSIC addresses for paging domains
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, joro@8bytes.org, will@kernel.org, 
	pjw@kernel.org, palmer@dabbelt.com, anup@brainfault.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_102135_876458_AE408017 
X-CRM114-Status: GOOD (  23.77  )
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

SGksCgpPbiBGcmksIE1heSA4LCAyMDI2IGF0IDI6MjPigK9QTSBBbmRyZXcgSm9uZXMKPGFuZHJl
dy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IFdoZW4gSU9NTVVfRE1BIGlzIGVu
YWJsZWQsIGRldmljZXMgZ2V0IHBhZ2luZyBkb21haW5zIGFuZCBNU0kgd3JpdGVzCj4gdG8gSU1T
SUMgaW50ZXJydXB0IGZpbGVzIG11c3QgYmUgaGFuZGxlZCBjb3JyZWN0bHkgaW4gdGhlIHMtc3Rh
Z2UuCj4gQXMgdGhlIGRldmljZSBhbHdheXMgd3JpdGVzIHRvIHRoZSBob3N0IHBoeXNpY2FsIElN
U0lDIGFkZHJlc3NlcywKPiB3aGljaCB0aGUgSU1TSUMgaXJxY2hpcCBwcm9ncmFtcyBkaXJlY3Rs
eSwgaW5zdGFsbCBzLXN0YWdlIGlkZW50aXR5Cj4gbWFwcGluZ3MgZm9yIHRoZSBob3N0IElNU0lD
cy4gQnV0LCB1c2UgSU9NTVVfUkVTVl9ESVJFQ1RfUkVMQVhBQkxFCj4gc2luY2UgdGhlIDE6MSBt
YXBwaW5ncyBhcmVuJ3QgcmVxdWlyZWQgZm9yIGRldmljZSBhc3NpZ25tZW50Lgo+CgpEZXZpY2Vz
IGFyZSBleHBlY3RlZCB0byBzZW5kIE1TSSB3cml0ZXMgYXMgTWVtV3Igd2l0aCBBVD0wMGIsIHdo
aWNoCnRyaWdnZXJzIGFkZHJlc3MgdHJhbnNsYXRpb24gYnkgdGhlIHJlc3BvbnNpYmxlIElPTU1V
LiBXaGlsZSB0aGUKY3VycmVudCBNU0kgdGFyZ2V0IGFkZHJlc3MgaXMgaWRlbnRpY2FsIHRvIHRo
ZSBJTVNJQyBwaHlzaWNhbCBhZGRyZXNzLApkaXJlY3QgbWFwcGluZyBtaWdodCB3b3JrOyBob3dl
dmVyLCBJIGNvbnNpZGVyIHRoaXMgYW4gaW50ZXJpbSBoYWNrIHRvCmFjaGlldmUgYmFzaWMgTVNJ
IGZvcndhcmRpbmcuIEl0IGlzIHF1aXRlIHNpbWlsYXIgdG8gYSB3b3JrYXJvdW5kIEkKcHJldmlv
dXNseSB1c2VkIHV0aWxpemluZyBJT01NVV9SRVNWX01TSSB0eXBlcyBbMV0sIHdoaWNoIHdvcmtl
ZCB3ZWxsCmVub3VnaCB3aXRoIFZGSU8gaW50ZXJmYWNlcyAoYXNzdW1pbmcgdW5zYWZlIGludGVy
cnVwdHMgYXJlCmFjY2VwdGFibGUpLgoKSSB3b3VsZCBwcmVmZXIgdG8gdXNlIHRoZSBpb21tdV9k
bWFfcHJlcGFyZV9tc2koKSBwYXRoLCBhcyBKYXNvbgpzdWdnZXN0ZWQsIG9yIGltcGxlbWVudCBj
b21wbGV0ZSBJUlEgcmVtYXBwaW5nIGZvciBSSVNDLVYgSU9NTVUuCgpbMV0gaHR0cHM6Ly9naXRo
dWIuY29tL3RqZXpuYWNoL2xpbnV4L2NvbW1pdC8zYTE2NWUxYjhmN2NjNGQwMDc3MGE5MzJmYzA4
NDBjZmVkNzYwNDg1Cgo+IExvb3Agb3ZlciB0aGUgY3B1cyByYXRoZXIgdGhhbiBpbXNpYyBncm91
cHMgdG8gaGFuZGxlIGFzeW1tZXRyaWMKPiBjb25maWd1cmF0aW9ucy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyAgICAgICAgIHwgMzQgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmggfCAg
NyArKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIGIvZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS5jCj4gaW5kZXggYTMxZjUwYmJhZDM1Li4zYzZhYTlkNjlmOTUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gKysrIGIvZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS5jCj4gQEAgLTE5LDYgKzE5LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L2lvbW11Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pb3BvbGwuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L2tlcm5lbC5oPgo+ICAjaW5jbHVkZSA8bGludXgvcGNpLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9n
ZW5lcmljX3B0L2lvbW11Lmg+Cj4gQEAgLTEyODYsNiArMTI4NywzOCBAQCBzdGF0aWMgc3RydWN0
IGlvbW11X2RvbWFpbiAqcmlzY3ZfaW9tbXVfYWxsb2NfcGFnaW5nX2RvbWFpbihzdHJ1Y3QgZGV2
aWNlICpkZXYpCj4gICAgICAgICByZXR1cm4gJmRvbWFpbi0+ZG9tYWluOwo+ICB9Cj4KPiArc3Rh
dGljIHZvaWQgcmlzY3ZfaW9tbXVfZ2V0X3Jlc3ZfcmVnaW9ucyhzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpCj4gK3sKPiArICAgICAgIGNvbnN0IHN0cnVjdCBpbXNp
Y19nbG9iYWxfY29uZmlnICppbXNpY19nbG9iYWw7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgY3B1
Owo+ICsKPiArICAgICAgIGlmICghaW1zaWNfZW5hYmxlZCgpKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm47Cj4gKwo+ICsgICAgICAgaW1zaWNfZ2xvYmFsID0gaW1zaWNfZ2V0X2dsb2JhbF9jb25m
aWcoKTsKPiArCj4gKyAgICAgICBmb3JfZWFjaF9wb3NzaWJsZV9jcHUoY3B1KSB7Cj4gKyAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBpbXNpY19sb2NhbF9jb25maWcgKmxvY2FsOwo+ICsgICAg
ICAgICAgICAgICBzdHJ1Y3QgaW9tbXVfcmVzdl9yZWdpb24gKnJlZzsKPiArCj4gKyAgICAgICAg
ICAgICAgIGxvY2FsID0gcGVyX2NwdV9wdHIoaW1zaWNfZ2xvYmFsLT5sb2NhbCwgY3B1KTsKPiAr
ICAgICAgICAgICAgICAgaWYgKCFsb2NhbC0+bXNpX3ZhKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAg
ICogVGhlIGRldmljZSBhbHdheXMgd3JpdGVzIHRvIHRoZSBob3N0IHBoeXNpY2FsIElNU0lDIGFk
ZHJlc3MsIHNvIGluc3RhbGwKPiArICAgICAgICAgICAgICAgICogaWRlbnRpdHkgbWFwcGluZ3Mg
ZGlyZWN0bHkuIFVzZSBJT01NVV9SRVNWX0RJUkVDVF9SRUxBWEFCTEUgaW5zdGVhZCBvZgo+ICsg
ICAgICAgICAgICAgICAgKiBJT01NVV9SRVNWX0RJUkVDVCBzaW5jZSB0aGVzZSAxOjEgbWFwcGlu
Z3MgYXJlIG5vdCByZXF1aXJlZCBmb3IgYXNzaWduZWQKPiArICAgICAgICAgICAgICAgICogZGV2
aWNlcy4KPiArICAgICAgICAgICAgICAgICovCgpBcyBtZW50aW9uZWQgZWFybGllciwgdGhlIGNv
bW1lbnQgIjE6MSBtYXBwaW5ncyBhcmUgbm90IHJlcXVpcmVkIGZvcgphc3NpZ25lZCBkZXZpY2Vz
IiBpcyBpbmFjY3VyYXRlLCBhc3N1bWluZyB3ZSdkIGxpa2UgTVNJIHRvIHdvcmsuCgo+ICsgICAg
ICAgICAgICAgICByZWcgPSBpb21tdV9hbGxvY19yZXN2X3JlZ2lvbihsb2NhbC0+bXNpX3BhLCBJ
TVNJQ19NTUlPX1BBR0VfU1osCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIElPTU1VX1dSSVRFIHwgSU9NTVVfTk9FWEVDIHwgSU9NTVVfTU1JTywKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfUkVTVl9ESVJF
Q1RfUkVMQVhBQkxFLCBHRlBfS0VSTkVMKTsKPiArICAgICAgICAgICAgICAgaWYgKHJlZykKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2FkZF90YWlsKCZyZWctPmxpc3QsIGhlYWQpOwo+
ICsgICAgICAgfQo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IHJpc2N2X2lvbW11X2F0dGFjaF9ibG9j
a2luZ19kb21haW4oc3RydWN0IGlvbW11X2RvbWFpbiAqaW9tbXVfZG9tYWluLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBp
b21tdV9kb21haW4gKm9sZCkKPiBAQCAtMTQwMSw2ICsxNDM0LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBpb21tdV9vcHMgcmlzY3ZfaW9tbXVfb3BzID0gewo+ICAgICAgICAgLmJsb2NrZWRfZG9t
YWluID0gJnJpc2N2X2lvbW11X2Jsb2NraW5nX2RvbWFpbiwKPiAgICAgICAgIC5yZWxlYXNlX2Rv
bWFpbiA9ICZyaXNjdl9pb21tdV9ibG9ja2luZ19kb21haW4sCj4gICAgICAgICAuZG9tYWluX2Fs
bG9jX3BhZ2luZyA9IHJpc2N2X2lvbW11X2FsbG9jX3BhZ2luZ19kb21haW4sCj4gKyAgICAgICAu
Z2V0X3Jlc3ZfcmVnaW9ucyA9IHJpc2N2X2lvbW11X2dldF9yZXN2X3JlZ2lvbnMsCj4gICAgICAg
ICAuZGV2aWNlX2dyb3VwID0gcmlzY3ZfaW9tbXVfZGV2aWNlX2dyb3VwLAo+ICAgICAgICAgLnBy
b2JlX2RldmljZSA9IHJpc2N2X2lvbW11X3Byb2JlX2RldmljZSwKPiAgICAgICAgIC5yZWxlYXNl
X2RldmljZSA9IHJpc2N2X2lvbW11X3JlbGVhc2VfZGV2aWNlLAo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaCBiL2luY2x1ZGUvbGludXgvaXJxY2hpcC9y
aXNjdi1pbXNpYy5oCj4gaW5kZXggNGIzNDg4MzZkZTdhLi5iYTMwMDBmMDQ3YjAgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmgKPiArKysgYi9pbmNsdWRl
L2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaAo+IEBAIC04OCw2ICs4OCwxMyBAQCBzdGF0aWMg
aW5saW5lIGNvbnN0IHN0cnVjdCBpbXNpY19nbG9iYWxfY29uZmlnICppbXNpY19nZXRfZ2xvYmFs
X2NvbmZpZyh2b2lkKQo+Cj4gICNlbmRpZgo+Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBpbXNpY19l
bmFibGVkKHZvaWQpCj4gK3sKPiArICAgICAgIGNvbnN0IHN0cnVjdCBpbXNpY19nbG9iYWxfY29u
ZmlnICppbXNpY19nbG9iYWwgPSBpbXNpY19nZXRfZ2xvYmFsX2NvbmZpZygpOwo+ICsKPiArICAg
ICAgIHJldHVybiBpbXNpY19nbG9iYWwgJiYgaW1zaWNfZ2xvYmFsLT5ucl9pZHM7Cj4gK30KPiAr
Cj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19BQ1BJKSAmJiBJU19FTkFCTEVEKENPTkZJR19SSVND
Vl9JTVNJQykKPiAgaW50IGltc2ljX3BsYXRmb3JtX2FjcGlfcHJvYmUoc3RydWN0IGZ3bm9kZV9o
YW5kbGUgKmZ3bm9kZSk7Cj4gIHN0cnVjdCBmd25vZGVfaGFuZGxlICppbXNpY19hY3BpX2dldF9m
d25vZGUoc3RydWN0IGRldmljZSAqZGV2KTsKPiAtLQo+IDIuNDMuMAo+CgpCZXN0LAotIFRvbWFz
egoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
