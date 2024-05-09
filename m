Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC87C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trKZ2vrh4ksRmEvJ4xT8ylqhlrE0pYhoWjhdbTqnKr4=; b=NCOPOl8Ovlt9T8
	gK3D3l4yiHywfIg4S3ip8o+8epCHBmyAsUqy+YEMTuzzouvAedr/Lz2dn74ydzHv4b1r7Sqxrm9ve
	/lZbqQM3stA2H0HuQ2cyq3B2U+on9t8pRuse17GV4qBGKH5Q2mrsyW/f9DUVRWVj6eTr+jWA+GbsU
	nGecDlwyU/1JpRJF1AZEmfwPny4hOxKLkLSksBUxgWrXerA2xi3db8MYzSVEqu0uPKk6jxgl5igt2
	0E0Zxu6ipUiD9so4IyJvHA1NrTB/A4NAo5RtluZ17tp/9sHy4CP2xRLBWg4FMUBhFRsOFfmvQcx7B
	b1+nD/G4FF0dVWPFN7bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s54ta-00000001kf6-1dTI;
	Thu, 09 May 2024 14:37:18 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s54tR-00000001kax-03fw
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 14:37:15 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-7e1856fda57so7846139f.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 07:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1715265427; x=1715870227; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qhunxhR/OF2icvm3HmEsNbbwCxzb74IsXbKxDT8qkPs=;
        b=MVDoQ8XIzL00VUgZsXI7f5ZroO/H6iFvrilmhTZwXFWNiiYvoWNQuDkbBzuCB83uhv
         KgCQDxi1PLQcj9zul1WUPqr03Hh7RcONiZ1jiMfZP5Wst9ZG5WmDsxdOZk8nTrLDY5tB
         /EHDHsAZbfMOl9OmDC+T1YxYxvfmX4LNNx1Hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715265427; x=1715870227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhunxhR/OF2icvm3HmEsNbbwCxzb74IsXbKxDT8qkPs=;
        b=qXVLKL2wK/NSBOU13BbExH6ryV984MVh4I37AEd+4jo4dSN5mGM6ysajs75X+BBb8U
         XeNjkcLmNYfymOLardR9VWlOvA+2lgdzmFKNtJSae7kHrkjfhy5hytvByEKi6tPSX5cK
         07ORA7FRP8F12hCdkQ1/AM5enchEZniZnhys8h41JOzYQUlED/lvEU7Df1FMGfNCbU69
         8FHiaP42Dchxo8YxlQccJN0pKYuh2YrogZXVmm3QVwwUq0vDjzHEOl+5wbXHpRDbZ30x
         mXkFdgvRBWM4I78jOUWSW5pHCpJa96qdBvmrrgM01G71vujRCfYOF0VHWGyWc++l6LaT
         F1zg==
X-Forwarded-Encrypted: i=1; AJvYcCUWtgcyrKihomA3jCMuSQY79RVqg0w3fW9z9x1+47PglagwOOZLrRu0Tk8fhCiZwlQJcJqNhfaBePPuuspNr1c5OrK5LosIwdh4R9Sujz5o
X-Gm-Message-State: AOJu0Ywr/4+V2PnUKV6jWcln/QoqgnxcFYDVu5UcR6apL+iU0b9VvuBL
	NbFLj3I6FO67Y7F4snD702KVjYtXBxRLDVy2ExbWOuVTCvnjXscmWhJBjdIX5zQ=
X-Google-Smtp-Source: AGHT+IFLPV3hTUAqtiZSXFMZ3nZtJrVA8/PdzJcN3v/yjJF832scb22cGE7mYooNXziODVFLnPMOaA==
X-Received: by 2002:a6b:e618:0:b0:7e1:86e1:cd46 with SMTP id ca18e2360f4ac-7e18fd9a35cmr655432839f.2.1715265426750;
        Thu, 09 May 2024 07:37:06 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4893703c0c8sm386684173.48.2024.05.09.07.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 07:37:06 -0700 (PDT)
Message-ID: <946ae22f-a4af-448a-92e1-60afb6ed9261@linuxfoundation.org>
Date: Thu, 9 May 2024 08:37:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Christian Brauner <brauner@kernel.org>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Andy Lutomirski <luto@amacapital.net>,
 Will Drewry <wad@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Andrew Morton <akpm@linux-foundation.org>, Seth Forshee
 <sforshee@kernel.org>, Bongsu Jeon <bongsu.jeon@samsung.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Matthieu Baerts <matttbe@kernel.org>,
 Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-team@android.com, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-input@vger.kernel.org, iommu@lists.linux.dev, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netdev@vger.kernel.org,
 linux-actions@lists.infradead.org, mptcp@lists.linux.dev,
 linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org, bpf@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240507214254.2787305-1-edliaw@google.com>
 <f4e45604-86b0-4be6-9bea-36edf301df33@linuxfoundation.org>
 <CAG4es9XE2D94BNboRSf607NbJVW7OW4xkVq4jZ8pDZ_AZsb3nQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAG4es9XE2D94BNboRSf607NbJVW7OW4xkVq4jZ8pDZ_AZsb3nQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_073709_187032_8BF5999E 
