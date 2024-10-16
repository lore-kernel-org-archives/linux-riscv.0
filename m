Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7207D2F7C5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 21:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9hBWy1TNPx+WSRZ8Co6OMWdeSytGT7GcmpkllLXYnY=; b=4M0yxrzy7N0oiP
	LU3fvy7TAEmjptZo93Jc0OC1cuUobhlgvFoKGK80Ehg8ziq1rl0Qn9KcSggwFdqFAXZjM4lcVqDoB
	OZ04gj/nZVHJaE6Ejc3mdLY5sEzzkbjcRJJ/5Cbf+jp9dZSRqvX+byiSi8/VHqJmozfqJ46bMZUAa
	4WFlwUr63kiwz6kleswqdf2VYwBAuDkTk01AHsAdQ2VB8JI2GUVSnJFuDaV2jNOj9oKhfw37Y2Iet
	1SbdGHHiPKDh5xXjIrZw6b5LyB7zYJMizRP20NKRoCqaUoDh9En93mLs5MpRXMo60Q6i3Dmp6G/q1
	noA3BEe9Ed6EU0n3OuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Bkx-0000000D4cu-3PsE;
	Wed, 16 Oct 2024 21:40:35 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Bkw-0000000D4be-0mq7
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 21:40:35 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539fbbadf83so375348e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 14:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1729114832; x=1729719632; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aK/FMBO41F0k5XVWKFVW2dU30aEpK/ecSDxmrBc+uhE=;
        b=KJ5qgEMYKuFzfooPzjuQCPZdjCAdlWrJ3S51kidqM4OExHHhItCxaCdZ0RNkzSREu9
         FLGJNBfM4lCgGiuGCiHRvRNqbdfjw7iobc0O61c0YRh81iPXV06kfB/LPb2Raa48IvlP
         b6/Vhg/JzTMW6A+5fsaehmTepht+SYC93WsOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729114832; x=1729719632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aK/FMBO41F0k5XVWKFVW2dU30aEpK/ecSDxmrBc+uhE=;
        b=HvvA9jVRuY2f/bbuJZ9E2av3+Ss7vMsT6K5FtNHvdt+qMGgFZUAHcjT1iEHpTdnX7c
         nKpvp3aW9XnwOhW2uY+JrlrWMtqdiIEYCB7VDdySJmBXv9Ozq76XEx4U5F1Pnlg1KPym
         dr4yweeu+1YR+5KCKCMZp85Gr9i/icbKHCt9QJ/lDcdFoK9kKiegsQzxLcuio7mEddwO
         fjL/J+DMQOJ33Ii2Gj7r+XfPqk8TCFn69cUyTzM80Rqaj6d7+j5T9Z3ImUeMDnDwOUrs
         wXM7F+yFIU0YegBzxSo+dR1k3pHdiHfxfnbIRk6iwBABjYm0MXtrwYlSam6/S/HKiPUr
         ScLg==
X-Forwarded-Encrypted: i=1; AJvYcCWcFLuGIiigcswmp/A71sXRMYMlnbs6CwOiso0+2pdTTbrZatJv/gKo0eZGXAGwECe3eKyo2bqaoFGMGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlLg3DIT91ODHVKX5zNuCsrzRYKoi2PFkvs/YfRA2Nj1nHzGO3
	9UZG2J5fN3mreparcMnv1D7YisM0qBK73xBJczl5SRJh4VfkhrPSVaC13JWsdDuuMohQvA/2/YN
	F51zEYMO/uTHSRXJ9CMyy/HpK8IoRVzOifKxG0yD5jtzJ0dc=
X-Google-Smtp-Source: AGHT+IHm+rppT2jBLrv4MJVazg4/+Wq/0WmR8zBCpedbjekw1BVdrrjEVCQASyp+Ge+wyK6mNgZuORoIrxTa5tX2vRE=
X-Received: by 2002:a05:6512:3e1f:b0:539:fa3d:a73 with SMTP id
 2adb3069b0e04-539fa3d0be6mr6343173e87.39.1729114831422; Wed, 16 Oct 2024
 14:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240719160913.342027-1-apatel@ventanamicro.com> <20240719160913.342027-7-apatel@ventanamicro.com>
