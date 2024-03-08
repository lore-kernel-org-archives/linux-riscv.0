Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCFCC5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 05:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9f4o2FZm5t8SPjfRd843tHGHHFwXFS4QM4Tl2KTOZPM=; b=hbo8+QwF2/Z46N
	csQuNKxY4TccnqlkGHSwME4rWZBJDH0jnoNbXkPRWd7ZmVUDel/Hy6rb2uXbfMhJ1Xz5cCmH+GPrL
	Ca03tWIpC34ITnQOSwNwR5PF6kbZ/VorfKXkggwkZEaI5h7yy3u0RsYpYUMuNS/b3tQNDhX7zasry
	jYPsWwYId8u985l/z0S9gu2xRB2MJNYR8O2ng2MBghwPoUczlSK/LrpH0mQod3b42No8FFW/HKxq6
	k7Ym0QGXAfC/T5hPk82VwHL9OnvU6AbAWHXg0E5sxCc6uUroXNpf/x9xVDuIYGKDY1QR9FrYpOlpG
	roj9zsWD+tvgzCwwJlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riSdk-00000007qY6-3oN8;
	Fri, 08 Mar 2024 05:19:28 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riSdh-00000007qW5-0D6N
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 05:19:26 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3662e41370fso186355ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 21:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1709875161; x=1710479961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Q1pOxUwOp5itp+TMEHjsIEi+PFZvIZX6/sMKOzN+aM=;
        b=ChZd5HVhi/NLg45p/DJqF5VUGDBwmZCXAoROAMJcQW39Ntd/5k75sdpsFY9kyJyJQw
         aN0BBBLYbM1Oshxc9P7mseIteQzplGyIf7PuqvJ07nRC4ueCtwfdznha690B1R7pXHjF
         IBv+YfxfWcBATWMIKH/jgsDat8nuk9JHvMlILqpUz1hcrBki/wTYLu79plvbUOOxbdDT
         BdChzm3bjoXN3vMU2VT9oj5YeFy00UDLxjQEq1OklEYqnBwEcYv1JLq6zirZHGS1mNtv
         uJCpeRZ0UYqFqXeodUYZvcy5vmIrHRiDhFRQmqbeAMcepW67Xno4hT35l1thAmPBS0Ns
         txtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709875161; x=1710479961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Q1pOxUwOp5itp+TMEHjsIEi+PFZvIZX6/sMKOzN+aM=;
        b=EBSEyLECzkq+5wAGPeLFMnOr465aUJ6otK90z3dBT9ZheFhF8+6G391sxe70WN0vvZ
         mGXAH0WZm9F2hA1ReWP184MTcB//7uwT6Sh4szcfcIlCGX+uzZBrieda1UsC4l1rxOsJ
         0tHnN06ytkozOq6M/MSiYSVh5vd3ga7cRH1x2IWRTAWO85yWIPZPL4dm8Soy+wou4i25
         OEQSEI/yoGaPZ6zr9XrRy5iY+Vkw1NtOjIyYaFK/y9KgAuJYRp2aIZq8eJrA4EJwcw3x
         ofgKfmtREGPMGF3jBHXVD8ncD6fxyxfcVzWylJAxIyrDgkkY+MxSDjoQ1oMjKoTASH8p
         e8/A==
X-Forwarded-Encrypted: i=1; AJvYcCU73H+x4qs8SUmE5gp3Kq9puxJAnTEyzA64dQhLEd0pCvztolcP5Y7NDyJBLTNip9tMcw+zRuOnmHF3joGtyvt1pIz2bG8s+OjniRF//elR
X-Gm-Message-State: AOJu0YwBU8Fdc0HU2DTPqRQNhAH5OzVWzmP2ESWjzZER1bUYv5mZ02DU
	JLzU0V07lWifOuFZyfK35dky0Dyzk63jSMKsgs4tDsgM7DN7QLZbARd4pPrT6c26sKn5lITYCto
	Mrw1umGW1jWT7hdlIXQhUr8N89fKIJiV9g/U7gA==
X-Google-Smtp-Source: AGHT+IGGNpCpXwkQjWIuGNKUjBb878ACq22fLX85aTMVIeV0LGFHGYH4vpYBvsarm+l3VNkirWWt6u0qF+Xk02D/r0A=
X-Received: by 2002:a05:6e02:1807:b0:365:69a:86b2 with SMTP id
 a7-20020a056e02180700b00365069a86b2mr27431076ilv.17.1709875161075; Thu, 07
 Mar 2024 21:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20240307081951.1954830-1-colin.i.king@gmail.com> <Zeo8_ulDb4wYI_rO@linux.dev>
In-Reply-To: <Zeo8_ulDb4wYI_rO@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 8 Mar 2024 10:49:09 +0530
Message-ID: <CAAhSdy0YHP4xWNz3W2tVE=-Wwtxe6r+-YKd+ytWreKEn7euGxA@mail.gmail.com>
Subject: Re: [PATCH][next] KVM: selftests: Fix spelling mistake "trigged" -> "triggered"
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Colin Ian King <colin.i.king@gmail.com>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_211925_393794_6C1AF574 
X-CRM114-Status: GOOD (  16.26  )
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

