Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF1EC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 14:29:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05DD120DD4
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 14:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sh1Qk/Fb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="pbBPv/Zf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05DD120DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RZcWRc1UmyUzVCfFJqx3bq+UHM+hjrJARghwnEVpQLk=; b=Sh1Qk/FbCefNxTlFimSQTtT47
	8fV0zK/ylYtSkpoi3Eogty7+UeeS/s74Yw93Ou4BcbRzPfUkvGbfem/SpJWeKtO7kYBYamUAfiORV
	cjvrQLibXGnqmPRijZnAJTeVbd0nKgdV+s8Kzv0v20DwsOyLJBETiFMDTx6xY1SdiU6BvcG4wmx7e
	IzSWYfTt6UpGg7W3NMTJb69b9BKLzQbQ0Z0xXMTtr+D/ylp4zt+X+ybRLdB707jN5yPf+9IikNmJh
	txX9IKIaWAYU+Ty8aQEcHD9R3rbG/tK2ffIzmhGkaCn+YwEVKCuOUZgI7KVKz1et8o5Y83viFlhUs
	MmR1B+Dtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jopLs-0007ts-M8; Fri, 26 Jun 2020 14:29:12 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jopLn-0007qZ-IX
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 14:29:08 +0000
Received: by mail-qt1-x841.google.com with SMTP id h23so7618183qtr.0
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eLVHWQWk1SSSBHBVpMH1pv4y2o7pnoH/LjhqcMoV61E=;
 b=pbBPv/ZfquVY+1nbrGUTQ97tUGXF1nfs9YSbzSwbUgSCV0B/tnAhXFtkx/Vk+V2ly0
 2cIuZSca4qM51OHpjluJsW6T/vAsr3I7/U1RQsomAweCk212f+J+WReARHDAJge5Snrw
 vgtyPTqz+5ExK40S+KMCwAMc4ruBN3ON55/6asBJGjBpfEfojhC6SVCyLcSi20hDWJdo
 W04DGHZ8Q/0+6VNj0eSZM7tpiPet29vls5CIqD+zTKASy5gM0c7wGRTPpqi+VoG5Aina
 RDLKvBAJsqvPlh7qeLXvgo8JR0sysqF5jWoeClHfano8r2XtzEps/Tcht8OUnFmSqPig
 QsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eLVHWQWk1SSSBHBVpMH1pv4y2o7pnoH/LjhqcMoV61E=;
 b=bLD4Z/Xs1h0Ocgd4UCxEVcKivq5PUJs1cghtSpZIu7Fyxcp8o8lrDE9WIUKABF3x5p
 hZ1URYUK4WQXK0eDvXNX0Dm964Sjy10bRJN47rsTiGAyvwVIes8UiyJW7NpLmN0BTNOo
 28Ni8QRnj3Wm9D+yIXNtSerVxfgPVHb61+Q42ePStgfcvP4YZ55IzqQ7+QJtWL0kogMx
 ZqSO1KuknUhdNSCSfgt7smehHGgYO09zxy0onDCxy10wA1s1xkryZNvH6b0YfJBiKSX7
 FI5dHdCicyOiSCIIXlWd6oYtTkSgJsw2DAY4YoxbN1ENpeHPRwW0oUH9D/79YEqBGQAm
 XBAQ==
X-Gm-Message-State: AOAM531zla8tPdGXTBM83i/AXzvMNinQ7RJAvUgLHzdkf/QaGTtHwt/4
 V7HTu5RjDgb0FdFyTI8/0bP2r/jv9jV3z3gIzOjT1Q==
X-Google-Smtp-Source: ABdhPJx+CuQHQu45R0dHB8cK5wbKlRpVevV5VmxeywBJQbQ86qydwjJXCEbaiEzS/sMMG+9ifC4icG/s9ovLltgSxZ4=
X-Received: by 2002:ac8:260b:: with SMTP id u11mr3074244qtu.380.1593181745726; 
 Fri, 26 Jun 2020 07:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200625183941.23093-1-tklauser@distanz.ch>
 <20200626124056.29708-1-tklauser@distanz.ch>
