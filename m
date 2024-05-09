Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF67C25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 06:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2FWvja0wdkGKh1nmgMaus65XYiGS6sTcHx9eHaJEqQ=; b=ojl3gSNk/oxh4P
	4CZUyTOSWV92xUuFmOGRCq6/WIvuGdiX/1d/Rgjm37EFKLQ0j5MOoC44r3HkCNl11578YjwGWEErQ
	X4O6aYlHVcqVAy0+Lnh2Mly+qscUL1YDoZVjQHyHvljHRk5SMbRbD3brZSFykgU7JBBoEZlmP35eK
	wuc8TEk/46LCqjIamtlDWEMG99ABhHR0wtUN5NqWwK5LtwzuXO9ke6l6hKZ2ptvK/oJ69mKSfrfEI
	Vfd+XzupCZBDCV5V72btmlrx+sdUoo3EybIkU4y/AFHu/jkMGLUbPeYPnI6G05lKtgAWeWIsNpjkp
	sTh7eHeNFr/sKiX7adLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4x38-00000000XTI-46XI;
	Thu, 09 May 2024 06:14:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4x37-00000000XSF-2BVL
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 06:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=72bWBwjQodIuSi8MsUtQvKNvKwdUWjXGREUei480Xwo=; b=SioDYzuIO+GOUeUWHru90XUHSP
	xfPPHI2e7FDGxIDpB7qg8pEcY9fdPcK4JZVnhSe64oz76svSDWR+xQXrglgQeDHcTUhgRvApZoz4t
	+v64sSuAn+oirUo7uSjE1RveNN86hu3vlZeu47tCZsFU7YQH7M4ZlMTS3FJWVn8AABgc4JiRDHC8Z
	ICdyKloLFxp32Z0wCphUiXye+t/C0vP1H9w6XVQpAHopevigCNil8KedWf5AKvz1m1J1L2Gpyfk7N
	pszWOMjt9uX6Zrq5TcfiD0MrPWgiQamjKKDUY6C+7lgbM6TRpHZ+RiDufwf6YlwSvp6GLAHkU3ArQ
	W8cwDA0Q==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4x30-00000002mIi-2jiU
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 06:14:35 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso10540a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 23:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715235259; x=1715840059; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72bWBwjQodIuSi8MsUtQvKNvKwdUWjXGREUei480Xwo=;
        b=tBpX7RlfHqP71+fhvcyM2zQ/zfxSsSEbHeoFMgV9xwfYPFEXui92zRm2hzPiz5OJrQ
         cZ5zN3tdLg2xwKu4tSGqijwPFtqFhwaRRce6Yow6b7Srly/lKcIaKnn81RA/BxnWJM4X
         1lLnhYwmf4o8uV3/7YWlD5romIfBFdq61sZZMZbY+71/ZrqxRogoiykn/RBDyo8oZ66G
         McAw5B5BrHnKscHWKe5AVxHTiYUKY+TXNSFSuf8WVOnItk1/RKexAcrHMz7v6aR4wus4
         ug9PgVfnCrm5tBxb9IBzkGXgB8tm0UYE9v++jsRjguj0r5Hc+SvYc7w68A8DfU9B1IGb
         fiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715235259; x=1715840059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72bWBwjQodIuSi8MsUtQvKNvKwdUWjXGREUei480Xwo=;
        b=b6FyXLHQBAaj/8HHEU7Ccg2oCB75SSgGz6y8l4Swuifwjm+2U4FktmIHtvg7q1RwlT
         zuC/spkBly/DsaQxffkmFdzF3aSbNih1qwNr9GNxRg1x3SXMxXB7W9Jfrhb1BjUW0q3N
         wMlkt+7fz4s0vl5Uzsm5YmcSOKettxrrvLI6s8PUmWDsgiCFNNeRN0Id9ds6gkBqflUC
         Ur1OmS+pVI6a5JVKmeZQwX4jpiliYM8xC7s7UxPTdwh/s/FYAqos33BrIDzPRzYIt9I9
         hqTHuWYJnZ5kutG6uZottrXnx7YscyRKpEZMZ0IF+0AzZk8cY+sJVJq/0iOnRkIx80+k
         5CDg==
X-Forwarded-Encrypted: i=1; AJvYcCU6N+tbesC2xTjX3t+KR2xDxDkArjUZtLsWt+f/M16s8xcz9O9AhUcC4o4j1yMd1jTq9kg+bYsllNlxtp4CZUngQ/5lduHpCBeiNLAFepz0
X-Gm-Message-State: AOJu0Yz4lJ4805lmZd3ULYkzb3VMIgQMZ18ZL1eER3SFb7WPeNywcGgS
	zsqvByzUfiJxTENtZCjIk14Mnu/JCHJbhH/fkfFzmbAwCCMSe2KsCyNPp/xqXCqzwOJOc/mjK9I
	RWe0dogCo1dIH+gAi80GkXOwO5rnWYnmwvm8n
X-Google-Smtp-Source: AGHT+IHsPAG0LEeM4cJXnAxgH06RrdZlxemOxK5bdPXtb66jyshH3jVsPNC7i5pX8kAB1x6smMgaq3eKTmHMEonCtFw=
X-Received: by 2002:a05:6402:5206:b0:572:a23b:1d81 with SMTP id
 4fb4d7f45d1cf-5733b9d3b3emr79412a12.5.1715235258767; Wed, 08 May 2024
 23:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240507214254.2787305-1-edliaw@google.com> <f4e45604-86b0-4be6-9bea-36edf301df33@linuxfoundation.org>
