Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7482DE77188
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Dec 2024 05:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiWzNsYmUmOivM0TAWQNZFrEUnPvykBtUDW2XmsA8zI=; b=RKrYZfFpWxTB7J
	JGC6e1Ef8bV02ocxlrmKrbzX4oRs5qKzke2RjE4xndmY6dVw5JYxQkv2bVAwKrxfB/OduyWW2cJ/E
	pmWEM0S1CA7zo1p8XEZoHOxOhgLui+VP90z+gA0CCEDTxOgEoNDI2y5zOW4+XXXwcaKHzl6JnWz5k
	1GvQFvuTR6Wv+9fC5MxDULTvLwzFdfmqk+wmZ2JKmf3NTqz3XzADG8tUpk2KKKXphKz7eUGyVE6+j
	aA5HD12eG/P+DhWISXV9u8n39RrwiDp+4lGzmXzzvB9IhD96a+v+ajoUVEtxVVxIDRuGtzAeSt1LV
	76Mp+Jo4mdShJnQTLKgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQggM-0000000FEou-397q;
	Thu, 26 Dec 2024 05:45:14 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQggI-0000000FEnm-3DyP
	for linux-riscv@lists.infradead.org;
	Thu, 26 Dec 2024 05:45:12 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3a9628d20f0so46709425ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Dec 2024 21:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1735191909; x=1735796709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jtyao9XCxuyrcti0Hf6VyClk0WR8AztwUzkNYeymagE=;
        b=pS++N5JDSq7V790cdLlQIfVIJOPd/MRKAtcpGiMMkEfXhfcyNUkpYjiKCe/j+86K1F
         L/SdToio9x/qgMKDfStJ9DytZv5XXGhaeWDl6b33Ov9YEkHVOa63Pu9b01NQtGqiZFxL
         Zl7zlRWtbPftFP5fyL4sdxpQNuycJ0jCNx8it4hXilPhFfSTUHMczOSus973kbg4o+FK
         5NG1TEgZTBB+7Pd7SP1OnON7w6bcOM5f6KUudYDKWjA8q2xiLCCms8/rnzEK7WRKHnpC
         EvkV+WLhckzB7w1LpNkds7pR+Box1p9tIt4FXLh4mfJijYwFhIgkAikxrr6Hi+9db+Ph
         GEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735191909; x=1735796709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtyao9XCxuyrcti0Hf6VyClk0WR8AztwUzkNYeymagE=;
        b=LT7FqEtCZdnwmhz4y4ZjnwBjKmCfFceByRtNoayks7rxdmu32ZGntRz/z5YqKKU7IH
         5JXatMYhQv1dX0PcmWPevJ0Kc7l0zc/FNupTjRCVNFn1JmMoruq4qokQLLW7FhBv9cmc
         eZxuYVBTzXpS1KPR97pDV03A+ovSu877E98Vahrgvk0hEb4p5KyNpwdxD+aQifoDFft6
         j5m+GrAqt6FSVbMeGcKZI/k6xTEMg/QYwqOB4W9LXhEzkippnQGgr+ZWJFK9jups56i4
         Tdd7hlZnKBPDVJkITqtGZJWvEAJ9Et6aleUOXK8XTHpuViPXlIFQpabsmjTvrd4V7Xms
         PDXA==
X-Forwarded-Encrypted: i=1; AJvYcCVmzVuEK4s1382TBjwYEpe8gjvxvSwa3J2CAHOez7VFWtCAgtGwUagqQCj0WFRhdWnTnPT3YtSKWHPnoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6DwXqam/LXeaXxKfUYbZ4e8Lj9p/58i/kFfhsc/B3V+x1Dth+
	/dphPhrLE1oSTne4Gj4sRa3nOheZ/T2wyHy43RC4K+x34sxb2gYGr401Qt8Xvlvk7nRO0YEami4
	s5tMlywTuo41iIYUPMpj80bbphaG8bRZ7+kPMww==
X-Gm-Gg: ASbGnct1n40/P4xSfxvO9sPLPzyA1W4Q5c4CVP4Ay9Y0wJMDuR0U61jmu//bTRDCfGf
	QFc54rN78oF96EJ0JaZKJuz8wTEfylvvL4IM6THU=
