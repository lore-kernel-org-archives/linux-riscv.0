Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F42CCD1A7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 15:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzSeDn4AW1JzUpo01nFBBg0v5wKQmzv67w9VWBnWeks=; b=PQu439Ieb7RbAf
	P+Ek7EGrJKZ+LXdF93xVwhamLR1JqFwp7H6GoB7KQ/3B5/JbN2wORZnbupTBKar5UFcFCroceMhrS
	xIQBB+n42MIil1XiD2IxUU4uoYFG2QJfzEEVaCKsXszUqIFoquIWVcOkfKCfT36wT6X3a8GQIcu3d
	ZLkWQ/VdZSduKfER+dxmUVTXqZpFfSH99G4fxt43g1weeMflQgbDI6GUcWA+xmWelhyTL+bnQZYLp
	mskfQszK72397e6XcysvAhgo3PAnmJS2nH2oWQKojzge7m+Ghd4Digpx0gx1B4JVXOx1peBu3EBC9
	UE3XvXN3zKfhRRu9rxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEHP-0000000HViU-2KYb;
	Tue, 21 Oct 2025 15:28:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBEHO-0000000HVha-0Pb9
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 15:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42A4762507
	for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 15:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDE4C16AAE
	for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761060484;
	bh=WMbjQNf+/6fBiKLcm2bw8S34Kgq52o5ZMkrYeVMZGuE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EEgcQD9nNiMqTaahMMHOpXf0VMNmU9oFR9w/FEBQX4/Lf/RC5KzcwlalCEha2mp3r
	 jAgzaNJvJ3Q8X6ryAUZmTaH9OFTkqdsiOeX66QBad8d4qSLkC/vaca+txZalrYPCKw
	 J5T2I9nwOn2B3psp95RyLJV1QRkjq5+bSgyWu+vykAna0EqDdpAT90hjO4F/NjQ/y9
	 DHW8S4FBGsXOqPW3Rp0aMPm9OktllAvhml5UjjjV4vmfcg4TtBZ7pjguRFQqMLp/I/
	 GYije6Z89PEk4U9DH+hdbaKCljBPmDB0vA+13r2Bx6ODRSw8ZizhR9kwxmC0m3V4cf
	 nSl6Gil0/Ayxg==
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-475c1f433d8so3414865e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Oct 2025 08:28:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqBVfTk1SgE31LKl37Cn4fGtNwO6EGTn6+lsEPoewgfaEnVP3EKza6d+IIr+Yfrf9xkARJMjQ3ev+PKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/G0WhO0XtaQ6FJry5r74eKIlAouDT7B6blmQHHIaz+f8gZxZY
	WRvypttYMQbPsT14puGCc9Gl8AUEpImjsYKEWsm5KER+uPQR/CQh3tZZOLUmNROOg5RfaNe3Gwx
	yz7kKZ+t3qvBHNSIXqrNYnuE7+j2MJTg=
X-Google-Smtp-Source: AGHT+IHRoCdSFqTwXlcQgKf1IBsD/W3re0yM+Mwfei0lXknc2hlfjdQNBmIPRhDMhPEHa/Lq+5tmuCu1/kOCqlcbuEE=
X-Received: by 2002:a05:600c:870e:b0:46e:37a7:48d1 with SMTP id
 5b1f17b1804b1-4711791f94dmr163749325e9.34.1761060483386; Tue, 21 Oct 2025
 08:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251020130801.68356-1-fangyu.yu@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 21 Oct 2025 08:27:50 -0700
