Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD33C6FD1D
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Apr 2023 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d8haM3nUw8wIRqjx3SYtY8mD1WYUPhficliH0Jm250I=; b=2siaTQpD2V3sEd
	LKblm7VWoBq4djCJ03aOgcIfJERVOZRxm5ivrzR4eoHOt67JB4Dn0s325ZMORDRcJ6eluEsjZ2Vg8
	3Cga/dz+QEZPaBMgFOWetj9cVWTqOTUAFAcr8VDsKcN++nRpc1YJwNVrEHxtm0TFb32O2Ejgdd45h
	+8czwPH0xN0qjgDZMgMV0Ti4tqNulNqzlPM4HeL138kiZAb5S8kr2TRC/0g8TbTgD0Ur1jaV+m9TL
	1GTQTJ929eDlhQVXHbhrwCEKe2HIKTR1H/QyDx3wUFThpK1s3oAYDRVkoXuuAoIMIlbJAt70yT9M4
	LbC2SZZ4DbQ8b+PiVz/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkZQ-00A7V7-14;
	Fri, 07 Apr 2023 11:47:56 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkZL-00A7Tp-1R
	for linux-riscv@lists.infradead.org;
	Fri, 07 Apr 2023 11:47:53 +0000
Received: by mail-ej1-x62c.google.com with SMTP id jw24so7849623ejc.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Apr 2023 04:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112; t=1680868069; x=1683460069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmipLli4Us/FqANzcc2OCDfSEPf0SUwkXLA0R/wFWgo=;
        b=zkoCxt/BV9XC70OmBfknrIasNIH+XG3bwrgMAwwPCSI4VnQp3VWPqUc4XiBd3CINiC
         pn67tkfBoWguOFmbvV+fQ1nJoFwLfeR4w3P1hLQ4kkInGdW/z4uBB5P6zqSflM9yo4hZ
         kqxmu5A5wFRpYm9j+gCwXa+dAlG8EvpWKtRF3eP5L9Up7kYExf23VzQ0Rbo1dQFL1HfQ
         q8X2u9OaP4GfqYNMZiNWMINWhz144BjR5LjZLpbCMQpJmAplAYBP993eVc9j9ZzAWX6W
         fUz7z1DinVlHue+arj/3yW2jCX7No3wpqfQjyFCVYdLNFW2jOIZyNqfeW2JBgigYL9ol
         ystg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680868069; x=1683460069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmipLli4Us/FqANzcc2OCDfSEPf0SUwkXLA0R/wFWgo=;
        b=DtnNfOO/wTM3IJU5kFnJd3yuLNvUl+xPpm9ZaGuPVe0TcWYTLzATqdxHJMXkmw1Rt0
         73QcCJMp4++2h5+yNLSKsFev0WTkJCYKnxRbd9VnFhzIa/HJjiZqu9EMvqBvhUOM5cJX
         QEL10egvF19eqqmSJHUUOOQJI6vmdxIkjHf56n1A8tZ0aCpQgLK9HJ9EDmEtIarH2gmY
         LRpaStzuiw5e6PV7ZEibWpxcu8YtzDYnj+eNSkPJBA9iRu3v12ieGshXFabNgrZahSp2
         +7YwbIug/EkugWnWRtO5Qya249tO3M+pQrn9MWnyDkXLnLuzlzDGCo6JMzq+gDB+7Ris
         02wg==
X-Gm-Message-State: AAQBX9cIDdupP1U0ikXvyD8myraGVbVc/ZZpef+oNwLSyT1Pj8ohgHqN
	X/zmngZssj/yKJRoi1A6ilieWRqFfXRNzL119+1YJg==
X-Google-Smtp-Source: AKy350ZOlDx3XxIfDSFLVV2843I3bVy/kExtjyifE42Awnez8JgMoMrKcAS3jAZVCcHoY64JtIWcOf405F1XeZWI+7g=
X-Received: by 2002:a17:906:2ec8:b0:948:9d51:f398 with SMTP id
 s8-20020a1709062ec800b009489d51f398mr866620eji.13.1680868069046; Fri, 07 Apr
 2023 04:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230322192858.1189272-1-ajones@ventanamicro.com> <20230322192858.1189272-2-ajones@ventanamicro.com>
