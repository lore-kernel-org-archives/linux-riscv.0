Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29F1C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 07:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qop1sVVhksvofxAN43mZ1T5tik5qeEUrRr5vOIzai5o=; b=tXbZLwvvUEVK9n
	9BAmEc8EVPXaLVkkIkhlFpeGn7Hqig+Vj141GGujXPsi3pDmL4XUpgkQ/RYFrxidm5jeXcNlUoUeS
	GhwBXpqE8SES1CdbaBcY74lGtHMPFFxyVwD3ADBush0iphOyfo08jgneTHykaW79WVz7S+LZ3Ggt/
	whvf8Abp7vfjhZLmEWYD3arKYf63kIWZMSvPeNRT9o5CIbnVD+zT0yjtNZ/JitOBTG94e2jsEZ+wB
	RBGysUhCr5lGaVnXCsIRS9+ihMqOA975QG6B190Rvjway4Ln8FujSge4/Uz70WJ+JdkR3Pi8eU/UZ
	GsgBqsCD0/1QCff/zImA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV6yc-000b0u-93; Fri, 18 Mar 2022 07:24:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV6yZ-000b0P-KW
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 07:24:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4017661953
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 07:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B90C340FA
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647588280;
 bh=BfoKZy6B91Hiu61I3JtTMYU0kjXTJYatxUR/A7w6QKM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jv4I9aWN18i+RpqiME4Tu16flA6GoS6NLvmm/rNpSUqgBduuIeqZ2+pWXdTdYDwuI
 MMFgDm88yex0Z8yQM2j7KzSgDND1ghEGYNcrMVnJlJn09bXbYqMBTxOgCsgraYwoUO
 FDJI/2gyqslJ4kbaPmHeBXwwMyUnXWnM2+/jZa9TV6ClUSPE+gwvvvcrVkmNU+JO3Z
 JMJbkYS3nWEK6D1Ekc/6TnAa/B8yGusd/JCQLi7xmixU0Mmy7N6PMHmNUrloD+jfmf
 IbkiUGYs02aiK9trOw5xilOKxsf3seeCPa9WDFB6my5qrI2dY3X4bjuEinemMCR1sz
 hOHWkId8ryfxg==
Received: by mail-ua1-f52.google.com with SMTP id a28so2941203uaf.7
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 00:24:40 -0700 (PDT)
X-Gm-Message-State: AOAM533iLXe9mBau2Nt7RALM5TMnFr2FfQHJiuehe1WokcWsXsnYTg7F
 ECScYRz2NwyHt3msWvOYgg4Nnk2diSFMMITxhgc=
X-Google-Smtp-Source: ABdhPJxZF9Z+ZVoAdhpq0HZjK1nqC+y82LR7GvGRglz1nfW3jIhfJECm+nlETFHFF9JTp4BwdsUYrSjxCtoHTQhykoQ=
X-Received: by 2002:ab0:26d9:0:b0:34c:609d:c23 with SMTP id
 b25-20020ab026d9000000b0034c609d0c23mr2889947uap.84.1647588279723; Fri, 18
 Mar 2022 00:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220316232600.20419-1-palmer@rivosinc.com>
 <11364105.8ZH9dyz9j6@diego>
In-Reply-To: <11364105.8ZH9dyz9j6@diego>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 18 Mar 2022 15:24:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS3C_GHvLnrep_V3pz4bUOBMO-Tc5v5BpEt7V1EQxF0jw@mail.gmail.com>
Message-ID: <CAJF2gTS3C_GHvLnrep_V3pz4bUOBMO-Tc5v5BpEt7V1EQxF0jw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Generic Ticket Spinlocks
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, peterz@infradead.org, jonas@southpole.se, 
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com, mingo@redhat.com, 
 Will Deacon <will@kernel.org>, longman@redhat.com, boqun.feng@gmail.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 aou@eecs.berkeley.edu, 
 Arnd Bergmann <arnd@arndb.de>, jszhang@kernel.org, wangkefeng.wang@huawei.com, 
 openrisc@lists.librecores.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_002443_775446_DD8BD2A2 
X-CRM114-Status: GOOD (  29.26  )
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

VGVzdGVkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCk9uIFRodSwgTWFyIDE3LCAy
MDIyIGF0IDg6NTggUE0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4gd3JvdGU6Cj4K
PiBIaSwKPgo+IEFtIERvbm5lcnN0YWcsIDE3LiBNw6RyeiAyMDIyLCAwMDoyNTo1NSBDRVQgc2No
cmllYiBQYWxtZXIgRGFiYmVsdDoKPiA+IFBldGVyIHNlbnQgYW4gUkZDIG91dCBhYm91dCBhIHll
YXIgYWdvCj4gPiA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC9ZSGJCQnVWRk5uSTRramoz
QGhpcmV6LnByb2dyYW1taW5nLmtpY2tzLWFzcy5uZXQvPiwKPiA+IGJ1dCBhZnRlciBhIHNwaXJp
dGVkIGRpc2N1c3Npb24gaXQgbG9va3MgbGlrZSB3ZSBsb3N0IHRyYWNrIG9mIHRoaW5ncy4KPiA+
IElJUkMgdGhlcmUgd2FzIGJyb2FkIGNvbnNlbnN1cyBvbiB0aGlzIGJlaW5nIHRoZSB3YXkgdG8g
Z28sIGJ1dCB0aGVyZQo+ID4gd2FzIGEgbG90IG9mIGRpc2N1c3Npb24gc28gSSB3YXNuJ3Qgc3Vy
ZS4gIEdpdmVuIHRoYXQgaXQncyBiZWVuIGEgeWVhciwKPiA+IEkgZmlndXJlZCBpdCdkIGJlIGJl
c3QgdG8ganVzdCBzZW5kIHRoaXMgb3V0IGFnYWluIGZvcm1hdHRlZCBhIGJpdCBtb3JlCj4gPiBl
eHBsaWNpdGx5IGFzIGEgcGF0Y2guCj4gPgo+ID4gVGhpcyBoYXMgaGFkIGFsbW9zdCBubyB0ZXN0
aW5nIChqdXN0IGEgYnVpbGQgdGVzdCBvbiBSSVNDLVYgZGVmY29uZmlnKSwKPiA+IGJ1dCBJIHdh
bnRlZCB0byBzZW5kIGl0IG91dCBsYXJnZWx5IGFzLWlzIGJlY2F1c2UgSSBkaWRuJ3QgaGF2ZSBh
IFNPQgo+ID4gZnJvbSBQZXRlciBvbiB0aGUgY29kZS4gIEkgaGFkIHNlbnQgYXJvdW5kIHNvbWV0
aGluZyBzb3J0IG9mIHNpbWlsYXIgaW4KPiA+IHNwaXJpdCwgYnV0IHRoaXMgbG9va3MgY29tcGxl
dGVseSByZS13cml0dGVuLiAgSnVzdCB0byBwbGF5IGl0IHNhZmUgSQo+ID4gd2FudGVkIHRvIHNl
bmQgb3V0IGFsbW9zdCBleGFjdGx5IGFzIGl0IHdhcyBwb3N0ZWQuICBJJ2QgcHJvYmFibHkgcmVu
YW1lCj4gPiB0aGlzIHRzcGlubG9jayBhbmQgdHNwaW5sb2NrX3R5cGVzLCBhcyB0aGUgbWlzLW1h
dGNoIGtpbmQgb2YgbWFrZXMgbXkKPiA+IGV5ZXMgZ28gZnVubnksIGJ1dCBJIGRvbid0IHJlYWxs
eSBjYXJlIHRoYXQgbXVjaC4gIEknbGwgYWxzbyBnbyB0aHJvdWdoCj4gPiB0aGUgb3RoZXIgcG9y
dHMgYW5kIHNlZSBpZiB0aGVyZSdzIGFueSBtb3JlIGNhbmRpZGF0ZXMsIEkgc2VlbSB0bwo+ID4g
cmVtZW1iZXIgdGhlcmUgaGF2aW5nIGJlZW4gbW9yZSB0aGFuIGp1c3QgT3BlblJJU0MgYnV0IGl0
J3MgYmVlbiBhCj4gPiB3aGlsZS4KPiA+Cj4gPiBJJ20gaW4gbm8gYmlnIHJ1c2ggZm9yIHRoaXMg
YW5kIGdpdmVuIHRoZSBjb21wbGV4IEhXIGRlcGVuZGVuY2llcyBJCj4gPiB0aGluayBpdCdzIGJl
c3QgdG8gdGFyZ2V0IGl0IGZvciA1LjE5LCB0aGF0J2QgZ2l2ZSB1cyBhIGZ1bGwgbWVyZ2UKPiA+
IHdpbmRvdyBmb3IgZm9sa3MgdG8gdGVzdC9iZW5jaG1hcmsgaXQgb24gdGhlaXIgc3lzdGVtcyB0
byBtYWtlIHN1cmUgaXQncwo+ID4gT0suICBSSVNDLVYgaGFzIGEgZm9yd2FyZCBwcm9ncmVzcyBn
dWFyYW50ZWUgc28gd2Ugc2hvdWxkIGJlIHNhZmUsIGJ1dAo+ID4gdGhlc2UgY2FuIGFsd2F5cyB0
cmlwIHRoaW5ncyB1cC4KPgo+IEkndmUgdGVzdGVkIHRoaXMgb24gYm90aCB0aGUgUWVtdS1WaXJ0
IG1hY2hpbmUgYXMgd2VsbCBhcyB0aGUKPiBBbGx3aW5uZXIgTmV6aGEgYm9hcmQgKHdpdGggYSBE
MSBTb0MpLgo+Cj4gQm90aCBvZiB0aG9zZSBhcmUgb2YgY291cnNlIG5vdCBuZWNlc3NhcmlseSB0
aGUgYmVzdCBwbGF0Zm9ybXMKPiBmb3IgYmVuY2htYXJrcyBJIGd1ZXNzLCBhcyBmcm9tIHdoYXQg
SSBnYXRoZXJlZCBiZWZvcmUgSSdkIG5lZWQKPiBuZWVkIG11bHRpcGxlIGNvcmVzIHRvIGFjdHVh
bGx5IGdldCBpbnRlcmVzdGluZyBtZWFzdXJlbWVudHMgd2hlbgo+IGNvbXBhcmluZyBkaWZmZXJl
bnQgaW1wbGVtZW50YXRpb25zLiBCdXQgYXQgbGVhc3QgZXZlcnl0aGluZyB0aGF0Cj4gd29ya2Vk
IGJlZm9yZSBzdGlsbCB3b3JrcyB3aXRoIHRoaXMgc2VyaWVzIDstKQo+Cj4KPiBTbywgU2VyaWVz
Cj4gVGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+Cj4KPiBIZWlr
bwo+Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtY3NreS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