In-Reply-To: <f4e45604-86b0-4be6-9bea-36edf301df33@linuxfoundation.org>
From: Edward Liaw <edliaw@google.com>
Date: Wed, 8 May 2024 23:13:51 -0700
Message-ID: <CAG4es9XE2D94BNboRSf607NbJVW7OW4xkVq4jZ8pDZ_AZsb3nQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Christian Brauner <brauner@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Seth Forshee <sforshee@kernel.org>, Bongsu Jeon <bongsu.jeon@samsung.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Matthieu Baerts <matttbe@kernel.org>, 
	Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-input@vger.kernel.org, iommu@lists.linux.dev, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-actions@lists.infradead.org, mptcp@lists.linux.dev, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_071431_118702_614389B3 
X-CRM114-Status: GOOD (  17.94  )
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

T24gV2VkLCBNYXkgOCwgMjAyNCBhdCA0OjEw4oCvUE0gU2h1YWggS2hhbiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiA1LzcvMjQgMTU6MzgsIEVkd2FyZCBMaWF3IHdy
b3RlOgo+ID4gODA5MjE2MjMzNTU1ICgic2VsZnRlc3RzL2hhcm5lc3M6IHJlbW92ZSB1c2Ugb2Yg
TElORV9NQVgiKSBpbnRyb2R1Y2VkCj4gPiBhc3ByaW50ZiBpbnRvIGtzZWxmdGVzdF9oYXJuZXNz
LmgsIHdoaWNoIGlzIGEgR05VIGV4dGVuc2lvbiBhbmQgbmVlZHMKPiA+IF9HTlVfU09VUkNFIHRv
IGVpdGhlciBiZSBkZWZpbmVkIHByaW9yIHRvIGluY2x1ZGluZyBoZWFkZXJzIG9yIHdpdGggdGhl
Cj4gPiAtRF9HTlVfU09VUkNFIGZsYWcgcGFzc2VkIHRvIHRoZSBjb21waWxlci4KPiA+Cj4gPiB2
MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgta3NlbGZ0ZXN0LzIwMjQwNDMwMjM1MDU3
LjEzNTE5OTMtMS1lZGxpYXdAZ29vZ2xlLmNvbS8KPiA+IHYyOiBhZGQgLURfR05VX1NPVVJDRSB0
byBLSERSX0lOQ0xVREVTIHNvIHRoYXQgaXQgaXMgaW4gYSBzaW5nbGUKPiA+IGxvY2F0aW9uLiAg
UmVtb3ZlICNkZWZpbmUgX0dOVV9TT1VSQ0UgZnJvbSBzb3VyY2UgY29kZSB0byByZXNvbHZlCj4g
PiByZWRlZmluaXRpb24gd2FybmluZ3MuCj4gPgo+ID4gRWR3YXJkIExpYXcgKDUpOgo+ID4gICAg
c2VsZnRlc3RzOiBDb21waWxlIGtzZWxmdGVzdCBoZWFkZXJzIHdpdGggLURfR05VX1NPVVJDRQo+
ID4gICAgc2VsZnRlc3RzL3NneDogSW5jbHVkZSBLSERSX0lOQ0xVREVTIGluIE1ha2VmaWxlCj4K
PiBJIGFwcGxlZCBwYXRjaGVzIDEvNSBhbmQgMi41IC0gVGhlIHJlc3QgbmVlZCB0byBiZSBzcGxp
dCB1cC4KPgo+ID4gICAgc2VsZnRlc3RzOiBJbmNsdWRlIEtIRFJfSU5DTFVERVMgaW4gTWFrZWZp
bGUKPiA+ICAgIHNlbGZ0ZXN0czogRHJvcCBkZWZpbmUgX0dOVV9TT1VSQ0UKPiA+ICAgIHNlbGZ0
ZXN0czogRHJvcCBkdXBsaWNhdGUgLURfR05VX1NPVVJDRQo+ID4KPgo+IFBsZWFzZSBzcGxpdCB0
aGVzZSBwYXRjaGVzIHB3ZSB0ZXN0IGRpcmVjdG9yeS4gT3RoZXJ3aXNlIGl0IHdpbGwKPiBjYXVz
ZSBtZXJnZSBjb25mbGljdHMgd2hpY2ggY2FuIGJlIGhhcmQgdG8gcmVzb2x2ZS4KCkhpIFNodWFo
LApTZWFuIGFza2VkIHRoYXQgSSByZWJhc2UgdGhlIHBhdGNoZXMgb24gbGludXgtbmV4dCwgYW5k
IEkgd2lsbCBuZWVkIHRvCnJlbW92ZSBhZGRpdGlvbmFsIF9HTlVfU09VUkNFIGRlZmluZXMuICBT
aG91bGQgSSBzZW5kIGFuIHVuc3BsaXQgdjMgdG8KYmUgcmV2aWV3ZWQsIHRoZW4gc3BsaXQgaXQg
YWZ0ZXJ3YXJkcz8gIEknbSBjb25jZXJuZWQgdGhhdCBpdCB3aWxsIGJlCmRpZmZpY3VsdCB0byBy
ZXZpZXcgd2l0aCB+NzAgcGF0Y2hlcyBvbmNlIHNwbGl0LgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