X-Google-Smtp-Source: AGHT+IH6nTvJDAU6yLG9KF1CpMHiiYEaH6tsSIwR7GjbeccZhTbSi1E4UP7pA8+hFaBPCq5M2TKrAVu5a9b2j+IbiRM=
X-Received: by 2002:a05:6e02:2185:b0:3a7:c072:c69a with SMTP id
 e9e14a558f8ab-3c2d1c919b7mr205304125ab.3.1735191909080; Wed, 25 Dec 2024
 21:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
In-Reply-To: <20241224-kvm_guest_stat-v2-0-08a77ac36b02@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Dec 2024 11:14:56 +0530
X-Gm-Features: AbW1kvYzlavyORKjBXtG1i2VfPZykEW7uxAUbLOaIZK7inugX45lU3EM1rz5dco
Message-ID: <CAAhSdy1whfogfDAZaDK9YCTSFw_+qYR3+nHGhAg=3EqZ-_4E1A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Collect guest/host statistics during the
 redirected traps
To: Atish Patra <atishp@rivosinc.com>
Cc: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_214511_023215_C1B6945A 
X-CRM114-Status: GOOD (  14.84  )
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

T24gV2VkLCBEZWMgMjUsIDIwMjQgYXQgMjozNOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEFzIGRpc2N1c3NlZCBpbiB0aGUgcGF0Y2hbMV0sIHRoaXMg
c2VyaWVzIGFkZHMgdGhlIGhvc3Qgc3RhdGlzdGljcyBmb3IKPiB0cmFwcyB0aGF0IGFyZSByZWRp
cmVjdGVkIHRvIHRoZSBndWVzdC4gU2luY2UgdGhlcmUgYXJlIDEtMSBtYXBwaW5nIGZvcgo+IGZp
cm13YXJlIGNvdW50ZXJzIGFzIHdlbGwsIHRoaXMgc2VyaWVzIGVuYWJsZXMgdGhvc2Ugc28gdGhh
dCB0aGUgZ3Vlc3QKPiBjYW4gY29sbGVjdCBpbmZvcm1hdGlvbiBhYm91dCB0aGVzZSBleGl0cyB2
aWEgcGVyZiBpZiByZXF1aXJlZC4KPgo+IEkgaGF2ZSBpbmNsdWRlZCB0aGUgcGF0Y2hbMV0gYXMg
d2VsbCBpbiB0aGlzIHNlcmllcyBhcyBpdCBoYXMgbm90IGJlZW4KPiBhcHBsaWVkIGFuZCB0aGVy
ZSB3aWxsIGJlIGxpa2VseSBjb25mbGljdHMgd2hpbGUgbWVyZ2luZyBib3RoLgo+Cj4gU2lnbmVk
LW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNocEByaXZvc2luYy5jb20+Cj4gLS0tCj4gQ2hhbmdl
cyBpbiB2MjoKPiAtIEltcHJvdmVkIGNvbW1pdCBtZXNzYWdlcyBpbiBQQVRDSDMuCj4gLSBBZGRl
ZCBSQiB0YWdzLgo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0
MTIxMi1rdm1fZ3Vlc3Rfc3RhdC12MS0wLWQxYTZkMGM4NjJkNUByaXZvc2luYy5jb20KPgo+IC0t
LQo+IEF0aXNoIFBhdHJhICgyKToKPiAgICAgICBSSVNDLVY6IEtWTTogVXBkYXRlIGZpcm13YXJl
IGNvdW50ZXJzIGZvciB2YXJpb3VzIGV2ZW50cwo+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQgbmV3
IGV4aXQgc3RhdHN0aWNzIGZvciByZWRpcmVjdGVkIHRyYXBzCj4KPiBRdWFuIFpob3UgKDEpOgo+
ICAgICAgIFJJU0MtVjogS1ZNOiBSZWRpcmVjdCBpbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQgdHJh
cCB0byBndWVzdAoKUXVldWVkIHRoaXMgc2VyaWVzIGZvciBMaW51eC02LjE0LgoKVGhhbmtzLApB
bnVwCgo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICA1ICsrKysrCj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8ICA3ICsrKysrKy0KPiAgYXJjaC9y
aXNjdi9rdm0vdmNwdV9leGl0LmMgICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IGZhYzA0ZWZjNWM3OTNkY2NiZDA3ZTJkNTlh
ZjlmOTBiN2ZjMGRjYTQKPiBjaGFuZ2UtaWQ6IDIwMjQxMjEyLWt2bV9ndWVzdF9zdGF0LWJjNDY5
NjY1YjQxMAo+IC0tCj4gUmVnYXJkcywKPiBBdGlzaCBwYXRyYQo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