X-Gmail-Original-Message-ID: <CAJF2gTRwHJsA7jFvAXbqy-6LyfaVTqfsFXgHfAeOZ8M3JNsikg@mail.gmail.com>
X-Gm-Features: AS18NWAxsjIpybjWNUteC13IenF-VTwNuRsft_RJ2w2vZiotn8Q2h6SsETn4OI4
Message-ID: <CAJF2gTRwHJsA7jFvAXbqy-6LyfaVTqfsFXgHfAeOZ8M3JNsikg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	jiangyifei@huawei.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, jgg@nvidia.com, 
	alex.williamson@redhat.com
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgNjowOOKAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBBcyBvZiBjb21taXQgYWFjNmRiNzVhOWZjICgidmZpby9wY2k6IFVzZSB1bm1h
cF9tYXBwaW5nX3JhbmdlKCkiKSwKPiB2bV9wZ29mZiBtYXkgbm8gbG9uZ2VyIGd1YXJhbnRlZWQg
dG8gaG9sZCB0aGUgUEZOIGZvciBWTV9QRk5NQVAKPiByZWdpb25zLiBVc2luZyB2bWEtPnZtX3Bn
b2ZmIHRvIGRlcml2ZSB0aGUgSFBBIGhlcmUgbWF5IHRoZXJlZm9yZQo+IHByb2R1Y2UgaW5jb3Jy
ZWN0IG1hcHBpbmdzLgo+Cj4gSW5zdGVhZCwgSS9PIG1hcHBpbmdzIGZvciBzdWNoIHJlZ2lvbnMg
Y2FuIGJlIGVzdGFibGlzaGVkIG9uLWRlbWFuZAo+IGR1cmluZyBnLXN0YWdlIHBhZ2UgZmF1bHRz
LCBtYWtpbmcgdGhlIHVwZnJvbnQgaW9yZW1hcCBpbiB0aGlzIHBhdGgKPiBpcyB1bm5lY2Vzc2Fy
eS4KPgo+IEZpeGVzOiA5ZDA1YzFmZWU4MzcgKCJSSVNDLVY6IEtWTTogSW1wbGVtZW50IHN0YWdl
MiBwYWdlIHRhYmxlIHByb2dyYW1taW5nIikKVGhlIEZpeGVzIHRhZyBzaG91bGQgYmUgJ2NvbW1p
dCBhYWM2ZGI3NWE5ZmMgKCJ2ZmlvL3BjaTogVXNlCnVubWFwX21hcHBpbmdfcmFuZ2UoKSIpJy4K
CkEgc3RhYmxlIHRyZWUgbmVjZXNzaXRhdGVzIG1pbmltaXppbmcgdGhlICJGaXhlcyB0YWciIGlu
dGVyZmVyZW5jZS4KCldlIGFsc28gbmVlZCB0bwpDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZp
ZGlhLmNvbT4KQ2M6IEFsZXggV2lsbGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+
CkZvciByZXZpZXcuCgo+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4
LmFsaWJhYmEuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDIwICstLS0tLS0t
LS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTkgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2
L2t2bS9tbXUuYwo+IGluZGV4IDUyNWZiNWEzMzBjMC4uODRjMDRjOGYwODkyIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBA
QCAtMTk3LDggKzE5Nyw3IEBAIGludCBrdm1fYXJjaF9wcmVwYXJlX21lbW9yeV9yZWdpb24oc3Ry
dWN0IGt2bSAqa3ZtLAo+Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogQSBtZW1vcnkgcmVnaW9u
IGNvdWxkIHBvdGVudGlhbGx5IGNvdmVyIG11bHRpcGxlIFZNQXMsIGFuZAo+IC0gICAgICAgICog
YW55IGhvbGVzIGJldHdlZW4gdGhlbSwgc28gaXRlcmF0ZSBvdmVyIGFsbCBvZiB0aGVtIHRvIGZp
bmQKPiAtICAgICAgICAqIG91dCBpZiB3ZSBjYW4gbWFwIGFueSBvZiB0aGVtIHJpZ2h0IG5vdy4K
PiArICAgICAgICAqIGFueSBob2xlcyBiZXR3ZWVuIHRoZW0sIHNvIGl0ZXJhdGUgb3ZlciBhbGwg
b2YgdGhlbS4KPiAgICAgICAgICAqCj4gICAgICAgICAgKiAgICAgKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKwo+ICAgICAgICAgICogKy0tLS0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0tLS0tKyAgICstLS0tLS0tLS0tLS0tLS0tKwo+IEBAIC0yMjksMzIgKzIy
OCwxNSBAQCBpbnQga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2
bSwKPiAgICAgICAgICAgICAgICAgdm1fZW5kID0gbWluKHJlZ19lbmQsIHZtYS0+dm1fZW5kKTsK
Pgo+ICAgICAgICAgICAgICAgICBpZiAodm1hLT52bV9mbGFncyAmIFZNX1BGTk1BUCkgewo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIGdwYV90IGdwYSA9IGJhc2VfZ3BhICsgKHZtX3N0YXJ0IC0g
aHZhKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBwaHlzX2FkZHJfdCBwYTsKPiAtCj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgcGEgPSAocGh5c19hZGRyX3Qpdm1hLT52bV9wZ29mZiA8PCBQ
QUdFX1NISUZUOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBhICs9IHZtX3N0YXJ0IC0gdm1h
LT52bV9zdGFydDsKPiAtCj4gICAgICAgICAgICAgICAgICAgICAgICAgLyogSU8gcmVnaW9uIGRp
cnR5IHBhZ2UgbG9nZ2luZyBub3QgYWxsb3dlZCAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGlmIChuZXctPmZsYWdzICYgS1ZNX01FTV9MT0dfRElSVFlfUEFHRVMpIHsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKPiAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gLQo+
IC0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IGt2bV9yaXNjdl9tbXVfaW9yZW1hcChrdm0s
IGdwYSwgcGEsIHZtX2VuZCAtIHZtX3N0YXJ0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB3cml0YWJsZSwgZmFsc2UpOwo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIGlmIChyZXQpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsKRGVmZXJpbmcgdGhlIGlvcmVtYXAgdG8gdGhlIGctc3RhZ2UgcGFnZSBmYXVsdCBsb29r
cyBnb29kIHRvIG1lLCBhcyBpdApzaW1wbGlmaWVzIHRoZSBpbXBsZW1lbnRhdGlvbiBoZXJlLgoK
QWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPiAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgICAgICAgICBodmEgPSB2bV9lbmQ7Cj4gICAgICAgICB9IHdoaWxlIChodmEg
PCByZWdfZW5kKTsKPgo+IC0gICAgICAgaWYgKGNoYW5nZSA9PSBLVk1fTVJfRkxBR1NfT05MWSkK
PiAtICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gLQo+IC0gICAgICAgaWYgKHJldCkKPiAtICAg
ICAgICAgICAgICAga3ZtX3Jpc2N2X21tdV9pb3VubWFwKGt2bSwgYmFzZV9ncGEsIHNpemUpOwo+
IC0KPiAgb3V0Ogo+ICAgICAgICAgbW1hcF9yZWFkX3VubG9jayhjdXJyZW50LT5tbSk7Cj4gICAg
ICAgICByZXR1cm4gcmV0Owo+IC0tCj4gMi41MC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