T24gRnJpLCBNYXIgOCwgMjAyNCBhdCAzOjQ34oCvQU0gT2xpdmVyIFVwdG9uIDxvbGl2ZXIudXB0
b25AbGludXguZGV2PiB3cm90ZToKPgo+IFRoYW5rcyBmb3IgdGhlIGZpeCBDb2xpbi4gUGFvbG8v
QW51cCwgdXAgdG8geW91IGhvdyB5b3Ugd2FudCB0byBwbGF5IGl0LAo+IEkgc2VlIHRoZSA2Ljkg
UFIgaXMgYWxyZWFkeSBvdXQgZm9yIHJpc2N2Lgo+Cj4gQWNrZWQtYnk6IE9saXZlciBVcHRvbiA8
b2xpdmVyLnVwdG9uQGxpbnV4LmRldj4KCkkgY2FuIHRha2UgdGhpcyBhcyBhIExpbnV4LTYuOS1y
Y1ggZml4IGlmIGV2ZXJ5b25lIGlzIG9rYXkgd2l0aCBpdC4KClJlZ2FyZHMsCkFudXAKCj4KPiBP
biBUaHUsIE1hciAwNywgMjAyNCBhdCAwODoxOTo1MUFNICswMDAwLCBDb2xpbiBJYW4gS2luZyB3
cm90ZToKPiA+IFRoZXJlIGFyZSBzcGVsbGluZyBtaXN0YWtlcyBpbiBfX0dVRVNUX0FTU0VSVCBt
ZXNzYWdlcy4gRml4IHRoZW0uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcg
PGNvbGluLmkua2luZ0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vYWFyY2g2NC9hcmNoX3RpbWVyLmMgfCAyICstCj4gPiAgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL3Jpc2N2L2FyY2hfdGltZXIuYyAgIHwgMiArLQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vYWFyY2g2NC9hcmNoX3RpbWVyLmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vYWFyY2g2NC9hcmNoX3RpbWVyLmMKPiA+IGluZGV4IGRk
YmEyYzJmYjVkZS4uMTZhYzc0ZDA3ZDY4IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2FhcmNoNjQvYXJjaF90aW1lci5jCj4gPiArKysgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0vYWFyY2g2NC9hcmNoX3RpbWVyLmMKPiA+IEBAIC0xMzYsNyArMTM2LDcg
QEAgc3RhdGljIHZvaWQgZ3Vlc3RfcnVuX3N0YWdlKHN0cnVjdCB0ZXN0X3ZjcHVfc2hhcmVkX2Rh
dGEgKnNoYXJlZF9kYXRhLAo+ID4gICAgICAgICAgICAgICBpcnFfaXRlciA9IFJFQURfT05DRShz
aGFyZWRfZGF0YS0+bnJfaXRlcik7Cj4gPiAgICAgICAgICAgICAgIF9fR1VFU1RfQVNTRVJUKGNv
bmZpZ19pdGVyICsgMSA9PSBpcnFfaXRlciwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJjb25maWdfaXRlciArIDEgPSAweCVseCwgaXJxX2l0ZXIgPSAweCVseC5cbiIKPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICIgIEd1ZXN0IHRpbWVyIGludGVycnVwdCB3YXMg
bm90IHRyaWdnZWQgd2l0aGluIHRoZSBzcGVjaWZpZWRcbiIKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICIgIEd1ZXN0IHRpbWVyIGludGVycnVwdCB3YXMgbm90IHRyaWdnZXJlZCB3
aXRoaW4gdGhlIHNwZWNpZmllZFxuIgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IiAgaW50ZXJ2YWwsIHRyeSB0byBpbmNyZWFzZSB0aGUgZXJyb3IgbWFyZ2luIGJ5IFstZV0gb3B0
aW9uLlxuIiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbmZpZ19pdGVyICsg
MSwgaXJxX2l0ZXIpOwo+ID4gICAgICAgfQo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9yaXNjdi9hcmNoX3RpbWVyLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vcmlzY3YvYXJjaF90aW1lci5jCj4gPiBpbmRleCBlMjI4NDhmNzQ3YzAuLjBmOWNhYmQ5
OWZkNCAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9h
cmNoX3RpbWVyLmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9h
cmNoX3RpbWVyLmMKPiA+IEBAIC02MCw3ICs2MCw3IEBAIHN0YXRpYyB2b2lkIGd1ZXN0X3J1bihz
dHJ1Y3QgdGVzdF92Y3B1X3NoYXJlZF9kYXRhICpzaGFyZWRfZGF0YSkKPiA+ICAgICAgICAgICAg
ICAgaXJxX2l0ZXIgPSBSRUFEX09OQ0Uoc2hhcmVkX2RhdGEtPm5yX2l0ZXIpOwo+ID4gICAgICAg
ICAgICAgICBfX0dVRVNUX0FTU0VSVChjb25maWdfaXRlciArIDEgPT0gaXJxX2l0ZXIsCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY29uZmlnX2l0ZXIgKyAxID0gMHgleCwgaXJx
X2l0ZXIgPSAweCV4LlxuIgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAgR3Vl
c3QgdGltZXIgaW50ZXJydXB0IHdhcyBub3QgdHJpZ2dlZCB3aXRoaW4gdGhlIHNwZWNpZmllZFxu
Igo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIiAgR3Vlc3QgdGltZXIgaW50ZXJy
dXB0IHdhcyBub3QgdHJpZ2dlcmVkIHdpdGhpbiB0aGUgc3BlY2lmaWVkXG4iCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiICBpbnRlcnZhbCwgdHJ5IHRvIGluY3JlYXNlIHRoZSBl
cnJvciBtYXJnaW4gYnkgWy1lXSBvcHRpb24uXG4iLAo+ID4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uZmlnX2l0ZXIgKyAxLCBpcnFfaXRlcik7Cj4gPiAgICAgICB9Cj4gPiAtLQo+
ID4gMi4zOS4yCj4gPgo+Cj4gLS0KPiBUaGFua3MsCj4gT2xpdmVyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