In-Reply-To: <20240719160913.342027-7-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 16 Oct 2024 14:40:20 -0700
Message-ID: <CAOnJCUKugAua2ooQL5tJCNFr27pCrsQ53YJuKEs11UYJdVkAPw@mail.gmail.com>
Subject: Re: [PATCH 06/13] RISC-V: KVM: Don't setup SGEI for zero guest
 external interrupts
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_144034_311229_A78ABD9B 
X-CRM114-Status: GOOD (  14.46  )
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
YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE5vIG5lZWQgdG8gc2V0dXAgU0dFSSBsb2NhbCBpbnRl
cnJ1cHQgd2hlbiB0aGVyZSBhcmUgemVybyBndWVzdAo+IGV4dGVybmFsIGludGVycnVwdHMgKGku
ZS4gemVybyBIVyBJTVNJQyBndWVzdCBmaWxlcykuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBh
dGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlh
LmMgfCA5ICsrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+
IGluZGV4IDE3YWU0YTdjMGU5NC4uOGZmYWUwMzMwYzg5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlz
Y3Yva3ZtL2FpYS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBAQCAtNDk5LDYgKzQ5
OSwxMCBAQCBzdGF0aWMgaW50IGFpYV9oZ2VpX2luaXQodm9pZCkKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBoZ2N0cmwtPmZyZWVfYml0bWFwID0gMDsKPiAgICAgICAgIH0KPgo+ICsgICAgICAg
LyogU2tpcCBTR0VJIGludGVycnVwdCBzZXR1cCBmb3IgemVybyBndWVzdCBleHRlcm5hbCBpbnRl
cnJ1cHRzICovCj4gKyAgICAgICBpZiAoIWt2bV9yaXNjdl9haWFfbnJfaGdlaSkKPiArICAgICAg
ICAgICAgICAgZ290byBza2lwX3NnZWlfaW50ZXJydXB0Owo+ICsKPiAgICAgICAgIC8qIEZpbmQg
SU5UQyBpcnEgZG9tYWluICovCj4gICAgICAgICBkb21haW4gPSBpcnFfZmluZF9tYXRjaGluZ19m
d25vZGUocmlzY3ZfZ2V0X2ludGNfaHdub2RlKCksCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgRE9NQUlOX0JVU19BTlkpOwo+IEBAIC01MjIsMTEgKzUyNiwxNiBA
QCBzdGF0aWMgaW50IGFpYV9oZ2VpX2luaXQodm9pZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IHJjOwo+ICAgICAgICAgfQo+Cj4gK3NraXBfc2dlaV9pbnRlcnJ1cHQ6Cj4gICAgICAgICByZXR1
cm4gMDsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIGFpYV9oZ2VpX2V4aXQodm9pZCkKPiAgewo+ICsg
ICAgICAgLyogRG8gbm90aGluZyBmb3IgemVybyBndWVzdCBleHRlcm5hbCBpbnRlcnJ1cHRzICov
Cj4gKyAgICAgICBpZiAoIWt2bV9yaXNjdl9haWFfbnJfaGdlaSkKPiArICAgICAgICAgICAgICAg
cmV0dXJuOwo+ICsKPiAgICAgICAgIC8qIEZyZWUgcGVyLUNQVSBTR0VJIGludGVycnVwdCAqLwo+
ICAgICAgICAgZnJlZV9wZXJjcHVfaXJxKGhnZWlfcGFyZW50X2lycSwgJmFpYV9oZ2VpKTsKPiAg
fQo+IC0tCj4gMi4zNC4xCj4KCgpSZXZpZXdlZC1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZv
c2luYy5jb20+Ci0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