X-CRM114-Status: GOOD (  18.00  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNS85LzI0IDAwOjEzLCBFZHdhcmQgTGlhdyB3cm90ZToKPiBPbiBXZWQsIE1heSA4LCAyMDI0
IGF0IDQ6MTDigK9QTSBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90
ZToKPj4KPj4gT24gNS83LzI0IDE1OjM4LCBFZHdhcmQgTGlhdyB3cm90ZToKPj4+IDgwOTIxNjIz
MzU1NSAoInNlbGZ0ZXN0cy9oYXJuZXNzOiByZW1vdmUgdXNlIG9mIExJTkVfTUFYIikgaW50cm9k
dWNlZAo+Pj4gYXNwcmludGYgaW50byBrc2VsZnRlc3RfaGFybmVzcy5oLCB3aGljaCBpcyBhIEdO
VSBleHRlbnNpb24gYW5kIG5lZWRzCj4+PiBfR05VX1NPVVJDRSB0byBlaXRoZXIgYmUgZGVmaW5l
ZCBwcmlvciB0byBpbmNsdWRpbmcgaGVhZGVycyBvciB3aXRoIHRoZQo+Pj4gLURfR05VX1NPVVJD
RSBmbGFnIHBhc3NlZCB0byB0aGUgY29tcGlsZXIuCj4+Pgo+Pj4gdjE6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWtzZWxmdGVzdC8yMDI0MDQzMDIzNTA1Ny4xMzUxOTkzLTEtZWRsaWF3
QGdvb2dsZS5jb20vCj4+PiB2MjogYWRkIC1EX0dOVV9TT1VSQ0UgdG8gS0hEUl9JTkNMVURFUyBz
byB0aGF0IGl0IGlzIGluIGEgc2luZ2xlCj4+PiBsb2NhdGlvbi4gIFJlbW92ZSAjZGVmaW5lIF9H
TlVfU09VUkNFIGZyb20gc291cmNlIGNvZGUgdG8gcmVzb2x2ZQo+Pj4gcmVkZWZpbml0aW9uIHdh
cm5pbmdzLgo+Pj4KPj4+IEVkd2FyZCBMaWF3ICg1KToKPj4+ICAgICBzZWxmdGVzdHM6IENvbXBp
bGUga3NlbGZ0ZXN0IGhlYWRlcnMgd2l0aCAtRF9HTlVfU09VUkNFCj4+PiAgICAgc2VsZnRlc3Rz
L3NneDogSW5jbHVkZSBLSERSX0lOQ0xVREVTIGluIE1ha2VmaWxlCj4+Cj4+IEkgYXBwbGVkIHBh
dGNoZXMgMS81IGFuZCAyLjUgLSBUaGUgcmVzdCBuZWVkIHRvIGJlIHNwbGl0IHVwLgo+Pgo+Pj4g
ICAgIHNlbGZ0ZXN0czogSW5jbHVkZSBLSERSX0lOQ0xVREVTIGluIE1ha2VmaWxlCj4+PiAgICAg
c2VsZnRlc3RzOiBEcm9wIGRlZmluZSBfR05VX1NPVVJDRQo+Pj4gICAgIHNlbGZ0ZXN0czogRHJv
cCBkdXBsaWNhdGUgLURfR05VX1NPVVJDRQo+Pj4KPj4KPj4gUGxlYXNlIHNwbGl0IHRoZXNlIHBh
dGNoZXMgcHdlIHRlc3QgZGlyZWN0b3J5LiBPdGhlcndpc2UgaXQgd2lsbAo+PiBjYXVzZSBtZXJn
ZSBjb25mbGljdHMgd2hpY2ggY2FuIGJlIGhhcmQgdG8gcmVzb2x2ZS4KPiAKPiBIaSBTaHVhaCwK
PiBTZWFuIGFza2VkIHRoYXQgSSByZWJhc2UgdGhlIHBhdGNoZXMgb24gbGludXgtbmV4dCwgYW5k
IEkgd2lsbCBuZWVkIHRvCj4gcmVtb3ZlIGFkZGl0aW9uYWwgX0dOVV9TT1VSQ0UgZGVmaW5lcy4g
IFNob3VsZCBJIHNlbmQgYW4gdW5zcGxpdCB2MyB0bwo+IGJlIHJldmlld2VkLCB0aGVuIHNwbGl0
IGl0IGFmdGVyd2FyZHM/ICBJJ20gY29uY2VybmVkIHRoYXQgaXQgd2lsbCBiZQo+IGRpZmZpY3Vs
dCB0byByZXZpZXcgd2l0aCB+NzAgcGF0Y2hlcyBvbmNlIHNwbGl0LgoKUGxlYXNlIHNlbmQgdGhl
bSBzcGxpdCAtIGl0IHdpbGwgYmUgZWFzaWVyIHRvIHJldmlldyBhbmQgYXBwbHkuIFlvdQptaWdo
dCBhcyB3ZWxsIHdhaXQgdW50aWwgdGhlIG1lcmdlIHdpbmRvdyBpcyBkb25lLiBJIGRvbid0IHRo
aW5rCmFueWJvZHkgd291bGQgaGF2ZSB0aW1lIHRvIHJldmlldyBub3cgc2luY2UgbWVyZ2Ugd2lu
ZG93IHN0YXJ0cwpuZXh0IHdlZWsuCgoKdGhhbmtzLAotLSBTaHVhaAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