In-Reply-To: <20230322192858.1189272-2-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Apr 2023 17:17:37 +0530
Message-ID: <CAAhSdy1f2Sa8rje5V31xdzCOfjaFHzowpmp-2bBqQ-_LFNTMcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: KVM: Alphabetize selects
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_044751_659751_98397E90 
X-CRM114-Status: GOOD (  12.13  )
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

T24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgMTI6NTnigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdoaWxlIGFscGhhYmV0aXplZCBsaXN0cyB0ZW5k
IHRvIGJlY29tZSB1bmFscGhhYmV0aXplZCBhbG1vc3QKPiBhcyBxdWlja2x5IGFzIHRoZXkgZ2V0
IGZpeGVkIHVwLCBpdCBpcyBwcmVmZXJyZWQgdG8ga2VlcCBzZWxlY3QKPiBsaXN0cyBpbiBLY29u
ZmlncyBpbiBvcmRlci4gTGV0J3MgZml4IEtWTSdzIHVwLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KClJldmlld2VkLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYu
NAoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9LY29uZmlnIHwgMTAgKysr
KystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL0tjb25maWcgYi9hcmNoL3Jpc2N2L2t2
bS9LY29uZmlnCj4gaW5kZXggZDVhNjU4YTA0N2E3Li41YmNiMmQ1MTliOTUgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9rdm0vS2NvbmZpZwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL0tjb25maWcK
PiBAQCAtMjAsMTQgKzIwLDE0IEBAIGlmIFZJUlRVQUxJWkFUSU9OCj4gIGNvbmZpZyBLVk0KPiAg
ICAgICAgIHRyaXN0YXRlICJLZXJuZWwtYmFzZWQgVmlydHVhbCBNYWNoaW5lIChLVk0pIHN1cHBv
cnQgKEVYUEVSSU1FTlRBTCkiCj4gICAgICAgICBkZXBlbmRzIG9uIFJJU0NWX1NCSSAmJiBNTVUK
PiArICAgICAgIHNlbGVjdCBIQVZFX0tWTV9FVkVOVEZECj4gKyAgICAgICBzZWxlY3QgSEFWRV9L
Vk1fVkNQVV9BU1lOQ19JT0NUTAo+ICsgICAgICAgc2VsZWN0IEtWTV9HRU5FUklDX0RJUlRZTE9H
X1JFQURfUFJPVEVDVAo+ICAgICAgICAgc2VsZWN0IEtWTV9HRU5FUklDX0hBUkRXQVJFX0VOQUJM
SU5HCj4gLSAgICAgICBzZWxlY3QgTU1VX05PVElGSUVSCj4gLSAgICAgICBzZWxlY3QgUFJFRU1Q
VF9OT1RJRklFUlMKPiAgICAgICAgIHNlbGVjdCBLVk1fTU1JTwo+IC0gICAgICAgc2VsZWN0IEtW
TV9HRU5FUklDX0RJUlRZTE9HX1JFQURfUFJPVEVDVAo+ICAgICAgICAgc2VsZWN0IEtWTV9YRkVS
X1RPX0dVRVNUX1dPUksKPiAtICAgICAgIHNlbGVjdCBIQVZFX0tWTV9WQ1BVX0FTWU5DX0lPQ1RM
Cj4gLSAgICAgICBzZWxlY3QgSEFWRV9LVk1fRVZFTlRGRAo+ICsgICAgICAgc2VsZWN0IE1NVV9O
T1RJRklFUgo+ICsgICAgICAgc2VsZWN0IFBSRUVNUFRfTk9USUZJRVJTCj4gICAgICAgICBzZWxl
Y3QgU1JDVQo+ICAgICAgICAgaGVscAo+ICAgICAgICAgICBTdXBwb3J0IGhvc3RpbmcgdmlydHVh
bGl6ZWQgZ3Vlc3QgbWFjaGluZXMuCj4gLS0KPiAyLjM5LjIKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