In-Reply-To: <20200626124056.29708-1-tklauser@distanz.ch>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 26 Jun 2020 16:28:54 +0200
Message-ID: <CACT4Y+ZqbsyCQp8NJq9=TFvu92EMysQRyVe6yyarHhR2L2M4RQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: Allow building with kcov coverage
To: Tobias Klauser <tklauser@distanz.ch>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMjYsIDIwMjAgYXQgMjo0MCBQTSBUb2JpYXMgS2xhdXNlciA8dGtsYXVzZXJA
ZGlzdGFuei5jaD4gd3JvdGU6Cj4KPiBBZGQgQVJDSF9IQVNfS0NPViBhbmQgSEFWRV9HQ0NfUExV
R0lOUyB0byB0aGUgcmlzY3YgS2NvbmZpZy4KPiBBbHNvIGRpc2FibGUgaW5zdHJ1bWVudGF0aW9u
IG9mIHNvbWUgZWFybHkgYm9vdCBjb2RlIGFuZCB2ZHNvLgo+Cj4gQm9vdC10ZXN0ZWQgb24gUUVN
VSdzIHJpc2N2NjQgdmlydCBtYWNoaW5lLgo+Cj4gQ2M6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuLnRv
cGVsQGdtYWlsLmNvbT4KPiBDYzogRG1pdHJ5IFZ5dWtvdiA8ZHZ5dWtvdkBnb29nbGUuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFRvYmlhcyBLbGF1c2VyIDx0a2xhdXNlckBkaXN0YW56LmNoPgoKCkFz
c3VtaW5nIGl0IGJvb3RzIG5vdyA6KQoKQWNrZWQtYnk6IERtaXRyeSBWeXVrb3YgPGR2eXVrb3ZA
Z29vZ2xlLmNvbT4KCj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgfCAy
ICsrCj4gIGFyY2gvcmlzY3YvYm9vdC9NYWtlZmlsZSAgICAgICAgfCAyICsrCj4gIGFyY2gvcmlz
Y3Yva2VybmVsL3Zkc28vTWFrZWZpbGUgfCAxICsKPiAgYXJjaC9yaXNjdi9tbS9NYWtlZmlsZSAg
ICAgICAgICB8IDIgKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRl
eCAwODkyOTNlNGFkNDYuLmE3ZDdmODE4NGYxNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tj
b25maWcKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtMTksNiArMTksNyBAQCBjb25m
aWcgUklTQ1YKPiAgICAgICAgIHNlbGVjdCBBUkNIX0hBU19ERUJVR19XWAo+ICAgICAgICAgc2Vs
ZWN0IEFSQ0hfSEFTX0dDT1ZfUFJPRklMRV9BTEwKPiAgICAgICAgIHNlbGVjdCBBUkNIX0hBU19H
SUdBTlRJQ19QQUdFCj4gKyAgICAgICBzZWxlY3QgQVJDSF9IQVNfS0NPVgo+ICAgICAgICAgc2Vs
ZWN0IEFSQ0hfSEFTX01NSU9XQgo+ICAgICAgICAgc2VsZWN0IEFSQ0hfSEFTX1BURV9TUEVDSUFM
Cj4gICAgICAgICBzZWxlY3QgQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVAKPiBAQCAtNTcsNiArNTgs
NyBAQCBjb25maWcgUklTQ1YKPiAgICAgICAgIHNlbGVjdCBIQVZFX0RNQV9DT05USUdVT1VTIGlm
IE1NVQo+ICAgICAgICAgc2VsZWN0IEhBVkVfRUJQRl9KSVQgaWYgTU1VCj4gICAgICAgICBzZWxl
Y3QgSEFWRV9GVVRFWF9DTVBYQ0hHIGlmIEZVVEVYCj4gKyAgICAgICBzZWxlY3QgSEFWRV9HQ0Nf
UExVR0lOUwo+ICAgICAgICAgc2VsZWN0IEhBVkVfR0VORVJJQ19WRFNPIGlmIE1NVSAmJiA2NEJJ
VAo+ICAgICAgICAgc2VsZWN0IEhBVkVfUENJCj4gICAgICAgICBzZWxlY3QgSEFWRV9QRVJGX0VW
RU5UUwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2
L2Jvb3QvTWFrZWZpbGUKPiBpbmRleCAzNTMwYzU5YjNlYTcuLmM1OWZjYTY5NWY5ZCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3Qv
TWFrZWZpbGUKPiBAQCAtMTQsNiArMTQsOCBAQAo+ICAjIEJhc2VkIG9uIHRoZSBpYTY0IGFuZCBh
cm02NCBib290L01ha2VmaWxlLgo+ICAjCj4KPiArS0NPVl9JTlNUUlVNRU5UIDo9IG4KPiArCj4g
IE9CSkNPUFlGTEFHU19JbWFnZSA6PS1PIGJpbmFyeSAtUiAubm90ZSAtUiAubm90ZS5nbnUuYnVp
bGQtaWQgLVIgLmNvbW1lbnQgLVMKPgo+ICB0YXJnZXRzIDo9IEltYWdlIGxvYWRlcgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJu
ZWwvdmRzby9NYWtlZmlsZQo+IGluZGV4IDI5Y2YwNTJmNjU0MS4uNGIwZDNiY2M0NGU1IDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCj4gQEAgLTI5LDYgKzI5LDcgQEAgQ1BQRkxBR1NfdmRz
by5sZHMgKz0gLVAgLUMgLVUkKEFSQ0gpCj4KPiAgIyBEaXNhYmxlIGdjb3YgcHJvZmlsaW5nIGZv
ciBWRFNPIGNvZGUKPiAgR0NPVl9QUk9GSUxFIDo9IG4KPiArS0NPVl9JTlNUUlVNRU5UIDo9IG4K
Pgo+ICAjIEZvcmNlIGRlcGVuZGVuY3kKPiAgJChvYmopL3Zkc28ubzogJChvYmopL3Zkc28uc28K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvbW0vTWFr
ZWZpbGUKPiBpbmRleCAzNjNlZjAxYzMwYjEuLmMwMTg1ZTU1NmNhNSAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L21tL01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9NYWtlZmlsZQo+IEBA
IC01LDYgKzUsOCBAQCBpZmRlZiBDT05GSUdfRlRSQUNFCj4gIENGTEFHU19SRU1PVkVfaW5pdC5v
ID0gLXBnCj4gIGVuZGlmCj4KPiArS0NPVl9JTlNUUlVNRU5UX2luaXQubyA6PSBuCj4gKwo+ICBv
YmoteSArPSBpbml0Lm8KPiAgb2JqLXkgKz0gZXh0YWJsZS5vCj4gIG9iai0kKENPTkZJR19NTVUp
ICs9IGZhdWx0Lm8gcGFnZWF0dHIubwo+IC0tCj4gMi4yNy4wCj4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
